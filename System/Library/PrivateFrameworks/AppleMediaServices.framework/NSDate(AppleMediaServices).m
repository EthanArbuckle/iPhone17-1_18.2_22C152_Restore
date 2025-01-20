@interface NSDate(AppleMediaServices)
+ (id)ams_momentInUTCGregorianAtYear:()AppleMediaServices month:day:hour:minute:second:;
@end

@implementation NSDate(AppleMediaServices)

+ (id)ams_momentInUTCGregorianAtYear:()AppleMediaServices month:day:hour:minute:second:
{
  id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v15 = *MEMORY[0x1E4F1C318];
  v16 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v14 setCalendar:v16];

  v17 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v14 setTimeZone:v17];

  [v14 setYear:a3];
  [v14 setMonth:a4];
  [v14 setDay:a5];
  [v14 setHour:a6];
  [v14 setMinute:a7];
  [v14 setSecond:a8];
  v18 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v15];
  v19 = [v18 dateFromComponents:v14];

  return v19;
}

@end