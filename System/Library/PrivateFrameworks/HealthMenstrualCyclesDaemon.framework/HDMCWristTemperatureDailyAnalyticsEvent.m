@interface HDMCWristTemperatureDailyAnalyticsEvent
- (BOOL)_isDeviceWristTemperatureCompatible:(id)a3;
- (BOOL)isEventSubmissionIHAGated;
- (HDMCWristTemperatureDailyAnalyticsEvent)initWithProfile:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 sleepStore:(id)a6 wristDetectionSettingManager:(id)a7 privacyDefaults:(id)a8;
- (HDMCWristTemperatureDailyAnalyticsEvent)initWithProfile:(id)a3 analysisManager:(id)a4 sleepStore:(id)a5;
- (NSString)eventName;
- (id)_IHAGatedDemographicsFieldsWithDataSource:(id)a3;
- (id)_IHAGatedLastSleepDayWristTemperatureFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_IHAGatedSleepingWristTemperatureStatisticsFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_allNoiseFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_areBloodOxygenMeasurementsEnabledWithDataSource:(id)a3;
- (id)_areRespiratoryRateMeasurementsEnabledWithDataSource:(id)a3;
- (id)_celsiusValueFromQuantity:(id)a3 scale:(signed __int16)a4;
- (id)_changeInCelsiusStringFromQuantity:(id)a3 scale:(signed __int16)a4;
- (id)_countOfLast30DaysWithSleepSamplesWithCurrentDate:(id)a3 calendarCache:(id)a4;
- (id)_countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_countOfUniqueSourcesOfWristTemperatureSamplesFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_daysWithStandHoursInLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_discreteRelativeSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5;
- (id)_discreteSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5;
- (id)_dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5;
- (id)_dominantSleepingWristTemperatureSourceOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5;
- (id)_dominantWatchLast30DaysFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_featureStatusForFeatureIdentifier:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (id)_firstPartySleepSamplesFromLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5;
- (id)_hasCycleFactorsActive;
- (id)_hoursAsleepDuringLastSleepDayWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_isAFibHistoryEnabledWithDataSource:(id)a3;
- (id)_isCycleTrackingWristTemperatureInputEnabledWithDataSource:(id)a3;
- (id)_isHeartRateEnabledInPrivacy;
- (id)_isIRNEnabledWithDataSource:(id)a3;
- (id)_isWristDetectionEnabled;
- (id)_isWristTemperatureEnabledWithDataSource:(id)a3;
- (id)_lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_lastSleepDayHasSleepDataWithCurrentDate:(id)a3 calendarCache:(id)a4;
- (id)_lastSleepDayHasWristTemperatureDataWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_lastSleepDayRelativeSleepingWristTemperatureWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_medianSleepingWristTemperatureLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5;
- (id)_noiseMetricsFromSleepingWristTemperatureSamples:(id)a3 gregorianCalendar:(id)a4;
- (id)_pairedWristTemperatureCompatibleDevice;
- (id)_predicateForAppleWatchSamplesInLast30SleepDaysRelativeToCurrentDate:(id)a3 gregorianCalendar:(id)a4 sampleType:(id)a5;
- (id)_predicateForAppleWatchSamplesInLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sampleType:(id)a6;
- (id)_predicateForAppleWatchSamplesInLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sampleType:(id)a6 sourceEntityPredicate:(id)a7;
- (id)_preferredSleepingWristTemperatureUnit;
- (id)_roundDouble:(double)a3 scale:(signed __int16)a4;
- (id)_sampleStandardDeviationOfValues:(id)a3;
- (id)_samplesByMorningIndex:(id)a3 gregorianCalendar:(id)a4;
- (id)_sleepFields;
- (id)_sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)_sleepingWristTemperatureSampleCountBySourceOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5;
- (id)_sleepingWristTemperatureSamplesFromLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sourceEntityPredicate:(id)a6;
- (id)_weeksSinceDeliveryWithDataSource:(id)a3;
- (id)_wristTemperatureCompatibleDeviceFields;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4;
- (int64_t)_countOfUniqueSerialNumbersFromSamples:(id)a3;
- (int64_t)_countOfUniqueSourcesFromSamples:(id)a3;
@end

@implementation HDMCWristTemperatureDailyAnalyticsEvent

- (HDMCWristTemperatureDailyAnalyticsEvent)initWithProfile:(id)a3 analysisManager:(id)a4 sleepStore:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F451E0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithObservationEnabled:0];
  v13 = [v11 wristDetectionSettingManager];
  id v14 = objc_alloc(MEMORY[0x263EFFA40]);
  v15 = (void *)[v14 initWithSuiteName:*MEMORY[0x263F0ADC0]];
  v16 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self initWithProfile:v11 analysisManager:v10 settingsManager:v12 sleepStore:v9 wristDetectionSettingManager:v13 privacyDefaults:v15];

  return v16;
}

