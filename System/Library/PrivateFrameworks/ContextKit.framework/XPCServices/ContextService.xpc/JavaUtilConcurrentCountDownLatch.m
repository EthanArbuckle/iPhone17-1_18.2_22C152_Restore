@interface JavaUtilConcurrentCountDownLatch
+ (const)__metadata;
- (BOOL)awaitWithLong:(int64_t)a3 withJavaUtilConcurrentTimeUnitEnum:(id)a4;
- (JavaUtilConcurrentCountDownLatch)initWithInt:(int)a3;
- (id)description;
- (int64_t)getCount;
- (void)await;
- (void)countDown;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentCountDownLatch

- (JavaUtilConcurrentCountDownLatch)initWithInt:(int)a3
{
  return self;
}

- (void)await
{
  sync = self->sync_;
  if (!sync) {
    JreThrowNullPointerException();
  }
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)sync acquireSharedInterruptiblyWithInt:1];
}

- (BOOL)awaitWithLong:(int64_t)a3 withJavaUtilConcurrentTimeUnitEnum:(id)a4
{
  sync = self->sync_;
  if (!sync || !a4) {
    JreThrowNullPointerException();
  }
  id v5 = [a4 toNanosWithLong:a3];
  return [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)sync tryAcquireSharedNanosWithInt:1 withLong:v5];
}

- (void)countDown
{
  sync = self->sync_;
  if (!sync) {
    JreThrowNullPointerException();
  }
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)sync releaseSharedWithInt:1];
}

- (int64_t)getCount
{
  sync = self->sync_;
  if (!sync) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentCountDownLatch_Sync *)sync getCount];
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)JavaUtilConcurrentCountDownLatch;
  id v3 = [(JavaUtilConcurrentCountDownLatch *)&v13 description];
  sync = self->sync_;
  if (!sync) {
    JreThrowNullPointerException();
  }
  [(JavaUtilConcurrentCountDownLatch_Sync *)sync getCount];
  return (id)JreStrcat("$$IC", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCountDownLatch;
  [(JavaUtilConcurrentCountDownLatch *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FB578;
}

@end