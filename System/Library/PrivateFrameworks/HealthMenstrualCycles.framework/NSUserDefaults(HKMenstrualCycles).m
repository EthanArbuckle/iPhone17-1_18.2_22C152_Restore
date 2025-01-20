@interface NSUserDefaults(HKMenstrualCycles)
+ (id)hkmc_menstrualCyclesDefaults;
- (uint64_t)hkmc_analyticsDebugModeEnabled;
- (uint64_t)hkmc_calendarLogAdjacentDaysDisabled;
- (uint64_t)hkmc_integerForKey:()HKMenstrualCycles defaultValue:;
- (uint64_t)hkmc_timelineLogAdjacentDaysEnabled;
- (uint64_t)hkmc_timelineTapToLogDisabled;
@end

@implementation NSUserDefaults(HKMenstrualCycles)

+ (id)hkmc_menstrualCyclesDefaults
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.private.health.menstrual-cycles"];
  return v0;
}

- (uint64_t)hkmc_analyticsDebugModeEnabled
{
  return [a1 BOOLForKey:@"AnalyticsDebugModeEnabled"];
}

- (uint64_t)hkmc_calendarLogAdjacentDaysDisabled
{
  return [a1 BOOLForKey:@"CalendarLogAdjacentDaysDisabled"];
}

- (uint64_t)hkmc_timelineLogAdjacentDaysEnabled
{
  return [a1 BOOLForKey:@"TimelineLogAdjacentDaysEnabled"];
}

- (uint64_t)hkmc_timelineTapToLogDisabled
{
  return [a1 BOOLForKey:@"TimelineTapToLogDisabled"];
}

- (uint64_t)hkmc_integerForKey:()HKMenstrualCycles defaultValue:
{
  id v6 = a3;
  v7 = [a1 objectForKey:v6];

  if (v7) {
    a4 = [a1 integerForKey:v6];
  }

  return a4;
}

@end