- (HDMCWristTemperatureDailyAnalyticsEvent)initWithProfile:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 sleepStore:(id)a6 wristDetectionSettingManager:(id)a7 privacyDefaults:(id)a8
{
  id v14 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HDMCWristTemperatureDailyAnalyticsEvent;
  v18 = [(HDMCWristTemperatureDailyAnalyticsEvent *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, v14);
    objc_storeStrong((id *)&v19->_analysisManager, a4);
    objc_storeStrong((id *)&v19->_settingsManager, a5);
    objc_storeStrong((id *)&v19->_sleepStore, a6);
    objc_storeStrong((id *)&v19->_wristDetectionSettingManager, a7);
    objc_storeStrong((id *)&v19->_privacyDefaults, a8);
  }

  return v19;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.wristtemperature.daily";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 environmentDataSource];
  v7 = [v6 currentDate];

  v8 = [v5 environmentDataSource];
  id v9 = [v8 calendarCache];
  id v10 = [v9 currentCalendar];

  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  v12 = NSNumber;
  v13 = [v5 environmentDataSource];
  id v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isImproveHealthAndActivityEnabled"));
  [v11 setObject:v14 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  [v11 setObject:&unk_26D8EE878 forKeyedSubscript:@"algorithmVersion"];
  id v15 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isHeartRateEnabledInPrivacy];
  [v11 setObject:v15 forKeyedSubscript:@"isHeartRateEnabled"];

  id v16 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _areRespiratoryRateMeasurementsEnabledWithDataSource:v5];
  [v11 setObject:v16 forKeyedSubscript:@"isRespiratoryRateEnabled"];

  id v17 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _areBloodOxygenMeasurementsEnabledWithDataSource:v5];
  [v11 setObject:v17 forKeyedSubscript:@"isBloodOxygenEnabled"];

  v18 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isCycleTrackingWristTemperatureInputEnabledWithDataSource:v5];
  [v11 setObject:v18 forKeyedSubscript:@"isCTWristTempInputEnabled"];

  v19 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isWristTemperatureEnabledWithDataSource:v5];
  [v11 setObject:v19 forKeyedSubscript:@"isWristTempEnabled"];

  v20 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isWristDetectionEnabled];
  [v11 setObject:v20 forKeyedSubscript:@"isWristDetectionEnabled"];

  id v21 = [v5 environmentDataSource];
  id v22 = [v21 calendarCache];
  objc_super v23 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _lastSleepDayHasSleepDataWithCurrentDate:v7 calendarCache:v22];
  [v11 setObject:v23 forKeyedSubscript:@"hasWatchSleepPastDay"];

  v24 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v24 forKeyedSubscript:@"internalOnly_sleepPastDayFromCompatibleProductType"];

  v25 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _lastSleepDayHasWristTemperatureDataWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v25 forKeyedSubscript:@"hasTempPastDay"];

  v26 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _weeksSinceDeliveryWithDataSource:v5];
  [v11 setObject:v26 forKeyedSubscript:@"weeksSinceOnboarded"];

  v27 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _preferredSleepingWristTemperatureUnit];
  [v11 setObject:v27 forKeyedSubscript:@"tempDisplayUnit"];

  v28 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v28 forKeyedSubscript:@"numDaysTempPast30Days"];

  v29 = [v5 environmentDataSource];
  v30 = [v29 calendarCache];
  v31 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _countOfLast30DaysWithSleepSamplesWithCurrentDate:v7 calendarCache:v30];
  [v11 setObject:v31 forKeyedSubscript:@"numDaysWatchSleepPast30Days"];

  v32 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _daysWithStandHoursInLast30DaysWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v32 forKeyedSubscript:@"numDaysWatchWornPast30Days"];

  v33 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v33 forKeyedSubscript:@"numDaysTempCalcPast30Days"];

  v34 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _wristTemperatureCompatibleDeviceFields];
  [v11 addEntriesFromDictionary:v34];

  v35 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _dominantWatchLast30DaysFieldsWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 addEntriesFromDictionary:v35];

  v36 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _countOfUniqueSourcesOfWristTemperatureSamplesFieldsWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 addEntriesFromDictionary:v36];

  v37 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepFields];
  [v11 addEntriesFromDictionary:v37];

  v38 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _allNoiseFieldsWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 addEntriesFromDictionary:v38];

  v39 = [v5 environmentDataSource];

  LOBYTE(v5) = [v39 isImproveHealthAndActivityEnabled];
  if ((v5 & 1) == 0)
  {
    [v11 setObject:0 forKeyedSubscript:@"stdDevPast30Days"];
    [v11 setObject:0 forKeyedSubscript:@"stdDevFilteredPast30Days"];
  }
  v40 = (void *)[v11 copy];

  return v40;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 environmentDataSource];
  v7 = [v6 currentDate];

  v8 = [v5 environmentDataSource];
  id v9 = [v8 calendarCache];
  id v10 = [v9 currentCalendar];

  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  v12 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _hasCycleFactorsActive];
  [v11 setObject:v12 forKeyedSubscript:@"hasCycleFactorsActive"];

  v13 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isIRNEnabledWithDataSource:v5];
  [v11 setObject:v13 forKeyedSubscript:@"isIRNEnabled"];

  id v14 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isAFibHistoryEnabledWithDataSource:v5];
  [v11 setObject:v14 forKeyedSubscript:@"isAFibHistoryEnabled"];

  id v15 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _hoursAsleepDuringLastSleepDayWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v15 forKeyedSubscript:@"watchSleepHoursPastDay"];

  id v16 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _lastSleepDayRelativeSleepingWristTemperatureWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 setObject:v16 forKeyedSubscript:@"tempDisplayedPastDay"];

  id v17 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _IHAGatedDemographicsFieldsWithDataSource:v5];

  [v11 addEntriesFromDictionary:v17];
  v18 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _IHAGatedSleepingWristTemperatureStatisticsFieldsWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 addEntriesFromDictionary:v18];

  v19 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _IHAGatedLastSleepDayWristTemperatureFieldsWithCurrentDate:v7 gregorianCalendar:v10];
  [v11 addEntriesFromDictionary:v19];

  v20 = (void *)[v11 copy];
  return v20;
}

- (id)_IHAGatedDemographicsFieldsWithDataSource:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [v3 healthDataSource];
  v6 = [v5 biologicalSexWithError:0];

  if (v6)
  {
    v7 = HKAnalyticsPropertyValueForBiologicalSex();
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F091D8]];
  }
  else
  {
    [v4 setObject:*MEMORY[0x263F09208] forKeyedSubscript:*MEMORY[0x263F091D8]];
  }
  v8 = [v3 healthDataSource];
  id v9 = [v3 environmentDataSource];
  id v10 = [v9 currentDate];
  id v11 = [v8 ageWithCurrentDate:v10 error:0];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F091C8]];

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)_wristTemperatureCompatibleDeviceFields
{
  v2 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _pairedWristTemperatureCompatibleDevice];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = [v2 valueForProperty:*MEMORY[0x263F57628]];
    [v3 setObject:v4 forKeyedSubscript:@"compatibleWatchProductType"];

    id v5 = [v2 valueForProperty:*MEMORY[0x263F57658]];
    [v3 setObject:v5 forKeyedSubscript:@"compatiblePairedWatchBuild"];

    v6 = [v2 valueForProperty:*MEMORY[0x263F57570]];
    [v3 setObject:v6 forKeyedSubscript:@"compatibleWatchHousingColorAndMaterial"];

    v7 = (void *)[v3 copy];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA78];
  }

  return v7;
}

- (id)_pairedWristTemperatureCompatibleDevice
{
  id v3 = [MEMORY[0x263F57730] sharedInstance];
  v4 = [v3 getActivePairedDevice];
  if (v4
    && [(HDMCWristTemperatureDailyAnalyticsEvent *)self _isDeviceWristTemperatureCompatible:v4])
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [v3 getPairedDevices];
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x263EFFA68];
    if (v6) {
      v8 = (void *)v6;
    }
    id v9 = v8;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__HDMCWristTemperatureDailyAnalyticsEvent__pairedWristTemperatureCompatibleDevice__block_invoke;
    v11[3] = &unk_264750B50;
    v11[4] = self;
    objc_msgSend(v9, "hk_firstObjectPassingTest:", v11);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t __82__HDMCWristTemperatureDailyAnalyticsEvent__pairedWristTemperatureCompatibleDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isDeviceWristTemperatureCompatible:a2];
}

- (BOOL)_isDeviceWristTemperatureCompatible:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"CBC78224-8F5E-4D43-8666-69ADBE2A6277"];
  char v6 = [v4 supportsCapability:v5];

  return v6;
}

