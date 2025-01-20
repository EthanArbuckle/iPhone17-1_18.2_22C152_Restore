@interface HFScheduleValidator
+ (BOOL)containsInvalidRules:(id)a3;
+ (BOOL)containsUnsupportedRules:(id)a3;
+ (BOOL)isValid:(id)a3;
@end

@implementation HFScheduleValidator

+ (BOOL)isValid:(id)a3
{
  id v4 = a3;
  if (v4 && ([a1 containsUnsupportedRules:v4] & 1) == 0) {
    int v5 = [a1 containsInvalidRules:v4] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)containsInvalidRules:(id)a3
{
  v3 = [a3 rules];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_125);

  return v4;
}

BOOL __44__HFScheduleValidator_containsInvalidRules___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isWeekDayRule])
  {
    v3 = [v2 weekDayRule];
    BOOL v4 = [v3 daysOfTheWeek] == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)containsUnsupportedRules:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 rules];
  unint64_t v5 = [v4 count];
  if (v5 >= [v3 minNumberOfRules]
    && (unint64_t v6 = [v4 count], v6 <= objc_msgSend(v3, "maxNumberOfRules"))
    && ((int v7 = objc_msgSend(v4, "na_any:", &__block_literal_global_2), (objc_msgSend(v3, "supportsWeekDayRules") & 1) != 0)
     || !v7))
  {
    int v10 = objc_msgSend(v4, "na_any:", &__block_literal_global_4_9);
    unsigned int v8 = v10 & ~[v3 supportsYearDayRules];
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

uint64_t __48__HFScheduleValidator_containsUnsupportedRules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWeekDayRule];
}

uint64_t __48__HFScheduleValidator_containsUnsupportedRules___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isYearDayRule];
}

@end