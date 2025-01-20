@interface JavaUtilTreeMap_MapIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilTreeMap_MapIterator)initWithJavaUtilTreeMap:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (id)stepBackward;
- (id)stepForward;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilTreeMap_MapIterator

- (JavaUtilTreeMap_MapIterator)initWithJavaUtilTreeMap:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
  self->expectedModCount_ = *((_DWORD *)a3 + 11);
  JreStrongAssign((id *)&self->next_, a4);
  return self;
}

- (BOOL)hasNext
{
  return self->next_ != 0;
}

- (id)stepForward
{
  p_next = &self->next_;
  next = self->next_;
  if (!next)
  {
    v7 = new_JavaUtilNoSuchElementException_init();
    goto LABEL_8;
  }
  if (self->this$0_->modCount_ != self->expectedModCount_)
  {
    v7 = new_JavaUtilConcurrentModificationException_init();
LABEL_8:
    objc_exception_throw(v7);
  }
  JreStrongAssign((id *)&self->last_, next);
  v5 = self->next_;
  if (!v5) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)p_next, [(JavaUtilTreeMap_Node *)v5 next]);
  return self->last_;
}

- (id)stepBackward
{
  p_next = &self->next_;
  next = self->next_;
  if (!next)
  {
    v7 = new_JavaUtilNoSuchElementException_init();
    goto LABEL_8;
  }
  if (self->this$0_->modCount_ != self->expectedModCount_)
  {
    v7 = new_JavaUtilConcurrentModificationException_init();
LABEL_8:
    objc_exception_throw(v7);
  }
  JreStrongAssign((id *)&self->last_, next);
  v5 = self->next_;
  if (!v5) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)p_next, [(JavaUtilTreeMap_Node *)v5 prev]);
  return self->last_;
}

- (void)remove
{
  p_last = &self->last_;
  if (!self->last_)
  {
    v4 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v4);
  }
  -[JavaUtilTreeMap removeInternalWithJavaUtilTreeMap_Node:](self->this$0_, "removeInternalWithJavaUtilTreeMap_Node:");
  self->expectedModCount_ = self->this$0_->modCount_;
  JreStrongAssign((id *)p_last, 0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_MapIterator;
  [(JavaUtilTreeMap_MapIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100436410;
}

@end