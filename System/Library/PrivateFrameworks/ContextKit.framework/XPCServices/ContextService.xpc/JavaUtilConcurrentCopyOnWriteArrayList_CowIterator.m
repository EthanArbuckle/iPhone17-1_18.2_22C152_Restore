@interface JavaUtilConcurrentCopyOnWriteArrayList_CowIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (BOOL)hasPrevious;
- (JavaUtilConcurrentCopyOnWriteArrayList_CowIterator)initWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)next;
- (id)previous;
- (int)nextIndex;
- (int)previousIndex;
- (void)addWithId:(id)a3;
- (void)dealloc;
- (void)remove;
- (void)setWithId:(id)a3;
@end

@implementation JavaUtilConcurrentCopyOnWriteArrayList_CowIterator

- (JavaUtilConcurrentCopyOnWriteArrayList_CowIterator)initWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->index_ = 0;
  JreStrongAssign((id *)&self->snapshot_, a3);
  self->from_ = a4;
  self->to_ = a5;
  self->index_ = a4;
  return self;
}

- (void)addWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)hasNext
{
  return self->index_ < self->to_;
}

- (BOOL)hasPrevious
{
  return self->index_ > self->from_;
}

- (id)next
{
  uint64_t index = self->index_;
  if ((int)index >= self->to_)
  {
    v6 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v6);
  }
  snapshot = self->snapshot_;
  if (!snapshot) {
    JreThrowNullPointerException();
  }
  self->index_ = index + 1;
  uint64_t size = snapshot->super.size_;
  if ((index & 0x80000000) != 0 || (int)index >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, index);
  }
  return (&snapshot->elementType_)[index];
}

- (int)nextIndex
{
  return self->index_;
}

- (id)previous
{
  int index = self->index_;
  if (index <= self->from_)
  {
    v7 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v7);
  }
  snapshot = self->snapshot_;
  if (!snapshot) {
    JreThrowNullPointerException();
  }
  self->index_ = index - 1;
  uint64_t size = snapshot->super.size_;
  if (index < 1 || index > (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (index - 1));
  }
  return (id)*((void *)&snapshot->isRetained_ + index);
}

- (int)previousIndex
{
  return self->index_ - 1;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)setWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList_CowIterator;
  [(JavaUtilConcurrentCopyOnWriteArrayList_CowIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004870A0;
}

@end