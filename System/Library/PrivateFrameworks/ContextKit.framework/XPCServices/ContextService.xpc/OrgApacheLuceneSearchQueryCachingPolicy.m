@interface OrgApacheLuceneSearchQueryCachingPolicy
+ (void)initialize;
@end

@implementation OrgApacheLuceneSearchQueryCachingPolicy

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume(&OrgApacheLuceneSearchQueryCachingPolicy_ALWAYS_CACHE_, [OrgApacheLuceneSearchQueryCachingPolicy__1 alloc]);
    atomic_store(1u, OrgApacheLuceneSearchQueryCachingPolicy__initialized);
  }
}

@end