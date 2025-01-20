@interface JavaUtilConcurrentLocksAbstractQueuedSynchronizer
+ (BOOL)compareAndSetNextWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a5;
+ (BOOL)compareAndSetWaitStatusWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (BOOL)shouldParkAfterFailedAcquireWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4;
+ (const)__metadata;
+ (void)initialize;
- (BOOL)acquireQueuedWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withInt:(int)a4;
- (BOOL)apparentlyFirstQueuedIsExclusive;
- (BOOL)compareAndSetHeadWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (BOOL)compareAndSetStateWithInt:(int)a3 withInt:(int)a4;
- (BOOL)compareAndSetTailWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4;
- (BOOL)doAcquireNanosWithInt:(int)a3 withLong:(int64_t)a4;
- (BOOL)doAcquireSharedNanosWithInt:(int)a3 withLong:(int64_t)a4;
- (BOOL)findNodeFromTailWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (BOOL)hasContended;
- (BOOL)hasQueuedPredecessors;
- (BOOL)hasQueuedThreads;
- (BOOL)hasWaitersWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3;
- (BOOL)isHeldExclusively;
- (BOOL)isOnSyncQueueWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (BOOL)isQueuedWithJavaLangThread:(id)a3;
- (BOOL)ownsWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3;
- (BOOL)parkAndCheckInterrupt;
- (BOOL)releaseSharedWithInt:(int)a3;
- (BOOL)release__WithInt:(int)a3;
- (BOOL)transferAfterCancelledWaitWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (BOOL)transferForSignalWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (BOOL)tryAcquireNanosWithInt:(int)a3 withLong:(int64_t)a4;
- (BOOL)tryAcquireSharedNanosWithInt:(int)a3 withLong:(int64_t)a4;
- (BOOL)tryAcquireWithInt:(int)a3;
- (BOOL)tryReleaseSharedWithInt:(int)a3;
- (BOOL)tryReleaseWithInt:(int)a3;
- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer)init;
- (NSString)description;
- (id)addWaiterWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (id)enqWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (id)getExclusiveQueuedThreads;
- (id)getFirstQueuedThread;
- (id)getQueuedThreads;
- (id)getSharedQueuedThreads;
- (id)getWaitingThreadsWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3;
- (int)fullyReleaseWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (int)getQueueLength;
- (int)getState;
- (int)getWaitQueueLengthWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3;
- (int)tryAcquireSharedWithInt:(int)a3;
- (unint64_t)fullGetFirstQueuedThread;
- (void)__javaClone;
- (void)acquireInterruptiblyWithInt:(int)a3;
- (void)acquireSharedInterruptiblyWithInt:(int)a3;
- (void)acquireSharedWithInt:(int)a3;
- (void)acquireWithInt:(int)a3;
- (void)cancelAcquireWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (void)dealloc;
- (void)doAcquireInterruptiblyWithInt:(int)a3;
- (void)doAcquireSharedInterruptiblyWithInt:(int)a3;
- (void)doAcquireSharedWithInt:(int)a3;
- (void)setHeadAndPropagateWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withInt:(int)a4;
- (void)setHeadWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (void)setStateWithInt:(int)a3;
- (void)unparkSuccessorWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
@end

@implementation JavaUtilConcurrentLocksAbstractQueuedSynchronizer

- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer)init
{
  return self;
}

- (int)getState
{
  return atomic_load((unsigned int *)&self->state_);
}

- (void)setStateWithInt:(int)a3
{
}

- (BOOL)compareAndSetStateWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (void *)qword_1005610D0;
  if (!qword_1005610D0) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = qword_1005610D8;
  return [v6 compareAndSwapIntWithId:self withLong:v8 withInt:v4 withInt:v7];
}

- (id)enqWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  return sub_100236E88((uint64_t)self, (atomic_ullong *)a3);
}

- (id)addWaiterWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  return sub_100236F90((uint64_t)self, a3);
}

- (void)setHeadWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
}

- (void)unparkSuccessorWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
}

- (void)setHeadAndPropagateWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withInt:(int)a4
{
}

- (void)cancelAcquireWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
}

+ (BOOL)shouldParkAfterFailedAcquireWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4
{
  return sub_100237494((uint64_t)a3, (atomic_ullong *)a4);
}

- (BOOL)parkAndCheckInterrupt
{
  JavaUtilConcurrentLocksLockSupport_parkWithId_((uint64_t)self);
  return JavaLangThread_interrupted();
}

- (BOOL)acquireQueuedWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withInt:(int)a4
{
  return sub_100237590((unint64_t *)self, (atomic_ullong *)a3, *(uint64_t *)&a4);
}

