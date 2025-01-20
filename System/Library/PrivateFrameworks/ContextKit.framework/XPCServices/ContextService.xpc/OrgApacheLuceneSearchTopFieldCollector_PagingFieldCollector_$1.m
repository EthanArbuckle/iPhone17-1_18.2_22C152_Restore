@interface OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector_$1
- (OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a5 withIntArray:(id)a6;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector_$1

- (void)collectWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  ++self->this$0_->super.super.totalHits_;
  v5 = self->this$0_;
  if (BYTE1(v5->queue_))
  {
    scorer = self->super.scorer_;
    if (!scorer) {
      goto LABEL_29;
    }
    [(OrgApacheLuceneSearchScorer *)scorer score];
    float v8 = v7;
    v5 = self->this$0_;
    if (v7 > *((float *)&v5->super.super.totalHits_ + 1))
    {
      *((float *)&v5->super.super.totalHits_ + 1) = v7;
      v5 = self->this$0_;
    }
  }
  else
  {
    float v8 = NAN;
  }
  if (!v5->super.queueFull_ || (int)sub_10009AD1C((uint64_t)self, v3) >= 1)
  {
    int v9 = sub_10009AF4C((uint64_t)self, v3);
    if (v9 <= 0 && (v9 || self->val$afterDoc_ < (int)v3))
    {
      v10 = self->this$0_;
      if (v10->super.queueFull_)
      {
        bottom = v10->super.bottom_;
        if (bottom)
        {
          sub_10009AE3C(self, *((unsigned int *)&bottom->super.shardIndex_ + 1), v3);
          v12 = self->this$0_;
          if (!LOBYTE(v12->queue_) || BYTE1(v12->queue_)) {
            goto LABEL_18;
          }
          v13 = self->super.scorer_;
          if (v13)
          {
            [(OrgApacheLuceneSearchScorer *)v13 score];
            float v8 = v14;
            v12 = self->this$0_;
LABEL_18:
            sub_10009A768((uint64_t)v12, v3, v8);
            v15 = self->this$0_->super.bottom_;
LABEL_26:
            uint64_t v24 = *((unsigned int *)&v15->super.shardIndex_ + 1);
            sub_10009AEC8(self, v24);
            return;
          }
        }
      }
      else
      {
        ++*(_DWORD *)(&v10->super.fillFields_ + 3);
        unsigned int v16 = *(_DWORD *)(&self->this$0_->super.fillFields_ + 3) - 1;
        sub_10009AE3C(self, v16, v3);
        v17 = self->this$0_;
        if (LOBYTE(v17->queue_) && !BYTE1(v17->queue_))
        {
          v18 = self->super.scorer_;
          if (!v18) {
            goto LABEL_29;
          }
          [(OrgApacheLuceneSearchScorer *)v18 score];
          float v8 = v19;
          v17 = self->this$0_;
        }
        pq = v17->super.super.pq_;
        if (pq)
        {
          p_bottom = (id *)&v17->super.bottom_;
          id v22 = [(OrgApacheLuceneUtilPriorityQueue *)pq addWithId:new_OrgApacheLuceneSearchFieldValueHitQueue_Entry_initWithInt_withInt_withFloat_(v16, v17->super.docBase_ + (int)v3, v8)];
          JreStrongAssign(p_bottom, v22);
          self->this$0_->super.queueFull_ = *(_DWORD *)(&self->this$0_->super.fillFields_ + 3) == LODWORD(self->this$0_->super.maxScore_);
          v23 = self->this$0_;
          if (!v23->super.queueFull_) {
            return;
          }
          v15 = v23->super.bottom_;
          if (v15) {
            goto LABEL_26;
          }
        }
      }
LABEL_29:
      JreThrowNullPointerException();
    }
  }
}

- (OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector_$1)initWithOrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a5 withIntArray:(id)a6
{
  self->val$afterDoc_ = a4;
  sub_10009AC4C((uint64_t)self, (uint64_t)a5, (unsigned int *)a6);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector__1;
  [(OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector *)&v3 dealloc];
}

@end