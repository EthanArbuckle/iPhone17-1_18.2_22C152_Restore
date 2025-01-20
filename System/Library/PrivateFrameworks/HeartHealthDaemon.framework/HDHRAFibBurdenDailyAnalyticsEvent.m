@interface HDHRAFibBurdenDailyAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDHRAFibBurdenDailyAnalyticsEvent)initWithProfile:(id)a3;
- (HDHRAFibBurdenDailyAnalyticsEvent)initWithProfile:(id)a3 notificationsAuthorizedProvider:(id)a4;
- (NSString)eventName;
- (id)_determineIfSamplesOverlappingSample:(id)a3 dataSource:(id)a4;
- (id)_numberOfSamplesOfType:(id)a3 dateInterval:(id)a4 additionalPredicate:(id)a5 bucketer:(id)a6;
- (id)_sedentaryAndBackgroundHeartRateContextPredicate;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int64_t)_bucketedBurdenValueForSample:(id)a3;
- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4;
- (int64_t)_daysSinceDate:(id)a3 dataSource:(id)a4;
- (int64_t)_daysSinceDate:(id)a3 maximum:(id)a4 dataSource:(id)a5;
- (void)_extractAFibBurdenFeatureStatusPropertiesFromDataSource:(id)a3 payload:(id)a4;
- (void)_extractBucketedDaysSinceLastSampleOfType:(id)a3 intoProperty:(id)a4 inPayload:(id)a5 dataSource:(id)a6;
- (void)_extractBurdenSamplePropertiesIntoPayload:(id)a3 dataSource:(id)a4;
- (void)_extractDaysSinceDateInKeyValueDomain:(id)a3 withKey:(id)a4 intoProperty:(id)a5 inPayload:(id)a6 dataSource:(id)a7;
- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:(id)a3 payload:(id)a4 dataSource:(id)a5 ifOnboardedBlock:(id)a6 ifUsageRequirementsEvaluationPresentBlock:(id)a7 ifErrorRetrievingFeatureStatusBlock:(id)a8;
- (void)_extractIRNFeatureStatusPropertiesFromDataSource:(id)a3 payload:(id)a4;
- (void)_extractWatchWearPropertiesIntoPayload:(id)a3 dataSource:(id)a4;
@end

@implementation HDHRAFibBurdenDailyAnalyticsEvent

- (HDHRAFibBurdenDailyAnalyticsEvent)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [v4 notificationManager];
  v6 = [(HDHRAFibBurdenDailyAnalyticsEvent *)self initWithProfile:v4 notificationsAuthorizedProvider:v5];

  return v6;
}

- (HDHRAFibBurdenDailyAnalyticsEvent)initWithProfile:(id)a3 notificationsAuthorizedProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDHRAFibBurdenDailyAnalyticsEvent;
  v8 = [(HDHRAFibBurdenDailyAnalyticsEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_notificationsAuthorizedProvider, a4);
  }

  return v9;
}

- (NSString)eventName
{
  return (NSString *)(id)*MEMORY[0x1E4F67D20];
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [v5 environmentDataSource];
  v8 = [v7 activePairedDeviceProductType];

  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F29680]];
  }
  v9 = [v5 healthDataSource];
  id v35 = 0;
  v10 = [v9 biologicalSexWithError:&v35];
  objc_super v11 = v35;

  if (v11)
  {
    _HKInitializeLogging();
    v12 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    v13 = *MEMORY[0x1E4F296C8];
    uint64_t v14 = *MEMORY[0x1E4F29698];
    v15 = v6;
    goto LABEL_9;
  }
  if (v10)
  {
    objc_super v11 = HKAnalyticsPropertyValueForBiologicalSex();
    uint64_t v14 = *MEMORY[0x1E4F29698];
    v15 = v6;
    v13 = v11;
LABEL_9:
    [v15 setObject:v13 forKeyedSubscript:v14];
    goto LABEL_10;
  }
  _HKInitializeLogging();
  objc_super v11 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
  }
LABEL_10:

  v16 = [v5 healthDataSource];
  v17 = [v5 environmentDataSource];
  v18 = [v17 currentDate];
  id v34 = 0;
  v19 = [v16 ageWithCurrentDate:v18 error:&v34];
  id v20 = v34;

  if (v20)
  {
    _HKInitializeLogging();
    v21 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    v22 = (void *)*MEMORY[0x1E4F29668];
  }
  else
  {
    v23 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BC88]];
    v22 = HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();

    id v20 = v22;
    if (!v19) {
      goto LABEL_16;
    }
  }
  [v6 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F29688]];
  v22 = v20;
