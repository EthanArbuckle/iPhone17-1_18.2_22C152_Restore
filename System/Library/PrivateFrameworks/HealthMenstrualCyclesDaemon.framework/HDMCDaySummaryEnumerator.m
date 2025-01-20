@interface HDMCDaySummaryEnumerator
+ (id)daySummariesInIndexRange:(id)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6;
+ (id)daySummaryAtIndex:(int64_t)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6;
- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4;
- (HDMCDaySummaryEnumerator)initWithProfile:(id)a3 calendarCache:(id)a4 dayIndexRange:(id)a5 ascending:(BOOL)a6 includeFactors:(BOOL)a7 includeWristTemperature:(BOOL)a8;
- (NSArray)orderedWatchSources;
- (void)_addSample:(id)a3 toBuilders:(id)a4 atDayIndex:(int64_t)a5;
- (void)_addSample:(id)a3 toBuilders:(id)a4 inRange:(id)a5;
- (void)_addSample:(id)a3 toBuilders:(id)a4 sampleRange:(id)a5;
- (void)_closeBuilders:(id)a3 withIndexes:(id)a4 handler:(id)a5 stop:(BOOL *)a6;
@end

@implementation HDMCDaySummaryEnumerator

- (HDMCDaySummaryEnumerator)initWithProfile:(id)a3 calendarCache:(id)a4 dayIndexRange:(id)a5 ascending:(BOOL)a6 includeFactors:(BOOL)a7 includeWristTemperature:(BOOL)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v58[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HDMCDaySummaryEnumerator;
  v16 = [(HDMCDaySummaryEnumerator *)&v54 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v14);
    objc_storeStrong((id *)&v17->_calendarCache, a4);
    v17->_dayIndexRange.start = var0;
    v17->_dayIndexRange.duration = var1;
    v17->_ascending = v9;
    id v52 = v14;
    BOOL v50 = v9;
    if (a8)
    {
      BOOL v49 = v8;
      id WeakRetained = objc_loadWeakRetained((id *)&v17->_profile);
      v19 = [WeakRetained sourceOrderManager];
      v20 = _HKMCAppleSleepingWristTemperatureType();
      id v53 = 0;
      uint64_t v21 = [v19 orderedSourcesForObjectType:v20 error:&v53];
      id v22 = v53;
      orderedWatchSources = v17->_orderedWatchSources;
      v17->_orderedWatchSources = (NSArray *)v21;

      if (!v17->_orderedWatchSources)
      {
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v24, (uint64_t)v17, (uint64_t)v22);
        }
      }

      BOOL v8 = v49;
    }
    uint64_t v57 = *MEMORY[0x263F42FD0];
    v58[0] = MEMORY[0x263EFFA88];
    v25 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
    if (var0 == *MEMORY[0x263F094E8] && var1 == *(void *)(MEMORY[0x263F094E8] + 8))
    {
      v27 = 0;
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x263F434D0], "hdmc_predicateForSamplesInDayIndexRange:", var0, var1);
    }
    v28 = HKMCDaySummaryCategoryTypes();
    id v51 = v15;
    if (v8)
    {
      v29 = HKMCCycleFactorsTypes();
      uint64_t v30 = [v28 arrayByAddingObjectsFromArray:v29];

      v28 = (void *)v30;
    }
    v31 = HKMCDaySummaryQuantityTypes();
    id v32 = objc_alloc(MEMORY[0x263F432F8]);
    v33 = [MEMORY[0x263EFFA08] setWithArray:v28];
    v34 = (void *)[v32 initWithSampleTypes:v33 encodingOptions:v25 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v27];
    v56[0] = v34;
    id v35 = objc_alloc(MEMORY[0x263F432F8]);
    v36 = [MEMORY[0x263EFFA08] setWithArray:v31];
    v37 = (void *)[v35 initWithSampleTypes:v36 encodingOptions:v25 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v27];
    v56[1] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];

    v39 = (id *)MEMORY[0x263F09F88];
    if (!v50) {
      v39 = (id *)MEMORY[0x263F09F80];
    }
    v40 = (void *)MEMORY[0x263F08B30];
    id v41 = *v39;
    v42 = [v40 sortDescriptorWithKey:v41 ascending:v50];
    id v43 = objc_alloc(MEMORY[0x263F43270]);
    v55 = v42;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    v45 = v43;
    id v14 = v52;
    uint64_t v46 = [v45 initWithQueryDescriptors:v38 includeDeletedObjects:0 anchor:0 sortDescriptors:v44 bufferSize:100 profile:v52];
    iterator = v17->_iterator;
    v17->_iterator = (HDMultiTypeSortedSampleIterator *)v46;

    id v15 = v51;
  }

  return v17;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v32 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  char v35 = 0;
  iterator = self->_iterator;
  id v34 = 0;
  int v8 = [(HDMultiTypeSortedSampleIterator *)iterator advanceWithError:&v34];
  id v9 = v34;
  v10 = v9;
  if (v8)
  {
    v31 = a3;
    do
    {
      v11 = (void *)MEMORY[0x22A634E00]();
      v12 = [(HDMultiTypeSortedSampleIterator *)self->_iterator sample];
      if ((objc_msgSend(v12, "hkmc_isNotPresentSymptom") & 1) == 0)
      {
        if (self->_ascending)
        {
          v13 = [v12 startDate];
          uint64_t v14 = objc_msgSend(v13, "hk_earliestPossibleDayIndex");
        }
        else
        {
          v13 = [v12 endDate];
          uint64_t v14 = objc_msgSend(v13, "hk_latestPossibleDayIndex");
        }
        uint64_t v15 = v14;

        v16 = [v6 allKeys];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __55__HDMCDaySummaryEnumerator_enumerateWithError_handler___block_invoke;
        v33[3] = &unk_264750F20;
        v33[4] = self;
        v33[5] = v15;
        v17 = objc_msgSend(v16, "hk_filter:", v33);

        [(HDMCDaySummaryEnumerator *)self _closeBuilders:v6 withIndexes:v17 handler:v32 stop:&v35];
        calendarCache = self->_calendarCache;
        v19 = [v12 _timeZone];
        v20 = [(HKCalendarCache *)calendarCache calendarForTimeZone:v19];

        if (objc_msgSend(v12, "hkmc_isSleepDependentSample"))
        {
          uint64_t v21 = [v12 endDate];
          uint64_t v22 = objc_msgSend(v21, "hk_morningIndexWithCalendar:", v20);

          uint64_t v23 = 1;
        }
        else
        {
          uint64_t v22 = objc_msgSend(v12, "hk_dayIndexRangeWithCalendar:", v20);
          uint64_t v23 = v24;
        }
        -[HDMCDaySummaryEnumerator _addSample:toBuilders:sampleRange:](self, "_addSample:toBuilders:sampleRange:", v12, v6, v22, v23, v31);
      }
      v25 = self->_iterator;
      id v34 = v10;
      int v26 = [(HDMultiTypeSortedSampleIterator *)v25 advanceWithError:&v34];
      id v27 = v34;

      if (!v26) {
        break;
      }
      v10 = v27;
    }
    while (!v35);
    a3 = v31;
    if (v35)
    {
      if (!v27) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else
  {
    id v27 = v9;
  }
  v28 = objc_msgSend(v6, "allKeys", v31);
  [(HDMCDaySummaryEnumerator *)self _closeBuilders:v6 withIndexes:v28 handler:v32 stop:&v35];

  if (!v27)
  {
LABEL_19:
    BOOL v29 = 1;
    goto LABEL_23;
  }
LABEL_18:
  if (objc_msgSend(v27, "hk_isHealthKitErrorWithCode:", 900, v31)) {
    goto LABEL_19;
  }
  if (a3)
  {
    BOOL v29 = 0;
    *a3 = v27;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v29 = 0;
  }
LABEL_23:

  return v29;
}

- (void)_closeBuilders:(id)a3 withIndexes:(id)a4 handler:(id)a5 stop:(BOOL *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *, BOOL *))a5;
  context = (void *)MEMORY[0x22A634E00]();
  uint64_t v24 = v11;
  v13 = [v11 sortedArrayUsingSelector:sel_compare_];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v22 = v13;
  if (self->_ascending)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [v13 reverseObjectEnumerator];
  }
  id obj = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v26 = *(void *)v28;
