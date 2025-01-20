@interface JavaUtilConcurrentCountDownLatch_Sync
+ (const)__metadata;
- (BOOL)tryReleaseSharedWithInt:(int)a3;
- (JavaUtilConcurrentCountDownLatch_Sync)initWithInt:(int)a3;
- (int)tryAcquireSharedWithInt:(int)a3;
@end

@implementation JavaUtilConcurrentCountDownLatch_Sync

- (JavaUtilConcurrentCountDownLatch_Sync)initWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  JavaUtilConcurrentLocksAbstractQueuedSynchronizer_init(self, a2);
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self setStateWithInt:v3];
  return self;
}

- (int)tryAcquireSharedWithInt:(int)a3
{
  if ([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState]) {
    return -1;
  }
  else {
    return 1;
  }
}

- (BOOL)tryReleaseSharedWithInt:(int)a3
{
  while (1)
  {
    uint64_t v4 = [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self getState];
    if (!v4) {
      break;
    }
    uint64_t v5 = (v4 - 1);
    if ([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self compareAndSetStateWithInt:v4 withInt:v5])
    {
      LOBYTE(v4) = v5 == 0;
      return v4;
    }
  }
  return v4;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FB6E0;
}

@end