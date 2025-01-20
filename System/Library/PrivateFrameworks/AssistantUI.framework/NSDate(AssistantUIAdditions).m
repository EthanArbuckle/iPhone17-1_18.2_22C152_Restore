@interface NSDate(AssistantUIAdditions)
- (BOOL)_afui_isSameDayAsDate:()AssistantUIAdditions;
- (id)_afui_dateStringUsingCurrentLocaleFromTemplate:()AssistantUIAdditions;
- (uint64_t)afui_isToday;
- (uint64_t)afui_isTomorrow;
- (uint64_t)afui_longYearString;
@end

@implementation NSDate(AssistantUIAdditions)

- (uint64_t)afui_longYearString
{
  return objc_msgSend(a1, "_afui_dateStringUsingCurrentLocaleFromTemplate:", @"yyyy");
}

- (id)_afui_dateStringUsingCurrentLocaleFromTemplate:()AssistantUIAdditions
{
  v4 = (objc_class *)MEMORY[0x263F08790];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x263F08790];
  v8 = [MEMORY[0x263EFF960] currentLocale];
  v9 = [v7 dateFormatFromTemplate:v5 options:0 locale:v8];

  [v6 setDateFormat:v9];
  v10 = [v6 stringFromDate:a1];

  return v10;
}

- (BOOL)_afui_isSameDayAsDate:()AssistantUIAdditions
{
  v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  v7 = [v6 components:30 fromDate:a1];
  v8 = [v6 components:30 fromDate:v5];

  uint64_t v9 = [v7 era];
  if (v9 == [v8 era]
    && (uint64_t v10 = [v7 year], v10 == objc_msgSend(v8, "year"))
    && (uint64_t v11 = [v7 month], v11 == objc_msgSend(v8, "month")))
  {
    uint64_t v12 = [v7 day];
    BOOL v13 = v12 == [v8 day];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (uint64_t)afui_isToday
{
  v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = objc_msgSend(a1, "_afui_isSameDayAsDate:", v2);

  return v3;
}

- (uint64_t)afui_isTomorrow
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v2 setDay:1];
  uint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [MEMORY[0x263EFF910] date];
  id v5 = [v3 dateByAddingComponents:v2 toDate:v4 options:0];

  uint64_t v6 = objc_msgSend(a1, "_afui_isSameDayAsDate:", v5);
  return v6;
}

@end