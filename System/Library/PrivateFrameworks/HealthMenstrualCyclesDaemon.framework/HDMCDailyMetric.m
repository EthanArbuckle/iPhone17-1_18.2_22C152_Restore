@interface HDMCDailyMetric
+ (NSString)eventName;
- (BOOL)isImproveHealthAndActivityAllowed;
- (HDMCDailyMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3;
- (NSDictionary)eventPayload;
- (NSNumber)age;
- (NSNumber)areHealthNotificationsAuthorized;
- (NSNumber)biologicalSex;
- (NSNumber)countConfirmedInfrequentDeviationPastYear;
- (NSNumber)countConfirmedIrregularDeviationPastYear;
- (NSNumber)countConfirmedProlongedDeviationPastYear;
- (NSNumber)countConfirmedSpottingDeviationPastYear;
- (NSNumber)countDetectedInfrequentDeviationsPastYear;
- (NSNumber)countDetectedIrregularDeviationsInPastYear;
- (NSNumber)countDetectedProlongedDeviationsPastYear;
- (NSNumber)countDetectedSpottingDeviationsPastYear;
- (NSNumber)countPairedVisionPro;
- (NSNumber)countPairedWatch;
- (NSNumber)countPairediPad;
- (NSNumber)countPairediPhone;
- (NSNumber)countTotalConfirmedDeviationsPastMonth;
- (NSNumber)countTotalConfirmedDeviationsPastYear;
- (NSNumber)countTotalDetectedDeviationsPastMonth;
- (NSNumber)countTotalDetectedDeviationsPastYear;
- (NSNumber)countWatchesWithWristTempMeasurementDataInLast45Days;
- (NSNumber)countWristTempEligibleHistoricalCycles;
- (NSNumber)countWristTempEligibleHistoricalCycles_ConfirmedOPK;
- (NSNumber)countWristTempEligibleHistoricalCycles_ConfirmedWristTemp;
- (NSNumber)countWristTempEligibleHistoricalCycles_FailedAvailability;
- (NSNumber)countWristTempEligibleHistoricalCycles_FailedNoise;
- (NSNumber)countWristTempEligibleHistoricalCycles_FailedOther;
- (NSNumber)cycleLengthVariationLowerPercentile;
- (NSNumber)cycleLengthVariationUpperPercentile;
- (NSNumber)daysBeforeFertileWindowEnd;
- (NSNumber)daysBeforeMostLikelyPeriodPredictionStart;
- (NSNumber)daysFertileWindowShifted;
- (NSNumber)daysFirstPeriodPredictionShifted;
- (NSNumber)daysSinceCycleStart;
- (NSNumber)daysSinceDeviationTilePosted;
- (NSNumber)daysWithWristTempIn10DaysAfterOvulation;
- (NSNumber)daysWithWristTempIn10DaysBeforeCalendarOvulation;
- (NSNumber)daysWithWristTempIn3DaysAfterCalendarOvulation;
- (NSNumber)daysWithWristTempIn45DaysBeforeFertileWindowEnd;
- (NSNumber)daysWithWristTempIn6DaysAfterCalendarOvulation;
- (NSNumber)daysWithWristTempIn6DaysBeforeCalendarOvulation;
- (NSNumber)daysWithWristTempInPast45Days;
- (NSNumber)daysWornWatchToSleepInLast45Days;
- (NSNumber)deviationDetectionInfrequentEnabled;
- (NSNumber)deviationDetectionIrregularEnabled;
- (NSNumber)deviationDetectionProlongedEnabled;
- (NSNumber)deviationDetectionSpottingEnabled;
- (NSNumber)didFirstPeriodPredictionShift;
- (NSNumber)fertilityNotificationEnabled;
- (NSNumber)fertilityPredictionEnabled;
- (NSNumber)gestationalAge;
- (NSNumber)hasCompatiblePairedAppleWatch;
- (NSNumber)hasConfirmedInfrequentDeviationPastMonth;
- (NSNumber)hasConfirmedIrregularDeviationPastMonth;
- (NSNumber)hasConfirmedProlongedDeviationPastMonth;
- (NSNumber)hasConfirmedSpottingDeviationPastMonth;
- (NSNumber)hasFirstPartySleepSamplesPast48Hours;
- (NSNumber)hasOnboardedPregnancyMode;
- (NSNumber)hasPregnancyInMedicalID;
- (NSNumber)hasSameAlgorithmVersionOnPairedWatch;
- (NSNumber)hasSleepSamplesPast48Hours;
- (NSNumber)hasWristTemperatureCompatiblePairedWatch;
- (NSNumber)internalLiveOnCycleFactorOverrideEnabled;
- (NSNumber)isEligibleForCycleFactorsReminder;
- (NSNumber)isOnboardingCompleted;
- (NSNumber)isOngoingContraception;
- (NSNumber)isOngoingLactation;
- (NSNumber)isOngoingPregnancy;
- (NSNumber)isSleepConfiguredToAllowWristTemperatureMeasurements;
- (NSNumber)isSleepScheduleEnabled;
- (NSNumber)isSleepScreenEnabled;
- (NSNumber)logBasalBodyTemperatureEnabled;
- (NSNumber)logCervicalMucusQualityEnabled;
- (NSNumber)logFactorsEnabled;
- (NSNumber)logOvulationTestResultEnabled;
- (NSNumber)logPregnancyTestResultEnabled;
- (NSNumber)logProgesteroneTestResultEnabled;
- (NSNumber)logSexualActivityEnabled;
- (NSNumber)logSpottingEnabled;
- (NSNumber)logSymptomsEnabled;
- (NSNumber)numberOfCyclesSinceLastDayOfLogging;
- (NSNumber)numberOfCyclesSinceLastDayOfLoggingInCycleTracking;
- (NSNumber)numberOfDailyAwakeHeartRateStatisticsForPast100Days;
- (NSNumber)numberOfDailySleepHeartRateStatisticsForPast100Days;
- (NSNumber)numberOfDaysSinceLastFiredUpdateFertileWindowNotification;
- (NSNumber)onboardedVersion;
- (NSNumber)periodNotificationEnabled;
- (NSNumber)periodPredictionEnabled;
- (NSNumber)pregnancyModeState;
- (NSNumber)sensorBasedPredictionEnabled;
- (NSNumber)wasDeviationDetectionDelivered;
- (NSNumber)wasHeartRateInputDelivered;
- (NSNumber)wasWristTemperatureInputDelivered;
- (NSNumber)weeksSinceOnboarded;
- (NSNumber)weeksSinceOnboardedPregnancyMode;
- (NSNumber)weeksSinceOnboardedWristTemperatureOvulationPrediction;
- (NSNumber)wristTemperatureBasedPredictionEnabled;
- (NSString)activeWatchProductType;
- (NSString)heartRateInputDeliveryCountryCode;
- (NSString)predictionPrimarySourceTypeFertileWindow;
- (NSString)predictionPrimarySourceTypeFirstPeriodPrediction;
- (NSString)wristTemperatureInputDeliveryCountryCode;
- (id)_biologicalSexString;
- (void)setActiveWatchProductType:(id)a3;
- (void)setAge:(id)a3;
- (void)setAreHealthNotificationsAuthorized:(id)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setCountConfirmedInfrequentDeviationPastYear:(id)a3;
- (void)setCountConfirmedIrregularDeviationPastYear:(id)a3;
- (void)setCountConfirmedProlongedDeviationPastYear:(id)a3;
- (void)setCountConfirmedSpottingDeviationPastYear:(id)a3;
- (void)setCountDetectedInfrequentDeviationsPastYear:(id)a3;
- (void)setCountDetectedIrregularDeviationsInPastYear:(id)a3;
- (void)setCountDetectedProlongedDeviationsPastYear:(id)a3;
- (void)setCountDetectedSpottingDeviationsPastYear:(id)a3;
- (void)setCountPairedVisionPro:(id)a3;
- (void)setCountPairedWatch:(id)a3;
- (void)setCountPairediPad:(id)a3;
- (void)setCountPairediPhone:(id)a3;
- (void)setCountTotalConfirmedDeviationsPastMonth:(id)a3;
- (void)setCountTotalConfirmedDeviationsPastYear:(id)a3;
- (void)setCountTotalDetectedDeviationsPastMonth:(id)a3;
- (void)setCountTotalDetectedDeviationsPastYear:(id)a3;
- (void)setCountWatchesWithWristTempMeasurementDataInLast45Days:(id)a3;
- (void)setCountWristTempEligibleHistoricalCycles:(id)a3;
- (void)setCountWristTempEligibleHistoricalCycles_ConfirmedOPK:(id)a3;
- (void)setCountWristTempEligibleHistoricalCycles_ConfirmedWristTemp:(id)a3;
- (void)setCountWristTempEligibleHistoricalCycles_FailedAvailability:(id)a3;
- (void)setCountWristTempEligibleHistoricalCycles_FailedNoise:(id)a3;
- (void)setCountWristTempEligibleHistoricalCycles_FailedOther:(id)a3;
- (void)setCycleLengthVariationLowerPercentile:(id)a3;
- (void)setCycleLengthVariationUpperPercentile:(id)a3;
- (void)setDaysBeforeFertileWindowEnd:(id)a3;
- (void)setDaysBeforeMostLikelyPeriodPredictionStart:(id)a3;
- (void)setDaysFertileWindowShifted:(id)a3;
- (void)setDaysFirstPeriodPredictionShifted:(id)a3;
- (void)setDaysSinceCycleStart:(id)a3;
- (void)setDaysSinceDeviationTilePosted:(id)a3;
- (void)setDaysWithWristTempIn10DaysAfterOvulation:(id)a3;
- (void)setDaysWithWristTempIn10DaysBeforeCalendarOvulation:(id)a3;
- (void)setDaysWithWristTempIn3DaysAfterCalendarOvulation:(id)a3;
- (void)setDaysWithWristTempIn45DaysBeforeFertileWindowEnd:(id)a3;
- (void)setDaysWithWristTempIn6DaysAfterCalendarOvulation:(id)a3;
- (void)setDaysWithWristTempIn6DaysBeforeCalendarOvulation:(id)a3;
- (void)setDaysWithWristTempInPast45Days:(id)a3;
- (void)setDaysWornWatchToSleepInLast45Days:(id)a3;
- (void)setDeviationDetectionInfrequentEnabled:(id)a3;
- (void)setDeviationDetectionIrregularEnabled:(id)a3;
- (void)setDeviationDetectionProlongedEnabled:(id)a3;
- (void)setDeviationDetectionSpottingEnabled:(id)a3;
- (void)setDidFirstPeriodPredictionShift:(id)a3;
- (void)setEventPayload:(id)a3;
- (void)setFertilityNotificationEnabled:(id)a3;
- (void)setFertilityPredictionEnabled:(id)a3;
- (void)setGestationalAge:(id)a3;
- (void)setHasCompatiblePairedAppleWatch:(id)a3;
- (void)setHasConfirmedInfrequentDeviationPastMonth:(id)a3;
- (void)setHasConfirmedIrregularDeviationPastMonth:(id)a3;
- (void)setHasConfirmedProlongedDeviationPastMonth:(id)a3;
- (void)setHasConfirmedSpottingDeviationPastMonth:(id)a3;
- (void)setHasFirstPartySleepSamplesPast48Hours:(id)a3;
- (void)setHasOnboardedPregnancyMode:(id)a3;
- (void)setHasPregnancyInMedicalID:(id)a3;
- (void)setHasSameAlgorithmVersionOnPairedWatch:(id)a3;
- (void)setHasSleepSamplesPast48Hours:(id)a3;
- (void)setHasWristTemperatureCompatiblePairedWatch:(id)a3;
- (void)setHeartRateInputDeliveryCountryCode:(id)a3;
- (void)setImproveHealthAndActivityAllowed:(BOOL)a3;
- (void)setInternalLiveOnCycleFactorOverrideEnabled:(id)a3;
- (void)setIsEligibleForCycleFactorsReminder:(id)a3;
- (void)setIsSleepConfiguredToAllowWristTemperatureMeasurements:(id)a3;
- (void)setIsSleepScheduleEnabled:(id)a3;
- (void)setIsSleepScreenEnabled:(id)a3;
- (void)setLogBasalBodyTemperatureEnabled:(id)a3;
- (void)setLogCervicalMucusQualityEnabled:(id)a3;
- (void)setLogFactorsEnabled:(id)a3;
- (void)setLogOvulationTestResultEnabled:(id)a3;
- (void)setLogPregnancyTestResultEnabled:(id)a3;
- (void)setLogProgesteroneTestResultEnabled:(id)a3;
- (void)setLogSexualActivityEnabled:(id)a3;
- (void)setLogSpottingEnabled:(id)a3;
- (void)setLogSymptomsEnabled:(id)a3;
- (void)setNumberOfCyclesSinceLastDayOfLogging:(id)a3;
- (void)setNumberOfCyclesSinceLastDayOfLoggingInCycleTracking:(id)a3;
- (void)setNumberOfDailyAwakeHeartRateStatisticsForPast100Days:(id)a3;
- (void)setNumberOfDailySleepHeartRateStatisticsForPast100Days:(id)a3;
- (void)setNumberOfDaysSinceLastFiredUpdateFertileWindowNotification:(id)a3;
- (void)setOnboardedVersion:(id)a3;
- (void)setOnboardingCompleted:(id)a3;
- (void)setOngoingContraception:(id)a3;
- (void)setOngoingLactation:(id)a3;
- (void)setOngoingPregnancy:(id)a3;
- (void)setPeriodNotificationEnabled:(id)a3;
- (void)setPeriodPredictionEnabled:(id)a3;
- (void)setPredictionPrimarySourceTypeFertileWindow:(id)a3;
- (void)setPredictionPrimarySourceTypeFirstPeriodPrediction:(id)a3;
- (void)setPregnancyModeState:(id)a3;
- (void)setSensorBasedPredictionEnabled:(id)a3;
- (void)setWasDeviationDetectionDelivered:(id)a3;
- (void)setWasHeartRateInputDelivered:(id)a3;
- (void)setWasWristTemperatureInputDelivered:(id)a3;
- (void)setWeeksSinceOnboarded:(id)a3;
- (void)setWeeksSinceOnboardedPregnancyMode:(id)a3;
- (void)setWeeksSinceOnboardedWristTemperatureOvulationPrediction:(id)a3;
- (void)setWristTemperatureBasedPredictionEnabled:(id)a3;
- (void)setWristTemperatureInputDeliveryCountryCode:(id)a3;
@end

@implementation HDMCDailyMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.menstrual-cycles.Daily";
}

