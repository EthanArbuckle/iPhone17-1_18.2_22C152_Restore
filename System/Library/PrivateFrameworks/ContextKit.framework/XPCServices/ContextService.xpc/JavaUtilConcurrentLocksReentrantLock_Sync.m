@interface JavaUtilConcurrentLocksReentrantLock_Sync
+ (const)__metadata;
- (BOOL)isHeldExclusively;
- (BOOL)isLocked;
- (BOOL)nonfairTryAcquireWithInt:(int)a3;
- (BOOL)tryReleaseWithInt:(int)a3;
- (JavaUtilConcurrentLocksReentrantLock_Sync)init;
- (id)getOwner;
- (id)newCondition;
- (int)getHoldCount;
- (void)lock;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
@end

@implementation JavaUtilConcurrentLocksReentrantLock_Sync

- (void)lock
{
}

- (BOOL)nonfairTryAcquireWithInt:(int)a3
{
  return sub_10024BE80(self, *(uint64_t *)&a3);
}

- (BOOL)tryReleaseWithInt:(int)a3
{
  unsigned int v5 = [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState];
  v6 = JavaLangThread_currentThread();
  if (v6 != [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self getExclusiveOwnerThread])
  {
    v8 = new_JavaLangIllegalMonitorStateException_init();
    objc_exception_throw(v8);
  }
  if (v5 == a3) {
    [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self setExclusiveOwnerThreadWithJavaLangThread:0];
  }
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self setStateWithInt:v5 - a3];
  return v5 == a3;
}

- (BOOL)isHeldExclusively
{
  v2 = [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self getExclusiveOwnerThread];
  return v2 == JavaLangThread_currentThread();
}

- (id)newCondition
{
  v2 = new_JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject_initWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_(self);
  return v2;
}

- (id)getOwner
{
  if (![(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState]) {
    return 0;
  }
  return [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self getExclusiveOwnerThread];
}

- (int)getHoldCount
{
  v3 = [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self getExclusiveOwnerThread];
  if (v3 != JavaLangThread_currentThread()) {
    return 0;
  }
  return [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState];
}

- (BOOL)isLocked
{
  return [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState] != 0;
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self setStateWithInt:0];
}

- (JavaUtilConcurrentLocksReentrantLock_Sync)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004622A8;
}

@end