@interface OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$1
- (OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_NonScoringCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparator:(id)a4 withInt:(int)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$1

- (void)collectWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ++self->this$0_->super.super.totalHits_;
  v5 = self->this$0_;
  comparator = self->super.comparator_;
  if (v5->super.queueFull_)
  {
    if (comparator)
    {
      int reverseMul = self->super.reverseMul_;
      if ((int)([(OrgApacheLuceneSearchLeafFieldComparator *)comparator compareBottomWithInt:*(void *)&a3]* reverseMul) < 1)return; {
      bottom = self->this$0_->super.bottom_;
      }
      if (bottom)
      {
        [(OrgApacheLuceneSearchLeafFieldComparator *)self->super.comparator_ copy__WithInt:*((unsigned int *)&bottom->super.shardIndex_ + 1) withInt:v3];
        sub_10009A6D4((uint64_t)self->this$0_, v3);
        v9 = self->this$0_->super.bottom_;
        goto LABEL_9;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!comparator) {
    goto LABEL_13;
  }
  unsigned int v10 = v5->super.super.totalHits_ - 1;
  [(OrgApacheLuceneSearchLeafFieldComparator *)comparator copy__WithInt:v10 withInt:*(void *)&a3];
  sub_10009A618((uint64_t)self->this$0_, v10, v3, NAN);
  v11 = self->this$0_;
  if (!v11->super.queueFull_) {
    return;
  }
  v9 = v11->super.bottom_;
  if (!v9) {
    goto LABEL_13;
  }
LABEL_9:
  v12 = self->super.comparator_;
  uint64_t v13 = *((unsigned int *)&v9->super.shardIndex_ + 1);
  [(OrgApacheLuceneSearchLeafFieldComparator *)v12 setBottomWithInt:v13];
}

- (OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_NonScoringCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparator:(id)a4 withInt:(int)a5
{
  self->super.reverseMul_ = a5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector__1;
  [(OrgApacheLuceneSearchTopFieldCollector_OneComparatorLeafCollector *)&v3 dealloc];
}

@end