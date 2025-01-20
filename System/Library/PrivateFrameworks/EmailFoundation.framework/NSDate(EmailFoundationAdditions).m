@interface NSDate(EmailFoundationAdditions)
+ (id)_ef_gregorianCalendarForTimeZone:()EmailFoundationAdditions;
+ (id)_ef_morningDateComponents;
+ (id)_ef_nightDateComponents;
+ (id)ef_dateHoursAgo:()EmailFoundationAdditions;
+ (id)ef_inOneHour;
+ (id)ef_localCombinedDate:()EmailFoundationAdditions time:timeZone:;
+ (id)ef_midnightInNdays:()EmailFoundationAdditions;
+ (id)ef_morning;
+ (id)ef_nextWeekMorning;
+ (id)ef_thisWeekday:()EmailFoundationAdditions hour:minute:second:;
+ (id)ef_tomorrowMorning;
+ (id)ef_tomorrowNight;
+ (id)ef_tonight;
+ (uint64_t)ef_lastWeekMidnight;
+ (uint64_t)ef_midnightNdaysAgo:()EmailFoundationAdditions;
- (BOOL)ef_isEarlierThanDate:()EmailFoundationAdditions;
- (BOOL)ef_isEarlierThanNow;
- (BOOL)ef_isEarlierThanOrEqualDate:()EmailFoundationAdditions;
- (BOOL)ef_isLaterThanDate:()EmailFoundationAdditions;
- (BOOL)ef_isLaterThanNow;
- (BOOL)ef_isLaterThanOrEqualDate:()EmailFoundationAdditions;
- (BOOL)ef_isMoreThanTimeIntervalAgo:()EmailFoundationAdditions;
- (double)ef_timeIntervalSinceDate:()EmailFoundationAdditions;
- (id)ef_dateWithTruncatedSeconds;
- (uint64_t)ef_isDateNextDayOrLater:()EmailFoundationAdditions;
@end

@implementation NSDate(EmailFoundationAdditions)

- (BOOL)ef_isEarlierThanDate:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (double)ef_timeIntervalSinceDate:()EmailFoundationAdditions
{
  id v4 = a3;
  if (v4)
  {
    [a1 timeIntervalSinceDate:v4];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)ef_isMoreThanTimeIntervalAgo:()EmailFoundationAdditions
{
  [a1 timeIntervalSinceNow];
  return -v3 > a2;
}

- (BOOL)ef_isEarlierThanOrEqualDate:()EmailFoundationAdditions
{
  return (unint64_t)(objc_msgSend(a1, "compare:") + 1) < 2;
}

- (BOOL)ef_isLaterThanDate:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)ef_isLaterThanOrEqualDate:()EmailFoundationAdditions
{
  return (unint64_t)objc_msgSend(a1, "compare:") < 2;
}

- (BOOL)ef_isEarlierThanNow
{
  [a1 timeIntervalSinceNow];
  return v1 < 0.0;
}

- (BOOL)ef_isLaterThanNow
{
  [a1 timeIntervalSinceNow];
  return v1 > 0.0;
}

- (uint64_t)ef_isDateNextDayOrLater:()EmailFoundationAdditions
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  double v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  double v6 = objc_msgSend(v4, "_ef_gregorianCalendarForTimeZone:", v5);

  v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = [v6 dateByAddingUnit:16 value:1 toDate:v7 options:0];

  v9 = [v6 dateBySettingHour:0 minute:0 second:0 ofDate:v8 options:0];
  uint64_t v10 = objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", v9);

  return v10;
}

+ (uint64_t)ef_lastWeekMidnight
{
  return objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightNdaysAgo:", 7);
}

+ (id)ef_morning
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v3 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);

  id v4 = objc_msgSend(a1, "_ef_morningDateComponents");
  uint64_t v5 = [v4 hour];
  uint64_t v6 = [v4 minute];
  uint64_t v7 = [v4 second];
  v8 = [MEMORY[0x1E4F1C9C8] now];
  v9 = [v3 dateBySettingHour:v5 minute:v6 second:v7 ofDate:v8 options:0];

  return v9;
}

