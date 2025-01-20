@interface HKMCAnalysis(NotificationTiming)
- (BOOL)isEarliestNotificationScheduledAfterDate:()NotificationTiming gregorianCalendar:;
- (HDMCNotification)hdmc_afterPeriodEndNotification;
- (HDMCNotification)hdmc_afterPeriodStartNotification;
- (HDMCNotification)hdmc_beforeFertileWindowStartNotification;
- (HDMCNotification)hdmc_beforePeriodStartNotification;
- (HDMCNotification)hdmc_fertileWindowDidUpdateDueToSensorDataNotificationForNotificationFireDate:()NotificationTiming lastFiredDate:fertileWindowNotificationTimeOfDay:;
- (id)_hdmc_firstPeriodStartProjection;
@end

@implementation HKMCAnalysis(NotificationTiming)

- (id)_hdmc_firstPeriodStartProjection
{
  v2 = [a1 menstruationProjections];
  v3 = [v2 firstObject];

  if (!v3) {
    goto LABEL_4;
  }
  if ([v3 isPartiallyLogged])
  {
    v4 = [a1 menstruationProjections];
    unint64_t v5 = [v4 count];

    if (v5 < 2)
    {
LABEL_4:
      id v6 = 0;
      goto LABEL_7;
    }
    v7 = [a1 menstruationProjections];
    uint64_t v8 = [v7 objectAtIndexedSubscript:1];

    v3 = (void *)v8;
  }
  id v6 = v3;
  v3 = v6;
LABEL_7:

  return v6;
}

- (HDMCNotification)hdmc_beforePeriodStartNotification
{
  v1 = objc_msgSend(a1, "_hdmc_firstPeriodStartProjection");
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 startDayRange];
    v4 = [HDMCNotification alloc];
    unint64_t v5 = HKMCNotificationCategoryBeforePeriodStartForDays();
    id v6 = [(HDMCNotification *)v4 initWithFireOnDayIndex:v3 - 1 category:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (HDMCNotification)hdmc_afterPeriodStartNotification
{
  v1 = objc_msgSend(a1, "_hdmc_firstPeriodStartProjection");
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 mostLikelyDays] + 4;
    v4 = [HDMCNotification alloc];
    unint64_t v5 = [(HDMCNotification *)v4 initWithFireOnDayIndex:v3 category:*MEMORY[0x263F45040]];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (HDMCNotification)hdmc_afterPeriodEndNotification
{
  v2 = [a1 menstruationProjections];
  uint64_t v3 = [v2 firstObject];

  if (!v3) {
    goto LABEL_6;
  }
  if ([v3 isPartiallyLogged])
  {
    v4 = [a1 statistics];
    uint64_t v5 = [v4 cycleLengthMedian];
    if (v5)
    {
      id v6 = (void *)v5;
      v7 = [a1 lastMenstrualFlowDayIndex];

      if (v7)
      {
        uint64_t v8 = [a1 lastMenstrualFlowDayIndex];
        uint64_t v9 = [v8 integerValue];
        uint64_t v10 = v9 - [v3 mostLikelyDays] + 1;

        v11 = [a1 statistics];
        v12 = [v11 menstruationLengthMedian];
        uint64_t v13 = [v12 integerValue] - 1;

        if (v10 >= v13)
        {
LABEL_6:
          v14 = 0;
          goto LABEL_11;
        }
      }
    }
    else
    {
    }
  }
  int v15 = [v3 isPartiallyLogged];
  v16 = (id *)MEMORY[0x263F45038];
  if (!v15) {
    v16 = (id *)MEMORY[0x263F45048];
  }
  id v17 = *v16;
  v14 = -[HDMCNotification initWithFireOnDayIndex:category:]([HDMCNotification alloc], "initWithFireOnDayIndex:category:", [v3 dayIndexFromEndWithCoefficient:2.2], v17);

LABEL_11:
  return v14;
}

- (HDMCNotification)hdmc_beforeFertileWindowStartNotification
{
  v1 = [a1 fertileWindowProjections];
  v2 = [v1 firstObject];

  if (v2)
  {
    uint64_t v3 = [HDMCNotification alloc];
    uint64_t v4 = [v2 allDays];
    uint64_t v5 = [(HDMCNotification *)v3 initWithFireOnDayIndex:v4 - 3 category:*MEMORY[0x263F45050]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (HDMCNotification)hdmc_fertileWindowDidUpdateDueToSensorDataNotificationForNotificationFireDate:()NotificationTiming lastFiredDate:fertileWindowNotificationTimeOfDay:
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 fertileWindowProjections];
  v12 = [v11 firstObject];

  if (!v12
    || ![v12 daysOffsetFromCalendarMethod]
    || [v12 daysOffsetFromCalendarMethod] && objc_msgSend(v12, "predictionPrimarySource") != 2)
  {
    v29 = 0;
    goto LABEL_21;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  objc_msgSend(v13, "hkmc_nextDateAfterDate:matchingHourComponents:", v8, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    _HKInitializeLogging();
    int v15 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      *(_DWORD *)buf = 138543362;
      id v37 = (id)objc_opt_class();
      id v17 = v37;
      _os_log_impl(&dword_225722000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Our next date to fire a notification is nil, defaulting back to today as our next fire date", buf, 0xCu);
    }
    id v14 = v8;
  }
  uint64_t v18 = objc_msgSend(v14, "hk_dayIndexWithCalendar:", v13);
  if (v9 && v18 - objc_msgSend(v9, "hk_dayIndexWithCalendar:", v13) <= 9)
  {
    _HKInitializeLogging();
    v31 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v31;
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v37 = v32;
      id v33 = v32;
      _os_log_impl(&dword_225722000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] We have already fired our update fertile window notification within the past 10 days, we are going to skip scheduling another one.", buf, 0xCu);

      goto LABEL_18;
    }
LABEL_19:
    v29 = 0;
    goto LABEL_20;
  }
  uint64_t v19 = [v12 allDays];
  [v12 allDays];
  uint64_t v21 = v19 + v20 - 1;
  uint64_t v22 = v21 - v18;
  if ((unint64_t)(v21 - v18) >= 4)
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = objc_opt_class();
      v26 = NSNumber;
      id v35 = v25;
      v27 = [v26 numberWithInteger:v22];
      v28 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      id v37 = v25;
      __int16 v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_225722000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] The remaining days in our fertile window are: %@, so we will skip scheduling an update fertile window notification", buf, 0x16u);

LABEL_18:
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v30 = [HDMCNotification alloc];
  v29 = -[HDMCNotification initWithFireOnDayIndex:category:fertileWindowEndDayIndex:daysShifted:](v30, "initWithFireOnDayIndex:category:fertileWindowEndDayIndex:daysShifted:", v18, *MEMORY[0x263F45078], v21, [v12 daysOffsetFromCalendarMethod]);
LABEL_20:

LABEL_21:
  return v29;
}

- (BOOL)isEarliestNotificationScheduledAfterDate:()NotificationTiming gregorianCalendar:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 menstruationProjections];
  id v9 = [v8 firstObject];

  if (v9)
  {
    uint64_t v10 = [v9 startDayRange] - 1;
    BOOL v11 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v7) < v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end