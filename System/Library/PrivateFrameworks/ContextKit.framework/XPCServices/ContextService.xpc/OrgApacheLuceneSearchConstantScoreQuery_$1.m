@interface OrgApacheLuceneSearchConstantScoreQuery_$1
- (OrgApacheLuceneSearchConstantScoreQuery_$1)initWithOrgApacheLuceneSearchConstantScoreQuery:(id)a3 withOrgApacheLuceneSearchWeight:(id)a4 withOrgApacheLuceneSearchQuery:(id)a5;
- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConstantScoreQuery_$1

- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  v4 = self->val$innerWeight_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  id result = [(OrgApacheLuceneSearchWeight *)v4 bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  if (result)
  {
    id v6 = result;
    [(OrgApacheLuceneSearchConstantScoreWeight *)self score];
    float v8 = v7;
    v9 = [OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer alloc];
    OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_initWithOrgApacheLuceneSearchConstantScoreQuery_withOrgApacheLuceneSearchBulkScorer_withOrgApacheLuceneSearchWeight_withFloat_((uint64_t)v9, v8, v10, v6, self);
    return v9;
  }
  return result;
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  v4 = self->val$innerWeight_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  id result = [(OrgApacheLuceneSearchWeight *)v4 scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  if (result)
  {
    id v6 = result;
    [(OrgApacheLuceneSearchConstantScoreWeight *)self score];
    float v8 = v7;
    v9 = [OrgApacheLuceneSearchConstantScoreQuery__1__1 alloc];
    v9->val$score_ = v8;
    JreStrongAssign((id *)&v9->val$innerScorer_, v6);
    OrgApacheLuceneSearchFilterScorer_initWithOrgApacheLuceneSearchScorer_((uint64_t)v9, (void **)v6);
    return v9;
  }
  return result;
}

- (OrgApacheLuceneSearchConstantScoreQuery_$1)initWithOrgApacheLuceneSearchConstantScoreQuery:(id)a3 withOrgApacheLuceneSearchWeight:(id)a4 withOrgApacheLuceneSearchQuery:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery__1;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end