@interface OrgApacheLuceneCodecsDocValuesConsumer_$9_$1
- (BOOL)hasNext;
- (OrgApacheLuceneCodecsDocValuesConsumer_$9_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$9:(id)a3;
- (id)next;
- (uint64_t)setNext;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$9_$1

- (BOOL)hasNext
{
  if (self->nextIsSet_) {
    return 1;
  }
  else {
    return -[OrgApacheLuceneCodecsDocValuesConsumer_$9_$1 setNext]_0((uint64_t)self);
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
  v6 = (id *)(a1 + 40);
  v7 = (id *)(a1 + 64);
  v8 = (id *)(a1 + 48);
  while (1)
  {
    uint64_t v9 = *(unsigned int *)(a1 + 72);
    if ((int)v9 < *(_DWORD *)(a1 + 76)) {
      break;
    }
    if (*(_DWORD *)(a1 + 20) != *(_DWORD *)(a1 + 32))
    {
      if (!*v6) {
        goto LABEL_19;
      }
      if (objc_msgSend(*v6, "getWithInt:"))
      {
        uint64_t v2 = *(void *)(a1 + 8);
LABEL_19:
        uint64_t v20 = *(void *)(v2 + 32);
        if (!v20) {
          goto LABEL_46;
        }
        int v21 = *(_DWORD *)(a1 + 16);
        uint64_t v22 = *(unsigned int *)(v20 + 8);
        if (v21 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, v21);
        }
        v23 = *(void **)(v20 + 24 + 8 * v21);
        if (!v23) {
          goto LABEL_46;
        }
        [v23 setDocumentWithInt:*(unsigned int *)(a1 + 20)];
        *(void *)(a1 + 72) = 0;
        id v24 = [v23 nextOrd];
        if (v24 != (id)-1)
        {
          id v31 = v24;
          while (1)
          {
            v32 = *(unsigned int **)(a1 + 64);
            if (!v32) {
              break;
            }
            int v33 = *(_DWORD *)(a1 + 76);
            if (v33 == v32[2])
            {
              v34 = OrgApacheLuceneUtilArrayUtil_growWithLongArray_withInt_(v32, v33 + 1, v25, v26, v27, v28, v29, v30);
              JreStrongAssign(v7, v34);
            }
            if (!*v8) {
              break;
            }
            id v35 = [*v8 getWithLong:v31];
            v36 = *v7;
            if (!*v7) {
              break;
            }
            id v37 = v35;
            int v38 = *(_DWORD *)(a1 + 76);
            uint64_t v39 = *((unsigned int *)v36 + 2);
            if (v38 < 0 || v38 >= (int)v39) {
              IOSArray_throwOutOfBoundsWithMsg(v39, *(unsigned int *)(a1 + 76));
            }
            v36[v38 + 2] = v37;
            *(_DWORD *)(a1 + 76) = v38 + 1;
            id v31 = [v23 nextOrd];
            if (v31 == (id)-1) {
              goto LABEL_35;
            }
          }
LABEL_46:
          JreThrowNullPointerException();
        }
      }
LABEL_35:
      int v19 = *(_DWORD *)(a1 + 20) + 1;
      goto LABEL_37;
    }
    *(_DWORD *)(a1 + 16) = v1 + 1;
    if (v1 + 1 >= *v3)
    {
      int v19 = 0;
    }
    else
    {
      v10 = *(void **)(v2 + 16);
      if (!v10) {
        goto LABEL_46;
      }
      JreStrongAssign(v8, objc_msgSend(v10, "getGlobalOrdsWithInt:"));
      uint64_t v11 = *(void *)(*(void *)(a1 + 8) + 24);
      if (!v11) {
        goto LABEL_46;
      }
      uint64_t v12 = *(void *)(v11 + 64);
      if (!v12) {
        goto LABEL_46;
      }
      int v13 = *(_DWORD *)(a1 + 16);
      uint64_t v14 = *(unsigned int *)(v12 + 8);
      if (v13 < 0 || v13 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v13);
      }
      JreStrongAssign(v6, *(void **)(v12 + 24 + 8 * v13));
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 8) + 24) + 96);
      if (!v15) {
        goto LABEL_46;
      }
      int v16 = *(_DWORD *)(a1 + 16);
      uint64_t v17 = v16;
      uint64_t v18 = *(unsigned int *)(v15 + 8);
      if (v16 < 0 || v16 >= (int)v18) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v16);
      }
      int v19 = 0;
      *(_DWORD *)(a1 + 32) = *(_DWORD *)(v15 + 12 + 4 * v17);
    }
LABEL_37:
    *(_DWORD *)(a1 + 20) = v19;
    int v1 = *(_DWORD *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 8);
    v3 = (_DWORD *)(v2 + 8);
    if (v1 == *(_DWORD *)(v2 + 8)) {
      return 0;
    }
  }
  v40 = *v7;
  if (!*v7) {
    goto LABEL_46;
  }
  uint64_t v41 = *((unsigned int *)v40 + 2);
  if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v41) {
    IOSArray_throwOutOfBoundsWithMsg(v41, v9);
  }
  *(void *)(a1 + 24) = v40[(int)v9 + 2];
  *(_DWORD *)(a1 + 72) = v9 + 1;
  uint64_t result = 1;
  *(unsigned char *)(a1 + 56) = 1;
  return result;
}

- (void)remove
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  if (![(OrgApacheLuceneCodecsDocValuesConsumer_$9_$1 *)self hasNext])
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  self->nextIsSet_ = 0;
  int64_t nextValue = self->nextValue_;
  return JavaLangLong_valueOfWithLong_(nextValue);
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$9_$1)initWithOrgApacheLuceneCodecsDocValuesConsumer_$9:(id)a3
{
  self->readerUpto_ = -1;
  JreStrongAssignAndConsume((id *)&self->ords_, +[IOSLongArray newArrayWithLength:8]);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__9__1;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$9_$1 *)&v3 dealloc];
}

@end