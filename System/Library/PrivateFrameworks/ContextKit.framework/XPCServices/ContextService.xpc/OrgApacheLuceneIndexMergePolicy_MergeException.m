@interface OrgApacheLuceneIndexMergePolicy_MergeException
- (OrgApacheLuceneIndexMergePolicy_MergeException)initWithJavaLangThrowable:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4;
- (OrgApacheLuceneIndexMergePolicy_MergeException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4;
- (id)getDirectory;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMergePolicy_MergeException

- (OrgApacheLuceneIndexMergePolicy_MergeException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4
{
  return self;
}

- (OrgApacheLuceneIndexMergePolicy_MergeException)initWithJavaLangThrowable:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4
{
  return self;
}

- (id)getDirectory
{
  return self->dir_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMergePolicy_MergeException;
  [(JavaLangThrowable *)&v3 dealloc];
}

@end