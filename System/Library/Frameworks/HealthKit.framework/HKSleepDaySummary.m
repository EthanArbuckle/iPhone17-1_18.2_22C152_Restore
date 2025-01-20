@interface HKSleepDaySummary
+ (BOOL)supportsSecureCoding;
+ (id)daySummaryWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5 periods:(id)a6 schedules:(id)a7 sleepDurationGoal:(id)a8 creationInterval:(id)a9;
+ (id)emptyDaySummaryWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5;
- (BOOL)containsPeriodsWithAppleSleepTrackingData;
- (BOOL)getData:(id *)a3 error:(id *)a4;
- (BOOL)hasSleepStageData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWeeklyAggregatedSummary;
- (HKQuantity)sleepDurationGoal;
- (HKSleepDaySummary)initWithCoder:(id)a3;
- (HKSleepDaySummary)initWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5 periods:(id)a6 schedules:(id)a7 sleepDurationGoal:(id)a8 creationInterval:(id)a9;
- (HKSleepPeriod)lastSleepPeriod;
- (HKSleepPeriod)primarySleepPeriod;
- (HKSleepSchedule)primarySchedule;
- (NSArray)periodDurations;
- (NSArray)periods;
- (NSArray)schedules;
- (NSCalendar)calendar;
- (NSCalendar)gregorianCalendar;
- (NSDateInterval)creationInterval;
- (NSDateInterval)dateInterval;
- (NSString)description;
- (NSString)hk_redactedDescription;
- (_HKSleepDaySummaryDurations)totalDurations;
- (double)awakeDuration;
- (double)coreSleepDuration;
- (double)deepSleepDuration;
- (double)inBedDuration;
- (double)remSleepDuration;
- (double)sleepDuration;
- (double)unspecifiedSleepDuration;
- (id)_computePeriodDurationsForPeriods:(id)a3 dateInterval:(id)a4;
- (id)_computeTotalDurationsFromPeriodDurations:(id)a3;
- (id)_filterToPeriod:(id)a3;
- (id)summaryFilteredToLastPeriod;
- (id)summaryFilteredToPrimaryPeriod;
- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4;
- (int64_t)morningIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSleepDaySummary

- (HKSleepDaySummary)initWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5 periods:(id)a6 schedules:(id)a7 sleepDurationGoal:(id)a8 creationInterval:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v40.receiver = self;
  v40.super_class = (Class)HKSleepDaySummary;
  v21 = [(HKSleepDaySummary *)&v40 init];
  v22 = v21;
  if (v21)
  {
    v21->_morningIndex = a3;
    uint64_t v23 = [v15 copy];
    dateInterval = v22->_dateInterval;
    v22->_dateInterval = (NSDateInterval *)v23;

    uint64_t v25 = [v16 copy];
    gregorianCalendar = v22->_gregorianCalendar;
    v22->_gregorianCalendar = (NSCalendar *)v25;

    uint64_t v27 = [v17 copy];
    periods = v22->_periods;
    v22->_periods = (NSArray *)v27;

    uint64_t v29 = [v18 copy];
    schedules = v22->_schedules;
    v22->_schedules = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    sleepDurationGoal = v22->_sleepDurationGoal;
    v22->_sleepDurationGoal = (HKQuantity *)v31;

    uint64_t v33 = [(HKSleepDaySummary *)v22 _computePeriodDurationsForPeriods:v17 dateInterval:v15];
    periodDurations = v22->_periodDurations;
    v22->_periodDurations = (NSArray *)v33;

    uint64_t v35 = [(HKSleepDaySummary *)v22 _computeTotalDurationsFromPeriodDurations:v22->_periodDurations];
    totalDurations = v22->_totalDurations;
    v22->_totalDurations = (_HKSleepDaySummaryDurations *)v35;

    uint64_t v37 = [v20 copy];
    creationInterval = v22->_creationInterval;
    v22->_creationInterval = (NSDateInterval *)v37;
  }
  return v22;
}