+ (id)ef_tonight
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v3 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);

  id v4 = objc_msgSend(a1, "_ef_nightDateComponents");
  uint64_t v5 = [v4 hour];
  uint64_t v6 = [v4 minute];
  uint64_t v7 = [v4 second];
  v8 = [MEMORY[0x1E4F1C9C8] now];
  v9 = [v3 dateBySettingHour:v5 minute:v6 second:v7 ofDate:v8 options:0];

  return v9;
}

+ (id)ef_inOneHour
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v3 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);

  id v4 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v5 = [v3 dateByAddingUnit:64 value:60 toDate:v4 options:0];

  return v5;
}

+ (id)ef_tomorrowNight
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v3 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);

  id v4 = objc_msgSend(a1, "_ef_nightDateComponents");
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v3 dateByAddingUnit:16 value:1 toDate:v5 options:0];

  uint64_t v7 = objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6, 0);

  return v7;
}

+ (id)ef_tomorrowMorning
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v3 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);

  id v4 = objc_msgSend(a1, "_ef_morningDateComponents");
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v3 dateByAddingUnit:16 value:1 toDate:v5 options:0];

  uint64_t v7 = objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6, 0);

  return v7;
}

+ (id)ef_nextWeekMorning
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v3 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v2);

  id v4 = objc_msgSend(a1, "_ef_morningDateComponents");
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v3 dateByAddingUnit:16 value:7 toDate:v5 options:0];

  uint64_t v7 = objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6, 0);

  return v7;
}

+ (uint64_t)ef_midnightNdaysAgo:()EmailFoundationAdditions
{
  return objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightInNdays:", -a3);
}

+ (id)ef_midnightInNdays:()EmailFoundationAdditions
{
  uint64_t v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v6 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v5);

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = [v6 dateByAddingUnit:16 value:a3 toDate:v7 options:0];

  v9 = [v6 dateBySettingHour:0 minute:0 second:0 ofDate:v8 options:0];

  return v9;
}

+ (id)ef_dateHoursAgo:()EmailFoundationAdditions
{
  uint64_t v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v6 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v5);

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = [v6 dateByAddingUnit:32 value:-a3 toDate:v7 options:0];

  v9 = objc_msgSend(v8, "ef_dateWithTruncatedSeconds");

  return v9;
}

- (id)ef_dateWithTruncatedSeconds
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [v2 components:126 fromDate:a1];
  id v4 = [v2 dateFromComponents:v3];

  return v4;
}

+ (id)ef_thisWeekday:()EmailFoundationAdditions hour:minute:second:
{
  v11 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v12 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v11);

  v13 = [MEMORY[0x1E4F1C9C8] date];
  v14 = objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, a3 - objc_msgSend(v12, "component:fromDate:", 512, v13), v13, 0);
  v15 = [v12 dateBySettingHour:a4 minute:a5 second:a6 ofDate:v14 options:0];

  return v15;
}

+ (id)ef_localCombinedDate:()EmailFoundationAdditions time:timeZone:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v12 = objc_msgSend(a1, "_ef_gregorianCalendarForTimeZone:", v11);

  v13 = [v12 components:28 fromDate:v8];
  v14 = [v12 components:96 fromDate:v9];
  [v13 setSecond:0];
  objc_msgSend(v13, "setHour:", objc_msgSend(v14, "hour"));
  objc_msgSend(v13, "setMinute:", objc_msgSend(v14, "minute"));
  if (v10) {
    [v13 setTimeZone:v10];
  }
  v15 = [v12 dateFromComponents:v13];

  return v15;
}

+ (id)_ef_nightDateComponents
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v0 setHour:21];
  [v0 setMinute:0];
  [v0 setSecond:0];
  return v0;
}

+ (id)_ef_morningDateComponents
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v0 setHour:8];
  [v0 setMinute:0];
  [v0 setSecond:0];
  return v0;
}

+ (id)_ef_gregorianCalendarForTimeZone:()EmailFoundationAdditions
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v6 = v3;
  if (!v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  }
  [v5 setTimeZone:v6];
  if (!v3) {

  }
  return v5;
}

@end