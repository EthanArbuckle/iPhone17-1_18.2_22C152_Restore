@interface NSDate(CPAnalytics)
+ (uint64_t)cpa_daysAgo:()CPAnalytics;
+ (uint64_t)cpa_hoursAgo:()CPAnalytics;
+ (uint64_t)cpa_minutesAgo:()CPAnalytics;
+ (uint64_t)cpa_secondsAgo:()CPAnalytics;
+ (uint64_t)cpa_yearsAgo:()CPAnalytics;
@end

@implementation NSDate(CPAnalytics)

+ (uint64_t)cpa_secondsAgo:()CPAnalytics
{
  return [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a1];
}

+ (uint64_t)cpa_minutesAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x263EFF910], "cpa_secondsAgo:", a1 * 60.0);
}

+ (uint64_t)cpa_hoursAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x263EFF910], "cpa_minutesAgo:", a1 * 60.0);
}

+ (uint64_t)cpa_daysAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x263EFF910], "cpa_hoursAgo:", a1 * 24.0);
}

+ (uint64_t)cpa_yearsAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x263EFF910], "cpa_daysAgo:", a1 * 365.0);
}

@end