@interface JavaUtilConcurrentLocksReentrantLock_FairSync
+ (const)__metadata;
- (BOOL)tryAcquireWithInt:(int)a3;
- (JavaUtilConcurrentLocksReentrantLock_FairSync)init;
- (void)lock;
@end

@implementation JavaUtilConcurrentLocksReentrantLock_FairSync

- (void)lock
{
}

- (BOOL)tryAcquireWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = JavaLangThread_currentThread();
  unsigned int v6 = [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState];
  if (v6)
  {
    unsigned int v7 = v6;
    if (v5 == [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self getExclusiveOwnerThread])
    {
      if ((int)(v7 + v3) < 0)
      {
        v10 = new_JavaLangError_initWithNSString_(@"Maximum lock count exceeded");
        objc_exception_throw(v10);
      }
      [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self setStateWithInt:v7 + v3];
      return 1;
    }
    return 0;
  }
  if ([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self hasQueuedPredecessors]) {
    return 0;
  }
  unsigned int v9 = [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self compareAndSetStateWithInt:0 withInt:v3];
  BOOL result = 0;
  if (!v9) {
    return result;
  }
  [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self setExclusiveOwnerThreadWithJavaLangThread:v5];
  return 1;
}

- (JavaUtilConcurrentLocksReentrantLock_FairSync)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100462518;
}

@end