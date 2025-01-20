@interface HDMedicationNotificationEngine
+ (BOOL)_greaterThanOrEqualNextScheduledDate:(void *)a3 endDate:(void *)a4 calendar:;
+ (BOOL)unitTesting_isLastScheduledDoseforScheduledDate:(id)a3 schedule:(id)a4 startGenerationDate:(id)a5 calendar:(id)a6 cycleIntervalIndex:(int)a7 interval:(id)a8;
+ (id)_calculateNextGenerationDateFromGenerationDate:(void *)a3 calendar:;
+ (id)_generateForSchedule:(uint64_t)a1 configuration:(void *)a2 error:(void *)a3;
+ (id)_generateScheduleItemsAtDate:(uint64_t)a1 withMultiphasicSchedule:(void *)a2 calendar:(void *)a3 startGenerationDate:(void *)a4;
+ (id)_generateScheduleItemsAtDate:(void *)a3 withSchedule:(void *)a4 startGenerationDate:(void *)a5 calendar:;
+ (id)_getNextDateFromDate:(int)a3 daysInFuture:(void *)a4 calendar:;
+ (id)_getStartGenerationDateForSchedule:(uint64_t)a1 configuration:(void *)a2 calendar:(void *)a3;
+ (id)_makeScheduleItemAtDate:(void *)a3 withMonophasicInterval:(void *)a4 calendar:(void *)a5 schedule:;
+ (id)_makeScheduleItemAtDate:(void *)a3 withMonophasicInterval:(void *)a4 calendar:(void *)a5 schedule:(int)a6 cyclicIntervalIndex:;
+ (id)_timeBatchItems:(uint64_t)a1;
+ (id)generateForSchedules:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (int64_t)unitTesting_calculateTotalDaysForSchedule:(id)a3 configuration:(id)a4 calendar:(id)a5 startGenerationDate:(id)a6;
+ (uint64_t)_calculateTotalDaysForSchedule:(void *)a3 configuration:(void *)a4 calendar:(void *)a5 startGenerationDate:;
+ (uint64_t)_isLastScheduledDoseforScheduledDate:(void *)a3 schedule:(void *)a4 startGenerationDate:(void *)a5 calendar:(int)a6 cycleIntervalIndex:(void *)a7 interval:;
+ (uint64_t)_isLastScheduledTimeForDay:(void *)a3 schedule:(void *)a4 interval:(void *)a5 calendar:;
+ (uint64_t)_optionForWeekday:(uint64_t)a1;
+ (uint64_t)_validateConfigurationForCyclicSchedule:(int)a3 cycleIntervalIndex:;
+ (unint64_t)_indexForGenerationDate:(void *)a3 schedule:(void *)a4 calendar:;
+ (unint64_t)_indexThatAddsPastTotalDays:(void *)a3 fromIntervalLengths:;
+ (unint64_t)_indexThatDoesNotAddPastTotalDays:(void *)a3 fromIntervalLengths:;
- (HDMedicationNotificationEngine)init;
@end

@implementation HDMedicationNotificationEngine

- (HDMedicationNotificationEngine)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)generateForSchedules:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = +[HDMedicationNotificationEngine _generateForSchedule:configuration:error:]((uint64_t)a1, *(void **)(*((void *)&v23 + 1) + 8 * i), v8);
        objc_msgSend(v9, "addObjectsFromArray:", v15, (void)v23);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v12);
  }

  v16 = +[HDMedicationNotificationEngine _timeBatchItems:]((uint64_t)a1, v9);
  _HKInitializeLogging();
  v17 = HKLogMedication();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v19 = HKSensitiveLogItem();
    v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v21 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544386;
    id v28 = a1;
    __int16 v29 = 2114;
    v30 = v18;
    __int16 v31 = 2114;
    v32 = v19;
    __int16 v33 = 2114;
    v34 = v20;
    __int16 v35 = 2114;
    v36 = v21;
    _os_log_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generated %{public}@ time batched schedule items: %{public}@, for %{public}@ schedules: %{public}@", buf, 0x34u);
  }
  return v16;
}