- (id)_dominantWatchLast30DaysFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v5 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _dominantSleepingWristTemperatureSourceOverLastNDays:30 currentDate:a3 gregorianCalendar:a4];
  char v6 = [MEMORY[0x263EFF9A0] dictionary];
  v7 = [v5 _productType];
  [v6 setObject:v7 forKeyedSubscript:@"dominantWatchPast30DaysProductType"];

  v8 = [MEMORY[0x263F0A980] sharedBehavior];
  int v9 = [v8 isAppleInternalInstall];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x263F43218];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v12 = [v10 _wristTemperatureIdentifierDomainWithProfile:WeakRetained];

    v13 = [v12 _wristTemperatureSerialNumbersBySourceIdentifier];
    id v14 = [v5 bundleIdentifier];
    id v15 = [v13 objectForKeyedSubscript:v14];

    [v6 setObject:v15 forKeyedSubscript:@"internalOnly_dominantWatchPast30DaysSerialNumber"];
  }
  id v16 = (void *)[v6 copy];

  return v16;
}

- (id)_isHeartRateEnabledInPrivacy
{
  v2 = [(NSUserDefaults *)self->_privacyDefaults objectForKey:*MEMORY[0x263F0ADD8]];
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA88];
  }
  id v4 = v2;

  return v4;
}

- (id)_isWristDetectionEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [(HKWristDetectionSettingManager *)self->_wristDetectionSettingManager isWristDetectEnabled];
  return (id)[v2 numberWithBool:v3];
}

- (id)_isWristTemperatureEnabledWithDataSource:(id)a3
{
  uint64_t v3 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F097F8] dataSource:a3 error:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F091A8];
  }
  v8 = v7;

  return v8;
}

- (id)_isCycleTrackingWristTemperatureInputEnabledWithDataSource:(id)a3
{
  uint64_t v3 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F097B0] dataSource:a3 error:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F091A8];
  }
  v8 = v7;

  return v8;
}

- (id)_isIRNEnabledWithDataSource:(id)a3
{
  uint64_t v3 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F09778] dataSource:a3 error:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x263F09600];
    int v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int v7 = [v6 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:v5];
      int v9 = [v8 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F096A0]];
    }
    else
    {
      int v9 = 0;
    }
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = (id)*MEMORY[0x263F091A8];
  }
  id v11 = v10;

  return v11;
}

- (id)_isAFibHistoryEnabledWithDataSource:(id)a3
{
  uint64_t v3 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F09728] dataSource:a3 error:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F091A8];
  }
  v8 = v7;

  return v8;
}

- (id)_areRespiratoryRateMeasurementsEnabledWithDataSource:(id)a3
{
  uint64_t v3 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F097C8] dataSource:a3 error:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F091A8];
  }
  v8 = v7;

  return v8;
}

- (id)_areBloodOxygenMeasurementsEnabledWithDataSource:(id)a3
{
  uint64_t v3 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F097B8] dataSource:a3 error:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09630]];

    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F091A8];
  }
  v8 = v7;

  return v8;
}

- (id)_sleepFields
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v21 = @"isSleepFocusSetUp";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HKSPSleepStore hasSleepFocusMode](self->_sleepStore, "hasSleepFocusMode"));
  v22[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  int v6 = [v3 dictionaryWithDictionary:v5];

  id v7 = [(HKSPSleepStore *)self->_sleepStore currentSleepSettingsWithError:0];
  v8 = v7;
  if (v7)
  {
    int v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "sleepTracking"));
    [v6 setObject:v9 forKeyedSubscript:@"isWatchSleepTrackingEnabled"];

    id v10 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(v8, "sleepModeOptions") >> 14) & 1);
    [v6 setObject:v10 forKeyedSubscript:@"isSleepScreenEnabled"];

    id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "scheduledSleepMode"));
    [v6 setObject:v11 forKeyedSubscript:@"isAutomatedSleepFocusEnabled"];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F091A8];
    [v6 setObject:*MEMORY[0x263F091A8] forKeyedSubscript:@"isWatchSleepTrackingEnabled"];
    [v6 setObject:v12 forKeyedSubscript:@"isSleepScreenEnabled"];
    [v6 setObject:v12 forKeyedSubscript:@"isAutomatedSleepFocusEnabled"];
  }
  v13 = [(HKSPSleepStore *)self->_sleepStore currentSleepScheduleWithError:0];
  id v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isEnabled"));
    [v6 setObject:v15 forKeyedSubscript:@"isSleepScheduleEnabled"];
  }
  else
  {
    [v6 setObject:*MEMORY[0x263F091A8] forKeyedSubscript:@"isSleepScheduleEnabled"];
  }
  id v16 = [(HKSPSleepStore *)self->_sleepStore currentSleepEventRecordWithError:0];
  id v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isAnySleepTrackingOnboardingCompleted"));
    [v6 setObject:v18 forKeyedSubscript:@"isSleepOnWatchOnboarded"];
  }
  else
  {
    [v6 setObject:*MEMORY[0x263F091A8] forKeyedSubscript:@"isSleepOnWatchOnboarded"];
  }
  v19 = (void *)[v6 copy];

  return v19;
}

- (id)_IHAGatedSleepingWristTemperatureStatisticsFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:30 currentDate:v6 gregorianCalendar:v7];
  if (v8)
  {
    int v9 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _discreteSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:v6 gregorianCalendar:v7 dominantWatchSourceEntityPredicate:v8];
    id v10 = (void *)[v9 mutableCopy];

    id v11 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _discreteRelativeSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:v6 gregorianCalendar:v7 dominantWatchSourceEntityPredicate:v8];
    [v10 addEntriesFromDictionary:v11];

    uint64_t v12 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _medianSleepingWristTemperatureLast30DaysWithCurrentDate:v6 gregorianCalendar:v7 dominantWatchSourceEntityPredicate:v8];
    v13 = [v12 stringValue];
    [v10 setObject:v13 forKeyedSubscript:@"aggTempPast30DaysMedian"];

    id v14 = (void *)[v10 copy];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263EFFA78];
  }

  return v14;
}

- (id)_discreteSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5
{
  v35[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _HKMCAppleSleepingWristTemperatureType();
  uint64_t v12 = [MEMORY[0x263F43380] calculatorForQuantityType:v11 intervalCollection:0 options:14 mergeStrategy:1];
  v13 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:30 currentDate:v10 gregorianCalendar:v9 sampleType:v11 sourceEntityPredicate:v8];

  id v14 = objc_alloc(MEMORY[0x263F43390]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = (void *)[v14 initForProfile:WeakRetained quantityType:v11 predicate:v13 restrictedSourceEntities:0];

  [v12 setDataSource:v16];
  id v33 = 0;
  int v17 = [v12 queryForInitialStatisticsWithError:&v33];
  id v18 = v33;
  v19 = [v12 currentStatistics];
  v20 = v19;
  id v21 = (void *)MEMORY[0x263EFFA78];
  if (v17 && v19 && [v19 dataCount])
  {
    v34[0] = @"aggTempPast30DaysMin";
    v32 = [v20 minimumQuantity];
    v31 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _celsiusValueFromQuantity:v32 scale:1];
    v30 = [v31 stringValue];
    v35[0] = v30;
    v34[1] = @"aggTempPast30DaysMax";
    v29 = [v20 maximumQuantity];
    v28 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _celsiusValueFromQuantity:v29 scale:1];
    v27 = [v28 stringValue];
    v35[1] = v27;
    v34[2] = @"aggTempPast30DaysMean";
    id v22 = [v20 averageQuantity];
    objc_super v23 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _celsiusValueFromQuantity:v22 scale:1];
    [v23 stringValue];
    v25 = id v24 = v18;
    v35[2] = v25;
    id v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];

    id v18 = v24;
  }

  return v21;
}