- (HDMCDailyMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDMCDailyMetric;
  result = [(HDMCDailyMetric *)&v5 init];
  if (result) {
    result->_improveHealthAndActivityAllowed = a3;
  }
  return result;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HDMCDailyMetric *)self age];
  [v3 setObject:v4 forKeyedSubscript:@"age"];

  objc_super v5 = [(HDMCDailyMetric *)self _biologicalSexString];
  [v3 setObject:v5 forKeyedSubscript:@"biologicalSex"];

  v6 = [(HDMCDailyMetric *)self countPairediPhone];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F091E0]];

  v7 = [(HDMCDailyMetric *)self countPairedWatch];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F091F0]];

  v8 = [(HDMCDailyMetric *)self countPairediPad];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F091F8]];

  v9 = [(HDMCDailyMetric *)self countPairedVisionPro];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F091E8]];

  v10 = [(HDMCDailyMetric *)self isSleepScheduleEnabled];
  [v3 setObject:v10 forKeyedSubscript:@"isSleepScheduleEnabled"];

  v11 = [(HDMCDailyMetric *)self isSleepScreenEnabled];
  [v3 setObject:v11 forKeyedSubscript:@"isSleepScreenEnabled"];

  v12 = [(HDMCDailyMetric *)self cycleLengthVariationLowerPercentile];
  [v3 setObject:v12 forKeyedSubscript:@"cycleLengthVariation15thPercentile"];

  v13 = [(HDMCDailyMetric *)self cycleLengthVariationUpperPercentile];
  [v3 setObject:v13 forKeyedSubscript:@"cycleLengthVariation85thPercentile"];

  v14 = [(HDMCDailyMetric *)self hasCompatiblePairedAppleWatch];
  [v3 setObject:v14 forKeyedSubscript:@"hasCompatiblePairedAppleWatch"];

  v15 = [(HDMCDailyMetric *)self hasWristTemperatureCompatiblePairedWatch];
  [v3 setObject:v15 forKeyedSubscript:@"hasWristTemperatureCompatiblePairedWatch"];

  v16 = [(HDMCDailyMetric *)self hasFirstPartySleepSamplesPast48Hours];
  [v3 setObject:v16 forKeyedSubscript:@"hasFirstPartySleepSamplesPast48Hours"];

  v17 = [(HDMCDailyMetric *)self hasSameAlgorithmVersionOnPairedWatch];
  [v3 setObject:v17 forKeyedSubscript:@"hasSameAlgorithmVersionOnPairedWatch"];

  v18 = [(HDMCDailyMetric *)self hasSleepSamplesPast48Hours];
  [v3 setObject:v18 forKeyedSubscript:@"hasSleepSamplesPast48Hours"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HDMCDailyMetric isImproveHealthAndActivityAllowed](self, "isImproveHealthAndActivityAllowed"));
  [v3 setObject:v19 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  v20 = [(HDMCDailyMetric *)self areHealthNotificationsAuthorized];
  [v3 setObject:v20 forKeyedSubscript:@"areHealthNotificationsAuthorized"];

  v21 = [(HDMCDailyMetric *)self isOnboardingCompleted];
  [v3 setObject:v21 forKeyedSubscript:@"isOnboarded"];

  v22 = [(HDMCDailyMetric *)self numberOfCyclesSinceLastDayOfLogging];
  [v3 setObject:v22 forKeyedSubscript:@"numberOfCyclesSinceLastDayOfLogging"];

  v23 = [(HDMCDailyMetric *)self numberOfCyclesSinceLastDayOfLoggingInCycleTracking];
  [v3 setObject:v23 forKeyedSubscript:@"numberOfCyclesSinceLastDayOfLoggingInCycleTracking"];

  v24 = [(HDMCDailyMetric *)self numberOfDailyAwakeHeartRateStatisticsForPast100Days];
  [v3 setObject:v24 forKeyedSubscript:@"numberOfDailyAwakeHeartRateStatisticsForPast100Days"];

  v25 = [(HDMCDailyMetric *)self numberOfDailySleepHeartRateStatisticsForPast100Days];
  [v3 setObject:v25 forKeyedSubscript:@"numberOfDailySleepHeartRateStatisticsForPast100Days"];

  v26 = [(HDMCDailyMetric *)self numberOfDaysSinceLastFiredUpdateFertileWindowNotification];
  [v3 setObject:v26 forKeyedSubscript:@"numberOfDaysSinceLastFiredUpdateFertileWindowNotification"];

  v27 = [(HDMCDailyMetric *)self onboardedVersion];
  [v3 setObject:v27 forKeyedSubscript:@"onboardedVersion"];

  v28 = [(HDMCDailyMetric *)self isOngoingContraception];
  [v3 setObject:v28 forKeyedSubscript:@"ongoingContraception"];

  v29 = [(HDMCDailyMetric *)self isOngoingLactation];
  [v3 setObject:v29 forKeyedSubscript:@"ongoingLactation"];

  v30 = [(HDMCDailyMetric *)self isOngoingPregnancy];
  [v3 setObject:v30 forKeyedSubscript:@"ongoingPregnancy"];

  v31 = [(HDMCDailyMetric *)self fertilityNotificationEnabled];
  [v3 setObject:v31 forKeyedSubscript:@"settings_fertilityNotificationEnabled"];

  v32 = [(HDMCDailyMetric *)self fertilityPredictionEnabled];
  [v3 setObject:v32 forKeyedSubscript:@"settings_fertilityPredictionEnabled"];

  v33 = [(HDMCDailyMetric *)self logBasalBodyTemperatureEnabled];
  [v3 setObject:v33 forKeyedSubscript:@"settings_logBasalBodyTemperatureEnabled"];

  v34 = [(HDMCDailyMetric *)self logCervicalMucusQualityEnabled];
  [v3 setObject:v34 forKeyedSubscript:@"settings_logCervicalMucusQualityEnabled"];

  v35 = [(HDMCDailyMetric *)self logFactorsEnabled];
  [v3 setObject:v35 forKeyedSubscript:@"settings_logFactorsEnabled"];

  v36 = [(HDMCDailyMetric *)self logOvulationTestResultEnabled];
  [v3 setObject:v36 forKeyedSubscript:@"settings_logOvulationTestResultEnabled"];

  v37 = [(HDMCDailyMetric *)self logPregnancyTestResultEnabled];
  [v3 setObject:v37 forKeyedSubscript:@"settings_logPregnancyTestResultEnabled"];

  v38 = [(HDMCDailyMetric *)self logProgesteroneTestResultEnabled];
  [v3 setObject:v38 forKeyedSubscript:@"settings_logProgesteroneTestResultEnabled"];

  v39 = [(HDMCDailyMetric *)self logSexualActivityEnabled];
  [v3 setObject:v39 forKeyedSubscript:@"settings_logSexualActivityEnabled"];

  v40 = [(HDMCDailyMetric *)self logSpottingEnabled];
  [v3 setObject:v40 forKeyedSubscript:@"settings_logSpottingEnabled"];

  v41 = [(HDMCDailyMetric *)self logSymptomsEnabled];
  [v3 setObject:v41 forKeyedSubscript:@"settings_logSymptomsEnabled"];

  v42 = [(HDMCDailyMetric *)self periodNotificationEnabled];
  [v3 setObject:v42 forKeyedSubscript:@"settings_periodNotificationEnabled"];

  v43 = [(HDMCDailyMetric *)self periodPredictionEnabled];
  [v3 setObject:v43 forKeyedSubscript:@"settings_periodPredictionEnabled"];

  v44 = [(HDMCDailyMetric *)self sensorBasedPredictionEnabled];
  [v3 setObject:v44 forKeyedSubscript:@"settings_sensorBasedPredictionEnabled"];

  v45 = [(HDMCDailyMetric *)self wristTemperatureBasedPredictionEnabled];
  [v3 setObject:v45 forKeyedSubscript:@"settings_wristTemperatureBasedPredictionEnabled"];

  v46 = [(HDMCDailyMetric *)self wasHeartRateInputDelivered];
  [v3 setObject:v46 forKeyedSubscript:@"wasHeartRateInputDelivered"];

  v47 = [(HDMCDailyMetric *)self heartRateInputDeliveryCountryCode];
  [v3 setObject:v47 forKeyedSubscript:@"heartRateInputDeliveryCountryCode"];

  v48 = [(HDMCDailyMetric *)self wasWristTemperatureInputDelivered];
  [v3 setObject:v48 forKeyedSubscript:@"wasWristTemperatureInputDelivered"];

  v49 = [(HDMCDailyMetric *)self wristTemperatureInputDeliveryCountryCode];
  [v3 setObject:v49 forKeyedSubscript:@"wristTemperatureInputDeliveryCountryCode"];

  v50 = [(HDMCDailyMetric *)self weeksSinceOnboarded];
  [v3 setObject:v50 forKeyedSubscript:@"weeksSinceOnboarded"];

  v51 = [(HDMCDailyMetric *)self weeksSinceOnboarded];
  [v3 setObject:v51 forKeyedSubscript:@"weeksSinceOnboardedV2"];

  v52 = [(HDMCDailyMetric *)self weeksSinceOnboardedWristTemperatureOvulationPrediction];
  [v3 setObject:v52 forKeyedSubscript:@"weeksSinceOnboardedWristTempOvulationPrediction"];

  v53 = [(HDMCDailyMetric *)self countWatchesWithWristTempMeasurementDataInLast45Days];
  [v3 setObject:v53 forKeyedSubscript:@"countWatchesWithWristTempMeasurementDataInLast45Days"];

  v54 = [(HDMCDailyMetric *)self countWristTempEligibleHistoricalCycles];
  [v3 setObject:v54 forKeyedSubscript:@"countWristTempEligibleHistoricalCycles"];

  v55 = [(HDMCDailyMetric *)self countWristTempEligibleHistoricalCycles_ConfirmedOPK];
  [v3 setObject:v55 forKeyedSubscript:@"countWristTempEligibleHistoricalCycles_ConfirmedOPK"];

  v56 = [(HDMCDailyMetric *)self countWristTempEligibleHistoricalCycles_ConfirmedWristTemp];
  [v3 setObject:v56 forKeyedSubscript:@"countWristTempEligibleHistoricalCycles_ConfirmedWristTemp"];

  v57 = [(HDMCDailyMetric *)self countWristTempEligibleHistoricalCycles_FailedAvailability];
  [v3 setObject:v57 forKeyedSubscript:@"countWristTempEligibleHistoricalCycles_FailedAvailability"];

  v58 = [(HDMCDailyMetric *)self countWristTempEligibleHistoricalCycles_FailedNoise];
  [v3 setObject:v58 forKeyedSubscript:@"countWristTempEligibleHistoricalCycles_FailedNoise"];

  v59 = [(HDMCDailyMetric *)self countWristTempEligibleHistoricalCycles_FailedOther];
  [v3 setObject:v59 forKeyedSubscript:@"countWristTempEligibleHistoricalCycles_FailedOther"];

  v60 = [(HDMCDailyMetric *)self daysBeforeFertileWindowEnd];
  [v3 setObject:v60 forKeyedSubscript:@"daysBeforeFertileWindowEnd"];

  v61 = [(HDMCDailyMetric *)self daysBeforeMostLikelyPeriodPredictionStart];
  [v3 setObject:v61 forKeyedSubscript:@"daysBeforeMostLikelyPeriodPredictionStart"];

  v62 = [(HDMCDailyMetric *)self daysFertileWindowShifted];
  [v3 setObject:v62 forKeyedSubscript:@"daysFertileWindowShifted"];

  v63 = [(HDMCDailyMetric *)self daysFirstPeriodPredictionShifted];
  [v3 setObject:v63 forKeyedSubscript:@"daysFirstPeriodPredictionShifted"];

  v64 = [(HDMCDailyMetric *)self daysSinceCycleStart];
  [v3 setObject:v64 forKeyedSubscript:@"daysSinceCycleStart"];

  v65 = [(HDMCDailyMetric *)self didFirstPeriodPredictionShift];
  [v3 setObject:v65 forKeyedSubscript:@"didFirstPeriodPredictionShift"];

  v66 = [(HDMCDailyMetric *)self predictionPrimarySourceTypeFertileWindow];
  [v3 setObject:v66 forKeyedSubscript:@"predictionPrimarySourceTypeFertileWindow"];

  v67 = [(HDMCDailyMetric *)self predictionPrimarySourceTypeFirstPeriodPrediction];
  [v3 setObject:v67 forKeyedSubscript:@"predictionPrimarySourceTypeFirstPeriodPrediction"];

  v68 = [(HDMCDailyMetric *)self daysWithWristTempIn10DaysBeforeCalendarOvulation];
  [v3 setObject:v68 forKeyedSubscript:@"daysWithWristTempIn10DaysBeforeCalendarOvulation"];

  v69 = [(HDMCDailyMetric *)self daysWithWristTempIn6DaysBeforeCalendarOvulation];
  [v3 setObject:v69 forKeyedSubscript:@"daysWithWristTempIn6DaysBeforeCalendarOvulation"];

  v70 = [(HDMCDailyMetric *)self daysWithWristTempIn3DaysAfterCalendarOvulation];
  [v3 setObject:v70 forKeyedSubscript:@"daysWithWristTempIn3DaysAfterCalendarOvulation"];

  v71 = [(HDMCDailyMetric *)self daysWithWristTempIn6DaysAfterCalendarOvulation];
  [v3 setObject:v71 forKeyedSubscript:@"daysWithWristTempIn6DaysAfterCalendarOvulation"];

  v72 = [(HDMCDailyMetric *)self daysWithWristTempIn10DaysAfterOvulation];
  [v3 setObject:v72 forKeyedSubscript:@"daysWithWristTempIn10DaysAfterOvulation"];

  v73 = [(HDMCDailyMetric *)self daysWithWristTempIn45DaysBeforeFertileWindowEnd];
  [v3 setObject:v73 forKeyedSubscript:@"daysWithWristTempIn45DaysBeforeFertileWindowEnd"];

  v74 = [(HDMCDailyMetric *)self daysWithWristTempInPast45Days];
  [v3 setObject:v74 forKeyedSubscript:@"daysWithWristTempInPast45Days"];

  v75 = [(HDMCDailyMetric *)self daysWornWatchToSleepInLast45Days];
  [v3 setObject:v75 forKeyedSubscript:@"daysWornWatchToSleepInLast45Days"];

  v76 = [(HDMCDailyMetric *)self internalLiveOnCycleFactorOverrideEnabled];
  [v3 setObject:v76 forKeyedSubscript:@"internalLiveOnCycleFactorOverride"];

  v77 = [(HDMCDailyMetric *)self isSleepConfiguredToAllowWristTemperatureMeasurements];
  [v3 setObject:v77 forKeyedSubscript:@"isSleepConfiguredToAllowWristTemperatureMeasurements"];

  v78 = [(HDMCDailyMetric *)self wasDeviationDetectionDelivered];
  [v3 setObject:v78 forKeyedSubscript:@"wasCycleDeviationsDelivered"];

  v79 = [(HDMCDailyMetric *)self countConfirmedInfrequentDeviationPastYear];
  [v3 setObject:v79 forKeyedSubscript:@"countConfirmedInfrequentDeviationsPastYear"];

  v80 = [(HDMCDailyMetric *)self countConfirmedIrregularDeviationPastYear];
  [v3 setObject:v80 forKeyedSubscript:@"countConfirmedIrregularDeviationsInPastYear"];

  v81 = [(HDMCDailyMetric *)self countConfirmedProlongedDeviationPastYear];
  [v3 setObject:v81 forKeyedSubscript:@"countConfirmedProlongedDeviationsPastYear"];

  v82 = [(HDMCDailyMetric *)self countConfirmedSpottingDeviationPastYear];
  [v3 setObject:v82 forKeyedSubscript:@"countConfirmedSpottingDeviationsPastYear"];

  v83 = [(HDMCDailyMetric *)self countTotalConfirmedDeviationsPastYear];
  [v3 setObject:v83 forKeyedSubscript:@"countTotalConfirmedDeviationsPastYear"];

  v84 = [(HDMCDailyMetric *)self hasConfirmedInfrequentDeviationPastMonth];
  [v3 setObject:v84 forKeyedSubscript:@"hasConfirmedInfrequentDeviationPastMonth"];

  v85 = [(HDMCDailyMetric *)self hasConfirmedIrregularDeviationPastMonth];
  [v3 setObject:v85 forKeyedSubscript:@"hasConfirmedIrregularDeviationPastMonth"];

  v86 = [(HDMCDailyMetric *)self hasConfirmedProlongedDeviationPastMonth];
  [v3 setObject:v86 forKeyedSubscript:@"hasConfirmedProlongedDeviationPastMonth"];

  v87 = [(HDMCDailyMetric *)self hasConfirmedSpottingDeviationPastMonth];
  [v3 setObject:v87 forKeyedSubscript:@"hasConfirmedSpottingDeviationPastMonth"];

  v88 = [(HDMCDailyMetric *)self countTotalConfirmedDeviationsPastMonth];
  [v3 setObject:v88 forKeyedSubscript:@"countTotalConfirmedDeviationsPastMonth"];

  v89 = [(HDMCDailyMetric *)self countDetectedSpottingDeviationsPastYear];
  [v3 setObject:v89 forKeyedSubscript:@"countDetectedSpottingDeviationsPastYear"];

  v90 = [(HDMCDailyMetric *)self countDetectedProlongedDeviationsPastYear];
  [v3 setObject:v90 forKeyedSubscript:@"countDetectedProlongedDeviationsPastYear"];

  v91 = [(HDMCDailyMetric *)self countDetectedIrregularDeviationsInPastYear];
  [v3 setObject:v91 forKeyedSubscript:@"countDetectedIrregularDeviationsInPastYear"];

  v92 = [(HDMCDailyMetric *)self countDetectedInfrequentDeviationsPastYear];
  [v3 setObject:v92 forKeyedSubscript:@"countDetectedInfrequentDeviationsPastYear"];

  v93 = [(HDMCDailyMetric *)self countTotalDetectedDeviationsPastMonth];
  [v3 setObject:v93 forKeyedSubscript:@"countTotalDetectedDeviationsPastMonth"];

  v94 = [(HDMCDailyMetric *)self countTotalDetectedDeviationsPastYear];
  [v3 setObject:v94 forKeyedSubscript:@"countTotalDetectedDeviationsPastYear"];

  v95 = [(HDMCDailyMetric *)self daysSinceDeviationTilePosted];
  [v3 setObject:v95 forKeyedSubscript:@"daysSinceDeviationTilePosted"];

  v96 = [(HDMCDailyMetric *)self deviationDetectionProlongedEnabled];
  [v3 setObject:v96 forKeyedSubscript:@"settings_prolongedDeviationEnabled"];

  v97 = [(HDMCDailyMetric *)self deviationDetectionSpottingEnabled];
  [v3 setObject:v97 forKeyedSubscript:@"settings_spottingDeviationEnabled"];

  v98 = [(HDMCDailyMetric *)self deviationDetectionInfrequentEnabled];
  [v3 setObject:v98 forKeyedSubscript:@"settings_infrequentDeviationEnabled"];

  v99 = [(HDMCDailyMetric *)self deviationDetectionIrregularEnabled];
  [v3 setObject:v99 forKeyedSubscript:@"settings_irregularDeviationEnabled"];

  v100 = [(HDMCDailyMetric *)self isEligibleForCycleFactorsReminder];
  [v3 setObject:v100 forKeyedSubscript:@"isEligibleForCycleFactorsReminder"];

  v101 = [(HDMCDailyMetric *)self activeWatchProductType];
  [v3 setObject:v101 forKeyedSubscript:@"activeWatchProductType"];

  v102 = [(HDMCDailyMetric *)self gestationalAge];
  [v3 setObject:v102 forKeyedSubscript:@"gestationalAge"];

  v103 = [(HDMCDailyMetric *)self pregnancyModeState];
  [v3 setObject:v103 forKeyedSubscript:@"pregnancyModeState"];

  v104 = [(HDMCDailyMetric *)self hasOnboardedPregnancyMode];
  [v3 setObject:v104 forKeyedSubscript:@"hasOnboardedPregnancyMode"];

  v105 = [(HDMCDailyMetric *)self hasPregnancyInMedicalID];
  [v3 setObject:v105 forKeyedSubscript:@"hasPregnancyInMedicalID"];

  v106 = [(HDMCDailyMetric *)self weeksSinceOnboardedPregnancyMode];
  [v3 setObject:v106 forKeyedSubscript:@"weeksSinceOnboardedPregnancyMode"];

  v107 = (void *)[v3 copy];
  return (NSDictionary *)v107;
}

