@interface HKHRCardioFitnessAnalyticsClientSignalSource
- (HKHRCardioFitnessAnalyticsClientSignalSource)initWithHealthStore:(id)a3;
- (id)biologicalSexStringWithError:(id *)a3;
- (int64_t)bucketedAgeWithError:(id *)a3;
@end

@implementation HKHRCardioFitnessAnalyticsClientSignalSource

- (HKHRCardioFitnessAnalyticsClientSignalSource)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRCardioFitnessAnalyticsClientSignalSource;
  v6 = [(HKHRCardioFitnessAnalyticsClientSignalSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_healthStore, a3);
  }

  return v7;
}

- (int64_t)bucketedAgeWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  healthStore = self->_healthStore;
  id v11 = 0;
  v6 = [(HKHealthStore *)healthStore dateOfBirthComponentsWithError:&v11];
  id v7 = v11;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HKHRCardioFitnessAnalyticsClientSignalSource bucketedAgeWithError:]();
    }
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
LABEL_11:
    int64_t v8 = HKHRCardioFitnessAnalyticsBoundedIntegerErrorSentinel;
    goto LABEL_12;
  }
  if (!v6)
  {
    _HKInitializeLogging();
    objc_super v9 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1E0A83000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No date of birth components, returning invalid value", buf, 0xCu);
    }
    goto LABEL_11;
  }
  int64_t v8 = [(HKHRCardioFitnessAnalyticsSignalSource *)self bucketedAgeForDateOfBirthComponents:v6];
LABEL_12:

  return v8;
}

- (id)biologicalSexStringWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  healthStore = self->_healthStore;
  id v13 = 0;
  v6 = [(HKHealthStore *)healthStore biologicalSexWithError:&v13];
  id v7 = v13;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HKHRCardioFitnessAnalyticsClientSignalSource biologicalSexStringWithError:]();
    }
    if (a3)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      *a3 = v8;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = [v6 biologicalSex];
      goto LABEL_12;
    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1E0A83000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No biological sex object, returning value for not set", buf, 0xCu);
    }
  }
  uint64_t v9 = 0;
LABEL_12:
  id v11 = [(HKHRCardioFitnessAnalyticsSignalSource *)self biologicalSexStringForBiologicalSex:v9];

  return v11;
}

- (void).cxx_destruct
{
}

- (void)bucketedAgeWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%{public}@]: Error when retrieving date of birth components: %{public}@");
}

- (void)biologicalSexStringWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%{public}@]: Error when retrieving biological sex, returning not set: %{public}@");
}

@end