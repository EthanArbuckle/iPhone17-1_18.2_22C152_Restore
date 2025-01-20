@interface HKMCSettingsManager
- (BOOL)_areAlgorithmAttributesOnPhone:(unint64_t)a3 aheadOfAlgorithmAttributesOnWatch:(unint64_t)a4;
- (BOOL)algorithmVersionMismatchOnWatch;
- (BOOL)areAllFertileWindowPredictionAlgorithmAttributesSupported;
- (BOOL)areAllMenstruationPredictionAlgorithmAttributesSupported;
- (BOOL)deviationDetectionEnabledForType:(int64_t)a3;
- (BOOL)deviationDetectionEnabledSetExplicitlyForAnyType;
- (BOOL)fertileWindowNotificationsEnabled;
- (BOOL)fertileWindowProjectionNotificationsEnabledAndSupported;
- (BOOL)fertileWindowProjectionsDisabledOnWatchForVersionMismatch;
- (BOOL)fertileWindowProjectionsEnabled;
- (BOOL)fertileWindowProjectionsEnabledAndSupported;
- (BOOL)heartRateBasedProjectionsEnabled;
- (BOOL)hiddenForDisplayTypeIdentifier:(id)a3;
- (BOOL)internalCycleFactorsOverrideEnabled;
- (BOOL)internalIgnoreOvulationTestResultsEnabled;
- (BOOL)menstruationNotificationsEnabled;
- (BOOL)menstruationProjectionNotificationsEnabledAndSupported;
- (BOOL)menstruationProjectionsDisabledOnWatchForVersionMismatch;
- (BOOL)menstruationProjectionsEnabled;
- (BOOL)menstruationProjectionsEnabledAndSupported;
- (BOOL)someNotificationsEnabled;
- (BOOL)someNotificationsEnabledAndSupported;
- (BOOL)wristTemperatureBasedProjectionsEnabled;
- (HKMCSettingsManager)init;
- (HKMCSettingsManager)initWithObservationEnabled:(BOOL)a3;
- (HKMCSettingsManager)initWithUserDefaults:(id)a3;
- (HKMCSettingsManager)initWithUserDefaults:(id)a3 observationEnabled:(BOOL)a4;
- (NSDate)cycleTrackingOnboardingTileDismissedDate;
- (NSDateComponents)fertileWindowNotificationTimeOfDay;
- (NSDateComponents)menstruationNotificationTimeOfDay;
- (NSString)localizedTextForVersionMismatchAndDisabledProjections;
- (NSString)localizedTextForVersionMismatchAndDisabledProjectionsFromAlgorithmAttributes;
- (NSUserDefaults)userDefaults;
- (id)_historicalAnalyzerNumericalOverrideAtIndex:(int64_t)a3 forCycleAtReverseChronologicalIndex:(int64_t)a4 description:(id)a5;
- (id)_localizedTextForVersionMismatchFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7;
- (id)dayStreamProcessorPredictionPrimarySourceOverride;
- (id)historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3;
- (id)historicalAnalyzerOverridesForCycleAtReverseChronologicalIndex:(int64_t)a3;
- (id)historicalAnalyzerOverridesForCycles;
- (id)historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3;
- (id)historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3;
- (int64_t)cycleLengthModificationDayIndexOverriding:(int64_t)a3;
- (int64_t)dayStreamProcessorAlgorithmVersion;
- (int64_t)periodLengthModificationDayIndexOverriding:(int64_t)a3;
- (unint64_t)fertileWindowProjectionsAlgorithmAttributesPhone;
- (unint64_t)fertileWindowProjectionsAlgorithmAttributesWatch;
- (unint64_t)menstruationProjectionsAlgorithmAttributesPhone;
- (unint64_t)menstruationProjectionsAlgorithmAttributesWatch;
- (void)_algorithmVersionMismatchSettingsDidUpdate;
- (void)_analysisSettingsDidUpdate;
- (void)_hiddenDisplayTypesDidUpdate;
- (void)_notificationSettingsDidUpdate;
- (void)_setFertileWindowProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:(unint64_t)a3;
- (void)_setMenstruationProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:(unint64_t)a3;
- (void)_setTestDefaults:(id)a3;
- (void)_startObservingDefaults;
- (void)_startObservingNPSNotifications;
- (void)_stopObservingAllDefaults;
- (void)_stopObservingNPSNotifications;
- (void)_unitTest_setAlgorithmVersionMismatchOnWatchOverride:(id)a3;
- (void)_unitTest_setWatchFertileWindowPredictionAlgorithmAttributesSupportedOverride:(id)a3;
- (void)_unitTest_setWatchMenstruationPredictionAlgorithmAttributesSupportedOverride:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)fertileWindowNotificationTimeOfDay;
- (void)forceDisableProjectionsFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7;
- (void)heartRateBasedProjectionsEnabled;
- (void)menstruationNotificationTimeOfDay;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)resetAllSettings;
- (void)setCycleTrackingOnboardingTileDismissedDate:(id)a3;
- (void)setDeviationDetectionEnabled:(BOOL)a3 forType:(int64_t)a4;
- (void)setFertileWindowNotificationTimeOfDay:(id)a3;
- (void)setFertileWindowNotificationsEnabled:(BOOL)a3;
- (void)setFertileWindowProjectionsAlgorithmAttributesPhone:(unint64_t)a3;
- (void)setFertileWindowProjectionsAlgorithmAttributesWatch:(unint64_t)a3;
- (void)setFertileWindowProjectionsDisabledOnWatchForVersionMismatch:(BOOL)a3;
- (void)setFertileWindowProjectionsEnabled:(BOOL)a3;
- (void)setFertilityTrackingDisplayTypesHidden:(BOOL)a3;
- (void)setHeartRateBasedProjectionsEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3 forDisplayTypeIdentifier:(id)a4;
- (void)setHidden:(BOOL)a3 forDisplayTypeIdentifiers:(id)a4;
- (void)setInternalCycleFactorsOverrideEnabled:(BOOL)a3;
- (void)setInternalIgnoreOvulationTestResultsEnabled:(BOOL)a3;
- (void)setLocalizedTextForVersionMismatchAndDisabledProjections:(id)a3;
- (void)setMenstruationNotificationTimeOfDay:(id)a3;
- (void)setMenstruationNotificationsEnabled:(BOOL)a3;
- (void)setMenstruationProjectionsAlgorithmAttributesPhone:(unint64_t)a3;
- (void)setMenstruationProjectionsAlgorithmAttributesWatch:(unint64_t)a3;
- (void)setMenstruationProjectionsDisabledOnWatchForVersionMismatch:(BOOL)a3;
- (void)setMenstruationProjectionsEnabled:(BOOL)a3;
- (void)setMenstruationTrackingDisplayTypesHidden:(BOOL)a3;
- (void)setProjectionAttributesOnWatchFromUseHeartRateInput:(BOOL)a3 useWristTemperatureInput:(BOOL)a4;
- (void)setWristTemperatureBasedProjectionsEnabled:(BOOL)a3;
- (void)wristTemperatureBasedProjectionsEnabled;
@end

