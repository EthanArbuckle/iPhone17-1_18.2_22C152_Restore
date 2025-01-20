@interface NSDate(HomeKit)
+ (id)hm_iso8601dateFromString:()HomeKit;
+ (uint64_t)hm_dayOfTheWeek;
@end

@implementation NSDate(HomeKit)

+ (id)hm_iso8601dateFromString:()HomeKit
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  v7 = [v5 dateFromString:v4];

  return v7;
}

+ (uint64_t)hm_dayOfTheWeek
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v1 = (void *)[v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [v1 components:512 fromDate:v2];

  LOBYTE(v2) = [v3 weekday];
  return v2;
}

@end