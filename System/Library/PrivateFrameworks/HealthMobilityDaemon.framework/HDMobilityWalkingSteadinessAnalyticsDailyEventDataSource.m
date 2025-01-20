@interface HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource
- (HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource)initWithProfile:(id)a3;
- (id)_categoryValuePredicateWithValues:(id)a3;
- (id)_countOfCategorySamplesInPastYearWithType:(id)a3 values:(id)a4 error:(id *)a5;
- (id)_countOfSamplesInPastYearWithType:(id)a3 valuePredicate:(id)a4 error:(id *)a5;
- (id)_countOfSamplesWithType:(id)a3 predicate:(id)a4 error:(id *)a5;
- (id)_hasLaunchedHealthAppInLastMonthWithError:(id *)a3;
- (id)_hasLaunchedHealthAppInLastTimeInterval:(double)a3 error:(id *)a4;
- (id)_hasLaunchedHealthAppInLastWeekWithError:(id *)a3;
- (id)_hasSampleWithType:(id)a3 error:(id *)a4;
- (id)_healthAppLastOpenedDateWithError:(id *)a3;
- (id)_numberOfDaysSinceLastCategorySampleWithSampleType:(id)a3 values:(id)a4 error:(id *)a5;
- (id)_numberOfDaysSinceLastSampleWithSampleType:(id)a3 predicate:(id)a4 error:(id *)a5;
- (id)_samplePredicateForPastYearFromDate:(id)a3;
- (id)activePairedWatchTypeWithError:(id *)a3;
- (id)ageWithError:(id *)a3;
- (id)areHealthNotificationsAuthorizedWithError:(id *)a3;
- (id)biologicalSexWithError:(id *)a3;
- (id)currentWalkingSteadinessClassificationWithError:(id *)a3;
- (id)daysSinceLastInitialNotificationWithError:(id *)a3;
- (id)daysSinceLastRepeatNotificationWithError:(id *)a3;
- (id)hasHeightWithError:(id *)a3;
- (id)hasWalkingSteadinessMeasurementsWithError:(id *)a3;
- (id)numberOfDaysSinceLastWalkingSteadinessMeasurementWithError:(id *)a3;
- (id)numberOfInitialNotificationsInPastYearWithError:(id *)a3;
- (id)numberOfLowNotificationsInPastYearWithError:(id *)a3;
- (id)numberOfRepeatLowNotificationsInPastYearWithError:(id *)a3;
- (id)numberOfRepeatVeryLowNotificationsInPastYearWithError:(id *)a3;
- (id)numberOfVeryLowNotificationsInPastYearWithError:(id *)a3;
- (id)previousWalkingSteadinessClassificationWithError:(id *)a3;
- (id)walkingSteadinessNotificationsEnabledWithError:(id *)a3;
@end

@implementation HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource

- (HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource;
  v5 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)activePairedWatchTypeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F452B0], "activeWatchProductType", a3);
}

- (id)ageWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [MEMORY[0x263EFF910] date];
  v6 = +[HDMobilityAnalyticsUtilities ageWithProfile:WeakRetained date:v5 error:a3];

  return v6;
}

- (id)biologicalSexWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = +[HDMobilityAnalyticsUtilities biologicalSexWithProfile:WeakRetained error:a3];

  return v5;
}

- (id)hasHeightWithError:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x263F0A658]);
  v6 = (void *)[v5 initWithIdentifier:*MEMORY[0x263F09E50]];
  v7 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _hasSampleWithType:v6 error:a3];

  return v7;
}

- (id)numberOfDaysSinceLastWalkingSteadinessMeasurementWithError:(id *)a3
{
  id v5 = HKMobilityWalkingSteadinessType();
  id v10 = 0;
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _numberOfDaysSinceLastSampleWithSampleType:v5 predicate:0 error:&v10];
  id v7 = v10;

  if (v6)
  {
    if ([v6 integerValue] <= 85) {
      id v8 = v6;
    }
    else {
      id v8 = &unk_26D3F9780;
    }
  }
  else if (v7)
  {
    if (a3)
    {
      id v8 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v8 = 0;
    }
  }
  else
  {
    id v8 = &unk_26D3F9768;
  }

  return v8;
}

- (id)numberOfLowNotificationsInPastYearWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfCategorySamplesInPastYearWithType:v5 values:&unk_26D3F9810 error:a3];

  return v6;
}

- (id)numberOfRepeatLowNotificationsInPastYearWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfCategorySamplesInPastYearWithType:v5 values:&unk_26D3F9828 error:a3];

  return v6;
}

- (id)numberOfVeryLowNotificationsInPastYearWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfCategorySamplesInPastYearWithType:v5 values:&unk_26D3F9840 error:a3];

  return v6;
}

- (id)numberOfRepeatVeryLowNotificationsInPastYearWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfCategorySamplesInPastYearWithType:v5 values:&unk_26D3F9858 error:a3];

  return v6;
}

