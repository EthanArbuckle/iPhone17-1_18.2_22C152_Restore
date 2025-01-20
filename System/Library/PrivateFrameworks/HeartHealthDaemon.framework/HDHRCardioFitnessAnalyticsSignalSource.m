@interface HDHRCardioFitnessAnalyticsSignalSource
- (HDHRCardioFitnessAnalyticsSignalSource)initWithProfile:(id)a3;
- (id)_birthDateComponentsWithError:(id *)a3;
- (id)_classificationStringForCardioFitnessValue:(double)a3 age:(int64_t)a4 biologicalSex:(int64_t)a5;
- (id)_latestCardioFitnessValueWithError:(id *)a3;
- (id)biologicalSexStringWithError:(id *)a3;
- (id)latestClassificationWithIsOnboarded:(BOOL)a3 error:(id *)a4;
- (int64_t)_biologicalSexWithError:(id *)a3;
- (int64_t)bucketedAgeWithError:(id *)a3;
@end

@implementation HDHRCardioFitnessAnalyticsSignalSource

- (HDHRCardioFitnessAnalyticsSignalSource)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHRCardioFitnessAnalyticsSignalSource;
  v5 = [(HDHRCardioFitnessAnalyticsSignalSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (int64_t)bucketedAgeWithError:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(HDHRCardioFitnessAnalyticsSignalSource *)self _birthDateComponentsWithError:a3];
  if (v4)
  {
    int64_t v5 = [(HKHRCardioFitnessAnalyticsSignalSource *)self bucketedAgeForDateOfBirthComponents:v4];
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No date of birth components, returning invalid value", (uint8_t *)&v8, 0xCu);
    }
    int64_t v5 = *MEMORY[0x1E4F67D60];
  }

  return v5;
}

- (id)biologicalSexStringWithError:(id *)a3
{
  int64_t v4 = [(HDHRCardioFitnessAnalyticsSignalSource *)self _biologicalSexWithError:a3];

  return [(HKHRCardioFitnessAnalyticsSignalSource *)self biologicalSexStringForBiologicalSex:v4];
}

- (id)latestClassificationWithIsOnboarded:(BOOL)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v24 = 0;
    v6 = [(HDHRCardioFitnessAnalyticsSignalSource *)self _birthDateComponentsWithError:&v24];
    id v7 = v24;
    if (v7)
    {
      int v8 = v7;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:]();
      }
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }

      uint64_t v10 = 0;
    }
    else if (v6)
    {
      int64_t v11 = [(HDHRCardioFitnessAnalyticsSignalSource *)self _biologicalSexWithError:a4];
      id v23 = 0;
      v12 = [(HDHRCardioFitnessAnalyticsSignalSource *)self _latestCardioFitnessValueWithError:&v23];
      id v13 = v23;
      if (v13)
      {
        if (a4)
        {
          uint64_t v10 = 0;
          *a4 = v13;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v10 = 0;
        }
      }
      else if (v12)
      {
        v15 = [v12 startDate];
        uint64_t v16 = objc_msgSend(v6, "hk_ageWithCurrentDate:", v15);

        v17 = [v12 quantity];
        v18 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/kg*min"];
        [v17 doubleValueForUnit:v18];
        double v20 = v19;

        uint64_t v10 = [(HDHRCardioFitnessAnalyticsSignalSource *)self _classificationStringForCardioFitnessValue:v16 age:v11 biologicalSex:v20];
      }
      else
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E4F29F48];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
          -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:]((uint64_t)self, v21);
        }
        uint64_t v10 = @"no classification";
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:]((uint64_t)self, v14);
      }
      uint64_t v10 = @"no classification";
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_INFO, "[%{public}@] User is not onboarded, will not report classifciation", buf, 0xCu);
    }
    uint64_t v10 = @"not onboarded";
  }

  return v10;
}

- (id)_latestCardioFitnessValueWithError:(id *)a3
{
  int64_t v5 = (void *)MEMORY[0x1E4F65BE8];
  v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A918]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = 0;
  int v8 = [v5 mostRecentSampleWithType:v6 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v12];
  id v9 = v12;

  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessAnalyticsSignalSource _latestCardioFitnessValueWithError:]();
    }
    if (a3)
    {
      id v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      id v10 = 0;
    }
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (id)_classificationStringForCardioFitnessValue:(double)a3 age:(int64_t)a4 biologicalSex:(int64_t)a5
{
  uint64_t v5 = [MEMORY[0x1E4F2ACA0] cardioFitnessLevelForVO2Max:a5 biologicalSex:a4 age:a3];
  v6 = (void *)MEMORY[0x1E4F2ACA0];

  return (id)[v6 analyticsStringForLevel:v5];
}

- (id)_birthDateComponentsWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F2ACC8] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained userCharacteristicsManager];
  id v12 = 0;
  int v8 = [v7 userCharacteristicForType:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessAnalyticsSignalSource _birthDateComponentsWithError:]();
    }
    if (a3)
    {
      id v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      id v10 = 0;
    }
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (int64_t)_biologicalSexWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F2ACC8] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained userCharacteristicsManager];
  id v13 = 0;
  int v8 = [v7 userCharacteristicForType:v5 error:&v13];
  id v9 = v13;

  if (!v9)
  {
    if (v8)
    {
      int64_t v10 = [v8 integerValue];
      goto LABEL_12;
    }
    _HKInitializeLogging();
    int64_t v11 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No biological sex number, returning not set", buf, 0xCu);
    }
LABEL_11:
    int64_t v10 = 0;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    -[HDHRCardioFitnessAnalyticsSignalSource _biologicalSexWithError:]();
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_11;
  }
  int64_t v10 = 0;
  *a3 = v9;
LABEL_12:

  return v10;
}

- (void).cxx_destruct
{
}

- (void)latestClassificationWithIsOnboarded:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Date of birth missing, returning no classification", (uint8_t *)&v2, 0xCu);
}

- (void)latestClassificationWithIsOnboarded:error:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error encountered when retrieving date of birth: %{public}@");
}

- (void)_latestCardioFitnessValueWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error encountered when retrieving latest cardio fitness sample: %{public}@");
}

- (void)_birthDateComponentsWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error when retrieving date of birth components: %{public}@");
}

- (void)_biologicalSexWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@]: Error when retrieving biological sex, returning not set: %{public}@");
}

@end