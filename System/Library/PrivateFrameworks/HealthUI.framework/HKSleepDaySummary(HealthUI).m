@interface HKSleepDaySummary(HealthUI)
+ (double)_findMidPointOffsetForSummary:()HealthUI sleepCategory:;
+ (id)_aggregateWeeklySummaryFromDailySummaries:()HealthUI calendar:strategy:;
+ (id)_computeAveragePeriodsFromSummaries:()HealthUI summaryDateInterval:;
+ (id)_computeProbablePeriodsFromSummaries:()HealthUI summaryDateInterval:;
+ (id)_endOfWeekContainingDate:()HealthUI calendar:;
+ (id)_lastNonEmptySchedules:()HealthUI;
+ (id)_lastNonZeroDurationGoal:()HealthUI;
+ (id)aggregateWeeklySummariesFromDailySummaries:()HealthUI firstWeekdayOverride:strategy:;
- (BOOL)hk_overlapsMidnightBasedDateInterval:()HealthUI gregorianCalendar:;
- (id)_secondsFromSummaryStartDateForDateComponents:()HealthUI;
- (id)hk_bedtimeGoalValue;
- (id)hk_sleepDurationGoalValue;
- (id)hk_wakeTimeGoalValue;
- (uint64_t)maxYValue;
- (uint64_t)minYValue;
@end

@implementation HKSleepDaySummary(HealthUI)

+ (id)aggregateWeeklySummariesFromDailySummaries:()HealthUI firstWeekdayOverride:strategy:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 firstObject];
  if (v8)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = [v8 calendar];
    v10 = (void *)[v9 copy];

    if (v7) {
      objc_msgSend(v10, "setFirstWeekday:", objc_msgSend(v7, "integerValue"));
    }
    id v30 = v7;
    uint64_t v11 = [v10 firstWeekday];
    v29 = v8;
    v12 = [v8 dateInterval];
    v13 = [v12 startDate];
    v14 = objc_msgSend(v10, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v11, v13, 1);

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v31 = v6;
    id obj = v6;
    uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v21 = [v20 dateInterval];
          v22 = [v21 endDate];

          if (objc_msgSend(v22, "hk_isBeforeOrEqualToDate:", v14))
          {
            [v15 addObject:v20];
          }
          else
          {
            v23 = [a1 _aggregateWeeklySummaryFromDailySummaries:v15 calendar:v10 strategy:a5];
            if (v23) {
              [v32 addObject:v23];
            }
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            [v24 addObject:v20];
            uint64_t v25 = objc_msgSend(v10, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v10, "firstWeekday"), v14, 1);

            id v15 = v24;
            v14 = (void *)v25;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v17);
    }

    v26 = [a1 _aggregateWeeklySummaryFromDailySummaries:v15 calendar:v10 strategy:a5];
    if (v26) {
      [v32 addObject:v26];
    }
    id v27 = v32;

    id v7 = v30;
    id v6 = v31;
    v8 = v29;
  }
  else
  {
    id v27 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v27;
}

- (uint64_t)minYValue
{
  return [NSNumber numberWithDouble:0.0];
}

- (uint64_t)maxYValue
{
  return [NSNumber numberWithDouble:0.0];
}

- (id)hk_bedtimeGoalValue
{
  v2 = [a1 primarySchedule];
  v3 = [v2 bedTimeComponents];
  v4 = [a1 _secondsFromSummaryStartDateForDateComponents:v3];

  return v4;
}

- (id)hk_wakeTimeGoalValue
{
  v2 = [a1 primarySchedule];
  v3 = [v2 wakeTimeComponents];
  v4 = [a1 _secondsFromSummaryStartDateForDateComponents:v3];

  return v4;
}