- (id)_biologicalSexString
{
  id v3 = [(HDMCDailyMetric *)self biologicalSex];

  if (v3
    && ([(HDMCDailyMetric *)self biologicalSex],
        v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 integerValue],
        v4,
        v5 <= 3))
  {
    return off_2647510A0[v5];
  }
  else
  {
    return 0;
  }
}

- (void)setEventPayload:(id)a3
{
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return self->_improveHealthAndActivityAllowed;
}

- (void)setImproveHealthAndActivityAllowed:(BOOL)a3
{
  self->_improveHealthAndActivityAllowed = a3;
}

- (NSNumber)isOnboardingCompleted
{
  return self->_onboardingCompleted;
}

- (void)setOnboardingCompleted:(id)a3
{
}

- (NSNumber)onboardedVersion
{
  return self->_onboardedVersion;
}

- (void)setOnboardedVersion:(id)a3
{
}

- (NSNumber)weeksSinceOnboarded
{
  return self->_weeksSinceOnboarded;
}

- (void)setWeeksSinceOnboarded:(id)a3
{
}

- (NSNumber)hasCompatiblePairedAppleWatch
{
  return self->_hasCompatiblePairedAppleWatch;
}

- (void)setHasCompatiblePairedAppleWatch:(id)a3
{
}

