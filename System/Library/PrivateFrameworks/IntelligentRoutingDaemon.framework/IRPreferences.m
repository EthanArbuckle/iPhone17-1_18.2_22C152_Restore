@interface IRPreferences
+ (id)shared;
- (IRPreferences)init;
- (NSArray)loiSameSpaceOverrideBrokerForAVODIDArray;
- (NSArray)loiSameSpaceOverrideBrokerForCandidateIDArray;
- (NSArray)overrideIsAirplayForCandidateIDArray;
- (NSDate)startDateForSignificantBundlesLookup;
- (NSMutableDictionary)mobileAssetSettings;
- (NSNumber)appInFocusWindowEnableOnServiceRun;
- (NSNumber)appInFocusWindowInSeconds;
- (NSNumber)appleTvCtrlEventsTimeIntervalThreshold;
- (NSNumber)appleTvCtrlRulesContinuityTimeIntervalInSeconds;
- (NSNumber)bannersFromScreenUnlockToAppInFocusEnable;
- (NSNumber)bleRssiProximityThreshold;
- (NSNumber)brokeredUseScansForEligibilityOfMainDevice;
- (NSNumber)brokeredUseScansForEligibilityOfSecondaryDevice;
- (NSNumber)candidateLastUsedThrForMiLoLowLatancyPowerOpt;
- (NSNumber)candidateSelectorAllowSelectByBLE;
- (NSNumber)candidateSelectorAllowSelectByHistory;
- (NSNumber)candidateSelectorAllowSelectByLOI;
- (NSNumber)candidateSelectorAllowSelectByMiLo;
- (NSNumber)candidateSelectorAllowSelectByPDRFence;
- (NSNumber)candidateSelectorAllowSelectByUWB;
- (NSNumber)candidateSelectorCallToActionAppearThreshold;
- (NSNumber)candidateSelectorIsContinuityEnabled;
- (NSNumber)candidateSelectorIsMostUsedAnyAppEnabled;
- (NSNumber)candidateSelectorIsMostUsedSimilarAppEnabled;
- (NSNumber)candidateSelectorIsNearestRangeEnabled;
- (NSNumber)candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled;
- (NSNumber)candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents;
- (NSNumber)candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds;
- (NSNumber)candidateSelectorMostUsedAnyAppMaximumNumberOfEvents;
- (NSNumber)candidateSelectorMostUsedAnyAppTimeIntervalSeconds;
- (NSNumber)candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents;
- (NSNumber)candidateSelectorMostUsedSimilarAppTimeIntervalSeconds;
- (NSNumber)candidateUpdateTimeIntervalSeconds;
- (NSNumber)cleanupXPCActivityInterval;
- (NSNumber)coreAnalyticsEnable;
- (NSNumber)coreAnalyticsSessionEnable;
- (NSNumber)coreAnalyticsSessionPeriodInSeconds;
- (NSNumber)coreAnalyticsStatisticsCollectionPeriodInSeconds;
- (NSNumber)coreAnalyticsXPCActivityInterval;
- (NSNumber)coreAnalyticsXPCHistoryEventsValidThreshold;
- (NSNumber)dbCleanupXPCActivityDeleteCandidatesThreshold;
- (NSNumber)dbCleanupXPCActivityDeleteHistoryEventsThreshold;
- (NSNumber)dbCleanupXPCActivityDeleteReplayEventsThreshold;
- (NSNumber)dbCleanupXPCActivityDeleteServiceThreshold;
- (NSNumber)deviceRangeProximityThreshold;
- (NSNumber)downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty;
- (NSNumber)downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty;
- (NSNumber)downrankToNoneEligibilityThreshold1stParty;
- (NSNumber)downrankToNoneEligibilityThreshold3rdParty;
- (NSNumber)downrankToOneTapEligibilityThreshold1stParty;
- (NSNumber)downrankToOneTapEligibilityThreshold3rdParty;
- (NSNumber)eligibilityInitStateIsOneTap1stParty;
- (NSNumber)eligibilityInitStateIsOneTap3rdParty;
- (NSNumber)historySameSpaceEventsTimeIntervalSeconds;
- (NSNumber)liveOnEnable;
- (NSNumber)liveOnTtrDebugDataRequestsEnabled;
- (NSNumber)liveOnTtrPeriodicDataRequestsEnabled;
- (NSNumber)loadMobileAssetXPCActivityInterval;
- (NSNumber)loiSameSpaceEventsNumberOfEventsToWatch;
- (NSNumber)loiSameSpaceEventsTimeIntervalSeconds;
- (NSNumber)mediaPlaybackEventsTimeIntervalThreshold;
- (NSNumber)mediaRulesContinuityTimeIntervalInSeconds;
- (NSNumber)mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds;
- (NSNumber)mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds;
- (NSNumber)mediaRulesPickerChoiceConsistencyEnable;
- (NSNumber)mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds;
- (NSNumber)mediaRulesUserRejectedInLastDayEnable;
- (NSNumber)miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts;
- (NSNumber)miloEnable;
- (NSNumber)miloLslIsSameMiloThreshold;
- (NSNumber)miloRoomDetectionInCustomLOIEnabled;
- (NSNumber)miloSameSpaceEventsNumberOfEventsToWatch;
- (NSNumber)miloSameSpaceEventsTimeIntervalSeconds;
- (NSNumber)miloSameSpaceRatioThreshold;
- (NSNumber)miloTimeoutForSetSpotOnRequestSeconds;
- (NSNumber)nearbyDeviceMeasurmentExpityTimeSeconds;
- (NSNumber)nearbyDeviceRegionThreshold;
- (NSNumber)numberOfEventsToSaveInDisk;
- (NSNumber)numberOfHistoryEventsInCache;
- (NSNumber)numberOfSeenCandidates;
- (NSNumber)numberOfUsedCandidates;
- (NSNumber)pdrFenceOtherThanRadiusTimeoutInSeconds;
- (NSNumber)pdrFenceRadiusInMeters;
- (NSNumber)pdrFenceRadiusTimeoutInSeconds;
- (NSNumber)pickerAutoSelectToPicketChoiceMinInterval;
- (NSNumber)pickerChoiceOverrideIntervalSeconds;
- (NSNumber)proximitySessionRetryCountThreshold;
- (NSNumber)replayWriterEventsSizeToBuffer;
- (NSNumber)testMobileAssetLoad;
- (NSNumber)testPreferenceDouble;
- (NSNumber)testPreferenceInteger;
- (NSNumber)timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering;
- (NSNumber)timeInSecondsWithoutUsageToAggressiveFiltering;
- (NSNumber)ttrPeriodicThrottleTimeSec;
- (NSNumber)ttrThrottleTimeSec;
- (NSNumber)uprankToAutorouteEligibilityThreshold1stParty;
- (NSNumber)uprankToAutorouteEligibilityThreshold3rdParty;
- (NSNumber)uprankToOneTapEligibilityThreshold1stParty;
- (NSNumber)uprankToOneTapEligibilityThreshold3rdParty;
- (NSNumber)uwbSuspendPedestrianFenceEnable;
- (NSNumber)uwbSuspendPedestrianFenceRadiusMeters;
- (NSString)coreAnalyticsWeeklyMobileAssetVersion;
- (NSString)mobileAssetVersion;
- (NSString)preferenceString;
- (NSString)testPreferenceString;
- (NSUserDefaults)defaults;
- (id)_getDictItemsForLogging:(id)a3 withTitle:(id)a4;
- (id)_getKeyWithType:(id)a3 withDefaultValue:(id)a4 expectedType:(Class)a5;
- (int)userDefaultsRefreshToken;
- (void)_defaultsSet;
- (void)_registerForUserDefaultsRefreshNotification;
- (void)dealloc;
- (void)deleteAndNotifyKey:(id)a3;
- (void)refresh;
- (void)setDefaults:(id)a3;
- (void)setMobileAssetSettings:(id)a3;
- (void)setMobileAssetSettingsWithMobileAssetDict:(id)a3 assetVersion:(id)a4;
- (void)setMobileAssetVersion:(id)a3;
- (void)setUserDefaultsRefreshToken:(int)a3;
- (void)updateAndNotifyKey:(id)a3 withObject:(id)a4;
@end

@implementation IRPreferences

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__IRPreferences_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_sharedInstance;

  return v2;
}

- (NSNumber)coreAnalyticsStatisticsCollectionPeriodInSeconds
{
  return self->_coreAnalyticsStatisticsCollectionPeriodInSeconds;
}

- (NSNumber)appInFocusWindowInSeconds
{
  return self->_appInFocusWindowInSeconds;
}

- (NSNumber)bannersFromScreenUnlockToAppInFocusEnable
{
  return self->_bannersFromScreenUnlockToAppInFocusEnable;
}

- (NSNumber)nearbyDeviceMeasurmentExpityTimeSeconds
{
  return self->_nearbyDeviceMeasurmentExpityTimeSeconds;
}

- (NSNumber)replayWriterEventsSizeToBuffer
{
  return self->_replayWriterEventsSizeToBuffer;
}

- (NSNumber)numberOfEventsToSaveInDisk
{
  return self->_numberOfEventsToSaveInDisk;
}

- (NSArray)loiSameSpaceOverrideBrokerForAVODIDArray
{
  return self->_loiSameSpaceOverrideBrokerForAVODIDArray;
}

uint64_t __23__IRPreferences_shared__block_invoke(uint64_t a1)
{
  shared_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (IRPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)IRPreferences;
  v2 = [(IRPreferences *)&v6 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.intelligentroutingd"];
    [(IRPreferences *)v2 setDefaults:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(IRPreferences *)v2 setMobileAssetSettings:v4];

    [(IRPreferences *)v2 _registerForUserDefaultsRefreshNotification];
    [(IRPreferences *)v2 refresh];
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel([(IRPreferences *)self userDefaultsRefreshToken]);
  v3.receiver = self;
  v3.super_class = (Class)IRPreferences;
  [(IRPreferences *)&v3 dealloc];
}

- (void)refresh
{
  objc_super v3 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_DEFAULT, "#preferences, Refreshed preferences from disk", v4, 2u);
  }
  [(IRPreferences *)self _defaultsSet];
}

- (void)updateAndNotifyKey:(id)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(IRPreferences *)self defaults];
  v9 = [@"IR" stringByAppendingString:v7];

  [v8 setObject:v6 forKey:v9];
  [(IRPreferences *)self refresh];

  notify_post("com.apple.intelligentroutingd.UserDefaultsRefresh");
}

- (void)deleteAndNotifyKey:(id)a3
{
  id v4 = a3;
  v5 = [(IRPreferences *)self defaults];
  id v6 = [@"IR" stringByAppendingString:v4];

  [v5 removeObjectForKey:v6];
  [(IRPreferences *)self refresh];

  notify_post("com.apple.intelligentroutingd.UserDefaultsRefresh");
}

- (id)_getDictItemsForLogging:(id)a3 withTitle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  v8 = [v5 allKeys];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __51__IRPreferences__getDictItemsForLogging_withTitle___block_invoke;
  v18 = &unk_2653A06F0;
  id v9 = v7;
  id v19 = v9;
  id v10 = v5;
  id v20 = v10;
  [v8 enumerateObjectsUsingBlock:&v15];

  if ([v9 count])
  {
    v11 = NSString;
    v12 = [v9 componentsJoinedByString:@"\n"];
    v13 = [v11 stringWithFormat:@"\n%@\n%@", v6, v12, v15, v16, v17, v18, v19];
  }
  else
  {
    v13 = &stru_27039A840;
  }

  return v13;
}

void __51__IRPreferences__getDictItemsForLogging_withTitle___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 hasPrefix:@"IR"])
  {
    objc_super v3 = NSString;
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
    id v6 = [v3 stringWithFormat:@"   %@:%@", v7, v5];
    [v4 addObject:v6];
  }
}

- (NSString)preferenceString
{
  objc_super v3 = [(IRPreferences *)self defaults];
  id v4 = [v3 dictionaryRepresentation];

  id v5 = [(IRPreferences *)self _getDictItemsForLogging:v4 withTitle:@" Defaults Overrides:"];
  id v6 = [(IRPreferences *)self mobileAssetSettings];
  id v7 = NSString;
  v8 = [(IRPreferences *)self mobileAssetVersion];
  id v9 = [v7 stringWithFormat:@" MobileAsset Overrides (%@):", v8];
  id v10 = [(IRPreferences *)self _getDictItemsForLogging:v6 withTitle:v9];

  v11 = [NSString stringWithFormat:@"IRPreferences:%@%@", v5, v10];

  return (NSString *)v11;
}

