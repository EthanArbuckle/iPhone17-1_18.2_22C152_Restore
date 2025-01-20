@interface HKHRAFibBurdenTachogramClassificationsRetriever
- (BOOL)_shouldAnalyzeSample:(id)a3;
- (HKHRAFibBurdenTachogramClassificationsRetriever)initWithProfile:(id)a3 calendarCache:(id)a4;
- (HKHRAFibBurdenTachogramClassificationsRetriever)initWithProfile:(id)a3 dateGenerator:(id)a4 calendarCache:(id)a5;
- (id)_tachogramClassificationsWithPredicate:(id)a3 tachogramClassifier:(id)a4 error:(id *)a5 dayIndexBlock:(id)a6 filterBlock:(id)a7;
- (id)_totalDatePredicateForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4;
- (id)tachogramClassificationsDayIndexRange:(id)a3 tachogramClassifier:(id)a4 error:(id *)a5;
- (id)tachogramClassificationsForLastSixWeeksOfHoursFrom:(int64_t)a3 to:(int64_t)a4 julianDayToMajorityTimeZone:(id)a5 tachogramClassifier:(id)a6 error:(id *)a7;
- (id)tachogramClassificationsForLastSixWeeksOfWeekday:(int64_t)a3 tachogramClassifier:(id)a4 error:(id *)a5;
@end

@implementation HKHRAFibBurdenTachogramClassificationsRetriever

- (HKHRAFibBurdenTachogramClassificationsRetriever)initWithProfile:(id)a3 calendarCache:(id)a4
{
  return [(HKHRAFibBurdenTachogramClassificationsRetriever *)self initWithProfile:a3 dateGenerator:&__block_literal_global_6 calendarCache:a4];
}

uint64_t __81__HKHRAFibBurdenTachogramClassificationsRetriever_initWithProfile_calendarCache___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (HKHRAFibBurdenTachogramClassificationsRetriever)initWithProfile:(id)a3 dateGenerator:(id)a4 calendarCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKHRAFibBurdenTachogramClassificationsRetriever;
  v11 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    uint64_t v13 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
    seriesType = v12->_seriesType;
    v12->_seriesType = (HKSeriesType *)v13;

    objc_storeStrong((id *)&v12->_calendarCache, a5);
    uint64_t v15 = MEMORY[0x1D943B130](v9);
    id dateGenerator = v12->_dateGenerator;
    v12->_id dateGenerator = (id)v15;
  }
  return v12;
}

- (id)tachogramClassificationsDayIndexRange:(id)a3 tachogramClassifier:(id)a4 error:(id *)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  int64_t v9 = a3.var0 + a3.var1;
  id v10 = a4;
  v11 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)self _totalDatePredicateForStartDayIndex:var0 endDayIndex:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke;
  v15[3] = &unk_1E69B46F0;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke_2;
  v14[3] = &__block_descriptor_48_e40_q32__0__HKHeartbeatSeriesSample_8q16__24l;
  v14[4] = var0;
  v14[5] = var1;
  v12 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)self _tachogramClassificationsWithPredicate:v11 tachogramClassifier:v10 error:a5 dayIndexBlock:v15 filterBlock:v14];

  return v12;
}

uint64_t __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  v4 = [v3 _timeZone];
  v5 = [v2 calendarForTimeZone:v4];

  v6 = objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");

  uint64_t v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  return v7;
}

uint64_t __115__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsDayIndexRange_tachogramClassifier_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3 - v3 >= *(void *)(a1 + 40) || a3 < v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)tachogramClassificationsForLastSixWeeksOfWeekday:(int64_t)a3 tachogramClassifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  [v9 setWeekday:a3];
  id v10 = (*((void (**)(void))self->_dateGenerator + 2))();
  v11 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  v12 = [v11 startOfDayForDate:v10];

  uint64_t v13 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  v14 = [v13 dateByAddingUnit:16 value:-42 toDate:v12 options:0];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke;
  v29[3] = &unk_1E69B4738;
  id v30 = v14;
  v31 = self;
  id v18 = v15;
  id v32 = v18;
  id v33 = v16;
  id v19 = v16;
  id v20 = v14;
  [v17 enumerateDatesStartingAfterDate:v10 matchingComponents:v9 options:1028 usingBlock:v29];

  v21 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v19];
  id v27 = v18;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_2;
  v28[3] = &unk_1E69B46F0;
  v28[4] = self;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_3;
  v26[3] = &unk_1E69B4760;
  id v22 = v18;
  v23 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)self _tachogramClassificationsWithPredicate:v21 tachogramClassifier:v8 error:a5 dayIndexBlock:v28 filterBlock:v26];

  return v23;
}

