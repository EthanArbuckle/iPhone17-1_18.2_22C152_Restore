@interface HKQueryUtilities
@end

@implementation HKQueryUtilities

uint64_t __82___HKQueryUtilities_coalesceTimePeriodsFromSamples_strictStartDate_strictEndDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id __117___HKQueryUtilities_calculateTotalDurationsWithTimePeriods_startDate_endDate_intervalComponents_startOfDayTransform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 40))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8 = [v4 startDate];
    v9 = (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);
    uint64_t v12 = a1 + 32;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v12 + 8);
    v13 = [v4 endDate];
    v14 = (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v10, v13);
    id v15 = (id)[v5 initWithStartDate:v9 endDate:v14];
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

uint64_t __93___HKQueryUtilities_calculateIncludedValuesWithSamples_startDate_endDate_intervalComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __93___HKQueryUtilities_calculateIncludedValuesWithSamples_startDate_endDate_intervalComponents___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "hk_integerValue", (void)v14));
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

uint64_t __99___HKQueryUtilities_arrayByCoalescingObjects_startDate_intervalComponents_calendar_combiningBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 endDate];
  uint64_t v4 = objc_msgSend(v3, "hk_isBeforeOrEqualToDate:", *(void *)(a1 + 32));

  return v4;
}

void __94___HKQueryUtilities_calculateCountStatisticsWithSamples_startDate_endDate_intervalComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __114___HKQueryUtilities_countStatisticsQueryWithSampleType_startDate_endDate_intervalComponents_predicate_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v8);
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 64) calculateCountStatisticsWithSamples:v7 startDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 40) intervalComponents:*(void *)(a1 + 48)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __97___HKQueryUtilities_coalesceTotalDurations_startDate_intervalComponents_intervalRecordCountsOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __97___HKQueryUtilities_coalesceTotalDurations_startDate_intervalComponents_intervalRecordCountsOut___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      double v14 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v16 = objc_msgSend(a1[4], "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          [v16 doubleValue];
          double v14 = v14 + v17;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
    else
    {
      double v14 = 0.0;
    }

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithDouble:", v14 / (double)(unint64_t)objc_msgSend(v10, "count"));
    [a1[5] setObject:v19 forKeyedSubscript:v18];

    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    [a1[6] setObject:v20 forKeyedSubscript:v18];
  }
  return 0;
}

@end