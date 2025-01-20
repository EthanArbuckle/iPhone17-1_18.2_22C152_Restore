@interface HDHRCardioFitnessAnalyticsDailyEventDataSource
+ (id)localGregorianCalendar;
- (BOOL)determineIsNotificationsEnabled;
- (HDHRCardioFitnessAnalyticsDailyEventDataSource)initWithProfile:(id)a3;
- (id)determineDaysSinceLastLowNotificationWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5;
- (id)determineDaysSinceLastVO2MaxSampleWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5;
- (id)determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3 error:(id *)a4;
- (id)determineIsHeartRateEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3;
- (id)determineIsWristDetectionEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3;
- (id)determineNumberOfLowNotificationsInPastYearWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5;
- (id)latestClassificationWithIsOnboarded:(BOOL)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5;
- (int64_t)_determineDaysSinceLastSampleWithSampleType:(id)a3 currentDate:(id)a4 error:(id *)a5;
- (int64_t)determineWeeksSinceOnboardingWithCurrentDate:(id)a3 error:(id *)a4;
- (int64_t)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4;
@end

@implementation HDHRCardioFitnessAnalyticsDailyEventDataSource

- (HDHRCardioFitnessAnalyticsDailyEventDataSource)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHRCardioFitnessAnalyticsDailyEventDataSource;
  v5 = [(HDHRCardioFitnessAnalyticsDailyEventDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)determineDaysSinceLastLowNotificationWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    v9 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F297F8]];
    id v15 = 0;
    int64_t v10 = [(HDHRCardioFitnessAnalyticsDailyEventDataSource *)self _determineDaysSinceLastSampleWithSampleType:v9 currentDate:v8 error:&v15];
    id v11 = v15;
    if (v11)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineDaysSinceLastLowNotificationWithCurrentDate:isImproveHealthAndActivityAllowed:error:]();
      }
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
    else
    {
      v12 = [NSNumber numberWithInteger:v10];
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including days since last low notification as user does not have IH&A allowed", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)determineDaysSinceLastVO2MaxSampleWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    v9 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A918]];
    id v15 = 0;
    int64_t v10 = [(HDHRCardioFitnessAnalyticsDailyEventDataSource *)self _determineDaysSinceLastSampleWithSampleType:v9 currentDate:v8 error:&v15];
    id v11 = v15;
    if (v11)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineDaysSinceLastVO2MaxSampleWithCurrentDate:isImproveHealthAndActivityAllowed:error:]();
      }
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
    else
    {
      v12 = [NSNumber numberWithInteger:v10];
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including days since last low VO2 Max as user does not have IH&A allowed", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)determineNumberOfLowNotificationsInPastYearWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    v9 = +[HDHRCardioFitnessAnalyticsDailyEventDataSource localGregorianCalendar];
    int64_t v10 = [v9 dateByAddingUnit:4 value:-1 toDate:v8 options:0];
    id v11 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F297F8]];
    v12 = (void *)MEMORY[0x1E4F65D08];
    v13 = HDSampleEntityPredicateForStartDate();
    v25[0] = v13;
    v14 = HDSampleEntityPredicateForStartDate();
    v25[1] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v16 = [v12 predicateMatchingAllPredicates:v15];

    v17 = (void *)MEMORY[0x1E4F65BE8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v24 = 0;
    uint64_t v19 = [v17 countOfSamplesWithType:v11 profile:WeakRetained matchingPredicate:v16 withError:&v24];
    id v20 = v24;

    if (v20)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineNumberOfLowNotificationsInPastYearWithCurrentDate:isImproveHealthAndActivityAllowed:error:]();
      }
      if (a5)
      {
        v21 = 0;
        *a5 = v20;
      }
      else
      {
        _HKLogDroppedError();
        v21 = 0;
      }
    }
    else
    {
      v21 = [NSNumber numberWithInteger:v19];
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including number of low notifications in past year as user does not have IH&A allowed", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (id)determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6 = [MEMORY[0x1E4F2ACC8] characteristicTypeForIdentifier:*MEMORY[0x1E4F2BA00]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v8 = [WeakRetained userCharacteristicsManager];
    id v15 = 0;
    v9 = [v8 userCharacteristicForType:v6 error:&v15];
    id v10 = v15;

    if (v10)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:error:]();
      }
      if (a4)
      {
        id v11 = 0;
        *a4 = v10;
      }
      else
      {
        _HKLogDroppedError();
        id v11 = 0;
      }
    }
    else if (v9)
    {
      BOOL v13 = [v9 unsignedIntValue] != 0;
      id v11 = [NSNumber numberWithBool:v13];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including whether user has blockers enabled as user does not have IH&A allowed", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)determineIsHeartRateEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 persistentDomainForName:*MEMORY[0x1E4F2BF20]];

    v5 = [v4 objectForKey:*MEMORY[0x1E4F2BF30]];
    v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)MEMORY[0x1E4F1CC38];
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including whether user has heart rate as user does not have IH&A allowed", (uint8_t *)&v11, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)determineIsWristDetectionEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F2B820] isWristDetectEnabled];
    id v4 = [NSNumber numberWithBool:v3];
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including whether user has wrist detect as user does not have IH&A allowed", (uint8_t *)&v8, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

