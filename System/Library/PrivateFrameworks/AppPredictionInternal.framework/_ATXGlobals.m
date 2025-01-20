@interface _ATXGlobals
+ (_ATXGlobals)sharedInstance;
+ (id)abHelperWithMobileAssetsGivenAssetClass:(Class)a3;
+ (id)abHelperWithTrialAssetsGivenAssetClass:(Class)a3;
- (BOOL)allowBehavioralPredictionsOnLockscreen;
- (BOOL)cdnDownloaderIsEnabled;
- (BOOL)disableLocationQualityChecksForHeroApp;
- (BOOL)onlyAcceptBecomeCurrentNSUAs;
- (BOOL)onlyUseEligibleForPrediction;
- (BOOL)sessionLoggingCurrentLOITypeEnable;
- (BOOL)sessionLoggingGymDistanceEnable;
- (BOOL)sessionLoggingHomeDistanceEnable;
- (BOOL)sessionLoggingSchoolDistanceEnable;
- (BOOL)sessionLoggingWorkDistanceEnable;
- (BOOL)useOriginalScreenLockStateStream;
- (_ATXGlobals)init;
- (_ATXGlobals)initWithAssetClass:(Class)a3;
- (_ATXGlobals)initWithEmptyAssetClass;
- (double)actionCoarseGeoHashDecayHalflife;
- (double)actionExperienceHighConfidenceThreshold;
- (double)actionExperienceMediumConfidenceThreshold;
- (double)actionPredictionInternalBuildSessionLogSamplingRate;
- (double)actionPredictionInternalBuildShadowLogSamplingRate;
- (double)actionPredictionSessionLogSamplingRate;
- (double)actionPredictionSessionLoggingDurationResolutionSec;
- (double)actionPredictionShadowLogSamplingRate;
- (double)actionSpecificGeoHashDecayHalflife;
- (double)airplaneModeLaunchDecayHalflife;
- (double)appActionAirplaneModeLaunchDecayHalflife;
- (double)appActionCoreMotionLaunchDecayHalflife;
- (double)appActionDayOfWeekLaunchDecayHalflife;
- (double)appActionLaunchDecayHalflife;
- (double)appActionLaunchSequenceDecayHalflife;
- (double)appActionTrendingLaunchDecayHalflife;
- (double)appActionUnlockTimeDecayHalflife;
- (double)appActionWifiSSIDLaunchDecayHalflife;
- (double)appAndActionCoarseTimePowLocationDecayHalflife;
- (double)appAndActionSpecificTimePowLocationDecayHalflife;
- (double)appCoarseGeoHashDecayHalflife;
- (double)appConfirmsCoarseGeoHashDecayHalflife;
- (double)appConfirmsDayOfWeekDecayHalflife;
- (double)appConfirmsSpecificGeoHashDecayHalflife;
- (double)appConfirmsTwoHourTimeIntervalDecayHalflife;
- (double)appDirectoryConfirmsCoarseGeohashDecayHalflife;
- (double)appDirectoryConfirmsCoarseTimePOWLocationDecayHalflife;
- (double)appDirectoryConfirmsDayOfWeekDecayHalflife;
- (double)appDirectoryConfirmsSpecificGeohashDecayHalflife;
- (double)appDirectoryConfirmsSpecificTimeDOWLocationDecayHalflife;
- (double)appDirectoryConfirmsTwoHourTimeIntervalDecayHalflife;
- (double)appDirectoryExplicitRejectsCoarseTimePOWLocationDecayHalflife;
- (double)appDirectoryLaunchDecayHalflife;
- (double)appDirectoryRejectsCoarseGeohashDecayHalflife;
- (double)appDirectoryRejectsCoarseTimePOWLocationDecayHalflife;
- (double)appDirectoryRejectsDayOfWeekDecayHalflife;
- (double)appDirectoryRejectsSpecificGeohashDecayHalflife;
- (double)appDirectoryRejectsSpecificTimeDOWLocationDecayHalflife;
- (double)appDirectoryRejectsTwoHourTimeIntervalDecayHalflife;
- (double)appExplicitRejectsCoarseTimePOWLocationDecayHalflife;
- (double)appLaunchDecayHalflife;
- (double)appLaunchesTwoHourTimeIntervalDecayHalflife;
- (double)appPredictionBlendedScoreNormalizationConstant;
- (double)appPredictionGlobalScoreMultiplierPerApp;
- (double)appPredictionSessionDataHarvestSamplingRate;
- (double)appRejectsCoarseGeoHashDecayHalflife;
- (double)appRejectsDayOfWeekDecayHalflife;
- (double)appRejectsSpecificGeoHashDecayHalflife;
- (double)appRejectsTwoHourTimeIntervalDecayHalflife;
- (double)appSpecificGeoHashDecayHalflife;
- (double)appZoom7GeoHashDecayHalflife;
- (double)behavioralHomeScreenActionMinimumConfidenceThreshold;
- (double)behavioralModeRelevanceDelay;
- (double)behavioralModeRelevanceDuration;
- (double)cacheRefreshIntervalForDisabledActionConsumerSubType;
- (double)cacheRefreshIntervalForDisabledAppConsumerSubType;
- (double)clippingThresholdForGaussianDist;
- (double)coreMotionLaunchDecayHalflife;
- (double)dayOfWeekLaunchDecayHalflife;
- (double)defaultPeriodicLoggerEnrollmentPeriodSeconds;
- (double)defaultPeriodicLoggerEnrollmentRate;
- (double)defaultPeriodicLoggerUploadIntervalSeconds;
- (double)defaultPredictionRefreshRate;
- (double)donationWeighingStrength;
- (double)heuristicActionExperienceHighConfidenceThreshold;
- (double)heuristicActionExperienceMediumConfidenceThreshold;
- (double)heuristicsBaseScore;
- (double)homeScreenAppConfirmsCoarseGeohashDecayHalflife;
- (double)homeScreenAppConfirmsCoarseTimePOWLocationDecayHalflife;
- (double)homeScreenAppConfirmsDayOfWeekDecayHalflife;
- (double)homeScreenAppConfirmsSpecificGeohashDecayHalflife;
- (double)homeScreenAppConfirmsSpecificTimeDOWLocationDecayHalflife;
- (double)homeScreenAppConfirmsTwoHourTimeIntervalDecayHalflife;
- (double)homeScreenAppExplicitRejectsCoarseTimePOWLocationDecayHalflife;
- (double)homeScreenAppRejectsCoarseGeohashDecayHalflife;
- (double)homeScreenAppRejectsCoarseTimePOWLocationDecayHalflife;
- (double)homeScreenAppRejectsDayOfWeekDecayHalflife;
- (double)homeScreenAppRejectsSpecificGeohashDecayHalflife;
- (double)homeScreenAppRejectsSpecificTimeDOWLocationDecayHalflife;
- (double)homeScreenAppRejectsTwoHourTimeIntervalDecayHalflife;
- (double)homescreenLaunchDecayHalflife;
- (double)launchAndLocationHarvesterSamplingRate;
- (double)launchSequenceDecayHalflife;
- (double)maximumActionFeedbackMeanCalculationEntryAge;
- (double)maximumSlotFeedbackDatabaseEntryAge;
- (double)maximumSlotResolutionDatabaseEntryAge;
- (double)notificationsCustomerSamplingRate;
- (double)notificationsHistoryDecayHalflife;
- (double)notificationsInternalSamplingRate;
- (double)notificationsSeedSamplingRate;
- (double)nsuaDonationWeight;
- (double)penaltyForMultipleActionsPerApp;
- (double)poiCategoryDecayHalfLife;
- (double)predictedRouteAcceptThreshold;
- (double)predictionsForMultiStageLoggingLimit;
- (double)predictionsPerAppActionLimit;
- (double)recentAppsHeuristicLookBackSeconds;
- (double)scoreThresholdForBehavioralModeRelevance;
- (double)scoreThresholdForSavingAppsToModeFiles;
- (double)scoreThresholdForSavingContactsToModeFiles;
- (double)sessionLoggingDistanceAccuracy;
- (double)sessionObjectLogSamplingRate;
- (double)shadowLogSamplingRate;
- (double)shouldIgnoreUpcomingMediaExpirationDateForTV;
- (double)slotResolutionDayOfWeekLaunchDecayHalflife;
- (double)slotResolutionLaunchDecayHalflife;
- (double)slotResolutionLocationLaunchDecayHalflife;
- (double)slotResolutionMotionTypeLaunchDecayHalflife;
- (double)slotResolutionPartOfWeekLaunchDecayHalflife;
- (double)slotResolutionPreviousLocationLaunchDecayHalflife;
- (double)slotResolutionRatioSmoothingThreshold;
- (double)slotResolutionTimeOfDayLaunchDecayHalflife;
- (double)smoothedBudgetForTimeOfDayStd;
- (double)smoothedCountForCoarseTimeOfDayStd;
- (double)smoothedCountForTimeOfDayStd;
- (double)spotlightLaunchDecayHalflife;
- (double)timeAndDayAppLaunchesDecayHalflife;
- (double)trendingLaunchDecayHalflife;
- (double)unlockTimeDecayHalflife;
- (double)wifiSSIDLaunchDecayHalflife;
- (id)abGroupIdentifier;
- (id)actionFallbacksBlendingModelVersion;
- (id)actionPredictionBlendingModelVersion;
- (id)appPredictionBlendingModelVersion;
- (id)approvedSiriKitIntents;
- (id)blacklistedAppActions;
- (id)blacklistedAppActionsForPredictions;
- (id)blacklistedAppActionsForPrimaryShortcuts;
- (id)blacklistedAppActionsForShortcuts;
- (id)blacklistedAppActionsHelper:(id)a3;
- (id)blacklistedAppsForAppPredictions;
- (id)blacklistedAppsForLockscreenPredictions;
- (id)enabledFallbackActions;
- (id)heuristicPredictionBlendingModelVersion;
- (id)initForTestingWithMobileAssetAssetsOnly;
- (id)initForTestingWithTrialAssetsOnly;
- (id)launchAndLocationHarvesterAppBlacklist;
- (id)launchAndLocationHarvesterGenreIdBlacklist;
- (id)magicalMomentsEnabledPredictionExperts;
- (id)messageContentBlacklist;
- (id)penalizedFallbackActions;
- (id)personalizationBlacklistedBundleIds;
- (id)triggerPresetMinutes;
- (id)whitelistedActionKeysForHomeScreen;
- (id)whitelistedActionTypesForAnchorModelLogging;
- (id)whitelistedActionTypesForHomeScreen;
- (id)whitelistedAnchorsForMagicalMomentsOnHomeScreen;
- (id)whitelistedBundlesForAnchorModelLogging;
- (id)whitelistedDonationDaemonBundleIds;
- (int)actionExperienceHighConfidenceAppActionCountThreshold;
- (int)actionExperienceMediumConfidenceAppActionCountThreshold;
- (int)actionPredictionFirstStageBeamWidth;
- (int)actionPredictionSessionLoggingBottomBlockMaxItemsToLog;
- (int)actionSpotlightCaptureRateActionAppLaunchThresholdSeconds;
- (int)actionSpotlightCaptureRateForwardQueryThresholdSeconds;
- (int)actionSpotlightCaptureRateSecondsAfterSessionEnd;
- (int)appConnectionMinAverageLaunches;
- (int)appConnectionMinTotalLaunches;
- (int)donationWeighingScheme;
- (int)extraAppsToLog;
- (int)extraIntentsToLog;
- (int)extraSASAppsToLog;
- (int)fallbackActionsEngagementPriorAlpha;
- (int)fallbackActionsEngagementPriorBeta;
- (int)heuristicsEngagementPriorAlpha;
- (int)heuristicsEngagementPriorBeta;
- (int)homeScreenMaxValidCacheAge;
- (int)locationOfInterestSearchRadius;
- (int)lockscreenMaxValidCacheAge;
- (int)maxDistanceToDropOffLocationInMetersForRequestRideIntent;
- (int)maxHeuristicAppActionCount;
- (int)maxMagicalMomentsPredictions;
- (int)maxNumberOfActionDataMetricsToLogViaAWD;
- (int)maxNumberOfActionTypesPerApp;
- (int)maxSettingsZKWSuggestionsToBlend;
- (int)maxValidATXActionResponseCacheAgeSec;
- (int)maximumParameterCombinations;
- (int)maximumSpotlightPredictions;
- (int)messageContentTimeElapsed;
- (int)minDistanceToDropOffLocationInMetersForRequestRideIntent;
- (int)minimumTimespanForOnceOffActions;
- (int)numberOfActionsToKeepForLogging;
- (int)numberOfRandomAppActionTypesToKeepForLogging;
- (int)numberOfRandomSlotsToKeepForLogging;
- (int)numberOfTopSASAppsToLog;
- (int)previousAppActionCompareCount;
- (int)sessionLoggingAppSequenceLength;
- (int)sessionLoggingUniqueAppActionSequenceLength;
- (int)spotlightMaxValidCacheAge;
- (unint64_t)appPredictionSessionDataHarvestingMaxItems;
- (unint64_t)maxElementsToPerisistPerEntityForModeBackup;
- (unint64_t)personalizationRequiredActionHistorySeconds;
- (unint64_t)personalizationRequiredCountForRelevance;
- (unint64_t)recentAppsHeuristicMaxRecents;
- (unint64_t)transitionLookaheadMaxSeconds;
- (unint64_t)transitionLookaheadMinSeconds;
@end