- (id)hk_sleepDurationGoalValue
{
  v2 = [a1 sleepDurationGoal];

  if (v2)
  {
    v3 = NSNumber;
    v4 = [a1 sleepDurationGoal];
    v5 = [MEMORY[0x1E4F2B618] secondUnit];
    [v4 doubleValueForUnit:v5];
    id v6 = objc_msgSend(v3, "numberWithDouble:");
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)hk_overlapsMidnightBasedDateInterval:()HealthUI gregorianCalendar:
{
  uint64_t v5 = objc_msgSend(a3, "hk_dayIndexRangeWithCalendar:", a4);
  uint64_t v7 = v6;
  uint64_t v8 = [a1 morningIndex];
  return v8 >= v5 && v8 - v5 < v7;
}

- (id)_secondsFromSummaryStartDateForDateComponents:()HealthUI
{
  id v4 = a3;
  uint64_t v5 = [a1 dateInterval];
  uint64_t v6 = [v5 startDate];

  uint64_t v7 = 0;
  if (v4 && v6)
  {
    uint64_t v8 = [a1 calendar];
    v9 = [v8 nextDateAfterDate:v6 matchingComponents:v4 options:512];

    [v9 timeIntervalSinceDate:v6];
    double v11 = v10;
    v12 = [a1 calendar];
    v13 = [v12 timeZone];

    [v13 daylightSavingTimeOffsetForDate:v9];
    double v15 = v14;
    [v13 daylightSavingTimeOffsetForDate:v6];
    uint64_t v7 = [NSNumber numberWithDouble:v11 + v15 - v16];
  }
  return v7;
}

+ (id)_aggregateWeeklySummaryFromDailySummaries:()HealthUI calendar:strategy:
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 firstObject];
  if (!v10)
  {
    v20 = 0;
    goto LABEL_13;
  }
  uint64_t v38 = a5;
  double v11 = [v8 lastObject];
  uint64_t v12 = [v10 morningIndex];
  id v40 = v9;
  id v13 = v9;
  long long v39 = v13;
  uint64_t v41 = a1;
  if ([v8 count] == 7)
  {
    uint64_t v37 = v12;
    id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
    double v15 = [v10 dateInterval];
    double v16 = [v15 startDate];
    uint64_t v17 = [v11 dateInterval];
    uint64_t v18 = [v17 endDate];
    v19 = (void *)[v14 initWithStartDate:v16 endDate:v18];
  }
  else
  {
    v21 = [v11 dateInterval];
    v22 = [v21 endDate];
    double v15 = [a1 _endOfWeekContainingDate:v22 calendar:v13];

    double v16 = [v13 dateByAddingUnit:0x2000 value:-1 toDate:v15 options:0];
    uint64_t v37 = objc_msgSend(v16, "hk_morningIndexWithCalendar:", v13);
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v15];
  }

  id v23 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v24 = [v10 creationInterval];
  uint64_t v25 = [v24 startDate];
  v26 = v11;
  id v27 = [v11 creationInterval];
  v28 = [v27 endDate];
  v29 = (void *)[v23 initWithStartDate:v25 endDate:v28];

  if (v38 == 1)
  {
    id v30 = v41;
    uint64_t v31 = [v41 _computeProbablePeriodsFromSummaries:v8 summaryDateInterval:v19];
  }
  else
  {
    id v30 = v41;
    if (v38)
    {
      id v32 = 0;
      goto LABEL_12;
    }
    uint64_t v31 = [v41 _computeAveragePeriodsFromSummaries:v8 summaryDateInterval:v19];
  }
  id v32 = (void *)v31;
LABEL_12:
  v33 = v26;
  v34 = [v30 _lastNonEmptySchedules:v8];
  v35 = [v30 _lastNonZeroDurationGoal:v8];
  v20 = [MEMORY[0x1E4F2B528] daySummaryWithMorningIndex:v37 dateInterval:v19 calendar:v39 periods:v32 schedules:v34 sleepDurationGoal:v35 creationInterval:v29];

  id v9 = v40;
LABEL_13:

  return v20;
}

