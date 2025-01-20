@interface OrgApacheLuceneCodecsStoredFieldsWriter
- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsStoredFieldsWriter

- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  if (!a3 || (uint64_t v4 = *((void *)a3 + 3)) == 0) {
LABEL_21:
  }
    JreThrowNullPointerException();
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  while ((int)v7 < *(_DWORD *)(v4 + 8))
  {
    uint64_t v8 = v4 + 24;
    v9 = *(void **)(v8 + 8 * (int)v7);
    if (v9)
    {
      [*(id *)(v8 + 8 * (int)v7) checkIntegrity];
      v10 = [OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor alloc];
      OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor_initWithOrgApacheLuceneCodecsStoredFieldsWriter_withOrgApacheLuceneIndexMergeState_withInt_((uint64_t)v10, self, (uint64_t)a3, v7);
      v11 = v10;
      uint64_t v12 = *((void *)a3 + 12);
      if (v12)
      {
        v13 = v11;
        uint64_t v14 = *(unsigned int *)(v12 + 8);
        if ((int)v7 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v7);
        }
        uint64_t v15 = *((void *)a3 + 8);
        if (v15)
        {
          int v16 = *(_DWORD *)(v12 + 12 + 4 * (int)v7);
          uint64_t v17 = *(unsigned int *)(v15 + 8);
          if ((int)v7 >= (int)v17) {
            IOSArray_throwOutOfBoundsWithMsg(v17, v7);
          }
          if (v16 >= 1)
          {
            uint64_t v18 = 0;
            v19 = *(void **)(v15 + 24 + 8 * (int)v7);
            do
            {
              if (!v19 || [v19 getWithInt:v18])
              {
                [(OrgApacheLuceneCodecsStoredFieldsWriter *)self startDocument];
                [v9 visitDocumentWithInt:v18 withOrgApacheLuceneIndexStoredFieldVisitor:v13];
                [(OrgApacheLuceneCodecsStoredFieldsWriter *)self finishDocument];
                uint64_t v6 = (v6 + 1);
              }
              uint64_t v18 = (v18 + 1);
            }
            while (v16 != v18);
          }
          uint64_t v7 = (v7 + 1);
          uint64_t v4 = *((void *)a3 + 3);
          if (v4) {
            continue;
          }
        }
      }
    }
    goto LABEL_21;
  }
  [(OrgApacheLuceneCodecsStoredFieldsWriter *)self finishWithOrgApacheLuceneIndexFieldInfos:*((void *)a3 + 2) withInt:v6];
  return v6;
}

@end