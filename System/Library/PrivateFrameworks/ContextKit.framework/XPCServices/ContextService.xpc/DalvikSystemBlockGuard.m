@interface DalvikSystemBlockGuard
+ (const)__metadata;
+ (void)initialize;
+ (void)setThreadPolicyWithDalvikSystemBlockGuard_Policy:(id)a3;
@end

@implementation DalvikSystemBlockGuard

+ (void)setThreadPolicyWithDalvikSystemBlockGuard_Policy:(id)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&DalvikSystemBlockGuard_LAX_POLICY_, [DalvikSystemBlockGuard__1 alloc]);
    v2 = [DalvikSystemBlockGuard__2 alloc];
    JavaLangThreadLocal_init((unint64_t)v2);
    JreStrongAssignAndConsume((id *)&qword_100560E78, v2);
    atomic_store(1u, (unsigned __int8 *)DalvikSystemBlockGuard__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100444A48;
}

@end