@interface NSNumber(DNDSDateHelper)
+ (id)dnds_safeNumberWithDate:()DNDSDateHelper;
+ (uint64_t)dnds_numberWithDate:()DNDSDateHelper;
- (uint64_t)dnds_dateValue;
@end

@implementation NSNumber(DNDSDateHelper)

+ (uint64_t)dnds_numberWithDate:()DNDSDateHelper
{
  v3 = NSNumber;
  [a3 timeIntervalSinceReferenceDate];
  return objc_msgSend(v3, "numberWithDouble:");
}

+ (id)dnds_safeNumberWithDate:()DNDSDateHelper
{
  if (a3)
  {
    v4 = objc_msgSend(a1, "dnds_numberWithDate:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)dnds_dateValue
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 doubleValue];
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

@end