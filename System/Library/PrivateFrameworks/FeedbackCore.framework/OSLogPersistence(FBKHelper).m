@interface OSLogPersistence(FBKHelper)
- (uint64_t)fba_hasValidStartAndEndDates;
@end

@implementation OSLogPersistence(FBKHelper)

- (uint64_t)fba_hasValidStartAndEndDates
{
  uint64_t result = [a1 startDate];
  if (result)
  {
    v3 = (void *)result;
    v4 = [a1 endDate];

    if (v4)
    {
      v5 = [a1 startDate];
      v6 = [a1 endDate];
      uint64_t v7 = [v5 compare:v6];

      return v7 == -1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end