@interface OrgApacheLuceneUtilMergedIterator
- (BOOL)hasNext;
- (OrgApacheLuceneUtilMergedIterator)initWithBoolean:(BOOL)a3 withJavaUtilIteratorArray:(id)a4;
- (OrgApacheLuceneUtilMergedIterator)initWithJavaUtilIteratorArray:(id)a3;
- (id)next;
- (id)pullTop;
- (int)pushTop;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneUtilMergedIterator

- (OrgApacheLuceneUtilMergedIterator)initWithJavaUtilIteratorArray:(id)a3
{
  return self;
}

- (OrgApacheLuceneUtilMergedIterator)initWithBoolean:(BOOL)a3 withJavaUtilIteratorArray:(id)a4
{
  return self;
}

- (BOOL)hasNext
{
  queue = self->queue_;
  if (!queue) {
    goto LABEL_16;
  }
  if ([(OrgApacheLuceneUtilPriorityQueue *)queue size] > 0)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (self->numTop_ >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      top = self->top_;
      if (!top) {
        break;
      }
      uint64_t size = top->super.size_;
      if ((int)v5 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      v8 = (&top->elementType_)[v5];
      if (!v8) {
        break;
      }
      Class isa = v8[1].super.isa;
      if (!isa) {
        break;
      }
      unsigned int v4 = [(objc_class *)isa hasNext];
      if (!v4 && (int)++v5 < self->numTop_) {
        continue;
      }
      return v4;
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (id)next
{
  -[OrgApacheLuceneUtilMergedIterator pushTop]_0((int *)self);
  queue = self->queue_;
  if (!queue) {
    JreThrowNullPointerException();
  }
  if ([(OrgApacheLuceneUtilPriorityQueue *)queue size] < 1) {
    JreStrongAssign((id *)&self->current_, 0);
  }
  else {
    -[OrgApacheLuceneUtilMergedIterator pullTop]_0((uint64_t)self);
  }
  id result = self->current_;
  if (!result)
  {
    uint64_t v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  return result;
}

- (int)pushTop
{
  v1 = result;
  if (result[9] >= 1)
  {
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = *((void *)v1 + 3);
      if (!v3) {
        break;
      }
      uint64_t v4 = *(unsigned int *)(v3 + 8);
      if ((int)v2 >= (int)v4) {
        IOSArray_throwOutOfBoundsWithMsg(v4, v2);
      }
      uint64_t v5 = *(void *)(v3 + 24 + 8 * v2);
      if (!v5) {
        break;
      }
      v6 = *(void **)(v5 + 8);
      if (!v6) {
        break;
      }
      unsigned int v7 = [v6 hasNext];
      uint64_t v8 = *((void *)v1 + 3);
      uint64_t v9 = *(unsigned int *)(v8 + 8);
      if (v7)
      {
        if ((int)v2 >= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(v9, v2);
        }
        uint64_t v10 = *(void *)(v8 + 24 + 8 * v2);
        if (!v10) {
          break;
        }
        uint64_t v11 = *((void *)v1 + 3);
        uint64_t v12 = *(unsigned int *)(v11 + 8);
        if ((int)v2 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v2);
        }
        uint64_t v13 = *(void *)(v11 + 24 + 8 * v2);
        if (!v13) {
          break;
        }
        JreStrongAssign((id *)(v10 + 16), [*(id *)(v13 + 8) next]);
        if (!*((void *)v1 + 2)) {
          break;
        }
        uint64_t v14 = *((void *)v1 + 3);
        uint64_t v15 = *(unsigned int *)(v14 + 8);
        if ((int)v2 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v2);
        }
        id result = (int *)[*((id *)v1 + 2) addWithId:*(void *)(v14 + 24 + 8 * v2)];
      }
      else
      {
        if ((int)v2 >= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(v9, v2);
        }
        uint64_t v16 = *(void *)(v8 + 24 + 8 * v2);
        if (!v16) {
          break;
        }
        id result = (int *)JreStrongAssign((id *)(v16 + 16), 0);
      }
      if ((int)++v2 >= v1[9]) {
        goto LABEL_25;
      }
    }
    JreThrowNullPointerException();
  }
LABEL_25:
  v1[9] = 0;
  return result;
}

- (id)pullTop
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    goto LABEL_17;
  }
  uint64_t v3 = *(int *)(a1 + 36);
  *(_DWORD *)(a1 + 36) = v3 + 1;
  uint64_t v4 = *(void **)(a1 + 16);
  if (!v4) {
    goto LABEL_17;
  }
  IOSObjectArray_Set(v1, v3, [v4 pop]);
  if (*(unsigned char *)(a1 + 32))
  {
    while ([*(id *)(a1 + 16) size])
    {
      uint64_t v5 = [*(id *)(a1 + 16) top];
      if (!v5) {
        goto LABEL_17;
      }
      v6 = (void *)v5[2];
      if (!v6) {
        goto LABEL_17;
      }
      uint64_t v7 = *(void *)(a1 + 24);
      uint64_t v8 = *(unsigned int *)(v7 + 8);
      if ((int)v8 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v8, 0);
      }
      uint64_t v9 = *(void *)(v7 + 24);
      if (!v9) {
        goto LABEL_17;
      }
      if (![v6 isEqual:*(void *)(v9 + 16)]) {
        break;
      }
      uint64_t v10 = *(int *)(a1 + 36);
      *(_DWORD *)(a1 + 36) = v10 + 1;
      IOSObjectArray_Set(*(void *)(a1 + 24), v10, [*(id *)(a1 + 16) pop]);
    }
  }
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(unsigned int *)(v11 + 8);
  if ((int)v12 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 0);
  }
  uint64_t v13 = *(void *)(v11 + 24);
  if (!v13) {
LABEL_17:
  }
    JreThrowNullPointerException();
  uint64_t v14 = *(void **)(v13 + 16);
  return JreStrongAssign((id *)(a1 + 8), v14);
}

- (void)remove
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilMergedIterator;
  [(OrgApacheLuceneUtilMergedIterator *)&v3 dealloc];
}

@end