- (id)_discreteRelativeSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5
{
  v30[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _HKMCAppleSleepingWristTemperatureType();
  uint64_t v12 = [MEMORY[0x263F43380] calculatorForQuantityType:v11 intervalCollection:0 options:_HKStatisticsOptionBaselineRelativeQuantities() | 0xE mergeStrategy:1];
  v13 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:30 currentDate:v10 gregorianCalendar:v9 sampleType:v11 sourceEntityPredicate:v8];

  id v14 = objc_alloc(MEMORY[0x263F433A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = [v11 _rollingBaselineConfiguration];
  int v17 = (void *)[v14 initForProfile:WeakRetained quantityType:v11 predicate:v13 restrictedSourceEntities:0 configuration:v16 currentDate:v10];

  [v12 setDataSource:v17];
  id v28 = 0;
  int v18 = [v12 queryForInitialStatisticsWithError:&v28];
  id v19 = v28;
  v20 = [v12 currentStatistics];
  id v21 = v20;
  id v22 = (void *)MEMORY[0x263EFFA78];
  if (v18 && v20 && [v20 dataCount])
  {
    v29[0] = @"aggTempDisplayedPast30DaysMin";
    v27 = [v21 minimumQuantity];
    objc_super v23 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _changeInCelsiusStringFromQuantity:v27 scale:1];
    v29[1] = @"aggTempDisplayedPast30DaysMax";
    v30[0] = v23;
    id v24 = [v21 maximumQuantity];
    v25 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _changeInCelsiusStringFromQuantity:v24 scale:1];
    v30[1] = v25;
    id v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  }
  return v22;
}

- (id)_medianSleepingWristTemperatureLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _HKMCAppleSleepingWristTemperatureType();
  uint64_t v12 = [MEMORY[0x263F43380] calculatorForQuantityType:v11 intervalCollection:0 options:_HKStatisticsOptionPercentile() mergeStrategy:1];
  v13 = (void *)[objc_alloc(MEMORY[0x263F433B0]) initWithPercentile:&unk_26D8EEAE0];
  [v12 setStatisticsConfiguration:v13];

  id v14 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:30 currentDate:v10 gregorianCalendar:v9 sampleType:v11 sourceEntityPredicate:v8];

  id v15 = objc_alloc(MEMORY[0x263F43390]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v17 = (void *)[v15 initForProfile:WeakRetained quantityType:v11 predicate:v14 restrictedSourceEntities:0];

  [v12 setDataSource:v17];
  uint64_t v24 = 0;
  int v18 = [v12 queryForInitialStatisticsWithError:&v24];
  id v19 = [v12 currentStatistics];
  v20 = v19;
  id v21 = 0;
  if (v18 && v19)
  {
    if ([v19 dataCount])
    {
      id v22 = [v20 percentileQuantity];
      id v21 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _celsiusValueFromQuantity:v22 scale:1];
    }
    else
    {
      id v21 = 0;
    }
  }

  return v21;
}

- (id)_sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v4 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSampleCountBySourceOverLastNDays:30 currentDate:a3 gregorianCalendar:a4];
  uint64_t v5 = [v4 allValues];
  id v6 = objc_msgSend(v5, "hk_firstObjectWithMaximumValueUsingEvaluationBlock:", &__block_literal_global_2);

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &unk_26D8EE890;
  }
  id v8 = v7;

  return v8;
}

uint64_t __140__HDMCWristTemperatureDailyAnalyticsEvent__sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 doubleValue];
}

- (id)_countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _HKMCAppleSleepingWristTemperatureType();
  id v9 = objc_msgSend(v6, "hk_sleepDayStartWithCalendar:", v7);
  id v10 = [v7 dateByAddingUnit:16 value:-30 toDate:v9 options:0];
  id v11 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v11 setCalendar:v7];
  [v11 setDay:1];
  v35 = (void *)[objc_alloc(MEMORY[0x263F0A9A0]) initWithAnchorDate:v10 intervalComponents:v11];
  uint64_t v12 = [MEMORY[0x263F43380] calculatorForQuantityType:v8 intervalCollection:v35 options:_HKStatisticsOptionPresence() mergeStrategy:1];
  uint64_t v13 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLast30SleepDaysRelativeToCurrentDate:v6 gregorianCalendar:v7 sampleType:v8];
  id v14 = objc_alloc(MEMORY[0x263F43390]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v34 = (void *)v13;
  uint64_t v16 = [v14 initForProfile:WeakRetained quantityType:v8 predicate:v13 restrictedSourceEntities:0];

  id v33 = (void *)v16;
  [v12 setDataSource:v16];
  int v17 = (void *)[objc_alloc(MEMORY[0x263F0A7D8]) initWithAnchorDate:v10 statisticsInterval:v11];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __130__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate_gregorianCalendar___block_invoke;
  v41[3] = &unk_264750B98;
  id v18 = v17;
  id v42 = v18;
  [v12 setStatisticsHandler:v41];
  id v40 = 0;
  LODWORD(v13) = [v12 queryForInitialStatisticsWithError:&v40];
  id v19 = v40;
  v20 = 0;
  if (v13)
  {
    id v29 = v19;
    v30 = v10;
    v31 = v9;
    id v32 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = [v18 statistics];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v21);
          }
          if ([*(id *)(*((void *)&v36 + 1) + 8 * i) dataCount]) {
            ++v24;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v23);
    }
    else
    {
      uint64_t v24 = 0;
    }

    if (v24 >= 30) {
      uint64_t v27 = 30;
    }
    else {
      uint64_t v27 = v24;
    }
    v20 = [NSNumber numberWithInteger:v27];
    id v9 = v31;
    id v6 = v32;
    id v19 = v29;
    id v10 = v30;
  }

  return v20;
}

uint64_t __130__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertStatistics:");
}

