@interface CNDate
+ (NSCalendar)gmtBuddhistCalendar;
+ (NSCalendar)gmtChineseCalendar;
+ (NSCalendar)gmtGregorianCalendar;
+ (NSCalendar)gmtIslamicCalendar;
+ (NSCalendar)gmtJapaneseCalendar;
+ (id)dateFromDayComponents:(id)a3;
+ (id)dayComponentsFromDate:(id)a3;
@end

@implementation CNDate

void __30__CNDate_gmtGregorianCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = (void *)gmtGregorianCalendar_s_gmtGregorian;
  gmtGregorianCalendar_s_gmtGregorian = v1;

  v3 = (void *)gmtGregorianCalendar_s_gmtGregorian;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

+ (id)dayComponentsFromDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [a1 gmtGregorianCalendar];
    v6 = [v5 components:30 fromDate:v4];

    if (-[objc_class isYearlessDate:forCalendar:](getIntlUtilityClass_0(), "isYearlessDate:forCalendar:", v6, v5))[v6 setYear:0x7FFFFFFFFFFFFFFFLL]; {
    if ([v6 era] == 1)
    }
      [v6 setEra:0x7FFFFFFFFFFFFFFFLL];
    [v6 setCalendar:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (NSCalendar)gmtGregorianCalendar
{
  if (gmtGregorianCalendar_onceToken != -1) {
    dispatch_once(&gmtGregorianCalendar_onceToken, &__block_literal_global_89);
  }
  v2 = (void *)gmtGregorianCalendar_s_gmtGregorian;

  return (NSCalendar *)v2;
}

+ (NSCalendar)gmtJapaneseCalendar
{
  if (gmtJapaneseCalendar_onceToken != -1) {
    dispatch_once(&gmtJapaneseCalendar_onceToken, &__block_literal_global_3_3);
  }
  v2 = (void *)gmtJapaneseCalendar_s_gmtJapanese;

  return (NSCalendar *)v2;
}

void __29__CNDate_gmtJapaneseCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C358]];
  v2 = (void *)gmtJapaneseCalendar_s_gmtJapanese;
  gmtJapaneseCalendar_s_gmtJapanese = v1;

  v3 = (void *)gmtJapaneseCalendar_s_gmtJapanese;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

+ (NSCalendar)gmtBuddhistCalendar
{
  if (gmtBuddhistCalendar_onceToken != -1) {
    dispatch_once(&gmtBuddhistCalendar_onceToken, &__block_literal_global_5_3);
  }
  v2 = (void *)gmtBuddhistCalendar_s_gmtBuddhist;

  return (NSCalendar *)v2;
}

void __29__CNDate_gmtBuddhistCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C2E8]];
  v2 = (void *)gmtBuddhistCalendar_s_gmtBuddhist;
  gmtBuddhistCalendar_s_gmtBuddhist = v1;

  v3 = (void *)gmtBuddhistCalendar_s_gmtBuddhist;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

+ (NSCalendar)gmtIslamicCalendar
{
  if (gmtIslamicCalendar_onceToken != -1) {
    dispatch_once(&gmtIslamicCalendar_onceToken, &__block_literal_global_7_3);
  }
  v2 = (void *)gmtIslamicCalendar_s_gmtIslamic;

  return (NSCalendar *)v2;
}

void __28__CNDate_gmtIslamicCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C338]];
  v2 = (void *)gmtIslamicCalendar_s_gmtIslamic;
  gmtIslamicCalendar_s_gmtIslamic = v1;

  v3 = (void *)gmtIslamicCalendar_s_gmtIslamic;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

+ (NSCalendar)gmtChineseCalendar
{
  if (gmtChineseCalendar_onceToken != -1) {
    dispatch_once(&gmtChineseCalendar_onceToken, &__block_literal_global_9_1);
  }
  v2 = (void *)gmtChineseCalendar_s_gmtChinese;

  return (NSCalendar *)v2;
}

void __28__CNDate_gmtChineseCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C2F0]];
  v2 = (void *)gmtChineseCalendar_s_gmtChinese;
  gmtChineseCalendar_s_gmtChinese = v1;

  v3 = (void *)gmtChineseCalendar_s_gmtChinese;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

+ (id)dateFromDayComponents:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [a1 gmtGregorianCalendar];
    v6 = (void *)[v4 copy];

    [v6 setHour:12];
    [v6 setMinute:0];
    [v6 setSecond:0];
    v7 = [v5 timeZone];
    [v6 setTimeZone:v7];

    if ([v6 year] == 0x7FFFFFFFFFFFFFFFLL) {
      [(objc_class *)getIntlUtilityClass_0() setYearlessYear:v6 forCalendar:v5];
    }
    v8 = [v5 dateFromComponents:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end