LABEL_16:

  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractAFibBurdenFeatureStatusPropertiesFromDataSource:v5 payload:v6];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractIRNFeatureStatusPropertiesFromDataSource:v5 payload:v6];
  v24 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v26 = objc_msgSend(v24, "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", WeakRetained);

  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractDaysSinceDateInKeyValueDomain:v26 withKey:*MEMORY[0x1E4F67D48] intoProperty:@"numberOfDaysSinceLastAnalysis" inPayload:v6 dataSource:v5];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractDaysSinceDateInKeyValueDomain:v26 withKey:*MEMORY[0x1E4F67D50] intoProperty:@"numberOfDaysSinceLastNotification" inPayload:v6 dataSource:v5];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractBurdenSamplePropertiesIntoPayload:v6 dataSource:v5];
  v27 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractBucketedDaysSinceLastSampleOfType:v27 intoProperty:@"numberOfDaysSinceLastSleepEntry" inPayload:v6 dataSource:v5];

  v28 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A858]];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractBucketedDaysSinceLastSampleOfType:v28 intoProperty:@"numberOfDaysSinceLastAlcoholicDrinksEntry" inPayload:v6 dataSource:v5];

  v29 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29818]];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractBucketedDaysSinceLastSampleOfType:v29 intoProperty:@"numberOfDaysSinceLastMindfulMinutesEntry" inPayload:v6 dataSource:v5];

  v30 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A630]];
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractBucketedDaysSinceLastSampleOfType:v30 intoProperty:@"numberOfDaysSinceLastBodyMassEntry" inPayload:v6 dataSource:v5];

  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractWatchWearPropertiesIntoPayload:v6 dataSource:v5];
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[HDHRAFibBurdenAnalyticsEventHealthAppNotificationsAuthorizedProvider areHealthNotificationsAuthorized](self->_notificationsAuthorizedProvider, "areHealthNotificationsAuthorized"));
  [v6 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F29690]];

  v32 = (void *)[v6 copy];

  return v32;
}

- (void)_extractAFibBurdenFeatureStatusPropertiesFromDataSource:(id)a3 payload:(id)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F29D10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke;
  v9[3] = &unk_1E69B45D0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractFeatureStatusPropertiesForFeatureIdentifier:v7 payload:a4 dataSource:v8 ifOnboardedBlock:v9 ifUsageRequirementsEvaluationPresentBlock:&__block_literal_global_4 ifErrorRetrievingFeatureStatusBlock:&__block_literal_global_348];
}

void __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = [v16 featureSettings];
  uint64_t v7 = [v6 numberForKey:*MEMORY[0x1E4F29DE0]];

  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"isBurdenSettingEnabled"];
  }
  id v8 = [v16 featureSettings];
  v9 = [v8 numberForKey:*MEMORY[0x1E4F67D68]];

  if (v7) {
    [v5 setObject:v9 forKeyedSubscript:@"isWeeklyNotificationSettingEnabled"];
  }
  id v10 = [v16 onboardingCompletion];
  objc_super v11 = NSNumber;
  v12 = *(void **)(a1 + 32);
  v13 = [v10 completionDate];
  uint64_t v14 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "_bucketedWeeksSinceDate:dataSource:", v13, *(void *)(a1 + 40)));
  [v5 setObject:v14 forKeyedSubscript:@"weeksSinceOnboardedBurden"];

  [v10 version];
  v15 = HKHRAFibBurdenAnalyticsPropertyValueForVersion();
  [v5 setObject:v15 forKeyedSubscript:@"versionBurden"];
}

void __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(a2, "areAllRequirementsSatisfied"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:@"isBurdenFeatureEnabled"];
}

void __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F29660];
  id v4 = a2;
  [v4 setObject:v2 forKeyedSubscript:@"isBurdenSettingEnabled"];
  [v4 setObject:v2 forKeyedSubscript:@"isWeeklyNotificationSettingEnabled"];
  uint64_t v3 = *MEMORY[0x1E4F29668];
  [v4 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:@"isBurdenFeatureEnabled"];
  [v4 setObject:v3 forKeyedSubscript:@"weeksSinceOnboardedBurden"];
  [v4 setObject:*MEMORY[0x1E4F296C8] forKeyedSubscript:@"versionBurden"];
}

