@interface OrgApacheLuceneCodecsFieldsConsumer
- (void)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsFieldsConsumer

- (void)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  v5 = new_JavaUtilArrayList_init();
  v6 = new_JavaUtilArrayList_init();
  if (!a3 || (uint64_t v7 = *((void *)a3 + 10)) == 0) {
LABEL_11:
  }
    JreThrowNullPointerException();
  v8 = v6;
  int v9 = 0;
  uint64_t v10 = 0;
  while (v10 < *(int *)(v7 + 8))
  {
    uint64_t v11 = *((void *)a3 + 12);
    if (v11)
    {
      v12 = *(void **)(v7 + 24 + 8 * v10);
      uint64_t v13 = *(int *)(v11 + 8);
      if (v10 >= v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v10);
      }
      if (v12)
      {
        int v14 = *(_DWORD *)(v11 + 12 + 4 * v10);
        [v12 checkIntegrity];
        [(JavaUtilArrayList *)v8 addWithId:new_OrgApacheLuceneIndexReaderSlice_initWithInt_withInt_withInt_(v9, v14, v10)];
        [(JavaUtilArrayList *)v5 addWithId:v12];
        v9 += v14;
        ++v10;
        uint64_t v7 = *((void *)a3 + 10);
        if (v7) {
          continue;
        }
      }
    }
    goto LABEL_11;
  }
  if ((atomic_load_explicit(OrgApacheLuceneIndexFields__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v15 = [(JavaUtilArrayList *)v5 toArrayWithNSObjectArray:OrgApacheLuceneIndexFields_EMPTY_ARRAY_];
  if ((atomic_load_explicit(OrgApacheLuceneIndexReaderSlice__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v16 = new_OrgApacheLuceneIndexMultiFields_initWithOrgApacheLuceneIndexFieldsArray_withOrgApacheLuceneIndexReaderSliceArray_(v15, [(JavaUtilArrayList *)v8 toArrayWithNSObjectArray:OrgApacheLuceneIndexReaderSlice_EMPTY_ARRAY_]);
  v17 = new_OrgApacheLuceneIndexMappedMultiFields_initWithOrgApacheLuceneIndexMergeState_withOrgApacheLuceneIndexMultiFields_(a3, v16);
  [(OrgApacheLuceneCodecsFieldsConsumer *)self writeWithOrgApacheLuceneIndexFields:v17];
}

@end