+ (id)_generateForSchedule:(uint64_t)a1 configuration:(void *)a2 error:(void *)a3
{
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [v5 calendar];
  id v8 = [v4 createdUTCOffset];
  [v7 setTimeZone:v8];

  v9 = +[HDMedicationNotificationEngine _getStartGenerationDateForSchedule:configuration:calendar:]((uint64_t)HDMedicationNotificationEngine, v4, v5);
  uint64_t v10 = +[HDMedicationNotificationEngine _calculateTotalDaysForSchedule:configuration:calendar:startGenerationDate:]((uint64_t)HDMedicationNotificationEngine, v4, v5, v7, v9);
  id v11 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = v11;
  if (v10 >= 1)
  {
    v14 = v11;
    do
    {
      v15 = (void *)MEMORY[0x1C187D3A0]();
      v16 = +[HDMedicationNotificationEngine _generateScheduleItemsAtDate:withSchedule:startGenerationDate:calendar:]((uint64_t)HDMedicationNotificationEngine, v14, v4, v12, v7);
      [v6 addObjectsFromArray:v16];

      uint64_t v13 = +[HDMedicationNotificationEngine _calculateNextGenerationDateFromGenerationDate:calendar:]((uint64_t)HDMedicationNotificationEngine, v14, v7);

      v14 = v13;
      --v10;
    }
    while (v10);
  }

  return v6;
}

+ (id)_timeBatchItems:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v2, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v3, "indexOfObject:", v9, (void)v21);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v3 addObject:v9];
        }
        else
        {
          uint64_t v11 = v10;
          uint64_t v12 = [v3 objectAtIndexedSubscript:v10];
          uint64_t v13 = [v12 doses];
          v14 = (void *)[v13 mutableCopy];

          v15 = [v9 doses];
          [v14 addObjectsFromArray:v15];

          id v16 = objc_alloc(MEMORY[0x1E4F66B50]);
          v17 = [v12 scheduledDateTime];
          v18 = objc_msgSend(v16, "initWithScheduledDateTime:notificationSent:doses:", v17, objc_msgSend(v12, "notificationSent"), v14);
          [v3 setObject:v18 atIndexedSubscript:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v19 = [v3 array];

  return v19;
}

+ (id)_getStartGenerationDateForSchedule:(uint64_t)a1 configuration:(void *)a2 calendar:(void *)a3
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = [v4 startGenerationDate];

  uint64_t v7 = [v5 startDateTime];

  if (objc_msgSend(v7, "hk_isAfterOrEqualToDate:", v6))
  {
    id v8 = v7;

    uint64_t v6 = v8;
  }

  return v6;
}

+ (uint64_t)_calculateTotalDaysForSchedule:(void *)a3 configuration:(void *)a4 calendar:(void *)a5 startGenerationDate:
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  self;
  uint64_t v12 = [v11 endGenerationDate];

  uint64_t v13 = [v9 startOfDayForDate:v10];

  v14 = [v8 endDateTime];

  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v15 setDay:1];
    id v16 = [v8 endDateTime];
    v17 = [v9 dateByAddingComponents:v15 toDate:v16 options:2];
    v18 = [v9 startOfDayForDate:v17];

    if (objc_msgSend(v12, "hk_isAfterOrEqualToDate:", v18))
    {
      id v19 = v18;

      uint64_t v12 = v19;
    }
  }
  v20 = [v9 components:16 fromDate:v13 toDate:v12 options:2];
  uint64_t v21 = [v20 day];

  return v21;
}

+ (id)_generateScheduleItemsAtDate:(void *)a3 withSchedule:(void *)a4 startGenerationDate:(void *)a5 calendar:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v9;
  id v13 = v11;
  uint64_t v14 = self;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self;
  v50 = v13;
  id v15 = [v13 components:636 fromDate:v8];
  uint64_t v16 = [v15 weekday];

  v17 = [v12 timeIntervals];
  uint64_t v18 = [v12 frequencyType];
  switch(v18)
  {
    case 0:
    case 4:
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateScheduleItemsAtDate_withSchedule_startGenerationDate_calendar_, v14, @"HDMedicationNotificationEngine.m", 217, @"frequency type %ld is not a supported schedule type.", v18);

      break;
    case 1:
      v20 = [v12 timeIntervals];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        long long v22 = +[HDMedicationNotificationEngine _generateScheduleItemsAtDate:withMultiphasicSchedule:calendar:startGenerationDate:]((uint64_t)HDMedicationNotificationEngine, v8, v12, v50);
        [v49 addObjectsFromArray:v22];
      }
      break;
    case 2:
      uint64_t v47 = v14;
      v48 = v17;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v23 = v17;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v69 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v52 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:]((uint64_t)HDMedicationNotificationEngine, v8, *(void **)(*((void *)&v51 + 1) + 8 * i), v50, v12);
            [v49 addObject:v28];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v69 count:16];
        }
        while (v25);
      }

      goto LABEL_23;
    case 3:
      id v46 = v10;
      uint64_t v47 = v14;
      __int16 v29 = v12;
      v30 = v8;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v48 = v17;
      id v31 = v17;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v70 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v56 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            uint64_t v37 = [v36 daysOfWeek];
            if ((+[HDMedicationNotificationEngine _optionForWeekday:]((uint64_t)HDMedicationNotificationEngine, v16) & v37) != 0)
            {
              uint64_t v38 = +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:]((uint64_t)HDMedicationNotificationEngine, v30, v36, v50, v29);
              [v49 addObject:v38];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v55 objects:v70 count:16];
        }
        while (v33);
      }

      id v8 = v30;
      uint64_t v12 = v29;
      id v10 = v46;
