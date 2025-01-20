@interface HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer
- (HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4;
- (id)_totalDatePredicateForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4;
- (id)determineJulianDayToMajorityTimeZoneForRange:(id)a3 error:(id *)a4;
@end

@implementation HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer

- (HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer;
  v8 = [(HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
    seriesType = v9->_seriesType;
    v9->_seriesType = (HKSeriesType *)v10;

    objc_storeStrong((id *)&v9->_calendarCache, a4);
  }

  return v9;
}

- (id)determineJulianDayToMajorityTimeZoneForRange:(id)a3 error:(id *)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = (void *)MEMORY[0x1E4F65BE8];
  seriesType = self->_seriesType;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = [v9 entityEnumeratorWithType:seriesType profile:WeakRetained];

  objc_super v13 = [(HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *)self _totalDatePredicateForStartDayIndex:var0 endDayIndex:var0 + var1];
  [v12 setPredicate:v13];

  [v12 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F659B8]];
  v14 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65A00] entityClass:objc_opt_class() ascending:1];
  v35[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [v12 setOrderingTerms:v15];

  id v34 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke;
  v30[3] = &unk_1E69B43D8;
  v30[4] = self;
  int64_t v32 = var0;
  int64_t v33 = var1;
  id v16 = v8;
  id v31 = v16;
  LOBYTE(v8) = [v12 enumerateWithError:&v34 handler:v30];
  id v17 = v34;
  if (v8)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__1;
    v28 = __Block_byref_object_dispose__1;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_307;
    v23[3] = &unk_1E69B4428;
    v23[4] = &v24;
    [v16 enumerateKeysAndObjectsUsingBlock:v23];
    id v18 = (id)v25[5];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    _HKInitializeLogging();
    v19 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:]((uint64_t)self, (uint64_t)v17, v19);
    }

    id v20 = v17;
    v21 = v20;
    if (v20)
    {
      if (a4) {
        *a4 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v18 = 0;
  }

  return v18;
}

uint64_t __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 _timeZone];
  v5 = *(void **)(a1[4] + 24);
  id v6 = [v3 _timeZone];
  id v7 = [v5 calendarForTimeZone:v6];

  id v8 = objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
  uint64_t v9 = objc_msgSend(v8, "hk_dayIndexWithCalendar:", v7);

  uint64_t v10 = a1[6];
  BOOL v11 = __OFSUB__(v9, v10);
  uint64_t v12 = v9 - v10;
  if (v12 < 0 == v11 && v12 < a1[7])
  {
    v14 = (void *)a1[5];
    v15 = [NSNumber numberWithInteger:v9];
    id v16 = [v14 objectForKey:v15];
    id v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v19 = v18;

    id v20 = [v19 objectForKey:v4];
    v21 = v20;
    if (v20) {
      v22 = v20;
    }
    else {
      v22 = objc_alloc_init(HKHRJulianDayTimeZoneState);
    }
    v23 = v22;

    [(HKHRJulianDayTimeZoneState *)v23 setCount:[(HKHRJulianDayTimeZoneState *)v23 count] + 1];
    uint64_t v24 = objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");
    [(HKHRJulianDayTimeZoneState *)v23 setLastSampleDate:v24];

    [v19 setObject:v23 forKey:v4];
    v25 = (void *)a1[5];
    uint64_t v26 = [NSNumber numberWithInteger:v9];
    [v25 setObject:v19 forKey:v26];
  }
  return 1;
}

void __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__1;
  v9[4] = __Block_byref_object_dispose__1;
  id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = -1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_2;
  v7[3] = &unk_1E69B4400;
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = &v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v12[5] forKey:v5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
}

void __104__HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer_determineJulianDayToMajorityTimeZoneForRange_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  if ([v6 count] > *(void *)(*(void *)(a1[4] + 8) + 24)
    || [v6 count] == *(void *)(*(void *)(a1[4] + 8) + 24)
    && ([v6 lastSampleDate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 compare:*(void *)(*(void *)(a1[5] + 8) + 40)],
        v7,
        v8 == 1))
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = [v6 count];
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    uint64_t v9 = [v6 lastSampleDate];
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)_totalDatePredicateForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4
{
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_earliestPossibleDateWithDayIndex:", a3);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_latestPossibleDateWithDayIndex:", a4);
  uint64_t v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];

  uint64_t v10 = HDSampleEntityPredicateForDateInterval();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_seriesType, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)determineJulianDayToMajorityTimeZoneForRange:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%@] Failed to enumerate across samples, received error: %@", (uint8_t *)&v3, 0x16u);
}

@end