@implementation _ATXGlobals

- (_ATXGlobals)initWithAssetClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_ATXGlobals;
  v4 = [(_ATXGlobals *)&v9 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F4AF08];
    if (!a3) {
      a3 = (Class)objc_opt_class();
    }
    uint64_t v6 = [v5 dictionaryFromLazyPlistWithLegacyPathForClass:a3];
    parameters = v4->_parameters;
    v4->_parameters = (NSDictionary *)v6;
  }
  return v4;
}

- (_ATXGlobals)initWithEmptyAssetClass
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXGlobals;
  v2 = [(_ATXGlobals *)&v6 init];
  v3 = v2;
  if (v2)
  {
    parameters = v2->_parameters;
    v2->_parameters = 0;
  }
  return v3;
}

+ (id)abHelperWithTrialAssetsGivenAssetClass:(Class)a3
{
  v3 = (void *)MEMORY[0x1E4F4AF08];
  if (a3) {
    a1 = a3;
  }
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 rawDictionaryUsingTrialForResource:v4 ofType:@"plplist"];

  if (v5) {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetContents:v5];
  }
  else {
    objc_super v6 = 0;
  }

  return v6;
}

+ (id)abHelperWithMobileAssetsGivenAssetClass:(Class)a3
{
  v3 = (void *)MEMORY[0x1E4F4AF08];
  if (a3) {
    a1 = a3;
  }
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 rawDictionaryUsingMobileAssetsForResource:v4 ofType:@"plplist"];

  if (v5) {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetContents:v5];
  }
  else {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)initForTestingWithTrialAssetsOnly
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXGlobals;
  v2 = [(_ATXGlobals *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryFromLazyPlistWithLegacyPathForClass:objc_opt_class()];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;
  }
  return v2;
}