LABEL_6:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
      v19 = [v10 objectForKeyedSubscript:v18];
      v20 = [MEMORY[0x263F0A2D8] localDevice];
      uint64_t v21 = [v19 createDaySummaryWithDevice:v20];

      v12[2](v12, v21, a6);
      [v10 setObject:0 forKeyedSubscript:v18];
      LODWORD(v20) = *a6;

      if (v20) {
        break;
      }
      if (v16 == ++v17)
      {
        uint64_t v16 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v16) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (void)_addSample:(id)a3 toBuilders:(id)a4 sampleRange:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v22 = a3;
  id v9 = a4;
  char v10 = objc_msgSend(v22, "hkmc_isCycleFactorSample");
  int64_t start = self->_dayIndexRange.start;
  int64_t duration = self->_dayIndexRange.duration;
  if (v10)
  {
    BOOL v15 = var0 >= start && var0 - start < duration
       || start == *MEMORY[0x263F094E8] && duration == *(void *)(MEMORY[0x263F094E8] + 8);
    if (var1 <= 0) {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v18 = var1 + var0 - 1;
    }
    BOOL v19 = (v18 < start || v18 - start >= duration)
       && (start != *MEMORY[0x263F094E8] || duration != *(void *)(MEMORY[0x263F094E8] + 8));
    uint64_t v21 = v22;
    if (v15)
    {
      [(HDMCDaySummaryEnumerator *)self _addSample:v22 toBuilders:v9 atDayIndex:var0];
      uint64_t v21 = v22;
    }
    if ((([v21 hasUndeterminedDuration] | v19) & 1) == 0) {
      [(HDMCDaySummaryEnumerator *)self _addSample:v22 toBuilders:v9 atDayIndex:v18];
    }
  }
  else
  {
    if (start != *MEMORY[0x263F094E8] || duration != *(void *)(MEMORY[0x263F094E8] + 8))
    {
      int64_t var0 = HKIntersectionDayIndexRange();
      int64_t var1 = v17;
    }
    -[HDMCDaySummaryEnumerator _addSample:toBuilders:inRange:](self, "_addSample:toBuilders:inRange:", v22, v9, var0, var1);
  }
}

