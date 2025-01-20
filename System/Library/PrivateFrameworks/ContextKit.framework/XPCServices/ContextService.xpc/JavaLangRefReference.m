@interface JavaLangRefReference
+ (const)__metadata;
- (BOOL)isEnqueued;
- (JavaLangRefReference)initWithId:(id)a3 withJavaLangRefReferenceQueue:(id)a4;
- (id)get;
- (uint64_t)enqueue;
- (void)__javaClone;
- (void)clear;
- (void)dealloc;
- (void)initReferent;
@end

@implementation JavaLangRefReference

- (JavaLangRefReference)initWithId:(id)a3 withJavaLangRefReferenceQueue:(id)a4
{
  return self;
}

- (void)clear
{
}

- (uint64_t)enqueue
{
  objc_sync_enter(a1);
  unint64_t v2 = atomic_load(a1 + 2);
  if (v2 && (unint64_t v3 = atomic_load(a1 + 3)) == 0)
  {
    v5 = (void *)atomic_load(a1 + 2);
    [v5 enqueueWithJavaLangRefReference:a1];
    atomic_store(0, a1 + 2);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_sync_exit(a1);
  return v4;
}

- (id)get
{
  return +[IOSReference getReferent:self];
}

- (BOOL)isEnqueued
{
  unint64_t v2 = atomic_load((unint64_t *)&self->queueNext_);
  return v2 != 0;
}

- (void)dealloc
{
  [(JavaLangRefReference *)self clear];
  JreReleaseVolatile(&self->queueNext_);
  JreReleaseVolatile(&self->pendingNext_);
  v3.receiver = self;
  v3.super_class = (Class)JavaLangRefReference;
  [(JavaLangRefReference *)&v3 dealloc];
}

- (void)initReferent
{
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangRefReference;
  [(JavaLangRefReference *)&v3 __javaClone];
  JreRetainVolatile(&self->queueNext_);
  JreRetainVolatile(&self->pendingNext_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F5CD0;
}

@end