uint64_t __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (v6)
  {
    v17 = v6;
    if ([*(id *)(a1 + 32) compare:v6] == -1)
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) currentCalendar];
      uint64_t v8 = objc_msgSend(v17, "hk_dayIndexWithCalendar:", v7);

      id v9 = *(void **)(a1 + 48);
      id v10 = [NSNumber numberWithInteger:v8];
      [v9 addObject:v10];

      id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
      v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_earliestPossibleDateWithDayIndex:", v8);
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_latestPossibleDateWithDayIndex:", v8);
      v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];

      id v15 = HDSampleEntityPredicateForDateInterval();
      [*(id *)(a1 + 56) addObject:v15];
    }
    else
    {
      *a4 = 1;
    }
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  v4 = [v3 _timeZone];
  v5 = [v2 calendarForTimeZone:v4];

  id v6 = objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");

  uint64_t v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  return v7;
}

uint64_t __126__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfWeekday_tachogramClassifier_error___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  if ([v1 containsObject:v2]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }

  return v3;
}

- (id)tachogramClassificationsForLastSixWeeksOfHoursFrom:(int64_t)a3 to:(int64_t)a4 julianDayToMajorityTimeZone:(id)a5 tachogramClassifier:(id)a6 error:(id *)a7
{
  id v12 = a5;
  calendarCache = self->_calendarCache;
  id v14 = a6;
  id v15 = [(HKCalendarCache *)calendarCache currentCalendar];
  id v16 = (*((void (**)(void))self->_dateGenerator + 2))();
  v17 = [v15 startOfDayForDate:v16];

  id v18 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  uint64_t v19 = objc_msgSend(v17, "hk_dayIndexWithCalendar:", v18);

  id v20 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)self _totalDatePredicateForStartDayIndex:v19 - 42 endDayIndex:v19];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke;
  v31[3] = &unk_1E69B46F0;
  v31[4] = self;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2;
  v24[3] = &unk_1E69B4788;
  uint64_t v27 = v19 - 42;
  uint64_t v28 = v19;
  id v25 = v12;
  v26 = self;
  int64_t v29 = a3;
  int64_t v30 = a4;
  id v21 = v12;
  id v22 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)self _tachogramClassificationsWithPredicate:v20 tachogramClassifier:v14 error:a7 dayIndexBlock:v31 filterBlock:v24];

  return v22;
}

uint64_t __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  v4 = [v3 _timeZone];
  v5 = [v2 calendarForTimeZone:v4];

  id v6 = objc_msgSend(v3, "aFibBurden_dateForAFibBurdenClassification");

  uint64_t v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  return v7;
}

uint64_t __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1[6] > a3 || a1[7] <= a3)
  {
    uint64_t v12 = 2;
  }
  else
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = [v6 objectForKey:v7];

    if (v8)
    {
      id v9 = [*(id *)(a1[5] + 24) calendarForTimeZone:v8];
      id v10 = objc_msgSend(v5, "aFibBurden_dateForAFibBurdenClassification");
      uint64_t v11 = [v9 component:32 fromDate:v10];

      if (v11 >= a1[8])
      {
        if (v11 < a1[9]) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
      }
      else
      {
        uint64_t v12 = 2;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v13 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2_cold_1((uint64_t)a1, v13);
      }

      uint64_t v12 = 2;
    }
  }
  return v12;
}

