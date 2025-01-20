@interface _HKQueryUtilities
+ (BOOL)shouldUseDailyAverageWithDateComponents:(id)a3 sampleType:(id)a4;
+ (double)totalDurationFromCoalescedDateIntervals:(id)a3;
+ (id)arrayByCoalescingObjects:(id)a3 startDate:(id)a4 intervalComponents:(id)a5 calendar:(id)a6 combiningBlock:(id)a7;
+ (id)averageSumFromQuantities:(id)a3 unit:(id)a4;
+ (id)averageSumFromStatistics:(id)a3 unit:(id)a4;
+ (id)calculateCountStatisticsWithSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6;
+ (id)calculateIncludedValuesWithSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6;
+ (id)calculateTotalDurationsWithTimePeriods:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 startOfDayTransform:(id)a7;
+ (id)coalesceTimePeriods:(id)a3 strictStartDate:(id)a4 strictEndDate:(id)a5;
+ (id)coalesceTimePeriodsFromSamples:(id)a3 strictStartDate:(id)a4 strictEndDate:(id)a5;
+ (id)coalesceTotalDurations:(id)a3 startDate:(id)a4 intervalComponents:(id)a5 intervalRecordCountsOut:(id *)a6;
+ (id)countStatisticsQueryWithSampleType:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 predicate:(id)a7 completion:(id)a8;
+ (id)maximumFromQuantities:(id)a3 unit:(id)a4;
+ (id)minimumFromQuantities:(id)a3 unit:(id)a4;
+ (void)_organizeSampleByStartDate:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 callback:(id)a7;
@end

@implementation _HKQueryUtilities

+ (id)coalesceTimePeriods:(id)a3 strictStartDate:(id)a4 strictEndDate:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v8 = a5;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v10)
  {
    v13 = 0;
    v12 = 0;
    v26 = v9;
    goto LABEL_24;
  }
  uint64_t v11 = v10;
  v12 = 0;
  v13 = 0;
  uint64_t v14 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v9);
      }
      v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if (v12
        && ([*(id *)(*((void *)&v31 + 1) + 8 * i) startDate],
            v17 = objc_claimAutoreleasedReturnValue(),
            char v18 = objc_msgSend(v17, "hk_isBeforeDate:", v12),
            v17,
            (v18 & 1) == 0))
      {
        v21 = _HKDateIntervalCreate(v13, v12, v30, v8);
        [v21 duration];
        if (v22 > 0.0) {
          [v29 addObject:v21];
        }

        v12 = 0;
      }
      else if (v13)
      {
        v19 = [v16 startDate];
        uint64_t v20 = [v13 earlierDate:v19];

        v13 = (void *)v20;
        goto LABEL_14;
      }
      v13 = objc_msgSend(v16, "startDate", v29);
LABEL_14:
      uint64_t v23 = objc_msgSend(v16, "endDate", v29);
      v24 = (void *)v23;
      if (v12)
      {
        uint64_t v25 = [v12 laterDate:v23];

        v12 = (void *)v25;
      }
      else
      {
        v12 = (void *)v23;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v11);

  if (v13 && v12)
  {
    v26 = _HKDateIntervalCreate(v13, v12, v30, v8);
    [v26 duration];
    if (v27 > 0.0) {
      [v29 addObject:v26];
    }
LABEL_24:
  }

  return v29;
}

+ (id)coalesceTimePeriodsFromSamples:(id)a3 strictStartDate:(id)a4 strictEndDate:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v19 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __82___HKQueryUtilities_coalesceTimePeriodsFromSamples_strictStartDate_strictEndDate___block_invoke;
        v20[3] = &unk_1E58C3EF8;
        id v21 = v9;
        [v15 _enumerateTimePeriodsWithBlock:v20];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  v16 = [a1 coalesceTimePeriods:v9 strictStartDate:v19 strictEndDate:v8];

  return v16;
}

