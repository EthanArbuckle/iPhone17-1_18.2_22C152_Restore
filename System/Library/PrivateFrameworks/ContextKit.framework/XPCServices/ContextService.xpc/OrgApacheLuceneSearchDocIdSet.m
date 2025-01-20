@interface OrgApacheLuceneSearchDocIdSet
+ (void)initialize;
- (BOOL)isCacheable;
- (id)bits;
@end

@implementation OrgApacheLuceneSearchDocIdSet

- (id)bits
{
  return 0;
}

- (BOOL)isCacheable
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume(&OrgApacheLuceneSearchDocIdSet_EMPTY_, [OrgApacheLuceneSearchDocIdSet__1 alloc]);
    atomic_store(1u, OrgApacheLuceneSearchDocIdSet__initialized);
  }
}

@end