@interface HDSleepPeriodSegmentArrayBuilder
- (double)_timeIntervalForKey:(double)a3 defaultValue:;
- (id)_computeStatisticsFromSamples:(void *)a3 sampleFilterBlock:;
- (id)_sleepPeriodSegmentsFromStatistics:(uint64_t)a1;
- (id)initProfile:(id)a3 morningIndex:(int64_t)a4 options:(unint64_t)a5 gregorianCalendar:(id)a6 sourceOrderProvider:(id)a7;
- (id)sortedSleepPeriodSegmentsFromSamples:(id)a3;
@end

@implementation HDSleepPeriodSegmentArrayBuilder

- (id)initProfile:(id)a3 morningIndex:(int64_t)a4 options:(unint64_t)a5 gregorianCalendar:(id)a6 sourceOrderProvider:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDSleepPeriodSegmentArrayBuilder;
  v15 = [(HDSleepPeriodSegmentArrayBuilder *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_profile, v12);
    v16->_morningIndex = a4;
    v16->_options = a5;
    objc_storeStrong((id *)&v16->_gregorianCalendar, a6);
    objc_storeWeak((id *)&v16->_sourceOrderProvider, v14);
  }

  return v16;
}

- (id)_computeStatisticsFromSamples:(void *)a3 sampleFilterBlock:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", *((void *)a1 + 2), *((void *)a1 + 4));
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v8 setCalendar:*((void *)a1 + 4)];
    objc_msgSend(v8, "setSecond:", (uint64_t)-[HDSleepPeriodSegmentArrayBuilder _timeIntervalForKey:defaultValue:]((uint64_t)a1, @"HDSleepStagesStatisticsBucketInterval", 60.0));
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F2B8A8]) initWithAnchorDate:v7 intervalComponents:v8];
    [(id)v9 setEnableRiskyFastMathOptimization:1];
    uint64_t v10 = _HKStatisticsOptionSleepStages();
    id WeakRetained = objc_loadWeakRetained((id *)a1 + 5);
    BOOL v12 = WeakRetained != 0;

    id v13 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
    id v14 = +[HDStatisticsCollectionCalculator calculatorForCategoryType:v13 intervalCollection:v9 options:v10 | v12 mergeStrategy:0];

    objc_msgSend(v14, "setMergeGranularity:", -[HDSleepPeriodSegmentArrayBuilder _timeIntervalForKey:defaultValue:]((uint64_t)a1, @"HDSleepStagesSourceMergeInterval", 30.0));
    id v15 = objc_loadWeakRetained((id *)a1 + 5);
    [v14 setSourceOrderProvider:v15];

    [v14 reset];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke;
    v30[3] = &unk_1E62F4648;
    id v17 = v16;
    id v31 = v17;
    [v14 setStatisticsHandler:v30];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke_2;
    v26[3] = &unk_1E62F4670;
    id v27 = v5;
    id v29 = v6;
    id v18 = v14;
    id v28 = v18;
    id v25 = 0;
    LOBYTE(v9) = [v18 performInitialStatisticsTransaction:v26 error:&v25];
    id v19 = v25;
    if (v9)
    {
      a1 = v17;
    }
    else
    {
      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR))
      {
        v22 = v20;
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        __int16 v34 = 2114;
        id v35 = v19;
        id v24 = v23;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Error adding samples to statistics calculator: %{public}@", buf, 0x16u);
      }
      a1 = (id)MEMORY[0x1E4F1CBF0];
    }
  }

  return a1;
}

uint64_t __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "value", v22);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          uint64_t v9 = *(void **)(a1 + 40);
          double v10 = (double)v8;
          v11 = [v7 startDate];
          [v11 timeIntervalSinceReferenceDate];
          double v13 = v12;
          id v14 = [v7 endDate];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;
          id v17 = [v7 sourceRevision];
          id v18 = [v17 source];
          id v19 = [v18 _sourceID];
          LODWORD(v9) = objc_msgSend(v9, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v19, "longLongValue"), v22, v10, v13, v16);

          if (!v9)
          {
            uint64_t v20 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v20 = 1;
LABEL_12:

  return v20;
}