- (void)doAcquireInterruptiblyWithInt:(int)a3
{
}

- (BOOL)doAcquireNanosWithInt:(int)a3 withLong:(int64_t)a4
{
  return sub_1002377BC((unint64_t *)self, *(uint64_t *)&a3, a4);
}

- (void)doAcquireSharedWithInt:(int)a3
{
}

- (void)doAcquireSharedInterruptiblyWithInt:(int)a3
{
}

- (BOOL)doAcquireSharedNanosWithInt:(int)a3 withLong:(int64_t)a4
{
  return sub_100237BE0((unint64_t *)self, *(uint64_t *)&a3, a4);
}

- (BOOL)tryAcquireWithInt:(int)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)tryReleaseWithInt:(int)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (int)tryAcquireSharedWithInt:(int)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)tryReleaseSharedWithInt:(int)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)isHeldExclusively
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)acquireWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!-[JavaUtilConcurrentLocksAbstractQueuedSynchronizer tryAcquireWithInt:](self, "tryAcquireWithInt:"))
  {
    if ((atomic_load_explicit(JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    v5 = sub_100236F90((uint64_t)self, (void *)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_EXCLUSIVE_);
    }
    if (sub_100237590((unint64_t *)self, (atomic_ullong *)v5, v3))
    {
      JavaUtilConcurrentLocksAbstractQueuedSynchronizer_selfInterrupt();
    }
  }
}

- (void)acquireInterruptiblyWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (JavaLangThread_interrupted())
  {
    v5 = new_JavaLangInterruptedException_init();
    objc_exception_throw(v5);
  }
  if (![(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self tryAcquireWithInt:v3])
  {
    sub_10023768C((unint64_t *)self, v3);
  }
}

- (BOOL)tryAcquireNanosWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (JavaLangThread_interrupted())
  {
    uint64_t v8 = new_JavaLangInterruptedException_init();
    objc_exception_throw(v8);
  }
  if ([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self tryAcquireWithInt:v5]) {
    return 1;
  }
  return sub_1002377BC((unint64_t *)self, v5, a4);
}

- (BOOL)release__WithInt:(int)a3
{
  return sub_100237F84((unint64_t *)self, *(uint64_t *)&a3);
}

- (void)acquireSharedWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[JavaUtilConcurrentLocksAbstractQueuedSynchronizer tryAcquireSharedWithInt:](self, "tryAcquireSharedWithInt:") < 0)
  {
    sub_100237958((unint64_t *)self, v3);
  }
}

- (void)acquireSharedInterruptiblyWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (JavaLangThread_interrupted())
  {
    uint64_t v5 = new_JavaLangInterruptedException_init();
    objc_exception_throw(v5);
  }
  if ([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self tryAcquireSharedWithInt:v3] < 0)
  {
    sub_100237A9C((unint64_t *)self, v3);
  }
}

- (BOOL)tryAcquireSharedNanosWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (JavaLangThread_interrupted())
  {
    uint64_t v8 = new_JavaLangInterruptedException_init();
    objc_exception_throw(v8);
  }
  if (([(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self tryAcquireSharedWithInt:v5] & 0x80000000) == 0)return 1; {
  return sub_100237BE0((unint64_t *)self, v5, a4);
  }
}

- (BOOL)releaseSharedWithInt:(int)a3
{
  BOOL v4 = [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self tryReleaseSharedWithInt:*(void *)&a3];
  if (v4) {
    sub_100237178((unint64_t *)self);
  }
  return v4;
}

- (BOOL)hasQueuedThreads
{
  unint64_t v2 = atomic_load((unint64_t *)&self->head_);
  unint64_t v3 = atomic_load((unint64_t *)&self->tail_);
  return v2 != v3;
}

- (BOOL)hasContended
{
  unint64_t v2 = atomic_load((unint64_t *)&self->head_);
  return v2 != 0;
}

- (id)getFirstQueuedThread
{
  unint64_t v2 = atomic_load((unint64_t *)&self->head_);
  unint64_t v3 = atomic_load((unint64_t *)&self->tail_);
  if (v2 == v3) {
    return 0;
  }
  else {
    return (id)-[JavaUtilConcurrentLocksAbstractQueuedSynchronizer fullGetFirstQueuedThread]_0((uint64_t)self);
  }
}

