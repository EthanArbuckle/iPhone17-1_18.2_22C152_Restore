@interface OrgApacheLuceneSearchMultiTermQuery_TopTermsBlendedFreqScoringRewrite
- (OrgApacheLuceneSearchMultiTermQuery_TopTermsBlendedFreqScoringRewrite)initWithInt:(int)a3;
- (id)buildWithId:(id)a3;
- (id)getTopLevelBuilder;
- (void)addClauseWithId:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4 withInt:(int)a5 withFloat:(float)a6 withOrgApacheLuceneIndexTermContext:(id)a7;
@end

@implementation OrgApacheLuceneSearchMultiTermQuery_TopTermsBlendedFreqScoringRewrite

- (OrgApacheLuceneSearchMultiTermQuery_TopTermsBlendedFreqScoringRewrite)initWithInt:(int)a3
{
  return self;
}

- (id)getTopLevelBuilder
{
  v2 = new_OrgApacheLuceneSearchBlendedTermQuery_Builder_init();
  if ((atomic_load_explicit(OrgApacheLuceneSearchBlendedTermQuery__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(OrgApacheLuceneSearchBlendedTermQuery_Builder *)v2 setRewriteMethodWithOrgApacheLuceneSearchBlendedTermQuery_RewriteMethod:OrgApacheLuceneSearchBlendedTermQuery_BOOLEAN_REWRITE_];
  return v2;
}

- (id)buildWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 build];
}

- (void)addClauseWithId:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4 withInt:(int)a5 withFloat:(float)a6 withOrgApacheLuceneIndexTermContext:(id)a7
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 addWithOrgApacheLuceneIndexTerm:a4 withFloat:a7 withOrgApacheLuceneIndexTermContext:*(void *)&a5];
}

@end