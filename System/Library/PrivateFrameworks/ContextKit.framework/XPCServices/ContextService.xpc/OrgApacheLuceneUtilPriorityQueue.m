@interface OrgApacheLuceneUtilPriorityQueue
- (BOOL)removeWithId:(id)a3;
- (BOOL)upHeapWithInt:(int)a3;
- (OrgApacheLuceneUtilPriorityQueue)initWithInt:(int)a3;
- (OrgApacheLuceneUtilPriorityQueue)initWithInt:(int)a3 withBoolean:(BOOL)a4;
- (id)addWithId:(id)a3;
- (id)getHeapArray;
- (id)getSentinelObject;
- (id)insertWithOverflowWithId:(id)a3;
- (id)pop;
- (id)top;
- (id)updateTopWithId:(id)a3;
- (int)size;
- (uint64_t)updateTop;
- (void)clear;
- (void)dealloc;
- (void)downHeapWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilPriorityQueue

- (OrgApacheLuceneUtilPriorityQueue)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_withBoolean_((uint64_t)self, *(uint64_t *)&a3, 1, v3, v4, v5, v6, v7);
  return self;
}

- (OrgApacheLuceneUtilPriorityQueue)initWithInt:(int)a3 withBoolean:(BOOL)a4
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_withBoolean_((uint64_t)self, *(uint64_t *)&a3, a4, a4, v4, v5, v6, v7);
  return self;
}

- (id)getSentinelObject
{
  return 0;
}

- (id)addWithId:(id)a3
{
  return (id)sub_10000DECC((uint64_t)self, a3);
}

- (id)insertWithOverflowWithId:(id)a3
{
  id v3 = a3;
  int size = self->size_;
  if (size >= self->maxSize_)
  {
    if (size >= 1)
    {
      heap = self->heap_;
      if (!heap) {
        JreThrowNullPointerException();
      }
      uint64_t v7 = heap->super.size_;
      if ((int)v7 <= 1) {
        IOSArray_throwOutOfBoundsWithMsg(v7, 1);
      }
      if (([(OrgApacheLuceneUtilPriorityQueue *)self lessThanWithId:a3 withId:heap->buffer_[0]] & 1) == 0)
      {
        v8 = self->heap_;
        if (v8->super.size_ <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v8->super.size_, 1);
        }
        id v9 = v8->buffer_[0];
        IOSObjectArray_Set((uint64_t)self->heap_, 1, v3);
        -[OrgApacheLuceneUtilPriorityQueue updateTop]_0((uint64_t)self);
        return v9;
      }
    }
  }
  else
  {
    sub_10000DECC((uint64_t)self, a3);
    return 0;
  }
  return v3;
}

- (uint64_t)updateTop
{
  sub_10000E22C(a1, 1);
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *(unsigned int *)(v2 + 8);
  if ((int)v3 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v3, 1);
  }
  return *(void *)(v2 + 32);
}

- (id)top
{
  heap = self->heap_;
  if (!heap) {
    JreThrowNullPointerException();
  }
  uint64_t size = heap->super.size_;
  if ((int)size <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(size, 1);
  }
  return heap->buffer_[0];
}

- (id)pop
{
  int size = self->size_;
  if (size < 1) {
    return 0;
  }
  heap = self->heap_;
  if (!heap) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = heap->super.size_;
  if ((int)v5 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v5, 1);
  }
  uint64_t v6 = (uint64_t)heap;
  id v7 = heap->buffer_[0];
  if (size < 0 || size >= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v5, size);
  }
  IOSObjectArray_Set(v6, 1, *(void **)(v6 + 24 + 8 * size));
  IOSObjectArray_Set((uint64_t)self->heap_, self->size_, 0);
  --self->size_;
  sub_10000E22C((uint64_t)self, 1);
  return v7;
}

- (id)updateTopWithId:(id)a3
{
  heap = self->heap_;
  if (!heap) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)heap, 1, a3);
  return (id)-[OrgApacheLuceneUtilPriorityQueue updateTop]_0((uint64_t)self);
}

- (int)size
{
  return self->size_;
}

- (void)clear
{
  if ((self->size_ & 0x80000000) == 0)
  {
    int v3 = 0;
    do
    {
      heap = self->heap_;
      if (!heap) {
        JreThrowNullPointerException();
      }
      IOSObjectArray_Set((uint64_t)heap, v3++, 0);
    }
    while (v3 <= self->size_);
  }
  self->size_ = 0;
}

- (BOOL)removeWithId:(id)a3
{
  if (self->size_ < 1) {
    return 0;
  }
  uint64_t v4 = 1;
  while (1)
  {
    heap = self->heap_;
    if (!heap) {
      JreThrowNullPointerException();
    }
    uint64_t size = heap->super.size_;
    if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v4);
    }
    id v7 = (&heap->elementType_)[(int)v4];
    uint64_t v8 = self->size_;
    if (v7 == a3) {
      break;
    }
    uint64_t v4 = (v4 + 1);
    if ((int)v4 > (int)v8) {
      return 0;
    }
  }
  v10 = self->heap_;
  uint64_t v11 = v10->super.size_;
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, self->size_);
  }
  IOSObjectArray_Set((uint64_t)self->heap_, (int)v4, (&v10->elementType_)[v8]);
  IOSObjectArray_Set((uint64_t)self->heap_, self->size_, 0);
  int v12 = self->size_ - 1;
  self->size_ = v12;
  if ((int)v4 <= v12 && !sub_10000E6A4((uint64_t *)self, v4)) {
    sub_10000E22C((uint64_t)self, v4);
  }
  return 1;
}

- (BOOL)upHeapWithInt:(int)a3
{
  return sub_10000E6A4((uint64_t *)self, *(uint64_t *)&a3);
}

- (void)downHeapWithInt:(int)a3
{
}

- (id)getHeapArray
{
  return self->heap_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPriorityQueue;
  [(OrgApacheLuceneUtilPriorityQueue *)&v3 dealloc];
}

@end