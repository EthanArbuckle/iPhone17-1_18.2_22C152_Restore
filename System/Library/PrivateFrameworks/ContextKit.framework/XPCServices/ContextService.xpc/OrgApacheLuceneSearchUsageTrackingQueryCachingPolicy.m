@interface OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy
+ (BOOL)isCheapWithOrgApacheLuceneSearchQuery:(id)a3;
+ (BOOL)isCostlyWithOrgApacheLuceneSearchQuery:(id)a3;
- (BOOL)shouldCacheWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4;
- (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy)init;
- (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy)initWithInt:(int)a3 withFloat:(float)a4 withInt:(int)a5;
- (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy)initWithOrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments:(id)a3 withInt:(int)a4;
- (int)frequencyWithOrgApacheLuceneSearchQuery:(id)a3;
- (int)minFrequencyToCacheWithOrgApacheLuceneSearchQuery:(id)a3;
- (void)dealloc;
- (void)onUseWithOrgApacheLuceneSearchQuery:(id)a3;
@end

@implementation OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy

+ (BOOL)isCostlyWithOrgApacheLuceneSearchQuery:(id)a3
{
  return OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy_isCostlyWithOrgApacheLuceneSearchQuery_();
}

+ (BOOL)isCheapWithOrgApacheLuceneSearchQuery:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy)initWithInt:(int)a3 withFloat:(float)a4 withInt:(int)a5
{
  v7 = new_OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments_initWithInt_withFloat_(*(uint64_t *)&a3, a4);
  sub_100075CE4((uint64_t)self, v7, a5);
  return self;
}

- (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy)init
{
  return self;
}

- (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy)initWithOrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments:(id)a3 withInt:(int)a4
{
  return self;
}

- (int)minFrequencyToCacheWithOrgApacheLuceneSearchQuery:(id)a3
{
  if (OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy_isCostlyWithOrgApacheLuceneSearchQuery_()) {
    return 2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 20;
  }
  else {
    return 5;
  }
}

- (void)onUseWithOrgApacheLuceneSearchQuery:(id)a3
{
  v4 = sub_100075E14(a3);
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [v4 hash];
  objc_sync_enter(self);
  recentlyUsedFilters = self->recentlyUsedFilters_;
  if (!recentlyUsedFilters) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer *)recentlyUsedFilters addWithInt:v5];
  objc_sync_exit(self);
}

- (int)frequencyWithOrgApacheLuceneSearchQuery:(id)a3
{
  v4 = sub_100075E14(a3);
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [v4 hash];
  objc_sync_enter(self);
  recentlyUsedFilters = self->recentlyUsedFilters_;
  if (!recentlyUsedFilters) {
    JreThrowNullPointerException();
  }
  int v7 = [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer *)recentlyUsedFilters frequencyWithInt:v5];
  objc_sync_exit(self);
  return v7;
}

- (BOOL)shouldCacheWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4
{
  segmentPolicy = self->segmentPolicy_;
  if (!segmentPolicy) {
    JreThrowNullPointerException();
  }
  unsigned int v7 = [(OrgApacheLuceneSearchQueryCachingPolicy_CacheOnLargeSegments *)segmentPolicy shouldCacheWithOrgApacheLuceneSearchQuery:a3 withOrgApacheLuceneIndexLeafReaderContext:a4];
  if (v7)
  {
    int v8 = [(OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy *)self frequencyWithOrgApacheLuceneSearchQuery:a3];
    LOBYTE(v7) = v8 >= [(OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy *)self minFrequencyToCacheWithOrgApacheLuceneSearchQuery:a3];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy;
  [(OrgApacheLuceneSearchUsageTrackingQueryCachingPolicy *)&v3 dealloc];
}

@end