@interface OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$1
- (OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparator:(id)a4 withInt:(int)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$1

- (void)collectWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ++self->this$0_->super.super.totalHits_;
  if (self->this$0_->super.queueFull_)
  {
    p_comparator = &self->super.comparator_;
    comparator = self->super.comparator_;
    if (comparator)
    {
      int reverseMul = self->super.reverseMul_;
      if ((int)([(OrgApacheLuceneSearchLeafFieldComparator *)comparator compareBottomWithInt:*(void *)&a3]* reverseMul) < 1)return; {
      scorer = self->super.scorer_;
      }
      if (scorer)
      {
        [(OrgApacheLuceneSearchScorer *)scorer score];
        bottom = self->this$0_->super.bottom_;
        if (bottom)
        {
          float v11 = v9;
          [(OrgApacheLuceneSearchLeafFieldComparator *)self->super.comparator_ copy__WithInt:*((unsigned int *)&bottom->super.shardIndex_ + 1) withInt:v3];
          sub_10009A768((uint64_t)self->this$0_, v3, v11);
          v12 = self->this$0_->super.bottom_;
          goto LABEL_11;
        }
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  v13 = self->super.scorer_;
  if (!v13) {
    goto LABEL_15;
  }
  [(OrgApacheLuceneSearchScorer *)v13 score];
  p_comparator = &self->super.comparator_;
  v15 = self->super.comparator_;
  if (!v15) {
    goto LABEL_15;
  }
  float v16 = v14;
  unsigned int v17 = self->this$0_->super.super.totalHits_ - 1;
  [(OrgApacheLuceneSearchLeafFieldComparator *)v15 copy__WithInt:v17 withInt:v3];
  sub_10009A618((uint64_t)self->this$0_, v17, v3, v16);
  v18 = self->this$0_;
  if (!v18->super.queueFull_) {
    return;
  }
  v12 = v18->super.bottom_;
  if (!v12) {
    goto LABEL_15;
  }
LABEL_11:
  v19 = *p_comparator;
  uint64_t v20 = *((unsigned int *)&v12->super.shardIndex_ + 1);
  [(OrgApacheLuceneSearchLeafFieldComparator *)v19 setBottomWithInt:v20];
}

- (OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparator:(id)a4 withInt:(int)a5
{
  self->super.reverseMul_ = a5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_ScoringNoMaxScoreCollector__1;
  [(OrgApacheLuceneSearchTopFieldCollector_OneComparatorLeafCollector *)&v3 dealloc];
}

@end