- (void)_extractIRNFeatureStatusPropertiesFromDataSource:(id)a3 payload:(id)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F29D60];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke;
  v9[3] = &unk_1E69B45D0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(HDHRAFibBurdenDailyAnalyticsEvent *)self _extractFeatureStatusPropertiesForFeatureIdentifier:v7 payload:a4 dataSource:v8 ifOnboardedBlock:v9 ifUsageRequirementsEvaluationPresentBlock:&__block_literal_global_350 ifErrorRetrievingFeatureStatusBlock:&__block_literal_global_352];
}

void __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v10 = [a2 onboardingCompletion];
  id v6 = NSNumber;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v10 completionDate];
  v9 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "_bucketedWeeksSinceDate:dataSource:", v8, *(void *)(a1 + 40)));
  [v5 setObject:v9 forKeyedSubscript:@"weeksSinceOnboardedIRN"];
}

void __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(a2, "areAllRequirementsSatisfied"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:@"isIRNEnabled"];
}

void __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F29660];
  id v3 = a2;
  [v3 setObject:v2 forKeyedSubscript:@"isIRNEnabled"];
  [v3 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:@"weeksSinceOnboardedIRN"];
}

- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:(id)a3 payload:(id)a4 dataSource:(id)a5 ifOnboardedBlock:(id)a6 ifUsageRequirementsEvaluationPresentBlock:(id)a7 ifErrorRetrievingFeatureStatusBlock:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = (void (**)(id, void *, id))a6;
  v17 = (void (**)(id, void *, id))a7;
  v18 = (void (**)(id, id))a8;
  v19 = [a5 healthDataSource];
  id v20 = [v19 featureStatusProviderForIdentifier:v14];

  if (v20)
  {
    id v42 = 0;
    v21 = [v20 featureStatusWithError:&v42];
    id v22 = v42;
    v23 = v22;
    if (!v21)
    {
      _HKInitializeLogging();
      v38 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v44 = self;
        __int16 v45 = 2114;
        id v46 = v14;
        __int16 v47 = 2114;
        v48 = v23;
        _os_log_error_impl(&dword_1D3AC6000, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving feature status for %{public}@: %{public}@", buf, 0x20u);
      }

      v18[2](v18, v15);
      goto LABEL_18;
    }
    id v41 = v22;
    v24 = [v21 onboardingRecord];
    uint64_t v25 = [v24 onboardingCompletion];
    if (v25)
    {
      v26 = (void *)v25;
      [v21 onboardingRecord];
      v27 = v18;
      id v28 = v14;
      id v29 = v15;
      v30 = v16;
      v32 = v31 = v17;
      v40 = v21;
      uint64_t v33 = [v32 onboardingState];

      v17 = v31;
      id v16 = v30;
      id v15 = v29;
      id v14 = v28;
      v18 = v27;

      BOOL v34 = v33 == 3;
      v21 = v40;
      v23 = v41;
      if (v34)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v35 = [v40 onboardingRecord];
      v16[2](v16, v35, v15);

      v36 = [v40 requirementsEvaluationByContext];
      v24 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];

      if (v24)
      {
        v17[2](v17, v24, v15);
      }
      else
      {
        _HKInitializeLogging();
        v39 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          -[HDHRAFibBurdenDailyAnalyticsEvent _extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:]();
        }
      }
      v21 = v40;
    }

    v23 = v41;
    goto LABEL_18;
  }
  _HKInitializeLogging();
  v37 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
    -[HDHRAFibBurdenDailyAnalyticsEvent _extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:]();
  }

  v18[2](v18, v15);
LABEL_19:
}

- (void)_extractDaysSinceDateInKeyValueDomain:(id)a3 withKey:(id)a4 intoProperty:(id)a5 inPayload:(id)a6 dataSource:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v17 = 0;
  id v15 = [a3 dateForKey:a4 error:&v17];
  if (v15)
  {
    id v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDHRAFibBurdenDailyAnalyticsEvent _daysSinceDate:maximum:dataSource:](self, "_daysSinceDate:maximum:dataSource:", v15, &unk_1F2B42178, v14));
    [v13 setObject:v16 forKeyedSubscript:v12];
  }
  else if (v17)
  {
    [v13 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:v12];
  }
}

