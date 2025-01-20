@interface JavaUtilPriorityQueue_PriorityIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilPriorityQueue_PriorityIterator)initWithJavaUtilPriorityQueue:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilPriorityQueue_PriorityIterator

- (BOOL)hasNext
{
  return self->currentIndex_ < self->this$0_->size_ - 1;
}

- (id)next
{
  if (![(JavaUtilPriorityQueue_PriorityIterator *)self hasNext])
  {
    v8 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v8);
  }
  self->allowRemove_ = 1;
  elements = self->this$0_->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  int currentIndex = self->currentIndex_;
  uint64_t v5 = (currentIndex + 1);
  self->currentIndex_ = v5;
  uint64_t size = elements->super.size_;
  if (currentIndex + 1 < 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return (&elements->elementType_)[(int)v5];
}

- (void)remove
{
  if (!self->allowRemove_)
  {
    v4 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v4);
  }
  self->allowRemove_ = 0;
  v2 = self->this$0_;
  uint64_t currentIndex = self->currentIndex_;
  self->currentIndex_ = currentIndex - 1;
  sub_1001C220C((uint64_t)v2, currentIndex);
}

- (JavaUtilPriorityQueue_PriorityIterator)initWithJavaUtilPriorityQueue:(id)a3
{
  self->currentIndex_ = -1;
  self->allowRemove_ = 0;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilPriorityQueue_PriorityIterator;
  [(JavaUtilPriorityQueue_PriorityIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004219D8;
}

@end