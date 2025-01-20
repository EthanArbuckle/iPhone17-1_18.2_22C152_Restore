@interface JavaUtilConcurrentLocksLockSupport
+ (const)__metadata;
+ (id)getBlockerWithJavaLangThread:(id)a3;
+ (void)initialize;
+ (void)parkNanosWithId:(id)a3 withLong:(int64_t)a4;
+ (void)parkNanosWithLong:(int64_t)a3;
+ (void)parkUntilWithId:(id)a3 withLong:(int64_t)a4;
+ (void)parkUntilWithLong:(int64_t)a3;
+ (void)parkWithId:(id)a3;
+ (void)setBlockerWithJavaLangThread:(id)a3 withId:(id)a4;
+ (void)unparkWithJavaLangThread:(id)a3;
@end

@implementation JavaUtilConcurrentLocksLockSupport

+ (void)setBlockerWithJavaLangThread:(id)a3 withId:(id)a4
{
}

+ (void)unparkWithJavaLangThread:(id)a3
{
}

+ (void)parkWithId:(id)a3
{
}

+ (void)parkNanosWithId:(id)a3 withLong:(int64_t)a4
{
}

+ (void)parkUntilWithId:(id)a3 withLong:(int64_t)a4
{
}

+ (id)getBlockerWithJavaLangThread:(id)a3
{
  return JavaUtilConcurrentLocksLockSupport_getBlockerWithJavaLangThread_((uint64_t)a3);
}

+ (void)parkNanosWithLong:(int64_t)a3
{
}

+ (void)parkUntilWithLong:(int64_t)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    Unsafe = (void *)SunMiscUnsafe_getUnsafe();
    JreStrongAssign((id *)&qword_100560928, Unsafe);
    if (!qword_100560928) {
      JreThrowNullPointerException();
    }
    qword_100560930 = (uint64_t)objc_msgSend((id)qword_100560928, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)JavaLangThread_class_(), "getDeclaredField:", @"parkBlocker"));
    atomic_store(1u, (unsigned __int8 *)JavaUtilConcurrentLocksLockSupport__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100402308;
}

@end