- (void)_extractBurdenSamplePropertiesIntoPayload:(id)a3 dataSource:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  v9 = (void *)MEMORY[0x1E4F65BE8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v35 = 0;
  objc_super v11 = [v9 mostRecentSampleWithType:v8 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v35];
  id v12 = v35;

  if (v11)
  {
    id v32 = v12;
    uint64_t v33 = v8;
    id v13 = NSNumber;
    id v14 = [v11 _creationDate];
    id v15 = objc_msgSend(v13, "numberWithInteger:", -[HDHRAFibBurdenDailyAnalyticsEvent _daysSinceDate:maximum:dataSource:](self, "_daysSinceDate:maximum:dataSource:", v14, &unk_1F2B42178, v7));
    BOOL v34 = v6;
    [v6 setObject:v15 forKeyedSubscript:@"numberOfDaysSinceLastSample"];

    id v16 = [v7 environmentDataSource];
    uint64_t v17 = [v16 calendarCache];
    v18 = [v11 _timeZone];
    v19 = [v17 calendarForTimeZone:v18];

    uint64_t v20 = objc_msgSend(v11, "hk_dayIndexRangeWithCalendar:", v19);
    uint64_t v22 = v21;
    v23 = [v7 environmentDataSource];
    v24 = [v23 currentDate];
    uint64_t v25 = HKHRAFibBurdenPreviousWeekDayIndexRange();
    uint64_t v27 = v26;

    if (v20 == v25 && v22 - 1 == v27)
    {
      id v28 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDHRAFibBurdenDailyAnalyticsEvent _bucketedBurdenValueForSample:](self, "_bucketedBurdenValueForSample:", v11));
      id v6 = v34;
      [v34 setObject:v28 forKeyedSubscript:@"previousWeekBurdenValue"];

      id v29 = [(HDHRAFibBurdenDailyAnalyticsEvent *)self _determineIfSamplesOverlappingSample:v11 dataSource:v7];
      [v34 setObject:v29 forKeyedSubscript:@"previousWeekHasOverlappingSamples"];
    }
    else
    {
      _HKInitializeLogging();
      id v29 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = self;
        _os_log_impl(&dword_1D3AC6000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Most recent sample not for previous calendar week", buf, 0xCu);
      }
      id v6 = v34;
    }
    id v12 = v32;
    id v8 = v33;
  }
  else if (v12)
  {
    _HKInitializeLogging();
    v30 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenDailyAnalyticsEvent _extractBurdenSamplePropertiesIntoPayload:dataSource:]();
    }

    uint64_t v31 = *MEMORY[0x1E4F29668];
    [v6 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:@"numberOfDaysSinceLastSample"];
    [v6 setObject:v31 forKeyedSubscript:@"previousWeekBurdenValue"];
    [v6 setObject:*MEMORY[0x1E4F29660] forKeyedSubscript:@"previousWeekHasOverlappingSamples"];
  }
}

- (id)_determineIfSamplesOverlappingSample:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = [a4 environmentDataSource];
  id v8 = [v7 calendarCache];
  v9 = [v6 _timeZone];
  id v10 = [v8 calendarForTimeZone:v9];

  objc_super v11 = [v6 startDate];
  uint64_t v12 = objc_msgSend(v11, "hk_dayIndexWithCalendar:", v10);

  id v13 = [v6 endDate];
  uint64_t v14 = objc_msgSend(v13, "hk_dayIndexWithCalendar:", v10);

  id v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_earliestPossibleDateWithDayIndex:", v12);
  id v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_latestPossibleDateWithDayIndex:", v14);
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v16];
  v18 = (void *)MEMORY[0x1E4F65BE8];
  v19 = [v6 quantityType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v21 = [v6 quantityType];

  uint64_t v22 = HDSampleEntityPredicateForDateInterval();
  id v29 = 0;
  v23 = [v18 samplesWithType:v19 profile:WeakRetained encodingOptions:0 predicate:v22 limit:2 anchor:0 error:&v29];
  id v24 = v29;

  if (v23)
  {
    objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(v23, "count") > 1);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v26 = HKHRAFibBurdenLogForCategory();
    uint64_t v27 = v26;
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[HDHRAFibBurdenDailyAnalyticsEvent _determineIfSamplesOverlappingSample:dataSource:]();
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      -[HDHRAFibBurdenDailyAnalyticsEvent _determineIfSamplesOverlappingSample:dataSource:]();
    }

    id v25 = (id)*MEMORY[0x1E4F29660];
  }

  return v25;
}

