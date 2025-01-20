@interface OrgApacheLuceneIndexStandardDirectoryReader_$1
- (OrgApacheLuceneIndexStandardDirectoryReader_$1)initWithOrgApacheLuceneStoreDirectory:(id)a3;
- (id)doBodyWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneIndexStandardDirectoryReader_$1

- (id)doBodyWithNSString:(id)a3
{
  CommitWithOrgApacheLuceneStoreDirectory_withNSString = OrgApacheLuceneIndexSegmentInfos_readCommitWithOrgApacheLuceneStoreDirectory_withNSString_(self->super.directory_, a3);
  if (!CommitWithOrgApacheLuceneStoreDirectory_withNSString) {
    JreThrowNullPointerException();
  }
  v5 = CommitWithOrgApacheLuceneStoreDirectory_withNSString;
  v6 = +[IOSObjectArray arrayWithLength:[(OrgApacheLuceneIndexSegmentInfos *)CommitWithOrgApacheLuceneStoreDirectory_withNSString size] type:OrgApacheLuceneIndexSegmentReader_class_()];
  uint64_t v7 = [(OrgApacheLuceneIndexSegmentInfos *)v5 size] - 1;
  while ((v7 & 0x80000000) == 0)
  {
    v8 = [(OrgApacheLuceneIndexSegmentInfos *)v5 infoWithInt:v7];
    if ((atomic_load_explicit(OrgApacheLuceneStoreIOContext__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v9 = new_OrgApacheLuceneIndexSegmentReader_initWithOrgApacheLuceneIndexSegmentCommitInfo_withOrgApacheLuceneStoreIOContext_(v8, (void *)OrgApacheLuceneStoreIOContext_READ_);
    uint64_t v10 = v7;
    uint64_t v7 = (v7 - 1);
    IOSObjectArray_SetAndConsume((uint64_t)v6, v10, v9);
  }
  directory = self->super.directory_;
  v12 = [OrgApacheLuceneIndexStandardDirectoryReader alloc];
  OrgApacheLuceneIndexStandardDirectoryReader_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexLeafReaderArray_withOrgApacheLuceneIndexIndexWriter_withOrgApacheLuceneIndexSegmentInfos_withBoolean_((uint64_t)v12, directory, v6, 0, v5, 0);
  return v12;
}

- (OrgApacheLuceneIndexStandardDirectoryReader_$1)initWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return self;
}

@end