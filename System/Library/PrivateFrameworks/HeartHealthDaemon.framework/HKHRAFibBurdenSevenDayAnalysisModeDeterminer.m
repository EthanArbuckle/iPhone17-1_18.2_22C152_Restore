@interface HKHRAFibBurdenSevenDayAnalysisModeDeterminer
- (HKHRAFibBurdenSevenDayAnalysisModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4;
- (id)_mostRecentSampleEndDateDayIndexWithError:(id *)a3;
- (id)_onboardingDateDayIndexWithFeatureStatus:(id)a3 error:(id *)a4;
- (id)determineModeForAnalysisWeekRange:(id)a3 featureStatus:(id)a4 error:(id *)a5;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisModeDeterminer

- (HKHRAFibBurdenSevenDayAnalysisModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisModeDeterminer;
  v8 = [(HKHRAFibBurdenSevenDayAnalysisModeDeterminer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_calendarCache, a4);
  }

  return v9;
}

- (id)determineModeForAnalysisWeekRange:(id)a3 featureStatus:(id)a4 error:(id *)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  v9 = [(HKHRAFibBurdenSevenDayAnalysisModeDeterminer *)self _onboardingDateDayIndexWithFeatureStatus:a4 error:&v20];
  v10 = v20;
  if (v10)
  {
    objc_super v11 = v10;
    if (a5)
    {
      objc_super v11 = v10;
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
LABEL_26:

    goto LABEL_27;
  }
  if (v9)
  {
    uint64_t v13 = [v9 integerValue];
    if (v13 >= var0 + var1)
    {
      _HKInitializeLogging();
      objc_super v11 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer determineModeForAnalysisWeekRange:featureStatus:error:]((uint64_t)self, v11);
      }
      v12 = &unk_1F2B42BE0;
    }
    else
    {
      int64_t v14 = v13;
      id v19 = 0;
      v15 = [(HKHRAFibBurdenSevenDayAnalysisModeDeterminer *)self _mostRecentSampleEndDateDayIndexWithError:&v19];
      objc_super v11 = v19;
      if (v11)
      {
        if (a5)
        {
          v12 = 0;
          *a5 = v11;
        }
        else
        {
          _HKLogDroppedError();
          v12 = 0;
        }
      }
      else if (v15 && [v15 integerValue] >= var0)
      {
        _HKInitializeLogging();
        v17 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = self;
          _os_log_impl(&dword_1D3AC6000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Most recent sample end date after analysis week range start, implying part of this week or future. Skipping analysis", buf, 0xCu);
        }

        v12 = &unk_1F2B42BE0;
      }
      else
      {
        v12 = &unk_1F2B42C10;
        if (v14 >= var0 && v14 - var0 < var1)
        {
          _HKInitializeLogging();
          v16 = HKHRAFibBurdenLogForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v22 = self;
            _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding date within analysis week range, allowing analysis to proceed but will not notify on no data.", buf, 0xCu);
          }

          v12 = &unk_1F2B42BF8;
        }
      }
    }
    goto LABEL_26;
  }
  v12 = &unk_1F2B42BE0;
LABEL_27:

  return v12;
}

- (id)_onboardingDateDayIndexWithFeatureStatus:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isOnboardingRecordPresent]
    && ([v5 onboardingRecord],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 allOnboardingCompletionsRegardlessOfSupportedState],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v10 = objc_msgSend(v5, "onboardingRecord", 0);
    objc_super v11 = [v10 allOnboardingCompletionsRegardlessOfSupportedState];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [v16 completionDate];
          int v18 = objc_msgSend(v9, "hk_isBeforeDate:", v17);

          if (v18)
          {
            uint64_t v19 = [v16 completionDate];

            v9 = (void *)v19;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v20 = NSNumber;
    v21 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
    v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v9, "hk_dayIndexWithCalendar:", v21));
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_mostRecentSampleEndDateDayIndexWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F65BE8];
  id v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v22 = 0;
  uint64_t v8 = [v5 mostRecentSampleWithType:v6 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v22];
  id v9 = v22;

  if (v8)
  {
    v10 = [v8 endDate];
    objc_super v11 = [v10 dateByAddingTimeInterval:-1.0];

    calendarCache = self->_calendarCache;
    uint64_t v13 = [v8 _timeZone];
    uint64_t v14 = [(HKCalendarCache *)calendarCache calendarForTimeZone:v13];
    uint64_t v15 = objc_msgSend(v11, "hk_dayIndexWithCalendar:", v14);

    v16 = [NSNumber numberWithInteger:v15];

    goto LABEL_14;
  }
  _HKInitializeLogging();
  v17 = HKHRAFibBurdenLogForCategory();
  int v18 = v17;
  if (v9)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(HKHRAFibBurdenSevenDayAnalysisModeDeterminer *)(uint64_t)self _mostRecentSampleEndDateDayIndexWithError:v18];
    }

    if (a3)
    {
      v16 = 0;
      *a3 = v9;
      goto LABEL_14;
    }
    _HKLogDroppedError();
  }
  else
  {
    BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v19)
    {
      id v20 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        long long v24 = self;
        _os_log_impl(&dword_1D3AC6000, v20, OS_LOG_TYPE_INFO, "[%{public}@] No sample found", buf, 0xCu);
      }
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)determineModeForAnalysisWeekRange:(uint64_t)a1 featureStatus:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Onboarding date day index after analysis week, meaning we were not onboarded for any part of the analysis week. Skipping analysis.", (uint8_t *)&v2, 0xCu);
}

- (void)_mostRecentSampleEndDateDayIndexWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when finding most recent sample: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end