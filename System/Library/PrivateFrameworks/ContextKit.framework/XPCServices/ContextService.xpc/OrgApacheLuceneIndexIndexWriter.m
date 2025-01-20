@interface OrgApacheLuceneIndexIndexWriter
+ (int)getActualMaxDocs;
+ (void)setMaxDocsWithInt:(int)a3;
- (BOOL)getKeepFullyDeletedSegments;
- (BOOL)hasPendingMerges;
- (BOOL)hasUncommittedChanges;
- (BOOL)holdsFullFlushLock;
- (BOOL)isClosed;
- (BOOL)nrtIsCurrentWithOrgApacheLuceneIndexSegmentInfos:(id)a3;
- (BOOL)tryDeleteDocumentWithOrgApacheLuceneIndexIndexReader:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneIndexIndexWriter)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexIndexWriterConfig:(id)a4;
- (id)getCommitData;
- (id)getDirectory;
- (id)getMergingSegments;
- (id)getNextMerge;
- (id)getReader;
- (id)getReaderWithBoolean:(BOOL)a3;
- (id)newSegmentName;
- (id)segString;
- (id)segStringWithJavaLangIterable:(id)a3;
- (id)segStringWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (id)toLiveInfosWithOrgApacheLuceneIndexSegmentInfos:(id)a3;
- (int)maxDoc;
- (int)numDeletedDocsWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (int)purgeWithBoolean:(BOOL)a3;
- (int64_t)ramBytesUsed;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexIndexWriter

- (int)maxDoc
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

+ (void)setMaxDocsWithInt:(int)a3
{
  OrgApacheLuceneIndexIndexWriter_setMaxDocsWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (int)getActualMaxDocs
{
  return dword_10055A360;
}

- (int64_t)ramBytesUsed
{
  return 0;
}

- (OrgApacheLuceneIndexIndexWriter)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexIndexWriterConfig:(id)a4
{
}

- (id)getReader
{
  return [(OrgApacheLuceneIndexIndexWriter *)self getReaderWithBoolean:1];
}

- (id)getReaderWithBoolean:(BOOL)a3
{
  return 0;
}

- (BOOL)isClosed
{
  return 1;
}

- (BOOL)nrtIsCurrentWithOrgApacheLuceneIndexSegmentInfos:(id)a3
{
  return 1;
}

- (BOOL)getKeepFullyDeletedSegments
{
  return 0;
}

- (int)numDeletedDocsWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  return 0;
}

- (id)getMergingSegments
{
  return 0;
}

- (id)segString
{
  return 0;
}

- (id)segStringWithJavaLangIterable:(id)a3
{
  return 0;
}

- (id)segStringWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  return 0;
}

- (id)getDirectory
{
  return 0;
}

- (BOOL)hasUncommittedChanges
{
  return 0;
}

- (BOOL)holdsFullFlushLock
{
  return 0;
}

- (id)newSegmentName
{
  return 0;
}

- (id)getCommitData
{
  return 0;
}

- (id)getNextMerge
{
  return 0;
}

- (BOOL)hasPendingMerges
{
  return 0;
}

- (int)purgeWithBoolean:(BOOL)a3
{
  return 0;
}

- (id)toLiveInfosWithOrgApacheLuceneIndexSegmentInfos:(id)a3
{
  return 0;
}

- (BOOL)tryDeleteDocumentWithOrgApacheLuceneIndexIndexReader:(id)a3 withInt:(int)a4
{
  return 0;
}

- (void)dealloc
{
  JreReleaseVolatile(&self->tragedy_);
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexIndexWriter;
  [(OrgApacheLuceneIndexIndexWriter *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexIndexWriter;
  [(OrgApacheLuceneIndexIndexWriter *)&v3 __javaClone];
  JreRetainVolatile(&self->tragedy_);
}

@end