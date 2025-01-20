@interface JavaUtilAbstractList_FullListIterator
+ (const)__metadata;
- (BOOL)hasPrevious;
- (JavaUtilAbstractList_FullListIterator)initWithJavaUtilAbstractList:(id)a3 withInt:(int)a4;
- (id)previous;
- (int)nextIndex;
- (int)previousIndex;
- (void)addWithId:(id)a3;
- (void)dealloc;
- (void)setWithId:(id)a3;
@end

@implementation JavaUtilAbstractList_FullListIterator

- (JavaUtilAbstractList_FullListIterator)initWithJavaUtilAbstractList:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)addWithId:(id)a3
{
  v4 = self->this$1_;
  if (self->super.expectedModCount_ != v4->modCount_)
  {
    v7 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v7);
  }
  [(JavaUtilAbstractList *)v4 addWithInt:(self->super.pos_ + 1) withId:a3];
  int expectedModCount = self->super.expectedModCount_;
  ++self->super.pos_;
  self->super.lastPosition_ = -1;
  int modCount = self->this$1_->modCount_;
  if (modCount != expectedModCount) {
    self->super.expectedModCount_ = modCount;
  }
}

- (BOOL)hasPrevious
{
  return self->super.pos_ >= 0;
}

- (int)nextIndex
{
  return self->super.pos_ + 1;
}

- (id)previous
{
  v3 = self->this$1_;
  if (self->super.expectedModCount_ != v3->modCount_)
  {
    v6 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v6);
  }
  id result = [(JavaUtilAbstractList *)v3 getWithInt:self->super.pos_];
  int pos = self->super.pos_;
  self->super.lastPosition_ = pos;
  self->super.pos_ = pos - 1;
  return result;
}

- (int)previousIndex
{
  return self->super.pos_;
}

- (void)setWithId:(id)a3
{
  if (self->super.expectedModCount_ != self->this$1_->modCount_)
  {
    v3 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v3);
  }
  [(JavaUtilAbstractList *)self->this$1_ setWithInt:self->super.lastPosition_ withId:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilAbstractList_FullListIterator;
  [(JavaUtilAbstractList_SimpleListIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100474E48;
}

@end