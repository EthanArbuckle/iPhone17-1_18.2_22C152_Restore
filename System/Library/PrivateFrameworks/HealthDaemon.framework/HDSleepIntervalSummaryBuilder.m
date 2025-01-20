@interface HDSleepIntervalSummaryBuilder
- (BOOL)scheduleAppliesToWeekday:(id)a3;
- (id)_sampleForSleepAnalysisValue:(uint64_t)a1 averageInfo:(uint64_t)a2 sleepDayInterval:(void *)a3;
- (id)_samplesForSleepAnalysisValue:(uint64_t)a1 dateIntervalTreesByMorningIndex:(void *)a2 sleepDayInterval:;
- (id)sleepAnalysisSamples;
- (void)_computeSleepIntervalAveragesFromSamples:(void *)a3;
@end

@implementation HDSleepIntervalSummaryBuilder

- (id)sleepAnalysisSamples
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v72.receiver = self;
  v72.super_class = (Class)HDSleepIntervalSummaryBuilder;
  v62 = [(HDSleepDaySummaryBuilder *)&v72 sleepAnalysisSamples];
  if ([(HDSleepDaySummaryBuilder *)self options])
  {
    id v61 = v62;
    if (self)
    {
      v29 = [(HDSleepDaySummaryBuilder *)self calendar];
      memset(v78, 0, sizeof(v78));
      long long v77 = 0u;
      [(HDSleepIntervalSummaryBuilder *)&v77 _computeSleepIntervalAveragesFromSamples:v61];
      id obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v61, "count"));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v64 = v61;
      uint64_t v30 = [v64 countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (v30)
      {
        double v31 = *((double *)v78 + 1);
        v66 = (void *)*((void *)&v78[1] + 1);
        uint64_t v68 = *(void *)v80;
        double v32 = *(double *)&v77;
        v33 = *(void **)&v78[0];
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v80 != v68) {
              objc_enumerationMutation(v64);
            }
            v35 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            uint64_t v36 = [v35 value];
            v37 = v66;
            if (v36)
            {
              double v38 = v31;
            }
            else
            {
              v37 = v33;
              double v38 = v32;
            }
            id v39 = v37;
            v40 = [v35 startDate];
            uint64_t v41 = objc_msgSend(v40, "hk_morningIndexWithCalendar:", v29);

            v42 = [NSNumber numberWithInteger:v41];
            v43 = [v39 objectForKeyedSubscript:v42];
            [v43 doubleValue];
            double v45 = v44;

            v46 = [v35 endDate];
            v47 = [v35 startDate];
            [v46 timeIntervalSinceDate:v47];
            double v49 = v48;

            v50 = [v35 startDate];
            v51 = [v50 dateByAddingTimeInterval:v38 - v45];

            v52 = [v51 dateByAddingTimeInterval:v49];
            v53 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v51 endDate:v52];
            v54 = objc_msgSend(v53, "hk_dateIntervalByMappingToSleepDayWithMorningIndex:calendar:", -[HDSleepDaySummaryBuilder morningIndex](self, "morningIndex"), v29);

            v55 = [v54 startDate];
            [v35 _setStartDate:v55];

            v56 = [v54 endDate];
            [v35 _setEndDate:v56];

            [obja addObject:v35];
          }
          uint64_t v30 = [v64 countByEnumeratingWithState:&v79 objects:v83 count:16];
        }
        while (v30);
      }

      [obja sortUsingComparator:&__block_literal_global_286];
    }
    else
    {
      id obja = 0;
    }
  }
  else
  {
    id v59 = v62;
    if (self)
    {
      v60 = [(HDSleepDaySummaryBuilder *)self calendar];
      uint64_t v58 = _HKCategoryValueSleepAnalysisDefaultAsleepValue();
      objc_msgSend(MEMORY[0x1E4F28C18], "hk_sleepDayIntervalForMorningIndex:calendar:", -[HDSleepDaySummaryBuilder morningIndex](self, "morningIndex"), v60);
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[HDSleepDaySummaryBuilder numberOfDays](self, "numberOfDays"));
      v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[HDSleepDaySummaryBuilder numberOfDays](self, "numberOfDays"));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id obj = v59;
      uint64_t v2 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (!v2) {
        goto LABEL_24;
      }
      uint64_t v3 = *(void *)v80;
      while (1)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v80 != v3) {
            objc_enumerationMutation(obj);
          }
          v5 = *(void **)(*((void *)&v79 + 1) + 8 * v4);
          uint64_t v6 = [v5 value];
          uint64_t v7 = v6;
          if ((unint64_t)(v6 - 3) < 3 || v6 == 1)
          {
            uint64_t v7 = 1;
          }
          else if (v6 == 2)
          {
            goto LABEL_19;
          }
          v9 = [(HDSleepDaySummaryBuilder *)self calendar];
          v10 = [v5 startDate];
          uint64_t v11 = objc_msgSend(v10, "hk_morningIndexWithCalendar:", v9);

          id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
          v13 = [v5 startDate];
          v14 = [v5 endDate];
          v15 = (void *)[v12 initWithStartDate:v13 endDate:v14];

          v16 = v67;
          if (v7) {
            v16 = v65;
          }
          id v17 = v16;
          v18 = [NSNumber numberWithInteger:v11];
          id v19 = [v17 objectForKeyedSubscript:v18];

          if (!v19) {
            id v19 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
          }
          [v19 insertInterval:v15];
          v20 = [NSNumber numberWithInteger:v11];
          [v17 setObject:v19 forKeyedSubscript:v20];