- (id)initForTestingWithMobileAssetAssetsOnly
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXGlobals;
  v2 = [(_ATXGlobals *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryFromLazyPlistWithLegacyPathForClass:objc_opt_class()];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;
  }
  return v2;
}

- (_ATXGlobals)init
{
  return [(_ATXGlobals *)self initWithAssetClass:0];
}

+ (_ATXGlobals)sharedInstance
{
  if (sharedInstance__pasOnceToken6_38 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_38, &__block_literal_global_199);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_49;
  return (_ATXGlobals *)v2;
}

- (id)abGroupIdentifier
{
  v2 = (void *)MEMORY[0x1E4F4AF08];
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 rawDictionaryUsingMobileAssetsForResource:v4 ofType:@"plplist"];

  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetContents:v5];
  v7 = [v6 groupIdentifier];

  return v7;
}

- (double)appLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homescreenLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomescreenLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)spotlightLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SpotlightLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)airplaneModeLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AirplaneModeLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)trendingLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"TrendingLaunchDecayHalfLife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)wifiSSIDLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WifiSSIDLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)coreMotionLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"CoreMotionLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)timeAndDayAppLaunchesDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"TimeAndDayAppLaunchesDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)unlockTimeDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"UnlockTimeDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)dayOfWeekLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DayOfWeekLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)launchSequenceDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LaunchSequenceDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionAirplaneModeLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionAirplaneModeLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionTrendingLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionTrendingLaunchDecayHalfLife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionWifiSSIDLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionWifiSSIDLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionCoreMotionLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionCoreMotionLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionUnlockTimeDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionUnlockTimeDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionDayOfWeekLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionDayOfWeekLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appActionLaunchSequenceDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppActionLaunchSequenceDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionTimeOfDayLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionTimeOfDayLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionPartOfWeekLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionPartOfWeekLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionDayOfWeekLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionDayOfWeekLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionLocationLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionLocationLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionPreviousLocationLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionPreviousLocationLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)slotResolutionMotionTypeLaunchDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionMotionTypeLaunchDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)notificationsHistoryDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NotificationsHistoryDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appAndActionCoarseTimePowLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppAndActionCoarseTimePowLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appAndActionSpecificTimePowLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppAndActionSpecificTimePowLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appSpecificGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppSpecificGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appCoarseGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppCoarseGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appZoom7GeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppZoom7GeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)actionSpecificGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionSpecificGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)actionCoarseGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionCoarseGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appLaunchesTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppLaunchesTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appConfirmsTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppConfirmsTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appRejectsTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppRejectsTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appConfirmsDayOfWeekDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppConfirmsDayOfWeekDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appRejectsDayOfWeekDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppRejectsDayOfWeekDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appConfirmsCoarseGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppConfirmsCoarseGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appRejectsCoarseGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppRejectsCoarseGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appConfirmsSpecificGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppConfirmsSpecificGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appRejectsSpecificGeoHashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppRejectsSpecificGeoHashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appExplicitRejectsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppExplicitRejectsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppConfirmsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppConfirmsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppConfirmsSpecificTimeDOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppConfirmsSpecificTimeDOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppConfirmsTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppConfirmsTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppConfirmsDayOfWeekDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppConfirmsDayOfWeekDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppConfirmsCoarseGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppConfirmsCoarseGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppConfirmsSpecificGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppConfirmsSpecificGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppRejectsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppRejectsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppRejectsSpecificTimeDOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppRejectsSpecificTimeDOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppRejectsTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppRejectsTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppRejectsDayOfWeekDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppRejectsDayOfWeekDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppRejectsCoarseGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppRejectsCoarseGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppRejectsSpecificGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppRejectsSpecificGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)homeScreenAppExplicitRejectsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenAppExplicitRejectsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryConfirmsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryConfirmsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryConfirmsSpecificTimeDOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryConfirmsSpecificTimeDOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryConfirmsTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryConfirmsTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryConfirmsDayOfWeekDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryConfirmsDayOfWeekDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryConfirmsCoarseGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryConfirmsCoarseGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryConfirmsSpecificGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryConfirmsSpecificGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryRejectsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryRejectsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryRejectsSpecificTimeDOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryRejectsSpecificTimeDOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryRejectsTwoHourTimeIntervalDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryRejectsTwoHourTimeIntervalDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryRejectsDayOfWeekDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryRejectsDayOfWeekDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryRejectsCoarseGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryRejectsCoarseGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryRejectsSpecificGeohashDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryRejectsSpecificGeohashDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)appDirectoryExplicitRejectsCoarseTimePOWLocationDecayHalflife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppDirectoryExplicitRejectsCoarseTimePOWLocationDecayHalflife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)poiCategoryDecayHalfLife
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PoiCategoryDecayHalfLife"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)sessionObjectLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionObjectLogSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)shadowLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ShadowLogSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)actionPredictionShadowLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionShadowLogSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)actionPredictionInternalBuildShadowLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionInternalBuildShadowLogSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)actionPredictionSessionLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionSessionLogSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)actionPredictionInternalBuildSessionLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionInternalBuildSessionLogSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)appPredictionSessionDataHarvestSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppPredictionSessionDataHarvestSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (unint64_t)appPredictionSessionDataHarvestingMaxItems
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppPredictionSessionDataHarvestingMaxItems"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 13;
  }

  return v4;
}