+ (id)daySummaryWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5 periods:(id)a6 schedules:(id)a7 sleepDurationGoal:(id)a8 creationInterval:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = [[HKSleepDaySummary alloc] initWithMorningIndex:a3 dateInterval:v20 calendar:v19 periods:v18 schedules:v17 sleepDurationGoal:v16 creationInterval:v15];

  return v21;
}

+ (id)emptyDaySummaryWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5
{
  return (id)[a1 daySummaryWithMorningIndex:a3 dateInterval:a4 calendar:a5 periods:MEMORY[0x1E4F1CBF0] schedules:MEMORY[0x1E4F1CBF0] sleepDurationGoal:0 creationInterval:0];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [NSNumber numberWithInteger:self->_morningIndex];
  v7 = [(NSDateInterval *)self->_dateInterval startDate];
  v8 = [(NSDateInterval *)self->_dateInterval endDate];
  v9 = [v3 stringWithFormat:@"<%@:%p %@ (%@ - %@), goal = %@, schedules = %@, periods = %@, calendar = %@>", v5, self, v6, v7, v8, self->_sleepDurationGoal, self->_schedules, self->_periods, self->_gregorianCalendar];

  return (NSString *)v9;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [NSNumber numberWithInteger:self->_morningIndex];
  v7 = [(NSDateInterval *)self->_dateInterval startDate];
  v8 = [(NSDateInterval *)self->_dateInterval endDate];
  v9 = [v3 stringWithFormat:@"<%@:%p %@ (%@ - %@)>", v5, self, v6, v7, v8, 0];

  return (NSString *)v9;
}

- (NSCalendar)calendar
{
  return self->_gregorianCalendar;
}

- (double)inBedDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 inBedDuration];
  double v4 = v3;

  return v4;
}

- (double)sleepDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 sleepDuration];
  double v4 = v3;

  return v4;
}

- (double)unspecifiedSleepDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 unspecifiedSleepDuration];
  double v4 = v3;

  return v4;
}

- (double)coreSleepDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 coreSleepDuration];
  double v4 = v3;

  return v4;
}

- (double)deepSleepDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 deepSleepDuration];
  double v4 = v3;

  return v4;
}

- (double)remSleepDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 remSleepDuration];
  double v4 = v3;

  return v4;
}

- (double)awakeDuration
{
  v2 = [(HKSleepDaySummary *)self totalDurations];
  [v2 awakeDuration];
  double v4 = v3;

  return v4;
}

- (id)_computePeriodDurationsForPeriods:(id)a3 dateInterval:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKSleepDaySummary__computePeriodDurationsForPeriods_dateInterval___block_invoke;
  v9[3] = &unk_1E58C2850;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "hk_map:", v9);

  return v7;
}

id __68__HKSleepDaySummary__computePeriodDurationsForPeriods_dateInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_HKSleepDaySummaryDurations durationsFromSleepPeriod:a2 dateInterval:*(void *)(a1 + 32)];
}

- (id)_computeTotalDurationsFromPeriodDurations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v10 = [v6 durationsByAdding:v9];

          id v6 = (id)v10;
        }
        else
        {
          id v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (HKSleepPeriod)lastSleepPeriod
{
  v2 = [(HKSleepDaySummary *)self periods];
  id v3 = [v2 lastObject];

  return (HKSleepPeriod *)v3;
}

- (HKSleepPeriod)primarySleepPeriod
{
  id v3 = [(HKSleepDaySummary *)self periodDurations];
  uint64_t v4 = (void *)[v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v4 = 0;
    double v6 = 0.0;
    do
    {
      uint64_t v7 = [(HKSleepDaySummary *)self periodDurations];
      v8 = [v7 objectAtIndexedSubscript:v5];
      [v8 maxDuration];
      double v10 = v9;

      if (v10 > v6)
      {
        v11 = [(HKSleepDaySummary *)self periods];
        uint64_t v12 = [v11 objectAtIndexedSubscript:v5];

        uint64_t v4 = (void *)v12;
        double v6 = v10;
      }
      ++v5;
      long long v13 = [(HKSleepDaySummary *)self periodDurations];
      unint64_t v14 = [v13 count];
    }
    while (v5 < v14);
  }

  return (HKSleepPeriod *)v4;
}

- (HKSleepSchedule)primarySchedule
{
  schedules = self->_schedules;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__HKSleepDaySummary_primarySchedule__block_invoke;
  v5[3] = &unk_1E58C2878;
  v5[4] = self;
  id v3 = [(NSArray *)schedules hk_firstObjectWithMaximumValueUsingEvaluationBlock:v5];

  return (HKSleepSchedule *)v3;
}

double __36__HKSleepDaySummary_primarySchedule__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bedtimeDateIntervalForMorningIndex:*(void *)(*(void *)(a1 + 32) + 8) calendar:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v4 = [v3 intersectionWithDateInterval:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 duration];
  double v6 = v5;

  return v6;
}

