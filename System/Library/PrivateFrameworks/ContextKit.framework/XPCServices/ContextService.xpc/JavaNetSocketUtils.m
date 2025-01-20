@interface JavaNetSocketUtils
+ (const)__metadata;
+ (void)setCreatedWithJavaNetSocket:(id)a3;
@end

@implementation JavaNetSocketUtils

+ (void)setCreatedWithJavaNetSocket:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  atomic_store(1u, (unsigned __int8 *)a3 + 16);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100487F10;
}

@end