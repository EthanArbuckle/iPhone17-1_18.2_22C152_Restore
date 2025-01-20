@interface OrgApacheLuceneCodecsNormsConsumer_$1_$1
- (BOOL)hasNext;
- (BOOL)setNext;
- (OrgApacheLuceneCodecsNormsConsumer_$1_$1)initWithOrgApacheLuceneCodecsNormsConsumer_$1:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsNormsConsumer_$1_$1

- (BOOL)hasNext
{
  return self->nextIsSet_ || -[OrgApacheLuceneCodecsNormsConsumer_$1_$1 setNext]_0((uint64_t)self);
}

- (BOOL)setNext
{
  v2 = *(void **)(*(void *)(a1 + 8) + 8);
  if (!v2) {
    goto LABEL_27;
  }
  v3 = (void **)(a1 + 40);
  v4 = (id *)(a1 + 48);
  while (1)
  {
    int v5 = *(_DWORD *)(a1 + 16);
    unsigned int v6 = [v2 size];
    if (v5 == v6) {
      return v5 != v6;
    }
    v7 = *v3;
    if (!*v3 || *(_DWORD *)(a1 + 20) == *(_DWORD *)(a1 + 32))
    {
      int v8 = *(_DWORD *)(a1 + 16) + 1;
      *(_DWORD *)(a1 + 16) = v8;
      if (v8 >= (int)[*(id *)(*(void *)(a1 + 8) + 8) size])
      {
        int v17 = 0;
      }
      else
      {
        JreStrongAssign((id *)(a1 + 40), [*(id *)(*(void *)(a1 + 8) + 8) getWithInt:*(unsigned int *)(a1 + 16)]);
        uint64_t v9 = *(void *)(*(void *)(a1 + 8) + 16);
        if (!v9) {
          goto LABEL_27;
        }
        uint64_t v10 = *(void *)(v9 + 64);
        if (!v10) {
          goto LABEL_27;
        }
        int v11 = *(_DWORD *)(a1 + 16);
        uint64_t v12 = *(unsigned int *)(v10 + 8);
        if (v11 < 0 || v11 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v11);
        }
        JreStrongAssign((id *)(a1 + 48), *(void **)(v10 + 24 + 8 * v11));
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 8) + 16) + 96);
        if (!v13) {
          goto LABEL_27;
        }
        int v14 = *(_DWORD *)(a1 + 16);
        uint64_t v15 = v14;
        uint64_t v16 = *(unsigned int *)(v13 + 8);
        if (v14 < 0 || v14 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v14);
        }
        int v17 = 0;
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(v13 + 12 + 4 * v15);
      }
      goto LABEL_19;
    }
    if (!*v4) {
      break;
    }
    if (objc_msgSend(*v4, "getWithInt:"))
    {
      v7 = *(void **)(a1 + 40);
      *(unsigned char *)(a1 + 56) = 1;
      if (v7) {
        goto LABEL_25;
      }
LABEL_27:
      JreThrowNullPointerException();
    }
    int v17 = *(_DWORD *)(a1 + 20) + 1;
LABEL_19:
    *(_DWORD *)(a1 + 20) = v17;
    v2 = *(void **)(*(void *)(a1 + 8) + 8);
    if (!v2) {
      goto LABEL_27;
    }
  }
  *(unsigned char *)(a1 + 56) = 1;
LABEL_25:
  *(void *)(a1 + 24) = [v7 getWithInt:(*(_DWORD *)(a1 + 20))++];
  return v5 != v6;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsNormsConsumer_$1_$1 *)self hasNext])
  {
    int v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  self->nextIsSet_ = 0;
  int64_t nextValue = self->nextValue_;
  return JavaLangLong_valueOfWithLong_(nextValue);
}

- (OrgApacheLuceneCodecsNormsConsumer_$1_$1)initWithOrgApacheLuceneCodecsNormsConsumer_$1:(id)a3
{
  self->readerUpto_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsNormsConsumer__1__1;
  [(OrgApacheLuceneCodecsNormsConsumer_$1_$1 *)&v3 dealloc];
}

@end