- (id)_countOfLast30DaysWithSleepSamplesWithCurrentDate:(id)a3 calendarCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 currentCalendar];
  uint64_t v9 = objc_msgSend(v6, "hk_morningIndexWithCalendar:", v8);

  uint64_t v10 = v9 - 30;
  id v11 = objc_alloc(MEMORY[0x263F43358]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v13 = [v7 currentCalendar];
  id v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  uint64_t v16 = objc_msgSend(v11, "initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:", WeakRetained, 0, v13, v10, 30, 1, 1, v15);

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __107__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepSamplesWithCurrentDate_calendarCache___block_invoke;
  v19[3] = &unk_264750BC0;
  v19[4] = &v20;
  if ([v16 enumerateWithError:0 handler:v19])
  {
    int v17 = [NSNumber numberWithInteger:v21[3]];
  }
  else
  {
    int v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __107__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepSamplesWithCurrentDate_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsPeriodsWithAppleSleepTrackingData];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)_hoursAsleepDuringLastSleepDayWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  v52[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
  uint64_t v9 = [MEMORY[0x263F43380] calculatorForCategoryType:v8 intervalCollection:0 options:65 mergeStrategy:1];
  uint64_t v10 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:1 currentDate:v6 gregorianCalendar:v7 sampleType:v8];
  id v11 = HKCategoryValueSleepAnalysisAsleepValues();
  uint64_t v12 = [v11 allObjects];
  uint64_t v13 = HDCategorySampleEntityPredicateEqualToValues();

  id v14 = (void *)MEMORY[0x263F434A8];
  uint64_t v44 = (void *)v13;
  v45 = (void *)v10;
  v52[0] = v10;
  v52[1] = v13;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  uint64_t v16 = [v14 predicateMatchingAllPredicates:v15];

  id v17 = objc_alloc(MEMORY[0x263F43390]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v43 = (void *)v16;
  id v19 = (void *)[v17 initForProfile:WeakRetained categoryType:v8 predicate:v16 restrictedSourceEntities:0];

  [v9 setDataSource:v19];
  id v20 = objc_alloc(MEMORY[0x263F43398]);
  id v21 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v22 = [v19 quantityType];
  uint64_t v23 = (void *)[v20 initWithProfile:v21 quantityType:v22];

  [v9 setSourceOrderProvider:v23];
  id v50 = 0;
  LODWORD(v16) = [v9 queryForInitialStatisticsWithError:&v50];
  id v42 = v50;
  uint64_t v24 = [v9 currentStatistics];
  uint64_t v25 = v24;
  v26 = 0;
  if (v16 && v24)
  {
    long long v38 = v23;
    long long v39 = self;
    id v40 = v8;
    id v41 = v7;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v27 = [v24 sources];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v47;
      double v31 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v27);
          }
          id v33 = [v25 durationForSource:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          v34 = [MEMORY[0x263F0A830] secondUnit];
          [v33 doubleValueForUnit:v34];
          double v36 = v35;

          if (v36 > v31) {
            double v31 = v36;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v29);
    }
    else
    {
      double v31 = 0.0;
    }

    v26 = [(HDMCWristTemperatureDailyAnalyticsEvent *)v39 _roundDouble:0 scale:v31 / 3600.0];
    id v7 = v41;
    id v8 = v40;
    uint64_t v23 = v38;
  }

  return v26;
}

- (id)_daysWithStandHoursInLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  p_profile = &self->_profile;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v9 = HDAnalyticsCountOfSleepDaysWithStandHoursPriorToDate();

  return v9;
}

- (id)_lastSleepDayHasSleepDataWithCurrentDate:(id)a3 calendarCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 currentCalendar];
  uint64_t v9 = objc_msgSend(v6, "hk_morningIndexWithCalendar:", v8);

  uint64_t v10 = v9 - 1;
  id v11 = objc_alloc(MEMORY[0x263F43358]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v13 = [v7 currentCalendar];
  id v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  uint64_t v16 = objc_msgSend(v11, "initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:", WeakRetained, 0, v13, v10, 1, 1, 1, v15);

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __98__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataWithCurrentDate_calendarCache___block_invoke;
  v19[3] = &unk_264750BC0;
  v19[4] = &v20;
  if ([v16 enumerateWithError:0 handler:v19])
  {
    id v17 = [NSNumber numberWithInt:v21[3] > 0];
  }
  else
  {
    id v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __98__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataWithCurrentDate_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsPeriodsWithAppleSleepTrackingData];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)_lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F0A980] sharedBehavior];
  int v9 = [v8 isAppleInternalInstall];

  if (v9)
  {
    uint64_t v10 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _firstPartySleepSamplesFromLastNSleepDays:1 currentDate:v6 gregorianCalendar:v7];
    if ([v10 count])
    {
      id v11 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D8EEA88];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __127__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate_gregorianCalendar___block_invoke;
      v16[3] = &unk_264750BE8;
      id v17 = v11;
      id v12 = v11;
      uint64_t v13 = objc_msgSend(v10, "hk_containsObjectPassingTest:", v16);
      id v14 = [NSNumber numberWithBool:v13];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __127__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 sourceRevision];
  id v4 = [v3 source];
  uint64_t v5 = [v4 _productType];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

- (id)_lastSleepDayHasWristTemperatureDataWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v4 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:1 currentDate:a3 gregorianCalendar:a4 sourceEntityPredicate:0];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "count") != 0);

  return v5;
}

- (id)_IHAGatedLastSleepDayWristTemperatureFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:1 currentDate:a3 gregorianCalendar:a4 sourceEntityPredicate:0];
  if ([v5 count])
  {
    uint64_t v6 = [v5 lastObject];
    id v7 = [v6 quantity];
    id v8 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _celsiusValueFromQuantity:v7 scale:1];

    int v9 = &unk_26D8EEAF0;
    if ([v8 compare:&unk_26D8EEAF0] == -1
      || (int v9 = &unk_26D8EEB00, [v8 compare:&unk_26D8EEB00] == 1))
    {

      id v8 = v9;
    }
    uint64_t v10 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v20 = @"tempPastDay";
    id v11 = [v8 stringValue];
    v21[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = [v10 dictionaryWithDictionary:v12];

    id v14 = [v6 metadata];
    id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F0AB70]];

    if (v15)
    {
      uint64_t v16 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _celsiusValueFromQuantity:v15 scale:1];
      id v17 = [v16 stringValue];
      [v13 setObject:v17 forKeyedSubscript:@"tempUncorrectedPastDay"];
    }
    id v18 = (void *)[v13 copy];
  }
  else
  {
    id v18 = (void *)MEMORY[0x263EFFA78];
  }

  return v18;
}

- (id)_lastSleepDayRelativeSleepingWristTemperatureWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _HKMCAppleSleepingWristTemperatureType();
  int v9 = [MEMORY[0x263F43380] calculatorForQuantityType:v8 intervalCollection:0 options:_HKStatisticsOptionBaselineRelativeQuantities() | 0x20 mergeStrategy:1];
  uint64_t v10 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:1 currentDate:v7 gregorianCalendar:v6 sampleType:v8];

  id v11 = objc_alloc(MEMORY[0x263F433A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v13 = [v8 _rollingBaselineConfiguration];
  id v14 = (void *)[v11 initForProfile:WeakRetained quantityType:v8 predicate:v10 restrictedSourceEntities:0 configuration:v13 currentDate:v7];

  [v9 setDataSource:v14];
  uint64_t v20 = 0;
  LODWORD(v13) = [v9 queryForInitialStatisticsWithError:&v20];
  id v15 = [v9 currentStatistics];
  uint64_t v16 = v15;
  id v17 = 0;
  if (v13 && v15)
  {
    if ([v15 dataCount])
    {
      id v17 = [v16 mostRecentQuantity];

      if (v17)
      {
        id v18 = [v16 mostRecentQuantity];
        id v17 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _changeInCelsiusStringFromQuantity:v18 scale:1];
      }
    }
    else
    {
      id v17 = 0;
    }
  }

  return v17;
}

