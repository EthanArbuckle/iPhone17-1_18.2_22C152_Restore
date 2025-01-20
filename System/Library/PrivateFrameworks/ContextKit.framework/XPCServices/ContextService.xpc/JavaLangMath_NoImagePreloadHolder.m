@interface JavaLangMath_NoImagePreloadHolder
+ (const)__metadata;
+ (void)initialize;
@end

@implementation JavaLangMath_NoImagePreloadHolder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilRandom_init();
    JreStrongAssignAndConsume((id *)&qword_100560D40, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangMath_NoImagePreloadHolder__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100433F98;
}

@end