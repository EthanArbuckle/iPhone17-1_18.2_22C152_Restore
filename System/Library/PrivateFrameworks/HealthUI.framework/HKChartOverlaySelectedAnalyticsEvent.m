@interface HKChartOverlaySelectedAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKChartOverlaySelectedAnalyticsEvent)initWithConfiguration:(id)a3 previousItem:(id)a4 currentItem:(id)a5;
- (NSString)eventName;
- (id)determineFeatureVersionWithHealthDataSource:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKChartOverlaySelectedAnalyticsEvent

- (HKChartOverlaySelectedAnalyticsEvent)initWithConfiguration:(id)a3 previousItem:(id)a4 currentItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKChartOverlaySelectedAnalyticsEvent;
  v12 = [(HKChartOverlaySelectedAnalyticsEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_previousItem, a4);
    objc_storeStrong((id *)&v13->_currentItem, a5);
  }

  return v13;
}

- (NSString)eventName
{
  return [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration eventName];
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [v5 healthDataSource];
  id v56 = 0;
  v8 = [v7 biologicalSexWithError:&v56];
  id v9 = v56;

  if (v9)
  {
    _HKInitializeLogging();
    id v10 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration loggingCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    id v11 = *MEMORY[0x1E4F296C8];
    uint64_t v12 = *MEMORY[0x1E4F29698];
    v13 = v6;
    goto LABEL_7;
  }
  if (v8)
  {
    id v9 = HKAnalyticsPropertyValueForBiologicalSex();
    uint64_t v12 = *MEMORY[0x1E4F29698];
    v13 = v6;
    id v11 = v9;
LABEL_7:
    [v13 setObject:v11 forKeyedSubscript:v12];
    goto LABEL_8;
  }
  _HKInitializeLogging();
  id v9 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration loggingCategory];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[HKChartOverlaySelectedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.4((uint64_t)self, v9, v49, v50, v51, v52, v53, v54);
  }
LABEL_8:

  v14 = [v5 healthDataSource];
  objc_super v15 = [v5 environmentDataSource];
  v16 = [v15 currentDate];
  id v55 = 0;
  v17 = [v14 ageWithCurrentDate:v16 error:&v55];
  id v18 = v55;

  if (v18)
  {
    _HKInitializeLogging();
    v19 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration loggingCategory];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    v20 = (void *)*MEMORY[0x1E4F29668];
  }
  else
  {
    v21 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration minimumAge];
    v20 = HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();

    id v18 = v20;
    if (!v17) {
      goto LABEL_14;
    }
  }
  [v6 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F29688]];
  v20 = v18;
LABEL_14:

  v22 = [v5 healthDataSource];
  v23 = [(HKChartOverlaySelectedAnalyticsEvent *)self determineFeatureVersionWithHealthDataSource:v22];

  if (v23) {
    [v6 setObject:v23 forKeyedSubscript:@"featureVersion"];
  }
  previousItem = self->_previousItem;
  if (previousItem)
  {
    v25 = [(HKDisplayTypeContextItem *)previousItem analyticsIdentifier];

    if (v25)
    {
      v26 = [(HKDisplayTypeContextItem *)self->_previousItem analyticsIdentifier];
      v27 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration previousContextItemPropertyName];
      [v6 setObject:v26 forKeyedSubscript:v27];
    }
    else
    {
      _HKInitializeLogging();
      v28 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration loggingCategory];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[HKChartOverlaySelectedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]((uint64_t)self, v28, v29, v30, v31, v32, v33, v34);
      }

      uint64_t v35 = *MEMORY[0x1E4F296C8];
      v26 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration previousContextItemPropertyName];
      [v6 setObject:v35 forKeyedSubscript:v26];
    }
  }
  currentItem = self->_currentItem;
  if (currentItem)
  {
    v37 = [(HKDisplayTypeContextItem *)currentItem analyticsIdentifier];

    if (v37)
    {
      v38 = [(HKDisplayTypeContextItem *)self->_currentItem analyticsIdentifier];
      v39 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration currentContextItemPropertyName];
      [v6 setObject:v38 forKeyedSubscript:v39];
    }
    else
    {
      _HKInitializeLogging();
      v40 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration loggingCategory];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[HKChartOverlaySelectedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]((uint64_t)self, v40, v41, v42, v43, v44, v45, v46);
      }

      uint64_t v47 = *MEMORY[0x1E4F296C8];
      v38 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration currentContextItemPropertyName];
      [v6 setObject:v47 forKeyedSubscript:v38];
    }
  }
  return v6;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)determineFeatureVersionWithHealthDataSource:(id)a3
{
  id v4 = a3;
  p_configuration = &self->_configuration;
  id v6 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)self->_configuration featureIdentifier];

  if (v6)
  {
    v7 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)*p_configuration featureIdentifier];
    v8 = [v4 featureAvailabilityProviderForIdentifier:v7];

    if (v8)
    {
      id v19 = 0;
      id v9 = [v8 featureOnboardingRecordWithError:&v19];
      id v10 = v19;
      if (v9)
      {
        id v11 = [v9 onboardingCompletion];

        if (v11)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          [v12 setNumberStyle:1];
          [v12 setMinimumFractionDigits:1];
          v13 = NSNumber;
          v14 = [v9 onboardingCompletion];
          objc_super v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "version"));
          id v11 = [v12 stringFromNumber:v15];
        }
      }
      else
      {
        _HKInitializeLogging();
        v17 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)*p_configuration loggingCategory];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:]();
        }

        id v11 = (id)*MEMORY[0x1E4F296C8];
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)*p_configuration loggingCategory];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        [(HKChartOverlaySelectedAnalyticsEvent *)(uint64_t)self determineFeatureVersionWithHealthDataSource:v16];
      }

      id v11 = (id)*MEMORY[0x1E4F296C8];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)determineFeatureVersionWithHealthDataSource:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [*a2 featureIdentifier];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_fault_impl(&dword_1E0B26000, a3, OS_LOG_TYPE_FAULT, "[%{public}@] Given feature identifier %{public}@ but no feature availability provider found", (uint8_t *)&v6, 0x16u);
}

@end