- (void)_extractBucketedDaysSinceLastSampleOfType:(id)a3 intoProperty:(id)a4 inPayload:(id)a5 dataSource:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1E4F65BE8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v25 = 0;
  id v16 = [v14 mostRecentSampleWithType:v10 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v25];
  id v17 = v25;

  if (v16)
  {
    v18 = [v16 startDate];
    uint64_t v19 = [(HDHRAFibBurdenDailyAnalyticsEvent *)self _daysSinceDate:v18 dataSource:v13];

    id v20 = (id)*MEMORY[0x1E4F29668];
    uint64_t v21 = v20;
    if (v19)
    {
      if (v19 == 1)
      {
        uint64_t v22 = &unk_1F2B421A8;
      }
      else if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v22 = &unk_1F2B421C0;
      }
      else if ((v19 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      {
        uint64_t v22 = &unk_1F2B421D8;
      }
      else if ((unint64_t)(v19 - 8) >= 7)
      {
        if ((unint64_t)(v19 - 15) >= 7)
        {
          if ((unint64_t)(v19 - 22) >= 7)
          {
            if ((unint64_t)(v19 - 29) >= 0x20)
            {
              if ((unint64_t)(v19 - 61) >= 0x1E)
              {
                if (v19 < 91)
                {
LABEL_27:
                  [v12 setObject:v21 forKeyedSubscript:v11];

                  goto LABEL_28;
                }
                uint64_t v22 = &unk_1F2B42268;
              }
              else
              {
                uint64_t v22 = &unk_1F2B42250;
              }
            }
            else
            {
              uint64_t v22 = &unk_1F2B42238;
            }
          }
          else
          {
            uint64_t v22 = &unk_1F2B42220;
          }
        }
        else
        {
          uint64_t v22 = &unk_1F2B42208;
        }
      }
      else
      {
        uint64_t v22 = &unk_1F2B421F0;
      }
    }
    else
    {
      uint64_t v22 = &unk_1F2B42190;
    }

    uint64_t v21 = v22;
    goto LABEL_27;
  }
  if (v17)
  {
    _HKInitializeLogging();
    v23 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = [v10 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = self;
      __int16 v28 = 2114;
      id v29 = v24;
      __int16 v30 = 2114;
      id v31 = v17;
      _os_log_error_impl(&dword_1D3AC6000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving sample of type %{public}@: %{public}@", buf, 0x20u);
    }
    [v12 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:v11];
  }
LABEL_28:
}

- (void)_extractWatchWearPropertiesIntoPayload:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 environmentDataSource];
  v9 = [v8 calendarCache];
  id v10 = [v9 currentCalendar];

  id v11 = [v7 environmentDataSource];

  id v12 = [v11 currentDate];

  id v13 = [v10 dateByAddingUnit:16 value:-1 toDate:v12 options:0];
  id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v15 = [v10 startOfDayForDate:v13];
  id v16 = [v10 startOfDayForDate:v12];
  id v17 = (void *)[v14 initWithStartDate:v15 endDate:v16];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "component:fromDate:", 512, v13));
  [v6 setObject:v18 forKeyedSubscript:@"previousCalendarDayOfWeek"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v31[5] = 0;
  HDAnalyticsBucketedNumberOfStandAndIdleHours();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = 0;

  if (!v20)
  {
    _HKInitializeLogging();
    uint64_t v22 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenDailyAnalyticsEvent _extractWatchWearPropertiesIntoPayload:dataSource:]();
    }

    id v20 = (id)*MEMORY[0x1E4F29668];
  }
  [v6 setObject:v20 forKeyedSubscript:@"numberOfStandHoursInPreviousCalendarDay"];
  [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  id v29 = v21;
  id v24 = v23 = v6;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke;
  v31[3] = &unk_1E69B4638;
  v31[4] = self;
  id v25 = [(HDHRAFibBurdenDailyAnalyticsEvent *)self _numberOfSamplesOfType:v24 dateInterval:v17 additionalPredicate:0 bucketer:v31];

  [v23 setObject:v25 forKeyedSubscript:@"numberOfTachogramsInPreviousCalendarDay"];
  uint64_t v26 = [MEMORY[0x1E4F2B3B8] heartRateType];
  uint64_t v27 = [(HDHRAFibBurdenDailyAnalyticsEvent *)self _sedentaryAndBackgroundHeartRateContextPredicate];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_388;
  v30[3] = &unk_1E69B4638;
  v30[4] = self;
  __int16 v28 = [(HDHRAFibBurdenDailyAnalyticsEvent *)self _numberOfSamplesOfType:v26 dateInterval:v17 additionalPredicate:v27 bucketer:v30];

  [v23 setObject:v28 forKeyedSubscript:@"numberOfBackgroundHRSamplesInPreviousCalendarDay"];
}

