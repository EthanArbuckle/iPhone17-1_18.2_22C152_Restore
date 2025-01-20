@interface OrgApacheLuceneCodecsTermVectorsWriter
- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
- (void)addAllDocVectorsWithOrgApacheLuceneIndexFields:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4;
- (void)addProxWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withOrgApacheLuceneStoreDataInput:(id)a5;
@end

@implementation OrgApacheLuceneCodecsTermVectorsWriter

- (void)addProxWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withOrgApacheLuceneStoreDataInput:(id)a5
{
  if (a3 >= 1)
  {
    int v7 = a3;
    LODWORD(v9) = 0;
    v10 = 0;
    unsigned int v11 = 0;
    do
    {
      if (a4)
      {
        unsigned int v12 = [a4 readVInt];
        uint64_t v9 = v9 + (v12 >> 1);
        if (v12)
        {
          id v16 = [a4 readVInt];
          if (!v10)
          {
            v10 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
            if (!v10) {
              JreThrowNullPointerException();
            }
          }
          [(OrgApacheLuceneUtilBytesRefBuilder *)v10 growWithInt:v16];
          objc_msgSend(a4, "readBytesWithByteArray:withInt:withInt:", -[OrgApacheLuceneUtilBytesRefBuilder bytes](v10, "bytes"), 0, v16);
          [(OrgApacheLuceneUtilBytesRefBuilder *)v10 setLengthWithInt:v16];
          id v13 = [(OrgApacheLuceneUtilBytesRefBuilder *)v10 get];
          if (!a5)
          {
LABEL_12:
            uint64_t v14 = 0xFFFFFFFFLL;
            uint64_t v15 = 0xFFFFFFFFLL;
            goto LABEL_13;
          }
        }
        else
        {
          id v13 = 0;
          if (!a5) {
            goto LABEL_12;
          }
        }
      }
      else
      {
        id v13 = 0;
        uint64_t v9 = 0xFFFFFFFFLL;
        if (!a5) {
          goto LABEL_12;
        }
      }
      uint64_t v14 = [a5 readVInt] + v11;
      unsigned int v11 = v14 + [a5 readVInt];
      uint64_t v15 = v11;
LABEL_13:
      [(OrgApacheLuceneCodecsTermVectorsWriter *)self addPositionWithInt:v9 withInt:v14 withInt:v15 withOrgApacheLuceneUtilBytesRef:v13];
      --v7;
    }
    while (v7);
  }
}

- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  if (!a3) {
    goto LABEL_28;
  }
  uint64_t v4 = *((void *)a3 + 12);
  if (!v4) {
    goto LABEL_28;
  }
  uint64_t v6 = *(unsigned int *)(v4 + 8);
  if ((int)v6 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = *((void *)a3 + 12);
      uint64_t v10 = *(int *)(v9 + 8);
      if (v7 >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v7);
      }
      uint64_t v11 = *((void *)a3 + 8);
      if (!v11) {
        break;
      }
      int v12 = *(_DWORD *)(v9 + 12 + 4 * v7);
      uint64_t v13 = *(int *)(v11 + 8);
      if (v7 >= v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v7);
      }
      uint64_t v14 = *((void *)a3 + 4);
      if (!v14) {
        break;
      }
      uint64_t v15 = *(void **)(v11 + 24 + 8 * v7);
      uint64_t v16 = *(int *)(v14 + 8);
      if (v7 >= v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v7);
      }
      uint64_t v17 = v14 + 24;
      v18 = *(void **)(v14 + 24 + 8 * v7);
      if (v18) {
        [*(id *)(v17 + 8 * v7) checkIntegrity];
      }
      if (v12 >= 1)
      {
        uint64_t v19 = 0;
        do
        {
          if (!v15 || [v15 getWithInt:v19])
          {
            if (v18) {
              id v20 = [v18 getWithInt:v19];
            }
            else {
              id v20 = 0;
            }
            sub_10004DF14(self, v20, (uint64_t)a3);
            uint64_t v8 = (v8 + 1);
          }
          uint64_t v19 = (v19 + 1);
        }
        while (v12 != v19);
      }
      if (++v7 == v6) {
        goto LABEL_27;
      }
    }
LABEL_28:
    JreThrowNullPointerException();
  }
  uint64_t v8 = 0;
LABEL_27:
  [(OrgApacheLuceneCodecsTermVectorsWriter *)self finishWithOrgApacheLuceneIndexFieldInfos:*((void *)a3 + 2) withInt:v8];
  return v8;
}

- (void)addAllDocVectorsWithOrgApacheLuceneIndexFields:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4
{
}

@end