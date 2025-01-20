@interface JavaLangVoid
+ (const)__metadata;
+ (void)initialize;
@end

@implementation JavaLangVoid

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssign(&JavaLangVoid_TYPE_, +[IOSClass voidClass]);
    atomic_store(1u, JavaLangVoid__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100456658;
}

@end