id __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ((unint64_t)a2 >= 5)
    {
      if ((unint64_t)(a2 - 5) >= 6)
      {
        if ((unint64_t)(a2 - 11) >= 0xA)
        {
          if ((unint64_t)(a2 - 21) >= 0x14)
          {
            if (a2 <= 40)
            {
              _HKInitializeLogging();
              id v5 = HKHRAFibBurdenLogForCategory();
              if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
                __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_cold_1();
              }

              id v3 = (id)*MEMORY[0x1E4F29668];
            }
            else
            {
              id v3 = &unk_1F2B422C8;
            }
          }
          else
          {
            id v3 = &unk_1F2B422B0;
          }
        }
        else
        {
          id v3 = &unk_1F2B42298;
        }
      }
      else
      {
        id v3 = &unk_1F2B42280;
      }
    }
    else
    {
      id v3 = &unk_1F2B421A8;
    }
  }
  else
  {
    id v3 = &unk_1F2B42190;
  }
  return v3;
}

id __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_388(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ((unint64_t)a2 >= 5)
    {
      if ((unint64_t)(a2 - 5) >= 6)
      {
        if ((unint64_t)(a2 - 11) >= 0xA)
        {
          if ((unint64_t)(a2 - 21) >= 0x14)
          {
            if ((unint64_t)(a2 - 41) >= 0x3C)
            {
              if ((unint64_t)(a2 - 101) >= 0x3C)
              {
                if ((unint64_t)(a2 - 161) >= 0x3C)
                {
                  if ((unint64_t)(a2 - 221) >= 0x50)
                  {
                    if ((unint64_t)(a2 - 301) >= 0x64)
                    {
                      if (a2 <= 400)
                      {
                        _HKInitializeLogging();
                        id v5 = HKHRAFibBurdenLogForCategory();
                        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
                          __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_cold_1();
                        }

                        id v3 = (id)*MEMORY[0x1E4F29668];
                      }
                      else
                      {
                        id v3 = &unk_1F2B42340;
                      }
                    }
                    else
                    {
                      id v3 = &unk_1F2B42328;
                    }
                  }
                  else
                  {
                    id v3 = &unk_1F2B42310;
                  }
                }
                else
                {
                  id v3 = &unk_1F2B422F8;
                }
              }
              else
              {
                id v3 = &unk_1F2B422E0;
              }
            }
            else
            {
              id v3 = &unk_1F2B422C8;
            }
          }
          else
          {
            id v3 = &unk_1F2B422B0;
          }
        }
        else
        {
          id v3 = &unk_1F2B42298;
        }
      }
      else
      {
        id v3 = &unk_1F2B42280;
      }
    }
    else
    {
      id v3 = &unk_1F2B421A8;
    }
  }
  else
  {
    id v3 = &unk_1F2B42190;
  }
  return v3;
}

