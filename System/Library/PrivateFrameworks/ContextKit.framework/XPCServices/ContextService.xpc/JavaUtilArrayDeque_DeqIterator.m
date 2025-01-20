@interface JavaUtilArrayDeque_DeqIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilArrayDeque_DeqIterator)initWithJavaUtilArrayDeque:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilArrayDeque_DeqIterator

- (BOOL)hasNext
{
  return self->cursor_ != self->fence_;
}

- (id)next
{
  int fence = self->fence_;
  uint64_t cursor = self->cursor_;
  if (cursor == fence)
  {
    v11 = new_JavaUtilNoSuchElementException_init();
    goto LABEL_14;
  }
  v5 = self->this$0_;
  elements = v5->elements_;
  if (!elements) {
    JreThrowNullPointerException();
  }
  uint64_t size = elements->super.size_;
  if ((cursor & 0x80000000) != 0 || (int)cursor >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, cursor);
  }
  id result = (&elements->elementType_)[cursor];
  if (v5->tail_ != fence || result == 0)
  {
    v11 = new_JavaUtilConcurrentModificationException_init();
LABEL_14:
    objc_exception_throw(v11);
  }
  int v10 = self->cursor_;
  self->lastRet_ = v10;
  self->cursor_ = (v5->elements_->super.size_ - 1) & (v10 + 1);
  return result;
}

- (void)remove
{
  uint64_t lastRet = self->lastRet_;
  if ((lastRet & 0x80000000) != 0)
  {
    v6 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v6);
  }
  if (sub_10026008C((uint64_t)self->this$0_, lastRet))
  {
    v4 = self->this$0_;
    elements = v4->elements_;
    if (!elements) {
      JreThrowNullPointerException();
    }
    self->cursor_ = (elements->super.size_ - 1) & (self->cursor_ - 1);
    self->fence_ = v4->tail_;
  }
  self->lastRet_ = -1;
}

- (JavaUtilArrayDeque_DeqIterator)initWithJavaUtilArrayDeque:(id)a3
{
  self->cursor_ = *((_DWORD *)a3 + 4);
  self->fence_ = *((_DWORD *)a3 + 5);
  self->lastRet_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilArrayDeque_DeqIterator;
  [(JavaUtilArrayDeque_DeqIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046C350;
}

@end