@implementation HKMCSettingsManager

- (int64_t)periodLengthModificationDayIndexOverriding:(int64_t)a3
{
  v5 = [MEMORY[0x263F0A980] sharedBehavior];
  int v6 = [v5 isAppleInternalInstall];

  if (v6)
  {
    v7 = [(HKMCSettingsManager *)self userDefaults];
    a3 = objc_msgSend(v7, "hkmc_integerForKey:defaultValue:", @"PeriodLengthModificationDayOverride", a3);
  }
  return a3;
}

- (int64_t)cycleLengthModificationDayIndexOverriding:(int64_t)a3
{
  v5 = [MEMORY[0x263F0A980] sharedBehavior];
  int v6 = [v5 isAppleInternalInstall];

  if (v6)
  {
    v7 = [(HKMCSettingsManager *)self userDefaults];
    a3 = objc_msgSend(v7, "hkmc_integerForKey:defaultValue:", @"CycleLengthModificationDayOverride", a3);
  }
  return a3;
}

- (id)historicalAnalyzerOverridesForCycles
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    v5 = [(HKMCSettingsManager *)self userDefaults];
    int v6 = objc_msgSend(v5, "hk_safeArrayIfExistsForKeyPath:error:", @"HistoricalCyclesPredictionPrimarySource", 0);
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)historicalAnalyzerOverridesForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  int v4 = [(HKMCSettingsManager *)self historicalAnalyzerOverridesForCycles];
  if ([v4 count] <= (unint64_t)a3)
  {
    int v6 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:a3];
    objc_opt_class();
    int v6 = HKSafeObject();
  }
  return v6;
}

- (id)_historicalAnalyzerNumericalOverrideAtIndex:(int64_t)a3 forCycleAtReverseChronologicalIndex:(int64_t)a4 description:(id)a5
{
  int v6 = [(HKMCSettingsManager *)self historicalAnalyzerOverridesForCycleAtReverseChronologicalIndex:a4];
  if ([v6 count] <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = [v6 objectAtIndexedSubscript:a3];
    if (objc_opt_respondsToSelector())
    {
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (id)historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  return [(HKMCSettingsManager *)self _historicalAnalyzerNumericalOverrideAtIndex:0 forCycleAtReverseChronologicalIndex:a3 description:@"historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex"];
}

- (id)historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  return [(HKMCSettingsManager *)self _historicalAnalyzerNumericalOverrideAtIndex:1 forCycleAtReverseChronologicalIndex:a3 description:@"historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex"];
}

- (id)historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex:(int64_t)a3
{
  return [(HKMCSettingsManager *)self _historicalAnalyzerNumericalOverrideAtIndex:2 forCycleAtReverseChronologicalIndex:a3 description:@"historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex"];
}

- (id)dayStreamProcessorPredictionPrimarySourceOverride
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    v5 = [(HKMCSettingsManager *)self userDefaults];
    int v6 = objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", @"OngoingCyclePredictionPrimarySource", 0);
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (int64_t)dayStreamProcessorAlgorithmVersion
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4
    && ([(HKMCSettingsManager *)self userDefaults],
        v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", @"MenstrualAlgorithmsDayStreamProcessorAlgorithmVersion", 0), int v6 = objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    int64_t v7 = [v6 integerValue];

    return v7;
  }
  else
  {
    return HKHAMenstrualAlgorithmsDayStreamProcessorAlgorithmVersion();
  }
}

- (BOOL)menstruationProjectionsEnabledAndSupported
{
  BOOL v3 = [(HKMCSettingsManager *)self menstruationProjectionsEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(HKMCSettingsManager *)self areAllMenstruationPredictionAlgorithmAttributesSupported];
  }
  return v3;
}

- (BOOL)fertileWindowProjectionsEnabledAndSupported
{
  BOOL v3 = [(HKMCSettingsManager *)self fertileWindowProjectionsEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(HKMCSettingsManager *)self areAllFertileWindowPredictionAlgorithmAttributesSupported];
  }
  return v3;
}

- (BOOL)someNotificationsEnabled
{
  if ([(HKMCSettingsManager *)self menstruationNotificationsEnabled]) {
    return 1;
  }
  return [(HKMCSettingsManager *)self fertileWindowNotificationsEnabled];
}

- (BOOL)someNotificationsEnabledAndSupported
{
  if ([(HKMCSettingsManager *)self menstruationProjectionNotificationsEnabledAndSupported])
  {
    return 1;
  }
  return [(HKMCSettingsManager *)self fertileWindowProjectionNotificationsEnabledAndSupported];
}

- (BOOL)menstruationProjectionNotificationsEnabledAndSupported
{
  BOOL v3 = [(HKMCSettingsManager *)self menstruationNotificationsEnabled];
  if (v3)
  {
    BOOL v4 = [(HKMCSettingsManager *)self areAllMenstruationPredictionAlgorithmAttributesSupported];
    LOBYTE(v3) = v4 & ![(HKMCSettingsManager *)self algorithmVersionMismatchOnWatch];
  }
  return v3;
}