- (double)notificationsInternalSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NotificationsInternalSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (double)notificationsSeedSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NotificationsSeedSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (double)notificationsCustomerSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NotificationsCustomerSamplingRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.02;
  }

  return v5;
}

- (double)maximumSlotResolutionDatabaseEntryAge
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaximumSlotResolutionDatabaseEntryAge"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 30.0;
  }

  return v5;
}

- (double)maximumSlotFeedbackDatabaseEntryAge
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaximumSlotFeedbackDatabaseEntryAge"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 90.0;
  }

  return v5;
}

- (double)maximumActionFeedbackMeanCalculationEntryAge
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaximumActionFeedbackMeanCalculationEntryAge"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 7.0;
  }

  return v5;
}

- (int)actionPredictionFirstStageBeamWidth
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionFirstStageBeamWidth"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 10;
  }

  return v4;
}

- (int)minimumTimespanForOnceOffActions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumTimespanForOnceOffActions"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 1800;
  }

  return v4;
}

- (int)extraAppsToLog
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ExtraAppsToLog"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)numberOfTopSASAppsToLog
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NumberOfTopSASAppsToLog"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)extraSASAppsToLog
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ExtraSASAppsToLog"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)extraIntentsToLog
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ExtraIntentsToLog"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)appConnectionMinTotalLaunches
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppConnectionMinTotalLaunches"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)appConnectionMinAverageLaunches
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppConnectionMinAverageLaunches"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)heuristicActionExperienceHighConfidenceThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeuristicActionExperienceHighConfidenceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)actionExperienceHighConfidenceThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionExperienceHighConfidenceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (int)actionExperienceHighConfidenceAppActionCountThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionExperienceHighConfidenceAppActionCountThreshold"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)heuristicActionExperienceMediumConfidenceThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeuristicActionExperienceMediumConfidenceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (double)actionExperienceMediumConfidenceThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionExperienceMediumConfidenceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = INFINITY;
  }

  return v5;
}