- (void)_defaultsSet
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IRPreferences *)self testPreferenceString];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v3 = objc_opt_class();
  }
  id v6 = [(IRPreferences *)self testPreferenceString];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if (v7) {
    uint64_t v3 = objc_opt_class();
  }
  v8 = [(IRPreferences *)self testPreferenceString];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9) {
    uint64_t v3 = objc_opt_class();
  }
  id v10 = [(IRPreferences *)self _getKeyWithType:@"IRtestPreferenceString" withDefaultValue:@"defaultValue" expectedType:v3];
  testPreferenceString = self->_testPreferenceString;
  self->_testPreferenceString = v10;

  uint64_t v12 = objc_opt_class();
  v13 = [(IRPreferences *)self testPreferenceInteger];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14) {
    uint64_t v12 = objc_opt_class();
  }
  uint64_t v15 = [(IRPreferences *)self testPreferenceInteger];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16) {
    uint64_t v12 = objc_opt_class();
  }
  v17 = [(IRPreferences *)self testPreferenceInteger];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v18) {
    uint64_t v12 = objc_opt_class();
  }
  id v19 = [(IRPreferences *)self _getKeyWithType:@"IRtestPreferenceInteger" withDefaultValue:&unk_2703AF0F8 expectedType:v12];
  testPreferenceInteger = self->_testPreferenceInteger;
  self->_testPreferenceInteger = v19;

  uint64_t v21 = objc_opt_class();
  v22 = [(IRPreferences *)self testPreferenceDouble];
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  if (v23) {
    uint64_t v21 = objc_opt_class();
  }
  v24 = [(IRPreferences *)self testPreferenceDouble];
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v25) {
    uint64_t v21 = objc_opt_class();
  }
  v26 = [(IRPreferences *)self testPreferenceDouble];
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if (v27) {
    uint64_t v21 = objc_opt_class();
  }
  v28 = [(IRPreferences *)self _getKeyWithType:@"IRtestPreferenceDouble" withDefaultValue:&unk_2703AF420 expectedType:v21];
  testPreferenceDouble = self->_testPreferenceDouble;
  self->_testPreferenceDouble = v28;

  uint64_t v30 = objc_opt_class();
  v31 = [(IRPreferences *)self overrideIsAirplayForCandidateIDArray];
  objc_opt_class();
  char v32 = objc_opt_isKindOfClass();

  if (v32) {
    uint64_t v30 = objc_opt_class();
  }
  v33 = [(IRPreferences *)self overrideIsAirplayForCandidateIDArray];
  objc_opt_class();
  char v34 = objc_opt_isKindOfClass();

  if (v34) {
    uint64_t v30 = objc_opt_class();
  }
  v35 = [(IRPreferences *)self overrideIsAirplayForCandidateIDArray];
  objc_opt_class();
  char v36 = objc_opt_isKindOfClass();

  if (v36) {
    uint64_t v30 = objc_opt_class();
  }
  v37 = [MEMORY[0x263EFF8C0] array];
  v38 = [(IRPreferences *)self _getKeyWithType:@"IRoverrideIsAirplayForCandidateIDArray" withDefaultValue:v37 expectedType:v30];
  overrideIsAirplayForCandidateIDArray = self->_overrideIsAirplayForCandidateIDArray;
  self->_overrideIsAirplayForCandidateIDArray = v38;

  uint64_t v40 = objc_opt_class();
  v41 = [(IRPreferences *)self testMobileAssetLoad];
  objc_opt_class();
  char v42 = objc_opt_isKindOfClass();

  if (v42) {
    uint64_t v40 = objc_opt_class();
  }
  v43 = [(IRPreferences *)self testMobileAssetLoad];
  objc_opt_class();
  char v44 = objc_opt_isKindOfClass();

  if (v44) {
    uint64_t v40 = objc_opt_class();
  }
  v45 = [(IRPreferences *)self testMobileAssetLoad];
  objc_opt_class();
  char v46 = objc_opt_isKindOfClass();

  if (v46) {
    uint64_t v40 = objc_opt_class();
  }
  v47 = [(IRPreferences *)self _getKeyWithType:@"IRtestMobileAssetLoad" withDefaultValue:&unk_2703AF110 expectedType:v40];
  testMobileAssetLoad = self->_testMobileAssetLoad;
  self->_testMobileAssetLoad = v47;

  uint64_t v49 = objc_opt_class();
  v50 = [(IRPreferences *)self loadMobileAssetXPCActivityInterval];
  objc_opt_class();
  char v51 = objc_opt_isKindOfClass();

  if (v51) {
    uint64_t v49 = objc_opt_class();
  }
  v52 = [(IRPreferences *)self loadMobileAssetXPCActivityInterval];
  objc_opt_class();
  char v53 = objc_opt_isKindOfClass();

  if (v53) {
    uint64_t v49 = objc_opt_class();
  }
  v54 = [(IRPreferences *)self loadMobileAssetXPCActivityInterval];
  objc_opt_class();
  char v55 = objc_opt_isKindOfClass();

  if (v55) {
    uint64_t v49 = objc_opt_class();
  }
  v56 = [(IRPreferences *)self _getKeyWithType:@"IRloadMobileAssetXPCActivityInterval" withDefaultValue:&unk_2703AF128 expectedType:v49];
  loadMobileAssetXPCActivityInterval = self->_loadMobileAssetXPCActivityInterval;
  self->_loadMobileAssetXPCActivityInterval = v56;

  uint64_t v58 = objc_opt_class();
  v59 = [(IRPreferences *)self bleRssiProximityThreshold];
  objc_opt_class();
  char v60 = objc_opt_isKindOfClass();

  if (v60) {
    uint64_t v58 = objc_opt_class();
  }
  v61 = [(IRPreferences *)self bleRssiProximityThreshold];
  objc_opt_class();
  char v62 = objc_opt_isKindOfClass();

  if (v62) {
    uint64_t v58 = objc_opt_class();
  }
  v63 = [(IRPreferences *)self bleRssiProximityThreshold];
  objc_opt_class();
  char v64 = objc_opt_isKindOfClass();

  if (v64) {
    uint64_t v58 = objc_opt_class();
  }
  v65 = [(IRPreferences *)self _getKeyWithType:@"IRbleRssiProximityThreshold" withDefaultValue:&unk_2703AF430 expectedType:v58];
  bleRssiProximityThreshold = self->_bleRssiProximityThreshold;
  self->_bleRssiProximityThreshold = v65;

  uint64_t v67 = objc_opt_class();
  v68 = [(IRPreferences *)self deviceRangeProximityThreshold];
  objc_opt_class();
  char v69 = objc_opt_isKindOfClass();

  if (v69) {
    uint64_t v67 = objc_opt_class();
  }
  v70 = [(IRPreferences *)self deviceRangeProximityThreshold];
  objc_opt_class();
  char v71 = objc_opt_isKindOfClass();

  if (v71) {
    uint64_t v67 = objc_opt_class();
  }
  v72 = [(IRPreferences *)self deviceRangeProximityThreshold];
  objc_opt_class();
  char v73 = objc_opt_isKindOfClass();

  if (v73) {
    uint64_t v67 = objc_opt_class();
  }
  v74 = [(IRPreferences *)self _getKeyWithType:@"IRdeviceRangeProximityThreshold" withDefaultValue:&unk_2703AF440 expectedType:v67];
  deviceRangeProximityThreshold = self->_deviceRangeProximityThreshold;
  self->_deviceRangeProximityThreshold = v74;

  uint64_t v76 = objc_opt_class();
  v77 = [(IRPreferences *)self miloLslIsSameMiloThreshold];
  objc_opt_class();
  char v78 = objc_opt_isKindOfClass();

  if (v78) {
    uint64_t v76 = objc_opt_class();
  }
  v79 = [(IRPreferences *)self miloLslIsSameMiloThreshold];
  objc_opt_class();
  char v80 = objc_opt_isKindOfClass();

  if (v80) {
    uint64_t v76 = objc_opt_class();
  }
  v81 = [(IRPreferences *)self miloLslIsSameMiloThreshold];
  objc_opt_class();
  char v82 = objc_opt_isKindOfClass();

  if (v82) {
    uint64_t v76 = objc_opt_class();
  }
  v83 = [(IRPreferences *)self _getKeyWithType:@"IRmiloLslIsSameMiloThreshold" withDefaultValue:&unk_2703AF450 expectedType:v76];
  miloLslIsSameMiloThreshold = self->_miloLslIsSameMiloThreshold;
  self->_miloLslIsSameMiloThreshold = v83;

  uint64_t v85 = objc_opt_class();
  v86 = [(IRPreferences *)self pickerChoiceOverrideIntervalSeconds];
  objc_opt_class();
  char v87 = objc_opt_isKindOfClass();

  if (v87) {
    uint64_t v85 = objc_opt_class();
  }
  v88 = [(IRPreferences *)self pickerChoiceOverrideIntervalSeconds];
  objc_opt_class();
  char v89 = objc_opt_isKindOfClass();

  if (v89) {
    uint64_t v85 = objc_opt_class();
  }
  v90 = [(IRPreferences *)self pickerChoiceOverrideIntervalSeconds];
  objc_opt_class();
  char v91 = objc_opt_isKindOfClass();

  if (v91) {
    uint64_t v85 = objc_opt_class();
  }
  v92 = [(IRPreferences *)self _getKeyWithType:@"IRpickerChoiceOverrideIntervalSeconds" withDefaultValue:&unk_2703AF140 expectedType:v85];
  pickerChoiceOverrideIntervalSeconds = self->_pickerChoiceOverrideIntervalSeconds;
  self->_pickerChoiceOverrideIntervalSeconds = v92;

  uint64_t v94 = objc_opt_class();
  v95 = [(IRPreferences *)self mediaPlaybackEventsTimeIntervalThreshold];
  objc_opt_class();
  char v96 = objc_opt_isKindOfClass();

  if (v96) {
    uint64_t v94 = objc_opt_class();
  }
  v97 = [(IRPreferences *)self mediaPlaybackEventsTimeIntervalThreshold];
  objc_opt_class();
  char v98 = objc_opt_isKindOfClass();

  if (v98) {
    uint64_t v94 = objc_opt_class();
  }
  v99 = [(IRPreferences *)self mediaPlaybackEventsTimeIntervalThreshold];
  objc_opt_class();
  char v100 = objc_opt_isKindOfClass();

  if (v100) {
    uint64_t v94 = objc_opt_class();
  }
  v101 = [(IRPreferences *)self _getKeyWithType:@"IRmediaPlaybackEventsTimeIntervalThreshold" withDefaultValue:&unk_2703AF158 expectedType:v94];
  mediaPlaybackEventsTimeIntervalThreshold = self->_mediaPlaybackEventsTimeIntervalThreshold;
  self->_mediaPlaybackEventsTimeIntervalThreshold = v101;

  uint64_t v103 = objc_opt_class();
  v104 = [(IRPreferences *)self appleTvCtrlEventsTimeIntervalThreshold];
  objc_opt_class();
  char v105 = objc_opt_isKindOfClass();

  if (v105) {
    uint64_t v103 = objc_opt_class();
  }
  v106 = [(IRPreferences *)self appleTvCtrlEventsTimeIntervalThreshold];
  objc_opt_class();
  char v107 = objc_opt_isKindOfClass();

  if (v107) {
    uint64_t v103 = objc_opt_class();
  }
  v108 = [(IRPreferences *)self appleTvCtrlEventsTimeIntervalThreshold];
  objc_opt_class();
  char v109 = objc_opt_isKindOfClass();

  if (v109) {
    uint64_t v103 = objc_opt_class();
  }
  v110 = [(IRPreferences *)self _getKeyWithType:@"IRappleTvCtrlEventsTimeIntervalThreshold" withDefaultValue:&unk_2703AF140 expectedType:v103];
  appleTvCtrlEventsTimeIntervalThreshold = self->_appleTvCtrlEventsTimeIntervalThreshold;
  self->_appleTvCtrlEventsTimeIntervalThreshold = v110;

  uint64_t v112 = objc_opt_class();
  v113 = [(IRPreferences *)self mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds];
  objc_opt_class();
  char v114 = objc_opt_isKindOfClass();

  if (v114) {
    uint64_t v112 = objc_opt_class();
  }
  v115 = [(IRPreferences *)self mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds];
  objc_opt_class();
  char v116 = objc_opt_isKindOfClass();

  if (v116) {
    uint64_t v112 = objc_opt_class();
  }
  v117 = [(IRPreferences *)self mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds];
  objc_opt_class();
  char v118 = objc_opt_isKindOfClass();

  if (v118) {
    uint64_t v112 = objc_opt_class();
  }
  v119 = [(IRPreferences *)self _getKeyWithType:@"IRmediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds" withDefaultValue:&unk_2703AF158 expectedType:v112];
  mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds = self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds;
  self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds = v119;

  uint64_t v121 = objc_opt_class();
  v122 = [(IRPreferences *)self mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds];
  objc_opt_class();
  char v123 = objc_opt_isKindOfClass();

  if (v123) {
    uint64_t v121 = objc_opt_class();
  }
  v124 = [(IRPreferences *)self mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds];
  objc_opt_class();
  char v125 = objc_opt_isKindOfClass();

  if (v125) {
    uint64_t v121 = objc_opt_class();
  }
  v126 = [(IRPreferences *)self mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds];
  objc_opt_class();
  char v127 = objc_opt_isKindOfClass();

  if (v127) {
    uint64_t v121 = objc_opt_class();
  }
  v128 = [(IRPreferences *)self _getKeyWithType:@"IRmediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds" withDefaultValue:&unk_2703AF158 expectedType:v121];
  mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds = self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds;
  self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds = v128;

  uint64_t v130 = objc_opt_class();
  v131 = [(IRPreferences *)self cleanupXPCActivityInterval];
  objc_opt_class();
  char v132 = objc_opt_isKindOfClass();

  if (v132) {
    uint64_t v130 = objc_opt_class();
  }
  v133 = [(IRPreferences *)self cleanupXPCActivityInterval];
  objc_opt_class();
  char v134 = objc_opt_isKindOfClass();

  if (v134) {
    uint64_t v130 = objc_opt_class();
  }
  v135 = [(IRPreferences *)self cleanupXPCActivityInterval];
  objc_opt_class();
  char v136 = objc_opt_isKindOfClass();

  if (v136) {
    uint64_t v130 = objc_opt_class();
  }
  v137 = [(IRPreferences *)self _getKeyWithType:@"IRcleanupXPCActivityInterval" withDefaultValue:&unk_2703AF128 expectedType:v130];
  cleanupXPCActivityInterval = self->_cleanupXPCActivityInterval;
  self->_cleanupXPCActivityInterval = v137;

  uint64_t v139 = objc_opt_class();
  v140 = [(IRPreferences *)self dbCleanupXPCActivityDeleteServiceThreshold];
  objc_opt_class();
  char v141 = objc_opt_isKindOfClass();

  if (v141) {
    uint64_t v139 = objc_opt_class();
  }
  v142 = [(IRPreferences *)self dbCleanupXPCActivityDeleteServiceThreshold];
  objc_opt_class();
  char v143 = objc_opt_isKindOfClass();

  if (v143) {
    uint64_t v139 = objc_opt_class();
  }
  v144 = [(IRPreferences *)self dbCleanupXPCActivityDeleteServiceThreshold];
  objc_opt_class();
  char v145 = objc_opt_isKindOfClass();

  if (v145) {
    uint64_t v139 = objc_opt_class();
  }
  v146 = [(IRPreferences *)self _getKeyWithType:@"IRdbCleanupXPCActivityDeleteServiceThreshold" withDefaultValue:&unk_2703AF170 expectedType:v139];
  dbCleanupXPCActivityDeleteServiceThreshold = self->_dbCleanupXPCActivityDeleteServiceThreshold;
  self->_dbCleanupXPCActivityDeleteServiceThreshold = v146;

  uint64_t v148 = objc_opt_class();
  v149 = [(IRPreferences *)self dbCleanupXPCActivityDeleteHistoryEventsThreshold];
  objc_opt_class();
  char v150 = objc_opt_isKindOfClass();

  if (v150) {
    uint64_t v148 = objc_opt_class();
  }
  v151 = [(IRPreferences *)self dbCleanupXPCActivityDeleteHistoryEventsThreshold];
  objc_opt_class();
  char v152 = objc_opt_isKindOfClass();

  if (v152) {
    uint64_t v148 = objc_opt_class();
  }
  v153 = [(IRPreferences *)self dbCleanupXPCActivityDeleteHistoryEventsThreshold];
  objc_opt_class();
  char v154 = objc_opt_isKindOfClass();

  if (v154) {
    uint64_t v148 = objc_opt_class();
  }
  v155 = [(IRPreferences *)self _getKeyWithType:@"IRdbCleanupXPCActivityDeleteHistoryEventsThreshold" withDefaultValue:&unk_2703AF170 expectedType:v148];
  dbCleanupXPCActivityDeleteHistoryEventsThreshold = self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold;
  self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold = v155;

  uint64_t v157 = objc_opt_class();
  v158 = [(IRPreferences *)self dbCleanupXPCActivityDeleteReplayEventsThreshold];
  objc_opt_class();
  char v159 = objc_opt_isKindOfClass();

  if (v159) {
    uint64_t v157 = objc_opt_class();
  }
  v160 = [(IRPreferences *)self dbCleanupXPCActivityDeleteReplayEventsThreshold];
  objc_opt_class();
  char v161 = objc_opt_isKindOfClass();

  if (v161) {
    uint64_t v157 = objc_opt_class();
  }
  v162 = [(IRPreferences *)self dbCleanupXPCActivityDeleteReplayEventsThreshold];
  objc_opt_class();
  char v163 = objc_opt_isKindOfClass();

  if (v163) {
    uint64_t v157 = objc_opt_class();
  }
  v164 = [(IRPreferences *)self _getKeyWithType:@"IRdbCleanupXPCActivityDeleteReplayEventsThreshold" withDefaultValue:&unk_2703AF170 expectedType:v157];
  dbCleanupXPCActivityDeleteReplayEventsThreshold = self->_dbCleanupXPCActivityDeleteReplayEventsThreshold;
  self->_dbCleanupXPCActivityDeleteReplayEventsThreshold = v164;

  uint64_t v166 = objc_opt_class();
  v167 = [(IRPreferences *)self dbCleanupXPCActivityDeleteCandidatesThreshold];
  objc_opt_class();
  char v168 = objc_opt_isKindOfClass();

  if (v168) {
    uint64_t v166 = objc_opt_class();
  }
  v169 = [(IRPreferences *)self dbCleanupXPCActivityDeleteCandidatesThreshold];
  objc_opt_class();
  char v170 = objc_opt_isKindOfClass();

  if (v170) {
    uint64_t v166 = objc_opt_class();
  }
  v171 = [(IRPreferences *)self dbCleanupXPCActivityDeleteCandidatesThreshold];
  objc_opt_class();
  char v172 = objc_opt_isKindOfClass();

  if (v172) {
    uint64_t v166 = objc_opt_class();
  }
  v173 = [(IRPreferences *)self _getKeyWithType:@"IRdbCleanupXPCActivityDeleteCandidatesThreshold" withDefaultValue:&unk_2703AF170 expectedType:v166];
  dbCleanupXPCActivityDeleteCandidatesThreshold = self->_dbCleanupXPCActivityDeleteCandidatesThreshold;
  self->_dbCleanupXPCActivityDeleteCandidatesThreshold = v173;

  uint64_t v175 = objc_opt_class();
  v176 = [(IRPreferences *)self miloEnable];
  objc_opt_class();
  char v177 = objc_opt_isKindOfClass();

  if (v177) {
    uint64_t v175 = objc_opt_class();
  }
  v178 = [(IRPreferences *)self miloEnable];
  objc_opt_class();
  char v179 = objc_opt_isKindOfClass();

  if (v179) {
    uint64_t v175 = objc_opt_class();
  }
  v180 = [(IRPreferences *)self miloEnable];
  objc_opt_class();
  char v181 = objc_opt_isKindOfClass();

  if (v181) {
    uint64_t v175 = objc_opt_class();
  }
  v182 = [(IRPreferences *)self _getKeyWithType:@"IRmiloEnable" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v175];
  miloEnable = self->_miloEnable;
  self->_miloEnable = v182;

  uint64_t v184 = objc_opt_class();
  v185 = [(IRPreferences *)self candidateLastUsedThrForMiLoLowLatancyPowerOpt];
  objc_opt_class();
  char v186 = objc_opt_isKindOfClass();

  if (v186) {
    uint64_t v184 = objc_opt_class();
  }
  v187 = [(IRPreferences *)self candidateLastUsedThrForMiLoLowLatancyPowerOpt];
  objc_opt_class();
  char v188 = objc_opt_isKindOfClass();

  if (v188) {
    uint64_t v184 = objc_opt_class();
  }
  v189 = [(IRPreferences *)self candidateLastUsedThrForMiLoLowLatancyPowerOpt];
  objc_opt_class();
  char v190 = objc_opt_isKindOfClass();

  if (v190) {
    uint64_t v184 = objc_opt_class();
  }
  v191 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateLastUsedThrForMiLoLowLatancyPowerOpt" withDefaultValue:&unk_2703AF170 expectedType:v184];
  candidateLastUsedThrForMiLoLowLatancyPowerOpt = self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt;
  self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt = v191;

  uint64_t v193 = objc_opt_class();
  v194 = [(IRPreferences *)self miloTimeoutForSetSpotOnRequestSeconds];
  objc_opt_class();
  char v195 = objc_opt_isKindOfClass();

  if (v195) {
    uint64_t v193 = objc_opt_class();
  }
  v196 = [(IRPreferences *)self miloTimeoutForSetSpotOnRequestSeconds];
  objc_opt_class();
  char v197 = objc_opt_isKindOfClass();

  if (v197) {
    uint64_t v193 = objc_opt_class();
  }
  v198 = [(IRPreferences *)self miloTimeoutForSetSpotOnRequestSeconds];
  objc_opt_class();
  char v199 = objc_opt_isKindOfClass();

  if (v199) {
    uint64_t v193 = objc_opt_class();
  }
  v200 = [(IRPreferences *)self _getKeyWithType:@"IRmiloTimeoutForSetSpotOnRequestSeconds" withDefaultValue:&unk_2703AF158 expectedType:v193];
  miloTimeoutForSetSpotOnRequestSeconds = self->_miloTimeoutForSetSpotOnRequestSeconds;
  self->_miloTimeoutForSetSpotOnRequestSeconds = v200;

  uint64_t v202 = objc_opt_class();
  v203 = [(IRPreferences *)self miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts];
  objc_opt_class();
  char v204 = objc_opt_isKindOfClass();

  if (v204) {
    uint64_t v202 = objc_opt_class();
  }
  v205 = [(IRPreferences *)self miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts];
  objc_opt_class();
  char v206 = objc_opt_isKindOfClass();

  if (v206) {
    uint64_t v202 = objc_opt_class();
  }
  v207 = [(IRPreferences *)self miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts];
  objc_opt_class();
  char v208 = objc_opt_isKindOfClass();

  if (v208) {
    uint64_t v202 = objc_opt_class();
  }
  v209 = [(IRPreferences *)self _getKeyWithType:@"IRmiLoProviderMaxNumberOfConsecutiveMiLoFailAttempts" withDefaultValue:&unk_2703AF188 expectedType:v202];
  miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts = self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts;
  self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts = v209;

  uint64_t v211 = objc_opt_class();
  v212 = [(IRPreferences *)self ttrThrottleTimeSec];
  objc_opt_class();
  char v213 = objc_opt_isKindOfClass();

  if (v213) {
    uint64_t v211 = objc_opt_class();
  }
  v214 = [(IRPreferences *)self ttrThrottleTimeSec];
  objc_opt_class();
  char v215 = objc_opt_isKindOfClass();

  if (v215) {
    uint64_t v211 = objc_opt_class();
  }
  v216 = [(IRPreferences *)self ttrThrottleTimeSec];
  objc_opt_class();
  char v217 = objc_opt_isKindOfClass();

  if (v217) {
    uint64_t v211 = objc_opt_class();
  }
  v218 = [(IRPreferences *)self _getKeyWithType:@"IRttrThrottleTimeSec" withDefaultValue:&unk_2703AF128 expectedType:v211];
  ttrThrottleTimeSec = self->_ttrThrottleTimeSec;
  self->_ttrThrottleTimeSec = v218;

  uint64_t v220 = objc_opt_class();
  v221 = [(IRPreferences *)self ttrPeriodicThrottleTimeSec];
  objc_opt_class();
  char v222 = objc_opt_isKindOfClass();

  if (v222) {
    uint64_t v220 = objc_opt_class();
  }
  v223 = [(IRPreferences *)self ttrPeriodicThrottleTimeSec];
  objc_opt_class();
  char v224 = objc_opt_isKindOfClass();

  if (v224) {
    uint64_t v220 = objc_opt_class();
  }
  v225 = [(IRPreferences *)self ttrPeriodicThrottleTimeSec];
  objc_opt_class();
  char v226 = objc_opt_isKindOfClass();

  if (v226) {
    uint64_t v220 = objc_opt_class();
  }
  v227 = [(IRPreferences *)self _getKeyWithType:@"IRttrPeriodicThrottleTimeSec" withDefaultValue:&unk_2703AF1A0 expectedType:v220];
  ttrPeriodicThrottleTimeSec = self->_ttrPeriodicThrottleTimeSec;
  self->_ttrPeriodicThrottleTimeSec = v227;

  uint64_t v229 = objc_opt_class();
  v230 = [(IRPreferences *)self nearbyDeviceMeasurmentExpityTimeSeconds];
  objc_opt_class();
  char v231 = objc_opt_isKindOfClass();

  if (v231) {
    uint64_t v229 = objc_opt_class();
  }
  v232 = [(IRPreferences *)self nearbyDeviceMeasurmentExpityTimeSeconds];
  objc_opt_class();
  char v233 = objc_opt_isKindOfClass();

  if (v233) {
    uint64_t v229 = objc_opt_class();
  }
  v234 = [(IRPreferences *)self nearbyDeviceMeasurmentExpityTimeSeconds];
  objc_opt_class();
  char v235 = objc_opt_isKindOfClass();

  if (v235) {
    uint64_t v229 = objc_opt_class();
  }
  v236 = [(IRPreferences *)self _getKeyWithType:@"IRnearbyDeviceMeasurmentExpityTimeSeconds" withDefaultValue:&unk_2703AF1B8 expectedType:v229];
  nearbyDeviceMeasurmentExpityTimeSeconds = self->_nearbyDeviceMeasurmentExpityTimeSeconds;
  self->_nearbyDeviceMeasurmentExpityTimeSeconds = v236;

  uint64_t v238 = objc_opt_class();
  v239 = [(IRPreferences *)self proximitySessionRetryCountThreshold];
  objc_opt_class();
  char v240 = objc_opt_isKindOfClass();

  if (v240) {
    uint64_t v238 = objc_opt_class();
  }
  v241 = [(IRPreferences *)self proximitySessionRetryCountThreshold];
  objc_opt_class();
  char v242 = objc_opt_isKindOfClass();

  if (v242) {
    uint64_t v238 = objc_opt_class();
  }
  v243 = [(IRPreferences *)self proximitySessionRetryCountThreshold];
  objc_opt_class();
  char v244 = objc_opt_isKindOfClass();

  if (v244) {
    uint64_t v238 = objc_opt_class();
  }
  v245 = [(IRPreferences *)self _getKeyWithType:@"IRproximitySessionRetryCountThreshold" withDefaultValue:&unk_2703AF1D0 expectedType:v238];
  proximitySessionRetryCountThreshold = self->_proximitySessionRetryCountThreshold;
  self->_proximitySessionRetryCountThreshold = v245;

  uint64_t v247 = objc_opt_class();
  v248 = [(IRPreferences *)self nearbyDeviceRegionThreshold];
  objc_opt_class();
  char v249 = objc_opt_isKindOfClass();

  if (v249) {
    uint64_t v247 = objc_opt_class();
  }
  v250 = [(IRPreferences *)self nearbyDeviceRegionThreshold];
  objc_opt_class();
  char v251 = objc_opt_isKindOfClass();

  if (v251) {
    uint64_t v247 = objc_opt_class();
  }
  v252 = [(IRPreferences *)self nearbyDeviceRegionThreshold];
  objc_opt_class();
  char v253 = objc_opt_isKindOfClass();

  if (v253) {
    uint64_t v247 = objc_opt_class();
  }
  v254 = [(IRPreferences *)self _getKeyWithType:@"IRnearbyDeviceRegionThreshold" withDefaultValue:&unk_2703AF1E8 expectedType:v247];
  nearbyDeviceRegionThreshold = self->_nearbyDeviceRegionThreshold;
  self->_nearbyDeviceRegionThreshold = v254;

  uint64_t v256 = objc_opt_class();
  v257 = [(IRPreferences *)self uwbSuspendPedestrianFenceRadiusMeters];
  objc_opt_class();
  char v258 = objc_opt_isKindOfClass();

  if (v258) {
    uint64_t v256 = objc_opt_class();
  }
  v259 = [(IRPreferences *)self uwbSuspendPedestrianFenceRadiusMeters];
  objc_opt_class();
  char v260 = objc_opt_isKindOfClass();

  if (v260) {
    uint64_t v256 = objc_opt_class();
  }
  v261 = [(IRPreferences *)self uwbSuspendPedestrianFenceRadiusMeters];
  objc_opt_class();
  char v262 = objc_opt_isKindOfClass();

  if (v262) {
    uint64_t v256 = objc_opt_class();
  }
  v263 = [(IRPreferences *)self _getKeyWithType:@"IRuwbSuspendPedestrianFenceRadiusMeters" withDefaultValue:&unk_2703AF460 expectedType:v256];
  uwbSuspendPedestrianFenceRadiusMeters = self->_uwbSuspendPedestrianFenceRadiusMeters;
  self->_uwbSuspendPedestrianFenceRadiusMeters = v263;

  uint64_t v265 = objc_opt_class();
  v266 = [(IRPreferences *)self uwbSuspendPedestrianFenceEnable];
  objc_opt_class();
  char v267 = objc_opt_isKindOfClass();

  if (v267) {
    uint64_t v265 = objc_opt_class();
  }
  v268 = [(IRPreferences *)self uwbSuspendPedestrianFenceEnable];
  objc_opt_class();
  char v269 = objc_opt_isKindOfClass();

  if (v269) {
    uint64_t v265 = objc_opt_class();
  }
  v270 = [(IRPreferences *)self uwbSuspendPedestrianFenceEnable];
  objc_opt_class();
  char v271 = objc_opt_isKindOfClass();

  if (v271) {
    uint64_t v265 = objc_opt_class();
  }
  v272 = [(IRPreferences *)self _getKeyWithType:@"IRuwbSuspendPedestrianFenceEnable" withDefaultValue:&unk_2703AF200 expectedType:v265];
  uwbSuspendPedestrianFenceEnable = self->_uwbSuspendPedestrianFenceEnable;
  self->_uwbSuspendPedestrianFenceEnable = v272;

  uint64_t v274 = objc_opt_class();
  v275 = [(IRPreferences *)self replayWriterEventsSizeToBuffer];
  objc_opt_class();
  char v276 = objc_opt_isKindOfClass();

  if (v276) {
    uint64_t v274 = objc_opt_class();
  }
  v277 = [(IRPreferences *)self replayWriterEventsSizeToBuffer];
  objc_opt_class();
  char v278 = objc_opt_isKindOfClass();

  if (v278) {
    uint64_t v274 = objc_opt_class();
  }
  v279 = [(IRPreferences *)self replayWriterEventsSizeToBuffer];
  objc_opt_class();
  char v280 = objc_opt_isKindOfClass();

  if (v280) {
    uint64_t v274 = objc_opt_class();
  }
  v281 = [(IRPreferences *)self _getKeyWithType:@"IRreplayWriterEventsSizeToBuffer" withDefaultValue:&unk_2703AF218 expectedType:v274];
  replayWriterEventsSizeToBuffer = self->_replayWriterEventsSizeToBuffer;
  self->_replayWriterEventsSizeToBuffer = v281;

  uint64_t v283 = objc_opt_class();
  v284 = [(IRPreferences *)self numberOfHistoryEventsInCache];
  objc_opt_class();
  char v285 = objc_opt_isKindOfClass();

  if (v285) {
    uint64_t v283 = objc_opt_class();
  }
  v286 = [(IRPreferences *)self numberOfHistoryEventsInCache];
  objc_opt_class();
  char v287 = objc_opt_isKindOfClass();

  if (v287) {
    uint64_t v283 = objc_opt_class();
  }
  v288 = [(IRPreferences *)self numberOfHistoryEventsInCache];
  objc_opt_class();
  char v289 = objc_opt_isKindOfClass();

  if (v289) {
    uint64_t v283 = objc_opt_class();
  }
  v290 = [(IRPreferences *)self _getKeyWithType:@"IRnumberOfHistoryEventsInCache" withDefaultValue:&unk_2703AF230 expectedType:v283];
  numberOfHistoryEventsInCache = self->_numberOfHistoryEventsInCache;
  self->_numberOfHistoryEventsInCache = v290;

  uint64_t v292 = objc_opt_class();
  v293 = [(IRPreferences *)self numberOfEventsToSaveInDisk];
  objc_opt_class();
  char v294 = objc_opt_isKindOfClass();

  if (v294) {
    uint64_t v292 = objc_opt_class();
  }
  v295 = [(IRPreferences *)self numberOfEventsToSaveInDisk];
  objc_opt_class();
  char v296 = objc_opt_isKindOfClass();

  if (v296) {
    uint64_t v292 = objc_opt_class();
  }
  v297 = [(IRPreferences *)self numberOfEventsToSaveInDisk];
  objc_opt_class();
  char v298 = objc_opt_isKindOfClass();

  if (v298) {
    uint64_t v292 = objc_opt_class();
  }
  v299 = [(IRPreferences *)self _getKeyWithType:@"IRnumberOfEventsToSaveInDisk" withDefaultValue:&unk_2703AF248 expectedType:v292];
  numberOfEventsToSaveInDisk = self->_numberOfEventsToSaveInDisk;
  self->_numberOfEventsToSaveInDisk = v299;

  uint64_t v301 = objc_opt_class();
  v302 = [(IRPreferences *)self coreAnalyticsEnable];
  objc_opt_class();
  char v303 = objc_opt_isKindOfClass();

  if (v303) {
    uint64_t v301 = objc_opt_class();
  }
  v304 = [(IRPreferences *)self coreAnalyticsEnable];
  objc_opt_class();
  char v305 = objc_opt_isKindOfClass();

  if (v305) {
    uint64_t v301 = objc_opt_class();
  }
  v306 = [(IRPreferences *)self coreAnalyticsEnable];
  objc_opt_class();
  char v307 = objc_opt_isKindOfClass();

  if (v307) {
    uint64_t v301 = objc_opt_class();
  }
  v308 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsEnable" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v301];
  coreAnalyticsEnable = self->_coreAnalyticsEnable;
  self->_coreAnalyticsEnable = v308;

  uint64_t v310 = objc_opt_class();
  v311 = [(IRPreferences *)self coreAnalyticsXPCActivityInterval];
  objc_opt_class();
  char v312 = objc_opt_isKindOfClass();

  if (v312) {
    uint64_t v310 = objc_opt_class();
  }
  v313 = [(IRPreferences *)self coreAnalyticsXPCActivityInterval];
  objc_opt_class();
  char v314 = objc_opt_isKindOfClass();

  if (v314) {
    uint64_t v310 = objc_opt_class();
  }
  v315 = [(IRPreferences *)self coreAnalyticsXPCActivityInterval];
  objc_opt_class();
  char v316 = objc_opt_isKindOfClass();

  if (v316) {
    uint64_t v310 = objc_opt_class();
  }
  v317 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsXPCActivityInterval" withDefaultValue:&unk_2703AF1A0 expectedType:v310];
  coreAnalyticsXPCActivityInterval = self->_coreAnalyticsXPCActivityInterval;
  self->_coreAnalyticsXPCActivityInterval = v317;

  uint64_t v319 = objc_opt_class();
  v320 = [(IRPreferences *)self coreAnalyticsXPCHistoryEventsValidThreshold];
  objc_opt_class();
  char v321 = objc_opt_isKindOfClass();

  if (v321) {
    uint64_t v319 = objc_opt_class();
  }
  v322 = [(IRPreferences *)self coreAnalyticsXPCHistoryEventsValidThreshold];
  objc_opt_class();
  char v323 = objc_opt_isKindOfClass();

  if (v323) {
    uint64_t v319 = objc_opt_class();
  }
  v324 = [(IRPreferences *)self coreAnalyticsXPCHistoryEventsValidThreshold];
  objc_opt_class();
  char v325 = objc_opt_isKindOfClass();

  if (v325) {
    uint64_t v319 = objc_opt_class();
  }
  v326 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsXPCHistoryEventsValidThreshold" withDefaultValue:&unk_2703AF1A0 expectedType:v319];
  coreAnalyticsXPCHistoryEventsValidThreshold = self->_coreAnalyticsXPCHistoryEventsValidThreshold;
  self->_coreAnalyticsXPCHistoryEventsValidThreshold = v326;

  uint64_t v328 = objc_opt_class();
  v329 = [(IRPreferences *)self coreAnalyticsStatisticsCollectionPeriodInSeconds];
  objc_opt_class();
  char v330 = objc_opt_isKindOfClass();

  if (v330) {
    uint64_t v328 = objc_opt_class();
  }
  v331 = [(IRPreferences *)self coreAnalyticsStatisticsCollectionPeriodInSeconds];
  objc_opt_class();
  char v332 = objc_opt_isKindOfClass();

  if (v332) {
    uint64_t v328 = objc_opt_class();
  }
  v333 = [(IRPreferences *)self coreAnalyticsStatisticsCollectionPeriodInSeconds];
  objc_opt_class();
  char v334 = objc_opt_isKindOfClass();

  if (v334) {
    uint64_t v328 = objc_opt_class();
  }
  v335 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsStatisticsCollectionPeriodInSeconds" withDefaultValue:&unk_2703AF1A0 expectedType:v328];
  coreAnalyticsStatisticsCollectionPeriodInSeconds = self->_coreAnalyticsStatisticsCollectionPeriodInSeconds;
  self->_coreAnalyticsStatisticsCollectionPeriodInSeconds = v335;

  uint64_t v337 = objc_opt_class();
  v338 = [(IRPreferences *)self coreAnalyticsWeeklyMobileAssetVersion];
  objc_opt_class();
  char v339 = objc_opt_isKindOfClass();

  if (v339) {
    uint64_t v337 = objc_opt_class();
  }
  v340 = [(IRPreferences *)self coreAnalyticsWeeklyMobileAssetVersion];
  objc_opt_class();
  char v341 = objc_opt_isKindOfClass();

  if (v341) {
    uint64_t v337 = objc_opt_class();
  }
  v342 = [(IRPreferences *)self coreAnalyticsWeeklyMobileAssetVersion];
  objc_opt_class();
  char v343 = objc_opt_isKindOfClass();

  if (v343) {
    uint64_t v337 = objc_opt_class();
  }
  v344 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsWeeklyMobileAssetVersion" withDefaultValue:0 expectedType:v337];
  coreAnalyticsWeeklyMobileAssetVersion = self->_coreAnalyticsWeeklyMobileAssetVersion;
  self->_coreAnalyticsWeeklyMobileAssetVersion = v344;

  uint64_t v346 = objc_opt_class();
  v347 = [(IRPreferences *)self coreAnalyticsSessionEnable];
  objc_opt_class();
  char v348 = objc_opt_isKindOfClass();

  if (v348) {
    uint64_t v346 = objc_opt_class();
  }
  v349 = [(IRPreferences *)self coreAnalyticsSessionEnable];
  objc_opt_class();
  char v350 = objc_opt_isKindOfClass();

  if (v350) {
    uint64_t v346 = objc_opt_class();
  }
  v351 = [(IRPreferences *)self coreAnalyticsSessionEnable];
  objc_opt_class();
  char v352 = objc_opt_isKindOfClass();

  if (v352) {
    uint64_t v346 = objc_opt_class();
  }
  v353 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsSessionEnable" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v346];
  coreAnalyticsSessionEnable = self->_coreAnalyticsSessionEnable;
  self->_coreAnalyticsSessionEnable = v353;

  uint64_t v355 = objc_opt_class();
  v356 = [(IRPreferences *)self coreAnalyticsSessionPeriodInSeconds];
  objc_opt_class();
  char v357 = objc_opt_isKindOfClass();

  if (v357) {
    uint64_t v355 = objc_opt_class();
  }
  v358 = [(IRPreferences *)self coreAnalyticsSessionPeriodInSeconds];
  objc_opt_class();
  char v359 = objc_opt_isKindOfClass();

  if (v359) {
    uint64_t v355 = objc_opt_class();
  }
  v360 = [(IRPreferences *)self coreAnalyticsSessionPeriodInSeconds];
  objc_opt_class();
  char v361 = objc_opt_isKindOfClass();

  if (v361) {
    uint64_t v355 = objc_opt_class();
  }
  v362 = [(IRPreferences *)self _getKeyWithType:@"IRcoreAnalyticsSessionPeriodInSeconds" withDefaultValue:&unk_2703AF260 expectedType:v355];
  coreAnalyticsSessionPeriodInSeconds = self->_coreAnalyticsSessionPeriodInSeconds;
  self->_coreAnalyticsSessionPeriodInSeconds = v362;

  uint64_t v364 = objc_opt_class();
  v365 = [(IRPreferences *)self mediaRulesContinuityTimeIntervalInSeconds];
  objc_opt_class();
  char v366 = objc_opt_isKindOfClass();

  if (v366) {
    uint64_t v364 = objc_opt_class();
  }
  v367 = [(IRPreferences *)self mediaRulesContinuityTimeIntervalInSeconds];
  objc_opt_class();
  char v368 = objc_opt_isKindOfClass();

  if (v368) {
    uint64_t v364 = objc_opt_class();
  }
  v369 = [(IRPreferences *)self mediaRulesContinuityTimeIntervalInSeconds];
  objc_opt_class();
  char v370 = objc_opt_isKindOfClass();

  if (v370) {
    uint64_t v364 = objc_opt_class();
  }
  v371 = [(IRPreferences *)self _getKeyWithType:@"IRmediaRulesContinuityTimeIntervalInSeconds" withDefaultValue:&unk_2703AF278 expectedType:v364];
  mediaRulesContinuityTimeIntervalInSeconds = self->_mediaRulesContinuityTimeIntervalInSeconds;
  self->_mediaRulesContinuityTimeIntervalInSeconds = v371;

  uint64_t v373 = objc_opt_class();
  v374 = [(IRPreferences *)self mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds];
  objc_opt_class();
  char v375 = objc_opt_isKindOfClass();

  if (v375) {
    uint64_t v373 = objc_opt_class();
  }
  v376 = [(IRPreferences *)self mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds];
  objc_opt_class();
  char v377 = objc_opt_isKindOfClass();

  if (v377) {
    uint64_t v373 = objc_opt_class();
  }
  v378 = [(IRPreferences *)self mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds];
  objc_opt_class();
  char v379 = objc_opt_isKindOfClass();

  if (v379) {
    uint64_t v373 = objc_opt_class();
  }
  v380 = [(IRPreferences *)self _getKeyWithType:@"IRmediaRulesPickerChoiceConsistencyTimeIntervalInSeconds" withDefaultValue:&unk_2703AF290 expectedType:v373];
  mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds = self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds;
  self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds = v380;

  uint64_t v382 = objc_opt_class();
  v383 = [(IRPreferences *)self mediaRulesPickerChoiceConsistencyEnable];
  objc_opt_class();
  char v384 = objc_opt_isKindOfClass();

  if (v384) {
    uint64_t v382 = objc_opt_class();
  }
  v385 = [(IRPreferences *)self mediaRulesPickerChoiceConsistencyEnable];
  objc_opt_class();
  char v386 = objc_opt_isKindOfClass();

  if (v386) {
    uint64_t v382 = objc_opt_class();
  }
  v387 = [(IRPreferences *)self mediaRulesPickerChoiceConsistencyEnable];
  objc_opt_class();
  char v388 = objc_opt_isKindOfClass();

  if (v388) {
    uint64_t v382 = objc_opt_class();
  }
  v389 = [(IRPreferences *)self _getKeyWithType:@"IRmediaRulesPickerChoiceConsistencyEnable" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v382];
  mediaRulesPickerChoiceConsistencyEnable = self->_mediaRulesPickerChoiceConsistencyEnable;
  self->_mediaRulesPickerChoiceConsistencyEnable = v389;

  uint64_t v391 = objc_opt_class();
  v392 = [(IRPreferences *)self mediaRulesUserRejectedInLastDayEnable];
  objc_opt_class();
  char v393 = objc_opt_isKindOfClass();

  if (v393) {
    uint64_t v391 = objc_opt_class();
  }
  v394 = [(IRPreferences *)self mediaRulesUserRejectedInLastDayEnable];
  objc_opt_class();
  char v395 = objc_opt_isKindOfClass();

  if (v395) {
    uint64_t v391 = objc_opt_class();
  }
  v396 = [(IRPreferences *)self mediaRulesUserRejectedInLastDayEnable];
  objc_opt_class();
  char v397 = objc_opt_isKindOfClass();

  if (v397) {
    uint64_t v391 = objc_opt_class();
  }
  v398 = [(IRPreferences *)self _getKeyWithType:@"IRmediaRulesUserRejectedInLastDayEnable" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v391];
  mediaRulesUserRejectedInLastDayEnable = self->_mediaRulesUserRejectedInLastDayEnable;
  self->_mediaRulesUserRejectedInLastDayEnable = v398;

  uint64_t v400 = objc_opt_class();
  v401 = [(IRPreferences *)self appleTvCtrlRulesContinuityTimeIntervalInSeconds];
  objc_opt_class();
  char v402 = objc_opt_isKindOfClass();

  if (v402) {
    uint64_t v400 = objc_opt_class();
  }
  v403 = [(IRPreferences *)self appleTvCtrlRulesContinuityTimeIntervalInSeconds];
  objc_opt_class();
  char v404 = objc_opt_isKindOfClass();

  if (v404) {
    uint64_t v400 = objc_opt_class();
  }
  v405 = [(IRPreferences *)self appleTvCtrlRulesContinuityTimeIntervalInSeconds];
  objc_opt_class();
  char v406 = objc_opt_isKindOfClass();

  if (v406) {
    uint64_t v400 = objc_opt_class();
  }
  v407 = [(IRPreferences *)self _getKeyWithType:@"IRappleTvCtrlRulesContinuityTimeIntervalInSeconds" withDefaultValue:&unk_2703AF278 expectedType:v400];
  appleTvCtrlRulesContinuityTimeIntervalInSeconds = self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds;
  self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds = v407;

  uint64_t v409 = objc_opt_class();
  v410 = [(IRPreferences *)self appInFocusWindowInSeconds];
  objc_opt_class();
  char v411 = objc_opt_isKindOfClass();

  if (v411) {
    uint64_t v409 = objc_opt_class();
  }
  v412 = [(IRPreferences *)self appInFocusWindowInSeconds];
  objc_opt_class();
  char v413 = objc_opt_isKindOfClass();

  if (v413) {
    uint64_t v409 = objc_opt_class();
  }
  v414 = [(IRPreferences *)self appInFocusWindowInSeconds];
  objc_opt_class();
  char v415 = objc_opt_isKindOfClass();

  if (v415) {
    uint64_t v409 = objc_opt_class();
  }
  v416 = [(IRPreferences *)self _getKeyWithType:@"IRappInFocusWindowInSeconds" withDefaultValue:&unk_2703AF1E8 expectedType:v409];
  appInFocusWindowInSeconds = self->_appInFocusWindowInSeconds;
  self->_appInFocusWindowInSeconds = v416;

  uint64_t v418 = objc_opt_class();
  v419 = [(IRPreferences *)self appInFocusWindowEnableOnServiceRun];
  objc_opt_class();
  char v420 = objc_opt_isKindOfClass();

  if (v420) {
    uint64_t v418 = objc_opt_class();
  }
  v421 = [(IRPreferences *)self appInFocusWindowEnableOnServiceRun];
  objc_opt_class();
  char v422 = objc_opt_isKindOfClass();

  if (v422) {
    uint64_t v418 = objc_opt_class();
  }
  v423 = [(IRPreferences *)self appInFocusWindowEnableOnServiceRun];
  objc_opt_class();
  char v424 = objc_opt_isKindOfClass();

  if (v424) {
    uint64_t v418 = objc_opt_class();
  }
  v425 = [(IRPreferences *)self _getKeyWithType:@"IRappInFocusWindowEnableOnServiceRun" withDefaultValue:MEMORY[0x263EFFA80] expectedType:v418];
  appInFocusWindowEnableOnServiceRun = self->_appInFocusWindowEnableOnServiceRun;
  self->_appInFocusWindowEnableOnServiceRun = v425;

  uint64_t v427 = objc_opt_class();
  v428 = [(IRPreferences *)self bannersFromScreenUnlockToAppInFocusEnable];
  objc_opt_class();
  char v429 = objc_opt_isKindOfClass();

  if (v429) {
    uint64_t v427 = objc_opt_class();
  }
  v430 = [(IRPreferences *)self bannersFromScreenUnlockToAppInFocusEnable];
  objc_opt_class();
  char v431 = objc_opt_isKindOfClass();

  if (v431) {
    uint64_t v427 = objc_opt_class();
  }
  v432 = [(IRPreferences *)self bannersFromScreenUnlockToAppInFocusEnable];
  objc_opt_class();
  char v433 = objc_opt_isKindOfClass();

  if (v433) {
    uint64_t v427 = objc_opt_class();
  }
  v434 = [(IRPreferences *)self _getKeyWithType:@"IRbannersFromScreenUnlockToAppInFocusEnable" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v427];
  bannersFromScreenUnlockToAppInFocusEnable = self->_bannersFromScreenUnlockToAppInFocusEnable;
  self->_bannersFromScreenUnlockToAppInFocusEnable = v434;

  uint64_t v436 = objc_opt_class();
  v437 = [(IRPreferences *)self liveOnEnable];
  objc_opt_class();
  char v438 = objc_opt_isKindOfClass();

  if (v438) {
    uint64_t v436 = objc_opt_class();
  }
  v439 = [(IRPreferences *)self liveOnEnable];
  objc_opt_class();
  char v440 = objc_opt_isKindOfClass();

  if (v440) {
    uint64_t v436 = objc_opt_class();
  }
  v441 = [(IRPreferences *)self liveOnEnable];
  objc_opt_class();
  char v442 = objc_opt_isKindOfClass();

  if (v442) {
    uint64_t v436 = objc_opt_class();
  }
  v443 = [(IRPreferences *)self _getKeyWithType:@"IRliveOnEnable" withDefaultValue:MEMORY[0x263EFFA80] expectedType:v436];
  liveOnEnable = self->_liveOnEnable;
  self->_liveOnEnable = v443;

  uint64_t v445 = objc_opt_class();
  v446 = [(IRPreferences *)self liveOnTtrDebugDataRequestsEnabled];
  objc_opt_class();
  char v447 = objc_opt_isKindOfClass();

  if (v447) {
    uint64_t v445 = objc_opt_class();
  }
  v448 = [(IRPreferences *)self liveOnTtrDebugDataRequestsEnabled];
  objc_opt_class();
  char v449 = objc_opt_isKindOfClass();

  if (v449) {
    uint64_t v445 = objc_opt_class();
  }
  v450 = [(IRPreferences *)self liveOnTtrDebugDataRequestsEnabled];
  objc_opt_class();
  char v451 = objc_opt_isKindOfClass();

  if (v451) {
    uint64_t v445 = objc_opt_class();
  }
  v452 = [(IRPreferences *)self _getKeyWithType:@"IRliveOnTtrDebugDataRequestsEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v445];
  liveOnTtrDebugDataRequestsEnabled = self->_liveOnTtrDebugDataRequestsEnabled;
  self->_liveOnTtrDebugDataRequestsEnabled = v452;

  uint64_t v454 = objc_opt_class();
  v455 = [(IRPreferences *)self liveOnTtrPeriodicDataRequestsEnabled];
  objc_opt_class();
  char v456 = objc_opt_isKindOfClass();

  if (v456) {
    uint64_t v454 = objc_opt_class();
  }
  v457 = [(IRPreferences *)self liveOnTtrPeriodicDataRequestsEnabled];
  objc_opt_class();
  char v458 = objc_opt_isKindOfClass();

  if (v458) {
    uint64_t v454 = objc_opt_class();
  }
  v459 = [(IRPreferences *)self liveOnTtrPeriodicDataRequestsEnabled];
  objc_opt_class();
  char v460 = objc_opt_isKindOfClass();

  if (v460) {
    uint64_t v454 = objc_opt_class();
  }
  v461 = [(IRPreferences *)self _getKeyWithType:@"IRliveOnTtrPeriodicDataRequestsEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v454];
  liveOnTtrPeriodicDataRequestsEnabled = self->_liveOnTtrPeriodicDataRequestsEnabled;
  self->_liveOnTtrPeriodicDataRequestsEnabled = v461;

  uint64_t v463 = objc_opt_class();
  v464 = [(IRPreferences *)self numberOfUsedCandidates];
  objc_opt_class();
  char v465 = objc_opt_isKindOfClass();

  if (v465) {
    uint64_t v463 = objc_opt_class();
  }
  v466 = [(IRPreferences *)self numberOfUsedCandidates];
  objc_opt_class();
  char v467 = objc_opt_isKindOfClass();

  if (v467) {
    uint64_t v463 = objc_opt_class();
  }
  v468 = [(IRPreferences *)self numberOfUsedCandidates];
  objc_opt_class();
  char v469 = objc_opt_isKindOfClass();

  if (v469) {
    uint64_t v463 = objc_opt_class();
  }
  v470 = [(IRPreferences *)self _getKeyWithType:@"IRnumberOfUsedCandidates" withDefaultValue:&unk_2703AF158 expectedType:v463];
  numberOfUsedCandidates = self->_numberOfUsedCandidates;
  self->_numberOfUsedCandidates = v470;

  uint64_t v472 = objc_opt_class();
  v473 = [(IRPreferences *)self numberOfSeenCandidates];
  objc_opt_class();
  char v474 = objc_opt_isKindOfClass();

  if (v474) {
    uint64_t v472 = objc_opt_class();
  }
  v475 = [(IRPreferences *)self numberOfSeenCandidates];
  objc_opt_class();
  char v476 = objc_opt_isKindOfClass();

  if (v476) {
    uint64_t v472 = objc_opt_class();
  }
  v477 = [(IRPreferences *)self numberOfSeenCandidates];
  objc_opt_class();
  char v478 = objc_opt_isKindOfClass();

  if (v478) {
    uint64_t v472 = objc_opt_class();
  }
  v479 = [(IRPreferences *)self _getKeyWithType:@"IRnumberOfSeenCandidates" withDefaultValue:&unk_2703AF158 expectedType:v472];
  numberOfSeenCandidates = self->_numberOfSeenCandidates;
  self->_numberOfSeenCandidates = v479;

  uint64_t v481 = objc_opt_class();
  v482 = [(IRPreferences *)self candidateUpdateTimeIntervalSeconds];
  objc_opt_class();
  char v483 = objc_opt_isKindOfClass();

  if (v483) {
    uint64_t v481 = objc_opt_class();
  }
  v484 = [(IRPreferences *)self candidateUpdateTimeIntervalSeconds];
  objc_opt_class();
  char v485 = objc_opt_isKindOfClass();

  if (v485) {
    uint64_t v481 = objc_opt_class();
  }
  v486 = [(IRPreferences *)self candidateUpdateTimeIntervalSeconds];
  objc_opt_class();
  char v487 = objc_opt_isKindOfClass();

  if (v487) {
    uint64_t v481 = objc_opt_class();
  }
  v488 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateUpdateTimeIntervalSeconds" withDefaultValue:&unk_2703AF2A8 expectedType:v481];
  candidateUpdateTimeIntervalSeconds = self->_candidateUpdateTimeIntervalSeconds;
  self->_candidateUpdateTimeIntervalSeconds = v488;

  uint64_t v490 = objc_opt_class();
  v491 = [(IRPreferences *)self uprankToAutorouteEligibilityThreshold3rdParty];
  objc_opt_class();
  char v492 = objc_opt_isKindOfClass();

  if (v492) {
    uint64_t v490 = objc_opt_class();
  }
  v493 = [(IRPreferences *)self uprankToAutorouteEligibilityThreshold3rdParty];
  objc_opt_class();
  char v494 = objc_opt_isKindOfClass();

  if (v494) {
    uint64_t v490 = objc_opt_class();
  }
  v495 = [(IRPreferences *)self uprankToAutorouteEligibilityThreshold3rdParty];
  objc_opt_class();
  char v496 = objc_opt_isKindOfClass();

  if (v496) {
    uint64_t v490 = objc_opt_class();
  }
  v497 = [(IRPreferences *)self _getKeyWithType:@"IRuprankToAutorouteEligibilityThreshold3rdParty" withDefaultValue:&unk_2703AF218 expectedType:v490];
  uprankToAutorouteEligibilityThreshold3rdParty = self->_uprankToAutorouteEligibilityThreshold3rdParty;
  self->_uprankToAutorouteEligibilityThreshold3rdParty = v497;

  uint64_t v499 = objc_opt_class();
  v500 = [(IRPreferences *)self uprankToOneTapEligibilityThreshold3rdParty];
  objc_opt_class();
  char v501 = objc_opt_isKindOfClass();

  if (v501) {
    uint64_t v499 = objc_opt_class();
  }
  v502 = [(IRPreferences *)self uprankToOneTapEligibilityThreshold3rdParty];
  objc_opt_class();
  char v503 = objc_opt_isKindOfClass();

  if (v503) {
    uint64_t v499 = objc_opt_class();
  }
  v504 = [(IRPreferences *)self uprankToOneTapEligibilityThreshold3rdParty];
  objc_opt_class();
  char v505 = objc_opt_isKindOfClass();

  if (v505) {
    uint64_t v499 = objc_opt_class();
  }
  v506 = [(IRPreferences *)self _getKeyWithType:@"IRuprankToOneTapEligibilityThreshold3rdParty" withDefaultValue:&unk_2703AF200 expectedType:v499];
  uprankToOneTapEligibilityThreshold3rdParty = self->_uprankToOneTapEligibilityThreshold3rdParty;
  self->_uprankToOneTapEligibilityThreshold3rdParty = v506;

  uint64_t v508 = objc_opt_class();
  v509 = [(IRPreferences *)self downrankToNoneEligibilityThreshold3rdParty];
  objc_opt_class();
  char v510 = objc_opt_isKindOfClass();

  if (v510) {
    uint64_t v508 = objc_opt_class();
  }
  v511 = [(IRPreferences *)self downrankToNoneEligibilityThreshold3rdParty];
  objc_opt_class();
  char v512 = objc_opt_isKindOfClass();

  if (v512) {
    uint64_t v508 = objc_opt_class();
  }
  v513 = [(IRPreferences *)self downrankToNoneEligibilityThreshold3rdParty];
  objc_opt_class();
  char v514 = objc_opt_isKindOfClass();

  if (v514) {
    uint64_t v508 = objc_opt_class();
  }
  v515 = [(IRPreferences *)self _getKeyWithType:@"IRdownrankToNoneEligibilityThreshold3rdParty" withDefaultValue:&unk_2703AF218 expectedType:v508];
  downrankToNoneEligibilityThreshold3rdParty = self->_downrankToNoneEligibilityThreshold3rdParty;
  self->_downrankToNoneEligibilityThreshold3rdParty = v515;

  uint64_t v517 = objc_opt_class();
  v518 = [(IRPreferences *)self downrankToOneTapEligibilityThreshold3rdParty];
  objc_opt_class();
  char v519 = objc_opt_isKindOfClass();

  if (v519) {
    uint64_t v517 = objc_opt_class();
  }
  v520 = [(IRPreferences *)self downrankToOneTapEligibilityThreshold3rdParty];
  objc_opt_class();
  char v521 = objc_opt_isKindOfClass();

  if (v521) {
    uint64_t v517 = objc_opt_class();
  }
  v522 = [(IRPreferences *)self downrankToOneTapEligibilityThreshold3rdParty];
  objc_opt_class();
  char v523 = objc_opt_isKindOfClass();

  if (v523) {
    uint64_t v517 = objc_opt_class();
  }
  v524 = [(IRPreferences *)self _getKeyWithType:@"IRdownrankToOneTapEligibilityThreshold3rdParty" withDefaultValue:&unk_2703AF200 expectedType:v517];
  downrankToOneTapEligibilityThreshold3rdParty = self->_downrankToOneTapEligibilityThreshold3rdParty;
  self->_downrankToOneTapEligibilityThreshold3rdParty = v524;

  uint64_t v526 = objc_opt_class();
  v527 = [(IRPreferences *)self eligibilityInitStateIsOneTap3rdParty];
  objc_opt_class();
  char v528 = objc_opt_isKindOfClass();

  if (v528) {
    uint64_t v526 = objc_opt_class();
  }
  v529 = [(IRPreferences *)self eligibilityInitStateIsOneTap3rdParty];
  objc_opt_class();
  char v530 = objc_opt_isKindOfClass();

  if (v530) {
    uint64_t v526 = objc_opt_class();
  }
  v531 = [(IRPreferences *)self eligibilityInitStateIsOneTap3rdParty];
  objc_opt_class();
  char v532 = objc_opt_isKindOfClass();

  if (v532) {
    uint64_t v526 = objc_opt_class();
  }
  v533 = [(IRPreferences *)self _getKeyWithType:@"IReligibilityInitStateIsOneTap3rdParty" withDefaultValue:MEMORY[0x263EFFA80] expectedType:v526];
  eligibilityInitStateIsOneTap3rdParty = self->_eligibilityInitStateIsOneTap3rdParty;
  self->_eligibilityInitStateIsOneTap3rdParty = v533;

  uint64_t v535 = objc_opt_class();
  v536 = [(IRPreferences *)self downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty];
  objc_opt_class();
  char v537 = objc_opt_isKindOfClass();

  if (v537) {
    uint64_t v535 = objc_opt_class();
  }
  v538 = [(IRPreferences *)self downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty];
  objc_opt_class();
  char v539 = objc_opt_isKindOfClass();

  if (v539) {
    uint64_t v535 = objc_opt_class();
  }
  v540 = [(IRPreferences *)self downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty];
  objc_opt_class();
  char v541 = objc_opt_isKindOfClass();

  if (v541) {
    uint64_t v535 = objc_opt_class();
  }
  v542 = [(IRPreferences *)self _getKeyWithType:@"IRdownrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty" withDefaultValue:&unk_2703AF1D0 expectedType:v535];
  downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty = self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty;
  self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty = v542;

  uint64_t v544 = objc_opt_class();
  v545 = [(IRPreferences *)self uprankToAutorouteEligibilityThreshold1stParty];
  objc_opt_class();
  char v546 = objc_opt_isKindOfClass();

  if (v546) {
    uint64_t v544 = objc_opt_class();
  }
  v547 = [(IRPreferences *)self uprankToAutorouteEligibilityThreshold1stParty];
  objc_opt_class();
  char v548 = objc_opt_isKindOfClass();

  if (v548) {
    uint64_t v544 = objc_opt_class();
  }
  v549 = [(IRPreferences *)self uprankToAutorouteEligibilityThreshold1stParty];
  objc_opt_class();
  char v550 = objc_opt_isKindOfClass();

  if (v550) {
    uint64_t v544 = objc_opt_class();
  }
  v551 = [(IRPreferences *)self _getKeyWithType:@"IRuprankToAutorouteEligibilityThreshold1stParty" withDefaultValue:&unk_2703AF218 expectedType:v544];
  uprankToAutorouteEligibilityThreshold1stParty = self->_uprankToAutorouteEligibilityThreshold1stParty;
  self->_uprankToAutorouteEligibilityThreshold1stParty = v551;

  uint64_t v553 = objc_opt_class();
  v554 = [(IRPreferences *)self uprankToOneTapEligibilityThreshold1stParty];
  objc_opt_class();
  char v555 = objc_opt_isKindOfClass();

  if (v555) {
    uint64_t v553 = objc_opt_class();
  }
  v556 = [(IRPreferences *)self uprankToOneTapEligibilityThreshold1stParty];
  objc_opt_class();
  char v557 = objc_opt_isKindOfClass();

  if (v557) {
    uint64_t v553 = objc_opt_class();
  }
  v558 = [(IRPreferences *)self uprankToOneTapEligibilityThreshold1stParty];
  objc_opt_class();
  char v559 = objc_opt_isKindOfClass();

  if (v559) {
    uint64_t v553 = objc_opt_class();
  }
  v560 = [(IRPreferences *)self _getKeyWithType:@"IRuprankToOneTapEligibilityThreshold1stParty" withDefaultValue:&unk_2703AF200 expectedType:v553];
  uprankToOneTapEligibilityThreshold1stParty = self->_uprankToOneTapEligibilityThreshold1stParty;
  self->_uprankToOneTapEligibilityThreshold1stParty = v560;

  uint64_t v562 = objc_opt_class();
  v563 = [(IRPreferences *)self downrankToNoneEligibilityThreshold1stParty];
  objc_opt_class();
  char v564 = objc_opt_isKindOfClass();

  if (v564) {
    uint64_t v562 = objc_opt_class();
  }
  v565 = [(IRPreferences *)self downrankToNoneEligibilityThreshold1stParty];
  objc_opt_class();
  char v566 = objc_opt_isKindOfClass();

  if (v566) {
    uint64_t v562 = objc_opt_class();
  }
  v567 = [(IRPreferences *)self downrankToNoneEligibilityThreshold1stParty];
  objc_opt_class();
  char v568 = objc_opt_isKindOfClass();

  if (v568) {
    uint64_t v562 = objc_opt_class();
  }
  v569 = [(IRPreferences *)self _getKeyWithType:@"IRdownrankToNoneEligibilityThreshold1stParty" withDefaultValue:&unk_2703AF218 expectedType:v562];
  downrankToNoneEligibilityThreshold1stParty = self->_downrankToNoneEligibilityThreshold1stParty;
  self->_downrankToNoneEligibilityThreshold1stParty = v569;

  uint64_t v571 = objc_opt_class();
  v572 = [(IRPreferences *)self downrankToOneTapEligibilityThreshold1stParty];
  objc_opt_class();
  char v573 = objc_opt_isKindOfClass();

  if (v573) {
    uint64_t v571 = objc_opt_class();
  }
  v574 = [(IRPreferences *)self downrankToOneTapEligibilityThreshold1stParty];
  objc_opt_class();
  char v575 = objc_opt_isKindOfClass();

  if (v575) {
    uint64_t v571 = objc_opt_class();
  }
  v576 = [(IRPreferences *)self downrankToOneTapEligibilityThreshold1stParty];
  objc_opt_class();
  char v577 = objc_opt_isKindOfClass();

  if (v577) {
    uint64_t v571 = objc_opt_class();
  }
  v578 = [(IRPreferences *)self _getKeyWithType:@"IRdownrankToOneTapEligibilityThreshold1stParty" withDefaultValue:&unk_2703AF200 expectedType:v571];
  downrankToOneTapEligibilityThreshold1stParty = self->_downrankToOneTapEligibilityThreshold1stParty;
  self->_downrankToOneTapEligibilityThreshold1stParty = v578;

  uint64_t v580 = objc_opt_class();
  v581 = [(IRPreferences *)self eligibilityInitStateIsOneTap1stParty];
  objc_opt_class();
  char v582 = objc_opt_isKindOfClass();

  if (v582) {
    uint64_t v580 = objc_opt_class();
  }
  v583 = [(IRPreferences *)self eligibilityInitStateIsOneTap1stParty];
  objc_opt_class();
  char v584 = objc_opt_isKindOfClass();

  if (v584) {
    uint64_t v580 = objc_opt_class();
  }
  v585 = [(IRPreferences *)self eligibilityInitStateIsOneTap1stParty];
  objc_opt_class();
  char v586 = objc_opt_isKindOfClass();

  if (v586) {
    uint64_t v580 = objc_opt_class();
  }
  v587 = [(IRPreferences *)self _getKeyWithType:@"IReligibilityInitStateIsOneTap1stParty" withDefaultValue:MEMORY[0x263EFFA80] expectedType:v580];
  eligibilityInitStateIsOneTap1stParty = self->_eligibilityInitStateIsOneTap1stParty;
  self->_eligibilityInitStateIsOneTap1stParty = v587;

  uint64_t v589 = objc_opt_class();
  v590 = [(IRPreferences *)self downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty];
  objc_opt_class();
  char v591 = objc_opt_isKindOfClass();

  if (v591) {
    uint64_t v589 = objc_opt_class();
  }
  v592 = [(IRPreferences *)self downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty];
  objc_opt_class();
  char v593 = objc_opt_isKindOfClass();

  if (v593) {
    uint64_t v589 = objc_opt_class();
  }
  v594 = [(IRPreferences *)self downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty];
  objc_opt_class();
  char v595 = objc_opt_isKindOfClass();

  if (v595) {
    uint64_t v589 = objc_opt_class();
  }
  v596 = [(IRPreferences *)self _getKeyWithType:@"IRdownrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty" withDefaultValue:&unk_2703AF1D0 expectedType:v589];
  downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty = self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty;
  self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty = v596;

  uint64_t v598 = objc_opt_class();
  v599 = [(IRPreferences *)self pickerAutoSelectToPicketChoiceMinInterval];
  objc_opt_class();
  char v600 = objc_opt_isKindOfClass();

  if (v600) {
    uint64_t v598 = objc_opt_class();
  }
  v601 = [(IRPreferences *)self pickerAutoSelectToPicketChoiceMinInterval];
  objc_opt_class();
  char v602 = objc_opt_isKindOfClass();

  if (v602) {
    uint64_t v598 = objc_opt_class();
  }
  v603 = [(IRPreferences *)self pickerAutoSelectToPicketChoiceMinInterval];
  objc_opt_class();
  char v604 = objc_opt_isKindOfClass();

  if (v604) {
    uint64_t v598 = objc_opt_class();
  }
  v605 = [(IRPreferences *)self _getKeyWithType:@"IRpickerAutoSelectToPicketChoiceMinInterval" withDefaultValue:&unk_2703AF158 expectedType:v598];
  pickerAutoSelectToPicketChoiceMinInterval = self->_pickerAutoSelectToPicketChoiceMinInterval;
  self->_pickerAutoSelectToPicketChoiceMinInterval = v605;

  uint64_t v607 = objc_opt_class();
  v608 = [(IRPreferences *)self brokeredUseScansForEligibilityOfMainDevice];
  objc_opt_class();
  char v609 = objc_opt_isKindOfClass();

  if (v609) {
    uint64_t v607 = objc_opt_class();
  }
  v610 = [(IRPreferences *)self brokeredUseScansForEligibilityOfMainDevice];
  objc_opt_class();
  char v611 = objc_opt_isKindOfClass();

  if (v611) {
    uint64_t v607 = objc_opt_class();
  }
  v612 = [(IRPreferences *)self brokeredUseScansForEligibilityOfMainDevice];
  objc_opt_class();
  char v613 = objc_opt_isKindOfClass();

  if (v613) {
    uint64_t v607 = objc_opt_class();
  }
  v614 = [(IRPreferences *)self _getKeyWithType:@"IRbrokeredUseScansForEligibilityOfMainDevice" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v607];
  brokeredUseScansForEligibilityOfMainDevice = self->_brokeredUseScansForEligibilityOfMainDevice;
  self->_brokeredUseScansForEligibilityOfMainDevice = v614;

  uint64_t v616 = objc_opt_class();
  v617 = [(IRPreferences *)self brokeredUseScansForEligibilityOfSecondaryDevice];
  objc_opt_class();
  char v618 = objc_opt_isKindOfClass();

  if (v618) {
    uint64_t v616 = objc_opt_class();
  }
  v619 = [(IRPreferences *)self brokeredUseScansForEligibilityOfSecondaryDevice];
  objc_opt_class();
  char v620 = objc_opt_isKindOfClass();

  if (v620) {
    uint64_t v616 = objc_opt_class();
  }
  v621 = [(IRPreferences *)self brokeredUseScansForEligibilityOfSecondaryDevice];
  objc_opt_class();
  char v622 = objc_opt_isKindOfClass();

  if (v622) {
    uint64_t v616 = objc_opt_class();
  }
  v623 = [(IRPreferences *)self _getKeyWithType:@"IRbrokeredUseScansForEligibilityOfSecondaryDevice" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v616];
  brokeredUseScansForEligibilityOfSecondaryDevice = self->_brokeredUseScansForEligibilityOfSecondaryDevice;
  self->_brokeredUseScansForEligibilityOfSecondaryDevice = v623;

  uint64_t v625 = objc_opt_class();
  v626 = [(IRPreferences *)self miloSameSpaceRatioThreshold];
  objc_opt_class();
  char v627 = objc_opt_isKindOfClass();

  if (v627) {
    uint64_t v625 = objc_opt_class();
  }
  v628 = [(IRPreferences *)self miloSameSpaceRatioThreshold];
  objc_opt_class();
  char v629 = objc_opt_isKindOfClass();

  if (v629) {
    uint64_t v625 = objc_opt_class();
  }
  v630 = [(IRPreferences *)self miloSameSpaceRatioThreshold];
  objc_opt_class();
  char v631 = objc_opt_isKindOfClass();

  if (v631) {
    uint64_t v625 = objc_opt_class();
  }
  v632 = [(IRPreferences *)self _getKeyWithType:@"IRmiloSameSpaceRatioThreshold" withDefaultValue:&unk_2703AF470 expectedType:v625];
  miloSameSpaceRatioThreshold = self->_miloSameSpaceRatioThreshold;
  self->_miloSameSpaceRatioThreshold = v632;

  uint64_t v634 = objc_opt_class();
  v635 = [(IRPreferences *)self miloSameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v636 = objc_opt_isKindOfClass();

  if (v636) {
    uint64_t v634 = objc_opt_class();
  }
  v637 = [(IRPreferences *)self miloSameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v638 = objc_opt_isKindOfClass();

  if (v638) {
    uint64_t v634 = objc_opt_class();
  }
  v639 = [(IRPreferences *)self miloSameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v640 = objc_opt_isKindOfClass();

  if (v640) {
    uint64_t v634 = objc_opt_class();
  }
  v641 = [(IRPreferences *)self _getKeyWithType:@"IRmiloSameSpaceEventsTimeIntervalSeconds" withDefaultValue:&unk_2703AF170 expectedType:v634];
  miloSameSpaceEventsTimeIntervalSeconds = self->_miloSameSpaceEventsTimeIntervalSeconds;
  self->_miloSameSpaceEventsTimeIntervalSeconds = v641;

  uint64_t v643 = objc_opt_class();
  v644 = [(IRPreferences *)self miloSameSpaceEventsNumberOfEventsToWatch];
  objc_opt_class();
  char v645 = objc_opt_isKindOfClass();

  if (v645) {
    uint64_t v643 = objc_opt_class();
  }
  v646 = [(IRPreferences *)self miloSameSpaceEventsNumberOfEventsToWatch];
  objc_opt_class();
  char v647 = objc_opt_isKindOfClass();

  if (v647) {
    uint64_t v643 = objc_opt_class();
  }
  v648 = [(IRPreferences *)self miloSameSpaceEventsNumberOfEventsToWatch];
  objc_opt_class();
  char v649 = objc_opt_isKindOfClass();

  if (v649) {
    uint64_t v643 = objc_opt_class();
  }
  v650 = [(IRPreferences *)self _getKeyWithType:@"IRmiloSameSpaceEventsNumberOfEventsToWatch" withDefaultValue:&unk_2703AF230 expectedType:v643];
  miloSameSpaceEventsNumberOfEventsToWatch = self->_miloSameSpaceEventsNumberOfEventsToWatch;
  self->_miloSameSpaceEventsNumberOfEventsToWatch = v650;

  uint64_t v652 = objc_opt_class();
  v653 = [(IRPreferences *)self loiSameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v654 = objc_opt_isKindOfClass();

  if (v654) {
    uint64_t v652 = objc_opt_class();
  }
  v655 = [(IRPreferences *)self loiSameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v656 = objc_opt_isKindOfClass();

  if (v656) {
    uint64_t v652 = objc_opt_class();
  }
  v657 = [(IRPreferences *)self loiSameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v658 = objc_opt_isKindOfClass();

  if (v658) {
    uint64_t v652 = objc_opt_class();
  }
  v659 = [(IRPreferences *)self _getKeyWithType:@"IRloiSameSpaceEventsTimeIntervalSeconds" withDefaultValue:&unk_2703AF170 expectedType:v652];
  loiSameSpaceEventsTimeIntervalSeconds = self->_loiSameSpaceEventsTimeIntervalSeconds;
  self->_loiSameSpaceEventsTimeIntervalSeconds = v659;

  uint64_t v661 = objc_opt_class();
  v662 = [(IRPreferences *)self loiSameSpaceEventsNumberOfEventsToWatch];
  objc_opt_class();
  char v663 = objc_opt_isKindOfClass();

  if (v663) {
    uint64_t v661 = objc_opt_class();
  }
  v664 = [(IRPreferences *)self loiSameSpaceEventsNumberOfEventsToWatch];
  objc_opt_class();
  char v665 = objc_opt_isKindOfClass();

  if (v665) {
    uint64_t v661 = objc_opt_class();
  }
  v666 = [(IRPreferences *)self loiSameSpaceEventsNumberOfEventsToWatch];
  objc_opt_class();
  char v667 = objc_opt_isKindOfClass();

  if (v667) {
    uint64_t v661 = objc_opt_class();
  }
  v668 = [(IRPreferences *)self _getKeyWithType:@"IRloiSameSpaceEventsNumberOfEventsToWatch" withDefaultValue:&unk_2703AF2C0 expectedType:v661];
  loiSameSpaceEventsNumberOfEventsToWatch = self->_loiSameSpaceEventsNumberOfEventsToWatch;
  self->_loiSameSpaceEventsNumberOfEventsToWatch = v668;

  uint64_t v670 = objc_opt_class();
  v671 = [(IRPreferences *)self loiSameSpaceOverrideBrokerForAVODIDArray];
  objc_opt_class();
  char v672 = objc_opt_isKindOfClass();

  if (v672) {
    uint64_t v670 = objc_opt_class();
  }
  v673 = [(IRPreferences *)self loiSameSpaceOverrideBrokerForAVODIDArray];
  objc_opt_class();
  char v674 = objc_opt_isKindOfClass();

  if (v674) {
    uint64_t v670 = objc_opt_class();
  }
  v675 = [(IRPreferences *)self loiSameSpaceOverrideBrokerForAVODIDArray];
  objc_opt_class();
  char v676 = objc_opt_isKindOfClass();

  if (v676) {
    uint64_t v670 = objc_opt_class();
  }
  v677 = [MEMORY[0x263EFF8C0] array];
  v678 = [(IRPreferences *)self _getKeyWithType:@"IRloiSameSpaceOverrideBrokerForAVODIDArray" withDefaultValue:v677 expectedType:v670];
  loiSameSpaceOverrideBrokerForAVODIDArray = self->_loiSameSpaceOverrideBrokerForAVODIDArray;
  self->_loiSameSpaceOverrideBrokerForAVODIDArray = v678;

  uint64_t v680 = objc_opt_class();
  v681 = [(IRPreferences *)self loiSameSpaceOverrideBrokerForCandidateIDArray];
  objc_opt_class();
  char v682 = objc_opt_isKindOfClass();

  if (v682) {
    uint64_t v680 = objc_opt_class();
  }
  v683 = [(IRPreferences *)self loiSameSpaceOverrideBrokerForCandidateIDArray];
  objc_opt_class();
  char v684 = objc_opt_isKindOfClass();

  if (v684) {
    uint64_t v680 = objc_opt_class();
  }
  v685 = [(IRPreferences *)self loiSameSpaceOverrideBrokerForCandidateIDArray];
  objc_opt_class();
  char v686 = objc_opt_isKindOfClass();

  if (v686) {
    uint64_t v680 = objc_opt_class();
  }
  v687 = [MEMORY[0x263EFF8C0] array];
  v688 = [(IRPreferences *)self _getKeyWithType:@"IRloiSameSpaceOverrideBrokerForCandidateIDArray" withDefaultValue:v687 expectedType:v680];
  loiSameSpaceOverrideBrokerForCandidateIDArray = self->_loiSameSpaceOverrideBrokerForCandidateIDArray;
  self->_loiSameSpaceOverrideBrokerForCandidateIDArray = v688;

  uint64_t v690 = objc_opt_class();
  v691 = [(IRPreferences *)self historySameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v692 = objc_opt_isKindOfClass();

  if (v692) {
    uint64_t v690 = objc_opt_class();
  }
  v693 = [(IRPreferences *)self historySameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v694 = objc_opt_isKindOfClass();

  if (v694) {
    uint64_t v690 = objc_opt_class();
  }
  v695 = [(IRPreferences *)self historySameSpaceEventsTimeIntervalSeconds];
  objc_opt_class();
  char v696 = objc_opt_isKindOfClass();

  if (v696) {
    uint64_t v690 = objc_opt_class();
  }
  v697 = [(IRPreferences *)self _getKeyWithType:@"IRhistorySameSpaceEventsTimeIntervalSeconds" withDefaultValue:&unk_2703AF170 expectedType:v690];
  historySameSpaceEventsTimeIntervalSeconds = self->_historySameSpaceEventsTimeIntervalSeconds;
  self->_historySameSpaceEventsTimeIntervalSeconds = v697;

  uint64_t v699 = objc_opt_class();
  v700 = [(IRPreferences *)self candidateSelectorMostUsedSimilarAppTimeIntervalSeconds];
  objc_opt_class();
  char v701 = objc_opt_isKindOfClass();

  if (v701) {
    uint64_t v699 = objc_opt_class();
  }
  v702 = [(IRPreferences *)self candidateSelectorMostUsedSimilarAppTimeIntervalSeconds];
  objc_opt_class();
  char v703 = objc_opt_isKindOfClass();

  if (v703) {
    uint64_t v699 = objc_opt_class();
  }
  v704 = [(IRPreferences *)self candidateSelectorMostUsedSimilarAppTimeIntervalSeconds];
  objc_opt_class();
  char v705 = objc_opt_isKindOfClass();

  if (v705) {
    uint64_t v699 = objc_opt_class();
  }
  v706 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorMostUsedSimilarAppTimeIntervalSeconds" withDefaultValue:&unk_2703AF170 expectedType:v699];
  candidateSelectorMostUsedSimilarAppTimeIntervalSeconds = self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds;
  self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds = v706;

  uint64_t v708 = objc_opt_class();
  v709 = [(IRPreferences *)self candidateSelectorMostUsedAnyAppTimeIntervalSeconds];
  objc_opt_class();
  char v710 = objc_opt_isKindOfClass();

  if (v710) {
    uint64_t v708 = objc_opt_class();
  }
  v711 = [(IRPreferences *)self candidateSelectorMostUsedAnyAppTimeIntervalSeconds];
  objc_opt_class();
  char v712 = objc_opt_isKindOfClass();

  if (v712) {
    uint64_t v708 = objc_opt_class();
  }
  v713 = [(IRPreferences *)self candidateSelectorMostUsedAnyAppTimeIntervalSeconds];
  objc_opt_class();
  char v714 = objc_opt_isKindOfClass();

  if (v714) {
    uint64_t v708 = objc_opt_class();
  }
  v715 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorMostUsedAnyAppTimeIntervalSeconds" withDefaultValue:&unk_2703AF170 expectedType:v708];
  candidateSelectorMostUsedAnyAppTimeIntervalSeconds = self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds;
  self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds = v715;

  uint64_t v717 = objc_opt_class();
  v718 = [(IRPreferences *)self candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds];
  objc_opt_class();
  char v719 = objc_opt_isKindOfClass();

  if (v719) {
    uint64_t v717 = objc_opt_class();
  }
  v720 = [(IRPreferences *)self candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds];
  objc_opt_class();
  char v721 = objc_opt_isKindOfClass();

  if (v721) {
    uint64_t v717 = objc_opt_class();
  }
  v722 = [(IRPreferences *)self candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds];
  objc_opt_class();
  char v723 = objc_opt_isKindOfClass();

  if (v723) {
    uint64_t v717 = objc_opt_class();
  }
  v724 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds" withDefaultValue:&unk_2703AF170 expectedType:v717];
  candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds = self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds;
  self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds = v724;

  uint64_t v726 = objc_opt_class();
  v727 = [(IRPreferences *)self candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents];
  objc_opt_class();
  char v728 = objc_opt_isKindOfClass();

  if (v728) {
    uint64_t v726 = objc_opt_class();
  }
  v729 = [(IRPreferences *)self candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents];
  objc_opt_class();
  char v730 = objc_opt_isKindOfClass();

  if (v730) {
    uint64_t v726 = objc_opt_class();
  }
  v731 = [(IRPreferences *)self candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents];
  objc_opt_class();
  char v732 = objc_opt_isKindOfClass();

  if (v732) {
    uint64_t v726 = objc_opt_class();
  }
  v733 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorMostUsedSimilarAppMaximumNumberOfEvents" withDefaultValue:&unk_2703AF1B8 expectedType:v726];
  candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents = self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents;
  self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents = v733;

  uint64_t v735 = objc_opt_class();
  v736 = [(IRPreferences *)self candidateSelectorMostUsedAnyAppMaximumNumberOfEvents];
  objc_opt_class();
  char v737 = objc_opt_isKindOfClass();

  if (v737) {
    uint64_t v735 = objc_opt_class();
  }
  v738 = [(IRPreferences *)self candidateSelectorMostUsedAnyAppMaximumNumberOfEvents];
  objc_opt_class();
  char v739 = objc_opt_isKindOfClass();

  if (v739) {
    uint64_t v735 = objc_opt_class();
  }
  v740 = [(IRPreferences *)self candidateSelectorMostUsedAnyAppMaximumNumberOfEvents];
  objc_opt_class();
  char v741 = objc_opt_isKindOfClass();

  if (v741) {
    uint64_t v735 = objc_opt_class();
  }
  v742 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorMostUsedAnyAppMaximumNumberOfEvents" withDefaultValue:&unk_2703AF1B8 expectedType:v735];
  candidateSelectorMostUsedAnyAppMaximumNumberOfEvents = self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents;
  self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents = v742;

  uint64_t v744 = objc_opt_class();
  v745 = [(IRPreferences *)self candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents];
  objc_opt_class();
  char v746 = objc_opt_isKindOfClass();

  if (v746) {
    uint64_t v744 = objc_opt_class();
  }
  v747 = [(IRPreferences *)self candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents];
  objc_opt_class();
  char v748 = objc_opt_isKindOfClass();

  if (v748) {
    uint64_t v744 = objc_opt_class();
  }
  v749 = [(IRPreferences *)self candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents];
  objc_opt_class();
  char v750 = objc_opt_isKindOfClass();

  if (v750) {
    uint64_t v744 = objc_opt_class();
  }
  v751 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents" withDefaultValue:&unk_2703AF200 expectedType:v744];
  candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents = self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents;
  self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents = v751;

  uint64_t v753 = objc_opt_class();
  v754 = [(IRPreferences *)self candidateSelectorIsContinuityEnabled];
  objc_opt_class();
  char v755 = objc_opt_isKindOfClass();

  if (v755) {
    uint64_t v753 = objc_opt_class();
  }
  v756 = [(IRPreferences *)self candidateSelectorIsContinuityEnabled];
  objc_opt_class();
  char v757 = objc_opt_isKindOfClass();

  if (v757) {
    uint64_t v753 = objc_opt_class();
  }
  v758 = [(IRPreferences *)self candidateSelectorIsContinuityEnabled];
  objc_opt_class();
  char v759 = objc_opt_isKindOfClass();

  if (v759) {
    uint64_t v753 = objc_opt_class();
  }
  v760 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorIsContinuityEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v753];
  candidateSelectorIsContinuityEnabled = self->_candidateSelectorIsContinuityEnabled;
  self->_candidateSelectorIsContinuityEnabled = v760;

  uint64_t v762 = objc_opt_class();
  v763 = [(IRPreferences *)self candidateSelectorIsMostUsedSimilarAppEnabled];
  objc_opt_class();
  char v764 = objc_opt_isKindOfClass();

  if (v764) {
    uint64_t v762 = objc_opt_class();
  }
  v765 = [(IRPreferences *)self candidateSelectorIsMostUsedSimilarAppEnabled];
  objc_opt_class();
  char v766 = objc_opt_isKindOfClass();

  if (v766) {
    uint64_t v762 = objc_opt_class();
  }
  v767 = [(IRPreferences *)self candidateSelectorIsMostUsedSimilarAppEnabled];
  objc_opt_class();
  char v768 = objc_opt_isKindOfClass();

  if (v768) {
    uint64_t v762 = objc_opt_class();
  }
  v769 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorIsMostUsedSimilarAppEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v762];
  candidateSelectorIsMostUsedSimilarAppEnabled = self->_candidateSelectorIsMostUsedSimilarAppEnabled;
  self->_candidateSelectorIsMostUsedSimilarAppEnabled = v769;

  uint64_t v771 = objc_opt_class();
  v772 = [(IRPreferences *)self candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled];
  objc_opt_class();
  char v773 = objc_opt_isKindOfClass();

  if (v773) {
    uint64_t v771 = objc_opt_class();
  }
  v774 = [(IRPreferences *)self candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled];
  objc_opt_class();
  char v775 = objc_opt_isKindOfClass();

  if (v775) {
    uint64_t v771 = objc_opt_class();
  }
  v776 = [(IRPreferences *)self candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled];
  objc_opt_class();
  char v777 = objc_opt_isKindOfClass();

  if (v777) {
    uint64_t v771 = objc_opt_class();
  }
  v778 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v771];
  candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled = self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled;
  self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled = v778;

  uint64_t v780 = objc_opt_class();
  v781 = [(IRPreferences *)self candidateSelectorIsNearestRangeEnabled];
  objc_opt_class();
  char v782 = objc_opt_isKindOfClass();

  if (v782) {
    uint64_t v780 = objc_opt_class();
  }
  v783 = [(IRPreferences *)self candidateSelectorIsNearestRangeEnabled];
  objc_opt_class();
  char v784 = objc_opt_isKindOfClass();

  if (v784) {
    uint64_t v780 = objc_opt_class();
  }
  v785 = [(IRPreferences *)self candidateSelectorIsNearestRangeEnabled];
  objc_opt_class();
  char v786 = objc_opt_isKindOfClass();

  if (v786) {
    uint64_t v780 = objc_opt_class();
  }
  v787 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorIsNearestRangeEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v780];
  candidateSelectorIsNearestRangeEnabled = self->_candidateSelectorIsNearestRangeEnabled;
  self->_candidateSelectorIsNearestRangeEnabled = v787;

  uint64_t v789 = objc_opt_class();
  v790 = [(IRPreferences *)self candidateSelectorIsMostUsedAnyAppEnabled];
  objc_opt_class();
  char v791 = objc_opt_isKindOfClass();

  if (v791) {
    uint64_t v789 = objc_opt_class();
  }
  v792 = [(IRPreferences *)self candidateSelectorIsMostUsedAnyAppEnabled];
  objc_opt_class();
  char v793 = objc_opt_isKindOfClass();

  if (v793) {
    uint64_t v789 = objc_opt_class();
  }
  v794 = [(IRPreferences *)self candidateSelectorIsMostUsedAnyAppEnabled];
  objc_opt_class();
  char v795 = objc_opt_isKindOfClass();

  if (v795) {
    uint64_t v789 = objc_opt_class();
  }
  v796 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorIsMostUsedAnyAppEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v789];
  candidateSelectorIsMostUsedAnyAppEnabled = self->_candidateSelectorIsMostUsedAnyAppEnabled;
  self->_candidateSelectorIsMostUsedAnyAppEnabled = v796;

  uint64_t v798 = objc_opt_class();
  v799 = [(IRPreferences *)self candidateSelectorAllowSelectByUWB];
  objc_opt_class();
  char v800 = objc_opt_isKindOfClass();

  if (v800) {
    uint64_t v798 = objc_opt_class();
  }
  v801 = [(IRPreferences *)self candidateSelectorAllowSelectByUWB];
  objc_opt_class();
  char v802 = objc_opt_isKindOfClass();

  if (v802) {
    uint64_t v798 = objc_opt_class();
  }
  v803 = [(IRPreferences *)self candidateSelectorAllowSelectByUWB];
  objc_opt_class();
  char v804 = objc_opt_isKindOfClass();

  if (v804) {
    uint64_t v798 = objc_opt_class();
  }
  v805 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorAllowSelectByUWB" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v798];
  candidateSelectorAllowSelectByUWB = self->_candidateSelectorAllowSelectByUWB;
  self->_candidateSelectorAllowSelectByUWB = v805;

  uint64_t v807 = objc_opt_class();
  v808 = [(IRPreferences *)self candidateSelectorAllowSelectByMiLo];
  objc_opt_class();
  char v809 = objc_opt_isKindOfClass();

  if (v809) {
    uint64_t v807 = objc_opt_class();
  }
  v810 = [(IRPreferences *)self candidateSelectorAllowSelectByMiLo];
  objc_opt_class();
  char v811 = objc_opt_isKindOfClass();

  if (v811) {
    uint64_t v807 = objc_opt_class();
  }
  v812 = [(IRPreferences *)self candidateSelectorAllowSelectByMiLo];
  objc_opt_class();
  char v813 = objc_opt_isKindOfClass();

  if (v813) {
    uint64_t v807 = objc_opt_class();
  }
  v814 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorAllowSelectByMiLo" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v807];
  candidateSelectorAllowSelectByMiLo = self->_candidateSelectorAllowSelectByMiLo;
  self->_candidateSelectorAllowSelectByMiLo = v814;

  uint64_t v816 = objc_opt_class();
  v817 = [(IRPreferences *)self candidateSelectorAllowSelectByBLE];
  objc_opt_class();
  char v818 = objc_opt_isKindOfClass();

  if (v818) {
    uint64_t v816 = objc_opt_class();
  }
  v819 = [(IRPreferences *)self candidateSelectorAllowSelectByBLE];
  objc_opt_class();
  char v820 = objc_opt_isKindOfClass();

  if (v820) {
    uint64_t v816 = objc_opt_class();
  }
  v821 = [(IRPreferences *)self candidateSelectorAllowSelectByBLE];
  objc_opt_class();
  char v822 = objc_opt_isKindOfClass();

  if (v822) {
    uint64_t v816 = objc_opt_class();
  }
  v823 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorAllowSelectByBLE" withDefaultValue:MEMORY[0x263EFFA80] expectedType:v816];
  candidateSelectorAllowSelectByBLE = self->_candidateSelectorAllowSelectByBLE;
  self->_candidateSelectorAllowSelectByBLE = v823;

  uint64_t v825 = objc_opt_class();
  v826 = [(IRPreferences *)self candidateSelectorAllowSelectByLOI];
  objc_opt_class();
  char v827 = objc_opt_isKindOfClass();

  if (v827) {
    uint64_t v825 = objc_opt_class();
  }
  v828 = [(IRPreferences *)self candidateSelectorAllowSelectByLOI];
  objc_opt_class();
  char v829 = objc_opt_isKindOfClass();

  if (v829) {
    uint64_t v825 = objc_opt_class();
  }
  v830 = [(IRPreferences *)self candidateSelectorAllowSelectByLOI];
  objc_opt_class();
  char v831 = objc_opt_isKindOfClass();

  if (v831) {
    uint64_t v825 = objc_opt_class();
  }
  v832 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorAllowSelectByLOI" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v825];
  candidateSelectorAllowSelectByLOI = self->_candidateSelectorAllowSelectByLOI;
  self->_candidateSelectorAllowSelectByLOI = v832;

  uint64_t v834 = objc_opt_class();
  v835 = [(IRPreferences *)self candidateSelectorAllowSelectByPDRFence];
  objc_opt_class();
  char v836 = objc_opt_isKindOfClass();

  if (v836) {
    uint64_t v834 = objc_opt_class();
  }
  v837 = [(IRPreferences *)self candidateSelectorAllowSelectByPDRFence];
  objc_opt_class();
  char v838 = objc_opt_isKindOfClass();

  if (v838) {
    uint64_t v834 = objc_opt_class();
  }
  v839 = [(IRPreferences *)self candidateSelectorAllowSelectByPDRFence];
  objc_opt_class();
  char v840 = objc_opt_isKindOfClass();

  if (v840) {
    uint64_t v834 = objc_opt_class();
  }
  v841 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorAllowSelectByPDRFence" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v834];
  candidateSelectorAllowSelectByPDRFence = self->_candidateSelectorAllowSelectByPDRFence;
  self->_candidateSelectorAllowSelectByPDRFence = v841;

  uint64_t v843 = objc_opt_class();
  v844 = [(IRPreferences *)self candidateSelectorAllowSelectByHistory];
  objc_opt_class();
  char v845 = objc_opt_isKindOfClass();

  if (v845) {
    uint64_t v843 = objc_opt_class();
  }
  v846 = [(IRPreferences *)self candidateSelectorAllowSelectByHistory];
  objc_opt_class();
  char v847 = objc_opt_isKindOfClass();

  if (v847) {
    uint64_t v843 = objc_opt_class();
  }
  v848 = [(IRPreferences *)self candidateSelectorAllowSelectByHistory];
  objc_opt_class();
  char v849 = objc_opt_isKindOfClass();

  if (v849) {
    uint64_t v843 = objc_opt_class();
  }
  v850 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorAllowSelectByHistory" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v843];
  candidateSelectorAllowSelectByHistory = self->_candidateSelectorAllowSelectByHistory;
  self->_candidateSelectorAllowSelectByHistory = v850;

  uint64_t v852 = objc_opt_class();
  v853 = [(IRPreferences *)self candidateSelectorCallToActionAppearThreshold];
  objc_opt_class();
  char v854 = objc_opt_isKindOfClass();

  if (v854) {
    uint64_t v852 = objc_opt_class();
  }
  v855 = [(IRPreferences *)self candidateSelectorCallToActionAppearThreshold];
  objc_opt_class();
  char v856 = objc_opt_isKindOfClass();

  if (v856) {
    uint64_t v852 = objc_opt_class();
  }
  v857 = [(IRPreferences *)self candidateSelectorCallToActionAppearThreshold];
  objc_opt_class();
  char v858 = objc_opt_isKindOfClass();

  if (v858) {
    uint64_t v852 = objc_opt_class();
  }
  v859 = [(IRPreferences *)self _getKeyWithType:@"IRcandidateSelectorCallToActionAppearThreshold" withDefaultValue:&unk_2703AF1D0 expectedType:v852];
  candidateSelectorCallToActionAppearThreshold = self->_candidateSelectorCallToActionAppearThreshold;
  self->_candidateSelectorCallToActionAppearThreshold = v859;

  uint64_t v861 = objc_opt_class();
  v862 = [(IRPreferences *)self pdrFenceRadiusInMeters];
  objc_opt_class();
  char v863 = objc_opt_isKindOfClass();

  if (v863) {
    uint64_t v861 = objc_opt_class();
  }
  v864 = [(IRPreferences *)self pdrFenceRadiusInMeters];
  objc_opt_class();
  char v865 = objc_opt_isKindOfClass();

  if (v865) {
    uint64_t v861 = objc_opt_class();
  }
  v866 = [(IRPreferences *)self pdrFenceRadiusInMeters];
  objc_opt_class();
  char v867 = objc_opt_isKindOfClass();

  if (v867) {
    uint64_t v861 = objc_opt_class();
  }
  v868 = [(IRPreferences *)self _getKeyWithType:@"IRpdrFenceRadiusInMeters" withDefaultValue:&unk_2703AF2D8 expectedType:v861];
  pdrFenceRadiusInMeters = self->_pdrFenceRadiusInMeters;
  self->_pdrFenceRadiusInMeters = v868;

  uint64_t v870 = objc_opt_class();
  v871 = [(IRPreferences *)self pdrFenceRadiusTimeoutInSeconds];
  objc_opt_class();
  char v872 = objc_opt_isKindOfClass();

  if (v872) {
    uint64_t v870 = objc_opt_class();
  }
  v873 = [(IRPreferences *)self pdrFenceRadiusTimeoutInSeconds];
  objc_opt_class();
  char v874 = objc_opt_isKindOfClass();

  if (v874) {
    uint64_t v870 = objc_opt_class();
  }
  v875 = [(IRPreferences *)self pdrFenceRadiusTimeoutInSeconds];
  objc_opt_class();
  char v876 = objc_opt_isKindOfClass();

  if (v876) {
    uint64_t v870 = objc_opt_class();
  }
  v877 = [(IRPreferences *)self _getKeyWithType:@"IRpdrFenceRadiusTimeoutInSeconds" withDefaultValue:&unk_2703AF128 expectedType:v870];
  pdrFenceRadiusTimeoutInSeconds = self->_pdrFenceRadiusTimeoutInSeconds;
  self->_pdrFenceRadiusTimeoutInSeconds = v877;

  uint64_t v879 = objc_opt_class();
  v880 = [(IRPreferences *)self pdrFenceOtherThanRadiusTimeoutInSeconds];
  objc_opt_class();
  char v881 = objc_opt_isKindOfClass();

  if (v881) {
    uint64_t v879 = objc_opt_class();
  }
  v882 = [(IRPreferences *)self pdrFenceOtherThanRadiusTimeoutInSeconds];
  objc_opt_class();
  char v883 = objc_opt_isKindOfClass();

  if (v883) {
    uint64_t v879 = objc_opt_class();
  }
  v884 = [(IRPreferences *)self pdrFenceOtherThanRadiusTimeoutInSeconds];
  objc_opt_class();
  char v885 = objc_opt_isKindOfClass();

  if (v885) {
    uint64_t v879 = objc_opt_class();
  }
  v886 = [(IRPreferences *)self _getKeyWithType:@"IRpdrFenceOtherThanRadiusTimeoutInSeconds" withDefaultValue:&unk_2703AF290 expectedType:v879];
  pdrFenceOtherThanRadiusTimeoutInSeconds = self->_pdrFenceOtherThanRadiusTimeoutInSeconds;
  self->_pdrFenceOtherThanRadiusTimeoutInSeconds = v886;

  uint64_t v888 = objc_opt_class();
  v889 = [(IRPreferences *)self miloRoomDetectionInCustomLOIEnabled];
  objc_opt_class();
  char v890 = objc_opt_isKindOfClass();

  if (v890) {
    uint64_t v888 = objc_opt_class();
  }
  v891 = [(IRPreferences *)self miloRoomDetectionInCustomLOIEnabled];
  objc_opt_class();
  char v892 = objc_opt_isKindOfClass();

  if (v892) {
    uint64_t v888 = objc_opt_class();
  }
  v893 = [(IRPreferences *)self miloRoomDetectionInCustomLOIEnabled];
  objc_opt_class();
  char v894 = objc_opt_isKindOfClass();

  if (v894) {
    uint64_t v888 = objc_opt_class();
  }
  v895 = [(IRPreferences *)self _getKeyWithType:@"IRmiloRoomDetectionInCustomLOIEnabled" withDefaultValue:MEMORY[0x263EFFA88] expectedType:v888];
  miloRoomDetectionInCustomLOIEnabled = self->_miloRoomDetectionInCustomLOIEnabled;
  self->_miloRoomDetectionInCustomLOIEnabled = v895;

  uint64_t v897 = objc_opt_class();
  v898 = [(IRPreferences *)self timeInSecondsWithoutUsageToAggressiveFiltering];
  objc_opt_class();
  char v899 = objc_opt_isKindOfClass();

  if (v899) {
    uint64_t v897 = objc_opt_class();
  }
  v900 = [(IRPreferences *)self timeInSecondsWithoutUsageToAggressiveFiltering];
  objc_opt_class();
  char v901 = objc_opt_isKindOfClass();

  if (v901) {
    uint64_t v897 = objc_opt_class();
  }
  v902 = [(IRPreferences *)self timeInSecondsWithoutUsageToAggressiveFiltering];
  objc_opt_class();
  char v903 = objc_opt_isKindOfClass();

  if (v903) {
    uint64_t v897 = objc_opt_class();
  }
  v904 = [(IRPreferences *)self _getKeyWithType:@"IRtimeInSecondsWithoutUsageToAggressiveFiltering" withDefaultValue:&unk_2703AF170 expectedType:v897];
  timeInSecondsWithoutUsageToAggressiveFiltering = self->_timeInSecondsWithoutUsageToAggressiveFiltering;
  self->_timeInSecondsWithoutUsageToAggressiveFiltering = v904;

  uint64_t v906 = objc_opt_class();
  v907 = [(IRPreferences *)self timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering];
  objc_opt_class();
  char v908 = objc_opt_isKindOfClass();

  if (v908) {
    uint64_t v906 = objc_opt_class();
  }
  v909 = [(IRPreferences *)self timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering];
  objc_opt_class();
  char v910 = objc_opt_isKindOfClass();

  if (v910) {
    uint64_t v906 = objc_opt_class();
  }
  v911 = [(IRPreferences *)self timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering];
  objc_opt_class();
  char v912 = objc_opt_isKindOfClass();

  if (v912) {
    uint64_t v906 = objc_opt_class();
  }
  v913 = [(IRPreferences *)self _getKeyWithType:@"IRtimeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering" withDefaultValue:&unk_2703AF1A0 expectedType:v906];
  timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering = self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering;
  self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering = v913;

  uint64_t v915 = objc_opt_class();
  v916 = [(IRPreferences *)self startDateForSignificantBundlesLookup];
  objc_opt_class();
  char v917 = objc_opt_isKindOfClass();

  if (v917) {
    uint64_t v915 = objc_opt_class();
  }
  v918 = [(IRPreferences *)self startDateForSignificantBundlesLookup];
  objc_opt_class();
  char v919 = objc_opt_isKindOfClass();

  if (v919) {
    uint64_t v915 = objc_opt_class();
  }
  v920 = [(IRPreferences *)self startDateForSignificantBundlesLookup];
  objc_opt_class();
  char v921 = objc_opt_isKindOfClass();

  if (v921) {
    uint64_t v915 = objc_opt_class();
  }
  id v924 = [MEMORY[0x263EFF910] distantPast];
  v922 = [(IRPreferences *)self _getKeyWithType:@"IRstartDateForSignificantBundlesLookup" withDefaultValue:v924 expectedType:v915];
  startDateForSignificantBundlesLookup = self->_startDateForSignificantBundlesLookup;
  self->_startDateForSignificantBundlesLookup = v922;
}

- (id)_getKeyWithType:(id)a3 withDefaultValue:(id)a4 expectedType:(Class)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IRPreferences *)self defaults];
  v11 = [v10 objectForKey:v8];

  uint64_t v12 = (os_log_t *)MEMORY[0x263F50090];
  if (!v11) {
    goto LABEL_8;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  char v14 = *v12;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
    {
      char v25 = v14;
      *(_DWORD *)uint64_t v30 = 138412802;
      *(void *)&v30[4] = v8;
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = objc_opt_class();
      *(_WORD *)&v30[22] = 2112;
      Class v31 = a5;
      id v26 = *(id *)&v30[14];
      _os_log_debug_impl(&dword_25418E000, v25, OS_LOG_TYPE_DEBUG, "#preferences, Unexpected type stored in defaults for settings key %@ . Got %@ expecting %@. Ignoring override.", v30, 0x20u);
    }
LABEL_8:
    char v16 = [(IRPreferences *)self mobileAssetSettings];
    v17 = [v16 objectForKey:v8];

    if (v17)
    {
      char v18 = objc_opt_isKindOfClass();
      id v19 = *v12;
      if (v18)
      {
        BOOL v20 = os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT);
        uint64_t v21 = v17;
        if (v20)
        {
          *(_DWORD *)uint64_t v30 = 138412546;
          *(void *)&v30[4] = v17;
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v8;
          _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_DEFAULT, "#preferences, Setting found in mobile asset storage. Setting value: %@ for key: %@", v30, 0x16u);
          uint64_t v21 = v17;
        }
LABEL_16:
        id v15 = v21;

        goto LABEL_17;
      }
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
      {
        char v27 = v19;
        v28 = objc_opt_class();
        *(_DWORD *)uint64_t v30 = 138412802;
        *(void *)&v30[4] = v8;
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v28;
        *(_WORD *)&v30[22] = 2112;
        Class v31 = a5;
        id v29 = v28;
        _os_log_debug_impl(&dword_25418E000, v27, OS_LOG_TYPE_DEBUG, "#preferences, Unexpected type stored in mobile asset for preference key %@ . Got %@ expecting %@. Ignoring mobile asset override.", v30, 0x20u);
      }
    }
    v22 = *v12;
    BOOL v23 = os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG);
    uint64_t v21 = v9;
    if (v23)
    {
      -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:]((uint64_t)v8, (uint64_t)v9, v22);
      uint64_t v21 = v9;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v30 = 138412546;
    *(void *)&v30[4] = v11;
    *(_WORD *)&v30[12] = 2112;
    *(void *)&v30[14] = v8;
    _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_DEFAULT, "#preferences, Setting found in defaults storage. Setting value: %@ for key: %@", v30, 0x16u);
  }
  id v15 = v11;