- (id)_allNoiseFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:30 currentDate:v6 gregorianCalendar:v7];
  if (v8)
  {
    int v9 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:30 currentDate:v6 gregorianCalendar:v7 sourceEntityPredicate:v8];
    uint64_t v10 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _noiseMetricsFromSleepingWristTemperatureSamples:v9 gregorianCalendar:v7];
    id v11 = (void *)[v10 mutableCopy];

    id v12 = objc_msgSend(v9, "hk_map:", &__block_literal_global_466);
    uint64_t v13 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sampleStandardDeviationOfValues:v12];

    if (v13)
    {
      [v13 doubleValue];
      id v14 = -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](self, "_roundDouble:scale:", 2);
      id v15 = [v14 stringValue];
      [v11 setObject:v15 forKeyedSubscript:@"stdDevPast30Days"];
    }
    uint64_t v16 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263EFFA78];
  }

  return v16;
}

id __92__HDMCWristTemperatureDailyAnalyticsEvent__allNoiseFieldsWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 quantity];
  id v4 = [MEMORY[0x263F0A830] degreeCelsiusUnit];
  [v3 doubleValueForUnit:v4];
  uint64_t v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

- (id)_noiseMetricsFromSleepingWristTemperatureSamples:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v49 = self;
  id v8 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _samplesByMorningIndex:v6 gregorianCalendar:v7];
  int v9 = [v6 firstObject];
  uint64_t v10 = [v9 endDate];
  uint64_t v11 = objc_msgSend(v10, "hk_morningIndexWithCalendar:", v7);

  v51 = v6;
  id v12 = [v6 lastObject];
  uint64_t v13 = [v12 endDate];
  uint64_t v14 = objc_msgSend(v13, "hk_morningIndexWithCalendar:", v7);

  id v50 = v8;
  id v15 = objc_msgSend(v8, "hk_map:", &__block_literal_global_469);
  uint64_t v16 = [MEMORY[0x263EFF980] array];
  id v17 = [MEMORY[0x263EFF980] array];
  if (v11 < v14)
  {
    uint64_t v18 = v11 + 1;
    do
    {
      id v19 = [NSNumber numberWithInteger:v18];
      uint64_t v20 = [v15 objectForKeyedSubscript:v19];

      id v21 = [NSNumber numberWithInteger:v18 - 1];
      uint64_t v22 = [v15 objectForKeyedSubscript:v21];

      uint64_t v23 = [NSNumber numberWithInteger:++v18];
      uint64_t v24 = [v15 objectForKeyedSubscript:v23];

      if (v20) {
        BOOL v25 = v22 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      if (!v25)
      {
        [v20 doubleValue];
        double v27 = v26;
        [v22 doubleValue];
        uint64_t v29 = [NSNumber numberWithDouble:v27 - v28];
        [v17 addObject:v29];

        if (v24)
        {
          [v20 doubleValue];
          double v31 = v30;
          [v22 doubleValue];
          double v33 = v31 + v32 * -0.5;
          [v24 doubleValue];
          double v35 = [NSNumber numberWithDouble:v33 + v34 * -0.5];
          [v16 addObject:v35];
        }
      }
    }
    while (v18 - 1 != v14);
  }
  double v36 = [MEMORY[0x263EFF9A0] dictionary];
  long long v37 = [(HDMCWristTemperatureDailyAnalyticsEvent *)v49 _sampleStandardDeviationOfValues:v16];
  long long v38 = v37;
  if (v37)
  {
    [v37 doubleValue];
    id v40 = [(HDMCWristTemperatureDailyAnalyticsEvent *)v49 _roundDouble:2 scale:v39 / 1.22474487];
    id v41 = [v40 stringValue];
    [v36 setObject:v41 forKeyedSubscript:@"dayToDayNoisePast30Days"];
  }
  id v42 = [(HDMCWristTemperatureDailyAnalyticsEvent *)v49 _sampleStandardDeviationOfValues:v17];
  v43 = v42;
  if (v42)
  {
    [v42 doubleValue];
    v45 = [(HDMCWristTemperatureDailyAnalyticsEvent *)v49 _roundDouble:2 scale:v44 / 1.41421356];
    long long v46 = [v45 stringValue];
    [v36 setObject:v46 forKeyedSubscript:@"stdDevFilteredPast30Days"];
  }
  long long v47 = (void *)[v36 copy];

  return v47;
}

void __110__HDMCWristTemperatureDailyAnalyticsEvent__noiseMetricsFromSleepingWristTemperatureSamples_gregorianCalendar___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [a3 quantity];
  int v9 = [MEMORY[0x263F0A830] degreeCelsiusUnit];
  [v8 doubleValueForUnit:v9];
  double v11 = v10;

  id v12 = [NSNumber numberWithDouble:v11];
  v6[2](v6, v7, v12);
}

- (id)_samplesByMorningIndex:(id)a3 gregorianCalendar:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v29 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v12 = [v11 endDate];
        uint64_t v13 = objc_msgSend(v12, "hk_morningIndexWithCalendar:", v29);

        uint64_t v14 = [NSNumber numberWithInteger:v13];
        id v15 = [v6 objectForKeyedSubscript:v14];

        uint64_t v16 = [NSNumber numberWithInteger:v13];
        if (v15)
        {
          id v17 = [v6 objectForKeyedSubscript:v16];

          uint64_t v18 = [v17 endDate];
          id v19 = [v17 startDate];
          [v18 timeIntervalSinceDate:v19];
          double v21 = v20;

          uint64_t v22 = [v11 endDate];
          uint64_t v23 = [v11 startDate];
          [v22 timeIntervalSinceDate:v23];
          double v25 = v24;

          if (v21 <= v25)
          {
            double v26 = [NSNumber numberWithInteger:v13];
            [v6 setObject:v11 forKeyedSubscript:v26];
          }
        }
        else
        {
          [v6 setObject:v11 forKeyedSubscript:v16];
          id v17 = v16;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_countOfUniqueSourcesOfWristTemperatureSamplesFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:30 currentDate:v7 gregorianCalendar:v6 sourceEntityPredicate:0];
  uint64_t v9 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:365 currentDate:v7 gregorianCalendar:v6 sourceEntityPredicate:0];

  double v10 = (void *)MEMORY[0x263EFF9A0];
  v19[0] = @"numUniqueWatchesPast30Days";
  double v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSourcesFromSamples:](self, "_countOfUniqueSourcesFromSamples:", v8));
  v19[1] = @"numUniqueWatchesPastYear";
  v20[0] = v11;
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSourcesFromSamples:](self, "_countOfUniqueSourcesFromSamples:", v9));
  v20[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v14 = [v10 dictionaryWithDictionary:v13];

  id v15 = [MEMORY[0x263F0A980] sharedBehavior];
  LODWORD(v12) = [v15 isAppleInternalInstall];

  if (v12)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSerialNumbersFromSamples:](self, "_countOfUniqueSerialNumbersFromSamples:", v8));
    [v14 setObject:v16 forKeyedSubscript:@"numUniqueWatchSerialsPast30Days"];
  }
  id v17 = (void *)[v14 copy];

  return v17;
}

