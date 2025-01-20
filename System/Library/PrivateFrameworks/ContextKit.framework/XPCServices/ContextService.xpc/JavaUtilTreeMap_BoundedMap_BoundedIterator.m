@interface JavaUtilTreeMap_BoundedMap_BoundedIterator
+ (const)__metadata;
- (JavaUtilTreeMap_BoundedMap_BoundedIterator)initWithJavaUtilTreeMap_BoundedMap:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (id)stepBackward;
- (id)stepForward;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_BoundedMap_BoundedIterator

- (JavaUtilTreeMap_BoundedMap_BoundedIterator)initWithJavaUtilTreeMap_BoundedMap:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
  return self;
}

- (id)stepForward
{
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedIterator;
  id v3 = [(JavaUtilTreeMap_MapIterator *)&v8 stepForward];
  next = self->super.next_;
  if (next)
  {
    v5 = self->this$1_;
    uint64_t key = (uint64_t)next->key_;
    if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ((sub_1001EB5F4(v5, key, qword_100563F20, (uint64_t)self->this$1_->toBound_) & 1) == 0) {
      JreStrongAssign((id *)&self->super.next_, 0);
    }
  }
  return v3;
}

- (id)stepBackward
{
  v10.receiver = self;
  v10.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedIterator;
  id v3 = [(JavaUtilTreeMap_MapIterator *)&v10 stepBackward];
  p_next = &self->super.next_;
  next = self->super.next_;
  if (next)
  {
    v6 = self->this$1_;
    uint64_t key = (uint64_t)next->key_;
    uint64_t fromBound = (uint64_t)v6->fromBound_;
    if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ((sub_1001EB5F4(v6, key, fromBound, qword_100563F20) & 1) == 0) {
      JreStrongAssign((id *)p_next, 0);
    }
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedIterator;
  [(JavaUtilTreeMap_MapIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100437F10;
}

@end