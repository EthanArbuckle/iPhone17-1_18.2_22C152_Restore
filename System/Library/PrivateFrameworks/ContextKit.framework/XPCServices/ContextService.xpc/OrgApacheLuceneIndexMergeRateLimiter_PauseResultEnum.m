@interface OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum

- (OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NO", 0);
    OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"STOPPED", 1);
    qword_100563808 = (uint64_t)v3;
    v4 = [OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"PAUSED", 2);
    qword_100563810 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexMergeRateLimiter_PauseResultEnum__initialized);
  }
}

@end