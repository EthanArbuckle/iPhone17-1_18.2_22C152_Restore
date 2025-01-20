@interface OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments
+ (void)initialize;
- (BOOL)shouldCacheWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4;
- (OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments)initWithInt:(int)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments

- (OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments)initWithInt:(int)a3 withFloat:(float)a4
{
  OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments_initWithInt_withFloat_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v4, v5, v6, v7, v8, a4);
  return self;
}

- (BOOL)shouldCacheWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4
{
  TopLevelContextWithOrgApacheLuceneIndexIndexReaderContext = (void *)OrgApacheLuceneIndexReaderUtil_getTopLevelContextWithOrgApacheLuceneIndexIndexReaderContext_((uint64_t)a4);
  if (!TopLevelContextWithOrgApacheLuceneIndexIndexReaderContext) {
    goto LABEL_9;
  }
  uint64_t v7 = TopLevelContextWithOrgApacheLuceneIndexIndexReaderContext;
  id v8 = [TopLevelContextWithOrgApacheLuceneIndexIndexReaderContext reader];
  if (!v8) {
    goto LABEL_9;
  }
  if ((int)[v8 maxDoc] < self->minIndexSize_) {
    return 0;
  }
  if (!a4
    || (id v10 = [a4 reader]) == 0
    || (int v11 = [v10 maxDoc], (v12 = objc_msgSend(v7, "reader")) == 0))
  {
LABEL_9:
    JreThrowNullPointerException();
  }
  return (float)((float)v11 / (float)(int)[v12 maxDoc]) >= self->minSizeRatio_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments alloc];
    *(void *)&v2->minIndexSize_ = 0x3CF5C28F00002710;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments_DEFAULT_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments__initialized);
  }
}

@end