+ (id)calculateTotalDurationsWithTimePeriods:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 startOfDayTransform:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [a1 coalesceTimePeriods:a3 strictStartDate:v12 strictEndDate:v13];
  v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117___HKQueryUtilities_calculateTotalDurationsWithTimePeriods_startDate_endDate_intervalComponents_startOfDayTransform___block_invoke;
  aBlock[3] = &unk_1E58C3F20;
  id v18 = v15;
  id v61 = v18;
  id v19 = v17;
  id v60 = v19;
  uint64_t v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
  v56 = v19;
  v57 = v14;
  long long v22 = [v19 dateByAddingComponents:v14 toDate:v12 options:0];
  long long v23 = (void *)[v21 initWithStartDate:v12 endDate:v22];

  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = [v23 startDate];
  v58 = v13;
  LODWORD(v22) = objc_msgSend(v24, "hk_isBeforeDate:", v13);

  v53 = v18;
  v54 = v12;
  if (v22)
  {
    uint64_t v25 = 0;
    double v26 = 0.0;
    while (1)
    {
      uint64_t v27 = v20[2](v20, v23);
      if (v25 == [v16 count]) {
        break;
      }
      v28 = [v16 objectAtIndexedSubscript:v25];
      id v29 = [v28 endDate];
      id v30 = [v27 startDate];
      int v31 = objc_msgSend(v29, "hk_isAfterOrEqualToDate:", v30);

      if (!v31) {
        goto LABEL_7;
      }
      long long v32 = [v28 startDate];
      long long v33 = [v27 endDate];
      int v34 = objc_msgSend(v32, "hk_isBeforeOrEqualToDate:", v33);

      if (!v34) {
        goto LABEL_7;
      }
      v35 = [v28 startDate];
      uint64_t v36 = [v27 startDate];
      v37 = HKDateMax(v35, v36);

      v38 = [v28 endDate];
      uint64_t v39 = [v27 endDate];
      v40 = HKDateMin(v38, (void *)v39);

      [v40 timeIntervalSinceDate:v37];
      double v26 = v26 + v41;
      v42 = [v28 endDate];
      LODWORD(v39) = [v42 isEqualToDate:v40];

      v25 += v39;
      if ((v39 & 1) == 0)
      {
LABEL_7:
        if (v26 > 0.0)
        {
          v43 = [NSNumber numberWithDouble:v26];
          [v55 setObject:v43 forKeyedSubscript:v23];

          double v26 = 0.0;
        }
        id v44 = objc_alloc(MEMORY[0x1E4F28C18]);
        v45 = [v23 endDate];
        v46 = [v23 endDate];
        v47 = [v56 dateByAddingComponents:v57 toDate:v46 options:0];
        uint64_t v48 = [v44 initWithStartDate:v45 endDate:v47];

        long long v23 = (void *)v48;
      }

      v49 = [v23 startDate];
      char v50 = objc_msgSend(v49, "hk_isBeforeDate:", v58);

      if ((v50 & 1) == 0) {
        goto LABEL_15;
      }
    }
    if (v26 > 0.0)
    {
      v51 = [NSNumber numberWithDouble:v26];
      [v55 setObject:v51 forKeyedSubscript:v23];
    }
  }
LABEL_15:

  return v55;
}

+ (id)calculateIncludedValuesWithSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 sortedArrayUsingComparator:&__block_literal_global_63];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93___HKQueryUtilities_calculateIncludedValuesWithSamples_startDate_endDate_intervalComponents___block_invoke_2;
  v17[3] = &unk_1E58C3F68;
  id v15 = v14;
  id v18 = v15;
  [a1 _organizeSampleByStartDate:v13 startDate:v12 endDate:v11 intervalComponents:v10 callback:v17];

  return v15;
}

+ (void)_organizeSampleByStartDate:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 callback:(id)a7
{
  id v32 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v16 = v11;
  id v29 = v15;
  id v30 = v13;
  v17 = [v15 dateByAddingComponents:v13 toDate:v16 options:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v17];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = v12;
  int v31 = (void (**)(void, void, void))v14;
  v28 = v16;
  if (objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v12))
  {
    unint64_t v21 = 0;
    do
    {
      if (v21 >= objc_msgSend(v32, "count", v28)) {
        break;
      }
      long long v22 = [v32 objectAtIndexedSubscript:v21];
      long long v23 = [v22 startDate];
      long long v24 = [v18 endDate];
      int v25 = objc_msgSend(v23, "hk_isBeforeDate:", v24);

      if (v25)
      {
        [v19 addObject:v22];
        ++v21;
      }
      else
      {
        if (v31 && [v19 count]) {
          ((void (**)(void, void *, id))v31)[2](v31, v18, v19);
        }
        [v19 removeAllObjects];
        id v26 = v17;

        v17 = [v29 dateByAddingComponents:v30 toDate:v26 options:0];

        uint64_t v27 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v26 endDate:v17];
        id v18 = (void *)v27;
        id v16 = v26;
      }
    }
    while ((objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v20) & 1) != 0);
  }
  if (v31 && [v19 count]) {
    ((void (**)(void, void *, id))v31)[2](v31, v18, v19);
  }
}

