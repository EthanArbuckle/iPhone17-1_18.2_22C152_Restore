@interface HDSleepDaySummaryBuilder
+ (id)dateIntervalForDayIndexRange:(id)a3 gregorianCalendar:(id)a4;
- (BOOL)scheduleAppliesToWeekday:(id)a3;
- (HDSleepDaySummaryBuilder)initWithProfile:(id)a3 dayIndexRange:(id)a4 weekday:(unint64_t)a5 options:(unint64_t)a6 gregorianCalendar:(id)a7 sourceOrderProvider:(id)a8;
- (HDSleepDaySummaryBuilder)initWithProfile:(id)a3 morningIndex:(int64_t)a4 weekday:(unint64_t)a5 options:(unint64_t)a6 gregorianCalendar:(id)a7 sourceOrderProvider:(id)a8;
- (NSCalendar)calendar;
- (NSDateInterval)dateInterval;
- (id)applicableSleepSchedules;
- (id)createDaySummary;
- (id)sleepAnalysisSamples;
- (id)sleepDurationGoalSamples;
- (id)sleepScheduleSamples;
- (int64_t)morningIndex;
- (int64_t)numberOfDays;
- (unint64_t)options;
- (void)addOrderedSample:(id)a3;
@end

@implementation HDSleepDaySummaryBuilder

- (HDSleepDaySummaryBuilder)initWithProfile:(id)a3 dayIndexRange:(id)a4 weekday:(unint64_t)a5 options:(unint64_t)a6 gregorianCalendar:(id)a7 sourceOrderProvider:(id)a8
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HDSleepDaySummaryBuilder;
  v17 = [(HDSleepDaySummaryBuilder *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v14);
    objc_storeWeak((id *)&v18->_sourceOrderProvider, v16);
    v18->_dayIndexRange.start = var0;
    v18->_dayIndexRange.duration = var1;
    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "dateIntervalForDayIndexRange:gregorianCalendar:", var0, var1, v15);
    dateInterval = v18->_dateInterval;
    v18->_dateInterval = (NSDateInterval *)v19;

    v18->_weekday = a5;
    objc_storeStrong((id *)&v18->_gregorianCalendar, a7);
    v18->_options = a6;
    v18->_containsAsleepOrInBedData = 0;
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sleepAnalysisSamples = v18->_sleepAnalysisSamples;
    v18->_sleepAnalysisSamples = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sleepScheduleSamples = v18->_sleepScheduleSamples;
    v18->_sleepScheduleSamples = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sleepDurationGoalSamples = v18->_sleepDurationGoalSamples;
    v18->_sleepDurationGoalSamples = v25;
  }
  return v18;
}

- (HDSleepDaySummaryBuilder)initWithProfile:(id)a3 morningIndex:(int64_t)a4 weekday:(unint64_t)a5 options:(unint64_t)a6 gregorianCalendar:(id)a7 sourceOrderProvider:(id)a8
{
  return -[HDSleepDaySummaryBuilder initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:](self, "initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:", a3, a4, 1, a5, a6, a7, a8);
}

- (int64_t)morningIndex
{
  return self->_dayIndexRange.start;
}

- (int64_t)numberOfDays
{
  return self->_dayIndexRange.duration;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSCalendar)calendar
{
  return self->_gregorianCalendar;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)addOrderedSample:(id)a3
{
  id v10 = a3;
  v5 = [v10 sampleType];
  uint64_t v6 = [v5 code];

  switch(v6)
  {
    case 198:
      id v7 = v10;
      if ([(NSMutableArray *)self->_sleepScheduleSamples containsObject:v7]) {
        break;
      }
      sleepScheduleSamples = self->_sleepScheduleSamples;
LABEL_11:
      [(NSMutableArray *)sleepScheduleSamples addObject:v7];
      break;
    case 197:
      id v7 = v10;
      if ([(NSMutableArray *)self->_sleepDurationGoalSamples containsObject:v7]) {
        break;
      }
      sleepScheduleSamples = self->_sleepDurationGoalSamples;
      goto LABEL_11;
    case 63:
      id v7 = v10;
      [(NSMutableArray *)self->_sleepAnalysisSamples addObject:v7];
      uint64_t v8 = [v7 value];
      if (!self->_containsAsleepOrInBedData && v8 != 2) {
        self->_containsAsleepOrInBedData = 1;
      }
      break;
    default:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"HDSleepDaySummaryBuilder.m", 125, @"%@: Invalid data type", objc_opt_class() object file lineNumber description];
      break;
  }
}

