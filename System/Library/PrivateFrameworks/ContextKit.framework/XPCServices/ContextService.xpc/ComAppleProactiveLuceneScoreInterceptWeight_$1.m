@interface ComAppleProactiveLuceneScoreInterceptWeight_$1
- (ComAppleProactiveLuceneScoreInterceptWeight_$1)initWithComAppleProactiveLuceneScoreInterceptWeight:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4 withOrgApacheLuceneSearchScorer:(id)a5 withOrgApacheLuceneSearchScorer:(id)a6 withOrgApacheLuceneSearchWeight:(id)a7;
- (float)score;
- (void)dealloc;
@end

@implementation ComAppleProactiveLuceneScoreInterceptWeight_$1

- (float)score
{
  v2 = self->this$0_;
  if (!v2->target_) {
    JreThrowNullPointerException();
  }
  target = v2->target_;
  -[ComAppleProactiveLuceneScoreInterceptTarget scoreMatchWithOrgApacheLuceneSearchWeight:withOrgApacheLuceneIndexLeafReaderContext:withOrgApacheLuceneSearchScorer:](target, "scoreMatchWithOrgApacheLuceneSearchWeight:withOrgApacheLuceneIndexLeafReaderContext:withOrgApacheLuceneSearchScorer:");
  return result;
}

- (ComAppleProactiveLuceneScoreInterceptWeight_$1)initWithComAppleProactiveLuceneScoreInterceptWeight:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4 withOrgApacheLuceneSearchScorer:(id)a5 withOrgApacheLuceneSearchScorer:(id)a6 withOrgApacheLuceneSearchWeight:(id)a7
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneScoreInterceptWeight__1;
  [(OrgApacheLuceneSearchFilterScorer *)&v3 dealloc];
}

@end