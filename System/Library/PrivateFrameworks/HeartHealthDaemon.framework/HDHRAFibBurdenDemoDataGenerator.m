@interface HDHRAFibBurdenDemoDataGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)aFibHistoryFeatureOnboarded;
- (HDHRAFibBurdenDemoDataGenerator)init;
- (HDHRAFibBurdenDemoDataGenerator)initWithCoder:(id)a3;
- (double)_randomlySelectedGaussianWithMean:(double)a3 deviation:(double)a4;
- (double)heartbeatSeriesSampleFrequency;
- (double)nextAFibBurdenSampleTime;
- (double)nextHeartbeatSeriesSampleTime;
- (double)percentAFibChance;
- (id)_currentDateFromCurrentTime:(double)a3;
- (id)_metadataForSampleWithPercentage:(double)a3;
- (void)_completeAFibHistoryOnboardingIfNecessaryForDemoPerson:(id)a3 date:(id)a4;
- (void)_generateAFibBurdenSamplesForDemoPerson:(id)a3 lastTime:(double)a4 atTime:(double)a5 sampleDate:(id)a6 objectCollection:(id)a7;
- (void)_generateTachogramSamplesForDemoPerson:(id)a3 lastTime:(double)a4 atTime:(double)a5 sampleDate:(id)a6 objectCollection:(id)a7;
- (void)_setDataTypeAsFavorite;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setAFibHistoryFeatureOnboarded:(BOOL)a3;
- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4;
- (void)setHeartbeatSeriesSampleFrequency:(double)a3;
- (void)setNextAFibBurdenSampleTime:(double)a3;
- (void)setNextHeartbeatSeriesSampleTime:(double)a3;
- (void)setPercentAFibChance:(double)a3;
@end

@implementation HDHRAFibBurdenDemoDataGenerator

- (HDHRAFibBurdenDemoDataGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDHRAFibBurdenDemoDataGenerator;
  v2 = [(HDHRAFibBurdenDemoDataGenerator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_nextAFibBurdenSampleTime = 0.0;
    v2->_nextHeartbeatSeriesSampleTime = 0.0;
    HDDemoData_timeFromDateComponents();
    v3->_heartbeatSeriesSampleFrequency = v4;
    v3->_aFibHistoryFeatureOnboarded = 0;
    v3->_percentAFibChance = 0.25;
  }
  return v3;
}

- (HDHRAFibBurdenDemoDataGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHRAFibBurdenDemoDataGenerator;
  v5 = [(HDHRAFibBurdenDemoDataGenerator *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_NextAFibBurdenSampleTimeKey"];
    v5->_nextAFibBurdenSampleTime = v6;
    [v4 decodeDoubleForKey:@"_NextHeartbeatSeriesSampleTimeKey"];
    v5->_nextHeartbeatSeriesSampleTime = v7;
    HDDemoData_timeFromDateComponents();
    v5->_heartbeatSeriesSampleFrequency = v8;
    v5->_aFibHistoryFeatureOnboarded = [v4 decodeBoolForKey:@"_AFibHistoryFeatureOnboardedKey"];
    v5->_percentAFibChance = 0.25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(HDHRAFibBurdenDemoDataGenerator *)self nextAFibBurdenSampleTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_NextAFibBurdenSampleTimeKey");
  [(HDHRAFibBurdenDemoDataGenerator *)self nextHeartbeatSeriesSampleTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_NextHeartbeatSeriesSampleTimeKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[HDHRAFibBurdenDemoDataGenerator aFibHistoryFeatureOnboarded](self, "aFibHistoryFeatureOnboarded"), @"_AFibHistoryFeatureOnboardedKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  double v6 = (HDDemoDataGeneratorState *)a4;
  objc_storeWeak((id *)&self->_profile, a3);
  generatorState = self->_generatorState;
  self->_generatorState = v6;
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  id v8 = a3;
  id v7 = a4;
  if ([v8 profileType] == 4) {
    [(HDHRAFibBurdenDemoDataGenerator *)self _completeAFibHistoryOnboardingIfNecessaryForDemoPerson:v8 date:v7];
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([v12 profileType] == 4)
  {
    if ([(HDHRAFibBurdenDemoDataGenerator *)self aFibHistoryFeatureOnboarded])
    {
      v15 = [MEMORY[0x1E4F2B860] sharedBehavior];
      char v16 = [v15 isAppleWatch];

      if ((v16 & 1) == 0)
      {
        [(HDHRAFibBurdenDemoDataGenerator *)self _generateTachogramSamplesForDemoPerson:v12 lastTime:v13 atTime:v14 sampleDate:a4 objectCollection:a5];
        [(HDHRAFibBurdenDemoDataGenerator *)self _generateAFibBurdenSamplesForDemoPerson:v12 lastTime:v13 atTime:v14 sampleDate:a4 objectCollection:a5];
      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[HDHRAFibBurdenDemoDataGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:]((uint64_t)self, v17);
      }
    }
  }
}

- (void)_generateAFibBurdenSamplesForDemoPerson:(id)a3 lastTime:(double)a4 atTime:(double)a5 sampleDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  if (self->_nextAFibBurdenSampleTime <= a5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    id v12 = [(HDHRAFibBurdenDemoDataGenerator *)self _currentDateFromCurrentTime:a4];
    id v13 = [(HDHRAFibBurdenDemoDataGenerator *)self _currentDateFromCurrentTime:a5];
    id v14 = HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponents();
    v15 = [v11 nextDateAfterDate:v13 matchingComponents:v14 options:260];

    char v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v13];
    char v17 = [v16 containsDate:v15];

    if (v17)
    {
      uint64_t v18 = HKHRAFibBurdenPreviousWeekDayIndexRange();
      v39 = v10;
      uint64_t v20 = v19;
      objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v18, 0, v11);
      v21 = v38 = v15;
      v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v18 + v20, 0, v11);
      [(HDHRAFibBurdenDemoDataGenerator *)self _randomlySelectedGaussianWithMean:self->_percentAFibChance deviation:0.03];
      double v24 = v23;
      v25 = (void *)MEMORY[0x1E4F2B370];
      v26 = [MEMORY[0x1E4F2B618] percentUnit];
      [v25 quantityWithUnit:v26 doubleValue:v24];
      v37 = v13;
      v28 = v27 = v12;

      v29 = (void *)MEMORY[0x1E4F2B388];
      v30 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
      v31 = [MEMORY[0x1E4F2AEF8] localDevice];
      v32 = [(HDHRAFibBurdenDemoDataGenerator *)self _metadataForSampleWithPercentage:v24];
      v33 = [v29 quantitySampleWithType:v30 quantity:v28 startDate:v21 endDate:v22 device:v31 metadata:v32];

      id v10 = v39;
      [v39 addObjectFromPhone:v33];
      v34 = [v11 dateByAddingUnit:16 value:7 toDate:v27 options:0];
      [v34 timeIntervalSinceDate:v27];
      self->_nextAFibBurdenSampleTime = a4 + v35 * 0.0000115740741;

      id v12 = v27;
      id v13 = v37;

      v15 = v38;
    }
    else
    {
      _HKInitializeLogging();
      v36 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v41 = self;
        __int16 v42 = 2114;
        v43 = v15;
        __int16 v44 = 2114;
        v45 = v12;
        __int16 v46 = 2114;
        v47 = v13;
        _os_log_impl(&dword_1D3AC6000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Target date %{public}@ not included in date range from %{public}@ to %{public}@", buf, 0x2Au);
      }
    }
  }
}

- (void)_generateTachogramSamplesForDemoPerson:(id)a3 lastTime:(double)a4 atTime:(double)a5 sampleDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (self->_nextHeartbeatSeriesSampleTime <= a4)
  {
    if ([(HDDemoDataGeneratorState *)self->_generatorState isExercising])
    {
      _HKInitializeLogging();
      v15 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = self;
        _os_log_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not adding background tachograms as person is exercising", buf, 0xCu);
      }
    }
    else
    {
      id v23 = v13;
      id v24 = v12;
      double nextHeartbeatSeriesSampleTime = self->_nextHeartbeatSeriesSampleTime;
      if (nextHeartbeatSeriesSampleTime <= a5)
      {
        uint64_t v17 = *MEMORY[0x1E4F2BB50];
        uint64_t v18 = *MEMORY[0x1E4F2BAB0];
        do
        {
          uint64_t v19 = -[HDHRAFibBurdenDemoDataGenerator _currentDateFromCurrentTime:](self, "_currentDateFromCurrentTime:", nextHeartbeatSeriesSampleTime, v23, v24);
          v25[0] = v17;
          v25[1] = v18;
          v26[0] = &unk_1F2B423A0;
          v26[1] = &unk_1F2B423B8;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
          v21 = [MEMORY[0x1E4F2AEF8] localDevice];
          if ((double)arc4random_uniform(0x64u) / 100.0 >= self->_percentAFibChance) {
            [MEMORY[0x1E4F2B108] _nonAFibSeriesSampleWithStartDate:v19 device:v21 metadata:v20];
          }
          else {
          v22 = [MEMORY[0x1E4F2B108] _aFibSeriesSampleWithStartDate:v19 device:v21 metadata:v20];
          }
          [v14 addObjectFromWatch:v22];
          double nextHeartbeatSeriesSampleTime = nextHeartbeatSeriesSampleTime + self->_heartbeatSeriesSampleFrequency;
        }
        while (nextHeartbeatSeriesSampleTime <= a5);
      }
      self->_double nextHeartbeatSeriesSampleTime = nextHeartbeatSeriesSampleTime;
      id v13 = v23;
      id v12 = v24;
    }
  }
}

