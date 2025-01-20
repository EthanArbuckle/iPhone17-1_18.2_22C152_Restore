@interface OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$2
- (OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$2)initWithOrgApacheLuceneSearchTopFieldCollector_NonScoringCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a4 withIntArray:(id)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$2

- (void)collectWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ++self->this$0_->super.super.totalHits_;
  v5 = self->this$0_;
  if (v5->super.queueFull_)
  {
    if ((int)sub_10009AD1C((uint64_t)self, *(uint64_t *)&a3) < 1) {
      return;
    }
    bottom = self->this$0_->super.bottom_;
    if (bottom)
    {
      sub_10009AE3C(self, *((unsigned int *)&bottom->super.shardIndex_ + 1), v3);
      sub_10009A6D4((uint64_t)self->this$0_, v3);
      v7 = self->this$0_->super.bottom_;
      goto LABEL_7;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  unsigned int v8 = v5->super.super.totalHits_ - 1;
  sub_10009AE3C(self, v8, *(uint64_t *)&a3);
  sub_10009A618((uint64_t)self->this$0_, v8, v3, NAN);
  v9 = self->this$0_;
  if (!v9->super.queueFull_) {
    return;
  }
  v7 = v9->super.bottom_;
  if (!v7) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v10 = *((unsigned int *)&v7->super.shardIndex_ + 1);
  sub_10009AEC8(self, v10);
}

- (OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector_$2)initWithOrgApacheLuceneSearchTopFieldCollector_NonScoringCollector:(id)a3 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a4 withIntArray:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector__2;
  [(OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector *)&v3 dealloc];
}

@end