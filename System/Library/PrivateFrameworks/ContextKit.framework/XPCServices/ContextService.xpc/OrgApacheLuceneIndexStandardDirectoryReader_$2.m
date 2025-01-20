@interface OrgApacheLuceneIndexStandardDirectoryReader_$2
- (OrgApacheLuceneIndexStandardDirectoryReader_$2)initWithOrgApacheLuceneIndexStandardDirectoryReader:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4;
- (id)doBodyWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexStandardDirectoryReader_$2

- (id)doBodyWithNSString:(id)a3
{
  CommitWithOrgApacheLuceneStoreDirectory_withNSString = OrgApacheLuceneIndexSegmentInfos_readCommitWithOrgApacheLuceneStoreDirectory_withNSString_(self->super.directory_, a3);
  v5 = self->this$0_;
  return [(OrgApacheLuceneIndexStandardDirectoryReader *)v5 doOpenIfChangedWithOrgApacheLuceneIndexSegmentInfos:CommitWithOrgApacheLuceneStoreDirectory_withNSString];
}

- (OrgApacheLuceneIndexStandardDirectoryReader_$2)initWithOrgApacheLuceneIndexStandardDirectoryReader:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexStandardDirectoryReader__2;
  [(OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile *)&v3 dealloc];
}

@end