- (void)_completeAFibHistoryOnboardingIfNecessaryForDemoPerson:(id)a3 date:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained featureAvailabilityProvidingForFeatureIdentifier:*MEMORY[0x1E4F29D10]];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v9 = [v8 countryCode];

    id v10 = objc_alloc(MEMORY[0x1E4F2B058]);
    uint64_t v11 = *MEMORY[0x1E4F67D68];
    v15[0] = *MEMORY[0x1E4F29DE0];
    v15[1] = v11;
    v16[0] = MEMORY[0x1E4F1CC38];
    v16[1] = MEMORY[0x1E4F1CC38];
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    id v13 = (void *)[v10 initWithDictionary:v12];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke;
    v14[3] = &unk_1E69B45A8;
    v14[4] = self;
    [v7 setCurrentOnboardingVersionCompletedForCountryCode:v9 countryCodeProvenance:102 date:v5 settings:v13 completion:v14];
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = self;
      _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to find AFib History Feature Availability Provider", buf, 0xCu);
    }
  }
}

void __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  double v6 = HKHRAFibBurdenLogForCategory();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed AFib History onboarding", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) setAFibHistoryFeatureOnboarded:1];
    [*(id *)(a1 + 32) _setDataTypeAsFavorite];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke_cold_1(a1, v5);
    }
  }
}

- (void)_setDataTypeAsFavorite
{
  uint64_t v8 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3_0(&dword_1D3AC6000, v2, v3, "[%{public}@] Error setting favorites: %@", v4, v5, v6, v7, 2u);
}

- (double)_randomlySelectedGaussianWithMean:(double)a3 deviation:(double)a4
{
  long double v6 = (double)arc4random() / 4294967300.0;
  double v7 = (double)arc4random() / 4294967300.0;
  double v8 = sqrt(log(v6) * -2.0);
  return a3 + v8 * cos(v7 * 6.28318531) * a4;
}

- (id)_currentDateFromCurrentTime:(double)a3
{
  uint64_t v4 = [(HDDemoDataGeneratorState *)self->_generatorState firstSampleDate];
  uint64_t v5 = [v4 dateByAddingTimeInterval:a3 * 86400.0];

  return v5;
}

- (id)_metadataForSampleWithPercentage:(double)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HKHRAFibBurdenLocalFeatureAttributes();
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v15[0] = *MEMORY[0x1E4F2BBB0];
  long double v6 = [v4 updateVersion];
  v16[0] = v6;
  v15[1] = *MEMORY[0x1E4F2A090];
  double v7 = NSNumber;
  double v8 = [v4 featureVersion];
  int v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  v16[1] = v9;
  void v15[2] = *MEMORY[0x1E4F2A200];
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v11 = [v10 name];
  void v16[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  id v13 = (void *)[v5 initWithDictionary:v12];

  if (a3 <= 0.02) {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2A1B8]];
  }

  return v13;
}

- (double)nextAFibBurdenSampleTime
{
  return self->_nextAFibBurdenSampleTime;
}

- (void)setNextAFibBurdenSampleTime:(double)a3
{
  self->_nextAFibBurdenSampleTime = a3;
}

- (double)nextHeartbeatSeriesSampleTime
{
  return self->_nextHeartbeatSeriesSampleTime;
}

- (void)setNextHeartbeatSeriesSampleTime:(double)a3
{
  self->_double nextHeartbeatSeriesSampleTime = a3;
}

- (double)heartbeatSeriesSampleFrequency
{
  return self->_heartbeatSeriesSampleFrequency;
}

- (void)setHeartbeatSeriesSampleFrequency:(double)a3
{
  self->_heartbeatSeriesSampleFrequency = a3;
}

- (BOOL)aFibHistoryFeatureOnboarded
{
  return self->_aFibHistoryFeatureOnboarded;
}

- (void)setAFibHistoryFeatureOnboarded:(BOOL)a3
{
  self->_aFibHistoryFeatureOnboarded = a3;
}

- (double)percentAFibChance
{
  return self->_percentAFibChance;
}

- (void)setPercentAFibChance:(double)a3
{
  self->_percentAFibChance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorState, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)generateObjectsForDemoPerson:(uint64_t)a1 fromTime:(NSObject *)a2 toTime:currentDate:objectCollection:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] AFib profile selected but AFib History not onboarded.", (uint8_t *)&v2, 0xCu);
}

void __95__HDHRAFibBurdenDemoDataGenerator__completeAFibHistoryOnboardingIfNecessaryForDemoPerson_date___block_invoke_cold_1(uint64_t a1, void *a2)
{
  double v8 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3_0(&dword_1D3AC6000, v2, v3, "[%{public}@] Unable to complete AFib History onboarding: %@", v4, v5, v6, v7, 2u);
}

@end