- (BOOL)fertileWindowProjectionNotificationsEnabledAndSupported
{
  BOOL v3 = [(HKMCSettingsManager *)self fertileWindowNotificationsEnabled];
  if (v3)
  {
    BOOL v4 = [(HKMCSettingsManager *)self areAllFertileWindowPredictionAlgorithmAttributesSupported];
    LOBYTE(v3) = v4 & ![(HKMCSettingsManager *)self algorithmVersionMismatchOnWatch];
  }
  return v3;
}

- (BOOL)areAllMenstruationPredictionAlgorithmAttributesSupported
{
  BOOL v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4) {
    return ![(HKMCSettingsManager *)self _areAlgorithmAttributesOnPhone:[(HKMCSettingsManager *)self menstruationProjectionsAlgorithmAttributesPhone] aheadOfAlgorithmAttributesOnWatch:[(HKMCSettingsManager *)self menstruationProjectionsAlgorithmAttributesWatch]];
  }
  else {
    return 1;
  }
}

- (BOOL)_areAlgorithmAttributesOnPhone:(unint64_t)a3 aheadOfAlgorithmAttributesOnWatch:(unint64_t)a4
{
  return a3 > a4;
}

- (BOOL)areAllFertileWindowPredictionAlgorithmAttributesSupported
{
  BOOL v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4) {
    return ![(HKMCSettingsManager *)self _areAlgorithmAttributesOnPhone:[(HKMCSettingsManager *)self fertileWindowProjectionsAlgorithmAttributesPhone] aheadOfAlgorithmAttributesOnWatch:[(HKMCSettingsManager *)self fertileWindowProjectionsAlgorithmAttributesWatch]];
  }
  else {
    return 1;
  }
}

- (NSString)localizedTextForVersionMismatchAndDisabledProjectionsFromAlgorithmAttributes
{
  if ([(HKMCSettingsManager *)self areAllMenstruationPredictionAlgorithmAttributesSupported]&& [(HKMCSettingsManager *)self areAllFertileWindowPredictionAlgorithmAttributesSupported])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(HKMCSettingsManager *)self localizedTextForVersionMismatchAndDisabledProjections];
  }
  return (NSString *)v3;
}

- (void)setProjectionAttributesOnWatchFromUseHeartRateInput:(BOOL)a3 useWristTemperatureInput:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int64_t v7 = [MEMORY[0x263F0A980] sharedBehavior];
  char v8 = [v7 isAppleWatch];

  if (v8)
  {
    uint64_t v9 = 3;
    if (!v5) {
      uint64_t v9 = 1;
    }
    if (v4) {
      uint64_t v10 = v9 | 4;
    }
    else {
      uint64_t v10 = v9;
    }
    [(HKMCSettingsManager *)self setFertileWindowProjectionsAlgorithmAttributesWatch:v10];
    [(HKMCSettingsManager *)self setMenstruationProjectionsAlgorithmAttributesWatch:v10];
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_FAULT)) {
      -[HKMCSettingsManager(Support) setProjectionAttributesOnWatchFromUseHeartRateInput:useWristTemperatureInput:](v11);
    }
  }
}

- (void)_setMenstruationProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:(unint64_t)a3
{
  [(HKMCSettingsManager *)self setMenstruationProjectionsDisabledOnWatchForVersionMismatch:a3 != 0];
  [(HKMCSettingsManager *)self setMenstruationProjectionsAlgorithmAttributesPhone:a3];
}

- (void)_setFertileWindowProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:(unint64_t)a3
{
  [(HKMCSettingsManager *)self setFertileWindowProjectionsDisabledOnWatchForVersionMismatch:a3 != 0];
  [(HKMCSettingsManager *)self setFertileWindowProjectionsAlgorithmAttributesPhone:a3];
}

- (void)forceDisableProjectionsFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v13 = HKMCForceDisablePeriodProjectionsFromCycleFactorSamples(v12);
  unsigned int v14 = HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples(v12);
  uint64_t v15 = v14;
  uint64_t v16 = v13 | 2;
  if (v8) {
    uint64_t v15 = v14 | 2;
  }
  else {
    uint64_t v16 = v13;
  }
  if (v7) {
    uint64_t v17 = v15 | 4;
  }
  else {
    uint64_t v17 = v15;
  }
  if (v7) {
    uint64_t v18 = v16 | 4;
  }
  else {
    uint64_t v18 = v16;
  }
  [(HKMCSettingsManager *)self _setMenstruationProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:v18];
  [(HKMCSettingsManager *)self _setFertileWindowProjectionsDisabledOnWatchForVersionMismatchFromAlgorithmAttributes:v17];
  id v19 = [(HKMCSettingsManager *)self _localizedTextForVersionMismatchFromOngoingCycleFactors:v12 menstruationProjectionsEnabled:v10 fertileWindowProjectionsEnabled:v9 useHeartRateInput:v8 useWristTemperatureInput:v7];

  [(HKMCSettingsManager *)self setLocalizedTextForVersionMismatchAndDisabledProjections:v19];
}

- (id)_localizedTextForVersionMismatchFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v11 = a3;
  int v12 = HKMCAlgorithmSuppressPeriodPredictionsFromCycleFactorSamples(v11);
  char v13 = HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples(v11);
  int v14 = HKMCForceDisablePeriodProjectionsFromCycleFactorSamples(v11);

  if (!v10 || v12) {
    char v15 = !a5 | v13;
  }
  else {
    char v15 = 0;
  }
  uint64_t v16 = 0;
  if ((v15 & 1) == 0 && (v8 || v7) | v14 & (v12 ^ 1))
  {
    uint64_t v16 = HKMCLocalizedString(@"PROJECTIONS_DISABLED_FOR_VERSION_MISMATCH");
  }
  return v16;
}

