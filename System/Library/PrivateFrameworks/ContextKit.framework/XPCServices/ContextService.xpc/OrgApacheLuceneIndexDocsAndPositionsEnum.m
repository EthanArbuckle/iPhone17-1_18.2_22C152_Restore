@interface OrgApacheLuceneIndexDocsAndPositionsEnum
+ (id)unwrapWithOrgApacheLuceneIndexDocsEnum:(id)a3;
+ (id)unwrapliveDocsWithOrgApacheLuceneIndexDocsEnum:(id)a3;
+ (id)wrapWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withOrgApacheLuceneUtilBits:(id)a4;
- (OrgApacheLuceneIndexDocsAndPositionsEnum)init;
@end

@implementation OrgApacheLuceneIndexDocsAndPositionsEnum

- (OrgApacheLuceneIndexDocsAndPositionsEnum)init
{
  return self;
}

+ (id)wrapWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withOrgApacheLuceneUtilBits:(id)a4
{
  return OrgApacheLuceneIndexDocsAndPositionsEnum_wrapWithOrgApacheLuceneIndexPostingsEnum_withOrgApacheLuceneUtilBits_((uint64_t)a3, a4);
}

+ (id)unwrapWithOrgApacheLuceneIndexDocsEnum:(id)a3
{
  return (id)OrgApacheLuceneIndexDocsAndPositionsEnum_unwrapWithOrgApacheLuceneIndexDocsEnum_((uint64_t)a3);
}

+ (id)unwrapliveDocsWithOrgApacheLuceneIndexDocsEnum:(id)a3
{
  return (id)OrgApacheLuceneIndexDocsAndPositionsEnum_unwrapliveDocsWithOrgApacheLuceneIndexDocsEnum_((uint64_t)a3);
}

@end