- (void)_addSample:(id)a3 toBuilders:(id)a4 inRange:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v16 = a3;
  id v9 = a4;
  if (var1 >= 1)
  {
    int64_t v10 = var0 + var1;
    do
    {
      id v11 = [NSNumber numberWithInteger:var0];
      v12 = [v9 objectForKeyedSubscript:v11];

      if (!v12)
      {
        v13 = [HDMCDaySummaryBuilder alloc];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        v12 = [(HDMCDaySummaryBuilder *)v13 initWithProfile:WeakRetained dayIndex:var0 orderedWatchSources:self->_orderedWatchSources calendarCache:self->_calendarCache];

        BOOL v15 = [NSNumber numberWithInteger:var0];
        [v9 setObject:v12 forKeyedSubscript:v15];
      }
      [(HDMCDaySummaryBuilder *)v12 addCycleTrackingSample:v16];

      ++var0;
    }
    while (var0 < v10);
  }
}

uint64_t __55__HDMCDaySummaryEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = [a2 integerValue];
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = v4 <= v5;
  BOOL v7 = v4 < v5;
  unsigned int v8 = !v6;
  if (v3) {
    return v7;
  }
  else {
    return v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedWatchSources, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_iterator, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_addSample:(id)a3 toBuilders:(id)a4 atDayIndex:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = [NSNumber numberWithInteger:a5];
  int64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    id v11 = [HDMCDaySummaryBuilder alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    int64_t v10 = [(HDMCDaySummaryBuilder *)v11 initWithProfile:WeakRetained dayIndex:a5 orderedWatchSources:self->_orderedWatchSources calendarCache:self->_calendarCache];

    v13 = [NSNumber numberWithInteger:a5];
    [v8 setObject:v10 forKeyedSubscript:v13];
  }
  [(HDMCDaySummaryBuilder *)v10 addCycleTrackingSample:v14];
}

+ (id)daySummaryAtIndex:(int64_t)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  LOBYTE(v14) = 0;
  id v11 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v9, v10, a3, 1, 1, 0, v14);
  uint64_t v16 = 0;
  int64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__HDMCDaySummaryEnumerator_daySummaryAtIndex_profile_calendarCache_error___block_invoke;
  v15[3] = &unk_264750A18;
  v15[4] = &v16;
  [(HDMCDaySummaryEnumerator *)v11 enumerateWithError:a6 handler:v15];
  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __74__HDMCDaySummaryEnumerator_daySummaryAtIndex_profile_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)daySummariesInIndexRange:(id)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v10 = (void *)MEMORY[0x263EFF980];
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 arrayWithCapacity:var1];
  LOBYTE(v18) = 0;
  uint64_t v14 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v12, v11, var0, var1, 1, 0, v18);

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __81__HDMCDaySummaryEnumerator_daySummariesInIndexRange_profile_calendarCache_error___block_invoke;
  v19[3] = &unk_264750F48;
  id v20 = v13;
  id v15 = v13;
  [(HDMCDaySummaryEnumerator *)v14 enumerateWithError:a6 handler:v19];
  uint64_t v16 = (void *)[v15 copy];

  return v16;
}

uint64_t __81__HDMCDaySummaryEnumerator_daySummariesInIndexRange_profile_calendarCache_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSArray)orderedWatchSources
{
  return self->_orderedWatchSources;
}

- (void)initWithProfile:(uint64_t)a3 calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_225722000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving ordered wrist temperature sources: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end