- (HKMCSettingsManager)init
{
  BOOL v3 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults");
  BOOL v4 = [(HKMCSettingsManager *)self initWithUserDefaults:v3 observationEnabled:1];

  return v4;
}

- (HKMCSettingsManager)initWithObservationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults");
  int v6 = [(HKMCSettingsManager *)self initWithUserDefaults:v5 observationEnabled:v3];

  return v6;
}

- (HKMCSettingsManager)initWithUserDefaults:(id)a3
{
  return [(HKMCSettingsManager *)self initWithUserDefaults:a3 observationEnabled:1];
}

- (HKMCSettingsManager)initWithUserDefaults:(id)a3 observationEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKMCSettingsManager;
  BOOL v8 = [(HKMCSettingsManager *)&v22 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDefaults, a3);
    v9->_observationEnabled = v4;
    id v10 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v11 = [v10 initWithName:@"HKMCSettingsManagerObservers" loggingCategory:*MEMORY[0x263F09930]];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v11;

    char v13 = _AnalysisSettingKeys();
    int v14 = _NotificationSettingKeys();
    char v15 = [v13 arrayByAddingObjectsFromArray:v14];
    uint64_t v16 = _HiddenDisplayTypeSettingKeys();
    uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v16];
    uint64_t v18 = _AlgorithmVersionMismatchSettingKeys();
    uint64_t v19 = [v17 arrayByAddingObjectsFromArray:v18];
    allSettingsToObserve = v9->_allSettingsToObserve;
    v9->_allSettingsToObserve = (NSArray *)v19;

    if (v4)
    {
      [(HKMCSettingsManager *)v9 _startObservingDefaults];
      [(HKMCSettingsManager *)v9 _startObservingNPSNotifications];
    }
  }

  return v9;
}

- (void)dealloc
{
  if (self->_observationEnabled)
  {
    [(HKMCSettingsManager *)self _stopObservingAllDefaults];
    [(HKMCSettingsManager *)self _stopObservingNPSNotifications];
  }
  v3.receiver = self;
  v3.super_class = (Class)HKMCSettingsManager;
  [(HKMCSettingsManager *)&v3 dealloc];
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_hiddenDisplayTypesDidUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__HKMCSettingsManager__hiddenDisplayTypesDidUpdate__block_invoke;
  v3[3] = &unk_2646E9B68;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __51__HKMCSettingsManager__hiddenDisplayTypesDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settingsManagerDidUpdateHiddenDisplayTypes:*(void *)(a1 + 32)];
  }
}

- (void)_analysisSettingsDidUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__HKMCSettingsManager__analysisSettingsDidUpdate__block_invoke;
  v3[3] = &unk_2646E9B68;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __49__HKMCSettingsManager__analysisSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settingsManagerDidUpdateAnalysisSettings:*(void *)(a1 + 32)];
  }
}

- (void)_notificationSettingsDidUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__HKMCSettingsManager__notificationSettingsDidUpdate__block_invoke;
  v3[3] = &unk_2646E9B68;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __53__HKMCSettingsManager__notificationSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settingsManagerDidUpdateNotificationSettings:*(void *)(a1 + 32)];
  }
}

- (void)_algorithmVersionMismatchSettingsDidUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__HKMCSettingsManager__algorithmVersionMismatchSettingsDidUpdate__block_invoke;
  v3[3] = &unk_2646E9B68;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __65__HKMCSettingsManager__algorithmVersionMismatchSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settingsManagerDidUpdateAlgorithmVersionMismatchSettings:*(void *)(a1 + 32)];
  }
}

- (void)_startObservingDefaults
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_allSettingsToObserve;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v8 + 1) + 8 * v7++), 3, 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_stopObservingAllDefaults
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_allSettingsToObserve;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  long long v10 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = v10;
    int v12 = objc_opt_class();
    uint64_t v13 = *MEMORY[0x263F081C8];
    id v14 = v12;
    char v15 = [v9 objectForKeyedSubscript:v13];
    uint64_t v16 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    int v25 = 138544130;
    v26 = v12;
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    v30 = v15;
    __int16 v31 = 2114;
    v32 = v16;
    _os_log_impl(&dword_2249E9000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", (uint8_t *)&v25, 0x2Au);
  }
  uint64_t v17 = _AnalysisSettingKeys();
  int v18 = [v17 containsObject:v8];

  if (v18) {
    [(HKMCSettingsManager *)self _analysisSettingsDidUpdate];
  }
  uint64_t v19 = _NotificationSettingKeys();
  int v20 = [v19 containsObject:v8];

  if (v20) {
    [(HKMCSettingsManager *)self _notificationSettingsDidUpdate];
  }
  v21 = _HiddenDisplayTypeSettingKeys();
  int v22 = [v21 containsObject:v8];

  if (v22) {
    [(HKMCSettingsManager *)self _hiddenDisplayTypesDidUpdate];
  }
  v23 = _AlgorithmVersionMismatchSettingKeys();
  int v24 = [v23 containsObject:v8];

  if (v24) {
    [(HKMCSettingsManager *)self _algorithmVersionMismatchSettingsDidUpdate];
  }
}

- (void)_startObservingNPSNotifications
{
  objc_initWeak(&location, self);
  self->_notificationSettingsNotifyToken = -1;
  id v3 = (const char *)[@"HKMCNotificationSettingsDidUpdate" UTF8String];
  uint64_t v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke;
  handler[3] = &unk_2646E9B90;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_notificationSettingsNotifyToken, v4, handler);

  self->_algorithmVersionMismatchSettingsNotifyToken = -1;
  uint64_t v6 = (const char *)[@"HKMCAlgorithmVersionMismatchSettingsDidUpdate" UTF8String];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke_2;
  v7[3] = &unk_2646E9B90;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v6, &self->_algorithmVersionMismatchSettingsNotifyToken, MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notificationSettingsDidUpdate];
}

void __54__HKMCSettingsManager__startObservingNPSNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _algorithmVersionMismatchSettingsDidUpdate];
}

