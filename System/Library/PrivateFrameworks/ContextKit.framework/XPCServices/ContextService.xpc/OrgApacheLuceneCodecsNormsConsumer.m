@interface OrgApacheLuceneCodecsNormsConsumer
- (void)mergeNormsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5;
- (void)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsNormsConsumer

- (void)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  if (!a3) {
    goto LABEL_33;
  }
  uint64_t v4 = *((void *)a3 + 5);
  if (!v4) {
    goto LABEL_33;
  }
  v5 = (void **)(v4 + 24);
  unint64_t v6 = v4 + 24 + 8 * *(int *)(v4 + 8);
  while ((unint64_t)v5 < v6)
  {
    v8 = *v5++;
    v7 = v8;
    if (v8) {
      [v7 checkIntegrity];
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v9 = (void *)*((void *)a3 + 2);
  if (!v9) {
LABEL_33:
  }
    JreThrowNullPointerException();
  id v27 = [*((id *)a3 + 2) countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v27)
  {
    uint64_t v10 = *(void *)v29;
    uint64_t v24 = *(void *)v29;
    v25 = v9;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v9);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_33;
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * i) hasNorms])
        {
          v13 = new_JavaUtilArrayList_init();
          uint64_t v14 = *((void *)a3 + 5);
          if (!v14) {
            goto LABEL_33;
          }
          v15 = v13;
          uint64_t v16 = 0;
          while (v16 < *(int *)(v14 + 8))
          {
            v17 = *(void **)(v14 + 24 + 8 * v16);
            if (!v17) {
              goto LABEL_25;
            }
            uint64_t v18 = *((void *)a3 + 7);
            if (!v18) {
              goto LABEL_33;
            }
            uint64_t v19 = *(int *)(v18 + 8);
            if (v16 >= v19) {
              IOSArray_throwOutOfBoundsWithMsg(v19, v16);
            }
            v20 = *(void **)(v18 + 24 + 8 * v16);
            if (!v20) {
              goto LABEL_33;
            }
            id v21 = [v20 fieldInfoWithNSString:*(void *)(v12 + 8)];
            if (!v21
              || (id v22 = v21, ![v21 hasNorms])
              || (v23 = (OrgApacheLuceneIndexDocValues_$2 *)[v17 getNormsWithOrgApacheLuceneIndexFieldInfo:v22]) == 0)
            {
LABEL_25:
              v23 = OrgApacheLuceneIndexDocValues_emptyNumeric();
            }
            -[JavaUtilArrayList addWithId:](v15, "addWithId:", v23, v24, v25);
            ++v16;
            uint64_t v14 = *((void *)a3 + 5);
            if (!v14) {
              goto LABEL_33;
            }
          }
          [(OrgApacheLuceneCodecsNormsConsumer *)self mergeNormsFieldWithOrgApacheLuceneIndexFieldInfo:v12 withOrgApacheLuceneIndexMergeState:a3 withJavaUtilList:v15];
          uint64_t v10 = v24;
          v9 = v25;
        }
      }
      id v27 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v27);
  }
}

- (void)mergeNormsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withJavaUtilList:(id)a5
{
  v9 = [OrgApacheLuceneCodecsNormsConsumer__1 alloc];
  JreStrongAssign((id *)&v9->val$toMerge_, a5);
  JreStrongAssign((id *)&v9->val$mergeState_, a4);
  uint64_t v10 = v9;
  [(OrgApacheLuceneCodecsNormsConsumer *)self addNormsFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:v10];
}

@end