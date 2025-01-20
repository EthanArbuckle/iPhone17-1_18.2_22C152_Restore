@interface OrgApacheLuceneSearchScoringRewrite_$2
- (OrgApacheLuceneSearchScoringRewrite_$2)init;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneSearchMultiTermQuery:(id)a4;
@end

@implementation OrgApacheLuceneSearchScoringRewrite_$2

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneSearchMultiTermQuery:(id)a4
{
  if ((atomic_load_explicit(OrgApacheLuceneSearchScoringRewrite__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!OrgApacheLuceneSearchScoringRewrite_SCORING_BOOLEAN_REWRITE_
    || (id v6 = sub_1000954FC((void *)OrgApacheLuceneSearchScoringRewrite_SCORING_BOOLEAN_REWRITE_, (uint64_t)a3, a4),
        v7 = new_OrgApacheLuceneSearchConstantScoreQuery_initWithOrgApacheLuceneSearchQuery_((uint64_t)v6),
        !a4))
  {
    JreThrowNullPointerException();
  }
  v8 = v7;
  [a4 getBoost];
  -[OrgApacheLuceneSearchQuery setBoostWithFloat:](v8, "setBoostWithFloat:");
  return v8;
}

- (OrgApacheLuceneSearchScoringRewrite_$2)init
{
  return self;
}

@end