- (void)_stopObservingNPSNotifications
{
  int notificationSettingsNotifyToken = self->_notificationSettingsNotifyToken;
  if (notificationSettingsNotifyToken != -1) {
    notify_cancel(notificationSettingsNotifyToken);
  }
  int algorithmVersionMismatchSettingsNotifyToken = self->_algorithmVersionMismatchSettingsNotifyToken;
  if (algorithmVersionMismatchSettingsNotifyToken != -1)
  {
    notify_cancel(algorithmVersionMismatchSettingsNotifyToken);
  }
}

- (void)_setTestDefaults:(id)a3
{
  uint64_t v4 = (NSUserDefaults *)a3;
  [(HKMCSettingsManager *)self _stopObservingAllDefaults];
  userDefaults = self->_userDefaults;
  self->_userDefaults = v4;

  [(HKMCSettingsManager *)self _startObservingDefaults];
}

- (void)_unitTest_setAlgorithmVersionMismatchOnWatchOverride:(id)a3
{
}

- (void)_unitTest_setWatchMenstruationPredictionAlgorithmAttributesSupportedOverride:(id)a3
{
}

- (void)_unitTest_setWatchFertileWindowPredictionAlgorithmAttributesSupportedOverride:(id)a3
{
}

- (unint64_t)menstruationProjectionsAlgorithmAttributesWatch
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported)
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      *(_DWORD *)uint64_t v7 = 138543362;
      *(void *)&void v7[4] = objc_opt_class();
      id v5 = *(id *)&v7[4];
      _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding -watchMenstruationPredictionWatchAlgorithmAttributesSupported", v7, 0xCu);
    }
    return [(NSNumber *)self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported unsignedIntegerValue];
  }
  else
  {
    unint64_t result = [(NSUserDefaults *)self->_userDefaults integerForKey:@"MenstruationProjectionsAlgorithmAttributesWatch"];
    if (!result) {
      return 7;
    }
  }
  return result;
}

- (void)setMenstruationProjectionsAlgorithmAttributesWatch:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithUnsignedInteger:a3];
    int v11 = 138543618;
    int v12 = v7;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation projections algorithm attributes on watch: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setInteger:a3 forKey:@"MenstruationProjectionsAlgorithmAttributesWatch"];
}

- (unint64_t)fertileWindowProjectionsAlgorithmAttributesWatch
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported)
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      *(_DWORD *)uint64_t v7 = 138543362;
      *(void *)&void v7[4] = objc_opt_class();
      id v5 = *(id *)&v7[4];
      _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding -watchFertileWindowPredictionAlgorithmAttributesSupported", v7, 0xCu);
    }
    return [(NSNumber *)self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported unsignedIntegerValue];
  }
  else
  {
    unint64_t result = [(NSUserDefaults *)self->_userDefaults integerForKey:@"FertileWindowProjectionsAlgorithmAttributesWatch"];
    if (!result) {
      return 7;
    }
  }
  return result;
}

- (void)setFertileWindowProjectionsAlgorithmAttributesWatch:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithUnsignedInteger:a3];
    int v11 = 138543618;
    int v12 = v7;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window projections algorithm attributes on watch: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setInteger:a3 forKey:@"FertileWindowProjectionsAlgorithmAttributesWatch"];
}

- (BOOL)algorithmVersionMismatchOnWatch
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_unitTest_algorithmVersionMismatchOnWatch)
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      *(_DWORD *)uint64_t v17 = 138543362;
      *(void *)&v17[4] = objc_opt_class();
      id v5 = *(id *)&v17[4];
      _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding -algorithmVersionMismatchOnWatch", v17, 0xCu);
    }
    return [(NSNumber *)self->_unitTest_algorithmVersionMismatchOnWatch BOOLValue];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F0A980] sharedBehavior];
    int v8 = [v7 isAppleWatch];

    if (v8)
    {
      id v9 = [MEMORY[0x263F57730] sharedInstance];
      id v10 = [v9 getActivePairedDevice];
      int v11 = HKMCIsAlgorithmsVersionSameOnPairedDevice(v10);

      _HKInitializeLogging();
      int v12 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = v12;
        id v14 = objc_opt_class();
        uint64_t v15 = @"NO";
        if (v11) {
          uint64_t v15 = @"YES";
        }
        *(_DWORD *)uint64_t v17 = 138543618;
        *(void *)&v17[4] = v14;
        *(_WORD *)&v17[12] = 2114;
        *(void *)&v17[14] = v15;
        id v16 = v14;
        _os_log_impl(&dword_2249E9000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Algorithm version same on paired device: %{public}@", v17, 0x16u);
      }
      return v11 ^ 1;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)menstruationProjectionsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"MenstruationProjectionsEnabled"];
}

