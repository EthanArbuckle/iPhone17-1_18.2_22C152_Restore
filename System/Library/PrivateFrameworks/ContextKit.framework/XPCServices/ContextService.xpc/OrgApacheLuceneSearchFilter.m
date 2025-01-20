@interface OrgApacheLuceneSearchFilter
- (OrgApacheLuceneSearchFilter)init;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
@end

@implementation OrgApacheLuceneSearchFilter

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgApacheLuceneSearchFilteredQuery__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  v4 = (void *)OrgApacheLuceneSearchFilteredQuery_RANDOM_ACCESS_FILTER_STRATEGY_;
  }
  if (!OrgApacheLuceneSearchFilteredQuery_RANDOM_ACCESS_FILTER_STRATEGY_) {
    JreThrowNullPointerException();
  }
  return [v4 rewriteWithOrgApacheLuceneSearchFilter:self];
}

- (OrgApacheLuceneSearchFilter)init
{
  return self;
}

@end