@interface NSDate(AssistantAdditions)
- (BOOL)_af_isSameDayAsDate:()AssistantAdditions;
- (uint64_t)af_isToday;
- (uint64_t)af_isTomorrow;
@end

@implementation NSDate(AssistantAdditions)

- (uint64_t)af_isTomorrow
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setDay:1];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v3 dateByAddingComponents:v2 toDate:v4 options:0];

  uint64_t v6 = objc_msgSend(a1, "_af_isSameDayAsDate:", v5);
  return v6;
}

- (uint64_t)af_isToday
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = objc_msgSend(a1, "_af_isSameDayAsDate:", v2);

  return v3;
}

- (BOOL)_af_isSameDayAsDate:()AssistantAdditions
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
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

@end