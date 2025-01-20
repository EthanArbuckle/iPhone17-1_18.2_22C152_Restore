@interface NSDateInterval(Schedule)
+ (id)dnds_dateIntervalForScheduleSettings:()Schedule date:calendar:;
+ (id)dnds_dateIntervalUntilEndOfScheduleForScheduleSettings:()Schedule startDate:calendar:;
@end

@implementation NSDateInterval(Schedule)

+ (id)dnds_dateIntervalForScheduleSettings:()Schedule date:calendar:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 scheduleEnabledSetting];
  uint64_t v10 = DNDResolvedScheduleEnabledSetting();
  v11 = [v7 timePeriod];
  uint64_t v12 = [v11 weekdays];
  v13 = 0;
  if (v10 == 2)
  {
    uint64_t v14 = v12;
    if (v12 != *MEMORY[0x1E4F5F560])
    {
      [v9 component:512 fromDate:v8];
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__0;
      v31 = __Block_byref_object_dispose__0;
      id v32 = 0;
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      id v18 = v11;
      id v19 = v9;
      id v20 = v8;
      DNDEnumerateDaysOfWeekStartingOnDay();
      if (v28[5] && v22[5])
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
        v13 = objc_msgSend(v15, "initWithStartDate:endDate:", v28[5], v22[5], v17, 3221225472, __79__NSDateInterval_Schedule__dnds_dateIntervalForScheduleSettings_date_calendar___block_invoke, &unk_1E69736A0, v18, v19, v20, &v27, &v21, v14);
      }
      else
      {
        v13 = 0;
      }

      _Block_object_dispose(&v21, 8);
      _Block_object_dispose(&v27, 8);
    }
  }

  return v13;
}

+ (id)dnds_dateIntervalUntilEndOfScheduleForScheduleSettings:()Schedule startDate:calendar:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 scheduleEnabledSetting];
  uint64_t v10 = DNDResolvedScheduleEnabledSetting();
  v11 = [v7 timePeriod];
  uint64_t v12 = [v11 weekdays];
  v13 = 0;
  if (v10 == 2 && v12 != *MEMORY[0x1E4F5F560])
  {
    [v9 component:512 fromDate:v8];
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    id v25 = 0;
    id v17 = v11;
    id v18 = v9;
    id v14 = v8;
    id v19 = v14;
    DNDEnumerateDaysOfWeekStartingOnDay();
    if (v21[5])
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
      v13 = (void *)[v15 initWithStartDate:v14 endDate:v21[5]];
    }
    else
    {
      v13 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

@end