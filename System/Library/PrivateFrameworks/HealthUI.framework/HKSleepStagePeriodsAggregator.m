@interface HKSleepStagePeriodsAggregator
+ (double)_maximumDurationFromSleepDaySummaries:(id)a3;
+ (id)_averageStartDateFromSleepDaySummaries:(id)a3 summaryDateInterval:(id)a4;
- (HKSleepStagePeriodsAggregator)initWithSleepDaySummaries:(id)a3 bucketSize:(double)a4 summaryDateInterval:(id)a5;
- (NSArray)buckets;
- (NSArray)sleepDaySummaries;
- (NSDate)startDate;
- (double)maximumDuration;
- (id)_aggregateSleepInterval;
- (id)_aggregateSleepPeriodSegments;
- (id)aggregateSleepPeriods;
- (int64_t)_bucketIndexForDistanceFromStart:(double)a3;
@end

@implementation HKSleepStagePeriodsAggregator

- (HKSleepStagePeriodsAggregator)initWithSleepDaySummaries:(id)a3 bucketSize:(double)a4 summaryDateInterval:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSleepStagePeriodsAggregator;
  v11 = [(HKSleepStagePeriodsAggregator *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sleepDaySummaries, a3);
    [(id)objc_opt_class() _maximumDurationFromSleepDaySummaries:v9];
    v12->_maximumDuration = v13;
    uint64_t v14 = [(id)objc_opt_class() _averageStartDateFromSleepDaySummaries:v9 summaryDateInterval:v10];
    startDate = v12->_startDate;
    v12->_startDate = (NSDate *)v14;

    uint64_t v16 = +[_HKSleepStageBucket bucketsWithSize:startOfSleep:maxSleepDuration:numberOfDays:](_HKSleepStageBucket, "bucketsWithSize:startOfSleep:maxSleepDuration:numberOfDays:", v12->_startDate, [v9 count], a4, v12->_maximumDuration);
    buckets = v12->_buckets;
    v12->_buckets = (NSArray *)v16;
  }
  return v12;
}

- (id)aggregateSleepPeriods
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HKSleepStagePeriodsAggregator *)self sleepDaySummaries];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(HKSleepStagePeriodsAggregator *)self _aggregateSleepPeriodSegments];
    if ([v5 count])
    {
      v6 = [(HKSleepStagePeriodsAggregator *)self _aggregateSleepInterval];
      v7 = [MEMORY[0x1E4F2B540] sleepPeriodWithDateInterval:v6 segments:v5];
      v10[0] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (id)_aggregateSleepInterval
{
  v3 = [(HKSleepStagePeriodsAggregator *)self startDate];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
    v5 = [(HKSleepStagePeriodsAggregator *)self startDate];
    [(HKSleepStagePeriodsAggregator *)self maximumDuration];
    v6 = objc_msgSend(v4, "initWithStartDate:duration:", v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_aggregateSleepPeriodSegments
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = [(HKSleepStagePeriodsAggregator *)self sleepDaySummaries];
  uint64_t v32 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v5 = objc_msgSend(v4, "hui_startOfSleep");
        if (v5)
        {
          uint64_t v33 = i;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v34 = [v4 periods];
          uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
          if (v36)
          {
            uint64_t v35 = *(void *)v46;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v46 != v35) {
                  objc_enumerationMutation(v34);
                }
                v7 = *(void **)(*((void *)&v45 + 1) + 8 * j);
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                v8 = [v7 segments];
                uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v54 count:16];
                if (v9)
                {
                  uint64_t v10 = v9;
                  uint64_t v11 = *(void *)v42;
                  do
                  {
                    for (uint64_t k = 0; k != v10; ++k)
                    {
                      if (*(void *)v42 != v11) {
                        objc_enumerationMutation(v8);
                      }
                      double v13 = *(void **)(*((void *)&v41 + 1) + 8 * k);
                      uint64_t v14 = [v13 dateInterval];
                      v15 = [v14 startDate];
                      [v15 timeIntervalSinceDate:v5];
                      double v17 = v16;

                      int64_t v18 = [(HKSleepStagePeriodsAggregator *)self _bucketIndexForDistanceFromStart:v17];
                      objc_super v19 = [(HKSleepStagePeriodsAggregator *)self buckets];
                      v20 = [v19 objectAtIndexedSubscript:v18];

                      [v20 updateWithSegment:v13];
                    }
                    uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v54 count:16];
                  }
                  while (v10);
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
            }
            while (v36);
          }

          uint64_t i = v33;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v32);
  }

  v21 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v22 = [(HKSleepStagePeriodsAggregator *)self buckets];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v37 + 1) + 8 * m) probableSleepPeriodSegment];
        if (v27) {
          [v21 addObject:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v24);
  }

  v28 = (void *)[v21 copy];
  return v28;
}

- (int64_t)_bucketIndexForDistanceFromStart:(double)a3
{
  v5 = [(HKSleepStagePeriodsAggregator *)self buckets];
  double v6 = (double)(unint64_t)[v5 count] * a3;
  [(HKSleepStagePeriodsAggregator *)self maximumDuration];
  unint64_t v8 = vcvtpd_s64_f64(v6 / v7);

  uint64_t v9 = [(HKSleepStagePeriodsAggregator *)self buckets];
  unint64_t v10 = [v9 count] - 1;

  if (v10 >= v8) {
    return v8;
  }
  else {
    return v10;
  }
}

+ (double)_maximumDurationFromSleepDaySummaries:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v7 = 0;
    unint64_t v8 = (double *)&v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__HKSleepStagePeriodsAggregator__maximumDurationFromSleepDaySummaries___block_invoke;
    v6[3] = &unk_1E6D53440;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    double v4 = v8[3];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

uint64_t __71__HKSleepStagePeriodsAggregator__maximumDurationFromSleepDaySummaries___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = objc_msgSend(a2, "hui_durationOfSleep");
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

+ (id)_averageStartDateFromSleepDaySummaries:(id)a3 summaryDateInterval:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v21;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v14, "hasSleepStageData", (void)v20) & 1) == 0)
          {
            [v14 unspecifiedSleepDuration];
            if (v15 == 0.0) {
              continue;
            }
          }
          objc_msgSend(v14, "hui_startOfSleepOffset");
          double v12 = v12 + v16;
          ++v10;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
      double v12 = 0.0;
    }

    int64_t v18 = [v6 startDate];
    double v17 = [v18 dateByAddingTimeInterval:v12 / (double)v10];
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (NSArray)sleepDaySummaries
{
  return self->_sleepDaySummaries;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sleepDaySummaries, 0);
}

@end