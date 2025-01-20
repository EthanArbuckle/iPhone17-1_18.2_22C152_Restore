@interface JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject
+ (const)__metadata;
- (BOOL)awaitUntilWithJavaUtilDate:(id)a3;
- (BOOL)awaitWithLong:(int64_t)a3 withJavaUtilConcurrentTimeUnitEnum:(id)a4;
- (BOOL)hasWaiters;
- (BOOL)isOwnedByWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer:(id)a3;
- (JavaUtilArrayList)getWaitingThreads;
- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject)initWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer:(id)a3;
- (int)checkInterruptWhileWaitingWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (int64_t)awaitNanosWithLong:(int64_t)a3;
- (uint64_t)getWaitQueueLength;
- (void)await;
- (void)awaitUninterruptibly;
- (void)dealloc;
- (void)doSignalAllWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (void)doSignalWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3;
- (void)reportInterruptAfterWaitWithInt:(int)a3;
- (void)signal;
- (void)signalAll;
@end

@implementation JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject

- (BOOL)hasWaiters
{
  if (([*(id *)(a1 + 8) isHeldExclusively] & 1) == 0)
  {
    v5 = new_JavaLangIllegalMonitorStateException_init();
    objc_exception_throw(v5);
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  do
  {
    unsigned int v3 = atomic_load((unsigned int *)(v2 + 8));
    BOOL result = v3 == -2;
    if (v3 == -2) {
      break;
    }
    uint64_t v2 = *(void *)(v2 + 40);
  }
  while (v2);
  return result;
}

- (uint64_t)getWaitQueueLength
{
  if (([*(id *)(a1 + 8) isHeldExclusively] & 1) == 0)
  {
    v5 = new_JavaLangIllegalMonitorStateException_init();
    objc_exception_throw(v5);
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  LODWORD(result) = 0;
  do
  {
    unsigned int v4 = atomic_load((unsigned int *)(v2 + 8));
    if (v4 == -2) {
      uint64_t result = (result + 1);
    }
    else {
      uint64_t result = result;
    }
    uint64_t v2 = *(void *)(v2 + 40);
  }
  while (v2);
  return result;
}

- (JavaUtilArrayList)getWaitingThreads
{
  if (([*(id *)(a1 + 8) isHeldExclusively] & 1) == 0)
  {
    v7 = new_JavaLangIllegalMonitorStateException_init();
    objc_exception_throw(v7);
  }
  uint64_t v2 = new_JavaUtilArrayList_init();
  for (uint64_t i = *(void *)(a1 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    unsigned int v4 = atomic_load((unsigned int *)(i + 8));
    if (v4 == -2)
    {
      if (atomic_load((unint64_t *)(i + 32))) {
        -[JavaUtilArrayList addWithId:](v2, "addWithId:");
      }
    }
  }
  return v2;
}

- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject)initWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer:(id)a3
{
  return self;
}

- (void)doSignalWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
}

- (void)doSignalAllWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
}

