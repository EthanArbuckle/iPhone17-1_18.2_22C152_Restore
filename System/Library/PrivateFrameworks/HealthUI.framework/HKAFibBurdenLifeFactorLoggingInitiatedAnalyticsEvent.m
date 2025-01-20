@interface HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent)initWithSampleType:(id)a3 context:(int64_t)a4;
- (NSString)eventName;
- (id)determineFeatureVersionWithHealthDataSource:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent

- (HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent)initWithSampleType:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent;
  v8 = [(HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sampleType, a3);
    v9->_context = a4;
  }

  return v9;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.burden.lifefactorlogged";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [v5 healthDataSource];
  id v32 = 0;
  v8 = [v7 biologicalSexWithError:&v32];
  v9 = v32;

  v10 = (id *)MEMORY[0x1E4F296C8];
  if (v9)
  {
    _HKInitializeLogging();
    objc_super v11 = HKLogAFibBurden();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    id v12 = *v10;
    uint64_t v13 = *MEMORY[0x1E4F29698];
    v14 = v6;
    goto LABEL_7;
  }
  if (v8)
  {
    v9 = HKAnalyticsPropertyValueForBiologicalSex();
    uint64_t v13 = *MEMORY[0x1E4F29698];
    v14 = v6;
    id v12 = v9;
LABEL_7:
    [v14 setObject:v12 forKeyedSubscript:v13];
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v9 = HKLogAFibBurden();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]((uint64_t)self, v9);
  }
LABEL_8:

  v15 = [v5 healthDataSource];
  v16 = [v5 environmentDataSource];
  v17 = [v16 currentDate];
  id v31 = 0;
  v18 = [v15 ageWithCurrentDate:v17 error:&v31];
  id v19 = v31;

  if (v19)
  {
    _HKInitializeLogging();
    v20 = HKLogAFibBurden();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    v21 = (void *)*MEMORY[0x1E4F29668];
  }
  else
  {
    v22 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BC88]];
    v21 = HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();

    id v19 = v21;
    if (!v18) {
      goto LABEL_14;
    }
  }
  [v6 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F29688]];
  v21 = v19;
LABEL_14:

  v23 = [v5 healthDataSource];
  v24 = [(HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *)self determineFeatureVersionWithHealthDataSource:v23];

  if (v24) {
    [v6 setObject:v24 forKeyedSubscript:@"featureVersion"];
  }
  v25 = [(HKSampleType *)self->_sampleType identifier];
  [v6 setObject:v25 forKeyedSubscript:@"lifeFactor"];

  v26 = (__CFString *)*v10;
  v27 = v26;
  int64_t context = self->_context;
  if (context)
  {
    if (context != 1) {
      goto LABEL_21;
    }
    v29 = @"lifeFactorPlatter";
  }
  else
  {
    v29 = @"interactiveChart";
  }

  v27 = v29;
LABEL_21:
  [v6 setObject:v27 forKeyedSubscript:@"context"];

  return v6;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)determineFeatureVersionWithHealthDataSource:(id)a3
{
  v4 = [a3 featureAvailabilityProviderForIdentifier:*MEMORY[0x1E4F29D10]];
  id v5 = v4;
  if (v4)
  {
    id v16 = 0;
    id v6 = [v4 featureOnboardingRecordWithError:&v16];
    id v7 = v16;
    if (v6)
    {
      id v8 = [v6 onboardingCompletion];

      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
        [v9 setNumberStyle:1];
        [v9 setMinimumFractionDigits:1];
        v10 = NSNumber;
        objc_super v11 = [v6 onboardingCompletion];
        id v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "version"));
        id v8 = [v9 stringFromNumber:v12];
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = HKLogAFibBurden();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:]();
      }

      id v8 = (id)*MEMORY[0x1E4F296C8];
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = HKLogAFibBurden();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:]((uint64_t)self, v13);
    }

    id v8 = (id)*MEMORY[0x1E4F296C8];
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "[%{public}@] Error when determining age, continuing daily analytics submission: %{public}@");
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] No error when fetching biological sex but also didn't get object", (uint8_t *)&v2, 0xCu);
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "[%{public}@] Error when determining biological sex, continuing daily analytics submission: %{public}@");
}

- (void)determineFeatureVersionWithHealthDataSource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] No feature availability provider found", (uint8_t *)&v2, 0xCu);
}

- (void)determineFeatureVersionWithHealthDataSource:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "[%{public}@] Error when retrieving onboarding record: %{public}@");
}

@end