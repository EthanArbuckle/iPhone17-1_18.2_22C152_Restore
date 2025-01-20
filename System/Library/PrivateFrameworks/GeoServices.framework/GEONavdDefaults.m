@interface GEONavdDefaults
+ (id)sharedInstance;
- (BOOL)shouldUseServerSideETAs;
- (BOOL)transitTTLSupported;
- (BOOL)useConservativeDepartureForRefreshTimer;
- (double)averageWalkingSpeed;
- (double)defaultExpirationOffset;
- (double)exitRegionSize;
- (double)extraLocationWaitTimeInterval;
- (double)fastWalkingSpeed;
- (double)hypothesisResponseStaleToPurgeFromDiskThresholdInSeconds;
- (double)hypothesisResponseStaleToRefreshThresholdInSeconds;
- (double)hypothesisShouldPersistThresholdInSeconds;
- (double)locationFreshnessThreshold;
- (double)locationReuseThreshold;
- (double)locationUpdateTimerInterval;
- (double)locationUpdatesDesiredAccuracyForDriving;
- (double)locationUpdatesDesiredAccuracyForTransit;
- (double)locationUpdatesDesiredAccuracyForWalking;
- (double)locationUpdatesDesiredAccuracyWhileStationaryForDriving;
- (double)locationUpdatesDesiredAccuracyWhileStationaryForTransit;
- (double)locationUpdatesDesiredAccuracyWhileStationaryForWalking;
- (double)maximumRefreshIntervalLeeway;
- (double)maximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds;
- (double)maximumUserRoutingPreferencesAge;
- (double)minimumDistanceToCompareAgainstLocationAccuracy;
- (double)minimumDistanceToConsiderLeechedLocationInMeters;
- (double)minimumDistanceToGetLocationUpdatesInMeters;
- (double)minimumExpirationOffset;
- (double)minimumTimeBetweenConsecutiveLocationUpdatesInSeconds;
- (double)minimumTimeIntervalToConsiderLeechedLocationInSeconds;
- (double)minimumTimerTimeStampFudge;
- (double)pendingStopTimeToLive;
- (double)predictionsWatchdogInterval;
- (double)refreshTimeIntervalBackoffBase;
- (double)refreshTimeIntervalBackoffMax;
- (double)refreshTimeIntervalToUseIfError;
- (double)slowWalkingSpeed;
- (double)staleLocationUseTimerInterval;
- (double)updateTimeout;
- (int64_t)maximumNumberOfDestinationsToMonitor;
- (unint64_t)accessValueThresholdToUpdateCacheEntries;
- (unint64_t)initialClientInitiatedHypothesisCacheAccessValue;
- (unint64_t)initialSelfInitiatedHypothesisCacheAccessValue;
- (unint64_t)maxRandomJitterForHypothesisWakeup;
- (unint64_t)maximumNumberOfEntriesInTheCacheUnderMemoryPressure;
- (unint64_t)maximumNumberOfLeechedLocations;
- (unint64_t)maximumNumberOfProcessingLoopRepeats;
- (unint64_t)maximumTraceFileCount;
- (unint64_t)minRandomJitterForHypothesisWakeup;
- (unint64_t)refreshEquationHighestFrequency;
- (unint64_t)refreshEquationLowestFrequency;
- (unint64_t)refreshEquationLowestFrequencyTransit;
@end

@implementation GEONavdDefaults

+ (id)sharedInstance
{
  if (qword_1EB29F4C8 != -1) {
    dispatch_once(&qword_1EB29F4C8, &__block_literal_global_8);
  }
  v2 = (void *)_MergedGlobals_182;

  return v2;
}

- (double)minimumTimeIntervalToConsiderLeechedLocationInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumTimeIntervalToConsiderLeechedLocationInSeconds, (uint64_t)off_1E91143C8);
}