- (int)actionExperienceMediumConfidenceAppActionCountThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionExperienceMediumConfidenceAppActionCountThreshold"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)behavioralHomeScreenActionMinimumConfidenceThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"BehavioralHomeScreenActionMinimumConfidenceThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -9000.0;
  }

  return v5;
}

- (BOOL)allowBehavioralPredictionsOnLockscreen
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AllowBehavioralPredictionsOnLockscreen"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (double)smoothedCountForTimeOfDayStd
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SmoothedCountForTimeOfDayStd"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 30.0;
  }

  return v5;
}

- (double)smoothedCountForCoarseTimeOfDayStd
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SmoothedCountForCoarseTimeOfDayStd"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 60.0;
  }

  return v5;
}

- (double)smoothedBudgetForTimeOfDayStd
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SmoothedBudgetForTimeOfDayStd"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 60.0;
  }

  return v5;
}

- (double)clippingThresholdForGaussianDist
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ClippingThresholdForGaussianDist"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2.0;
  }

  return v5;
}

- (double)slotResolutionRatioSmoothingThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SlotResolutionRatioSmoothingThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (int)locationOfInterestSearchRadius
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LocationOfInterestSearchRadius"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 400;
  }

  return v4;
}

- (id)whitelistedDonationDaemonBundleIds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionWhitelistedDonationDaemonBundleIds"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)whitelistedBundlesForAnchorModelLogging
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WhitelistedBundlesForAnchorModelLogging"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  double v5 = v4;

  return v5;
}

