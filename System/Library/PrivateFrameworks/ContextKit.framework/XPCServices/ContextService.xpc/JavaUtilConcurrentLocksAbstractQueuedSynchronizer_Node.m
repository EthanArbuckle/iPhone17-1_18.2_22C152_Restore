@interface JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isShared;
- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node)initWithJavaLangThread:(id)a3 withInt:(int)a4;
- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node)initWithJavaLangThread:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node

- (BOOL)isShared
{
  return self->nextWaiter_ == (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node *)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_SHARED_;
}

- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node)initWithJavaLangThread:(id)a3 withJavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node:(id)a4
{
  return self;
}

- (JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node)initWithJavaLangThread:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)dealloc
{
  JreReleaseVolatile(&self->prev_);
  JreReleaseVolatile(&self->next_);
  JreReleaseVolatile(&self->thread_);

  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node;
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node;
  [(JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node *)&v3 __javaClone];
  JreRetainVolatile(&self->prev_);
  JreRetainVolatile(&self->next_);
  JreRetainVolatile(&self->thread_);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_SHARED_, [JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node alloc]);
    JreStrongAssign((id *)&JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node_EXCLUSIVE_, 0);
    atomic_store(1u, (unsigned __int8 *)JavaUtilConcurrentLocksAbstractQueuedSynchronizer_Node__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100459758;
}

@end