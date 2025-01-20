@interface OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$1
- (OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparator:(id)a4 withInt:(int)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$1

- (void)collectWithInt:(int)a3
{
  scorer = self->super.scorer_;
  if (!scorer) {
    goto LABEL_16;
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
  comparator = self->super.comparator_;
  if (v9->super.queueFull_)
  {
    if (comparator)
    {
      int reverseMul = self->super.reverseMul_;
      if ((int)([(OrgApacheLuceneSearchLeafFieldComparator *)comparator compareBottomWithInt:v5]* reverseMul) < 1)return; {
      bottom = self->this$0_->super.bottom_;
      }
      if (bottom)
      {
        [(OrgApacheLuceneSearchLeafFieldComparator *)self->super.comparator_ copy__WithInt:*((unsigned int *)&bottom->super.shardIndex_ + 1) withInt:v5];
        sub_10009A768((uint64_t)self->this$0_, v5, v7);
        v13 = self->this$0_->super.bottom_;
        goto LABEL_12;
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  if (!comparator) {
    goto LABEL_16;
  }
  unsigned int v14 = v9->super.super.totalHits_ - 1;
  [(OrgApacheLuceneSearchLeafFieldComparator *)comparator copy__WithInt:v14 withInt:v5];
  sub_10009A618((uint64_t)self->this$0_, v14, v5, v7);
  v15 = self->this$0_;
  if (!v15->super.queueFull_) {
    return;
  }
  v13 = v15->super.bottom_;
  if (!v13) {
    goto LABEL_16;
  }
LABEL_12:
  v16 = self->super.comparator_;
  uint64_t v17 = *((unsigned int *)&v13->super.shardIndex_ + 1);
  [(OrgApacheLuceneSearchLeafFieldComparator *)v16 setBottomWithInt:v17];
}

- (OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparator:(id)a4 withInt:(int)a5
{
  self->super.reverseMul_ = a5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_ScoringMaxScoreCollector__1;
  [(OrgApacheLuceneSearchTopFieldCollector_OneComparatorLeafCollector *)&v3 dealloc];
}

@end