- (double)minimumDistanceToConsiderLeechedLocationInMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumDistanceToConsiderLeechedLocation, (uint64_t)off_1E91143B8);
}

void __33__GEONavdDefaults_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEONavdDefaults);
  v1 = (void *)_MergedGlobals_182;
  _MergedGlobals_182 = (uint64_t)v0;
}

- (double)minimumDistanceToGetLocationUpdatesInMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumDistanceToGetLocationUpdates, (uint64_t)off_1E91143A8);
}

- (double)locationUpdatesDesiredAccuracyWhileStationaryForDriving
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyWhileStationaryForDriving, (uint64_t)off_1E91143D8);
}

- (double)locationUpdatesDesiredAccuracyWhileStationaryForWalking
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyWhileStationaryForWalking, (uint64_t)off_1E91143E8);
}

- (double)locationUpdatesDesiredAccuracyWhileStationaryForTransit
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyWhileStationaryForTransit, (uint64_t)off_1E91143F8);
}

- (double)locationUpdatesDesiredAccuracyForWalking
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyForWalking, (uint64_t)off_1E9114408);
}

- (double)locationUpdatesDesiredAccuracyForDriving
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyForDriving, (uint64_t)off_1E9114418);
}

- (double)locationUpdatesDesiredAccuracyForTransit
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyForTransit, (uint64_t)off_1E9114428);
}

- (double)locationUpdateTimerInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateTimerInterval, (uint64_t)off_1E9114438);
}

- (double)staleLocationUseTimerInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdStaleLocationUseTimerInterval, (uint64_t)off_1E9114448);
}

- (double)extraLocationWaitTimeInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdExtraLocationWaitTimeInterval, (uint64_t)off_1E9114458);
}

- (double)locationFreshnessThreshold
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationFreshnessThreshold, (uint64_t)off_1E9114468);
}

- (double)locationReuseThreshold
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationReuseThreshold, (uint64_t)off_1E9114478);
}

- (double)minimumDistanceToCompareAgainstLocationAccuracy
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumDistanceToCompareAgainstLocationAccuracy, (uint64_t)off_1E9114488);
}

- (unint64_t)initialSelfInitiatedHypothesisCacheAccessValue
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdInitialSelfInitiatedHypothesisCacheAccessValue, (uint64_t)off_1E9114498);
}

- (unint64_t)initialClientInitiatedHypothesisCacheAccessValue
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdInitialClientInitiatedHypothesisCacheAccessValue, (uint64_t)off_1E91144A8);
}

- (double)hypothesisResponseStaleToRefreshThresholdInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisResponseStaleToRefreshThresholdInSeconds, (uint64_t)off_1E91144B8);
}

- (double)hypothesisResponseStaleToPurgeFromDiskThresholdInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisResponseStaleToPurgeFromDiskThresholdInSeconds, (uint64_t)off_1E91144C8);
}

- (double)hypothesisShouldPersistThresholdInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisShouldPersistThresholdInSeconds, (uint64_t)off_1E91144D8);
}

- (unint64_t)maximumNumberOfEntriesInTheCacheUnderMemoryPressure
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumNumberOfEntriesInTheCacheUnderMemoryPressure, (uint64_t)off_1E91144E8);
}

- (int64_t)maximumNumberOfDestinationsToMonitor
{
  return GEOConfigGetInteger(GeoServicesConfig_NavdMaximumNumberOfDestinationsToMonitor, (uint64_t)off_1E91144F8);
}

- (double)pendingStopTimeToLive
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdPendingStopTimeToLiveInSeconds, (uint64_t)off_1E9114508);
}

- (double)minimumTimeBetweenConsecutiveLocationUpdatesInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumTimeBetweenConsecutiveLocationUpdatesInSeconds, (uint64_t)off_1E9114518);
}

- (double)maximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMaximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds, (uint64_t)off_1E9114528);
}