- (id)_tachogramClassificationsWithPredicate:(id)a3 tachogramClassifier:(id)a4 error:(id *)a5 dayIndexBlock:(id)a6 filterBlock:(id)a7
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = (void *)MEMORY[0x1E4F65BE8];
  seriesType = self->_seriesType;
  id v15 = a4;
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v18 = [v13 entityEnumeratorWithType:seriesType profile:WeakRetained];

  [v18 setPredicate:v16];
  [v18 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F659B8]];
  uint64_t v19 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65A00] entityClass:objc_opt_class() ascending:1];
  v39[0] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  [v18 setOrderingTerms:v20];

  id v21 = [HKHRAFibBurdenTachogramClassificationsBuilder alloc];
  id v22 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v23 = [(HKHRAFibBurdenTachogramClassificationsBuilder *)v21 initWithProfile:v22 classifier:v15];

  id v38 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke;
  v34[3] = &unk_1E69B47B0;
  id v24 = v11;
  id v36 = v24;
  v34[4] = self;
  id v25 = v12;
  id v37 = v25;
  id v26 = (id)v23;
  id v35 = v26;
  LOBYTE(v23) = [v18 enumerateWithError:&v38 handler:v34];
  id v27 = v38;
  if (v23)
  {
    uint64_t v28 = [v26 buildClassifications];
  }
  else
  {
    _HKInitializeLogging();
    int64_t v29 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenTachogramClassificationsRetriever _tachogramClassificationsWithPredicate:tachogramClassifier:error:dayIndexBlock:filterBlock:]((uint64_t)self, (uint64_t)v27, v29);
    }

    id v30 = v27;
    v31 = v30;
    if (v30)
    {
      if (a5) {
        *a5 = v30;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v28 = 0;
  }

  return v28;
}

uint64_t __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  id v5 = (void *)(a1 + 32);
  if ([*(id *)(a1 + 32) _shouldAnalyzeSample:v3])
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    id v7 = 0;
    if (v6)
    {
      if (v6 == 1) {
        [*(id *)(a1 + 40) addSampleToClassify:v3 dayIndex:v4];
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v8 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke_cold_1(v5, (uint64_t)v7, v8);
      }
    }
  }

  return 1;
}

- (id)_totalDatePredicateForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4
{
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_earliestPossibleDateWithDayIndex:", a3);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_latestPossibleDateWithDayIndex:", a4);
  id v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];

  id v10 = HDSampleEntityPredicateForDateInterval();

  return v10;
}

- (BOOL)_shouldAnalyzeSample:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 metadata];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB50]];

  if (v6 && ![v6 integerValue])
  {
    id v11 = [v4 metadata];
    id v9 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2BAB0]];

    if (v9 && [v9 integerValue] == 2)
    {
      BOOL v10 = 1;
LABEL_15:

      goto LABEL_16;
    }
    _HKInitializeLogging();
    id v12 = HKHRAFibBurdenLogForCategory();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

    if (v13)
    {
      id v14 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_INFO, "[%@] Ignoring sample from incompatible tachogram version", (uint8_t *)&v16, 0xCu);
      }
    }
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  _HKInitializeLogging();
  id v7 = HKHRAFibBurdenLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

  if (v8)
  {
    id v9 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      v17 = self;
      _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_INFO, "[%@] Ignoring sample from non-background context", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_seriesType, 0);

  objc_destroyWeak((id *)&self->_profile);
}

void __159__HKHRAFibBurdenTachogramClassificationsRetriever_tachogramClassificationsForLastSixWeeksOfHoursFrom_to_julianDayToMajorityTimeZone_tachogramClassifier_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%@] Unable to determine majority time zone for sample, even though majority time zone should have considered all samples.", (uint8_t *)&v3, 0xCu);
}

- (void)_tachogramClassificationsWithPredicate:(NSObject *)a3 tachogramClassifier:error:dayIndexBlock:filterBlock:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, a2, a3, "[%@] Failed to enumerate across samples, received error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __142__HKHRAFibBurdenTachogramClassificationsRetriever__tachogramClassificationsWithPredicate_tachogramClassifier_error_dayIndexBlock_filterBlock___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, a2, a3, "[%@] Error while filtering samples: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end