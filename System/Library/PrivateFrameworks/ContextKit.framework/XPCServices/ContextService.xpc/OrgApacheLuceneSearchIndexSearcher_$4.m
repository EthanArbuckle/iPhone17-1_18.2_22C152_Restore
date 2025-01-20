@interface OrgApacheLuceneSearchIndexSearcher_$4
- (OrgApacheLuceneSearchIndexSearcher_$4)initWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchFieldDoc:(id)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7;
- (id)newCollector;
- (id)reduceWithJavaUtilCollection:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchIndexSearcher_$4

- (id)newCollector
{
  return OrgApacheLuceneSearchTopFieldCollector_createWithOrgApacheLuceneSearchSort_withInt_withOrgApacheLuceneSearchFieldDoc_withBoolean_withBoolean_withBoolean_(&self->val$sort_->super.isa, self->val$cappedNumHits_, &self->val$after_->super.super.isa, 1, self->val$doDocScores_, self->val$doMaxScore_);
}

- (id)reduceWithJavaUtilCollection:(id)a3
{
  if (!a3) {
LABEL_11:
  }
    JreThrowNullPointerException();
  v5 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)[a3 size], OrgApacheLuceneSearchTopFieldDocs_class_());
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
  return OrgApacheLuceneSearchTopDocs_mergeWithOrgApacheLuceneSearchSort_withInt_withOrgApacheLuceneSearchTopFieldDocsArray_(self->val$sort_, self->val$cappedNumHits_, (uint64_t)v5);
}

- (OrgApacheLuceneSearchIndexSearcher_$4)initWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchFieldDoc:(id)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7
{
  self->val$cappedNumHits_ = a4;
  JreStrongAssign((id *)&self->val$after_, a5);
  self->val$doDocScores_ = a6;
  self->val$doMaxScore_ = a7;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchIndexSearcher__4;
  [(OrgApacheLuceneSearchIndexSearcher_$4 *)&v3 dealloc];
}

@end