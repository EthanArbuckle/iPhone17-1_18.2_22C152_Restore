@interface OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$2
- (OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$2)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a4 withIntArray:(id)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$2

- (void)collectWithInt:(int)a3
{
  scorer = self->super.scorer_;
  if (!scorer) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&a3;
  [(OrgApacheLuceneSearchScorer *)scorer score];
  float v7 = v6;
  v8 = self->this$0_;
  if (v6 > *((float *)&v8->super.super.totalHits_ + 1))
  {
    *((float *)&v8->super.super.totalHits_ + 1) = v6;
    v8 = self->this$0_;
  }
  ++v8->super.super.totalHits_;
  v9 = self->this$0_;
  if (v9->super.queueFull_)
  {
    if ((int)sub_10009AD1C((uint64_t)self, v5) < 1) {
      return;
    }
    bottom = self->this$0_->super.bottom_;
    if (bottom)
    {
      sub_10009AE3C(self, *((unsigned int *)&bottom->super.shardIndex_ + 1), v5);
      sub_10009A768((uint64_t)self->this$0_, v5, v7);
      v11 = self->this$0_->super.bottom_;
      goto LABEL_10;
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  unsigned int v12 = v9->super.super.totalHits_ - 1;
  sub_10009AE3C(self, v12, v5);
  sub_10009A618((uint64_t)self->this$0_, v12, v5, v7);
  v13 = self->this$0_;
  if (!v13->super.queueFull_) {
    return;
  }
  v11 = v13->super.bottom_;
  if (!v11) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v14 = *((unsigned int *)&v11->super.shardIndex_ + 1);
  sub_10009AEC8(self, v14);
}

- (OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$2)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a4 withIntArray:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector__2;
  [(OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector *)&v3 dealloc];
}

@end