@interface JavaUtilConcurrentLocksReentrantLock_NonfairSync
+ (const)__metadata;
- (BOOL)tryAcquireWithInt:(int)a3;
- (JavaUtilConcurrentLocksReentrantLock_NonfairSync)init;
- (void)lock;
@end

@implementation JavaUtilConcurrentLocksReentrantLock_NonfairSync

- (void)lock
{
  if ([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self compareAndSetStateWithInt:0 withInt:1])
  {
    v3 = JavaLangThread_currentThread();
    [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)self setExclusiveOwnerThreadWithJavaLangThread:v3];
  }
  else
  {
    [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self acquireWithInt:1];
  }
}

- (BOOL)tryAcquireWithInt:(int)a3
{
  return sub_10024BE80(self, *(uint64_t *)&a3);
}

- (JavaUtilConcurrentLocksReentrantLock_NonfairSync)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004623E0;
}

@end