+ (id)arrayByCoalescingObjects:(id)a3 startDate:(id)a4 intervalComponents:(id)a5 calendar:(id)a6 combiningBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, id, id, void *))a7;
  if (v11)
  {
    id v29 = v12;
    id v16 = v12;
    id v32 = v14;
    v17 = [v14 dateByAddingComponents:v13 toDate:v16 options:0];
    id v30 = v11;
    id v18 = (void *)[v11 mutableCopy];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (objc_msgSend(v18, "count", v29) || objc_msgSend(v19, "count"))
    {
      uint64_t v20 = [v18 firstObject];
      unint64_t v21 = v20;
      if (v20
        && ([v20 startDate],
            long long v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = objc_msgSend(v22, "hk_isBeforeDate:", v17),
            v22,
            v23))
      {
        [v19 addObject:v21];
        [v18 removeObjectAtIndex:0];
      }
      else
      {
        long long v24 = v15[2](v15, v19, v16, v17);
        if (v24) {
          [v31 addObject:v24];
        }
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __99___HKQueryUtilities_arrayByCoalescingObjects_startDate_intervalComponents_calendar_combiningBlock___block_invoke;
        v33[3] = &unk_1E58C3F90;
        id v25 = v17;
        id v34 = v25;
        objc_msgSend(v19, "hk_removeObjectsPassingTest:", v33);
        id v26 = v25;

        v17 = [v32 dateByAddingComponents:v13 toDate:v26 options:0];

        id v16 = v26;
      }
    }
    id v12 = v29;
    id v11 = v30;
    id v14 = v32;
    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

+ (double)totalDurationFromCoalescedDateIntervals:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 endDate];
        id v11 = [v9 startDate];
        [v10 timeIntervalSinceDate:v11];
        double v7 = v7 + v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (id)calculateCountStatisticsWithSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94___HKQueryUtilities_calculateCountStatisticsWithSamples_startDate_endDate_intervalComponents___block_invoke;
  v18[3] = &unk_1E58C3F68;
  id v16 = v15;
  id v19 = v16;
  [a1 _organizeSampleByStartDate:v14 startDate:v13 endDate:v12 intervalComponents:v11 callback:v18];

  return v16;
}

+ (id)countStatisticsQueryWithSampleType:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 predicate:(id)a7 completion:(id)a8
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  long long v17 = (void *)MEMORY[0x1E4F29008];
  id v18 = a7;
  id v19 = a3;
  uint64_t v20 = [v17 sortDescriptorWithKey:@"endDate" ascending:1];
  v38[0] = v20;
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];

  unint64_t v21 = +[HKQuery predicateForSamplesWithStartDate:v13 endDate:v14 options:1];
  long long v22 = [HKSampleQuery alloc];
  int v23 = _HKPredicateMatchingPredicates(v21, v18);

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __114___HKQueryUtilities_countStatisticsQueryWithSampleType_startDate_endDate_intervalComponents_predicate_completion___block_invoke;
  v32[3] = &unk_1E58C3FB8;
  id v36 = v16;
  id v37 = a1;
  id v33 = v13;
  id v34 = v14;
  id v35 = v15;
  id v24 = v15;
  id v25 = v14;
  id v26 = v13;
  id v27 = v16;
  v28 = [(HKSampleQuery *)v22 initWithSampleType:v19 predicate:v23 limit:0 sortDescriptors:v30 resultsHandler:v32];

  return v28;
}

+ (id)averageSumFromStatistics:(id)a3 unit:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "sumQuantity", (void)v17);
          [v13 doubleValueForUnit:v6];
          double v11 = v11 + v14;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    id v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6, v11 / (double)(unint64_t)[v7 count]);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)averageSumFromQuantities:(id)a3 unit:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "doubleValueForUnit:", v6, (void)v16);
          double v11 = v11 + v13;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    double v14 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6, v11 / (double)(unint64_t)[v7 count]);
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

+ (id)minimumFromQuantities:(id)a3 unit:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 firstObject];
    [v7 doubleValueForUnit:v6];
    double v9 = v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "doubleValueForUnit:", v6, (void)v18);
          if (v15 < v9) {
            double v9 = v15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    long long v16 = +[HKQuantity quantityWithUnit:v6 doubleValue:v9];
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

+ (id)maximumFromQuantities:(id)a3 unit:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 firstObject];
    [v7 doubleValueForUnit:v6];
    double v9 = v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "doubleValueForUnit:", v6, (void)v18);
          if (v15 > v9) {
            double v9 = v15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    long long v16 = +[HKQuantity quantityWithUnit:v6 doubleValue:v9];
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

+ (BOOL)shouldUseDailyAverageWithDateComponents:(id)a3 sampleType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) == 0 || [v6 aggregationStyle] == 0;
  objc_msgSend(v5, "hk_approximateDuration");
  double v9 = v8;
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
  objc_msgSend(v10, "hk_approximateDuration");
  double v12 = v11;

  BOOL v13 = v9 > v12 && v7;
  return v13;
}

+ (id)coalesceTotalDurations:(id)a3 startDate:(id)a4 intervalComponents:(id)a5 intervalRecordCountsOut:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v15 = [v10 allKeys];
  long long v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_25_0];

  long long v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97___HKQueryUtilities_coalesceTotalDurations_startDate_intervalComponents_intervalRecordCountsOut___block_invoke_2;
  v25[3] = &unk_1E58C4000;
  id v26 = v10;
  id v18 = v13;
  id v27 = v18;
  id v19 = v14;
  id v28 = v19;
  id v20 = v10;
  id v21 = (id)[a1 arrayByCoalescingObjects:v16 startDate:v11 intervalComponents:v12 calendar:v17 combiningBlock:v25];

  if (a6) {
    *a6 = v19;
  }
  uint64_t v22 = v28;
  id v23 = v18;

  return v23;
}

@end