- (id)whitelistedActionTypesForAnchorModelLogging
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WhitelistedActionTypesForAnchorModelLogging"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  double v5 = v4;

  return v5;
}

- (id)whitelistedActionKeysForHomeScreen
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WhitelistedActionKeysForHomeScreen"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)whitelistedActionTypesForHomeScreen
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WhitelistedActionTypesForHomeScreen"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (BOOL)useOriginalScreenLockStateStream
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"UseOriginalScreenLockStateStream"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)blacklistedAppsForAppPredictions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppPredictionBlacklistedApps"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)blacklistedAppActions
{
  return [(_ATXGlobals *)self blacklistedAppActionsHelper:@"ActionPredictionBlacklistedAppActions"];
}

- (id)blacklistedAppActionsForPredictions
{
  return [(_ATXGlobals *)self blacklistedAppActionsHelper:@"ActionPredictionBlacklistedAppActionsForPredictions"];
}

- (id)blacklistedAppsForLockscreenPredictions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionBlacklistedAppActionsForLockscreenPredictions"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)blacklistedAppActionsForShortcuts
{
  return [(_ATXGlobals *)self blacklistedAppActionsHelper:@"ActionPredictionBlacklistedAppActionsForShortcuts"];
}

- (id)blacklistedAppActionsForPrimaryShortcuts
{
  return [(_ATXGlobals *)self blacklistedAppActionsHelper:@"ActionPredictionBlacklistedAppActionsForPrimaryShortcuts"];
}

- (id)blacklistedAppActionsHelper:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:a3];
  double v5 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 count] != 2)
        {
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2 object:self file:@"_ATXGlobals.m" lineNumber:714 description:@"Blacklisted item must have exactly two items"];
        }
        id v12 = objc_alloc(MEMORY[0x1E4F93BB8]);
        v13 = [v11 firstObject];
        v14 = [v11 lastObject];
        v15 = (void *)[v12 initWithFirst:v13 second:v14];
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v17 = (void *)[v5 copy];
  return v17;
}

- (int)maxMagicalMomentsPredictions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MagicalMomentsMaxPredictions"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)maxSettingsZKWSuggestionsToBlend
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SettingsZKWMaxPredictions"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 10;
  }

  return v4;
}

- (id)magicalMomentsEnabledPredictionExperts
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MagicalMomentsEnabledPredictionExperts"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  double v5 = v4;

  return v5;
}

- (double)defaultPredictionRefreshRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"CacheRefreshInterval"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 451.0;
  }

  return v5;
}

- (double)cacheRefreshIntervalForDisabledAppConsumerSubType
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"CacheRefreshIntervalForDisabledAppConsumerSubType"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 3600.0;
  }

  return v4;
}

- (double)cacheRefreshIntervalForDisabledActionConsumerSubType
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"CacheRefreshIntervalForDisabledActionConsumerSubType"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 3600.0;
  }

  return v4;
}

- (double)defaultPeriodicLoggerUploadIntervalSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PeriodicLoggerUploadIntervalSeconds"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 604801.0;
  }

  return v5;
}

- (double)defaultPeriodicLoggerEnrollmentPeriodSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PeriodicLoggerEnrollmentPeriodSeconds"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2592001.0;
  }

  return v5;
}

- (double)defaultPeriodicLoggerEnrollmentRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PeriodicLoggerEnrollmentRate"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.1;
  }

  return v5;
}

- (BOOL)sessionLoggingHomeDistanceEnable
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingHomeDistanceEnable"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)sessionLoggingWorkDistanceEnable
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingWorkDistanceEnable"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)sessionLoggingSchoolDistanceEnable
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingSchoolDistanceEnable"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)sessionLoggingGymDistanceEnable
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingGymDistanceEnable"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (double)sessionLoggingDistanceAccuracy
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingDistanceAccuracy"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 5000.0;
  }

  return v5;
}

