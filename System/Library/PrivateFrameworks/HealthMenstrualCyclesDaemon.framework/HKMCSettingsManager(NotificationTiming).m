@interface HKMCSettingsManager(NotificationTiming)
- (id)_hdmc_analysisSchedulingWindowStartComponents;
- (id)_hdmc_dateComponentsForNotificationOnDayIndex:()NotificationTiming timeOfDay:;
- (id)hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:()NotificationTiming;
- (id)hdmc_dateComponentsForMenstruationNotificationOnDayIndex:()NotificationTiming;
- (id)hdmc_nextAnalysisSchedulingWindowStartDateAfterDate:()NotificationTiming calendar:;
@end

@implementation HKMCSettingsManager(NotificationTiming)

- (id)hdmc_dateComponentsForMenstruationNotificationOnDayIndex:()NotificationTiming
{
  v5 = [a1 menstruationNotificationTimeOfDay];
  v6 = objc_msgSend(a1, "_hdmc_dateComponentsForNotificationOnDayIndex:timeOfDay:", a3, v5);

  return v6;
}

- (id)hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:()NotificationTiming
{
  v5 = [a1 fertileWindowNotificationTimeOfDay];
  v6 = objc_msgSend(a1, "_hdmc_dateComponentsForNotificationOnDayIndex:timeOfDay:", a3, v5);

  return v6;
}

- (id)_hdmc_dateComponentsForNotificationOnDayIndex:()NotificationTiming timeOfDay:
{
  v5 = (void *)MEMORY[0x263EFF918];
  v6 = (void *)MEMORY[0x263EFF8F0];
  id v7 = a4;
  v8 = objc_msgSend(v6, "hk_gregorianCalendar");
  v9 = objc_msgSend(v5, "hk_componentsWithDayIndex:calendar:", a3, v8);

  v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  v11 = objc_msgSend(v9, "hk_translateDateComponentsToCalendar:calendarUnits:", v10, 30);

  objc_msgSend(v11, "setHour:", objc_msgSend(v7, "hour"));
  uint64_t v12 = [v7 minute];

  [v11 setMinute:v12];
  return v11;
}

- (id)hdmc_nextAnalysisSchedulingWindowStartDateAfterDate:()NotificationTiming calendar:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "_hdmc_analysisSchedulingWindowStartComponents");
  v9 = [v6 nextDateAfterDate:v7 matchingComponents:v8 options:1024];

  return v9;
}

- (id)_hdmc_analysisSchedulingWindowStartComponents
{
  v2 = objc_msgSend(MEMORY[0x263EFF918], "hk_componentsWithHour:minute:", 18, 30);
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    v5 = [a1 fertileWindowNotificationTimeOfDay];
    id v6 = [v5 calendar];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    }
    v9 = v8;

    v10 = [MEMORY[0x263EFF910] date];
    v11 = [v9 nextDateAfterDate:v10 matchingComponents:v5 options:1024];
    uint64_t v12 = [v11 dateByAddingTimeInterval:-5400.0];
    uint64_t v13 = [v9 components:96 fromDate:v12];

    v2 = (void *)v13;
  }
  return v2;
}

@end