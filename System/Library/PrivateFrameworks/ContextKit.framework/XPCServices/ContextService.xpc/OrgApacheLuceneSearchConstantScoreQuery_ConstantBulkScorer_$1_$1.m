@interface OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1_$1
- (OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1_$1)initWithOrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4;
- (float)score;
- (int)freq;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1_$1

- (float)score
{
  return self->this$0_->this$0_->theScore_;
}

- (int)freq
{
  return 1;
}

- (OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1_$1)initWithOrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer_$1:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer__1__1;
  [(OrgApacheLuceneSearchFilterScorer *)&v3 dealloc];
}

@end