- (NSNumber)hasSameAlgorithmVersionOnPairedWatch
{
  return self->_hasSameAlgorithmVersionOnPairedWatch;
}

- (void)setHasSameAlgorithmVersionOnPairedWatch:(id)a3
{
}

- (NSNumber)wasHeartRateInputDelivered
{
  return self->_wasHeartRateInputDelivered;
}

- (void)setWasHeartRateInputDelivered:(id)a3
{
}

- (NSNumber)wasDeviationDetectionDelivered
{
  return self->_wasDeviationDetectionDelivered;
}

- (void)setWasDeviationDetectionDelivered:(id)a3
{
}

- (NSString)heartRateInputDeliveryCountryCode
{
  return self->_heartRateInputDeliveryCountryCode;
}

- (void)setHeartRateInputDeliveryCountryCode:(id)a3
{
}

- (NSNumber)wasWristTemperatureInputDelivered
{
  return self->_wasWristTemperatureInputDelivered;
}

- (void)setWasWristTemperatureInputDelivered:(id)a3
{
}

- (NSString)wristTemperatureInputDeliveryCountryCode
{
  return self->_wristTemperatureInputDeliveryCountryCode;
}

- (void)setWristTemperatureInputDeliveryCountryCode:(id)a3
{
}

- (NSNumber)daysWithWristTempIn45DaysBeforeFertileWindowEnd
{
  return self->_daysWithWristTempIn45DaysBeforeFertileWindowEnd;
}