- (void)setMenstruationProjectionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)__int16 v13 = 138543618;
    *(void *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(void *)&v13[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation predictions enabled: %{public}@", v13, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"MenstruationProjectionsEnabled", *(_OWORD *)v13, *(void *)&v13[16], v14 forKey];
  id v10 = [MEMORY[0x263F0A980] sharedBehavior];
  char v11 = [v10 isAppleWatch];

  if ((v11 & 1) == 0)
  {
    int v12 = [MEMORY[0x263EFFA08] setWithObject:@"MenstruationProjectionsEnabled"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)fertileWindowProjectionsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"FertileWindowProjectionsEnabled"];
}

- (void)setFertileWindowProjectionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)__int16 v13 = 138543618;
    *(void *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(void *)&v13[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window predictions enabled: %{public}@", v13, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"FertileWindowProjectionsEnabled", *(_OWORD *)v13, *(void *)&v13[16], v14 forKey];
  id v10 = [MEMORY[0x263F0A980] sharedBehavior];
  char v11 = [v10 isAppleWatch];

  if ((v11 & 1) == 0)
  {
    int v12 = [MEMORY[0x263EFFA08] setWithObject:@"FertileWindowProjectionsEnabled"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)menstruationProjectionsDisabledOnWatchForVersionMismatch
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"MenstruationProjectionsDisabledForVersionMismatch"];
}

- (void)setMenstruationProjectionsDisabledOnWatchForVersionMismatch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)__int16 v13 = 138543618;
    *(void *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(void *)&v13[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation predictions force disabled: %{public}@", v13, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"MenstruationProjectionsDisabledForVersionMismatch", *(_OWORD *)v13, *(void *)&v13[16], v14 forKey];
  id v10 = [MEMORY[0x263F0A980] sharedBehavior];
  char v11 = [v10 isAppleWatch];

  if ((v11 & 1) == 0)
  {
    int v12 = [MEMORY[0x263EFFA08] setWithObject:@"MenstruationProjectionsDisabledForVersionMismatch"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)fertileWindowProjectionsDisabledOnWatchForVersionMismatch
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"FertileWindowProjectionsDisabledForVersionMismatch"];
}

- (void)setFertileWindowProjectionsDisabledOnWatchForVersionMismatch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)__int16 v13 = 138543618;
    *(void *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(void *)&v13[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window predictions force disabled: %{public}@", v13, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"FertileWindowProjectionsDisabledForVersionMismatch", *(_OWORD *)v13, *(void *)&v13[16], v14 forKey];
  id v10 = [MEMORY[0x263F0A980] sharedBehavior];
  char v11 = [v10 isAppleWatch];

  if ((v11 & 1) == 0)
  {
    int v12 = [MEMORY[0x263EFFA08] setWithObject:@"FertileWindowProjectionsDisabledForVersionMismatch"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (NSString)localizedTextForVersionMismatchAndDisabledProjections
{
  return [(NSUserDefaults *)self->_userDefaults stringForKey:@"LocalizedTextForVersionMismatchAndDisabledProjections"];
}

- (void)setLocalizedTextForVersionMismatchAndDisabledProjections:(id)a3
{
  [(NSUserDefaults *)self->_userDefaults setObject:a3 forKey:@"LocalizedTextForVersionMismatchAndDisabledProjections"];
  BOOL v3 = [MEMORY[0x263F0A980] sharedBehavior];
  char v4 = [v3 isAppleWatch];

  if ((v4 & 1) == 0)
  {
    id v5 = [MEMORY[0x263EFFA08] setWithObject:@"LocalizedTextForVersionMismatchAndDisabledProjections"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)heartRateBasedProjectionsEnabled
{
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HKMCSettingsManager heartRateBasedProjectionsEnabled](v3);
  }
  return [(NSUserDefaults *)self->_userDefaults hk_BOOLForKey:@"SensorBasedProjectionsEnabled" defaultValue:1];
}

- (void)setHeartRateBasedProjectionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HKMCSettingsManager heartRateBasedProjectionsEnabled](v5);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"SensorBasedProjectionsEnabled"];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:@"SensorBasedProjectionsEnabled"];
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (BOOL)wristTemperatureBasedProjectionsEnabled
{
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HKMCSettingsManager wristTemperatureBasedProjectionsEnabled](v3);
  }
  return [(NSUserDefaults *)self->_userDefaults hk_BOOLForKey:@"WristTemperatureBasedProjectionsEnabled" defaultValue:1];
}

- (void)setWristTemperatureBasedProjectionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HKMCSettingsManager wristTemperatureBasedProjectionsEnabled](v5);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"WristTemperatureBasedProjectionsEnabled"];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:@"WristTemperatureBasedProjectionsEnabled"];
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (BOOL)internalCycleFactorsOverrideEnabled
{
  return [(NSUserDefaults *)self->_userDefaults hk_BOOLForKey:@"InternalCycleFactorsOverrideEnabled" defaultValue:0];
}

- (void)setInternalCycleFactorsOverrideEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)int v12 = 138543618;
    *(void *)&v12[4] = v7;
    *(_WORD *)&v12[12] = 2114;
    *(void *)&v12[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set internal cycle factors override enabled: %{public}@", v12, 0x16u);
  }
  userDefaults = self->_userDefaults;
  if (v3) {
    [(NSUserDefaults *)userDefaults setBool:1 forKey:@"InternalCycleFactorsOverrideEnabled"];
  }
  else {
    [(NSUserDefaults *)userDefaults removeObjectForKey:@"InternalCycleFactorsOverrideEnabled"];
  }
  char v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", @"InternalCycleFactorsOverrideEnabled", *(_OWORD *)v12, *(void *)&v12[16], v13);
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (BOOL)internalIgnoreOvulationTestResultsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults hk_BOOLForKey:@"InternalIgnoreOvulationTestResultsEnabled" defaultValue:0];
}

- (void)setInternalIgnoreOvulationTestResultsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)int v12 = 138543618;
    *(void *)&v12[4] = v7;
    *(_WORD *)&v12[12] = 2114;
    *(void *)&v12[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set internal ignore ovulation test results enabled: %{public}@", v12, 0x16u);
  }
  userDefaults = self->_userDefaults;
  if (v3) {
    [(NSUserDefaults *)userDefaults setBool:1 forKey:@"InternalIgnoreOvulationTestResultsEnabled"];
  }
  else {
    [(NSUserDefaults *)userDefaults removeObjectForKey:@"InternalIgnoreOvulationTestResultsEnabled"];
  }
  char v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", @"InternalIgnoreOvulationTestResultsEnabled", *(_OWORD *)v12, *(void *)&v12[16], v13);
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (unint64_t)menstruationProjectionsAlgorithmAttributesPhone
{
  return [(NSUserDefaults *)self->_userDefaults integerForKey:@"MenstruationProjectionsAlgorithmAttributesPhone"];
}

