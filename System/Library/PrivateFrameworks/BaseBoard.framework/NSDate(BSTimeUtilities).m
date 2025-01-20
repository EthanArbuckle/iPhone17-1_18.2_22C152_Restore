@interface NSDate(BSTimeUtilities)
- (BOOL)isAfterDate:()BSTimeUtilities;
- (BOOL)isBeforeDate:()BSTimeUtilities;
@end

@implementation NSDate(BSTimeUtilities)

- (BOOL)isAfterDate:()BSTimeUtilities
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 compare:v4] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isBeforeDate:()BSTimeUtilities
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 compare:v4] == -1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end