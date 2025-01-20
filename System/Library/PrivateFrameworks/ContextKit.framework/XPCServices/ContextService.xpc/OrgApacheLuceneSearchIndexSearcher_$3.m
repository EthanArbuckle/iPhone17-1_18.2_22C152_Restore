@interface OrgApacheLuceneSearchIndexSearcher_$3
- (OrgApacheLuceneSearchIndexSearcher_$3)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDoc:(id)a4;
- (id)newCollector;
- (id)reduceWithJavaUtilCollection:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchIndexSearcher_$3

- (id)newCollector
{
  return OrgApacheLuceneSearchTopScoreDocCollector_createWithInt_withOrgApacheLuceneSearchScoreDoc_(self->val$cappedNumHits_, self->val$after_);
}

- (id)reduceWithJavaUtilCollection:(id)a3
{
  if (!a3) {
LABEL_11:
  }
    JreThrowNullPointerException();
  v5 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)[a3 size], OrgApacheLuceneSearchTopDocs_class_());
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v11) {
          goto LABEL_11;
        }
        IOSObjectArray_Set((uint64_t)v5, v8 + (int)i, [v11 topDocs]);
      }
      id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v8 += (int)i;
    }
    while (v7);
  }
  return OrgApacheLuceneSearchTopDocs_mergeWithInt_withOrgApacheLuceneSearchTopDocsArray_(self->val$cappedNumHits_, (uint64_t)v5);
}

- (OrgApacheLuceneSearchIndexSearcher_$3)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDoc:(id)a4
{
  self->val$cappedNumHits_ = a3;
  JreStrongAssign((id *)&self->val$after_, a4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchIndexSearcher__3;
  [(OrgApacheLuceneSearchIndexSearcher_$3 *)&v3 dealloc];
}

@end