- (void)setDaysWithWristTempIn45DaysBeforeFertileWindowEnd:(id)a3
{
}

- (NSNumber)daysWithWristTempInPast45Days
{
  return self->_daysWithWristTempInPast45Days;
}

- (void)setDaysWithWristTempInPast45Days:(id)a3
{
}

- (NSNumber)daysWornWatchToSleepInLast45Days
{
  return self->_daysWornWatchToSleepInLast45Days;
}

- (void)setDaysWornWatchToSleepInLast45Days:(id)a3
{
}

- (NSNumber)countWatchesWithWristTempMeasurementDataInLast45Days
{
  return self->_countWatchesWithWristTempMeasurementDataInLast45Days;
}

- (void)setCountWatchesWithWristTempMeasurementDataInLast45Days:(id)a3
{
}

- (NSNumber)hasWristTemperatureCompatiblePairedWatch
{
  return self->_hasWristTemperatureCompatiblePairedWatch;
}

- (void)setHasWristTemperatureCompatiblePairedWatch:(id)a3
{
}

- (NSNumber)internalLiveOnCycleFactorOverrideEnabled
{
  return self->_internalLiveOnCycleFactorOverrideEnabled;
}

- (void)setInternalLiveOnCycleFactorOverrideEnabled:(id)a3
{
}

- (NSNumber)isSleepConfiguredToAllowWristTemperatureMeasurements
{
  return self->_isSleepConfiguredToAllowWristTemperatureMeasurements;
}

- (void)setIsSleepConfiguredToAllowWristTemperatureMeasurements:(id)a3
{
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
}

- (NSNumber)countPairediPhone
{
  return self->_countPairediPhone;
}