- (void)setMenstruationProjectionsAlgorithmAttributesPhone:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithUnsignedInteger:a3];
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation projections algorithm attributes: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setInteger:a3 forKey:@"MenstruationProjectionsAlgorithmAttributesPhone"];
  char v11 = [MEMORY[0x263F0A980] sharedBehavior];
  char v12 = [v11 isAppleWatch];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263EFFA08] setWithObject:@"MenstruationProjectionsAlgorithmAttributesPhone"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (unint64_t)fertileWindowProjectionsAlgorithmAttributesPhone
{
  return [(NSUserDefaults *)self->_userDefaults integerForKey:@"FertileWindowProjectionsAlgorithmAttributesPhone"];
}

- (void)setFertileWindowProjectionsAlgorithmAttributesPhone:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithUnsignedInteger:a3];
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window projections algorithm attributes: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setInteger:a3 forKey:@"FertileWindowProjectionsAlgorithmAttributesPhone"];
  char v11 = [MEMORY[0x263F0A980] sharedBehavior];
  char v12 = [v11 isAppleWatch];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263EFFA08] setWithObject:@"FertileWindowProjectionsAlgorithmAttributesPhone"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)menstruationNotificationsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"MenstruationNotificationsEnabled"];
}

- (void)setMenstruationNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = @"NO";
    if (v3) {
      int v8 = @"YES";
    }
    *(_DWORD *)uint64_t v13 = 138543618;
    *(void *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(void *)&v13[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set menstruation notifications enabled: %{public}@", v13, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"MenstruationNotificationsEnabled", *(_OWORD *)v13, *(void *)&v13[16], v14 forKey];
  id v10 = [MEMORY[0x263F0A980] sharedBehavior];
  char v11 = [v10 isAppleWatch];

  if ((v11 & 1) == 0)
  {
    char v12 = [MEMORY[0x263EFFA08] setWithObject:@"MenstruationNotificationsEnabled"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (NSDateComponents)menstruationNotificationTimeOfDay
{
  BOOL v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4
    && (id v5 = (void *)MEMORY[0x263F08928],
        uint64_t v6 = objc_opt_class(),
        [(NSUserDefaults *)self->_userDefaults dataForKey:@"MenstruationNotificationTimeOfDay"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v5 unarchivedObjectOfClass:v6 fromData:v7 error:0],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HKMCSettingsManager menstruationNotificationTimeOfDay](v9);
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
    id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    [v8 setCalendar:v10];

    [v8 setHour:20];
  }
  return (NSDateComponents *)v8;
}

- (void)setMenstruationNotificationTimeOfDay:(id)a3
{
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:");
  int v4 = [MEMORY[0x263F0A980] sharedBehavior];
  char v5 = [v4 isAppleWatch];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:@"MenstruationNotificationTimeOfDay"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)fertileWindowNotificationsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"FertileWindowNotificationsEnabled"];
}

- (void)setFertileWindowNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  char v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    *(_DWORD *)uint64_t v13 = 138543618;
    *(void *)&v13[4] = v7;
    *(_WORD *)&v13[12] = 2114;
    *(void *)&v13[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set fertile window notifications enabled: %{public}@", v13, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"FertileWindowNotificationsEnabled", *(_OWORD *)v13, *(void *)&v13[16], v14 forKey];
  id v10 = [MEMORY[0x263F0A980] sharedBehavior];
  char v11 = [v10 isAppleWatch];

  if ((v11 & 1) == 0)
  {
    char v12 = [MEMORY[0x263EFFA08] setWithObject:@"FertileWindowNotificationsEnabled"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (NSDateComponents)fertileWindowNotificationTimeOfDay
{
  BOOL v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4
    && (char v5 = (void *)MEMORY[0x263F08928],
        uint64_t v6 = objc_opt_class(),
        [(NSUserDefaults *)self->_userDefaults dataForKey:@"FertileWindowNotificationTimeOfDay"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v5 unarchivedObjectOfClass:v6 fromData:v7 error:0],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HKMCSettingsManager fertileWindowNotificationTimeOfDay](v9);
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
    id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    [v8 setCalendar:v10];

    [v8 setHour:20];
  }
  return (NSDateComponents *)v8;
}

- (void)setFertileWindowNotificationTimeOfDay:(id)a3
{
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:");
  int v4 = [MEMORY[0x263F0A980] sharedBehavior];
  char v5 = [v4 isAppleWatch];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:@"FertileWindowNotificationTimeOfDay"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (BOOL)deviationDetectionEnabledSetExplicitlyForAnyType
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"IrregularDeviationDetectionEnabled"];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"InfrequentDeviationDetectionEnabled"];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ProlongedDeviationDetectionEnabled"];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"SpottingDeviationDetectionEnabled"];
        BOOL v4 = v7 != 0;
      }
    }
  }
  return v4;
}

- (BOOL)deviationDetectionEnabledForType:(int64_t)a3
{
  userDefaults = self->_userDefaults;
  if ((unint64_t)(a3 - 1) > 2) {
    BOOL v4 = @"ProlongedDeviationDetectionEnabled";
  }
  else {
    BOOL v4 = off_2646E9BB0[a3 - 1];
  }
  return [(NSUserDefaults *)userDefaults hk_BOOLForKey:v4 defaultValue:1];
}