- (BOOL)sessionLoggingCurrentLOITypeEnable
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingLOITypeEnable"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int)sessionLoggingAppSequenceLength
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingAppSequenceLength"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)sessionLoggingUniqueAppActionSequenceLength
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SessionLoggingUniqueAppActionSequenceLength"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)nsuaDonationWeight
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NSUADonationWeight"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (double)predictionsPerAppActionLimit
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PredictionsPerAppActionLimit"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (double)predictionsForMultiStageLoggingLimit
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PredictionsForMultiStageLoggingLimit"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 10.0;
  }

  return v5;
}

- (double)penaltyForMultipleActionsPerApp
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PenaltyForMultipleActionsPerApp"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -10000.0;
  }

  return v5;
}

- (id)approvedSiriKitIntents
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ApprovedSiriKitIntents"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)messageContentBlacklist
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MessageContentBlacklist"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (int)messageContentTimeElapsed
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MessageContentSecondsElapsed"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 5400;
  }

  return v4;
}

- (BOOL)onlyUseEligibleForPrediction
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"OnlyUseEligibleForPrediction"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)onlyAcceptBecomeCurrentNSUAs
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"OnlyAcceptBecomeCurrentNSUAs"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int)previousAppActionCompareCount
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PreviousAppActionCompareCount"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 3;
  }

  return v4;
}

- (int)maxHeuristicAppActionCount
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxHeuristicAppActionCount"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 2;
  }

  return v4;
}

- (int)maxValidATXActionResponseCacheAgeSec
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxValidATXResponseCacheAgeSec"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 3600;
  }

  return v4;
}

- (int)actionSpotlightCaptureRateSecondsAfterSessionEnd
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionSpotlightCaptureRateSecondsAfterSessionEnd"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 15;
  }

  return v4;
}

- (int)actionSpotlightCaptureRateForwardQueryThresholdSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionSpotlightCaptureRateForwardQueryThresholdSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 180;
  }

  return v4;
}

- (int)actionSpotlightCaptureRateActionAppLaunchThresholdSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionSpotlightCaptureRateActionAppLaunchThresholdSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 2;
  }

  return v4;
}

- (int)actionPredictionSessionLoggingBottomBlockMaxItemsToLog
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionSessionLoggingBottomBlockMaxItemsToLog"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)actionPredictionSessionLoggingDurationResolutionSec
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionSessionLoggingDurationResolutionSec"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 10.0;
  }

  return v4;
}

- (double)appPredictionGlobalScoreMultiplierPerApp
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppPredictionGlobalScoreMultiplier"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 50.0;
  }

  return v5;
}

- (double)appPredictionBlendedScoreNormalizationConstant
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppPredictionBlendedScoreNormalizationConstant"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1000.0;
  }

  return v5;
}

- (int)numberOfRandomAppActionTypesToKeepForLogging
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NumberOfRandomAppActionTypesToKeepForLogging"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 10;
  }

  return v4;
}

- (int)numberOfRandomSlotsToKeepForLogging
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NumberOfRandomSlotsToKeepForLogging"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 10;
  }

  return v4;
}

- (int)numberOfActionsToKeepForLogging
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"NumberOfActionsToKeepForLogging"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 120;
  }

  return v4;
}

- (int)maximumSpotlightPredictions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaximumSpotlightPredictions"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 3;
  }

  return v4;
}

- (int)maximumParameterCombinations
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaximumParameterCombinations"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 100;
  }

  return v4;
}

- (int)maxNumberOfActionTypesPerApp
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxNumberOfActionTypesPerApp"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 100;
  }

  return v4;
}

- (double)heuristicsBaseScore
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeuristicsBaseScore"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 20.0;
  }

  return v5;
}

- (int)heuristicsEngagementPriorAlpha
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeuristicsEngagementPriorAlpha"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 30;
  }

  return v4;
}

- (int)heuristicsEngagementPriorBeta
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeuristicsEngagementPriorBeta"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 70;
  }

  return v4;
}

- (int)fallbackActionsEngagementPriorAlpha
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FallbackActionsEngagementPriorAlpha"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 10;
  }

  return v4;
}

- (int)fallbackActionsEngagementPriorBeta
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FallbackActionsEngagementPriorBeta"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 40;
  }

  return v4;
}

- (int)donationWeighingScheme
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DonationWeighingScheme"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)donationWeighingStrength
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DonationWeighingStrength"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (int)spotlightMaxValidCacheAge
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"SpotlightMaxValidCacheAgeInSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 86400;
  }

  return v4;
}

- (int)lockscreenMaxValidCacheAge
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LockscreenMaxValidCacheAgeInSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 86400;
  }

  return v4;
}