LABEL_17:

  return v15;
}

- (void)_registerForUserDefaultsRefreshNotification
{
  p_userDefaultsRefreshToken = &self->_userDefaultsRefreshToken;
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = dispatch_queue_create("com.apple.intelligentroutingd.UserDefaultsRefresh", v4);
  notify_register_dispatch("com.apple.intelligentroutingd.UserDefaultsRefresh", p_userDefaultsRefreshToken, v3, &__block_literal_global_18);
}

void __60__IRPreferences__registerForUserDefaultsRefreshNotification__block_invoke()
{
  id v0 = +[IRPreferences shared];
  [v0 refresh];
}

- (void)setMobileAssetSettingsWithMobileAssetDict:(id)a3 assetVersion:(id)a4
{
  id v6 = a3;
  char v7 = (objc_class *)MEMORY[0x263EFF9A0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  id v10 = [v6 allKeys];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __72__IRPreferences_setMobileAssetSettingsWithMobileAssetDict_assetVersion___block_invoke;
  char v18 = &unk_2653A06F0;
  id v19 = v9;
  id v20 = v6;
  id v11 = v6;
  id v12 = v9;
  [v10 enumerateObjectsUsingBlock:&v15];

  v13 = +[IRPreferences shared];
  [v13 setMobileAssetSettings:v12];

  [(IRPreferences *)self setMobileAssetVersion:v8];
  char v14 = +[IRPreferences shared];
  [v14 refresh];
}

void __72__IRPreferences_setMobileAssetSettingsWithMobileAssetDict_assetVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 hasPrefix:@"IR"])
  {
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
  else
  {
    id v5 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      id v9 = @"IR";
      _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "#preferences, Ignoring mobile asset setting '%@' which does not have %@ prefix", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (NSString)mobileAssetVersion
{
  return self->_mobileAssetVersion;
}

- (void)setMobileAssetVersion:(id)a3
{
}

- (NSString)testPreferenceString
{
  return self->_testPreferenceString;
}

- (NSNumber)testPreferenceInteger
{
  return self->_testPreferenceInteger;
}

- (NSNumber)testPreferenceDouble
{
  return self->_testPreferenceDouble;
}

- (NSArray)overrideIsAirplayForCandidateIDArray
{
  return self->_overrideIsAirplayForCandidateIDArray;
}

- (NSNumber)testMobileAssetLoad
{
  return self->_testMobileAssetLoad;
}

- (NSNumber)loadMobileAssetXPCActivityInterval
{
  return self->_loadMobileAssetXPCActivityInterval;
}

- (NSNumber)bleRssiProximityThreshold
{
  return self->_bleRssiProximityThreshold;
}

- (NSNumber)deviceRangeProximityThreshold
{
  return self->_deviceRangeProximityThreshold;
}

- (NSNumber)miloLslIsSameMiloThreshold
{
  return self->_miloLslIsSameMiloThreshold;
}

- (NSNumber)pickerChoiceOverrideIntervalSeconds
{
  return self->_pickerChoiceOverrideIntervalSeconds;
}

- (NSNumber)mediaPlaybackEventsTimeIntervalThreshold
{
  return self->_mediaPlaybackEventsTimeIntervalThreshold;
}

- (NSNumber)appleTvCtrlEventsTimeIntervalThreshold
{
  return self->_appleTvCtrlEventsTimeIntervalThreshold;
}

- (NSNumber)cleanupXPCActivityInterval
{
  return self->_cleanupXPCActivityInterval;
}

- (NSNumber)dbCleanupXPCActivityDeleteServiceThreshold
{
  return self->_dbCleanupXPCActivityDeleteServiceThreshold;
}

- (NSNumber)dbCleanupXPCActivityDeleteHistoryEventsThreshold
{
  return self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold;
}

- (NSNumber)dbCleanupXPCActivityDeleteReplayEventsThreshold
{
  return self->_dbCleanupXPCActivityDeleteReplayEventsThreshold;
}

- (NSNumber)dbCleanupXPCActivityDeleteCandidatesThreshold
{
  return self->_dbCleanupXPCActivityDeleteCandidatesThreshold;
}

- (NSNumber)miloEnable
{
  return self->_miloEnable;
}

- (NSNumber)candidateLastUsedThrForMiLoLowLatancyPowerOpt
{
  return self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt;
}

- (NSNumber)miloTimeoutForSetSpotOnRequestSeconds
{
  return self->_miloTimeoutForSetSpotOnRequestSeconds;
}

- (NSNumber)miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts
{
  return self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts;
}

- (NSNumber)ttrThrottleTimeSec
{
  return self->_ttrThrottleTimeSec;
}

- (NSNumber)ttrPeriodicThrottleTimeSec
{
  return self->_ttrPeriodicThrottleTimeSec;
}

- (NSNumber)proximitySessionRetryCountThreshold
{
  return self->_proximitySessionRetryCountThreshold;
}

- (NSNumber)nearbyDeviceRegionThreshold
{
  return self->_nearbyDeviceRegionThreshold;
}

- (NSNumber)uwbSuspendPedestrianFenceRadiusMeters
{
  return self->_uwbSuspendPedestrianFenceRadiusMeters;
}

- (NSNumber)uwbSuspendPedestrianFenceEnable
{
  return self->_uwbSuspendPedestrianFenceEnable;
}

- (NSNumber)numberOfHistoryEventsInCache
{
  return self->_numberOfHistoryEventsInCache;
}

- (NSNumber)coreAnalyticsEnable
{
  return self->_coreAnalyticsEnable;
}

- (NSNumber)coreAnalyticsXPCActivityInterval
{
  return self->_coreAnalyticsXPCActivityInterval;
}

- (NSNumber)coreAnalyticsXPCHistoryEventsValidThreshold
{
  return self->_coreAnalyticsXPCHistoryEventsValidThreshold;
}

- (NSString)coreAnalyticsWeeklyMobileAssetVersion
{
  return self->_coreAnalyticsWeeklyMobileAssetVersion;
}

- (NSNumber)coreAnalyticsSessionEnable
{
  return self->_coreAnalyticsSessionEnable;
}

- (NSNumber)coreAnalyticsSessionPeriodInSeconds
{
  return self->_coreAnalyticsSessionPeriodInSeconds;
}

- (NSNumber)mediaRulesContinuityTimeIntervalInSeconds
{
  return self->_mediaRulesContinuityTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds
{
  return self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds
{
  return self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds
{
  return self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesPickerChoiceConsistencyEnable
{
  return self->_mediaRulesPickerChoiceConsistencyEnable;
}

- (NSNumber)mediaRulesUserRejectedInLastDayEnable
{
  return self->_mediaRulesUserRejectedInLastDayEnable;
}

- (NSNumber)appleTvCtrlRulesContinuityTimeIntervalInSeconds
{
  return self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds;
}

- (NSNumber)appInFocusWindowEnableOnServiceRun
{
  return self->_appInFocusWindowEnableOnServiceRun;
}

- (NSNumber)liveOnEnable
{
  return self->_liveOnEnable;
}

- (NSNumber)liveOnTtrDebugDataRequestsEnabled
{
  return self->_liveOnTtrDebugDataRequestsEnabled;
}

- (NSNumber)liveOnTtrPeriodicDataRequestsEnabled
{
  return self->_liveOnTtrPeriodicDataRequestsEnabled;
}

- (NSNumber)numberOfUsedCandidates
{
  return self->_numberOfUsedCandidates;
}

- (NSNumber)numberOfSeenCandidates
{
  return self->_numberOfSeenCandidates;
}

- (NSNumber)candidateUpdateTimeIntervalSeconds
{
  return self->_candidateUpdateTimeIntervalSeconds;
}

- (NSNumber)uprankToAutorouteEligibilityThreshold1stParty
{
  return self->_uprankToAutorouteEligibilityThreshold1stParty;
}

- (NSNumber)uprankToOneTapEligibilityThreshold1stParty
{
  return self->_uprankToOneTapEligibilityThreshold1stParty;
}

- (NSNumber)downrankToNoneEligibilityThreshold1stParty
{
  return self->_downrankToNoneEligibilityThreshold1stParty;
}

- (NSNumber)downrankToOneTapEligibilityThreshold1stParty
{
  return self->_downrankToOneTapEligibilityThreshold1stParty;
}

- (NSNumber)downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty
{
  return self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty;
}

- (NSNumber)eligibilityInitStateIsOneTap1stParty
{
  return self->_eligibilityInitStateIsOneTap1stParty;
}

- (NSNumber)uprankToAutorouteEligibilityThreshold3rdParty
{
  return self->_uprankToAutorouteEligibilityThreshold3rdParty;
}

- (NSNumber)uprankToOneTapEligibilityThreshold3rdParty
{
  return self->_uprankToOneTapEligibilityThreshold3rdParty;
}

- (NSNumber)downrankToNoneEligibilityThreshold3rdParty
{
  return self->_downrankToNoneEligibilityThreshold3rdParty;
}

- (NSNumber)downrankToOneTapEligibilityThreshold3rdParty
{
  return self->_downrankToOneTapEligibilityThreshold3rdParty;
}

- (NSNumber)downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty
{
  return self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty;
}

- (NSNumber)eligibilityInitStateIsOneTap3rdParty
{
  return self->_eligibilityInitStateIsOneTap3rdParty;
}

- (NSNumber)pickerAutoSelectToPicketChoiceMinInterval
{
  return self->_pickerAutoSelectToPicketChoiceMinInterval;
}

- (NSNumber)brokeredUseScansForEligibilityOfMainDevice
{
  return self->_brokeredUseScansForEligibilityOfMainDevice;
}

- (NSNumber)brokeredUseScansForEligibilityOfSecondaryDevice
{
  return self->_brokeredUseScansForEligibilityOfSecondaryDevice;
}

- (NSNumber)miloSameSpaceRatioThreshold
{
  return self->_miloSameSpaceRatioThreshold;
}

- (NSNumber)miloSameSpaceEventsTimeIntervalSeconds
{
  return self->_miloSameSpaceEventsTimeIntervalSeconds;
}

- (NSNumber)miloSameSpaceEventsNumberOfEventsToWatch
{
  return self->_miloSameSpaceEventsNumberOfEventsToWatch;
}

- (NSNumber)loiSameSpaceEventsTimeIntervalSeconds
{
  return self->_loiSameSpaceEventsTimeIntervalSeconds;
}

- (NSNumber)loiSameSpaceEventsNumberOfEventsToWatch
{
  return self->_loiSameSpaceEventsNumberOfEventsToWatch;
}

- (NSArray)loiSameSpaceOverrideBrokerForCandidateIDArray
{
  return self->_loiSameSpaceOverrideBrokerForCandidateIDArray;
}

- (NSNumber)candidateSelectorMostUsedSimilarAppTimeIntervalSeconds
{
  return self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds;
}

- (NSNumber)candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents
{
  return self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents;
}

- (NSNumber)candidateSelectorMostUsedAnyAppTimeIntervalSeconds
{
  return self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds;
}

- (NSNumber)candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds
{
  return self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds;
}

- (NSNumber)candidateSelectorMostUsedAnyAppMaximumNumberOfEvents
{
  return self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents;
}

- (NSNumber)candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents
{
  return self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents;
}

- (NSNumber)candidateSelectorIsContinuityEnabled
{
  return self->_candidateSelectorIsContinuityEnabled;
}

- (NSNumber)candidateSelectorIsMostUsedSimilarAppEnabled
{
  return self->_candidateSelectorIsMostUsedSimilarAppEnabled;
}

- (NSNumber)candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled
{
  return self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled;
}

- (NSNumber)candidateSelectorIsNearestRangeEnabled
{
  return self->_candidateSelectorIsNearestRangeEnabled;
}

- (NSNumber)candidateSelectorIsMostUsedAnyAppEnabled
{
  return self->_candidateSelectorIsMostUsedAnyAppEnabled;
}

- (NSNumber)candidateSelectorAllowSelectByUWB
{
  return self->_candidateSelectorAllowSelectByUWB;
}

- (NSNumber)candidateSelectorAllowSelectByMiLo
{
  return self->_candidateSelectorAllowSelectByMiLo;
}

- (NSNumber)candidateSelectorAllowSelectByBLE
{
  return self->_candidateSelectorAllowSelectByBLE;
}

- (NSNumber)candidateSelectorAllowSelectByLOI
{
  return self->_candidateSelectorAllowSelectByLOI;
}

- (NSNumber)candidateSelectorAllowSelectByPDRFence
{
  return self->_candidateSelectorAllowSelectByPDRFence;
}

- (NSNumber)candidateSelectorAllowSelectByHistory
{
  return self->_candidateSelectorAllowSelectByHistory;
}

- (NSNumber)candidateSelectorCallToActionAppearThreshold
{
  return self->_candidateSelectorCallToActionAppearThreshold;
}

- (NSNumber)historySameSpaceEventsTimeIntervalSeconds
{
  return self->_historySameSpaceEventsTimeIntervalSeconds;
}

- (NSNumber)pdrFenceRadiusInMeters
{
  return self->_pdrFenceRadiusInMeters;
}

- (NSNumber)pdrFenceRadiusTimeoutInSeconds
{
  return self->_pdrFenceRadiusTimeoutInSeconds;
}

- (NSNumber)pdrFenceOtherThanRadiusTimeoutInSeconds
{
  return self->_pdrFenceOtherThanRadiusTimeoutInSeconds;
}

- (NSNumber)miloRoomDetectionInCustomLOIEnabled
{
  return self->_miloRoomDetectionInCustomLOIEnabled;
}

- (NSNumber)timeInSecondsWithoutUsageToAggressiveFiltering
{
  return self->_timeInSecondsWithoutUsageToAggressiveFiltering;
}

- (NSNumber)timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering
{
  return self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering;
}

- (NSDate)startDateForSignificantBundlesLookup
{
  return self->_startDateForSignificantBundlesLookup;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (int)userDefaultsRefreshToken
{
  return self->_userDefaultsRefreshToken;
}

- (void)setUserDefaultsRefreshToken:(int)a3
{
  self->_userDefaultsRefreshToken = a3;
}

- (NSMutableDictionary)mobileAssetSettings
{
  return self->_mobileAssetSettings;
}

- (void)setMobileAssetSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetSettings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_startDateForSignificantBundlesLookup, 0);
  objc_storeStrong((id *)&self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering, 0);
  objc_storeStrong((id *)&self->_timeInSecondsWithoutUsageToAggressiveFiltering, 0);
  objc_storeStrong((id *)&self->_miloRoomDetectionInCustomLOIEnabled, 0);
  objc_storeStrong((id *)&self->_pdrFenceOtherThanRadiusTimeoutInSeconds, 0);
  objc_storeStrong((id *)&self->_pdrFenceRadiusTimeoutInSeconds, 0);
  objc_storeStrong((id *)&self->_pdrFenceRadiusInMeters, 0);
  objc_storeStrong((id *)&self->_historySameSpaceEventsTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_candidateSelectorCallToActionAppearThreshold, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByHistory, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByPDRFence, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByLOI, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByBLE, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByMiLo, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByUWB, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsMostUsedAnyAppEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsNearestRangeEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsMostUsedSimilarAppEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsContinuityEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceOverrideBrokerForCandidateIDArray, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceOverrideBrokerForAVODIDArray, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceEventsNumberOfEventsToWatch, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceEventsTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_miloSameSpaceEventsNumberOfEventsToWatch, 0);
  objc_storeStrong((id *)&self->_miloSameSpaceEventsTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_miloSameSpaceRatioThreshold, 0);
  objc_storeStrong((id *)&self->_brokeredUseScansForEligibilityOfSecondaryDevice, 0);
  objc_storeStrong((id *)&self->_brokeredUseScansForEligibilityOfMainDevice, 0);
  objc_storeStrong((id *)&self->_pickerAutoSelectToPicketChoiceMinInterval, 0);
  objc_storeStrong((id *)&self->_eligibilityInitStateIsOneTap3rdParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_downrankToOneTapEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_uprankToOneTapEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_uprankToAutorouteEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_eligibilityInitStateIsOneTap1stParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_downrankToOneTapEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_uprankToOneTapEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_uprankToAutorouteEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_candidateUpdateTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_numberOfSeenCandidates, 0);
  objc_storeStrong((id *)&self->_numberOfUsedCandidates, 0);
  objc_storeStrong((id *)&self->_liveOnTtrPeriodicDataRequestsEnabled, 0);
  objc_storeStrong((id *)&self->_liveOnTtrDebugDataRequestsEnabled, 0);
  objc_storeStrong((id *)&self->_liveOnEnable, 0);
  objc_storeStrong((id *)&self->_bannersFromScreenUnlockToAppInFocusEnable, 0);
  objc_storeStrong((id *)&self->_appInFocusWindowEnableOnServiceRun, 0);
  objc_storeStrong((id *)&self->_appInFocusWindowInSeconds, 0);
  objc_storeStrong((id *)&self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesUserRejectedInLastDayEnable, 0);
  objc_storeStrong((id *)&self->_mediaRulesPickerChoiceConsistencyEnable, 0);
  objc_storeStrong((id *)&self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesContinuityTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsSessionPeriodInSeconds, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsSessionEnable, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsWeeklyMobileAssetVersion, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsStatisticsCollectionPeriodInSeconds, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsXPCHistoryEventsValidThreshold, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsXPCActivityInterval, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEnable, 0);
  objc_storeStrong((id *)&self->_numberOfEventsToSaveInDisk, 0);
  objc_storeStrong((id *)&self->_numberOfHistoryEventsInCache, 0);
  objc_storeStrong((id *)&self->_replayWriterEventsSizeToBuffer, 0);
  objc_storeStrong((id *)&self->_uwbSuspendPedestrianFenceEnable, 0);
  objc_storeStrong((id *)&self->_uwbSuspendPedestrianFenceRadiusMeters, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceRegionThreshold, 0);
  objc_storeStrong((id *)&self->_proximitySessionRetryCountThreshold, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceMeasurmentExpityTimeSeconds, 0);
  objc_storeStrong((id *)&self->_ttrPeriodicThrottleTimeSec, 0);
  objc_storeStrong((id *)&self->_ttrThrottleTimeSec, 0);
  objc_storeStrong((id *)&self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts, 0);
  objc_storeStrong((id *)&self->_miloTimeoutForSetSpotOnRequestSeconds, 0);
  objc_storeStrong((id *)&self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt, 0);
  objc_storeStrong((id *)&self->_miloEnable, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteCandidatesThreshold, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteReplayEventsThreshold, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteServiceThreshold, 0);
  objc_storeStrong((id *)&self->_cleanupXPCActivityInterval, 0);
  objc_storeStrong((id *)&self->_appleTvCtrlEventsTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackEventsTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_pickerChoiceOverrideIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_miloLslIsSameMiloThreshold, 0);
  objc_storeStrong((id *)&self->_deviceRangeProximityThreshold, 0);
  objc_storeStrong((id *)&self->_bleRssiProximityThreshold, 0);
  objc_storeStrong((id *)&self->_loadMobileAssetXPCActivityInterval, 0);
  objc_storeStrong((id *)&self->_testMobileAssetLoad, 0);
  objc_storeStrong((id *)&self->_overrideIsAirplayForCandidateIDArray, 0);
  objc_storeStrong((id *)&self->_testPreferenceDouble, 0);
  objc_storeStrong((id *)&self->_testPreferenceInteger, 0);
  objc_storeStrong((id *)&self->_testPreferenceString, 0);

  objc_storeStrong((id *)&self->_mobileAssetVersion, 0);
}

- (void)_getKeyWithType:(uint64_t)a1 withDefaultValue:(uint64_t)a2 expectedType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_25418E000, log, OS_LOG_TYPE_DEBUG, "#preferences, Returning default value for key %@ since no overwrite performed. Default value: %@", (uint8_t *)&v3, 0x16u);
}

@end