- (id)numberOfInitialNotificationsInPastYearWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfCategorySamplesInPastYearWithType:v5 values:&unk_26D3F9870 error:a3];

  return v6;
}

- (id)daysSinceLastRepeatNotificationWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _numberOfDaysSinceLastCategorySampleWithSampleType:v5 values:&unk_26D3F9888 error:a3];

  return v6;
}

- (id)daysSinceLastInitialNotificationWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09248]];
  v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _numberOfDaysSinceLastCategorySampleWithSampleType:v5 values:&unk_26D3F98A0 error:a3];

  return v6;
}

- (id)currentWalkingSteadinessClassificationWithError:(id *)a3
{
  id v5 = -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource hasWalkingSteadinessMeasurementsWithError:](self, "hasWalkingSteadinessMeasurementsWithError:");
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    v14 = 0;
    goto LABEL_17;
  }
  id v7 = HKMobilityWalkingSteadinessType();
  id v8 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v20 = 0;
  id v10 = [v8 mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v20];
  id v11 = v20;

  if (!v10)
  {
    v15 = (NSError *)v11;
    v13 = v15;
    if (v15)
    {
      if (a3)
      {
        v13 = v15;
        v14 = 0;
        *a3 = v13;
        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  HKAppleWalkingSteadinessClassification classificationOut = 0;
  v12 = [v10 quantity];
  errorOut = 0;
  HKAppleWalkingSteadinessClassificationForQuantity(v12, &classificationOut, &errorOut);
  v13 = errorOut;

  if (!classificationOut)
  {
    v16 = v13;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_15;
  }
  v14 = objc_msgSend(MEMORY[0x263F452D0], "payloadStringForWalkingSteadinessClassification:");
LABEL_16:

LABEL_17:
  return v14;
}

- (id)previousWalkingSteadinessClassificationWithError:(id *)a3
{
  id v5 = -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource hasWalkingSteadinessMeasurementsWithError:](self, "hasWalkingSteadinessMeasurementsWithError:");
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    v21 = 0;
    goto LABEL_24;
  }
  id v7 = HKMobilityWalkingSteadinessType();
  id v8 = (void *)MEMORY[0x263F43318];
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v29 = 0;
  id v11 = [v8 mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v29];
  id v12 = v29;

  if (v11)
  {
    v13 = [v11 startDate];
    v14 = HDSampleEntityPredicateForStartDate();

    v15 = (void *)MEMORY[0x263F43318];
    id v16 = objc_loadWeakRetained((id *)p_profile);
    id v28 = 0;
    v17 = [v15 mostRecentSampleWithType:v7 profile:v16 encodingOptions:0 predicate:v14 anchor:0 error:&v28];
    id v18 = v28;

    if (v17)
    {
      HKAppleWalkingSteadinessClassification classificationOut = 0;
      v19 = [v17 quantity];
      v26 = 0;
      HKAppleWalkingSteadinessClassificationForQuantity(v19, &classificationOut, &v26);
      id v20 = v26;

      if (classificationOut)
      {
        v21 = objc_msgSend(MEMORY[0x263F452D0], "payloadStringForWalkingSteadinessClassification:");
LABEL_22:

        goto LABEL_23;
      }
      v24 = v20;
      if (v24)
      {
        if (a3) {
          *a3 = v24;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      v23 = (NSError *)v18;
      id v20 = v23;
      if (v23)
      {
        if (a3)
        {
          id v20 = v23;
          v21 = 0;
          *a3 = v20;
          goto LABEL_22;
        }
        _HKLogDroppedError();
      }
    }
    v21 = 0;
    goto LABEL_22;
  }
  id v22 = v12;
  id v18 = v22;
  if (!v22) {
    goto LABEL_17;
  }
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_17:
    v21 = 0;
    goto LABEL_23;
  }
  id v18 = v22;
  v21 = 0;
  *a3 = v18;
LABEL_23:

LABEL_24:
  return v21;
}

- (id)hasWalkingSteadinessMeasurementsWithError:(id *)a3
{
  id v5 = HKMobilityWalkingSteadinessType();
  int v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _hasSampleWithType:v5 error:a3];

  return v6;
}

- (id)walkingSteadinessNotificationsEnabledWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v6 = [WeakRetained featureSettingsManager];
  id v7 = [v6 featureSettingsForFeatureIdentifier:*MEMORY[0x263F09810] error:a3];

  if (v7)
  {
    id v8 = [v7 numberForKey:*MEMORY[0x263F09820]];
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)(uint64_t)self walkingSteadinessNotificationsEnabledWithError:v9];
    }
    id v8 = 0;
  }

  return v8;
}

- (id)areHealthNotificationsAuthorizedWithError:(id *)a3
{
  v3 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained notificationManager];
  int v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "areHealthNotificationsAuthorized"));

  return v6;
}

