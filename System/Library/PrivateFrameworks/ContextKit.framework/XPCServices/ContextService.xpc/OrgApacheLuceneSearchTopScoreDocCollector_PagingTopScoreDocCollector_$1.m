@interface OrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector_$1
- (OrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector_$1)initWithOrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector_$1

- (void)collectWithInt:(int)a3
{
  scorer = self->super.scorer_;
  if (!scorer) {
    goto LABEL_13;
  }
  [(OrgApacheLuceneSearchScorer *)scorer score];
  ++self->this$0_->super.super.totalHits_;
  v7 = self->this$0_;
  after = v7->after_;
  if (!after) {
    goto LABEL_13;
  }
  float score = after->score_;
  if (v6 > score || v6 == score && self->val$afterDoc_ >= a3) {
    return;
  }
  pqTop = v7->super.pqTop_;
  if (!pqTop) {
    goto LABEL_13;
  }
  if (v6 <= pqTop->score_) {
    return;
  }
  ++v7->collectedHits_;
  self->this$0_->super.pqTop_->doc_ = self->val$docBase_ + a3;
  self->this$0_->super.pqTop_->score_ = v6;
  v11 = self->this$0_;
  pq = v11->super.super.pq_;
  if (!pq) {
LABEL_13:
  }
    JreThrowNullPointerException();
  p_pqTop = (id *)&v11->super.pqTop_;
  id v14 = [(OrgApacheLuceneUtilPriorityQueue *)pq updateTop];
  JreStrongAssign(p_pqTop, v14);
}

- (OrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector_$1)initWithOrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->val$afterDoc_ = a4;
  self->val$docBase_ = a5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopScoreDocCollector_PagingTopScoreDocCollector__1;
  [(OrgApacheLuceneSearchTopScoreDocCollector_ScorerLeafCollector *)&v3 dealloc];
}

@end