LABEL_23:
      uint64_t v14 = v47;
      v17 = v48;
      break;
    default:
      break;
  }
  _HKInitializeLogging();
  v39 = HKLogMedication();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

  if (v40)
  {
    v41 = HKLogMedication();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v43 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v49, "count"));
      v44 = HKSensitiveLogItem();
      v45 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138544386;
      uint64_t v60 = v14;
      __int16 v61 = 2114;
      v62 = v43;
      __int16 v63 = 2114;
      v64 = v44;
      __int16 v65 = 2114;
      v66 = v45;
      __int16 v67 = 2114;
      id v68 = v8;
      _os_log_debug_impl(&dword_1BD54A000, v41, OS_LOG_TYPE_DEBUG, "[%{public}@] Generated %{public}@ schedule items: %{public}@, for schedule: %{public}@, at date: %{public}@", buf, 0x34u);
    }
  }

  return v49;
}

+ (id)_calculateNextGenerationDateFromGenerationDate:(void *)a3 calendar:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:1];
  uint64_t v7 = [v4 dateByAddingComponents:v6 toDate:v5 options:2];

  return v7;
}

+ (uint64_t)_optionForWeekday:(uint64_t)a1
{
  if ((unint64_t)(a2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1BD5A59F8[a2 - 1];
  }
}

+ (id)_makeScheduleItemAtDate:(void *)a3 withMonophasicInterval:(void *)a4 calendar:(void *)a5 schedule:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = self;
  id v13 = +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:cyclicIntervalIndex:](v12, v11, v10, v9, v8, -1);

  return v13;
}

+ (id)_generateScheduleItemsAtDate:(uint64_t)a1 withMultiphasicSchedule:(void *)a2 calendar:(void *)a3 startGenerationDate:(void *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  __int16 v29 = v8;
  v30 = v6;
  unint64_t v10 = +[HDMedicationNotificationEngine _indexForGenerationDate:schedule:calendar:](v9, v6, v7, v8);
  id v11 = v7;
  uint64_t v12 = [v7 timeIntervals];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __116__HDMedicationNotificationEngine__generateScheduleItemsAtDate_withMultiphasicSchedule_calendar_startGenerationDate___block_invoke;
  v35[3] = &__block_descriptor_40_e76___HKMedicationScheduleIntervalData_16__0__HKMedicationScheduleIntervalData_8l;
  v35[4] = v10;
  id v13 = objc_msgSend(v12, "hk_map:", v35);

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "dose", v29);
        if (v21)
        {
          long long v22 = (void *)v21;
          id v23 = [v20 dose];
          [v23 doubleValue];
          double v25 = fabs(v24);

          if (v25 < 2.22044605e-16) {
            continue;
          }
        }
        uint64_t v26 = +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:cyclicIntervalIndex:]((uint64_t)HDMedicationNotificationEngine, v30, v20, v29, v11, v10);
        [v14 addObject:v26];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v17);
  }

  v27 = [MEMORY[0x1E4F1C978] arrayWithArray:v14];

  return v27;
}

