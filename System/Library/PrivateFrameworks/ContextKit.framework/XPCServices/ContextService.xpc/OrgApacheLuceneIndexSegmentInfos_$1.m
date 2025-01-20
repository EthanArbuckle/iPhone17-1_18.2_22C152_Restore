@interface OrgApacheLuceneIndexSegmentInfos_$1
- (OrgApacheLuceneIndexSegmentInfos_$1)initWithOrgApacheLuceneStoreDirectory:(id)a3;
- (id)doBodyWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneIndexSegmentInfos_$1

- (id)doBodyWithNSString:(id)a3
{
  return OrgApacheLuceneIndexSegmentInfos_readCommitWithOrgApacheLuceneStoreDirectory_withNSString_(self->super.directory_, a3);
}

- (OrgApacheLuceneIndexSegmentInfos_$1)initWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return self;
}

@end