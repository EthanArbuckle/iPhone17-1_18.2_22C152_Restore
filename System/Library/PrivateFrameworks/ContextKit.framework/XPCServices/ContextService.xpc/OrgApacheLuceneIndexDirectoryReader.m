@interface OrgApacheLuceneIndexDirectoryReader
+ (BOOL)indexExistsWithOrgApacheLuceneStoreDirectory:(id)a3;
+ (id)listCommitsWithOrgApacheLuceneStoreDirectory:(id)a3;
+ (id)openIfChangedWithOrgApacheLuceneIndexDirectoryReader:(id)a3;
+ (id)openIfChangedWithOrgApacheLuceneIndexDirectoryReader:(id)a3 withOrgApacheLuceneIndexIndexCommit:(id)a4;
+ (id)openIfChangedWithOrgApacheLuceneIndexDirectoryReader:(id)a3 withOrgApacheLuceneIndexIndexWriter:(id)a4 withBoolean:(BOOL)a5;
+ (id)openWithOrgApacheLuceneIndexIndexCommit:(id)a3;
+ (id)openWithOrgApacheLuceneIndexIndexWriter:(id)a3 withBoolean:(BOOL)a4;
+ (id)openWithOrgApacheLuceneStoreDirectory:(id)a3;
- (OrgApacheLuceneIndexDirectoryReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexLeafReaderArray:(id)a4;
- (id)directory;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDirectoryReader

+ (id)openWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneIndexStandardDirectoryReader_openWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexIndexCommit_(a3, 0);
}

+ (id)openWithOrgApacheLuceneIndexIndexWriter:(id)a3 withBoolean:(BOOL)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 getReaderWithBoolean:a4];
}

+ (id)openWithOrgApacheLuceneIndexIndexCommit:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 getDirectory];
  return OrgApacheLuceneIndexStandardDirectoryReader_openWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexIndexCommit_(v4, (uint64_t)a3);
}

+ (id)openIfChangedWithOrgApacheLuceneIndexDirectoryReader:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 doOpenIfChanged];
}

+ (id)openIfChangedWithOrgApacheLuceneIndexDirectoryReader:(id)a3 withOrgApacheLuceneIndexIndexCommit:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 doOpenIfChangedWithOrgApacheLuceneIndexIndexCommit:a4];
}

+ (id)openIfChangedWithOrgApacheLuceneIndexDirectoryReader:(id)a3 withOrgApacheLuceneIndexIndexWriter:(id)a4 withBoolean:(BOOL)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 doOpenIfChangedWithOrgApacheLuceneIndexIndexWriter:a4 withBoolean:a5];
}

+ (id)listCommitsWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneIndexDirectoryReader_listCommitsWithOrgApacheLuceneStoreDirectory_(a3);
}

+ (BOOL)indexExistsWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneIndexDirectoryReader_indexExistsWithOrgApacheLuceneStoreDirectory_(a3);
}

- (OrgApacheLuceneIndexDirectoryReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexLeafReaderArray:(id)a4
{
  return self;
}

- (id)directory
{
  return self->directory_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDirectoryReader;
  [(OrgApacheLuceneIndexBaseCompositeReader *)&v3 dealloc];
}

@end