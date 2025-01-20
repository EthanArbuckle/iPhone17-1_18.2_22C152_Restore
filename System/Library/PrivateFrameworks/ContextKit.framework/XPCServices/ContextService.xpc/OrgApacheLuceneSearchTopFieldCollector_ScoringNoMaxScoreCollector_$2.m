@interface OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$2
- (OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$2)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a4 withIntArray:(id)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$2

- (void)collectWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ++self->this$0_->super.super.totalHits_;
  if (self->this$0_->super.queueFull_)
  {
    if ((int)sub_10009AD1C((uint64_t)self, *(uint64_t *)&a3) < 1) {
      return;
    }
    scorer = self->super.scorer_;
    if (scorer)
    {
      [(OrgApacheLuceneSearchScorer *)scorer score];
      bottom = self->this$0_->super.bottom_;
      if (bottom)
      {
        float v8 = v6;
        sub_10009AE3C(self, *((unsigned int *)&bottom->super.shardIndex_ + 1), v3);
        sub_10009A768((uint64_t)self->this$0_, v3, v8);
        v9 = self->this$0_->super.bottom_;
        goto LABEL_9;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  v10 = self->super.scorer_;
  if (!v10) {
    goto LABEL_13;
  }
  [(OrgApacheLuceneSearchScorer *)v10 score];
  float v12 = v11;
  unsigned int v13 = self->this$0_->super.super.totalHits_ - 1;
  sub_10009AE3C(self, v13, v3);
  sub_10009A618((uint64_t)self->this$0_, v13, v3, v12);
  v14 = self->this$0_;
  if (!v14->super.queueFull_) {
    return;
  }
  v9 = v14->super.bottom_;
  if (!v9) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v15 = *((unsigned int *)&v9->super.shardIndex_ + 1);
  sub_10009AEC8(self, v15);
}

- (OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$2)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a4 withIntArray:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector__2;
  [(OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector *)&v3 dealloc];
}

@end