+ (uint64_t)_isLastScheduledDoseforScheduledDate:(void *)a3 schedule:(void *)a4 startGenerationDate:(void *)a5 calendar:(int)a6 cycleIntervalIndex:(void *)a7 interval:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = self;
  uint64_t v18 = [v13 endDateTime];
  id v19 = v12;
  if (!v18)
  {
LABEL_32:
    uint64_t v20 = 0;
    goto LABEL_33;
  }
  uint64_t v20 = [v16 dose];

  if (v20)
  {
    if (+[HDMedicationNotificationEngine _isLastScheduledTimeForDay:schedule:interval:calendar:](v17, v19, v13, v16, v15))
    {
      uint64_t v20 = 0;
      uint64_t v21 = v19;
      switch([v13 frequencyType])
      {
        case 1:
          if (!+[HDMedicationNotificationEngine _validateConfigurationForCyclicSchedule:cycleIntervalIndex:](v17, v13, a6))goto LABEL_32; {
          int v22 = 1;
          }
          id v23 = +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v17, v19, 1, v15);
          if (+[HDMedicationNotificationEngine _indexForGenerationDate:schedule:calendar:](v17, v23, v13, v15) != a6)
          {
            id v48 = v16;
            id v49 = v23;
            id v50 = v14;
            uint64_t v52 = v17;
            int v24 = 1;
            while (1)
            {
              double v25 = [v13 timeIntervals];
              uint64_t v26 = [v25 count] - 1;

              v27 = [v13 timeIntervals];
              id v28 = v27;
              uint64_t v29 = v26 == a6 ? 0 : a6 + 1;
              v30 = [v27 objectAtIndexedSubscript:v29];

              long long v31 = [v30 dose];

              if (v31) {
                break;
              }
              if (v26 == a6) {
                a6 = 0;
              }
              else {
                ++a6;
              }
              long long v32 = [v30 cycleIntervalDays];
              v24 += [v32 intValue];
            }
            id v14 = v50;
            uint64_t v17 = v52;
            int v22 = v24;
            id v16 = v48;
            id v23 = v49;
          }
          uint64_t v21 = +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v17, v19, v22, v15);

          goto LABEL_44;
        case 2:
          long long v33 = [v13 timeIntervals];
          uint64_t v34 = [v33 count];

          if (v34)
          {
            uint64_t v21 = +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v17, v19, 1, v15);

            goto LABEL_44;
          }
          _HKInitializeLogging();
          v43 = HKLogMedication();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:]();
          }
          goto LABEL_31;
        case 3:
          __int16 v35 = [v13 timeIntervals];
          uint64_t v36 = [v35 count];

          if (v36)
          {
            id v51 = v14;
            uint64_t v53 = v17;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            uint64_t v37 = [v13 timeIntervals];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v58 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = 0;
              uint64_t v41 = *(void *)v55;
              do
              {
                for (uint64_t i = 0; i != v39; ++i)
                {
                  if (*(void *)v55 != v41) {
                    objc_enumerationMutation(v37);
                  }
                  v40 |= [*(id *)(*((void *)&v54 + 1) + 8 * i) daysOfWeek];
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v58 count:16];
              }
              while (v39);
            }
            else
            {
              uint64_t v40 = 0;
            }

            int v45 = 1;
            while (1)
            {
              uint64_t v21 = +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v53, v19, v45, v15);
              self;
              id v46 = [v15 components:636 fromDate:v21];
              uint64_t v47 = [v46 weekday];

              if ((+[HDMedicationNotificationEngine _optionForWeekday:]((uint64_t)HDMedicationNotificationEngine, v47) & v40) != 0)break; {
              if (++v45 == 8)
              }
              {
                uint64_t v21 = v19;
                goto LABEL_43;
              }
            }

LABEL_43:
            id v14 = v51;
            uint64_t v17 = v53;
LABEL_44:
            uint64_t v20 = +[HDMedicationNotificationEngine _greaterThanOrEqualNextScheduledDate:endDate:calendar:](v17, v21, v18, v15);
            goto LABEL_34;
          }
          _HKInitializeLogging();
          v43 = HKLogMedication();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:]();
          }
LABEL_31:

          break;
        case 4:
          goto LABEL_34;
        default:
          goto LABEL_44;
      }
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t v21 = v19;
LABEL_34:

  return v20;
}

