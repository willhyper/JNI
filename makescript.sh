#!/bin/sh

#1. write a HelloWorld.java
#2. javac HelloWorld.java (to get HelloWorld.class)
#3. javah -jni HelloWorld (from HelloWorld.class to get HelloWorld.h). Note if .h exists, javah will NOT overwrite. rm it first.
#4. write HelloWorld.cpp
#5. gcc -x c -I/System/Library/Frameworks/JavaVM.framework/Headers -c HelloWorld.cpp -o HelloWorld.o
#6. gcc -dynamiclib -o libHelloWorld.jnilib HelloWorld.o
#7. (above two to use gcc from HelloWorld.cpp to .o to libHelloWorld.jnilib)
#8. java HelloWorld (this executes .class which calls .jnilib )

clear

rm HelloWorld.h
rm HelloWorld.o
rm libHelloWorld.jnilib

javac HelloWorld.java

rm HelloWorld.h
javah -jni HelloWorld

gcc -x c -I/System/Library/Frameworks/JavaVM.framework/Headers -c HelloWorld.cpp -o HelloWorld.o
gcc -dynamiclib -o libHelloWorld.jnilib HelloWorld.o

rm HelloWorld.o
rm HelloWorld.h

java HelloWorld