+ (id)_lastNonEmptySchedules:()HealthUI
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 lastObject];
  uint64_t v5 = [v4 schedules];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "schedules", (void)v16);
        uint64_t v13 = [v12 count];

        if (v13)
        {
          uint64_t v14 = [v11 schedules];

          uint64_t v5 = (void *)v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_lastNonZeroDurationGoal:()HealthUI
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 lastObject];
  uint64_t v5 = [v4 sleepDurationGoal];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "sleepDurationGoal", (void)v20);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [v11 sleepDurationGoal];
          double v15 = [MEMORY[0x1E4F2B618] secondUnit];
          [v14 doubleValueForUnit:v15];
          double v17 = v16;

          if (v17 > 0.0)
          {
            uint64_t v18 = [v11 sleepDurationGoal];

            uint64_t v5 = (void *)v18;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_computeAveragePeriodsFromSummaries:()HealthUI summaryDateInterval:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v49 = a4;
  id obj = v6;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = 0.0;
    uint64_t v10 = *(void *)v56;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        [a1 _findMidPointOffsetForSummary:v17 sleepCategory:0];
        double v19 = v18;
        if (v18 != -1.79769313e308)
        {
          [v17 inBedDuration];
          double v15 = v15 + v20;
          double v14 = v14 + v19;
          double v13 = v13 + 1.0;
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v21 = _HKCategoryValueSleepAnalysisAsleepValues();
        uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v52 != v24) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(a1, "_findMidPointOffsetForSummary:sleepCategory:", v17, objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * j), "integerValue"));
              double v27 = v26;
              if (v26 != -1.79769313e308)
              {
                [v17 sleepDuration];
                double v12 = v12 + v28;
                double v11 = v11 + v27;
                double v9 = v9 + 1.0;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v60 count:16];
          }
          while (v23);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v8);
  }
  else
  {
    double v9 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
  }
  if (v13 == 0.0 && v9 == 0.0)
  {
    v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v30 = [v49 startDate];
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v13 <= 0.0)
    {
      long long v36 = 0;
      v35 = 0;
    }
    else
    {
      id v32 = [v30 dateByAddingTimeInterval:v14 / v13 + v15 / v13 * -0.5];
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v32 duration:v15 / v13];
      v34 = [MEMORY[0x1E4F2B548] sleepPeriodSegmentWithDateInterval:v33 category:0];
      [v31 addObject:v34];
      v35 = [v33 startDate];
      long long v36 = [v33 endDate];
    }
    if (v9 > 0.0)
    {
      uint64_t v37 = [v30 dateByAddingTimeInterval:v11 / v9 + v12 / v9 * -0.5];
      uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v37 duration:v12 / v9];
      long long v39 = [MEMORY[0x1E4F2B548] sleepPeriodSegmentWithDateInterval:v38 category:_HKCategoryValueSleepAnalysisDefaultAsleepValue()];
      [v31 addObject:v39];
      if (!v35
        || ([v38 startDate],
            id v40 = objc_claimAutoreleasedReturnValue(),
            int v41 = objc_msgSend(v40, "hk_isBeforeDate:", v35),
            v40,
            v41))
      {
        uint64_t v42 = [v38 startDate];

        v35 = (void *)v42;
      }
      if (!v36
        || ([v38 endDate],
            v43 = objc_claimAutoreleasedReturnValue(),
            int v44 = objc_msgSend(v43, "hk_isAfterDate:", v36),
            v43,
            v44))
      {
        uint64_t v45 = [v38 endDate];

        long long v36 = (void *)v45;
      }
    }
    v29 = (void *)MEMORY[0x1E4F1CBF0];
    if (v35 && v36)
    {
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v35 endDate:v36];
      v47 = [MEMORY[0x1E4F2B540] sleepPeriodWithDateInterval:v46 segments:v31];
      v59 = v47;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    }
  }

  return v29;
}