+ (uint64_t)_isLastScheduledTimeForDay:(void *)a3 schedule:(void *)a4 interval:(void *)a5 calendar:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  self;
  uint64_t v39 = [v11 components:224 fromDate:v8];
  [v39 setCalendar:v11];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = [v9 timeIntervals];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v13)
  {
    uint64_t v34 = 1;
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  id v36 = v11;
  id v37 = v9;
  id v38 = v8;
  uint64_t v15 = *(void *)v41;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
      uint64_t v18 = objc_msgSend(v10, "cycleIntervalDays", v36, v37, v38);
      id v19 = [v17 cycleIntervalDays];
      if (v18 != v19) {
        goto LABEL_9;
      }
      uint64_t v20 = [v10 cycleIndex];
      uint64_t v21 = [v17 cycleIndex];
      if (v20 != v21)
      {

        id v19 = v18;
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v22 = [v10 daysOfWeek];
      uint64_t v23 = [v17 daysOfWeek];

      if (v22 == v23)
      {
        id v24 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        double v25 = [v17 startTimeComponent];
        uint64_t v26 = [v25 calendar];
        [v24 setCalendar:v26];

        v27 = [v17 startTimeComponent];
        objc_msgSend(v24, "setHour:", objc_msgSend(v27, "hour"));

        id v28 = [v17 startTimeComponent];
        objc_msgSend(v24, "setMinute:", objc_msgSend(v28, "minute"));

        uint64_t v29 = [v17 startTimeComponent];
        objc_msgSend(v24, "setSecond:", objc_msgSend(v29, "second"));

        v30 = [v39 date];
        long long v31 = [v24 date];
        uint64_t v32 = [v30 compare:v31];

        if (v32 == -1)
        {
          uint64_t v34 = 0;
          goto LABEL_17;
        }
      }
LABEL_10:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v33 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    uint64_t v14 = v33;
  }
  while (v33);
  uint64_t v34 = 1;
LABEL_17:
  id v9 = v37;
  id v8 = v38;
  id v11 = v36;
LABEL_19:

  return v34;
}

+ (id)_getNextDateFromDate:(int)a3 daysInFuture:(void *)a4 calendar:
{
  id v6 = a4;
  id v7 = a2;
  self;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v8 setDay:a3];
  id v9 = [v6 dateByAddingComponents:v8 toDate:v7 options:0];

  return v9;
}

+ (uint64_t)_validateConfigurationForCyclicSchedule:(int)a3 cycleIntervalIndex:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  id v5 = [v4 timeIntervals];
  unint64_t v6 = [v5 count];

  if (a3 < 0 || v6 <= 1)
  {
    _HKInitializeLogging();
    id v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[HDMedicationNotificationEngine _validateConfigurationForCyclicSchedule:cycleIntervalIndex:]();
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = objc_msgSend(v4, "timeIntervals", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) dose];

          if (v12)
          {
            uint64_t v13 = 1;
            goto LABEL_17;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    id v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[HDMedicationNotificationEngine _validateConfigurationForCyclicSchedule:cycleIntervalIndex:]();
    }
  }
  uint64_t v13 = 0;
LABEL_17:

  return v13;
}

+ (unint64_t)_indexForGenerationDate:(void *)a3 schedule:(void *)a4 calendar:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0x8000000000000000;
  uint64_t v10 = [v7 timeIntervals];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__HDMedicationNotificationEngine__indexForGenerationDate_schedule_calendar___block_invoke;
  v25[3] = &unk_1E6337F68;
  v25[4] = v26;
  uint64_t v11 = objc_msgSend(v10, "hk_map:", v25);

  id v12 = [v7 startDateTime];
  uint64_t v13 = [v8 components:124 fromDate:v12];

  uint64_t v14 = [v7 cycleStartDate];
  if (v14)
  {
    id v15 = [v7 cycleStartDate];
  }
  else
  {
    id v15 = v13;
  }
  long long v16 = v15;

  long long v17 = [v8 dateFromComponents:v16];
  long long v18 = [v8 components:16 fromDate:v17 toDate:v6 options:2];
  uint64_t v19 = [v18 day];

  if (v19 < 0)
  {
    uint64_t v21 = objc_msgSend(v11, "hk_reversed");
    unint64_t v22 = +[HDMedicationNotificationEngine _indexThatDoesNotAddPastTotalDays:fromIntervalLengths:](v9, -v19, v21);
    uint64_t v23 = [v11 count];
    self;
    unint64_t v20 = v23 + ~v22;
  }
  else
  {
    unint64_t v20 = +[HDMedicationNotificationEngine _indexThatAddsPastTotalDays:fromIntervalLengths:](v9, v19, v11);
  }

  _Block_object_dispose(v26, 8);
  return v20;
}

+ (BOOL)_greaterThanOrEqualNextScheduledDate:(void *)a3 endDate:(void *)a4 calendar:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  uint64_t v9 = [v6 compareDate:v8 toDate:v7 toUnitGranularity:16];

  return v9 == 1;
}

