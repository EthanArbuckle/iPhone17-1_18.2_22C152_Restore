@interface OrgApacheLuceneSearchScoringRewrite
+ (void)initialize;
- (OrgApacheLuceneSearchScoringRewrite)init;
- (OrgApacheLuceneSearchScoringRewrite)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneSearchMultiTermQuery:(id)a4;
@end

@implementation OrgApacheLuceneSearchScoringRewrite

- (OrgApacheLuceneSearchScoringRewrite)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneSearchMultiTermQuery:(id)a4
{
  return (OrgApacheLuceneSearchScoringRewrite *)sub_1000954FC(self, (uint64_t)a3, a4);
}

- (OrgApacheLuceneSearchScoringRewrite)init
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneSearchScoringRewrite__1 alloc];
    OrgApacheLuceneSearchTermCollectingRewrite_init(v2, v3);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchScoringRewrite_SCORING_BOOLEAN_REWRITE_, v2);
    v4 = [OrgApacheLuceneSearchScoringRewrite__2 alloc];
    OrgApacheLuceneSearchMultiTermQuery_RewriteMethod_init(v4, v5);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchScoringRewrite_CONSTANT_SCORE_BOOLEAN_REWRITE_, v4);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchScoringRewrite__initialized);
  }
}

@end