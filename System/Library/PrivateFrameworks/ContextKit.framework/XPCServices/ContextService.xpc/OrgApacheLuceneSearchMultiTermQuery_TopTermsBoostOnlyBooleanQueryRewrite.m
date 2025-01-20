@interface OrgApacheLuceneSearchMultiTermQuery_TopTermsBoostOnlyBooleanQueryRewrite
- (OrgApacheLuceneSearchMultiTermQuery_TopTermsBoostOnlyBooleanQueryRewrite)initWithInt:(int)a3;
- (id)buildWithId:(id)a3;
- (id)getTopLevelBuilder;
- (void)addClauseWithId:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4 withInt:(int)a5 withFloat:(float)a6 withOrgApacheLuceneIndexTermContext:(id)a7;
@end

@implementation OrgApacheLuceneSearchMultiTermQuery_TopTermsBoostOnlyBooleanQueryRewrite

- (OrgApacheLuceneSearchMultiTermQuery_TopTermsBoostOnlyBooleanQueryRewrite)initWithInt:(int)a3
{
  return self;
}

- (id)getTopLevelBuilder
{
  v2 = new_OrgApacheLuceneSearchBooleanQuery_Builder_init();
  [(OrgApacheLuceneSearchBooleanQuery_Builder *)v2 setDisableCoordWithBoolean:1];
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
  v9 = new_OrgApacheLuceneSearchTermQuery_initWithOrgApacheLuceneIndexTerm_withOrgApacheLuceneIndexTermContext_((uint64_t)a4, a7);
  v10 = new_OrgApacheLuceneSearchConstantScoreQuery_initWithOrgApacheLuceneSearchQuery_((uint64_t)v9);
  *(float *)&double v11 = a6;
  [(OrgApacheLuceneSearchQuery *)v10 setBoostWithFloat:v11];
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v12 = qword_100563A28;
  objc_msgSend(a3, "addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:", v10, v12);
}

@end