- (void)setDeviationDetectionEnabled:(BOOL)a3 forType:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = NSStringFromDeviationType(a4);
    char v12 = (void *)v11;
    uint64_t v13 = @"NO";
    *(_DWORD *)uint64_t v18 = 138543874;
    *(void *)&v18[4] = v9;
    *(_WORD *)&v18[12] = 2114;
    if (v5) {
      uint64_t v13 = @"YES";
    }
    *(void *)&v18[14] = v11;
    __int16 v19 = 2114;
    int v20 = v13;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@ deviation detection enabled: %{public}@", v18, 0x20u);
  }
  if ((unint64_t)(a4 - 1) > 2) {
    uint64_t v14 = @"ProlongedDeviationDetectionEnabled";
  }
  else {
    uint64_t v14 = off_2646E9BB0[a4 - 1];
  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v5, v14, *(_OWORD *)v18);
  uint64_t v15 = [MEMORY[0x263F0A980] sharedBehavior];
  char v16 = [v15 isAppleWatch];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = [MEMORY[0x263EFFA08] setWithObject:v14];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (NSDate)cycleTrackingOnboardingTileDismissedDate
{
  if ([(NSUserDefaults *)self->_userDefaults hk_keyExists:@"CycleTrackingOnboardingTileDismissedDate"])
  {
    BOOL v3 = (void *)MEMORY[0x263EFF910];
    [(NSUserDefaults *)self->_userDefaults doubleForKey:@"CycleTrackingOnboardingTileDismissedDate"];
    BOOL v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    BOOL v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)setCycleTrackingOnboardingTileDismissedDate:(id)a3
{
  userDefaults = self->_userDefaults;
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    -[NSUserDefaults setDouble:forKey:](userDefaults, "setDouble:forKey:", @"CycleTrackingOnboardingTileDismissedDate");
  }
  else
  {
    BOOL v4 = self->_userDefaults;
    [(NSUserDefaults *)v4 removeObjectForKey:@"CycleTrackingOnboardingTileDismissedDate"];
  }
}

- (void)setHidden:(BOOL)a3 forDisplayTypeIdentifiers:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = objc_opt_class();
    id v10 = @"NO";
    *(_DWORD *)buf = 138543874;
    v30 = v9;
    __int16 v31 = 2114;
    if (v4) {
      id v10 = @"YES";
    }
    v32 = v10;
    __int16 v33 = 2114;
    id v34 = v6;
    id v11 = v9;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set hidden = %{public}@ for display types: %{public}@", buf, 0x20u);
  }
  char v12 = [(NSUserDefaults *)self->_userDefaults dictionaryForKey:@"ShouldHideByDisplayTypeIdentifier"];
  id v13 = (id)[v12 mutableCopy];

  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
        int v20 = objc_msgSend(NSNumber, "numberWithBool:", v4, (void)v24);
        [v13 setObject:v20 forKeyedSubscript:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  [(NSUserDefaults *)self->_userDefaults setObject:v13 forKey:@"ShouldHideByDisplayTypeIdentifier"];
  uint64_t v21 = [MEMORY[0x263F0A980] sharedBehavior];
  char v22 = [v21 isAppleWatch];

  if ((v22 & 1) == 0)
  {
    v23 = [MEMORY[0x263EFFA08] setWithObject:@"ShouldHideByDisplayTypeIdentifier"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (void)setHidden:(BOOL)a3 forDisplayTypeIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = [v6 arrayWithObjects:&v9 count:1];

  -[HKMCSettingsManager setHidden:forDisplayTypeIdentifiers:](self, "setHidden:forDisplayTypeIdentifiers:", v4, v8, v9, v10);
}

- (void)setMenstruationTrackingDisplayTypesHidden:(BOOL)a3
{
  BOOL v3 = a3;
  _HKMCMenstruationDisplayTypeIdentifiers();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HKMCSettingsManager *)self setHidden:v3 forDisplayTypeIdentifiers:v5];
}

- (void)setFertilityTrackingDisplayTypesHidden:(BOOL)a3
{
  BOOL v3 = a3;
  _HKMCFertilityDisplayTypeIdentifiers();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HKMCSettingsManager *)self setHidden:v3 forDisplayTypeIdentifiers:v5];
}

- (BOOL)hiddenForDisplayTypeIdentifier:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  id v5 = [(NSUserDefaults *)self->_userDefaults dictionaryForKey:@"ShouldHideByDisplayTypeIdentifier"];
  id v6 = v5;
  if (@"DisplayTypeIdentifierMenstrualFlow" == v4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v7 = [v5 objectForKeyedSubscript:v4];

    if (v7)
    {
      id v8 = [v6 objectForKeyedSubscript:v4];
      LOBYTE(v7) = [v8 BOOLValue];
    }
  }

  return (char)v7;
}

- (void)resetAllSettings
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v23 = (id)objc_opt_class();
    id v5 = v23;
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reset all settings", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_allSettingsToObserve;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        char v12 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults", (void)v17);
        [v12 removeObjectForKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v13 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults");
  [v13 removeObjectForKey:@"CycleTrackingOnboardingTileDismissedDate"];

  id v14 = [MEMORY[0x263F0A980] sharedBehavior];
  char v15 = [v14 isAppleWatch];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:self->_allSettingsToObserve];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_unitTest_watchFertileWindowPredictionAlgorithmAttributesSupported, 0);
  objc_storeStrong((id *)&self->_unitTest_watchMenstruationPredictionAlgorithmAttributesSupported, 0);
  objc_storeStrong((id *)&self->_unitTest_algorithmVersionMismatchOnWatch, 0);
  objc_storeStrong((id *)&self->_allSettingsToObserve, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)heartRateBasedProjectionsEnabled
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = OUTLINED_FUNCTION_4_0(v3);
  OUTLINED_FUNCTION_0_1(&dword_2249E9000, v5, v6, "[%{public}@] -heartRateBasedProjectionsEnabled is deprecated. Please move to using HKFeatureSettingsKeyEnabled for HKFeatureIdentifierMenstrualCyclesHeartRateInput", v7, v8, v9, v10, v11);
}

- (void)wristTemperatureBasedProjectionsEnabled
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_2_0();
  id v4 = OUTLINED_FUNCTION_4_0(v3);
  OUTLINED_FUNCTION_0_1(&dword_2249E9000, v5, v6, "[%{public}@] -wristTemperatureBasedProjectionsEnabled is deprecated. Please move to using HKFeatureSettingsKeyEnabled for HKFeatureIdentifierMenstrualCyclesWristTemperatureInput", v7, v8, v9, v10, v11);
}

- (void)menstruationNotificationTimeOfDay
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v4, v5, "[%{public}@] Using overridden menstruation notification time: %{public}@", v6, v7, v8, v9, v10);
}

- (void)fertileWindowNotificationTimeOfDay
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v4, v5, "[%{public}@] Using overridden fertile window notification time: %{public}@", v6, v7, v8, v9, v10);
}

@end