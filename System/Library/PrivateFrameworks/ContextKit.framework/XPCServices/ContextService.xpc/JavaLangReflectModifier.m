@interface JavaLangReflectModifier
+ (BOOL)isAbstractWithInt:(int)a3;
+ (BOOL)isFinalWithInt:(int)a3;
+ (BOOL)isInterfaceWithInt:(int)a3;
+ (BOOL)isNativeWithInt:(int)a3;
+ (BOOL)isPrivateWithInt:(int)a3;
+ (BOOL)isProtectedWithInt:(int)a3;
+ (BOOL)isPublicWithInt:(int)a3;
+ (BOOL)isStaticWithInt:(int)a3;
+ (BOOL)isStrictWithInt:(int)a3;
+ (BOOL)isSynchronizedWithInt:(int)a3;
+ (BOOL)isTransientWithInt:(int)a3;
+ (BOOL)isVolatileWithInt:(int)a3;
+ (const)__metadata;
+ (id)toStringWithInt:(int)a3;
+ (int)classModifiers;
+ (int)constructorModifiers;
+ (int)fieldModifiers;
+ (int)interfaceModifiers;
+ (int)methodModifiers;
@end

@implementation JavaLangReflectModifier

+ (int)classModifiers
{
  return 3103;
}

+ (int)constructorModifiers
{
  return 7;
}

+ (int)fieldModifiers
{
  return 223;
}

+ (int)interfaceModifiers
{
  return 3087;
}

+ (int)methodModifiers
{
  return 3391;
}

+ (BOOL)isAbstractWithInt:(int)a3
{
  return (a3 >> 10) & 1;
}

+ (BOOL)isFinalWithInt:(int)a3
{
  return (a3 >> 4) & 1;
}

+ (BOOL)isInterfaceWithInt:(int)a3
{
  return (a3 >> 9) & 1;
}

+ (BOOL)isNativeWithInt:(int)a3
{
  return (a3 >> 8) & 1;
}

+ (BOOL)isPrivateWithInt:(int)a3
{
  return (a3 >> 1) & 1;
}

+ (BOOL)isProtectedWithInt:(int)a3
{
  return (a3 >> 2) & 1;
}

+ (BOOL)isPublicWithInt:(int)a3
{
  return a3 & 1;
}

+ (BOOL)isStaticWithInt:(int)a3
{
  return (a3 >> 3) & 1;
}

+ (BOOL)isStrictWithInt:(int)a3
{
  return (a3 >> 11) & 1;
}

+ (BOOL)isSynchronizedWithInt:(int)a3
{
  return (a3 >> 5) & 1;
}

+ (BOOL)isTransientWithInt:(int)a3
{
  return (a3 >> 7) & 1;
}

+ (BOOL)isVolatileWithInt:(int)a3
{
  return (a3 >> 6) & 1;
}

+ (id)toStringWithInt:(int)a3
{
  return (id)JavaLangReflectModifier_toStringWithInt_(a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044D8A8;
}

@end