- (id)_samplePredicateForPastYearFromDate:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  int v6 = [v5 dateByAddingUnit:4 value:-1 toDate:v4 options:0];
  id v7 = (void *)MEMORY[0x263F434A8];
  id v8 = HDSampleEntityPredicateForStartDate();
  v13[0] = v8;
  v9 = HDSampleEntityPredicateForStartDate();

  v13[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  id v11 = [v7 predicateMatchingAllPredicates:v10];

  return v11;
}

- (id)_categoryValuePredicateWithValues:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_0);
    id v5 = [MEMORY[0x263F434A8] predicateMatchingAnyPredicates:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __94__HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource__categoryValuePredicateWithValues___block_invoke()
{
  return MEMORY[0x270F31978](1);
}

- (id)_countOfCategorySamplesInPastYearWithType:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _categoryValuePredicateWithValues:a4];
  id v10 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfSamplesInPastYearWithType:v8 valuePredicate:v9 error:a5];

  return v10;
}

- (id)_countOfSamplesInPastYearWithType:(id)a3 valuePredicate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = a3;
  id v11 = (void *)[[v9 alloc] initWithCapacity:2];
  id v12 = [MEMORY[0x263EFF910] date];
  v13 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _samplePredicateForPastYearFromDate:v12];
  [v11 addObject:v13];

  if (v8) {
    [v11 addObject:v8];
  }
  v14 = [MEMORY[0x263F434A8] predicateMatchingAllPredicates:v11];
  v15 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _countOfSamplesWithType:v10 predicate:v14 error:a5];

  return v15;
}

- (id)_countOfSamplesWithType:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F43318];
  p_profile = &self->_profile;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v12 = [v7 countOfSamplesWithType:v10 profile:WeakRetained matchingPredicate:v9 withError:a5];

  v13 = NSNumber;
  return (id)[v13 numberWithInteger:v12];
}

- (id)_numberOfDaysSinceLastSampleWithSampleType:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F43318];
  p_profile = &self->_profile;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v20 = 0;
  uint64_t v12 = [v7 mostRecentSampleWithType:v10 profile:WeakRetained encodingOptions:0 predicate:v9 anchor:0 error:&v20];

  id v13 = v20;
  if (v12)
  {
    if ([v12 hasUndeterminedDuration]) {
      [v12 startDate];
    }
    else {
    id v15 = [v12 endDate];
    }
    v17 = (void *)MEMORY[0x263F452B0];
    id v18 = [MEMORY[0x263EFF910] date];
    id v16 = [v17 numberOfDaysBetweenStartDate:v15 endDate:v18];

    goto LABEL_11;
  }
  id v14 = v13;
  id v15 = v14;
  if (v14)
  {
    if (a5)
    {
      id v15 = v14;
      id v16 = 0;
      *a5 = v15;
      goto LABEL_11;
    }
    _HKLogDroppedError();
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)_numberOfDaysSinceLastCategorySampleWithSampleType:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _categoryValuePredicateWithValues:a4];
  id v10 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _numberOfDaysSinceLastSampleWithSampleType:v8 predicate:v9 error:a5];

  return v10;
}

- (id)_hasSampleWithType:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v5 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _numberOfDaysSinceLastSampleWithSampleType:a3 predicate:0 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x263EFFA88];
  }
  else if (v6)
  {
    if (a4)
    {
      id v8 = 0;
      *a4 = v6;
    }
    else
    {
      _HKLogDroppedError();
      id v8 = 0;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA80];
  }

  return v8;
}

- (id)_hasLaunchedHealthAppInLastWeekWithError:(id *)a3
{
  return [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _hasLaunchedHealthAppInLastTimeInterval:a3 error:604800.0];
}

- (id)_hasLaunchedHealthAppInLastMonthWithError:(id *)a3
{
  return [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _hasLaunchedHealthAppInLastTimeInterval:a3 error:2592000.0];
}

- (id)_hasLaunchedHealthAppInLastTimeInterval:(double)a3 error:(id *)a4
{
  id v16 = 0;
  id v6 = [(HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *)self _healthAppLastOpenedDateWithError:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceDate:v6];
    double v11 = v10;

    BOOL v12 = v11 >= 0.0 && v11 < a3;
    id v13 = (void *)MEMORY[0x263EFFA80];
    if (v12) {
      id v13 = (void *)MEMORY[0x263EFFA88];
    }
    id v14 = v13;
  }
  else if (v7)
  {
    if (a4)
    {
      id v14 = 0;
      *a4 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v14 = 0;
    }
  }
  else
  {
    id v14 = (id)MEMORY[0x263EFFA80];
  }

  return v14;
}

- (id)_healthAppLastOpenedDateWithError:(id *)a3
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F0ACE8]];
  id v5 = objc_msgSend(v4, "hk_dateForKey:", *MEMORY[0x263F0ACF0]);

  return v5;
}

- (void).cxx_destruct
{
}

- (void)walkingSteadinessNotificationsEnabledWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_221A40000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to retrieve feature settings due to error %{public}@", (uint8_t *)&v4, 0x16u);
}

@end