- (int64_t)determineWeeksSinceOnboardingWithCurrentDate:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F65B10]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = (os_log_t *)MEMORY[0x1E4F29F48];
  uint64_t v10 = (void *)[v7 initWithProfile:WeakRetained featureIdentifier:*MEMORY[0x1E4F29D18] currentOnboardingVersion:1 loggingCategory:*MEMORY[0x1E4F29F48]];

  id v16 = 0;
  int v11 = [v10 earliestDateLowestOnboardingVersionCompletedWithError:&v16];
  id v12 = v16;
  if (v12)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineWeeksSinceOnboardingWithCurrentDate:error:]();
    }
    if (a4) {
      *a4 = v12;
    }
    else {
      _HKLogDroppedError();
    }
LABEL_11:
    int64_t v13 = *MEMORY[0x1E4F67D60];
    goto LABEL_12;
  }
  if (!v11)
  {
    _HKInitializeLogging();
    v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = self;
      _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No onboarding date given, user has not onboarded yet", buf, 0xCu);
    }
    goto LABEL_11;
  }
  int64_t v13 = [(HDHRCardioFitnessAnalyticsDailyEventDataSource *)self numberOfDaysBetweenStartDate:v11 endDate:v6]/ 7;
LABEL_12:

  return v13;
}

- (BOOL)determineIsNotificationsEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F2BE70]];

  return v4;
}

- (id)latestClassificationWithIsOnboarded:(BOOL)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    BOOL v7 = a3;
    int v8 = [HDHRCardioFitnessAnalyticsSignalSource alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v10 = [(HDHRCardioFitnessAnalyticsSignalSource *)v8 initWithProfile:WeakRetained];

    int v11 = [(HDHRCardioFitnessAnalyticsSignalSource *)v10 latestClassificationWithIsOnboarded:v7 error:a5];
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = self;
      _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including latest classification as user does not have IH&A allowed", (uint8_t *)&v14, 0xCu);
    }
    int v11 = 0;
  }

  return v11;
}

- (int64_t)_determineDaysSinceLastSampleWithSampleType:(id)a3 currentDate:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1E4F65BE8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v20 = 0;
  id v12 = [v10 mostRecentSampleWithType:v8 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v20];
  id v13 = v20;

  if (v13)
  {
    _HKInitializeLogging();
    int v14 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v14;
      uint64_t v19 = [v8 identifier];
      *(_DWORD *)buf = 138543874;
      v22 = self;
      __int16 v23 = 2114;
      id v24 = v19;
      __int16 v25 = 2114;
      id v26 = v13;
      _os_log_error_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Error when querying for %{public}@: %{public}@", buf, 0x20u);
    }
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    int64_t v16 = *MEMORY[0x1E4F67D60];
    goto LABEL_10;
  }
  id v15 = [v12 startDate];
  int64_t v16 = [(HDHRCardioFitnessAnalyticsDailyEventDataSource *)self numberOfDaysBetweenStartDate:v15 endDate:v9];

LABEL_10:
  return v16;
}

- (int64_t)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = +[HDHRCardioFitnessAnalyticsDailyEventDataSource localGregorianCalendar];
  id v14 = 0;
  [v7 rangeOfUnit:16 startDate:&v14 interval:0 forDate:v6];

  id v8 = v14;
  id v13 = 0;
  [v7 rangeOfUnit:16 startDate:&v13 interval:0 forDate:v5];

  id v9 = v13;
  uint64_t v10 = [v7 components:16 fromDate:v8 toDate:v9 options:0];
  int64_t v11 = [v10 day];

  return v11;
}

+ (id)localGregorianCalendar
{
  id v2 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v3];

  return v2;
}

- (void).cxx_destruct
{
}

- (void)determineDaysSinceLastLowNotificationWithCurrentDate:isImproveHealthAndActivityAllowed:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error when determining days since last low notification, will retry daily event: %{public}@");
}

- (void)determineDaysSinceLastVO2MaxSampleWithCurrentDate:isImproveHealthAndActivityAllowed:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error when determining days since last VO2 max sample, will retry daily event: %{public}@");
}

- (void)determineNumberOfLowNotificationsInPastYearWithCurrentDate:isImproveHealthAndActivityAllowed:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error received from query, assigning error so we retry: %{public}@");
}

- (void)determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error when retrieving cardio fitness medications use object, using error sentinel: %{public}@");
}

- (void)determineWeeksSinceOnboardingWithCurrentDate:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error when determining onboarding date: %{public}@");
}

@end