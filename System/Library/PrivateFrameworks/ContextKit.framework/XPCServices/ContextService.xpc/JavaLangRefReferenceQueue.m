@interface JavaLangRefReferenceQueue
+ (void)addWithJavaLangRefReference:(id)a3;
+ (void)initialize;
- (JavaLangRefReferenceQueue)init;
- (id)poll;
- (id)remove;
- (id)removeWithLong:(int64_t)a3;
- (void)dealloc;
- (void)enqueueWithJavaLangRefReference:(id)a3;
@end

@implementation JavaLangRefReferenceQueue

- (JavaLangRefReferenceQueue)init
{
  p_SENTINEL = &self->SENTINEL_;
  v4 = new_JavaLangRefWeakReference_initWithId_withJavaLangRefReferenceQueue_(0, 0);
  JreStrongAssignAndConsume((id *)p_SENTINEL, v4);
  return self;
}

- (id)poll
{
  objc_sync_enter(self);
  p_head = &self->head_;
  head = (unint64_t *)self->head_;
  if (head)
  {
    SENTINEL = self->SENTINEL_;
    unint64_t v6 = atomic_load(head + 3);
    if (SENTINEL == (JavaLangRefReference *)v6) {
      v7 = 0;
    }
    else {
      v7 = (void *)atomic_load((unint64_t *)&(*p_head)->queueNext_);
    }
    JreStrongAssign((id *)p_head, v7);
    JreVolatileStrongAssign((atomic_ullong *)head + 3, 0);
  }
  objc_sync_exit(self);
  return head;
}

- (id)remove
{
  return [(JavaLangRefReferenceQueue *)self removeWithLong:0];
}

- (id)removeWithLong:(int64_t)a3
{
  objc_sync_enter(self);
  if (a3 < 0)
  {
    CFStringRef v18 = JreStrcat("$J", v5, v6, v7, v8, v9, v10, v11, @"timeout < 0: ");
    v19 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v18);
    objc_exception_throw(v19);
  }
  if (!self->head_)
  {
    if ((unint64_t)(a3 - 0x8637BD05AF7) >= 0xFFFFF79C842FA50ALL)
    {
      uint64_t v14 = JavaLangSystem_nanoTime();
      unint64_t v15 = 0;
      int64_t v16 = 1000000 * a3;
      while (1)
      {
        [(JavaLangRefReferenceQueue *)self waitWithLong:a3 withInt:v15];
        if (self->head_) {
          break;
        }
        uint64_t v17 = v14 - JavaLangSystem_nanoTime() + v16;
        if (v17 < 1) {
          break;
        }
        a3 = v17 / 0xF4240uLL;
        unint64_t v15 = v17 % 0xF4240uLL;
      }
    }
    else
    {
      do
        [(JavaLangRefReferenceQueue *)self waitWithLong:0];
      while (!self->head_);
    }
  }
  id v12 = [(JavaLangRefReferenceQueue *)self poll];
  objc_sync_exit(self);
  return v12;
}

- (void)enqueueWithJavaLangRefReference:(id)a3
{
  objc_sync_enter(self);
  head = self->head_;
  if (head)
  {
    if (a3)
    {
      JreVolatileStrongAssign((atomic_ullong *)a3 + 3, head);
      goto LABEL_6;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_9;
  }
  JreVolatileStrongAssign((atomic_ullong *)a3 + 3, self->SENTINEL_);
LABEL_6:
  JreStrongAssign((id *)&self->head_, a3);
  [(JavaLangRefReferenceQueue *)self notify];
  objc_sync_exit(self);
}

+ (void)addWithJavaLangRefReference:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangRefReferenceQueue;
  [(JavaLangRefReferenceQueue *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssign((id *)&JavaLangRefReferenceQueue_unenqueued_, 0);
    atomic_store(1u, (unsigned __int8 *)JavaLangRefReferenceQueue__initialized);
  }
}

@end