LABEL_19:
          ++v4;
        }
        while (v2 != v4);
        uint64_t v21 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
        uint64_t v2 = v21;
        if (!v21)
        {
LABEL_24:

          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v23 = -[HDSleepIntervalSummaryBuilder _samplesForSleepAnalysisValue:dateIntervalTreesByMorningIndex:sleepDayInterval:](0, v67);
          [v22 addObjectsFromArray:v23];

          v24 = -[HDSleepIntervalSummaryBuilder _samplesForSleepAnalysisValue:dateIntervalTreesByMorningIndex:sleepDayInterval:](v58, v65);
          [v22 addObjectsFromArray:v24];

          [v22 sortUsingComparator:&__block_literal_global_30];
          memset(v78, 0, sizeof(v78));
          long long v77 = 0u;
          [(HDSleepIntervalSummaryBuilder *)&v77 _computeSleepIntervalAveragesFromSamples:v22];
          id obja = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
          long long v75 = v77;
          id v25 = *(id *)&v78[0];
          id v76 = v25;
          v26 = -[HDSleepIntervalSummaryBuilder _sampleForSleepAnalysisValue:averageInfo:sleepDayInterval:](0, (uint64_t)&v75, v63);
          objc_msgSend(obja, "hk_addNonNilObject:", v26);

          long long v73 = *(_OWORD *)((char *)v78 + 8);
          id v27 = *((id *)&v78[1] + 1);
          id v74 = v27;
          v28 = -[HDSleepIntervalSummaryBuilder _sampleForSleepAnalysisValue:averageInfo:sleepDayInterval:](v58, (uint64_t)&v73, v63);
          objc_msgSend(obja, "hk_addNonNilObject:", v28);

          goto LABEL_25;
        }
      }
    }
    id obja = 0;
LABEL_25:
  }

  return obja;
}

- (BOOL)scheduleAppliesToWeekday:(id)a3
{
  return 1;
}

- (void)_computeSleepIntervalAveragesFromSamples:(void *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a2 morningIndex];
  id v39 = [a2 calendar];
  long long v49 = (unint64_t)(v5 - 1);
  long long v50 = 0uLL;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v51 = v6;
  long long v46 = v49;
  long long v47 = 0uLL;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v48 = v7;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v8)
  {
    uint64_t v40 = *(void *)v43;
    while (1)
    {
      uint64_t v41 = v8;
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v10 value];
        if (_HKCategoryValueSleepAnalysisIsAsleep())
        {
          uint64_t v11 = &v46;
        }
        else
        {
          if ([v10 value]) {
            continue;
          }
          uint64_t v11 = &v49;
        }
        id v12 = v10;
        id v13 = v39;
        v14 = [v12 startDate];
        uint64_t v15 = objc_msgSend(v14, "hk_morningIndexWithCalendar:", v13);

        v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", v15, v13);
        uint64_t v18 = *(void *)v11;
        uint64_t v17 = *((void *)v11 + 1);
        double v19 = *((double *)v11 + 2);
        double v20 = *((double *)v11 + 3);
        id v21 = *((id *)v11 + 4);
        id v22 = (void *)[v21 mutableCopy];

        if (v18 != v15)
        {
          v23 = [v12 startDate];
          [v23 timeIntervalSinceDate:v16];
          double v25 = v24;

          v26 = [NSNumber numberWithDouble:v25];
          id v27 = [NSNumber numberWithInteger:v15];
          [v22 setObject:v26 forKeyedSubscript:v27];

          double v19 = v19 + v25;
          ++v17;
        }
        v28 = [v12 endDate];
        v29 = [v12 startDate];
        [v28 timeIntervalSinceDate:v29];
        double v31 = v30;

        *(void *)uint64_t v11 = v15;
        *((void *)v11 + 1) = v17;
        *((double *)v11 + 2) = v19;
        *((double *)v11 + 3) = v20 + v31;
        double v32 = (void *)*((void *)v11 + 4);
        *((void *)v11 + 4) = v22;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
      if (!v8)
      {
        id v6 = v51;
        id v7 = v48;
        break;
      }
    }
  }

  v54[0] = v49;
  v54[1] = v50;
  id v33 = v6;
  id v34 = v7;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  id v35 = v33;
  id v55 = v35;
  _HDMakeSleepIntervalAverageInfo((uint64_t)a1, (uint64_t)v54);
  v52[0] = v46;
  v52[1] = v47;
  id v36 = v34;
  id v53 = v36;
  _HDMakeSleepIntervalAverageInfo((uint64_t)a1 + 24, (uint64_t)v52);
}

- (id)_samplesForSleepAnalysisValue:(uint64_t)a1 dateIntervalTreesByMorningIndex:(void *)a2 sleepDayInterval:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        id v7 = objc_msgSend(obj, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * i), v15);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v18 = v7;
        uint64_t v8 = [v7 mergedIntervals];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:v4 value:a1 clampedInterval:*(void *)(*((void *)&v19 + 1) + 8 * j)];
              [v5 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }

  return v5;
}

uint64_t __91__HDSleepIntervalSummaryBuilder__sleepConsistencySamplesAdjustedForAggregationFromSamples___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_sampleForSleepAnalysisValue:(uint64_t)a1 averageInfo:(uint64_t)a2 sleepDayInterval:(void *)a3
{
  id v5 = a3;
  if (*(double *)(a2 + 8) <= 2.22507386e-308)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
    uint64_t v7 = [v5 startDate];
    uint64_t v8 = [v7 dateByAddingTimeInterval:*(double *)a2];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 duration:*(double *)(a2 + 8)];
    uint64_t v10 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:v6 value:a1 clampedInterval:v9];
  }

  return v10;
}

uint64_t __85__HDSleepIntervalSummaryBuilder__sleepStageSamplesAdjustedForAggregationFromSamples___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end