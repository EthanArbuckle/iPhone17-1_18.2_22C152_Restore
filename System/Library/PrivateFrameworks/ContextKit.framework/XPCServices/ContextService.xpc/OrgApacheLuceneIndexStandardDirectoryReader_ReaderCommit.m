@interface OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit
- (BOOL)isDeleted;
- (OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit)initWithOrgApacheLuceneIndexStandardDirectoryReader:(id)a3 withOrgApacheLuceneIndexSegmentInfos:(id)a4 withOrgApacheLuceneStoreDirectory:(id)a5;
- (id)description;
- (id)getDirectory;
- (id)getFileNames;
- (id)getReader;
- (id)getSegmentsFileName;
- (id)getUserData;
- (int)getSegmentCount;
- (int64_t)getGeneration;
- (void)dealloc;
- (void)delete__;
@end

@implementation OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit

- (OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit)initWithOrgApacheLuceneIndexStandardDirectoryReader:(id)a3 withOrgApacheLuceneIndexSegmentInfos:(id)a4 withOrgApacheLuceneStoreDirectory:(id)a5
{
  return self;
}

- (id)description
{
  return (id)JreStrcat("$$C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"DirectoryReader.ReaderCommit(");
}

- (int)getSegmentCount
{
  return self->segmentCount_;
}

- (id)getSegmentsFileName
{
  return self->segmentsFileName_;
}

- (id)getFileNames
{
  return self->files_;
}

- (id)getDirectory
{
  return self->dir_;
}

- (int64_t)getGeneration
{
  return self->generation_;
}

- (BOOL)isDeleted
{
  return 0;
}

- (id)getUserData
{
  return self->userData_;
}

- (void)delete__
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"This IndexCommit does not support deletions");
  objc_exception_throw(v2);
}

- (id)getReader
{
  return self->reader_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit;
  [(OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit *)&v3 dealloc];
}

@end