- (id)sortedSleepPeriodSegmentsFromSamples:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[HDSleepPeriodSegmentArrayBuilder _computeStatisticsFromSamples:sampleFilterBlock:](self, v4, &__block_literal_global_11);
  id v6 = -[HDSleepPeriodSegmentArrayBuilder _computeStatisticsFromSamples:sampleFilterBlock:](self, v4, &__block_literal_global_290);

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = -[HDSleepPeriodSegmentArrayBuilder _sleepPeriodSegmentsFromStatistics:]((uint64_t)self, v5);
  [v7 addObjectsFromArray:v8];

  uint64_t v9 = -[HDSleepPeriodSegmentArrayBuilder _sleepPeriodSegmentsFromStatistics:]((uint64_t)self, v6);
  [v7 addObjectsFromArray:v9];

  [v7 sortUsingComparator:&__block_literal_global_293];
  double v10 = (void *)[v7 copy];

  return v10;
}

BOOL __73__HDSleepPeriodSegmentArrayBuilder_sortedSleepPeriodSegmentsFromSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

BOOL __73__HDSleepPeriodSegmentArrayBuilder_sortedSleepPeriodSegmentsFromSamples___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 == 0;
}

- (id)_sleepPeriodSegmentsFromStatistics:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v4 = -[HDSleepPeriodSegmentArrayBuilder _timeIntervalForKey:defaultValue:](a1, @"HDSleepStagesSegmentCombinationDistance", 29.0);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v28 = v3;
      uint64_t v29 = a1;
      id v7 = 0;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          uint64_t v9 = v7;
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v11 = [v10 categoryValue];
          uint64_t v12 = [v11 integerValue];

          if (_HKCategoryValueSleepAnalysisIsAsleep() && (*(unsigned char *)(v29 + 24) & 1) == 0) {
            uint64_t v12 = _HKCategoryValueSleepAnalysisDefaultAsleepValue();
          }
          id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
          id v14 = [v10 startDate];
          double v15 = [v10 endDate];
          double v16 = (void *)[v13 initWithStartDate:v14 endDate:v15];

          id v17 = [v10 sources];
          id v18 = objc_msgSend(v17, "hk_firstObjectPassingTest:", &__block_literal_global_302);

          id v19 = (void *)MEMORY[0x1E4F2B548];
          v37 = v16;
          uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
          id v7 = [v19 sleepPeriodSegmentWithDateInterval:v16 sampleIntervals:v20 category:v12 containsAppleSleepTrackingData:v18 != 0];

          if (v9)
          {
            v21 = [v16 startDate];
            uint64_t v22 = [v9 dateInterval];
            v23 = [v22 endDate];
            [v21 timeIntervalSinceDate:v23];
            double v25 = v24;

            if ([v9 category] == v12 && v25 <= v4)
            {
              [v32 removeLastObject];
              uint64_t v26 = [v9 mergingSleepPeriodSegment:v7];

              id v7 = (void *)v26;
            }
          }
          [v32 addObject:v7];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v6);

      id v3 = v28;
    }
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

uint64_t __73__HDSleepPeriodSegmentArrayBuilder_sortedSleepPeriodSegmentsFromSamples___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 dateInterval];
  uint64_t v6 = [v5 startDate];
  id v7 = [v4 dateInterval];

  uint64_t v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __71__HDSleepPeriodSegmentArrayBuilder__sleepPeriodSegmentsFromStatistics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isAppleWatch];
}

- (double)_timeIntervalForKey:(double)a3 defaultValue:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v8 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
    {
      v11 = v8;
      [v7 doubleValue];
      int v13 = 138543874;
      uint64_t v14 = a1;
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2050;
      uint64_t v18 = v12;
      _os_log_debug_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Found value for key: %{public}@ = %{public}f", (uint8_t *)&v13, 0x20u);
    }
    [v7 doubleValue];
    a3 = v9;
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceOrderProvider);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end