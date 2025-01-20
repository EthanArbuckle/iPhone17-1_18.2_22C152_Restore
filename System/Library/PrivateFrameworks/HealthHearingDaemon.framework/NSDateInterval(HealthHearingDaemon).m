@interface NSDateInterval(HealthHearingDaemon)
+ (id)hd_hearingSevenDayDoseLimitIntervalForNowDate:()HealthHearingDaemon;
+ (id)hd_hearingSevenDayLimitIntervalWithEndDate:()HealthHearingDaemon;
+ (id)hd_hearingSevenDayLimitIntervalWithStartDate:()HealthHearingDaemon earliestStartDate:boundedInterval:;
@end

@implementation NSDateInterval(HealthHearingDaemon)

+ (id)hd_hearingSevenDayLimitIntervalWithStartDate:()HealthHearingDaemon earliestStartDate:boundedInterval:
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"NSDateInterval+HealthHearingDaemon.m", 22, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];
  }
  if (objc_msgSend(v10, "hk_isAfterDate:", v9)) {
    v11 = v10;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  if (a5) {
    [v9 dateByAddingTimeInterval:608400.0];
  }
  else {
  v13 = [MEMORY[0x263EFF910] distantFuture];
  }
  if (objc_msgSend(v12, "hk_isAfterDate:", v13))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      +[NSDateInterval(HealthHearingDaemon) hd_hearingSevenDayLimitIntervalWithStartDate:earliestStartDate:boundedInterval:]((uint64_t)v10, (uint64_t)v9, v14);
    }
    uint64_t v15 = [[a1 alloc] initWithStartDate:v9 duration:608400.0];
  }
  else
  {
    uint64_t v15 = [[a1 alloc] initWithStartDate:v12 endDate:v13];
  }
  v16 = (void *)v15;

  return v16;
}

+ (id)hd_hearingSevenDayLimitIntervalWithEndDate:()HealthHearingDaemon
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSDateInterval+HealthHearingDaemon.m", 37, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];
  }
  v6 = [v5 dateByAddingTimeInterval:-604800.0];
  v7 = (void *)[[a1 alloc] initWithStartDate:v6 endDate:v5];

  return v7;
}

+ (id)hd_hearingSevenDayDoseLimitIntervalForNowDate:()HealthHearingDaemon
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDateInterval+HealthHearingDaemon.m", 43, @"Invalid parameter not satisfying: %@", @"nowDate" object file lineNumber description];
  }
  v6 = [v5 dateByAddingTimeInterval:3600.0];
  v7 = [v5 dateByAddingTimeInterval:-604800.0];
  v8 = (void *)[[a1 alloc] initWithStartDate:v7 endDate:v6];
  [v8 duration];
  if (v9 != 608400.0)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSDateInterval+HealthHearingDaemon.m", 48, @"Invalid parameter not satisfying: %@", @"dateInterval.duration == HDHeadphoneExposureSevenDayDoseInterval" object file lineNumber description];
  }
  return v8;
}

+ (void)hd_hearingSevenDayLimitIntervalWithStartDate:()HealthHearingDaemon earliestStartDate:boundedInterval:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_22615C000, log, OS_LOG_TYPE_FAULT, "earliestStartDate (%@) is more than 169 hours past startDate (%@)", (uint8_t *)&v3, 0x16u);
}

@end