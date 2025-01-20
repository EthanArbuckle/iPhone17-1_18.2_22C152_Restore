@interface NSDateComponents(BSTimeUtilities)
- (BOOL)isSameYearAsComponents:()BSTimeUtilities;
- (uint64_t)isSameDayAsComponents:()BSTimeUtilities;
- (uint64_t)isSameMonthAsComponents:()BSTimeUtilities;
@end

@implementation NSDateComponents(BSTimeUtilities)

- (uint64_t)isSameDayAsComponents:()BSTimeUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 day];
  if (v5 == [v4 day]) {
    uint64_t v6 = [a1 isSameMonthAsComponents:v4];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)isSameMonthAsComponents:()BSTimeUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 month];
  if (v5 == [v4 month]) {
    uint64_t v6 = [a1 isSameYearAsComponents:v4];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isSameYearAsComponents:()BSTimeUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 year];
  if (v5 == [v4 year])
  {
    uint64_t v6 = [a1 era];
    BOOL v7 = v6 == [v4 era];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end