+ (id)dateIntervalForDayIndexRange:(id)a3 gregorianCalendar:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "hk_sleepDayStartForMorningIndex:calendar:", var0, v7);
  v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", var0 + var1, v7);

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];

  return v10;
}

- (id)sleepAnalysisSamples
{
  return self->_sleepAnalysisSamples;
}

- (id)sleepScheduleSamples
{
  return self->_sleepScheduleSamples;
}

- (id)sleepDurationGoalSamples
{
  return self->_sleepDurationGoalSamples;
}

- (BOOL)scheduleAppliesToWeekday:(id)a3
{
  id v4 = a3;
  if ([v4 weekdays]) {
    BOOL v5 = (self->_weekday & [v4 weekdays]) != 0;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)applicableSleepSchedules
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [(HDSleepDaySummaryBuilder *)self sleepScheduleSamples];
  int64_t v38 = [(HDSleepDaySummaryBuilder *)self morningIndex];
  id v4 = [(HDSleepDaySummaryBuilder *)self calendar];
  v37 = [(HDSleepDaySummaryBuilder *)self dateInterval];
  id v5 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35 = objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_100);
  id v40 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v33 = v3;
  uint64_t v6 = v3;
  id v7 = self;
  uint64_t v8 = v5;
  id obj = [v6 reverseObjectEnumerator];
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    v43 = v8;
    v36 = v7;
    uint64_t v39 = *(void *)v45;
    do
    {
      uint64_t v12 = 0;
      uint64_t v41 = v10;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
        if ([(HDSleepDaySummaryBuilder *)v7 scheduleAppliesToWeekday:v13])
        {
          id v14 = (void *)MEMORY[0x1E4F1CAF0];
          id v15 = [v13 _timeZoneName];
          id v16 = [v14 timeZoneWithName:v15];

          v17 = [v40 calendarForTimeZone:v16];
          if ([v13 weekdays])
          {
            v18 = [v13 wakeDateComponentsForMorningIndex:v38 calendar:v17];
            uint64_t v19 = [v18 date];
            v20 = [v13 startDate];
            int v21 = objc_msgSend(v20, "hk_isBeforeDate:", v19);

            if (v21)
            {
              v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "hk_dayIndex"));
              char v23 = [v35 containsObject:v22];

              uint64_t v8 = v43;
              if (v23) {
                goto LABEL_23;
              }
LABEL_12:
              v24 = [v13 _timeZoneName];
              v25 = v4;
              v26 = [v4 timeZone];
              v27 = [v26 name];
              int v28 = [v24 isEqualToString:v27];

              if (v28 && v19)
              {
                id v4 = v25;
                v18 = [v13 bedtimeDateIntervalForWakeTime:v19 calendar:v25];
                uint64_t v8 = v43;
              }
              else
              {
                uint64_t v29 = v38;
                uint64_t v8 = v43;
                if (![v13 weekdays])
                {
                  v30 = [v13 overrideDayIndex];
                  uint64_t v29 = [v30 integerValue];

                  uint64_t v8 = v43;
                }
                id v4 = v25;
                v18 = [v13 bedtimeDateIntervalForMorningIndex:v29 calendar:v25];
              }
              id v7 = v36;
              if ([v18 intersectsDateInterval:v37]
                && ([v8 hasOverlapWithInterval:v18] & 1) == 0)
              {
                [v8 insertInterval:v18];
                [v34 addObject:v13];
              }
            }
            else
            {
              uint64_t v8 = v43;
            }

LABEL_23:
            uint64_t v11 = v39;
            uint64_t v10 = v41;
            goto LABEL_24;
          }
          uint64_t v19 = 0;
          goto LABEL_12;
        }
LABEL_24:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v10);
  }

  v31 = (void *)[v34 copy];

  return v31;
}

id __52__HDSleepDaySummaryBuilder_applicableSleepSchedules__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 weekdays])
  {
    v3 = 0;
  }
  else
  {
    v3 = [v2 wakeTimeComponents];

    if (v3)
    {
      v3 = [v2 overrideDayIndex];
    }
  }

  return v3;
}