- (BOOL)containsPeriodsWithAppleSleepTrackingData
{
  return [(NSArray *)self->_periods hk_containsObjectPassingTest:&__block_literal_global_49];
}

uint64_t __62__HKSleepDaySummary_containsPeriodsWithAppleSleepTrackingData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsSegmentsWithAppleSleepTrackingData];
}

- (BOOL)hasSleepStageData
{
  [(HKSleepDaySummary *)self coreSleepDuration];
  if (v3 > 0.0) {
    return 1;
  }
  [(HKSleepDaySummary *)self deepSleepDuration];
  if (v4 > 0.0) {
    return 1;
  }
  [(HKSleepDaySummary *)self remSleepDuration];
  return v6 > 0.0;
}

- (BOOL)isWeeklyAggregatedSummary
{
  double v3 = (void *)MEMORY[0x1E4F28C18];
  int64_t v4 = [(HKSleepDaySummary *)self morningIndex];
  double v5 = [(HKSleepDaySummary *)self calendar];
  double v6 = objc_msgSend(v3, "hk_sleepWeekIntervalForMorningIndex:calendar:", v4, v5);

  uint64_t v7 = [(HKSleepDaySummary *)self dateInterval];
  LOBYTE(v4) = [v6 isEqual:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t morningIndex = self->_morningIndex;
  id v5 = a3;
  [v5 encodeInteger:morningIndex forKey:@"MorningIndex"];
  [v5 encodeObject:self->_dateInterval forKey:@"DateInterval"];
  [v5 encodeObject:self->_gregorianCalendar forKey:@"Calendar"];
  [v5 encodeObject:self->_periods forKey:@"Periods"];
  [v5 encodeObject:self->_schedules forKey:@"Schedules"];
  [v5 encodeObject:self->_sleepDurationGoal forKey:@"SleepDurationGoal"];
  [v5 encodeObject:self->_creationInterval forKey:@"CreationInterval"];
}

- (HKSleepDaySummary)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"MorningIndex"];
  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateInterval"];
  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Calendar"];
  double v6 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v7 = [v6 setWithArray:v18];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"Periods"];
  double v9 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v11 = [v9 setWithArray:v10];
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"Schedules"];
  long long v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SleepDurationGoal"];
  unint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationInterval"];

  long long v15 = [(HKSleepDaySummary *)self initWithMorningIndex:v5 dateInterval:v19 calendar:v17 periods:v8 schedules:v12 sleepDurationGoal:v13 creationInterval:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = [(HKSleepDaySummary *)self schedules];
  uint64_t v8 = [v7 count];
  double v9 = [v6 schedules];
  uint64_t v10 = [v9 count];

  if (v8 == v10)
  {
    v11 = [(HKSleepDaySummary *)self schedules];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      unint64_t v13 = 0;
      do
      {
        unint64_t v14 = [(HKSleepDaySummary *)self schedules];
        long long v15 = [v14 objectAtIndexedSubscript:v13];
        id v16 = [v6 schedules];
        uint64_t v17 = [v16 objectAtIndexedSubscript:v13];
        uint64_t v3 = [v15 isEquivalent:v17];

        if ((v3 & 1) == 0) {
          goto LABEL_11;
        }
        ++v13;
        id v18 = [(HKSleepDaySummary *)self schedules];
        unint64_t v19 = [v18 count];
      }
      while (v13 < v19);
    }
    int64_t v20 = [(HKSleepDaySummary *)self morningIndex];
    if (v20 == [v6 morningIndex])
    {
      v21 = [(HKSleepDaySummary *)self dateInterval];
      v22 = [v6 dateInterval];
      if (v21 != v22)
      {
        v65 = [v6 dateInterval];
        if (!v65)
        {
          char v24 = 0;
          goto LABEL_62;
        }
        uint64_t v23 = [(HKSleepDaySummary *)self dateInterval];
        v64 = [v6 dateInterval];
        if (!objc_msgSend(v23, "isEqual:"))
        {
          char v24 = 0;
LABEL_61:

          goto LABEL_62;
        }
        v63 = v23;
      }
      uint64_t v26 = [(HKSleepDaySummary *)self calendar];
      uint64_t v27 = [v6 calendar];
      v66 = (void *)v26;
      if ((void *)v26 != v27)
      {
        uint64_t v28 = [v6 calendar];
        if (!v28)
        {
LABEL_37:

LABEL_38:
          char v24 = 0;
          goto LABEL_60;
        }
        v60 = (void *)v28;
        id v4 = [(HKSleepDaySummary *)self calendar];
        uint64_t v29 = [v6 calendar];
        if (([v4 isEqual:v29] & 1) == 0)
        {

LABEL_36:
          goto LABEL_37;
        }
        v58 = v29;
      }
      v30 = [(HKSleepDaySummary *)self periods];
      [v6 periods];
      v62 = v61 = v30;
      if (v30 == v62) {
        goto LABEL_23;
      }
      uint64_t v31 = [v6 periods];
      if (!v31)
      {
        v59 = v4;
        char v24 = 0;
        v36 = v58;
        uint64_t v37 = v61;
        goto LABEL_55;
      }
      v56 = (void *)v31;
      v30 = [(HKSleepDaySummary *)self periods];
      v32 = [v6 periods];
      if ([v30 isEqual:v32])
      {
        v53 = v32;
LABEL_23:
        uint64_t v33 = [(HKSleepDaySummary *)self sleepDurationGoal];
        v57 = [v6 sleepDurationGoal];
        v59 = v4;
        if (v33 == v57)
        {
          v54 = v33;
          v55 = v30;
        }
        else
        {
          uint64_t v34 = [v6 sleepDurationGoal];
          if (!v34)
          {
            char v24 = 0;
            v45 = v58;
            v46 = v61;
            goto LABEL_42;
          }
          v52 = (void *)v34;
          uint64_t v35 = [(HKSleepDaySummary *)self sleepDurationGoal];
          uint64_t v3 = [v6 sleepDurationGoal];
          v55 = v30;
          if (([v35 isEqual:v3] & 1) == 0)
          {

            char v24 = 0;
LABEL_53:
            uint64_t v37 = v61;
            v49 = v62;
            v36 = v58;
            if (v61 == v62) {
              goto LABEL_56;
            }

LABEL_55:
            v49 = v62;
LABEL_56:

            if (v66 != v27)
            {

              goto LABEL_58;
            }
            goto LABEL_59;
          }
          v50 = v35;
          v54 = v33;
        }
        v38 = [(HKSleepDaySummary *)self creationInterval];
        uint64_t v39 = [v6 creationInterval];
        char v24 = v38 == (void *)v39;
        if (v38 == (void *)v39)
        {

          uint64_t v33 = v54;
          v47 = v57;
          if (v54 == v57) {
            goto LABEL_48;
          }
        }
        else
        {
          objc_super v40 = (void *)v39;
          v51 = (void *)v3;
          uint64_t v41 = [v6 creationInterval];
          if (v41)
          {
            v42 = (void *)v41;
            v43 = [(HKSleepDaySummary *)self creationInterval];
            v44 = [v6 creationInterval];
            char v24 = [v43 isEqual:v44];

            if (v54 == v57)
            {
            }
            else
            {
            }
            goto LABEL_53;
          }

          uint64_t v33 = v54;
          v47 = v57;
          if (v54 == v57)
          {
LABEL_48:

            v46 = v61;
            v48 = v62;
            v45 = v58;
            v30 = v55;
            if (v61 == v62)
            {
LABEL_44:

              if (v66 != v27)
              {

LABEL_58:
              }
LABEL_59:

LABEL_60:
              uint64_t v23 = v63;
              if (v21 != v22) {
                goto LABEL_61;
              }
LABEL_62:

              goto LABEL_12;
            }
LABEL_43:

            goto LABEL_44;
          }
        }

        v45 = v58;
        v46 = v61;
        v30 = v55;
LABEL_42:

        v48 = v62;
        if (v46 == v62) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }

      if (v66 == v27)
      {

        goto LABEL_38;
      }

      goto LABEL_36;
    }
  }