+ (id)_makeScheduleItemAtDate:(void *)a3 withMonophasicInterval:(void *)a4 calendar:(void *)a5 schedule:(int)a6 cyclicIntervalIndex:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = self;
  id v15 = [v12 startTimeComponent];
  long long v16 = [v11 components:28 fromDate:v13];
  objc_msgSend(v16, "setHour:", objc_msgSend(v15, "hour"));
  objc_msgSend(v16, "setMinute:", objc_msgSend(v15, "minute"));
  objc_msgSend(v16, "setSecond:", objc_msgSend(v15, "second"));
  [v16 setCalendar:v11];
  long long v17 = [v16 date];
  uint64_t v18 = +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:](v14, v17, v10, v13, v11, a6, v12);

  id v19 = objc_alloc(MEMORY[0x1E4F66B58]);
  unint64_t v20 = [v10 UUID];
  uint64_t v21 = [v12 dose];

  unint64_t v22 = [v10 medicationIdentifier];

  uint64_t v23 = (void *)[v19 initWithScheduleUUID:v20 dose:v21 medicationIdentifier:v22 isLastScheduledDose:v18];
  id v24 = objc_alloc(MEMORY[0x1E4F66B50]);
  v28[0] = v23;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v26 = (void *)[v24 initWithScheduledDateTime:v17 notificationSent:0 doses:v25];

  return v26;
}

id __116__HDMedicationNotificationEngine__generateScheduleItemsAtDate_withMultiphasicSchedule_calendar_startGenerationDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 cycleIndex];
  id v5 = v4;
  if (v4 && [v4 integerValue] == *(void *)(a1 + 32)) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

id __76__HDMedicationNotificationEngine__indexForGenerationDate_schedule_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 cycleIndex];
  id v5 = v4;
  if (v4 && [v4 integerValue] == *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v6 = 0;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 integerValue];
    id v6 = [v3 cycleIntervalDays];
  }

  return v6;
}

+ (unint64_t)_indexThatDoesNotAddPastTotalDays:(void *)a3 fromIntervalLengths:
{
  id v4 = a3;
  self;
  if (a2 < 1)
  {
    unint64_t v6 = -1;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = -1;
    do
    {
      unint64_t v6 = (v6 + 1) % [v4 count];
      id v7 = [v4 objectAtIndexedSubscript:v6];
      v5 += [v7 integerValue];
    }
    while (v5 < a2);
  }

  return v6;
}

+ (unint64_t)_indexThatAddsPastTotalDays:(void *)a3 fromIntervalLengths:
{
  id v4 = a3;
  self;
  if (a2 < 0)
  {
    unint64_t v6 = -1;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = -1;
    do
    {
      unint64_t v6 = (v6 + 1) % [v4 count];
      id v7 = [v4 objectAtIndexedSubscript:v6];
      v5 += [v7 integerValue];
    }
    while (v5 <= a2);
  }

  return v6;
}

+ (BOOL)unitTesting_isLastScheduledDoseforScheduledDate:(id)a3 schedule:(id)a4 startGenerationDate:(id)a5 calendar:(id)a6 cycleIntervalIndex:(int)a7 interval:(id)a8
{
  return +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:]((uint64_t)a1, a3, a4, a5, a6, a7, a8);
}

+ (int64_t)unitTesting_calculateTotalDaysForSchedule:(id)a3 configuration:(id)a4 calendar:(id)a5 startGenerationDate:(id)a6
{
  return +[HDMedicationNotificationEngine _calculateTotalDaysForSchedule:configuration:calendar:startGenerationDate:]((uint64_t)a1, a3, a4, a5, a6);
}

+ (void)_isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_1BD54A000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Daily schedule has no timeInterval objects.", v2, v3, v4, v5, v6);
}

+ (void)_isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_1BD54A000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Day of Week schedule has no timeInterval objects.", v2, v3, v4, v5, v6);
}

+ (void)_validateConfigurationForCyclicSchedule:cycleIntervalIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_1BD54A000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Cyclic schedule has less than 2 intervals, expected at least 2.", v2, v3, v4, v5, v6);
}

+ (void)_validateConfigurationForCyclicSchedule:cycleIntervalIndex:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_1BD54A000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Cyclic schedule has no active intervals.", v2, v3, v4, v5, v6);
}

@end