- (int)homeScreenMaxValidCacheAge
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeScreenMaxValidCacheAgeInSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 86400;
  }

  return v4;
}

- (int)minDistanceToDropOffLocationInMetersForRequestRideIntent
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinDistanceToDropOffLocationInMetersForRequestRideIntent"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 4000;
  }

  return v4;
}

- (int)maxDistanceToDropOffLocationInMetersForRequestRideIntent
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxDistanceToDropOffLocationInMetersForRequestRideIntent"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 121000;
  }

  return v4;
}

- (double)predictedRouteAcceptThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ATXPredictedRouteAcceptThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)shouldIgnoreUpcomingMediaExpirationDateForTV
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ShouldIgnoreUpcomingMediaExpirationDateForTV"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)[v2 BOOLValue];
  }
  else {
    double v4 = 1.0;
  }

  return v4;
}

- (id)personalizationBlacklistedBundleIds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DailyRoutinesPersonalizationBlacklistedBundleIds"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (unint64_t)personalizationRequiredActionHistorySeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DailyRoutinesPersonalizationRequiredActionHistorySeconds"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 1209600;
  }

  return v4;
}

- (unint64_t)personalizationRequiredCountForRelevance
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DailyRoutinesPersonalizationRequiredCountForRelevance"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (id)triggerPresetMinutes
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DailyRoutinesTriggerPresetMinutes"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &unk_1F27F38A0;
  }
  id v4 = v2;

  return v4;
}

- (unint64_t)transitionLookaheadMaxSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DailyRoutinesTransitionLookaheadMaxSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 43200;
  }

  return v4;
}

- (unint64_t)transitionLookaheadMinSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DailyRoutinesTransitionLookaheadMinSeconds"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)appPredictionBlendingModelVersion
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppPredictionBlendingModelVersion"];
  Class v3 = NSClassFromString(&cfstr_Nsstring.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"1.0";
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)actionPredictionBlendingModelVersion
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionPredictionBlendingModelVersion"];
  Class v3 = NSClassFromString(&cfstr_Nsstring.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"1.0";
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)actionFallbacksBlendingModelVersion
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ActionFallbacksBlendingModelVersion"];
  Class v3 = NSClassFromString(&cfstr_Nsstring.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"1.0";
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)heuristicPredictionBlendingModelVersion
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeuristicPredictionBlendingModelVersion"];
  Class v3 = NSClassFromString(&cfstr_Nsstring.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"1.0";
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)enabledFallbackActions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"EnabledFallbackActions"];
  Class v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)penalizedFallbackActions
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PenalizedFallbackActions"];
  Class v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (int)maxNumberOfActionDataMetricsToLogViaAWD
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxNumberOfActionDataMetricsToLogViaAWD"];
  Class v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 10;
  }

  return v4;
}

- (double)launchAndLocationHarvesterSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LaunchAndLocationHarvesterSamplingRate"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.05;
  }

  return v5;
}

- (id)launchAndLocationHarvesterAppBlacklist
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LaunchAndLocationHarvesterAppBlacklist"];
  Class v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)launchAndLocationHarvesterGenreIdBlacklist
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LaunchAndLocationHarvesterGenreIdBlacklist"];
  Class v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (unint64_t)recentAppsHeuristicMaxRecents
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"RecentAppsHeuristicMaxRecents"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

- (double)recentAppsHeuristicLookBackSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"RecentAppsHeuristicLookBackSeconds"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3600.0;
  }

  return v5;
}

- (BOOL)cdnDownloaderIsEnabled
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ATXCDNDownloaderTriggerManagerIsEnabled"];
  Class v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)disableLocationQualityChecksForHeroApp
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DisableLocationQualityChecksForHeroApp"];
  Class v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)whitelistedAnchorsForMagicalMomentsOnHomeScreen
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WhitelistedAnchorsForMagicalMomentsOnHomeScreen"];
  Class v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (unint64_t)maxElementsToPerisistPerEntityForModeBackup
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxElementsToPerisistPerEntityForModeBackup"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (double)scoreThresholdForSavingAppsToModeFiles
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ScoreThresholdForSavingAppsToModeFiles"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.05;
  }

  return v5;
}

- (double)scoreThresholdForSavingContactsToModeFiles
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ScoreThresholdForSavingContactsToModeFiles"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.05;
  }

  return v5;
}

- (double)scoreThresholdForBehavioralModeRelevance
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ScoreThresholdForBehavioralModeRelevance"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.05;
  }

  return v5;
}

- (double)behavioralModeRelevanceDuration
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"BehavioralModeRelevanceDuration"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3600.0;
  }

  return v5;
}

- (double)behavioralModeRelevanceDelay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"BehavioralModeRelevanceDelay"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 60.0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end