- (void)setCountPairediPhone:(id)a3
{
}

- (NSNumber)countPairedWatch
{
  return self->_countPairedWatch;
}

- (void)setCountPairedWatch:(id)a3
{
}

- (NSNumber)countPairediPad
{
  return self->_countPairediPad;
}

- (void)setCountPairediPad:(id)a3
{
}

- (NSNumber)countPairedVisionPro
{
  return self->_countPairedVisionPro;
}

- (void)setCountPairedVisionPro:(id)a3
{
}

- (NSNumber)isSleepScheduleEnabled
{
  return self->_isSleepScheduleEnabled;
}

- (void)setIsSleepScheduleEnabled:(id)a3
{
}

- (NSNumber)isSleepScreenEnabled
{
  return self->_isSleepScreenEnabled;
}

- (void)setIsSleepScreenEnabled:(id)a3
{
}

- (NSNumber)numberOfCyclesSinceLastDayOfLogging
{
  return self->_numberOfCyclesSinceLastDayOfLogging;
}

- (void)setNumberOfCyclesSinceLastDayOfLogging:(id)a3
{
}

- (NSNumber)numberOfCyclesSinceLastDayOfLoggingInCycleTracking
{
  return self->_numberOfCyclesSinceLastDayOfLoggingInCycleTracking;
}

- (void)setNumberOfCyclesSinceLastDayOfLoggingInCycleTracking:(id)a3
{
}

- (NSNumber)isOngoingContraception
{
  return self->_ongoingContraception;
}

- (void)setOngoingContraception:(id)a3
{
}

- (NSNumber)isOngoingLactation
{
  return self->_ongoingLactation;
}

- (void)setOngoingLactation:(id)a3
{
}

- (NSNumber)isOngoingPregnancy
{
  return self->_ongoingPregnancy;
}

- (void)setOngoingPregnancy:(id)a3
{
}

- (NSNumber)cycleLengthVariationLowerPercentile
{
  return self->_cycleLengthVariationLowerPercentile;
}

- (void)setCycleLengthVariationLowerPercentile:(id)a3
{
}

- (NSNumber)cycleLengthVariationUpperPercentile
{
  return self->_cycleLengthVariationUpperPercentile;
}

- (void)setCycleLengthVariationUpperPercentile:(id)a3
{
}

- (NSNumber)numberOfDaysSinceLastFiredUpdateFertileWindowNotification
{
  return self->_numberOfDaysSinceLastFiredUpdateFertileWindowNotification;
}

- (void)setNumberOfDaysSinceLastFiredUpdateFertileWindowNotification:(id)a3
{
}

- (NSNumber)numberOfDailySleepHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailySleepHeartRateStatisticsForPast100Days;
}

- (void)setNumberOfDailySleepHeartRateStatisticsForPast100Days:(id)a3
{
}

- (NSNumber)numberOfDailyAwakeHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days;
}

- (void)setNumberOfDailyAwakeHeartRateStatisticsForPast100Days:(id)a3
{
}

- (NSNumber)countWristTempEligibleHistoricalCycles
{
  return self->_countWristTempEligibleHistoricalCycles;
}

- (void)setCountWristTempEligibleHistoricalCycles:(id)a3
{
}

- (NSNumber)countWristTempEligibleHistoricalCycles_ConfirmedOPK
{
  return self->_countWristTempEligibleHistoricalCycles_ConfirmedOPK;
}

- (void)setCountWristTempEligibleHistoricalCycles_ConfirmedOPK:(id)a3
{
}

- (NSNumber)countWristTempEligibleHistoricalCycles_ConfirmedWristTemp
{
  return self->_countWristTempEligibleHistoricalCycles_ConfirmedWristTemp;
}

- (void)setCountWristTempEligibleHistoricalCycles_ConfirmedWristTemp:(id)a3
{
}

- (NSNumber)countWristTempEligibleHistoricalCycles_FailedAvailability
{
  return self->_countWristTempEligibleHistoricalCycles_FailedAvailability;
}

- (void)setCountWristTempEligibleHistoricalCycles_FailedAvailability:(id)a3
{
}

- (NSNumber)countWristTempEligibleHistoricalCycles_FailedNoise
{
  return self->_countWristTempEligibleHistoricalCycles_FailedNoise;
}

- (void)setCountWristTempEligibleHistoricalCycles_FailedNoise:(id)a3
{
}

- (NSNumber)countWristTempEligibleHistoricalCycles_FailedOther
{
  return self->_countWristTempEligibleHistoricalCycles_FailedOther;
}

- (void)setCountWristTempEligibleHistoricalCycles_FailedOther:(id)a3
{
}

- (NSNumber)daysBeforeFertileWindowEnd
{
  return self->_daysBeforeFertileWindowEnd;
}

- (void)setDaysBeforeFertileWindowEnd:(id)a3
{
}

- (NSNumber)daysBeforeMostLikelyPeriodPredictionStart
{
  return self->_daysBeforeMostLikelyPeriodPredictionStart;
}

- (void)setDaysBeforeMostLikelyPeriodPredictionStart:(id)a3
{
}

- (NSNumber)daysFertileWindowShifted
{
  return self->_daysFertileWindowShifted;
}

- (void)setDaysFertileWindowShifted:(id)a3
{
}

- (NSNumber)daysFirstPeriodPredictionShifted
{
  return self->_daysFirstPeriodPredictionShifted;
}

- (void)setDaysFirstPeriodPredictionShifted:(id)a3
{
}

- (NSNumber)daysSinceCycleStart
{
  return self->_daysSinceCycleStart;
}

- (void)setDaysSinceCycleStart:(id)a3
{
}

- (NSNumber)daysWithWristTempIn10DaysBeforeCalendarOvulation
{
  return self->_daysWithWristTempIn10DaysBeforeCalendarOvulation;
}

- (void)setDaysWithWristTempIn10DaysBeforeCalendarOvulation:(id)a3
{
}

- (NSNumber)daysWithWristTempIn6DaysBeforeCalendarOvulation
{
  return self->_daysWithWristTempIn6DaysBeforeCalendarOvulation;
}

- (void)setDaysWithWristTempIn6DaysBeforeCalendarOvulation:(id)a3
{
}

- (NSNumber)daysWithWristTempIn3DaysAfterCalendarOvulation
{
  return self->_daysWithWristTempIn3DaysAfterCalendarOvulation;
}

- (void)setDaysWithWristTempIn3DaysAfterCalendarOvulation:(id)a3
{
}

- (NSNumber)daysWithWristTempIn6DaysAfterCalendarOvulation
{
  return self->_daysWithWristTempIn6DaysAfterCalendarOvulation;
}

- (void)setDaysWithWristTempIn6DaysAfterCalendarOvulation:(id)a3
{
}

- (NSNumber)daysWithWristTempIn10DaysAfterOvulation
{
  return self->_daysWithWristTempIn10DaysAfterOvulation;
}

- (void)setDaysWithWristTempIn10DaysAfterOvulation:(id)a3
{
}

- (NSNumber)didFirstPeriodPredictionShift
{
  return self->_didFirstPeriodPredictionShift;
}

- (void)setDidFirstPeriodPredictionShift:(id)a3
{
}

- (NSString)predictionPrimarySourceTypeFertileWindow
{
  return self->_predictionPrimarySourceTypeFertileWindow;
}

- (void)setPredictionPrimarySourceTypeFertileWindow:(id)a3
{
}

- (NSString)predictionPrimarySourceTypeFirstPeriodPrediction
{
  return self->_predictionPrimarySourceTypeFirstPeriodPrediction;
}

- (void)setPredictionPrimarySourceTypeFirstPeriodPrediction:(id)a3
{
}

- (NSNumber)weeksSinceOnboardedWristTemperatureOvulationPrediction
{
  return self->_weeksSinceOnboardedWristTemperatureOvulationPrediction;
}

- (void)setWeeksSinceOnboardedWristTemperatureOvulationPrediction:(id)a3
{
}

