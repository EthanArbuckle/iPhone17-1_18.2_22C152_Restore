@interface OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1
- (OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1)initWithOrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer:(id)a3 withOrgApacheLuceneSearchLeafCollector:(id)a4;
- (void)dealloc;
- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3;
@end

@implementation OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1

- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3
{
  in = self->super.in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  v6 = [OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer__1__1 alloc];
  JreStrongAssign((id *)&v6->this$0_, self);
  OrgApacheLuceneSearchFilterScorer_initWithOrgApacheLuceneSearchScorer_((uint64_t)v6, (void **)a3);
  v7 = v6;
  [(OrgApacheLuceneSearchLeafCollector *)in setScorerWithOrgApacheLuceneSearchScorer:v7];
}

- (OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1)initWithOrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer:(id)a3 withOrgApacheLuceneSearchLeafCollector:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer__1;
  [(OrgApacheLuceneSearchFilterLeafCollector *)&v3 dealloc];
}

@end