- (unint64_t)accessValueThresholdToUpdateCacheEntries
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdAccessValueThresholdToUpdateCacheEntries, (uint64_t)off_1E9114538);
}

- (unint64_t)maximumNumberOfProcessingLoopRepeats
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumNumberOfProcessingLoopRepeats, (uint64_t)off_1E9114548);
}

- (double)refreshTimeIntervalToUseIfError
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRefreshTimeIntervalToUseIfError, (uint64_t)off_1E9114558);
}

- (unint64_t)refreshEquationLowestFrequency
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRefreshEquationLowestFrequency, (uint64_t)off_1E9114568);
}

- (unint64_t)refreshEquationLowestFrequencyTransit
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRefreshEquationLowestFrequencyTransit, (uint64_t)off_1E9114578);
}

- (unint64_t)refreshEquationHighestFrequency
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRefreshEquationHighestFrequency, (uint64_t)off_1E9114588);
}

- (double)maximumRefreshIntervalLeeway
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMaximumRefreshIntervalLeeway, (uint64_t)off_1E9114598);
}

- (double)minimumTimerTimeStampFudge
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumTimerTimeStampFudge, (uint64_t)off_1E91145A8);
}

- (double)refreshTimeIntervalBackoffBase
{
  return GEOConfigGetDouble(GeoServicesConfig_NavRefreshTimeIntervalBackoffBase, (uint64_t)off_1E91145B8);
}

- (double)refreshTimeIntervalBackoffMax
{
  return GEOConfigGetDouble(GeoServicesConfig_NavRefreshTimeIntervalBackoffMax, (uint64_t)off_1E91145C8);
}

- (double)predictionsWatchdogInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdPredictionsWatchdogInterval, (uint64_t)off_1E91145D8);
}

- (double)defaultExpirationOffset
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisDefaultExpirationOffsetInSeconds, (uint64_t)off_1E91145E8);
}

- (double)minimumExpirationOffset
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisMinimumExpirationOffsetInSeconds, (uint64_t)off_1E91145F8);
}

- (unint64_t)maximumNumberOfLeechedLocations
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumNumberOfLeechedLocations, (uint64_t)off_1E9114608);
}

- (double)updateTimeout
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdUpdateTimeout, (uint64_t)off_1E9114618);
}

- (BOOL)useConservativeDepartureForRefreshTimer
{
  return GEOConfigGetBOOL(GeoServicesConfig_NavdUseConservativeDepatureForRefreshTimer, (uint64_t)off_1E9114628);
}

- (double)maximumUserRoutingPreferencesAge
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMaximumUserRoutingPreferencesAge, (uint64_t)off_1E9114638);
}

- (unint64_t)maximumTraceFileCount
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumTraceFileCount, (uint64_t)off_1E9114648);
}

- (double)exitRegionSize
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerExitRegionSize, (uint64_t)off_1E9114658);
}

- (BOOL)shouldUseServerSideETAs
{
  return GEOConfigGetBOOL(GeoServicesConfig_NavdRouteHypothesizerShouldUseServerSideETAs, (uint64_t)off_1E9114668);
}

- (BOOL)transitTTLSupported
{
  return GEOConfigGetBOOL(GeoServicesConfig_NavdTransitTTLSupported, (uint64_t)off_1E9114678);
}

- (double)averageWalkingSpeed
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerAverageWalkingSpeed, (uint64_t)off_1E9114688);
}

- (double)slowWalkingSpeed
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerSlowWalkingSpeed, (uint64_t)off_1E9114698);
}

- (double)fastWalkingSpeed
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerFastWalkingSpeed, (uint64_t)off_1E91146A8);
}

- (unint64_t)minRandomJitterForHypothesisWakeup
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRouteHypothesizerMinJitterTime, (uint64_t)off_1E91146B8);
}

- (unint64_t)maxRandomJitterForHypothesisWakeup
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRouteHypothesizerMaxJitterTime, (uint64_t)off_1E91146C8);
}

@end