- (NSNumber)periodPredictionEnabled
{
  return self->_periodPredictionEnabled;
}

- (void)setPeriodPredictionEnabled:(id)a3
{
}

- (NSNumber)periodNotificationEnabled
{
  return self->_periodNotificationEnabled;
}

- (void)setPeriodNotificationEnabled:(id)a3
{
}

- (NSNumber)fertilityPredictionEnabled
{
  return self->_fertilityPredictionEnabled;
}

- (void)setFertilityPredictionEnabled:(id)a3
{
}

- (NSNumber)fertilityNotificationEnabled
{
  return self->_fertilityNotificationEnabled;
}

- (void)setFertilityNotificationEnabled:(id)a3
{
}

- (NSNumber)deviationDetectionIrregularEnabled
{
  return self->_deviationDetectionIrregularEnabled;
}

- (void)setDeviationDetectionIrregularEnabled:(id)a3
{
}

- (NSNumber)deviationDetectionInfrequentEnabled
{
  return self->_deviationDetectionInfrequentEnabled;
}

- (void)setDeviationDetectionInfrequentEnabled:(id)a3
{
}

- (NSNumber)deviationDetectionSpottingEnabled
{
  return self->_deviationDetectionSpottingEnabled;
}

- (void)setDeviationDetectionSpottingEnabled:(id)a3
{
}

- (NSNumber)deviationDetectionProlongedEnabled
{
  return self->_deviationDetectionProlongedEnabled;
}

- (void)setDeviationDetectionProlongedEnabled:(id)a3
{
}

- (NSNumber)sensorBasedPredictionEnabled
{
  return self->_sensorBasedPredictionEnabled;
}

- (void)setSensorBasedPredictionEnabled:(id)a3
{
}

- (NSNumber)wristTemperatureBasedPredictionEnabled
{
  return self->_wristTemperatureBasedPredictionEnabled;
}

- (void)setWristTemperatureBasedPredictionEnabled:(id)a3
{
}

- (NSNumber)logFactorsEnabled
{
  return self->_logFactorsEnabled;
}

- (void)setLogFactorsEnabled:(id)a3
{
}

- (NSNumber)logSymptomsEnabled
{
  return self->_logSymptomsEnabled;
}

- (void)setLogSymptomsEnabled:(id)a3
{
}

- (NSNumber)logSpottingEnabled
{
  return self->_logSpottingEnabled;
}

- (void)setLogSpottingEnabled:(id)a3
{
}

- (NSNumber)logSexualActivityEnabled
{
  return self->_logSexualActivityEnabled;
}

- (void)setLogSexualActivityEnabled:(id)a3
{
}

- (NSNumber)logCervicalMucusQualityEnabled
{
  return self->_logCervicalMucusQualityEnabled;
}

- (void)setLogCervicalMucusQualityEnabled:(id)a3
{
}

- (NSNumber)logBasalBodyTemperatureEnabled
{
  return self->_logBasalBodyTemperatureEnabled;
}

- (void)setLogBasalBodyTemperatureEnabled:(id)a3
{
}

- (NSNumber)logOvulationTestResultEnabled
{
  return self->_logOvulationTestResultEnabled;
}

- (void)setLogOvulationTestResultEnabled:(id)a3
{
}

- (NSNumber)logPregnancyTestResultEnabled
{
  return self->_logPregnancyTestResultEnabled;
}

- (void)setLogPregnancyTestResultEnabled:(id)a3
{
}

- (NSNumber)logProgesteroneTestResultEnabled
{
  return self->_logProgesteroneTestResultEnabled;
}

- (void)setLogProgesteroneTestResultEnabled:(id)a3
{
}

- (NSNumber)hasFirstPartySleepSamplesPast48Hours
{
  return self->_hasFirstPartySleepSamplesPast48Hours;
}

- (void)setHasFirstPartySleepSamplesPast48Hours:(id)a3
{
}

- (NSNumber)hasSleepSamplesPast48Hours
{
  return self->_hasSleepSamplesPast48Hours;
}

- (void)setHasSleepSamplesPast48Hours:(id)a3
{
}

- (NSNumber)countConfirmedProlongedDeviationPastYear
{
  return self->_countConfirmedProlongedDeviationPastYear;
}

- (void)setCountConfirmedProlongedDeviationPastYear:(id)a3
{
}

- (NSNumber)countConfirmedInfrequentDeviationPastYear
{
  return self->_countConfirmedInfrequentDeviationPastYear;
}

- (void)setCountConfirmedInfrequentDeviationPastYear:(id)a3
{
}

- (NSNumber)countConfirmedIrregularDeviationPastYear
{
  return self->_countConfirmedIrregularDeviationPastYear;
}

- (void)setCountConfirmedIrregularDeviationPastYear:(id)a3
{
}

- (NSNumber)countConfirmedSpottingDeviationPastYear
{
  return self->_countConfirmedSpottingDeviationPastYear;
}

- (void)setCountConfirmedSpottingDeviationPastYear:(id)a3
{
}

- (NSNumber)hasConfirmedProlongedDeviationPastMonth
{
  return self->_hasConfirmedProlongedDeviationPastMonth;
}

- (void)setHasConfirmedProlongedDeviationPastMonth:(id)a3
{
}

- (NSNumber)hasConfirmedInfrequentDeviationPastMonth
{
  return self->_hasConfirmedInfrequentDeviationPastMonth;
}

- (void)setHasConfirmedInfrequentDeviationPastMonth:(id)a3
{
}

- (NSNumber)hasConfirmedIrregularDeviationPastMonth
{
  return self->_hasConfirmedIrregularDeviationPastMonth;
}

- (void)setHasConfirmedIrregularDeviationPastMonth:(id)a3
{
}

- (NSNumber)hasConfirmedSpottingDeviationPastMonth
{
  return self->_hasConfirmedSpottingDeviationPastMonth;
}

- (void)setHasConfirmedSpottingDeviationPastMonth:(id)a3
{
}

- (NSNumber)countTotalConfirmedDeviationsPastMonth
{
  return self->_countTotalConfirmedDeviationsPastMonth;
}

- (void)setCountTotalConfirmedDeviationsPastMonth:(id)a3
{
}

- (NSNumber)countTotalConfirmedDeviationsPastYear
{
  return self->_countTotalConfirmedDeviationsPastYear;
}

- (void)setCountTotalConfirmedDeviationsPastYear:(id)a3
{
}

- (NSNumber)countDetectedInfrequentDeviationsPastYear
{
  return self->_countDetectedInfrequentDeviationsPastYear;
}

- (void)setCountDetectedInfrequentDeviationsPastYear:(id)a3
{
}

- (NSNumber)countDetectedIrregularDeviationsInPastYear
{
  return self->_countDetectedIrregularDeviationsInPastYear;
}

- (void)setCountDetectedIrregularDeviationsInPastYear:(id)a3
{
}

- (NSNumber)countDetectedProlongedDeviationsPastYear
{
  return self->_countDetectedProlongedDeviationsPastYear;
}

- (void)setCountDetectedProlongedDeviationsPastYear:(id)a3
{
}

- (NSNumber)countDetectedSpottingDeviationsPastYear
{
  return self->_countDetectedSpottingDeviationsPastYear;
}

- (void)setCountDetectedSpottingDeviationsPastYear:(id)a3
{
}

- (NSNumber)countTotalDetectedDeviationsPastMonth
{
  return self->_countTotalDetectedDeviationsPastMonth;
}

- (void)setCountTotalDetectedDeviationsPastMonth:(id)a3
{
}

- (NSNumber)countTotalDetectedDeviationsPastYear
{
  return self->_countTotalDetectedDeviationsPastYear;
}

- (void)setCountTotalDetectedDeviationsPastYear:(id)a3
{
}

- (NSNumber)daysSinceDeviationTilePosted
{
  return self->_daysSinceDeviationTilePosted;
}

- (void)setDaysSinceDeviationTilePosted:(id)a3
{
}

- (NSNumber)isEligibleForCycleFactorsReminder
{
  return self->_isEligibleForCycleFactorsReminder;
}