- (int64_t)_countOfUniqueSourcesFromSamples:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "sourceRevision", (void)v14);
        double v11 = [v10 source];
        [v4 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  int64_t v12 = [v4 count];
  return v12;
}

- (int64_t)_countOfUniqueSerialNumbersFromSamples:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F43218];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = [v5 _wristTemperatureIdentifierDomainWithProfile:WeakRetained];

  uint64_t v8 = [v7 _wristTemperatureSerialNumbersBySourceIdentifier];
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v14), "sourceRevision", (void)v21);
        long long v16 = [v15 source];
        long long v17 = [v16 bundleIdentifier];

        uint64_t v18 = [v8 objectForKeyedSubscript:v17];
        if (v18) {
          [v9 addObject:v18];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  int64_t v19 = [v9 count];
  return v19;
}

- (id)_weeksSinceDeliveryWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F097F8] dataSource:v4 error:0];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 isOnboardingRecordPresent])
    {
      uint64_t v7 = NSNumber;
      uint64_t v8 = [v6 onboardingRecord];
      uint64_t v9 = [v8 onboardingCompletion];
      id v10 = [v9 completionDate];
      objc_msgSend(v7, "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v10, v4));
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = (id)*MEMORY[0x263F091A8];
  }

  return v11;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 environmentDataSource];
  uint64_t v7 = [v6 bucketedNumberOfWeeksSinceDate:v5];

  uint64_t v8 = (void *)*MEMORY[0x263F091B0];
  if (v7) {
    uint64_t v8 = v7;
  }
  id v9 = v8;

  int64_t v10 = [v9 integerValue];
  return v10;
}

- (id)_hasCycleFactorsActive
{
  analysisManager = self->_analysisManager;
  if (analysisManager
    && (([(HDMCAnalysisManager *)analysisManager currentAnalysis],
         (id v4 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(HDMCAnalysisManager *)self->_analysisManager analyzeWithError:0],
         (id v4 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    id v5 = NSNumber;
    uint64_t v6 = [v4 ongoingCycleFactors];
    id v7 = [v5 numberWithBool:HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples()];
  }
  else
  {
    id v7 = (id)*MEMORY[0x263F091A8];
  }
  return v7;
}

- (id)_preferredSleepingWristTemperatureUnit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained unitPreferencesManager];
  id v4 = _HKMCAppleSleepingWristTemperatureType();
  id v5 = [v3 preferredUnitForType:v4 error:0];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F0A830] degreeCelsiusUnit];
    char v7 = [v5 isEqual:v6];

    if (v7)
    {
      uint64_t v8 = @"C";
    }
    else
    {
      id v9 = [MEMORY[0x263F0A830] degreeFahrenheitUnit];
      int v10 = [v5 isEqual:v9];

      if (v10) {
        uint64_t v8 = @"F";
      }
      else {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_featureStatusForFeatureIdentifier:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [a4 healthDataSource];
  id v9 = [v8 featureStatusProviderForIdentifier:v7];

  int v10 = [v9 featureStatusWithError:a5];

  return v10;
}

- (id)_sleepingWristTemperatureSamplesFromLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sourceEntityPredicate:(id)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = _HKMCAppleSleepingWristTemperatureType();
  uint64_t v14 = (void *)MEMORY[0x263F432E8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  long long v16 = [v14 entityEnumeratorWithType:v13 profile:WeakRetained];

  long long v17 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:a3 currentDate:v12 gregorianCalendar:v11 sampleType:v13 sourceEntityPredicate:v10];

  [v16 setPredicate:v17];
  uint64_t v18 = [MEMORY[0x263F434C8] orderingTermWithProperty:*MEMORY[0x263F43080] entityClass:objc_opt_class() ascending:1];
  v29[0] = v18;
  int64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v16 setOrderingTerms:v19];

  double v20 = [MEMORY[0x263EFF980] array];
  id v28 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __146__HDMCWristTemperatureDailyAnalyticsEvent__sleepingWristTemperatureSamplesFromLastNSleepDays_currentDate_gregorianCalendar_sourceEntityPredicate___block_invoke;
  v26[3] = &unk_264750C50;
  id v21 = v20;
  id v27 = v21;
  LOBYTE(v12) = [v16 enumerateWithError:&v28 handler:v26];
  id v22 = v28;
  if (v12)
  {
    id v23 = v21;
  }
  else
  {
    _HKInitializeLogging();
    long long v24 = HKLogAnalytics();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:]();
    }

    id v23 = (id)MEMORY[0x263EFFA68];
  }

  return v23;
}

uint64_t __146__HDMCWristTemperatureDailyAnalyticsEvent__sleepingWristTemperatureSamplesFromLastNSleepDays_currentDate_gregorianCalendar_sourceEntityPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_firstPartySleepSamplesFromLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)MEMORY[0x263F0A158];
  uint64_t v9 = *MEMORY[0x263F09410];
  id v10 = a5;
  id v11 = a4;
  id v12 = [v8 categoryTypeForIdentifier:v9];
  uint64_t v13 = (void *)MEMORY[0x263F43180];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  long long v15 = [v13 entityEnumeratorWithType:v12 profile:WeakRetained];

  long long v16 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:a3 currentDate:v11 gregorianCalendar:v10 sampleType:v12 sourceEntityPredicate:0];

  [v15 setPredicate:v16];
  long long v17 = [MEMORY[0x263F434C8] orderingTermWithProperty:*MEMORY[0x263F43080] entityClass:objc_opt_class() ascending:1];
  v28[0] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  [v15 setOrderingTerms:v18];

  int64_t v19 = [MEMORY[0x263EFF980] array];
  id v27 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __115__HDMCWristTemperatureDailyAnalyticsEvent__firstPartySleepSamplesFromLastNSleepDays_currentDate_gregorianCalendar___block_invoke;
  v25[3] = &unk_264750C50;
  id v20 = v19;
  id v26 = v20;
  LOBYTE(v11) = [v15 enumerateWithError:&v27 handler:v25];
  id v21 = v27;
  if (v11)
  {
    id v22 = v20;
  }
  else
  {
    _HKInitializeLogging();
    id v23 = HKLogAnalytics();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[HDMCWristTemperatureDailyAnalyticsEvent _firstPartySleepSamplesFromLastNSleepDays:currentDate:gregorianCalendar:]();
    }

    id v22 = (id)MEMORY[0x263EFFA68];
  }

  return v22;
}