LABEL_11:
  char v24 = 0;
LABEL_12:

  return v24;
}

- (unint64_t)hash
{
  int64_t v3 = [(HKSleepDaySummary *)self morningIndex];
  id v4 = [(HKSleepDaySummary *)self dateInterval];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [(HKSleepDaySummary *)self calendar];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(HKSleepDaySummary *)self periods];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [(HKSleepDaySummary *)self schedules];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [(HKSleepDaySummary *)self sleepDurationGoal];
  unint64_t v13 = objc_msgSend(v12, "hk_secondsNumber");
  uint64_t v14 = v9 ^ v11 ^ [v13 hash];
  long long v15 = [(HKSleepDaySummary *)self creationInterval];
  unint64_t v16 = v14 ^ [v15 hash];

  return v16;
}

- (BOOL)getData:(id *)a3 error:(id *)a4
{
  id v13 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v13];
  id v8 = v13;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)HKLogSleep;
    if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_ERROR)) {
      -[HKSleepDaySummary getData:error:](v9, (uint64_t)self, (uint64_t)v8);
    }
    id v10 = v8;
    uint64_t v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }
  }
  return v7 != 0;
}

- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4
{
  return self->_morningIndex;
}

- (id)summaryFilteredToPrimaryPeriod
{
  int64_t v3 = [(HKSleepDaySummary *)self primarySleepPeriod];
  id v4 = [(HKSleepDaySummary *)self _filterToPeriod:v3];

  return v4;
}

