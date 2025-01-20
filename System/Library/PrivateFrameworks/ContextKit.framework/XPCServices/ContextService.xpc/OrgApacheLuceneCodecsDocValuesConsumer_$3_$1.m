@interface OrgApacheLuceneCodecsDocValuesConsumer_$3_$1
- (BOOL)hasNext;
- (OrgApacheLuceneCodecsDocValuesConsumer_$3_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$3:(id)a3;
- (id)next;
- (uint64_t)setNext;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$3_$1

- (BOOL)hasNext
{
  if (self->nextIsSet_) {
    return 1;
  }
  else {
    return -[OrgApacheLuceneCodecsDocValuesConsumer_$3_$1 setNext]_0((uint64_t)self);
  }
}

- (uint64_t)setNext
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 8);
  v3 = (_DWORD *)(v2 + 8);
  if (v1 == *(_DWORD *)(v2 + 8)) {
    return 0;
  }
  v6 = (id *)(a1 + 32);
  int v7 = *(_DWORD *)(a1 + 20);
  while (v7 == *(_DWORD *)(a1 + 28))
  {
    uint64_t v8 = (v1 + 1);
    *(_DWORD *)(a1 + 16) = v8;
    if ((int)v8 >= *v3)
    {
      int v7 = 0;
    }
    else
    {
      uint64_t v9 = *(void *)(v2 + 16);
      if (!v9) {
        goto LABEL_28;
      }
      uint64_t v10 = *(void *)(v9 + 64);
      if (!v10) {
        goto LABEL_28;
      }
      uint64_t v11 = *(unsigned int *)(v10 + 8);
      if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v8);
      }
      JreStrongAssign(v6, *(void **)(v10 + 24 + 8 * (int)v8));
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 8) + 16) + 96);
      if (!v12) {
        goto LABEL_28;
      }
      int v13 = *(_DWORD *)(a1 + 16);
      uint64_t v14 = *(unsigned int *)(v12 + 8);
      if (v13 < 0 || v13 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v13);
      }
      int v7 = 0;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(v12 + 12 + 4 * v13);
    }
LABEL_18:
    *(_DWORD *)(a1 + 20) = v7;
    int v1 = *(_DWORD *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 8);
    v3 = (_DWORD *)(v2 + 8);
    if (v1 == *(_DWORD *)(v2 + 8)) {
      return 0;
    }
  }
  if (!*v6) {
    goto LABEL_23;
  }
  if (!objc_msgSend(*v6, "getWithInt:"))
  {
    int v7 = *(_DWORD *)(a1 + 20) + 1;
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)(a1 + 8);
LABEL_23:
  *(unsigned char *)(a1 + 40) = 1;
  uint64_t v15 = *(void *)(v2 + 24);
  if (!v15) {
    goto LABEL_28;
  }
  int v16 = *(_DWORD *)(a1 + 16);
  uint64_t v17 = *(unsigned int *)(v15 + 8);
  if (v16 < 0 || v16 >= (int)v17) {
    IOSArray_throwOutOfBoundsWithMsg(v17, v16);
  }
  v18 = *(void **)(v15 + 24 + 8 * v16);
  if (!v18) {
LABEL_28:
  }
    JreThrowNullPointerException();
  [v18 setDocumentWithInt:*(unsigned int *)(a1 + 20)];
  unsigned int v19 = [v18 count];
  ++*(_DWORD *)(a1 + 20);
  *(_DWORD *)(a1 + 24) = v19;
  return 1;
}

- (void)remove
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsDocValuesConsumer_$3_$1 *)self hasNext])
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  self->nextIsSet_ = 0;
  int nextValue = self->nextValue_;
  return JavaLangInteger_valueOfWithInt_(nextValue);
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$3_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$3:(id)a3
{
  self->readerUpto_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__3__1;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$3_$1 *)&v3 dealloc];
}

@end