uint64_t __57__HDSleepDaySummaryBuilder__creationIntervalFromSamples___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 _creationDate];
  uint64_t v6 = [v4 _creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)createDaySummary
{
  id v2 = self;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = [(HDSleepDaySummaryBuilder *)self sleepAnalysisSamples];
  id v4 = v3;
  if (v2)
  {
    if (v2->_containsAsleepOrInBedData)
    {
      id v59 = v3;
      id v5 = v3;
      uint64_t v6 = v2->_options & 1;
      uint64_t v7 = [HDSleepPeriodSegmentArrayBuilder alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&v2->_profile);
      uint64_t v9 = [(HDSleepDaySummaryBuilder *)v2 morningIndex];
      gregorianCalendar = v2->_gregorianCalendar;
      id v11 = objc_loadWeakRetained((id *)&v2->_sourceOrderProvider);
      id v12 = [(HDSleepPeriodSegmentArrayBuilder *)v7 initProfile:WeakRetained morningIndex:v9 options:v6 gregorianCalendar:gregorianCalendar sourceOrderProvider:v11];

      v57 = [v12 sortedSleepPeriodSegmentsFromSamples:v5];

      v58 = v2;
      uint64_t v56 = v2->_options & 1;
      id v13 = v5;
      id v60 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
      [v60 setMergeIntervals:1];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v63;
        uint64_t v18 = *MEMORY[0x1E4F2BBD0];
        uint64_t v19 = *MEMORY[0x1E4F2BBD8];
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v63 != v17) {
              objc_enumerationMutation(v14);
            }
            int v21 = [*(id *)(*((void *)&v62 + 1) + 8 * i) metadata];
            v22 = [v21 objectForKeyedSubscript:v18];
            uint64_t v23 = [v21 objectForKeyedSubscript:v19];
            v24 = (void *)v23;
            if (v22) {
              BOOL v25 = v23 == 0;
            }
            else {
              BOOL v25 = 1;
            }
            if (!v25 && [v22 compare:v23] == -1)
            {
              v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v22 endDate:v24];
              [v60 insertInterval:v26];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v62 objects:v66 count:16];
        }
        while (v16);
      }

      v27 = [HDSleepPeriodInfo alloc];
      int v28 = [v60 mergedIntervals];
      uint64_t v29 = [(HDSleepPeriodInfo *)v27 initWithUserSetSchedules:v28];

      v30 = [[HDSleepPeriodArrayBuilder alloc] initWithInfo:v29 options:v56];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v31 = v57;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v62 objects:v66 count:16];
      id v2 = v58;
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v63 != v34) {
              objc_enumerationMutation(v31);
            }
            [(HDSleepPeriodArrayBuilder *)v30 addOrderedSegment:*(void *)(*((void *)&v62 + 1) + 8 * j)];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v62 objects:v66 count:16];
        }
        while (v33);
      }

      v36 = [(HDSleepPeriodArrayBuilder *)v30 finish];

      id v4 = v59;
    }
    else
    {
      v36 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v36 = 0;
  }

  v37 = [(HDSleepDaySummaryBuilder *)v2 applicableSleepSchedules];
  if (v2)
  {
    int64_t v38 = [(HDSleepDaySummaryBuilder *)v2 sleepDurationGoalSamples];
    uint64_t v39 = [v38 lastObject];
    id v40 = [v39 quantity];

    id v41 = v4;
    if ([v41 count])
    {
      v42 = [v41 sortedArrayUsingComparator:&__block_literal_global_296];
      id v43 = objc_alloc(MEMORY[0x1E4F28C18]);
      long long v44 = [v42 firstObject];
      long long v45 = [v44 _creationDate];
      [v42 lastObject];
      v61 = v37;
      v47 = long long v46 = v2;
      [v47 _creationDate];
      v48 = v40;
      v50 = uint64_t v49 = v36;
      v51 = (void *)[v43 initWithStartDate:v45 endDate:v50];

      v36 = v49;
      id v40 = v48;

      id v2 = v46;
      v37 = v61;

      goto LABEL_31;
    }
  }
  else
  {
    id v52 = v4;
    id v40 = 0;
  }
  v51 = 0;
LABEL_31:

  objc_msgSend(MEMORY[0x1E4F2B528], "daySummaryWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", -[HDSleepDaySummaryBuilder morningIndex](v2, "morningIndex"), v2->_dateInterval, v2->_gregorianCalendar, v36, v37, v40, v51);
  v54 = v53 = v4;

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepDurationGoalSamples, 0);
  objc_storeStrong((id *)&self->_sleepScheduleSamples, 0);
  objc_storeStrong((id *)&self->_sleepAnalysisSamples, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_destroyWeak((id *)&self->_sourceOrderProvider);

  objc_destroyWeak((id *)&self->_profile);
}

@end