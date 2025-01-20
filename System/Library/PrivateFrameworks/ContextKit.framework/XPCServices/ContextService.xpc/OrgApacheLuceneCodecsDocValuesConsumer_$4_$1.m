@interface OrgApacheLuceneCodecsDocValuesConsumer_$4_$1
- (BOOL)hasNext;
- (OrgApacheLuceneCodecsDocValuesConsumer_$4_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$4:(id)a3;
- (id)next;
- (uint64_t)setNext;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$4_$1

- (BOOL)hasNext
{
  if (self->nextIsSet_) {
    return 1;
  }
  else {
    return -[OrgApacheLuceneCodecsDocValuesConsumer_$4_$1 setNext]_0((uint64_t)self);
  }
}

- (uint64_t)setNext
{
  uint64_t v1 = *(unsigned int *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 8);
  v3 = (_DWORD *)(v2 + 8);
  if (v1 == *(_DWORD *)(v2 + 8)) {
    return 0;
  }
  v6 = (id *)(a1 + 40);
  while (*(_DWORD *)(a1 + 52) >= *(_DWORD *)(a1 + 56))
  {
    if (*(_DWORD *)(a1 + 20) != *(_DWORD *)(a1 + 32))
    {
      if (*v6)
      {
        if (objc_msgSend(*v6, "getWithInt:"))
        {
          uint64_t v2 = *(void *)(a1 + 8);
          goto LABEL_18;
        }
      }
      else
      {
LABEL_18:
        uint64_t v16 = *(void *)(v2 + 16);
        if (!v16) {
          goto LABEL_35;
        }
        int v17 = *(_DWORD *)(a1 + 16);
        uint64_t v18 = *(unsigned int *)(v16 + 8);
        if (v17 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v17);
        }
        v19 = *(void **)(v16 + 24 + 8 * v17);
        if (!v19) {
          goto LABEL_35;
        }
        [v19 setDocumentWithInt:*(unsigned int *)(a1 + 20)];
        *(_DWORD *)(a1 + 52) = 0;
        *(_DWORD *)(a1 + 56) = [v19 count];
      }
      int v15 = *(_DWORD *)(a1 + 20) + 1;
      goto LABEL_25;
    }
    int v7 = v1 + 1;
    *(_DWORD *)(a1 + 16) = v1 + 1;
    if ((int)v1 + 1 >= *v3)
    {
      int v15 = 0;
    }
    else
    {
      uint64_t v8 = *(void *)(v2 + 24);
      if (!v8) {
        goto LABEL_35;
      }
      uint64_t v9 = *(void *)(v8 + 64);
      if (!v9) {
        goto LABEL_35;
      }
      uint64_t v10 = *(unsigned int *)(v9 + 8);
      if (v7 < 0 || v7 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, (v1 + 1));
      }
      JreStrongAssign(v6, *(void **)(v9 + 24 + 8 * v7));
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 8) + 24) + 96);
      if (!v11) {
        goto LABEL_35;
      }
      int v12 = *(_DWORD *)(a1 + 16);
      uint64_t v13 = v12;
      uint64_t v14 = *(unsigned int *)(v11 + 8);
      if (v12 < 0 || v12 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v12);
      }
      int v15 = 0;
      *(_DWORD *)(a1 + 32) = *(_DWORD *)(v11 + 12 + 4 * v13);
    }
LABEL_25:
    *(_DWORD *)(a1 + 20) = v15;
    uint64_t v1 = *(unsigned int *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 8);
    v3 = (_DWORD *)(v2 + 8);
    if (v1 == *(_DWORD *)(v2 + 8)) {
      return 0;
    }
  }
  uint64_t v20 = *(void *)(v2 + 16);
  if (!v20) {
    goto LABEL_35;
  }
  uint64_t v21 = *(unsigned int *)(v20 + 8);
  if ((v1 & 0x80000000) != 0 || (int)v1 >= (int)v21) {
    IOSArray_throwOutOfBoundsWithMsg(v21, v1);
  }
  v22 = *(void **)(v20 + 24 + 8 * (int)v1);
  if (!v22) {
LABEL_35:
  }
    JreThrowNullPointerException();
  *(void *)(a1 + 24) = [v22 valueAtWithInt:(*(_DWORD *)(a1 + 52))++];
  uint64_t result = 1;
  *(unsigned char *)(a1 + 48) = 1;
  return result;
}

- (void)remove
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsDocValuesConsumer_$4_$1 *)self hasNext])
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  self->nextIsSet_ = 0;
  int64_t nextValue = self->nextValue_;
  return JavaLangLong_valueOfWithLong_(nextValue);
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$4_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$4:(id)a3
{
  self->readerUpto_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__4__1;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$4_$1 *)&v3 dealloc];
}

@end