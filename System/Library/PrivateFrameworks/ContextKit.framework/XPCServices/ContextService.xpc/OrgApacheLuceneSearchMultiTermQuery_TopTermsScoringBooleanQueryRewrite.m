@interface OrgApacheLuceneSearchMultiTermQuery_TopTermsScoringBooleanQueryRewrite
- (OrgApacheLuceneSearchMultiTermQuery_TopTermsScoringBooleanQueryRewrite)initWithInt:(int)a3;
- (id)buildWithId:(id)a3;
- (id)getTopLevelBuilder;
- (void)addClauseWithId:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4 withInt:(int)a5 withFloat:(float)a6 withOrgApacheLuceneIndexTermContext:(id)a7;
@end

@implementation OrgApacheLuceneSearchMultiTermQuery_TopTermsScoringBooleanQueryRewrite

- (OrgApacheLuceneSearchMultiTermQuery_TopTermsScoringBooleanQueryRewrite)initWithInt:(int)a3
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
  *(float *)&double v10 = a6;
  [(OrgApacheLuceneSearchQuery *)v9 setBoostWithFloat:v10];
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v11 = qword_100563A28;
  objc_msgSend(a3, "addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:", v9, v11);
}

@end