- (id)summaryFilteredToLastPeriod
{
  int64_t v3 = [(HKSleepDaySummary *)self lastSleepPeriod];
  id v4 = [(HKSleepDaySummary *)self _filterToPeriod:v3];

  return v4;
}

- (id)_filterToPeriod:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [HKSleepDaySummary alloc];
    int64_t v6 = [(HKSleepDaySummary *)self morningIndex];
    uint64_t v7 = [(HKSleepDaySummary *)self dateInterval];
    id v8 = [(HKSleepDaySummary *)self calendar];
    v15[0] = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    id v10 = [(HKSleepDaySummary *)self schedules];
    uint64_t v11 = [(HKSleepDaySummary *)self sleepDurationGoal];
    uint64_t v12 = [(HKSleepDaySummary *)self creationInterval];
    id v13 = [(HKSleepDaySummary *)v5 initWithMorningIndex:v6 dateInterval:v7 calendar:v8 periods:v9 schedules:v10 sleepDurationGoal:v11 creationInterval:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (int64_t)morningIndex
{
  return self->_morningIndex;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)periods
{
  return self->_periods;
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (HKQuantity)sleepDurationGoal
{
  return self->_sleepDurationGoal;
}

- (NSDateInterval)creationInterval
{
  return self->_creationInterval;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (NSArray)periodDurations
{
  return self->_periodDurations;
}

- (_HKSleepDaySummaryDurations)totalDurations
{
  return self->_totalDurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDurations, 0);
  objc_storeStrong((id *)&self->_periodDurations, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_creationInterval, 0);
  objc_storeStrong((id *)&self->_sleepDurationGoal, 0);
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_storeStrong((id *)&self->_periods, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)getData:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  int v7 = 138543874;
  id v8 = (id)objc_opt_class();
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  id v6 = v8;
  _os_log_error_impl(&dword_19C023000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error archiving summary %{public}@ for caching: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end