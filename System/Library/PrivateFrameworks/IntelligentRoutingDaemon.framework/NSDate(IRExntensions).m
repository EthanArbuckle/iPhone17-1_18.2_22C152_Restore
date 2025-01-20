@interface NSDate(IRExntensions)
+ (uint64_t)daysFromDate:()IRExntensions toDate:;
+ (uint64_t)isDate:()IRExntensions inSameDayAsDate:forTimeZoneInSeconds:;
- (BOOL)isEarlierThan:()IRExntensions;
- (BOOL)isEarlierThanOrEqualTo:()IRExntensions;
- (BOOL)isLaterThan:()IRExntensions;
- (BOOL)isLaterThanOrEqualTo:()IRExntensions;
@end

@implementation NSDate(IRExntensions)

- (BOOL)isEarlierThan:()IRExntensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

+ (uint64_t)isDate:()IRExntensions inSameDayAsDate:forTimeZoneInSeconds:
{
  v7 = (objc_class *)MEMORY[0x263EFF8F0];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  v11 = (void *)[v10 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v12 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:a5];
  [v11 setTimeZone:v12];
  uint64_t v13 = [v11 isDate:v9 inSameDayAsDate:v8];

  return v13;
}

+ (uint64_t)daysFromDate:()IRExntensions toDate:
{
  v5 = (objc_class *)MEMORY[0x263EFF8F0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v10 = [v9 components:16 fromDate:v7 toDate:v6 options:0];

  uint64_t v11 = [v10 day];
  return v11;
}

- (BOOL)isLaterThanOrEqualTo:()IRExntensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)isEarlierThanOrEqualTo:()IRExntensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)isLaterThan:()IRExntensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end