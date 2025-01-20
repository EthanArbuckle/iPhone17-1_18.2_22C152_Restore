@interface HKSleepSchedule(HealthUI)
- (id)hk_localizedBedtime;
- (id)hk_localizedScheduledSleepDuration;
- (id)hk_localizedWakeTime;
- (id)hk_localizedWeekdaysList;
- (id)hk_localizedWeekdaysListWithGregorianCalendar:()HealthUI standaloneFormatter:listItemFormatter:;
@end

@implementation HKSleepSchedule(HealthUI)

- (id)hk_localizedWeekdaysList
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setFormattingContext:2];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setFormattingContext:5];
  v4 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  v5 = objc_msgSend(a1, "hk_localizedWeekdaysListWithGregorianCalendar:standaloneFormatter:listItemFormatter:", v4, v2, v3);

  return v5;
}

- (id)hk_localizedWeekdaysListWithGregorianCalendar:()HealthUI standaloneFormatter:listItemFormatter:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![a1 weekdays])
  {
    v14 = [a1 overrideDayIndex];
    uint64_t v16 = _OverrideStringForCalendar(v8, v14);
LABEL_10:
    v18 = (void *)v16;

    goto LABEL_11;
  }
  uint64_t v11 = [a1 weekdays];
  uint64_t v12 = *MEMORY[0x1E4F2AA00];
  if (v11 == *MEMORY[0x1E4F2AA00])
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = v13;
    v15 = @"SLEEP_SCHEDULE_EVERY_DAY";
LABEL_9:
    uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
    goto LABEL_10;
  }
  uint64_t v17 = _WeekendDaysInCalendar(v8);
  if ([a1 weekdays] == v17)
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = v13;
    v15 = @"SLEEP_SCHEDULE_WEEKENDS";
    goto LABEL_9;
  }
  if ([a1 weekdays] == (v12 & ~v17))
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = v13;
    v15 = @"SLEEP_SCHEDULE_WEEKDAYS";
    goto LABEL_9;
  }
  [a1 weekdays];
  if (HKSleepScheduleWeekdaysIsSingleDay()
    && ([a1 weekdays], uint64_t v20 = NSWeekdayComponentFromHKSleepScheduleWeekday(), v21 = v20 - 1, v20 >= 1))
  {
    v22 = [v9 standaloneWeekdaySymbols];
    v18 = [v22 objectAtIndexedSubscript:v21];
  }
  else
  {
    id v34 = v9;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v24 = _OrderedCalendarWeekdayComponents(v8);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [v29 integerValue];
          uint64_t v30 = HKSleepScheduleWeekdayFromWeekdayComponent();
          if (([a1 weekdays] & v30) != 0)
          {
            v31 = [v10 shortStandaloneWeekdaySymbols];
            v32 = objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v29, "integerValue") - 1);
            [v23 addObject:v32];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v26);
    }

    v33 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v23];
    v18 = objc_msgSend(v33, "hk_localizedFirstWordCapitalizedString");

    id v9 = v34;
  }
LABEL_11:

  return v18;
}

- (id)hk_localizedScheduledSleepDuration
{
  uint64_t v2 = [a1 bedTimeComponents];
  if (v2
    && (id v3 = (void *)v2,
        [a1 wakeTimeComponents],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28C20], "hk_hourMinuteOnlyDateIntervalFormatter");
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v7 = [a1 bedTimeComponents];
    id v8 = [v6 dateFromComponents:v7];

    id v9 = [a1 wakeTimeComponents];
    id v10 = [v6 dateFromComponents:v9];

    uint64_t v11 = [v5 stringFromDate:v8 toDate:v10];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v11 = [v5 localizedStringForKey:@"SLEEP_SCHEDULE_NO_TIMES_TEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  }

  return v11;
}

- (id)hk_localizedBedtime
{
  v1 = [a1 bedTimeComponents];
  uint64_t v2 = _TimeStringForDateComponents(v1);

  return v2;
}

- (id)hk_localizedWakeTime
{
  v1 = [a1 wakeTimeComponents];
  uint64_t v2 = _TimeStringForDateComponents(v1);

  return v2;
}

@end