@interface JavaUtilArrayList_ArrayListIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilArrayList_ArrayListIterator)initWithJavaUtilArrayList:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilArrayList_ArrayListIterator

- (BOOL)hasNext
{
  return self->remaining_ != 0;
}

- (id)next
{
  v2 = self->this$0_;
  if (v2->super.modCount_ != self->expectedModCount_)
  {
    v9 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_11;
  }
  int remaining = self->remaining_;
  if (!remaining)
  {
    v9 = new_JavaUtilNoSuchElementException_init();
LABEL_11:
    objc_exception_throw(v9);
  }
  self->remaining_ = remaining - 1;
  uint64_t v4 = *(void *)&v2->size_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  int v5 = *(&v2->super.modCount_ + 1);
  uint64_t v6 = (v5 - remaining);
  self->removalIndex_ = v6;
  uint64_t v7 = *(unsigned int *)(v4 + 8);
  if (v5 - remaining < 0 || (int)v6 >= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v7, v6);
  }
  return *(id *)(v4 + 24 + 8 * (int)v6);
}

- (void)remove
{
  v2 = self->this$0_;
  if (v2->super.modCount_ != self->expectedModCount_)
  {
    v10 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_8;
  }
  uint64_t removalIndex = self->removalIndex_;
  if ((removalIndex & 0x80000000) != 0)
  {
    v10 = new_JavaLangIllegalStateException_init();
LABEL_8:
    objc_exception_throw(v10);
  }
  int v5 = *(void **)&v2->size_;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v5, (removalIndex + 1), v5, removalIndex, self->remaining_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = self->this$0_;
  int v7 = *(&v6->super.modCount_ + 1) - 1;
  *(&v6->super.modCount_ + 1) = v7;
  IOSObjectArray_Set((uint64_t)v5, v7, 0);
  self->removalIndex_ = -1;
  v8 = self->this$0_;
  int v9 = v8->super.modCount_ + 1;
  v8->super.modCount_ = v9;
  self->expectedModCount_ = v9;
}

- (JavaUtilArrayList_ArrayListIterator)initWithJavaUtilArrayList:(id)a3
{
  self->remaining_ = *((_DWORD *)a3 + 3);
  self->removalIndex_ = -1;
  self->expectedModCount_ = *((_DWORD *)a3 + 2);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilArrayList_ArrayListIterator;
  [(JavaUtilArrayList_ArrayListIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100422EF0;
}

@end