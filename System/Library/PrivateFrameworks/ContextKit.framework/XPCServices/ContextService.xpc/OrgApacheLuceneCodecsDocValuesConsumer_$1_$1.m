@interface OrgApacheLuceneCodecsDocValuesConsumer_$1_$1
- (BOOL)hasNext;
- (BOOL)setNext;
- (OrgApacheLuceneCodecsDocValuesConsumer_$1_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$1:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$1_$1

- (BOOL)hasNext
{
  return self->nextIsSet_ || -[OrgApacheLuceneCodecsDocValuesConsumer_$1_$1 setNext]_0((uint64_t)self);
}

- (BOOL)setNext
{
  v2 = *(void **)(*(void *)(a1 + 8) + 8);
  if (!v2) {
    goto LABEL_31;
  }
  v3 = (id *)(a1 + 48);
  v4 = (id *)(a1 + 56);
  while (1)
  {
    int v5 = *(_DWORD *)(a1 + 16);
    unsigned int v6 = [v2 size];
    if (v5 == v6) {
      return v5 != v6;
    }
    if (*(_DWORD *)(a1 + 20) != *(_DWORD *)(a1 + 36)) {
      break;
    }
    int v7 = *(_DWORD *)(a1 + 16) + 1;
    *(_DWORD *)(a1 + 16) = v7;
    if (v7 >= (int)[*(id *)(*(void *)(a1 + 8) + 8) size])
    {
      int v17 = 0;
    }
    else
    {
      JreStrongAssign((id *)(a1 + 40), [*(id *)(*(void *)(a1 + 8) + 8) getWithInt:*(unsigned int *)(a1 + 16)]);
      v8 = *(void **)(*(void *)(a1 + 8) + 16);
      if (!v8) {
        goto LABEL_31;
      }
      JreStrongAssign((id *)(a1 + 56), [v8 getWithInt:*(unsigned int *)(a1 + 16)]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 8) + 24);
      if (!v9) {
        goto LABEL_31;
      }
      uint64_t v10 = *(void *)(v9 + 64);
      if (!v10) {
        goto LABEL_31;
      }
      int v11 = *(_DWORD *)(a1 + 16);
      uint64_t v12 = *(unsigned int *)(v10 + 8);
      if (v11 < 0 || v11 >= (int)v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v11);
      }
      JreStrongAssign((id *)(a1 + 48), *(void **)(v10 + 24 + 8 * v11));
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 8) + 24) + 96);
      if (!v13) {
        goto LABEL_31;
      }
      int v14 = *(_DWORD *)(a1 + 16);
      uint64_t v15 = v14;
      uint64_t v16 = *(unsigned int *)(v13 + 8);
      if (v14 < 0 || v14 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v14);
      }
      int v17 = 0;
      *(_DWORD *)(a1 + 36) = *(_DWORD *)(v13 + 12 + 4 * v15);
    }
LABEL_19:
    *(_DWORD *)(a1 + 20) = v17;
    v2 = *(void **)(*(void *)(a1 + 8) + 8);
    if (!v2) {
      goto LABEL_31;
    }
  }
  if (*v3 && !objc_msgSend(*v3, "getWithInt:"))
  {
    int v17 = *(_DWORD *)(a1 + 20) + 1;
    goto LABEL_19;
  }
  *(unsigned char *)(a1 + 64) = 1;
  v18 = *(void **)(a1 + 40);
  if (!v18) {
    goto LABEL_31;
  }
  id v19 = [v18 getWithInt:*(unsigned int *)(a1 + 20)];
  *(void *)(a1 + 24) = v19;
  if (v19) {
    goto LABEL_27;
  }
  if (!*v4) {
LABEL_31:
  }
    JreThrowNullPointerException();
  if ([*v4 getWithInt:*(unsigned int *)(a1 + 20)]) {
LABEL_27:
  }
    char v20 = 1;
  else {
    char v20 = 0;
  }
  *(unsigned char *)(a1 + 32) = v20;
  ++*(_DWORD *)(a1 + 20);
  return v5 != v6;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsDocValuesConsumer_$1_$1 *)self hasNext])
  {
    int v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  self->nextIsSet_ = 0;
  if (!self->nextHasValue_) {
    return 0;
  }
  int64_t nextValue = self->nextValue_;
  return JavaLangLong_valueOfWithLong_(nextValue);
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$1_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$1:(id)a3
{
  self->readerUpto_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__1__1;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$1_$1 *)&v3 dealloc];
}

@end