- (id)_numberOfSamplesOfType:(id)a3 dateInterval:(id)a4 additionalPredicate:(id)a5 bucketer:(id)a6
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  uint64_t v12 = HDSampleEntityPredicateForDateInterval();
  id v13 = (void *)v12;
  if (v10)
  {
    id v14 = (void *)MEMORY[0x1E4F65D08];
    v33[0] = v12;
    v33[1] = v10;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    uint64_t v16 = [v14 predicateMatchingAllPredicates:v15];

    id v13 = (void *)v16;
  }
  id v17 = (void *)MEMORY[0x1E4F65BE8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v26 = 0;
  uint64_t v19 = [v17 countOfSamplesWithType:v9 profile:WeakRetained matchingPredicate:v13 withError:&v26];
  id v20 = v26;

  if (v20)
  {
    _HKInitializeLogging();
    id v21 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v25 = [v9 identifier];
      *(_DWORD *)buf = 138543874;
      __int16 v28 = self;
      __int16 v29 = 2114;
      __int16 v30 = v25;
      __int16 v31 = 2114;
      id v32 = v20;
      _os_log_error_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving sample count of type %{public}@: %{public}@", buf, 0x20u);
    }
    id v22 = (id)*MEMORY[0x1E4F29668];
  }
  else
  {
    v11[2](v11, v19);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  return v23;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = [a4 environmentDataSource];
  id v7 = [v6 bucketedNumberOfWeeksSinceDate:v5];

  id v8 = (void *)*MEMORY[0x1E4F29668];
  if (v7) {
    id v8 = v7;
  }
  id v9 = v8;

  int64_t v10 = [v9 integerValue];
  return v10;
}

- (int64_t)_daysSinceDate:(id)a3 dataSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 environmentDataSource];
  id v8 = [v7 calendarCache];
  id v9 = [v8 currentCalendar];

  int64_t v10 = [v5 environmentDataSource];

  id v11 = [v10 currentDate];
  uint64_t v12 = [v9 components:16 fromDate:v6 toDate:v11 options:0];

  int64_t v13 = [v12 day];
  return v13;
}

- (int64_t)_daysSinceDate:(id)a3 maximum:(id)a4 dataSource:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  int64_t v10 = [v8 environmentDataSource];
  id v11 = [v10 calendarCache];
  uint64_t v12 = [v11 currentCalendar];

  int64_t v13 = [v8 environmentDataSource];

  id v14 = [v13 currentDate];
  id v15 = [v12 components:16 fromDate:v9 toDate:v14 options:0];

  int64_t v16 = [v15 day];
  if (v7)
  {
    uint64_t v17 = [v7 integerValue];
    if (v16 >= v17) {
      int64_t v16 = v17;
    }
  }

  return v16;
}

- (int64_t)_bucketedBurdenValueForSample:(id)a3
{
  id v3 = [a3 quantity];
  [v3 _value];
  uint64_t v5 = (uint64_t)(v4 * 100.0);

  if (v5 < 3) {
    return 2;
  }
  if ((unint64_t)v5 >= 0xA) {
    return 10 * (v5 / 0xAuLL);
  }
  return 3;
}

- (id)_sedentaryAndBackgroundHeartRateContextPredicate
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F2B42358, &unk_1F2B42370, &unk_1F2B42388, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = [WeakRetained metadataManager];
  id v6 = [v5 predicateWithMetadataKey:*MEMORY[0x1E4F2BB28] allowedValues:v3];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsAuthorizedProvider, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error when determining age, continuing daily analytics submission: %{public}@");
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_1D3AC6000, v0, v1, "[%{public}@] No error when fetching biological sex but also didn't get object", v2, v3, v4, v5, v6);
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error when determining biological sex, continuing daily analytics submission: %{public}@");
}

- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_2(&dword_1D3AC6000, v0, v1, "[%{public}@] No feature status provider could be found for %{public}@.");
}

- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_1D3AC6000, v0, v1, "[%{public}@] No usage requirements evaluation found.", v2, v3, v4, v5, v6);
}

- (void)_extractBurdenSamplePropertiesIntoPayload:dataSource:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error when retrieving burden sample: %{public}@");
}

- (void)_determineIfSamplesOverlappingSample:dataSource:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_1D3AC6000, v0, v1, "[%{public}@] When determining overlapping samples could no longer find previous sample.", v2, v3, v4, v5, v6);
}

- (void)_determineIfSamplesOverlappingSample:dataSource:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error when retrieving all previous week samples: %{public}@");
}

- (void)_extractWatchWearPropertiesIntoPayload:dataSource:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  __int16 v4 = 2114;
  uint64_t v5 = v0;
  __int16 v6 = 2114;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1D3AC6000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving sample count of type %{public}@: %{public}@", v3, 0x20u);
}

void __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_1D3AC6000, v0, v1, "[%{public}@] Unexpectedly got %{sensitive}ld tachograms");
}

@end