@interface OrgApacheLuceneCodecsDocValuesConsumer_$6_$1
- (BOOL)hasNext;
- (OrgApacheLuceneCodecsDocValuesConsumer_$6_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$6:(id)a3;
- (id)next;
- (uint64_t)setNext;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$6_$1

- (BOOL)hasNext
{
  if (self->nextIsSet_) {
    return 1;
  }
  else {
    return -[OrgApacheLuceneCodecsDocValuesConsumer_$6_$1 setNext]_0((uint64_t)self);
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
  v7 = (id *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 20);
  while (v8 == *(_DWORD *)(a1 + 28))
  {
    *(_DWORD *)(a1 + 16) = v1 + 1;
    if (v1 + 1 >= *v3)
    {
      int v8 = 0;
    }
    else
    {
      v9 = *(void **)(v2 + 16);
      if (!v9) {
        goto LABEL_33;
      }
      JreStrongAssign(v7, objc_msgSend(v9, "getGlobalOrdsWithInt:"));
      uint64_t v10 = *(void *)(*(void *)(a1 + 8) + 24);
      if (!v10) {
        goto LABEL_33;
      }
      uint64_t v11 = *(void *)(v10 + 64);
      if (!v11) {
        goto LABEL_33;
      }
      int v12 = *(_DWORD *)(a1 + 16);
      uint64_t v13 = *(unsigned int *)(v11 + 8);
      if (v12 < 0 || v12 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v12);
      }
      JreStrongAssign(v6, *(void **)(v11 + 24 + 8 * v12));
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 8) + 24) + 96);
      if (!v14) {
        goto LABEL_33;
      }
      int v15 = *(_DWORD *)(a1 + 16);
      uint64_t v16 = *(unsigned int *)(v14 + 8);
      if (v15 < 0 || v15 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v15);
      }
      int v8 = 0;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(v14 + 12 + 4 * v15);
    }
LABEL_19:
    *(_DWORD *)(a1 + 20) = v8;
    int v1 = *(_DWORD *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 8);
    v3 = (_DWORD *)(v2 + 8);
    if (v1 == *(_DWORD *)(v2 + 8)) {
      return 0;
    }
  }
  if (!*v6) {
    goto LABEL_24;
  }
  if (!objc_msgSend(*v6, "getWithInt:"))
  {
    int v8 = *(_DWORD *)(a1 + 20) + 1;
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)(a1 + 8);
LABEL_24:
  *(unsigned char *)(a1 + 48) = 1;
  uint64_t v17 = *(void *)(v2 + 32);
  if (!v17) {
    goto LABEL_33;
  }
  int v18 = *(_DWORD *)(a1 + 16);
  uint64_t v19 = *(unsigned int *)(v17 + 8);
  if (v18 < 0 || v18 >= (int)v19) {
    IOSArray_throwOutOfBoundsWithMsg(v19, v18);
  }
  v20 = *(void **)(v17 + 24 + 8 * v18);
  if (!v20) {
    goto LABEL_33;
  }
  id v21 = [v20 getOrdWithInt:*(unsigned int *)(a1 + 20)];
  if (v21 != -1)
  {
    if (*v7)
    {
      unsigned int v22 = [*v7 getWithInt:v21];
      goto LABEL_32;
    }
LABEL_33:
    JreThrowNullPointerException();
  }
  unsigned int v22 = -1;
LABEL_32:
  ++*(_DWORD *)(a1 + 20);
  *(_DWORD *)(a1 + 24) = v22;
  return 1;
}

- (void)remove
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsDocValuesConsumer_$6_$1 *)self hasNext])
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  self->nextIsSet_ = 0;
  int nextValue = self->nextValue_;
  return JavaLangInteger_valueOfWithInt_(nextValue);
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$6_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$6:(id)a3
{
  self->readerUpto_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__6__1;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$6_$1 *)&v3 dealloc];
}

@end