+ (double)_findMidPointOffsetForSummary:()HealthUI sleepCategory:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v36 = a3;
  id obj = [v36 periods];
  uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  uint64_t v5 = 0;
  id v6 = 0;
  if (!v39)
  {
    double v27 = -1.79769313e308;
    double v28 = obj;
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v38 = *(void *)v54;
  uint64_t v41 = a4;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v54 != v38) {
        objc_enumerationMutation(obj);
      }
      uint64_t v40 = v7;
      uint64_t v8 = *(void **)(*((void *)&v53 + 1) + 8 * v7);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v44 = [v8 segments];
      uint64_t v9 = [v44 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v50;
        uint64_t v42 = *(void *)v50;
        do
        {
          uint64_t v12 = 0;
          uint64_t v43 = v10;
          do
          {
            if (*(void *)v50 != v11) {
              objc_enumerationMutation(v44);
            }
            double v13 = *(void **)(*((void *)&v49 + 1) + 8 * v12);
            if ([v13 category] == a4)
            {
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              double v14 = [v13 sampleIntervals];
              uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v57 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v46;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v46 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    double v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    if (!v6
                      || ([*(id *)(*((void *)&v45 + 1) + 8 * i) startDate],
                          double v20 = objc_claimAutoreleasedReturnValue(),
                          int v21 = objc_msgSend(v20, "hk_isBeforeDate:", v6),
                          v20,
                          v21))
                    {
                      uint64_t v22 = [v19 startDate];

                      id v6 = (void *)v22;
                    }
                    if (v5)
                    {
                      uint64_t v23 = [v19 endDate];
                      int v24 = objc_msgSend(v23, "hk_isAfterDate:", v5);

                      if (!v24) {
                        continue;
                      }
                    }
                    uint64_t v25 = [v19 endDate];

                    uint64_t v5 = (void *)v25;
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v57 count:16];
                }
                while (v16);
              }

              a4 = v41;
              uint64_t v11 = v42;
              uint64_t v10 = v43;
            }
            ++v12;
          }
          while (v12 != v10);
          uint64_t v10 = [v44 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v10);
      }

      uint64_t v7 = v40 + 1;
    }
    while (v40 + 1 != v39);
    uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  }
  while (v39);

  if (v6)
  {
    if (v5)
    {
      HKDateMid();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26) {
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    v29 = 0;
    uint64_t v5 = v6;
LABEL_39:
    id v26 = v5;
    uint64_t v5 = v29;
LABEL_40:
    double v28 = v26;
    [v26 timeIntervalSinceReferenceDate];
    double v31 = v30;
    id v32 = [v36 dateInterval];
    v33 = [v32 startDate];
    [v33 timeIntervalSinceReferenceDate];
    double v27 = v31 - v34;

    goto LABEL_41;
  }
  v29 = v5;
  if (v5) {
    goto LABEL_39;
  }
  id v6 = 0;
LABEL_37:
  double v27 = -1.79769313e308;
LABEL_42:

  return v27;
}

+ (id)_endOfWeekContainingDate:()HealthUI calendar:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v6, "firstWeekday"), v5, 1);
  id v8 = v5;
  uint64_t v9 = [v6 dateByAddingUnit:16 value:1 toDate:v8 options:0];
  if (objc_msgSend(v9, "hk_isBeforeDate:", v7))
  {
    uint64_t v10 = v8;
    do
    {
      id v11 = v9;

      uint64_t v9 = [v6 dateByAddingUnit:16 value:1 toDate:v11 options:0];

      uint64_t v10 = v11;
    }
    while ((objc_msgSend(v9, "hk_isBeforeDate:", v7) & 1) != 0);
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

+ (id)_computeProbablePeriodsFromSummaries:()HealthUI summaryDateInterval:
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[HKSleepStagePeriodsAggregator alloc] initWithSleepDaySummaries:v6 bucketSize:v5 summaryDateInterval:600.0];

  id v8 = [(HKSleepStagePeriodsAggregator *)v7 aggregateSleepPeriods];

  return v8;
}

@end