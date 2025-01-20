@interface HRAtrialFibrillationAnalyticsCollector
- (HDProfile)profile;
- (HRAtrialFibrillationAnalyticsCollector)initWithProfile:(id)a3;
- (id)_fetchBiologicalSex;
- (id)_fetchCurrentAge;
- (void)_fetchBiologicalSex;
- (void)_fetchCurrentAge;
- (void)_postConfirmationCycleMetric:(id)a3;
- (void)collectAnalyticsForRemoteDisableMessageShownForOnboardingCountryCode:(id)a3;
- (void)collectAnalyticsForRemoteReEnableMessageShownForOnboardingCountryCode:(id)a3;
- (void)collectAnalyticsForResult:(id)a3 algorithmVersion:(int64_t)a4 samplesDateInterval:(id)a5;
- (void)setProfile:(id)a3;
- (void)updateCountAnalyzedTachogramsWithCount:(int64_t)a3 keyValueDomain:(id)a4;
@end

@implementation HRAtrialFibrillationAnalyticsCollector

- (HRAtrialFibrillationAnalyticsCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HRAtrialFibrillationAnalyticsCollector;
  v5 = [(HRAtrialFibrillationAnalyticsCollector *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (void)collectAnalyticsForResult:(id)a3 algorithmVersion:(int64_t)a4 samplesDateInterval:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  if (([v23 tachogramShouldBeRequested] & 1) == 0)
  {
    v9 = [(HRAtrialFibrillationAnalyticsCollector *)self _fetchCurrentAge];
    uint64_t v10 = HKHRAnalyticsAgeBinFromAgeInYears();

    v11 = [v23 positiveUUIDs];
    uint64_t v12 = [v11 count];

    v13 = [v23 negativeUUIDs];
    uint64_t v14 = [v13 count];

    v15 = [(HRAtrialFibrillationAnalyticsCollector *)self _fetchBiologicalSex];
    uint64_t v16 = [v15 integerValue];

    v17 = [HRAtrialFibrillationConfirmationCycleMetric alloc];
    uint64_t v18 = [v23 userShouldBeAlerted];
    [v8 duration];
    double v20 = v19;
    v21 = [v23 metricsForCoreAnalytics];
    v22 = [(HRAtrialFibrillationConfirmationCycleMetric *)v17 initWithAgeBin:v10 numberOfPositiveTachograms:v12 numberOfNegativeTachograms:v14 algorithmVersion:a4 biologicalSex:v16 userShouldBeAlerted:v18 cycleDuration:v20 additionalMetrics:v21];

    [(HRAtrialFibrillationAnalyticsCollector *)self _postConfirmationCycleMetric:v22];
  }
}

- (void)collectAnalyticsForRemoteDisableMessageShownForOnboardingCountryCode:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"nil";
  }
  v7 = @"OnboardingCountryCode";
  v8[0] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  AnalyticsSendEvent();
}

- (void)collectAnalyticsForRemoteReEnableMessageShownForOnboardingCountryCode:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"nil";
  }
  v7 = @"OnboardingCountryCode";
  v8[0] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  AnalyticsSendEvent();
}

- (void)updateCountAnalyzedTachogramsWithCount:(int64_t)a3 keyValueDomain:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 >= 1)
  {
    uint64_t v7 = *MEMORY[0x1E4F295E8];
    id v13 = 0;
    id v8 = [v5 numberForKey:v7 error:&v13];
    id v9 = v13;
    if (v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationAnalyticsCollector updateCountAnalyzedTachogramsWithCount:keyValueDomain:]();
      }
    }
    else
    {
      if (v8 && ([v8 integerValue] & 0x8000000000000000) == 0) {
        a3 += [v8 integerValue];
      }
      uint64_t v10 = [NSNumber numberWithInteger:a3];
      id v12 = 0;
      [v6 setNumber:v10 forKey:v7 error:&v12];
      id v11 = v12;

      if (v11)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
          -[HRAtrialFibrillationAnalyticsCollector updateCountAnalyzedTachogramsWithCount:keyValueDomain:]();
        }
      }
    }
  }
}

- (void)_postConfirmationCycleMetric:(id)a3
{
  id v4 = a3;
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    v3 = [v4 payload];
    AnalyticsSendEvent();
  }
}

- (id)_fetchCurrentAge
{
  v3 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained userCharacteristicsManager];
  id v14 = 0;
  v6 = [v5 userCharacteristicForType:v3 error:&v14];
  id v7 = v14;

  if (v6)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = objc_msgSend(v8, "hk_dateOfBirthDateComponentsWithDate:", v9);

    id v11 = [v8 components:4 fromDateComponents:v6 toDateComponents:v10 options:0];
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "year"));
  }
  else
  {
    if (v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationAnalyticsCollector _fetchCurrentAge]();
      }
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_fetchBiologicalSex
{
  v3 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained userCharacteristicsManager];
  id v10 = 0;
  v6 = [v5 userCharacteristicForType:v3 error:&v10];
  id v7 = v10;

  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationAnalyticsCollector _fetchBiologicalSex]();
    }
  }

  return v6;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateCountAnalyzedTachogramsWithCount:keyValueDomain:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to set CountAnalyzedTacogramsPast24Hours, error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)updateCountAnalyzedTachogramsWithCount:keyValueDomain:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to get CountAnalyzedTacogramsPast24Hours, error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_fetchCurrentAge
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to get date of birth, error: %@", v6, v7, v8, v9, 2u);
}

- (void)_fetchBiologicalSex
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to get biological sex, error: %{public}@", v6, v7, v8, v9, v10);
}

@end