- (void)signal
{
  if (![(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self->this$0_ isHeldExclusively])
  {
    unsigned int v4 = new_JavaLangIllegalMonitorStateException_init();
    objc_exception_throw(v4);
  }
  firstWaiter = self->firstWaiter_;
  if (firstWaiter)
  {
    sub_1002393D8((uint64_t)self, (void **)&firstWaiter->super.isa);
  }
}

- (void)signalAll
{
  if (![(JavaUtilConcurrentLocksAbstractQueuedSynchronizer *)self->this$0_ isHeldExclusively])
  {
    unsigned int v4 = new_JavaLangIllegalMonitorStateException_init();
    objc_exception_throw(v4);
  }
  firstWaiter = self->firstWaiter_;
  if (firstWaiter)
  {
    sub_100239468((uint64_t)self, (uint64_t)firstWaiter);
  }
}

- (void)awaitUninterruptibly
{
  unsigned int v3 = sub_100239314((uint64_t)self);
  uint64_t v4 = sub_100238810((uint64_t)self->this$0_);
  for (int i = 0; !sub_100238648((uint64_t)self->this$0_, (uint64_t)v3); i |= JavaLangThread_interrupted())
    JavaUtilConcurrentLocksLockSupport_parkWithId_((uint64_t)self);
  if (sub_100237590((unint64_t *)self->this$0_, (atomic_ullong *)v3, v4) & 1) != 0 || (i)
  {
    JavaUtilConcurrentLocksAbstractQueuedSynchronizer_selfInterrupt();
  }
}

- (int)checkInterruptWhileWaitingWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a3
{
  int result = JavaLangThread_interrupted();
  if (result)
  {
    if (sub_10023878C((uint64_t)self->this$0_, (atomic_ullong *)a3)) {
      return -1;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (void)reportInterruptAfterWaitWithInt:(int)a3
{
}

- (void)await
{
  if (JavaLangThread_interrupted())
  {
    v7 = new_JavaLangInterruptedException_init();
    objc_exception_throw(v7);
  }
  unsigned int v3 = (atomic_ullong *)sub_100239314((uint64_t)self);
  uint64_t v4 = sub_100238810((uint64_t)self->this$0_);
  do
  {
    if (sub_100238648((uint64_t)self->this$0_, (uint64_t)v3))
    {
      unsigned int v5 = 0;
      goto LABEL_9;
    }
    JavaUtilConcurrentLocksLockSupport_parkWithId_((uint64_t)self);
  }
  while (!JavaLangThread_interrupted());
  if (sub_10023878C((uint64_t)self->this$0_, v3)) {
    unsigned int v5 = -1;
  }
  else {
    unsigned int v5 = 1;
  }
LABEL_9:
  if (((v5 != -1) & sub_100237590((unint64_t *)self->this$0_, v3, v4)) != 0) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  if (!v3) {
    JreThrowNullPointerException();
  }
  if (v3[5]) {
    sub_1002394E0((char *)self);
  }
  if (v6)
  {
    sub_100239740((id)v6);
  }
}

- (int64_t)awaitNanosWithLong:(int64_t)a3
{
  if (JavaLangThread_interrupted())
  {
    v12 = new_JavaLangInterruptedException_init();
    objc_exception_throw(v12);
  }
  unsigned int v5 = (atomic_ullong *)sub_100239314((uint64_t)self);
  uint64_t v6 = sub_100238810((uint64_t)self->this$0_);
  uint64_t v7 = JavaLangSystem_nanoTime();
  if (sub_100238648((uint64_t)self->this$0_, (uint64_t)v5))
  {
LABEL_8:
    unsigned int v9 = 0;
  }
  else
  {
    while (1)
    {
      if (a3 <= 0)
      {
        sub_10023878C((uint64_t)self->this$0_, v5);
        goto LABEL_8;
      }
      JavaUtilConcurrentLocksLockSupport_parkNanosWithId_withLong_(self, a3);
      if (JavaLangThread_interrupted()) {
        break;
      }
      uint64_t v8 = JavaLangSystem_nanoTime();
      a3 = a3 + v7 - v8;
      uint64_t v7 = v8;
      if (sub_100238648((uint64_t)self->this$0_, (uint64_t)v5))
      {
        unsigned int v9 = 0;
        uint64_t v7 = v8;
        goto LABEL_9;
      }
    }
    if (sub_10023878C((uint64_t)self->this$0_, v5)) {
      unsigned int v9 = -1;
    }
    else {
      unsigned int v9 = 1;
    }
  }
LABEL_9:
  if (((v9 != -1) & sub_100237590((unint64_t *)self->this$0_, v5, v6)) != 0) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  if (!v5) {
    JreThrowNullPointerException();
  }
  if (v5[5]) {
    sub_1002394E0((char *)self);
  }
  if (v10) {
    sub_100239740((id)v10);
  }
  return a3 + v7 - JavaLangSystem_nanoTime();
}

- (BOOL)awaitUntilWithJavaUtilDate:(id)a3
{
  if (!a3)
  {
    v11 = new_JavaLangNullPointerException_init();
    goto LABEL_25;
  }
  id v4 = [a3 getTime];
  if (JavaLangThread_interrupted())
  {
    v11 = new_JavaLangInterruptedException_init();
LABEL_25:
    objc_exception_throw(v11);
  }
  unsigned int v5 = (atomic_ullong *)sub_100239314((uint64_t)self);
  uint64_t v6 = sub_100238810((uint64_t)self->this$0_);
  while (1)
  {
    if (sub_100238648((uint64_t)self->this$0_, (uint64_t)v5))
    {
      unsigned int v7 = 0;
LABEL_11:
      LOBYTE(v8) = 1;
      goto LABEL_13;
    }
    if (JavaLangSystem_currentTimeMillis() > (uint64_t)v4) {
      break;
    }
    JavaUtilConcurrentLocksLockSupport_parkUntilWithId_withLong_((uint64_t)self, (uint64_t)v4);
    if (JavaLangThread_interrupted())
    {
      if (sub_10023878C((uint64_t)self->this$0_, v5)) {
        unsigned int v7 = -1;
      }
      else {
        unsigned int v7 = 1;
      }
      goto LABEL_11;
    }
  }
  unsigned int v7 = 0;
  unsigned int v8 = sub_10023878C((uint64_t)self->this$0_, v5) ^ 1;
LABEL_13:
  if (((v7 != -1) & sub_100237590((unint64_t *)self->this$0_, v5, v6)) != 0) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v5) {
    JreThrowNullPointerException();
  }
  if (v5[5]) {
    sub_1002394E0((char *)self);
  }
  if (v9) {
    sub_100239740((id)v9);
  }
  return v8;
}

- (BOOL)awaitWithLong:(int64_t)a3 withJavaUtilConcurrentTimeUnitEnum:(id)a4
{
  if (!a4)
  {
    v14 = new_JavaLangNullPointerException_init();
    goto LABEL_27;
  }
  unsigned int v5 = (char *)[a4 toNanosWithLong:a3];
  if (JavaLangThread_interrupted())
  {
    v14 = new_JavaLangInterruptedException_init();
LABEL_27:
    objc_exception_throw(v14);
  }
  uint64_t v6 = (atomic_ullong *)sub_100239314((uint64_t)self);
  uint64_t v7 = sub_100238810((uint64_t)self->this$0_);
  uint64_t v8 = JavaLangSystem_nanoTime();
  if (sub_100238648((uint64_t)self->this$0_, (uint64_t)v6))
  {
LABEL_9:
    unsigned int v10 = 0;
  }
  else
  {
    while (1)
    {
      if ((uint64_t)v5 <= 0)
      {
        unsigned int v10 = 0;
        unsigned int v11 = sub_10023878C((uint64_t)self->this$0_, v6) ^ 1;
        goto LABEL_15;
      }
      if ((unint64_t)v5 >= 0x3E8) {
        JavaUtilConcurrentLocksLockSupport_parkNanosWithId_withLong_(self, (uint64_t)v5);
      }
      if (JavaLangThread_interrupted()) {
        break;
      }
      uint64_t v9 = JavaLangSystem_nanoTime();
      unsigned int v5 = &v5[v8 - v9];
      uint64_t v8 = v9;
      if (sub_100238648((uint64_t)self->this$0_, (uint64_t)v6)) {
        goto LABEL_9;
      }
    }
    if (sub_10023878C((uint64_t)self->this$0_, v6)) {
      unsigned int v10 = -1;
    }
    else {
      unsigned int v10 = 1;
    }
  }
  LOBYTE(v11) = 1;
LABEL_15:
  if (((v10 != -1) & sub_100237590((unint64_t *)self->this$0_, v6, v7)) != 0) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v6) {
    JreThrowNullPointerException();
  }
  if (v6[5]) {
    sub_1002394E0((char *)self);
  }
  if (v12) {
    sub_100239740((id)v12);
  }
  return v11;
}

- (BOOL)isOwnedByWithJavaUtilConcurrentLocksAbstractQueuedSynchronizer:(id)a3
{
  return self->this$0_ == a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject;
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer_ConditionObject *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100459C98;
}

@end