uint64_t __115__HDMCWristTemperatureDailyAnalyticsEvent__firstPartySleepSamplesFromLastNSleepDays_currentDate_gregorianCalendar___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_dominantSleepingWristTemperatureSourceOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:a3 currentDate:v8 gregorianCalendar:v9 sourceEntityPredicate:0];
  if ([v10 count])
  {
    id v11 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSampleCountBySourceOverLastNDays:a3 currentDate:v8 gregorianCalendar:v9];
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x3032000000;
    int64_t v19 = __Block_byref_object_copy__3;
    id v20 = __Block_byref_object_dispose__3;
    id v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __126__HDMCWristTemperatureDailyAnalyticsEvent__dominantSleepingWristTemperatureSourceOverLastNDays_currentDate_gregorianCalendar___block_invoke;
    v14[3] = &unk_264750C78;
    v14[4] = v15;
    v14[5] = &v16;
    [v11 enumerateKeysAndObjectsUsingBlock:v14];
    id v12 = (id)v17[5];
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __126__HDMCWristTemperatureDailyAnalyticsEvent__dominantSleepingWristTemperatureSourceOverLastNDays_currentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if ([v6 integerValue] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 integerValue];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)_dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  id v6 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _dominantSleepingWristTemperatureSourceOverLastNDays:a3 currentDate:a4 gregorianCalendar:a5];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v8 = [WeakRetained sourceManager];
    id v9 = [v6 bundleIdentifier];
    id v10 = [v8 allSourcesForBundleIdentifier:v9 error:0];

    if (v10 && [v10 count])
    {
      id v11 = HDDataEntityPredicateForSourceEntitySet();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_sleepingWristTemperatureSampleCountBySourceOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _sleepingWristTemperatureSamplesFromLastNSleepDays:a3 currentDate:a4 gregorianCalendar:a5 sourceEntityPredicate:0];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) sourceRevision];
          uint64_t v13 = [v12 source];

          uint64_t v14 = [v6 objectForKeyedSubscript:v13];

          if (v14)
          {
            long long v15 = NSNumber;
            uint64_t v16 = [v6 objectForKeyedSubscript:v13];
            long long v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "integerValue") + 1);
            [v6 setObject:v17 forKeyedSubscript:v13];
          }
          else
          {
            [v6 setObject:&unk_26D8EE878 forKeyedSubscript:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v18 = (void *)[v6 copy];
    id v5 = v20;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x263EFFA78];
  }

  return v18;
}

- (id)_predicateForAppleWatchSamplesInLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sampleType:(id)a6 sourceEntityPredicate:(id)a7
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v12 = a7;
  uint64_t v13 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:a3 currentDate:a4 gregorianCalendar:a5 sampleType:a6];
  uint64_t v14 = v13;
  if (v12)
  {
    long long v15 = (void *)MEMORY[0x263F434A8];
    v19[0] = v13;
    v19[1] = v12;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    id v17 = [v15 predicateMatchingAllPredicates:v16];
  }
  else
  {
    id v17 = v13;
  }

  return v17;
}

- (id)_predicateForAppleWatchSamplesInLast30SleepDaysRelativeToCurrentDate:(id)a3 gregorianCalendar:(id)a4 sampleType:(id)a5
{
  return [(HDMCWristTemperatureDailyAnalyticsEvent *)self _predicateForAppleWatchSamplesInLastNSleepDays:30 currentDate:a3 gregorianCalendar:a4 sampleType:a5];
}

- (id)_predicateForAppleWatchSamplesInLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sampleType:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = objc_msgSend(a4, "hk_sleepDayStartWithCalendar:", v10);
  id v12 = [v10 dateByAddingUnit:16 value:-a3 toDate:v11 options:0];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v12 endDate:v11];
  uint64_t v14 = (void *)MEMORY[0x263F434A8];
  long long v15 = HDSampleEntityPredicateForDataType();
  long long v21 = v15;
  uint64_t v16 = HDSampleEntityPredicateForDateInterval();

  long long v22 = v16;
  id v17 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
  long long v23 = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:3];
  int64_t v19 = objc_msgSend(v14, "predicateMatchingAllPredicates:", v18, v21, v22);

  return v19;
}

- (id)_sampleStandardDeviationOfValues:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = objc_msgSend(v3, "hk_averageUsingEvaluationBlock:", &__block_literal_global_498);
    [v5 doubleValue];
    uint64_t v7 = v6;

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__HDMCWristTemperatureDailyAnalyticsEvent__sampleStandardDeviationOfValues___block_invoke_2;
    v12[3] = &__block_descriptor_40_e18_d16__0__NSNumber_8l;
    v12[4] = v7;
    objc_msgSend(v3, "hk_sumUsingEvaluationBlock:", v12);
    double v9 = v8;
    uint64_t v10 = [v3 count];
    id v4 = [NSNumber numberWithDouble:sqrt(v9 / (double)(unint64_t)(v10 - 1))];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __76__HDMCWristTemperatureDailyAnalyticsEvent__sampleStandardDeviationOfValues___block_invoke(uint64_t a1, void *a2)
{
  return [a2 doubleValue];
}

double __76__HDMCWristTemperatureDailyAnalyticsEvent__sampleStandardDeviationOfValues___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  double v5 = v4 - *(double *)(a1 + 32);
  [v3 doubleValue];
  double v7 = v6;

  return v5 * (v7 - *(double *)(a1 + 32));
}

- (id)_celsiusValueFromQuantity:(id)a3 scale:(signed __int16)a4
{
  uint64_t v4 = a4;
  double v6 = (void *)MEMORY[0x263F0A830];
  id v7 = a3;
  double v8 = [v6 degreeCelsiusUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;

  return [(HDMCWristTemperatureDailyAnalyticsEvent *)self _roundDouble:v4 scale:v10];
}

- (id)_changeInCelsiusStringFromQuantity:(id)a3 scale:(signed __int16)a4
{
  uint64_t v4 = a4;
  double v6 = (void *)MEMORY[0x263F0A830];
  id v7 = a3;
  double v8 = [v6 _changeInDegreeCelsiusUnit];
  [v7 _baselineRelativeDoubleValueForUnit:v8];
  double v10 = v9;

  if (v10 == 1.79769313e308)
  {
    id v11 = @"collecting";
  }
  else if (v10 == 1.0)
  {
    id v11 = @"unavailable";
  }
  else
  {
    id v12 = [(HDMCWristTemperatureDailyAnalyticsEvent *)self _roundDouble:v4 scale:v10];
    id v11 = [v12 stringValue];
  }
  return v11;
}

- (id)_roundDouble:(double)a3 scale:(signed __int16)a4
{
  double v5 = [MEMORY[0x263F087B8] decimalNumberHandlerWithRoundingMode:0 scale:a4 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  double v6 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:a3];
  id v7 = [v6 decimalNumberByRoundingAccordingToBehavior:v5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyDefaults, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingManager, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_1_2(&dword_225722000, v2, v3, "[%{public}@] Error querying sleeping wrist temperature samples: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_firstPartySleepSamplesFromLastNSleepDays:currentDate:gregorianCalendar:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_1_2(&dword_225722000, v2, v3, "[%{public}@] Error querying sleep samples: %{public}@", v4, v5, v6, v7, v8);
}

@end