- (unint64_t)fullGetFirstQueuedThread
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 16));
  if (!v1
    || (unint64_t v2 = atomic_load((unint64_t *)(v1 + 24))) == 0
    || (v3 = atomic_load((unint64_t *)(v2 + 16)), unint64_t v4 = atomic_load((unint64_t *)(a1 + 16)), v3 != v4)
    || (unint64_t v5 = atomic_load((unint64_t *)(v2 + 32))) == 0)
  {
    unint64_t v6 = atomic_load((unint64_t *)(a1 + 16));
    if (!v6
      || (unint64_t v7 = atomic_load((unint64_t *)(v6 + 24))) == 0
      || (unint64_t v8 = atomic_load((unint64_t *)(v7 + 16)), v9 = atomic_load((unint64_t *)(a1 + 16)), v8 != v9)
      || (unint64_t v5 = atomic_load((unint64_t *)(v7 + 32))) == 0)
    {
      unint64_t v10 = atomic_load((unint64_t *)(a1 + 24));
      if (v10)
      {
        unint64_t v5 = 0;
        do
        {
          unint64_t v11 = atomic_load((unint64_t *)(a1 + 16));
          if (v10 == v11) {
            break;
          }
          unint64_t v12 = atomic_load((unint64_t *)(v10 + 32));
          if (v12) {
            unint64_t v5 = v12;
          }
          unint64_t v10 = atomic_load((unint64_t *)(v10 + 16));
        }
        while (v10);
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (BOOL)isQueuedWithJavaLangThread:(id)a3
{
  if (!a3)
  {
    unint64_t v6 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v6);
  }
  unint64_t v3 = atomic_load((unint64_t *)&self->tail_);
  if (!v3) {
    return 0;
  }
  do
  {
    id v4 = (id)atomic_load((unint64_t *)(v3 + 32));
    BOOL result = v4 == a3;
    if (v4 == a3) {
      break;
    }
    unint64_t v3 = atomic_load((unint64_t *)(v3 + 16));
  }
  while (v3);
  return result;
}

- (BOOL)apparentlyFirstQueuedIsExclusive
{
  unint64_t v2 = atomic_load((unint64_t *)&self->head_);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = atomic_load((unint64_t *)(v2 + 24));
  if (!v3 || *(void *)(v3 + 40) == JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_SHARED_) {
    return 0;
  }
  unint64_t v4 = atomic_load((unint64_t *)(v3 + 32));
  return v4 != 0;
}

- (BOOL)hasQueuedPredecessors
{
  unint64_t v2 = atomic_load((unint64_t *)&self->tail_);
  unint64_t v3 = atomic_load((unint64_t *)&self->head_);
  if (v3 == v2) {
    return 0;
  }
  if (!v3) {
    JreThrowNullPointerException();
  }
  unint64_t v4 = atomic_load((unint64_t *)(v3 + 24));
  if (!v4) {
    return 1;
  }
  unint64_t v5 = (JavaLangThread *)atomic_load((unint64_t *)(v4 + 32));
  return JavaLangThread_currentThread() != v5;
}

- (int)getQueueLength
{
  unint64_t v2 = atomic_load((unint64_t *)&self->tail_);
  if (!v2) {
    return 0;
  }
  int result = 0;
  do
  {
    if (atomic_load((unint64_t *)(v2 + 32))) {
      ++result;
    }
    unint64_t v2 = atomic_load((unint64_t *)(v2 + 16));
  }
  while (v2);
  return result;
}

- (id)getQueuedThreads
{
  unint64_t v3 = new_JavaUtilArrayList_init();
  for (i = (unint64_t *)&self->tail_; ; i = (unint64_t *)(v5 + 16))
  {
    unint64_t v5 = atomic_load(i);
    if (!v5) {
      break;
    }
    if (atomic_load((unint64_t *)(v5 + 32))) {
      -[JavaUtilArrayList addWithId:](v3, "addWithId:");
    }
  }
  return v3;
}

- (id)getExclusiveQueuedThreads
{
  unint64_t v3 = new_JavaUtilArrayList_init();
  for (i = (unint64_t *)atomic_load((unint64_t *)&self->tail_); i; i = (unint64_t *)atomic_load(i + 2))
  {
    if (i[5] != JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_SHARED_)
    {
      if (atomic_load(i + 4)) {
        -[JavaUtilArrayList addWithId:](v3, "addWithId:");
      }
    }
  }
  return v3;
}

- (id)getSharedQueuedThreads
{
  unint64_t v3 = new_JavaUtilArrayList_init();
  for (i = (unint64_t *)atomic_load((unint64_t *)&self->tail_); i; i = (unint64_t *)atomic_load(i + 2))
  {
    if (i[5] == JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_SHARED_)
    {
      if (atomic_load(i + 4)) {
        -[JavaUtilArrayList addWithId:](v3, "addWithId:");
      }
    }
  }
  return v3;
}

- (NSString)description
{
  atomic_load((unsigned int *)&self->state_);
  atomic_load((unint64_t *)&self->head_);
  atomic_load((unint64_t *)&self->tail_);
  v11.receiver = self;
  v11.super_class = (Class)JavaUtilConcurrentLocksAbstractQueuedSynchronizer;
  unint64_t v2 = [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)&v11 description];
  return (NSString *)JreStrcat("$$I$$$", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (BOOL)isOnSyncQueueWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  return sub_100238648((uint64_t)self, (uint64_t)a3);
}

- (BOOL)findNodeFromTailWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  for (i = (unint64_t *)&self->tail_; ; i = (unint64_t *)(v4 + 16))
  {
    uint64_t v4 = (char *)atomic_load(i);
    BOOL result = v4 == a3;
    if (!v4 || v4 == a3) {
      break;
    }
  }
  return result;
}

- (BOOL)transferForSignalWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  return sub_1002386FC((uint64_t)self, (uint64_t)a3);
}

- (BOOL)transferAfterCancelledWaitWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  return sub_10023878C((uint64_t)self, (atomic_ullong *)a3);
}

- (int)fullyReleaseWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  return sub_100238810((uint64_t)self);
}

- (BOOL)ownsWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3
{
  return sub_1002388A0((uint64_t)self, (uint64_t)a3);
}

- (BOOL)hasWaitersWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3
{
  if (!sub_1002388A0((uint64_t)self, (uint64_t)a3))
  {
    uint64_t v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Not owner");
    objc_exception_throw(v5);
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  return -[JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject hasWaiters]_0((uint64_t)a3);
}

- (int)getWaitQueueLengthWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3
{
  if (!sub_1002388A0((uint64_t)self, (uint64_t)a3))
  {
    uint64_t v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Not owner");
    objc_exception_throw(v5);
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  return -[JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject getWaitQueueLength]_0((uint64_t)a3);
}

- (id)getWaitingThreadsWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject:(id)a3
{
  if (!sub_1002388A0((uint64_t)self, (uint64_t)a3))
  {
    uint64_t v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Not owner");
    objc_exception_throw(v5);
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  return -[JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject getWaitingThreads]_0((uint64_t)a3);
}

- (BOOL)compareAndSetHeadWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  uint64_t v5 = (void *)qword_1005610D0;
  if (!qword_1005610D0) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = qword_1005610E0;
  return [v5 compareAndSwapObjectWithId:self withLong:v6 withId:0 withId:a3];
}

- (BOOL)compareAndSetTailWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4
{
  uint64_t v6 = (void *)qword_1005610D0;
  if (!qword_1005610D0) {
    JreThrowNullPointerException();
  }
  uint64_t v8 = qword_1005610E8;
  return [v6 compareAndSwapObjectWithId:self withLong:v8 withId:a3 withId:a4];
}

+ (BOOL)compareAndSetWaitStatusWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_100238BC8((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

+ (BOOL)compareAndSetNextWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a5
{
  return sub_100238C5C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)dealloc
{
  JreReleaseVolatile(&self->head_);
  JreReleaseVolatile(&self->tail_);
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentLocksAbstractQueuedSynchronizer;
  [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentLocksAbstractQueuedSynchronizer;
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)&v3 __javaClone];
  JreRetainVolatile(&self->head_);
  JreRetainVolatile(&self->tail_);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    Unsafe = (void *)SunMiscUnsafe_getUnsafe();
    JreStrongAssign((id *)&qword_1005610D0, Unsafe);
    if (!qword_1005610D0) {
      JreThrowNullPointerException();
    }
    qword_1005610D8 = (uint64_t)objc_msgSend((id)qword_1005610D0, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_class_(), "getDeclaredField:", @"state"));
    qword_1005610E0 = (uint64_t)objc_msgSend((id)qword_1005610D0, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_class_(), "getDeclaredField:", @"head"));
    qword_1005610E8 = (uint64_t)objc_msgSend((id)qword_1005610D0, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_class_(), "getDeclaredField:", @"tail"));
    qword_1005610F0 = (uint64_t)objc_msgSend((id)qword_1005610D0, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_class_(), "getDeclaredField:", @"waitStatus"));
    qword_1005610F8 = (uint64_t)objc_msgSend((id)qword_1005610D0, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_class_(), "getDeclaredField:", @"next"));
    atomic_store(1u, (unsigned __int8 *)JavaUtilConcurrentLocksAbstractQueuedSynchronizer__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100459370;
}

@end