- (void)setIsEligibleForCycleFactorsReminder:(id)a3
{
}

- (NSString)activeWatchProductType
{
  return self->_activeWatchProductType;
}

- (void)setActiveWatchProductType:(id)a3
{
}

- (NSNumber)gestationalAge
{
  return self->_gestationalAge;
}

- (void)setGestationalAge:(id)a3
{
}

- (NSNumber)pregnancyModeState
{
  return self->_pregnancyModeState;
}

- (void)setPregnancyModeState:(id)a3
{
}

- (NSNumber)hasOnboardedPregnancyMode
{
  return self->_hasOnboardedPregnancyMode;
}

- (void)setHasOnboardedPregnancyMode:(id)a3
{
}

- (NSNumber)hasPregnancyInMedicalID
{
  return self->_hasPregnancyInMedicalID;
}

- (void)setHasPregnancyInMedicalID:(id)a3
{
}

- (NSNumber)weeksSinceOnboardedPregnancyMode
{
  return self->_weeksSinceOnboardedPregnancyMode;
}

- (void)setWeeksSinceOnboardedPregnancyMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeksSinceOnboardedPregnancyMode, 0);
  objc_storeStrong((id *)&self->_hasPregnancyInMedicalID, 0);
  objc_storeStrong((id *)&self->_hasOnboardedPregnancyMode, 0);
  objc_storeStrong((id *)&self->_pregnancyModeState, 0);
  objc_storeStrong((id *)&self->_gestationalAge, 0);
  objc_storeStrong((id *)&self->_activeWatchProductType, 0);
  objc_storeStrong((id *)&self->_isEligibleForCycleFactorsReminder, 0);
  objc_storeStrong((id *)&self->_daysSinceDeviationTilePosted, 0);
  objc_storeStrong((id *)&self->_countTotalDetectedDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countTotalDetectedDeviationsPastMonth, 0);
  objc_storeStrong((id *)&self->_countDetectedSpottingDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countDetectedProlongedDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countDetectedIrregularDeviationsInPastYear, 0);
  objc_storeStrong((id *)&self->_countDetectedInfrequentDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countTotalConfirmedDeviationsPastYear, 0);
  objc_storeStrong((id *)&self->_countTotalConfirmedDeviationsPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedSpottingDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedIrregularDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedInfrequentDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_hasConfirmedProlongedDeviationPastMonth, 0);
  objc_storeStrong((id *)&self->_countConfirmedSpottingDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_countConfirmedIrregularDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_countConfirmedInfrequentDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_countConfirmedProlongedDeviationPastYear, 0);
  objc_storeStrong((id *)&self->_hasSleepSamplesPast48Hours, 0);
  objc_storeStrong((id *)&self->_hasFirstPartySleepSamplesPast48Hours, 0);
  objc_storeStrong((id *)&self->_logProgesteroneTestResultEnabled, 0);
  objc_storeStrong((id *)&self->_logPregnancyTestResultEnabled, 0);
  objc_storeStrong((id *)&self->_logOvulationTestResultEnabled, 0);
  objc_storeStrong((id *)&self->_logBasalBodyTemperatureEnabled, 0);
  objc_storeStrong((id *)&self->_logCervicalMucusQualityEnabled, 0);
  objc_storeStrong((id *)&self->_logSexualActivityEnabled, 0);
  objc_storeStrong((id *)&self->_logSpottingEnabled, 0);
  objc_storeStrong((id *)&self->_logSymptomsEnabled, 0);
  objc_storeStrong((id *)&self->_logFactorsEnabled, 0);
  objc_storeStrong((id *)&self->_wristTemperatureBasedPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_sensorBasedPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionProlongedEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionSpottingEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionInfrequentEnabled, 0);
  objc_storeStrong((id *)&self->_deviationDetectionIrregularEnabled, 0);
  objc_storeStrong((id *)&self->_fertilityNotificationEnabled, 0);
  objc_storeStrong((id *)&self->_fertilityPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_periodNotificationEnabled, 0);
  objc_storeStrong((id *)&self->_periodPredictionEnabled, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedWristTemperatureOvulationPrediction, 0);
  objc_storeStrong((id *)&self->_predictionPrimarySourceTypeFirstPeriodPrediction, 0);
  objc_storeStrong((id *)&self->_predictionPrimarySourceTypeFertileWindow, 0);
  objc_storeStrong((id *)&self->_didFirstPeriodPredictionShift, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn10DaysAfterOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn6DaysAfterCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn3DaysAfterCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn6DaysBeforeCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn10DaysBeforeCalendarOvulation, 0);
  objc_storeStrong((id *)&self->_daysSinceCycleStart, 0);
  objc_storeStrong((id *)&self->_daysFirstPeriodPredictionShifted, 0);
  objc_storeStrong((id *)&self->_daysFertileWindowShifted, 0);
  objc_storeStrong((id *)&self->_daysBeforeMostLikelyPeriodPredictionStart, 0);
  objc_storeStrong((id *)&self->_daysBeforeFertileWindowEnd, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedOther, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedNoise, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_FailedAvailability, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_ConfirmedWristTemp, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles_ConfirmedOPK, 0);
  objc_storeStrong((id *)&self->_countWristTempEligibleHistoricalCycles, 0);
  objc_storeStrong((id *)&self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days, 0);
  objc_storeStrong((id *)&self->_numberOfDailySleepHeartRateStatisticsForPast100Days, 0);
  objc_storeStrong((id *)&self->_numberOfDaysSinceLastFiredUpdateFertileWindowNotification, 0);
  objc_storeStrong((id *)&self->_cycleLengthVariationUpperPercentile, 0);
  objc_storeStrong((id *)&self->_cycleLengthVariationLowerPercentile, 0);
  objc_storeStrong((id *)&self->_ongoingPregnancy, 0);
  objc_storeStrong((id *)&self->_ongoingLactation, 0);
  objc_storeStrong((id *)&self->_ongoingContraception, 0);
  objc_storeStrong((id *)&self->_numberOfCyclesSinceLastDayOfLoggingInCycleTracking, 0);
  objc_storeStrong((id *)&self->_numberOfCyclesSinceLastDayOfLogging, 0);
  objc_storeStrong((id *)&self->_isSleepScreenEnabled, 0);
  objc_storeStrong((id *)&self->_isSleepScheduleEnabled, 0);
  objc_storeStrong((id *)&self->_countPairedVisionPro, 0);
  objc_storeStrong((id *)&self->_countPairediPad, 0);
  objc_storeStrong((id *)&self->_countPairedWatch, 0);
  objc_storeStrong((id *)&self->_countPairediPhone, 0);
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_isSleepConfiguredToAllowWristTemperatureMeasurements, 0);
  objc_storeStrong((id *)&self->_internalLiveOnCycleFactorOverrideEnabled, 0);
  objc_storeStrong((id *)&self->_hasWristTemperatureCompatiblePairedWatch, 0);
  objc_storeStrong((id *)&self->_countWatchesWithWristTempMeasurementDataInLast45Days, 0);
  objc_storeStrong((id *)&self->_daysWornWatchToSleepInLast45Days, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempInPast45Days, 0);
  objc_storeStrong((id *)&self->_daysWithWristTempIn45DaysBeforeFertileWindowEnd, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputDeliveryCountryCode, 0);
  objc_storeStrong((id *)&self->_wasWristTemperatureInputDelivered, 0);
  objc_storeStrong((id *)&self->_heartRateInputDeliveryCountryCode, 0);
  objc_storeStrong((id *)&self->_wasDeviationDetectionDelivered, 0);
  objc_storeStrong((id *)&self->_wasHeartRateInputDelivered, 0);
  objc_storeStrong((id *)&self->_hasSameAlgorithmVersionOnPairedWatch, 0);
  objc_storeStrong((id *)&self->_hasCompatiblePairedAppleWatch, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboarded, 0);
  objc_storeStrong((id *)&self->_onboardedVersion, 0);
  objc_storeStrong((id *)&self->_onboardingCompleted, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end