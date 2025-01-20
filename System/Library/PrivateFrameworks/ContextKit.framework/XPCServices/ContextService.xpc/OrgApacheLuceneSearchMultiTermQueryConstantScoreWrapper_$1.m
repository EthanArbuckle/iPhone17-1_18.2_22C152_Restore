@interface OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_$1
- (BOOL)collectTermsWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withOrgApacheLuceneIndexTermsEnum:(id)a4 withJavaUtilList:(id)a5;
- (OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_$1)initWithOrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5 withOrgApacheLuceneSearchQuery:(id)a6;
- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)rewriteWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)scorerWithOrgApacheLuceneSearchDocIdSet:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_$1

- (BOOL)collectTermsWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withOrgApacheLuceneIndexTermsEnum:(id)a4 withJavaUtilList:(id)a5
{
  return sub_100029584(a4, a5);
}

- (id)rewriteWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  return sub_1000296B0((uint64_t)self, (unsigned int *)a3);
}

- (id)scorerWithOrgApacheLuceneSearchDocIdSet:(id)a3
{
  return sub_100029B04(self, a3);
}

- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  v5 = sub_1000296B0((uint64_t)self, (unsigned int *)a3);
  if (!v5) {
    JreThrowNullPointerException();
  }
  if (v5->weight_)
  {
    weight = v5->weight_;
    return [(OrgApacheLuceneSearchWeight *)weight bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  }
  else
  {
    id result = sub_100029B04(self, v5->set_);
    if (result)
    {
      v8 = new_OrgApacheLuceneSearchWeight_DefaultBulkScorer_initWithOrgApacheLuceneSearchScorer_(result);
      return v8;
    }
  }
  return result;
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  v5 = sub_1000296B0((uint64_t)self, (unsigned int *)a3);
  if (!v5) {
    JreThrowNullPointerException();
  }
  if (v5->weight_)
  {
    weight = v5->weight_;
    return [(OrgApacheLuceneSearchWeight *)weight scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  }
  else
  {
    set = v5->set_;
    return sub_100029B04(self, set);
  }
}

- (OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_$1)initWithOrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5 withOrgApacheLuceneSearchQuery:(id)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper__1;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end