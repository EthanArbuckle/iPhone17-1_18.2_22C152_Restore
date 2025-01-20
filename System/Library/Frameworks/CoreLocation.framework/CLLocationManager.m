@interface CLLocationManager
+ (BOOL)_checkAndExerciseAuthorizationForBundle:(id)a3 error:(id *)a4;
+ (BOOL)_checkAndExerciseAuthorizationForBundleID:(id)a3 error:(id *)a4;
+ (BOOL)advertiseAsBeacon:(id)a3 withPower:(id)a4;
+ (BOOL)authorizationPromptMapDisplayEnabled;
+ (BOOL)backgroundIndicatorEnabledForLocationDictionary:(id)a3;
+ (BOOL)bundleSupported:(id)a3;
+ (BOOL)correctiveCompensationStatusForLocationDictionary:(id)a3;
+ (BOOL)deferredLocationUpdatesAvailable;
+ (BOOL)dumpLogsWithMessage:(id)a3;
+ (BOOL)hasUsedBackgroundLocationServices:(id)a3;
+ (BOOL)headingAvailable;
+ (BOOL)isEntityAuthorizedForLocationDictionary:(id)a3;
+ (BOOL)isInterestZoneReleventForLocationDictionary:(id)a3;
+ (BOOL)isLocationActiveForLocationDictionary:(id)a3;
+ (BOOL)isMonitoringAvailableForClass:(Class)regionClass;
+ (BOOL)isPeerRangingAvailable;
+ (BOOL)isRangingAvailable;
+ (BOOL)isStatusBarIconEnabledForLocationEntityClass:(unint64_t)a3;
+ (BOOL)locationServicesEnabled;
+ (BOOL)locationServicesEnabled:(BOOL)a3;
+ (BOOL)mapCorrectionAvailable;
+ (BOOL)regionMonitoringAvailable;
+ (BOOL)regionMonitoringEnabled;
+ (BOOL)reportLocationUtilityEvent:(int)a3 atDate:(id)a4;
+ (BOOL)shutdownDaemon;
+ (BOOL)significantLocationChangeMonitoringAvailable;
+ (CLAuthorizationStatus)authorizationStatus;
+ (id)_applyArchivedAuthorizationDecisions:(id)a3;
+ (id)_archivedAuthorizationDecisionsWithError:(id *)a3;
+ (id)_getClientTransientAuthorizationInfoForBundleId:(id)a3 error:(id *)a4;
+ (id)_getClientTransientAuthorizationInfoForBundlePath:(id)a3 error:(id *)a4;
+ (id)_setClientTransientAuthorizationInfoForBundleId:(id)a3 data:(id)a4;
+ (id)_setClientTransientAuthorizationInfoForBundlePath:(id)a3 data:(id)a4;
+ (id)activeLocationClientsWithInfo;
+ (id)dateLocationLastUsedForLocationDictionary:(id)a3;
+ (id)interestZoneDictionaryIdentifiedById:(id)a3 forLocationDictionary:(id)a4;
+ (id)interestZonesIdentifierListForLocationDictionary:(id)a3;
+ (id)metadataForHomekitAccessoryControlEventWithUUID:(id)a3 stateString:(id)a4 serviceUUID:(id)a5 serviceType:(id)a6 characteristicType:(id)a7 serviceGroupUUID:(id)a8 source:(id)a9 roomUUID:(id)a10;
+ (id)metadataForHomekitActionSetEventWithUUID:(id)a3 name:(id)a4 type:(id)a5 clientName:(id)a6 source:(id)a7 homeName:(id)a8;
+ (id)metadataForMicroLocationTruthTagEventWithTagUUID:(id)a3;
+ (id)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3;
+ (id)sharedManager;
+ (id)sharedQueue;
+ (id)userLocationClientsWithInfo;
+ (id)weakSharedInstance;
+ (int)_authorizationStatus;
+ (int)_authorizationStatusForBundleIdentifier:(id)a3 bundlePath:(id)a4;
+ (int)authorizationStatusForBundle:(id)a3;
+ (int)authorizationStatusForBundleIdentifier:(id)a3;
+ (int)authorizationStatusForBundlePath:(id)a3;
+ (uint64_t)updatePromptedLatitude:longitude:;
+ (unint64_t)activeLocationServiceTypesForLocationDictionary:(id)a3;
+ (unint64_t)allowableAuthorizationForLocationDictionary:(id)a3;
+ (unint64_t)entityAuthorizationForLocationDictionary:(id)a3;
+ (unint64_t)entityClassesForLocationDictionary:(id)a3;
+ (unint64_t)incidentalUseModeForLocationDictionary:(id)a3;
+ (unint64_t)primaryEntityClassForLocationDictionary:(id)a3;
+ (void)collectMetricForFunction:(unint64_t)a3;
+ (void)deleteInterestZoneWithId:(id)a3 registeredForBundle:(id)a4 error:(id *)a5;
+ (void)deleteInterestZoneWithId:(id)a3 registeredForBundleIdentifier:(id)a4 error:(id *)a5;
+ (void)dumpDiagnosticFilesWithHandler:(id)a3;
+ (void)getIncidentalUseMode:(int *)a3 forBundle:(id)a4;
+ (void)getIncidentalUseMode:(int *)a3 forBundleIdentifier:(id)a4;
+ (void)grantTemporaryAuthorizationUsingLocationButtonToClientWithAuditToken:(id *)a3 voiceInteractionEnabled:(BOOL)a4;
+ (void)registerCircularInterestZoneWithId:(id)a3 latitue:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundle:(id)a9 error:(id *)a10;
+ (void)registerCircularInterestZoneWithId:(id)a3 latitue:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleIdentifier:(id)a9 error:(id *)a10;
+ (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundle:(id)a7 error:(id *)a8;
+ (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleIdentifier:(id)a7 error:(id *)a8;
+ (void)resetLocationAuthorizationForBundleId:(id)a3 orBundlePath:(id)a4;
+ (void)setAuthorizationStatus:(BOOL)a3 forBundle:(id)a4;
+ (void)setAuthorizationStatus:(BOOL)a3 forBundleIdentifier:(id)a4;
+ (void)setAuthorizationStatus:(BOOL)a3 forBundlePath:(id)a4;
+ (void)setAuthorizationStatus:(int)a3 withCorrectiveCompensation:(int)a4 forInterestZoneWithId:(id)a5 registeredForBundle:(id)a6;
+ (void)setAuthorizationStatus:(int)a3 withCorrectiveCompensation:(int)a4 forInterestZoneWithId:(id)a5 registeredForBundleIdentifier:(id)a6;
+ (void)setAuthorizationStatusByType:(int)a3 forBundle:(id)a4;
+ (void)setAuthorizationStatusByType:(int)a3 forBundleIdentifier:(id)a4;
+ (void)setAuthorizationStatusByType:(int)a3 forBundlePath:(id)a4;
+ (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 forBundle:(id)a5;
+ (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 forBundleIdentifier:(id)a5;
+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundle:(id)a4;
+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleIdentifier:(id)a4;
+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forLocationDictionary:(id)a4;
+ (void)setDefaultEffectiveBundle:(id)a3;
+ (void)setDefaultEffectiveBundleIdentifier:(id)a3;
+ (void)setEntityAuthorization:(unint64_t)a3 forLocationDictionary:(id)a4;
+ (void)setEntityAuthorization:(unint64_t)a3 withCorrectiveCompensation:(BOOL)a4 forLocationDictionary:(id)a5;
+ (void)setEntityAuthorization:(unint64_t)a3 withCorrectiveCompensationType:(int)a4 forLocationDictionary:(id)a5;
+ (void)setEntityAuthorized:(BOOL)a3 forLocationDictionary:(id)a4;
+ (void)setIncidentalUseMode:(int)a3 forBundle:(id)a4;
+ (void)setIncidentalUseMode:(int)a3 forBundleIdentifier:(id)a4;
+ (void)setLocationButtonUseMode:(int)a3 forBundle:(id)a4;
+ (void)setLocationButtonUseMode:(int)a3 forBundleIdentifier:(id)a4;
+ (void)setLocationServicesEnabled:(BOOL)a3;
+ (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundle:(id)a5 error:(id *)a6;
+ (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleIdentifier:(id)a5 error:(id *)a6;
+ (void)setStatusBarIconEnabled:(BOOL)a3 forLocationEntityClass:(unint64_t)a4;
+ (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundle:(id)a4;
+ (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleIdentifier:(id)a4;
+ (void)setTemporaryFullAccuracyAuthorizationGranted:(BOOL)a3 forBundleIdentifier:(id)a4;
+ (void)setTemporaryFullAccuracyAuthorizationGranted:(BOOL)a3 forBundlePath:(id)a4;
+ (void)tearDownLocationAuthorizationPromptForBundleId:(id)a3;
+ (void)tearDownLocationAuthorizationPromptForBundlePath:(id)a3;
+ (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3;
- (BOOL)_isFusionInfoEnabled;
- (BOOL)_isGroundAltitudeEnabled;
- (BOOL)_limitsPrecision;
- (BOOL)allowsAlteredAccessoryLocations;
- (BOOL)allowsBackgroundLocationUpdates;
- (BOOL)headingAvailable;
- (BOOL)isAuthorizedForPreciseLocation;
- (BOOL)isAuthorizedForWidgetUpdates;
- (BOOL)isDynamicAccuracyReductionEnabled;
- (BOOL)isLocationServicesPreferencesDialogEnabled;
- (BOOL)isMasquerading;
- (BOOL)isMatchInfoEnabled;
- (BOOL)isTrackRunInfoEnabled;
- (BOOL)locationServicesApproved;
- (BOOL)locationServicesAvailable;
- (BOOL)locationServicesEnabled;
- (BOOL)pausesLocationUpdatesAutomatically;
- (BOOL)privateMode;
- (BOOL)showsBackgroundLocationIndicator;
- (BOOL)supportInfo;
- (CLAccuracyAuthorization)accuracyAuthorization;
- (CLActivityType)activityType;
- (CLAuthorizationStatus)authorizationStatus;
- (CLDeviceOrientation)headingOrientation;
- (CLHeading)heading;
- (CLLocation)location;
- (CLLocationAccuracy)desiredAccuracy;
- (CLLocationDegrees)headingFilter;
- (CLLocationDistance)distanceFilter;
- (CLLocationDistance)maximumRegionMonitoringDistance;
- (CLLocationManager)init;
- (CLLocationManager)initWithEffectiveBundle:(id)a3;
- (CLLocationManager)initWithEffectiveBundle:(id)a3 delegate:(id)a4 onQueue:(id)a5;
- (CLLocationManager)initWithEffectiveBundle:(id)a3 limitingBundleIdentifier:(id)a4 delegate:(id)a5 onQueue:(id)a6;
- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3;
- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 bundlePath:(id)a4 websiteIdentifier:(id)a5 delegate:(id)a6 silo:(id)a7;
- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 delegate:(id)a4 onQueue:(id)a5;
- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 websiteIdentifier:(id)a4;
- (CLLocationManager)initWithEffectiveBundlePath:(id)a3;
- (CLLocationManager)initWithEffectiveBundlePath:(id)a3 delegate:(id)a4 onQueue:(id)a5;
- (CLLocationManager)initWithEffectiveBundlePath:(id)a3 limitingBundleIdentifier:(id)a4 delegate:(id)a5 onQueue:(id)a6;
- (CLLocationManager)initWithIdentifier:(id)a3;
- (CLLocationManager)initWithWebsiteIdentifier:(id)a3;
- (CLLocationManager)initWithWebsiteIdentifier:(id)a3 delegate:(id)a4 onQueue:(id)a5;
- (NSSet)monitoredRegions;
- (NSSet)rangedBeaconConstraints;
- (NSSet)rangedRegions;
- (NSString)processName;
- (NSString)purpose;
- (__CLClient)internalClient;
- (double)expectedGpsUpdateInterval;
- (id)_groundAltitudeAtLocation:(id)a3;
- (id)_historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8;
- (id)_historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6;
- (id)_initWithDelegate:(id)a3 onQueue:(id)a4;
- (id)_liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5;
- (id)_liveUpdaterWithQueue:(id)a3 handler:(id)a4;
- (id)_startPlaceInferencesCommonLogic:(unint64_t)a3 handler:(id)a4;
- (id)_zAxisStatistics;
- (id)appLocationInfo;
- (id)appsUsingLocation;
- (id)appsUsingLocationWithDetails;
- (id)backgroundActivitySession;
- (id)delegate;
- (id)getMicroLocationInternalVersion;
- (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5;
- (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8;
- (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6;
- (id)initOnQueue:(id)a3;
- (id)liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5;
- (id)liveUpdaterWithQueue:(id)a3 handler:(id)a4;
- (id)privilegedServiceSession;
- (id)serviceSession;
- (id)technologiesInUse;
- (void)_fetchContinuousPlaceInferencesWithFidelityPolicy:(unint64_t)a3 handler:(id)a4;
- (void)_fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4;
- (void)_fetchPlaceInferencesWithFidelityPolicy:(unint64_t)a3 handler:(id)a4;
- (void)_requestTemporaryFullAccuracyWithUsageDescription:(id)a3;
- (void)_requestTemporaryFullAccuracyWithUsageDescription:(id)a3 completion:(id)a4;
- (void)_requestVisitState;
- (void)_setFusionInfoEnabled:(BOOL)a3;
- (void)_setGroundAltitudeEnabled:(BOOL)a3;
- (void)_startLeechingVisits;
- (void)_startMonitoringSignificantLocationChangesOfDistance:(double)a3 withPowerBudget:(int)a4;
- (void)_stopFetchingContinuousPlaceInferences;
- (void)_updateARSessionState:(unint64_t)a3;
- (void)_updateVIOEstimation:(id)a3;
- (void)_updateVLLocalizationResult:(id)a3;
- (void)addIdentifiableClient:(id)a3;
- (void)allowDeferredLocationUpdatesUntilTraveled:(CLLocationDistance)distance timeout:(NSTimeInterval)timeout;
- (void)callPlaceInferenceHandlerWithResult:(id)a3 error:(id)a4;
- (void)changeFencesStateMatchingHandoffTags:(id)a3 forDeviceID:(id)a4 completion:(id)a5;
- (void)collectMetricForFunction:(unint64_t)a3;
- (void)dealloc;
- (void)disallowDeferredLocationUpdates;
- (void)dismissHeadingCalibrationDisplay;
- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5;
- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6;
- (void)endTranscriptSessionWithCompletion:(id)a3;
- (void)exportMicroLocationDataForMigrationWithCompletion:(id)a3;
- (void)exportMicroLocationDatabaseTablesWithCompletion:(id)a3;
- (void)fetchTranscriptLocationsWithRadius:(double)a3 sampleCount:(int)a4 center:(CLLocationCoordinate2D)a5 completionHandler:(id)a6;
- (void)isConsideredInRemoteAreaWithCompletion:(id)a3;
- (void)markAsHavingReceivedLocation;
- (void)onClientEvent:(int)a3 supportInfo:(id)a4;
- (void)onClientEventAuthStatus:(id)a3;
- (void)onClientEventAutopauseStatus:(id)a3;
- (void)onClientEventBatch:(id)a3;
- (void)onClientEventError:(id)a3;
- (void)onClientEventHeading:(id)a3;
- (void)onClientEventHeadingCalibration:(id)a3;
- (void)onClientEventInterrupted:(id)a3;
- (void)onClientEventLocation:(id)a3 forceMapMatching:(BOOL)a4 type:(id)a5;
- (void)onClientEventLocationUnavailable:(id)a3;
- (void)onClientEventNoLocationWatchdog:(id)a3;
- (void)onClientEventPlaceInferenceError:(id)a3;
- (void)onClientEventPlaceInferenceResult:(id)a3;
- (void)onClientEventRanging:(id)a3;
- (void)onClientEventRangingError:(id)a3;
- (void)onClientEventRegion:(id)a3;
- (void)onClientEventRegionError:(id)a3;
- (void)onClientEventRegionResponseDelayed:(id)a3;
- (void)onClientEventRegionSetupCompleted:(id)a3;
- (void)onClientEventRegionState:(id)a3;
- (void)onClientEventRegistration:(id)a3;
- (void)onClientEventSignificantLocationVisit:(id)a3;
- (void)onClientEventSignificantLocationVisitStateRequest:(id)a3;
- (void)onClientEventVehicleHeading:(id)a3;
- (void)onClientEventVehicleSpeed:(id)a3;
- (void)onDidBecomeActive:(id)a3;
- (void)onDidEnterBackground:(id)a3;
- (void)onLocationRequestTimeout;
- (void)onWillEnterForeground:(id)a3;
- (void)pauseLocationUpdates:(BOOL)a3;
- (void)purgeMicroLocationData;
- (void)purgeMicroLocationSemiSupervisedData;
- (void)registerAsLocationClient;
- (void)removeIdentifiableClient:(id)a3;
- (void)requestAlwaysAuthorization;
- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3;
- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3 withCompletion:(id)a4;
- (void)requestHistoricalLocationsWithPurposeKey:(NSString *)purposeKey sampleCount:(NSInteger)sampleCount completionHandler:(void *)handler;
- (void)requestLocation;
- (void)requestMicroLocationLearningWithCompletion:(id)a3;
- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3;
- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4;
- (void)requestMicroLocationStaticSourcesStatisticsWithCompletion:(id)a3;
- (void)requestMonitorWithConfiguration:(id)a3 completion:(id)a4;
- (void)requestStateForRegion:(CLRegion *)region;
- (void)requestTemporaryFullAccuracyAuthorizationWithPurposeKey:(NSString *)purposeKey;
- (void)requestTemporaryFullAccuracyAuthorizationWithPurposeKey:(NSString *)purposeKey completion:(void *)completion;
- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3;
- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4;
- (void)requestWhenInUseAuthorization;
- (void)requestWhenInUseAuthorizationWithPrompt;
- (void)requestWhenInUseAuthorizationWithPurposeKey:(id)a3;
- (void)resetApps;
- (void)resumeLocationUpdates;
- (void)setActivityType:(CLActivityType)activityType;
- (void)setAllowsAlteredAccessoryLocations:(BOOL)a3;
- (void)setAllowsBackgroundLocationUpdates:(BOOL)allowsBackgroundLocationUpdates;
- (void)setDelegate:(id)delegate;
- (void)setDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy;
- (void)setDistanceFilter:(CLLocationDistance)distanceFilter;
- (void)setDynamicAccuracyReductionEnabled:(BOOL)a3;
- (void)setHeadingFilter:(CLLocationDegrees)headingFilter;
- (void)setHeadingOrientation:(CLDeviceOrientation)headingOrientation;
- (void)setIsActuallyAWatchKitExtension:(BOOL)a3;
- (void)setLocationServicesPreferencesDialogEnabled:(BOOL)a3;
- (void)setMatchInfoEnabled:(BOOL)a3;
- (void)setPausesLocationUpdatesAutomatically:(BOOL)pausesLocationUpdatesAutomatically;
- (void)setPrivateMode:(BOOL)a3;
- (void)setPurpose:(NSString *)purpose;
- (void)setShowsBackgroundLocationIndicator:(BOOL)showsBackgroundLocationIndicator;
- (void)setSupportInfo:(BOOL)a3;
- (void)setTrackRunInfoEnabled:(BOOL)a3;
- (void)startMonitoringForRegion:(CLRegion *)region;
- (void)startMonitoringForRegion:(CLRegion *)region desiredAccuracy:(CLLocationAccuracy)accuracy;
- (void)startMonitoringLocationPushesWithCompletion:(void *)completion;
- (void)startMonitoringSignificantLocationChanges;
- (void)startMonitoringVisits;
- (void)startRangingBeaconsInRegion:(CLBeaconRegion *)region;
- (void)startRangingBeaconsSatisfyingConstraint:(CLBeaconIdentityConstraint *)constraint;
- (void)startTranscriptSessionInstantlyWithCompletion:(id)a3;
- (void)startTranscriptSessionWithCompletion:(id)a3;
- (void)startUpdatingHeading;
- (void)startUpdatingLocation;
- (void)startUpdatingLocationWithPrompt;
- (void)startUpdatingVehicleHeading;
- (void)startUpdatingVehicleSpeed;
- (void)stopMonitoringForRegion:(CLRegion *)region;
- (void)stopMonitoringLocationPushes;
- (void)stopMonitoringSignificantLocationChanges;
- (void)stopMonitoringVisits;
- (void)stopRangingBeaconsInRegion:(CLBeaconRegion *)region;
- (void)stopRangingBeaconsSatisfyingConstraint:(CLBeaconIdentityConstraint *)constraint;
- (void)stopUpdatingHeading;
- (void)stopUpdatingLocation;
- (void)stopUpdatingVehicleHeading;
- (void)stopUpdatingVehicleSpeed;
- (void)willPromptForTranscriptSessionWithCompletion:(id)a3;
@end

@implementation CLLocationManager

- (CLLocationAccuracy)desiredAccuracy
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2082;
    v16 = "activity";
    __int16 v17 = 2114;
    v18 = v6;
    __int16 v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [*((id *)self->_internal + 4) desiredAccuracy];
  double v8 = v7;
  os_activity_scope_leave(&v10);
  return v8;
}

- (CLLocationManager)initWithEffectiveBundle:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  [a3 bundlePath];

  return (CLLocationManager *)MEMORY[0x1F4181798](self, sel_initWithEffectiveBundlePath_delegate_onQueue_);
}

- (void)onClientEvent:(int)a3 supportInfo:(id)a4
{
  if (self->_internal)
  {
    switch(a3)
    {
      case 0:
        id v6 = copyLocationsFromLocationMessagePayload(a4);
        -[CLLocationManager onClientEventLocation:forceMapMatching:type:](self, "onClientEventLocation:forceMapMatching:type:", v6, objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"ForceMapMatching"), "BOOLValue"), objc_msgSend(a4, "objectForKeyedSubscript:", @"kCLClientEventKey"));

        break;
      case 1:
        MEMORY[0x1F4181798](self, sel_onClientEventRegistration_);
        break;
      case 3:
        MEMORY[0x1F4181798](self, sel_onClientEventLocationUnavailable_);
        break;
      case 12:
        MEMORY[0x1F4181798](self, sel_onClientEventHeading_);
        break;
      case 13:
        MEMORY[0x1F4181798](self, sel_onClientEventHeadingCalibration_);
        break;
      case 20:
        MEMORY[0x1F4181798](self, sel_onClientEventRegion_);
        break;
      case 21:
        MEMORY[0x1F4181798](self, sel_onClientEventRegionState_);
        break;
      case 22:
        MEMORY[0x1F4181798](self, sel_onClientEventRegionError_);
        break;
      case 23:
        MEMORY[0x1F4181798](self, sel_onClientEventRanging_);
        break;
      case 24:
        MEMORY[0x1F4181798](self, sel_onClientEventRangingError_);
        break;
      case 25:
        MEMORY[0x1F4181798](self, sel_onClientEventError_);
        break;
      case 27:
        MEMORY[0x1F4181798](self, sel_onClientEventAuthStatus_);
        break;
      case 28:
        MEMORY[0x1F4181798](self, sel_onClientEventRegionResponseDelayed_);
        break;
      case 29:
        MEMORY[0x1F4181798](self, sel_onClientEventRegionSetupCompleted_);
        break;
      case 30:
        MEMORY[0x1F4181798](self, sel_onClientEventAutopauseStatus_);
        break;
      case 31:
        MEMORY[0x1F4181798](self, sel_onClientEventBatch_);
        break;
      case 32:
        MEMORY[0x1F4181798](self, sel_onClientEventInterrupted_);
        break;
      case 33:
        MEMORY[0x1F4181798](self, sel_onClientEventVehicleSpeed_);
        break;
      case 34:
        MEMORY[0x1F4181798](self, sel_onClientEventVehicleHeading_);
        break;
      case 35:
        MEMORY[0x1F4181798](self, sel_onClientEventSignificantLocationVisit_);
        break;
      case 36:
        MEMORY[0x1F4181798](self, sel_onClientEventSignificantLocationVisitStateRequest_);
        break;
      case 40:
        MEMORY[0x1F4181798](self, sel_onClientEventPlaceInferenceResult_);
        break;
      case 41:
        MEMORY[0x1F4181798](self, sel_onClientEventPlaceInferenceError_);
        break;
      case 42:
        MEMORY[0x1F4181798](self, sel_onClientEventNoLocationWatchdog_);
        break;
      default:
        return;
    }
  }
}

- (void)onClientEventLocation:(id)a3 forceMapMatching:(BOOL)a4 type:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  internal = (char *)self->_internal;
  os_activity_scope_state_s v10 = (void *)[internal delegate];
  if (![a3 count])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "Location event received with empty payload", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      LOWORD(v49[0]) = 0;
      __int16 v13 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventLocation:forceMapMatching:type:]", "CoreLocation: %s\n", v13);
      goto LABEL_80;
    }
    return;
  }
  if (([*((id *)internal + 4) allowsMapCorrection] & 1) == 0 && !a4) {
    [a3 makeObjectsPerformSelector:sel_unmatch];
  }
  long long v54 = 0u;
  memset(v55, 0, 28);
  long long v53 = 0u;
  long long v51 = 0u;
  memset(v52, 0, sizeof(v52));
  long long v50 = 0u;
  memset(v49, 0, sizeof(v49));
  v11 = (void *)[a3 lastObject];
  if (v11)
  {
    [v11 clientLocation];
  }
  else
  {
    long long v54 = 0u;
    memset(v55, 0, 28);
    long long v53 = 0u;
    long long v51 = 0u;
    memset(v52, 0, sizeof(v52));
    long long v50 = 0u;
    memset(v49, 0, sizeof(v49));
  }
  if ([a3 count] != 1) {
    goto LABEL_40;
  }
  if (*(double *)(internal + 60) < 0.0 || !sub_1906CB1DC((uint64_t)(internal + 40), (uint64_t)v49, 0))
  {
    if (*(double *)(internal + 116) > *(double *)((char *)v52 + 12))
    {
      if (a5)
      {
        __int16 v15 = (void *)*((void *)internal + 25);
        if (v15)
        {
          if (([v15 isEqualToString:a5] & 1) == 0)
          {
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            }
            v38 = qword_1EB2713E0;
            if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v38, OS_LOG_TYPE_DEFAULT, "New location predates old location, and the event types differ; discarding",
                buf,
                2u);
            }
            if (!sub_1906CB57C(115, 2)) {
              return;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1EB2713E8 == -1)
            {
LABEL_79:
              __int16 v13 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager onClientEventLocation:forceMapMatching:type:]", "CoreLocation: %s\n", v13);
LABEL_80:
              if (v13 != buf) {
                free(v13);
              }
              return;
            }
LABEL_82:
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            goto LABEL_79;
          }
        }
      }
    }
    if (*(double *)((char *)&v49[1] + 4) < 0.0)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      v16 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "Invalid location passed to client", buf, 2u);
      }
      if (!sub_1906CB57C(115, 2)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 == -1) {
        goto LABEL_79;
      }
      goto LABEL_82;
    }
LABEL_40:
    __int16 v17 = (void *)*((void *)internal + 25);
    if (v17) {

    }
    id v18 = a5;
    int v19 = *((_DWORD *)internal + 14);
    double v20 = *(double *)(internal + 60);
    long long v43 = *(_OWORD *)(internal + 132);
    long long v44 = *(_OWORD *)(internal + 148);
    long long v45 = *(_OWORD *)(internal + 164);
    long long v46 = *(_OWORD *)(internal + 180);
    long long v47 = *(_OWORD *)(internal + 40);
    long long v39 = *(_OWORD *)(internal + 68);
    long long v40 = *(_OWORD *)(internal + 84);
    long long v41 = *(_OWORD *)(internal + 100);
    long long v42 = *(_OWORD *)(internal + 116);
    long long v21 = v49[1];
    *(_OWORD *)(internal + 40) = v49[0];
    long long v22 = v52[0];
    *(_OWORD *)(internal + 120) = v52[1];
    *(_OWORD *)(internal + 104) = v22;
    long long v23 = v50;
    *(_OWORD *)(internal + 88) = v51;
    *(_OWORD *)(internal + 72) = v23;
    *(_OWORD *)(internal + 180) = *(_OWORD *)((char *)v55 + 12);
    *(_OWORD *)(internal + 168) = v55[0];
    long long v24 = v53;
    *(_OWORD *)(internal + 152) = v54;
    *(_OWORD *)(internal + 136) = v24;
    double v25 = *(double *)((char *)v49 + 4);
    BOOL v26 = *(double *)((char *)v49 + 4) != 0.0;
    double v27 = *(double *)((char *)v49 + 12);
    double v28 = *(double *)((char *)&v49[1] + 4);
    if (*(double *)((char *)v49 + 12) == 0.0) {
      BOOL v26 = 0;
    }
    *((void *)internal + 25) = v18;
    int v48 = v19;
    *(_OWORD *)(internal + 56) = v21;
    if (v28 >= 0.0 && !v26)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      v29 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 1026;
        *(_DWORD *)v57 = v25 != 0.0;
        *(_WORD *)&v57[4] = 1026;
        *(_DWORD *)&v57[6] = v27 != 0.0;
        *(_WORD *)&v57[10] = 1040;
        *(_DWORD *)&v57[12] = 156;
        *(_WORD *)&v57[16] = 2097;
        *(void *)&v57[18] = v49;
        _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NullIsland onClientEventLocation:forceMapMatching: got a latitude or longitude that was exactly zero\", \"latIsNonzero\":%{public}hhd, \"lonIsNonzero\":%{public}hhd, \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x2Eu);
      }
    }
    v30 = self;
    objc_sync_enter(self);
    if ([*((id *)internal + 4) requestingLocation])
    {
      [*((id *)internal + 4) desiredAccuracy];
      if ((*(double *)((char *)&v49[1] + 4) > fmax(v31, 10.0)
         || CFAbsoluteTimeGetCurrent() - *(double *)((char *)v52 + 12) >= 60.0)
        && ([*((id *)internal + 4) limitsPrecision] & 1) == 0)
      {
LABEL_71:
        objc_sync_exit(self);
        return;
      }
      [internal cancelLocationRequest];
      CLClientStopLocationUpdates_0(*((void *)internal + 1));
    }
    if (objc_opt_respondsToSelector())
    {
      entr_act_modify();
      v32 = NSStringFromSelector(sel_locationManager_didUpdateLocations_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      v33 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290563;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)v57 = self;
        *(_WORD *)&v57[8] = 2050;
        *(void *)&v57[10] = v10;
        *(_WORD *)&v57[18] = 2114;
        *(void *)&v57[20] = v32;
        *(_WORD *)&v57[28] = 1040;
        *(_DWORD *)&v57[30] = 156;
        *(_WORD *)&v57[34] = 2097;
        *(void *)&v57[36] = v49;
        *(_WORD *)&v57[44] = 2114;
        *(void *)&v57[46] = a5;
        _os_log_impl(&dword_1906B8000, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"location\":%{private, location:CLClientLocation}.*P, \"eventType\":%{public, location:escape_only}@}", buf, 0x4Au);
      }
      [v10 locationManager:self didUpdateLocations:a3];
    }
    else if (objc_opt_respondsToSelector())
    {
      if (v20 >= 0.0)
      {
        v35 = [CLLocation alloc];
        *(_OWORD *)buf = v47;
        *(_DWORD *)&buf[16] = v48;
        *(double *)v57 = v20;
        long long v59 = v43;
        long long v60 = v44;
        long long v61 = v45;
        long long v62 = v46;
        *(_OWORD *)&v57[8] = v39;
        *(_OWORD *)&v57[24] = v40;
        *(_OWORD *)&v57[40] = v41;
        long long v58 = v42;
        v34 = [(CLLocation *)v35 initWithClientLocation:buf];
      }
      else
      {
        v34 = 0;
      }
      entr_act_modify();
      v36 = NSStringFromSelector(sel_locationManager_didUpdateToLocation_fromLocation_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      v37 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)v57 = self;
        *(_WORD *)&v57[8] = 2050;
        *(void *)&v57[10] = v10;
        *(_WORD *)&v57[18] = 2114;
        *(void *)&v57[20] = v36;
        _os_log_impl(&dword_1906B8000, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", buf, 0x30u);
      }
      objc_msgSend(v10, "locationManager:didUpdateToLocation:fromLocation:", self, objc_msgSend(a3, "lastObject"), v34);
    }
    else
    {
      entr_act_modify();
    }
    goto LABEL_71;
  }
  if (!*((_DWORD *)internal + 43)) {
    *((_DWORD *)internal + 43) = DWORD1(v55[0]);
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  v14 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEBUG, "New location is identical to old location; discarding",
      buf,
      2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 == -1) {
      goto LABEL_79;
    }
    goto LABEL_82;
  }
}

- (void)onClientEventAuthStatus:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  internal = (char *)self->_internal;
  id v6 = (void *)[internal delegate];
  unsigned int v22 = 0;
  __int16 v21 = 0;
  if (CLClientGetAuthorizationStatusAndCorrectiveCompensation((CFDictionaryRef)a3, &v22, &v21, (unsigned char *)&v21 + 1))
  {
    uint64_t v7 = v22;
    if (v22 != 3) {
      *(void *)(internal + 60) = 0xBFF0000000000000;
    }
    objc_sync_enter(self);
    if ([*((id *)internal + 4) previousAuthorizationStatusValid]
      && [*((id *)internal + 4) previousAuthorizationStatus] == v7
      && (int v8 = [*((id *)internal + 4) limitsPrecision], v21 == v8)
      && (int v9 = [*((id *)internal + 4) isAuthorizedForWidgetUpdates], HIBYTE(v21) == v9))
    {
      objc_sync_exit(self);
    }
    else
    {
      int v10 = v21;
      [*((id *)internal + 4) setLimitsPrecision:(_BYTE)v21 != 0];
      [*((id *)internal + 4) setPreviousAuthorizationStatus:v7];
      [*((id *)internal + 4) setPreviousAuthorizationStatusValid:1];
      int v11 = HIBYTE(v21);
      [*((id *)internal + 4) setIsAuthorizedForWidgetUpdates:HIBYTE(v21) != 0];
      objc_sync_exit(self);
      int v12 = self;
      if (objc_opt_respondsToSelector())
      {
        __int16 v13 = NSStringFromSelector(sel_locationManagerDidChangeAuthorization_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        v14 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68290562;
          int v24 = 0;
          __int16 v25 = 2082;
          BOOL v26 = "";
          __int16 v27 = 2050;
          double v28 = self;
          __int16 v29 = 2050;
          v30 = v6;
          __int16 v31 = 2114;
          v32 = v13;
          __int16 v33 = 2050;
          uint64_t v34 = v7;
          __int16 v35 = 1026;
          BOOL v36 = v10 != 0;
          __int16 v37 = 1026;
          BOOL v38 = v11 != 0;
          _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"authorizationStatus\":%{public, location:CLClientAuthorizationStatus}lld, \"limitsPrecision\":%{public}hhd, \"isAuthorizedForWidgetUpdates\":%{public}hhd}", buf, 0x46u);
        }
        [v6 locationManagerDidChangeAuthorization:self];
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          __int16 v17 = NSStringFromSelector(sel_locationManager_didReceiveApproval_);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          id v18 = qword_1EB2713E0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290050;
            int v24 = 0;
            __int16 v25 = 2082;
            BOOL v26 = "";
            __int16 v27 = 2050;
            double v28 = self;
            __int16 v29 = 2050;
            v30 = v6;
            __int16 v31 = 2114;
            v32 = v17;
            __int16 v33 = 1026;
            LODWORD(v34) = v7 == 3;
            _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"approved\":%{public}hhd}", buf, 0x36u);
          }
          [v6 locationManager:self didReceiveApproval:v7 == 3];
        }
        if (objc_opt_respondsToSelector())
        {
          int v19 = NSStringFromSelector(sel_locationManager_didChangeAuthorizationStatus_);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          double v20 = qword_1EB2713E0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290562;
            int v24 = 0;
            __int16 v25 = 2082;
            BOOL v26 = "";
            __int16 v27 = 2050;
            double v28 = self;
            __int16 v29 = 2050;
            v30 = v6;
            __int16 v31 = 2114;
            v32 = v19;
            __int16 v33 = 2050;
            uint64_t v34 = v7;
            __int16 v35 = 1026;
            BOOL v36 = v10 != 0;
            __int16 v37 = 1026;
            BOOL v38 = v11 != 0;
            _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"authorizationStatus\":%{public, location:CLClientAuthorizationStatus}lld, \"limitsPrecision\":%{public}hhd, \"isAuthorizedForWidgetUpdates\":%{public}hhd}", buf, 0x46u);
          }
          [v6 locationManager:self didChangeAuthorizationStatus:v7];
        }
      }
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v15 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_FAULT, "could not get updated authorization status", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventAuthStatus:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
}

- (CLAuthorizationStatus)authorizationStatus
{
  objc_sync_enter(self);
  internal = (id *)self->_internal;
  if ([internal[4] previousAuthorizationStatusValid])
  {
    CLAuthorizationStatus v4 = [internal[4] previousAuthorizationStatus];
  }
  else
  {
    [(CLLocationManager *)self collectMetricForFunction:0x80000];
    CLAuthorizationStatus v8 = kCLAuthorizationStatusNotDetermined;
    int v5 = sub_1906E678C(*((void *)internal[1] + 45), *((void *)internal[1] + 46), (uint64_t)&v8);
    CLAuthorizationStatus v6 = v8;
    if ((v8 - 1) >= 4) {
      CLAuthorizationStatus v6 = kCLAuthorizationStatusNotDetermined;
    }
    if (v5) {
      CLAuthorizationStatus v4 = v6;
    }
    else {
      CLAuthorizationStatus v4 = kCLAuthorizationStatusNotDetermined;
    }
  }
  objc_sync_exit(self);
  return v4;
}

- (CLAccuracyAuthorization)accuracyAuthorization
{
  objc_sync_enter(self);
  internal = (id *)self->_internal;
  if ([internal[4] previousAuthorizationStatusValid])
  {
    unsigned int v4 = [internal[4] limitsPrecision];
  }
  else
  {
    [(CLLocationManager *)self collectMetricForFunction:0x100000];
    char v7 = 0;
    sub_1907FF828(*((void *)internal[1] + 45), *((void *)internal[1] + 46), (uint64_t)&v7);
    unsigned int v4 = v7 == 0;
  }
  CLAccuracyAuthorization v5 = (unint64_t)v4;
  objc_sync_exit(self);
  return v5;
}

- (CLLocationManager)initWithEffectiveBundlePath:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  CLAuthorizationStatus v8 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3) {
    goto LABEL_6;
  }
  p_cache = CLCircularRegion.cache;
  if (qword_1EB2713E8 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    int v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil bundle path", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (p_cache[125] != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      p_cache = buf;
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
LABEL_6:
    if (a4 && a5) {
      break;
    }
    CLAuthorizationStatus v8 = CLCircularRegion.cache;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    self = (CLLocationManager *)CLCircularRegion.cache;
    int v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 2082;
      double v20 = "assert";
      __int16 v21 = 2081;
      unsigned int v22 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v13 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 2082;
      double v20 = "assert";
      __int16 v21 = 2081;
      unsigned int v22 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    a4 = (id)qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 2082;
      double v20 = "assert";
      __int16 v21 = 2081;
      unsigned int v22 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_20:
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  return -[CLLocationManager initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:](self, "initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:", 0, v8, 0, a4, (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a5 bePermissive:1]);
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 bundlePath:(id)a4 websiteIdentifier:(id)a5 delegate:(id)a6 silo:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)CLLocationManager;
  __int16 v13 = [(CLLocationManager *)&v30 init];
  if (v13)
  {
    v14 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v15 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = NSStringFromSelector(a2);
      uint64_t v17 = [a4 UTF8String];
      *(_DWORD *)buf = 68290306;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2082;
      __int16 v37 = "activity";
      __int16 v38 = 2114;
      uint64_t v39 = v16;
      __int16 v40 = 2050;
      long long v41 = v13;
      __int16 v42 = 2114;
      id v43 = a3;
      __int16 v44 = 2082;
      uint64_t v45 = v17;
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@, \"bundlePath\":%{public, location:escape_only}s}", buf, 0x44u);
    }
    if (!a7) {
      a7 = (id)[objc_alloc(MEMORY[0x1E4F73048]) initWithCurrentRunLoopAndIdentifier:@"CLLocationManager-runloop" bePermissive:1];
    }
    id v18 = [[CLLocationManagerInternal alloc] initWithInfo:v13 bundleIdentifier:a3 bundlePath:a4 websiteIdentifier:a5 delegate:a6 silo:a7];
    v13->_internal = v18;
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "objectForInfoDictionaryKey:", @"NSExtension"), "objectForKey:", @"NSExtensionPointIdentifier"), "isEqualToString:", @"com.apple.widgetkit-extension"))
    {
      if (sub_190717A10((void *)[MEMORY[0x1E4F28B50] mainBundle]))
      {
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        __int16 v19 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEBUG, "Widget has NSWidgetWantsLocation key in its Info.plist", buf, 2u);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          __int16 v31 = 0;
          double v20 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "void verifyWidgetKitExtension()", "CoreLocation: %s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
      }
      else
      {
        NSLog(&cfstr_ThisWidgetHasA.isa, @"NSWidgetWantsLocation");
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        __int16 v21 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          int v33 = 0;
          __int16 v34 = 2082;
          __int16 v35 = "";
          _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning widget is missing NSWidgetWantsLocation key in its Info.plist\"}", buf, 0x12u);
        }
      }
    }
    sub_1906D54D4();
    int v22 = sub_1906D5518();
    int v23 = _CFExecutableLinkedOnOrAfter();
    if (v22) {
      int v24 = 5;
    }
    else {
      int v24 = 1;
    }
    if (v23) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = 2;
    }
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      fClient = v18->fClient;
      if (fClient)
      {
        if (*((unsigned char *)fClient + 16)) {
          [(CLLocationManager *)v13 setAllowsBackgroundLocationUpdates:1];
        }
      }
    }
    sub_1906D55C4(v18->fClient);
    if (sub_1906D575C()) {
      uint64_t v27 = v25;
    }
    else {
      uint64_t v27 = 3;
    }
    [(CLLocationManagerInternal *)v18 setPausesLocationUpdatesAutomatically:v27];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v13, sel_onDidBecomeActive_, @"UIApplicationDidBecomeActiveNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v13, sel_onWillEnterForeground_, @"UIApplicationWillEnterForegroundNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v13, sel_onDidEnterBackground_, @"UIApplicationDidEnterBackgroundNotification", 0);
    os_activity_scope_leave(&state);
  }
  return v13;
}

- (void)onClientEventRegistration:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  internal = (id *)self->_internal;
  objc_msgSend(internal, "setClientKeyForIdentityValidation:", objc_msgSend(a3, "objectForKey:", @"kCLConnectionMessageClientKeyForIdentityValidation"));
  objc_msgSend(internal, "setMonitorLedgerAccessKey:", objc_msgSend(a3, "objectForKey:", @"kCLConnectionMessageMonitorLedgerAccessKey"));
  objc_sync_enter(self);
  char v7 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLAuthorizationStatus v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    uint64_t v10 = [internal clientKeyForIdentityValidation];
    uint64_t buf = 68290050;
    __int16 v24 = 2082;
    unsigned int v25 = "";
    __int16 v26 = 2082;
    uint64_t v27 = "activity";
    __int16 v28 = 2114;
    __int16 v29 = v9;
    __int16 v30 = 2050;
    __int16 v31 = self;
    __int16 v32 = 2114;
    uint64_t v33 = v10;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"clientKey\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
  }
  if ((objc_msgSend((id)objc_msgSend(internal, "clientKeyForIdentityValidation"), "isEqualToString:", @"icom.apple.Home.HomeControlService:") & 1) != 0|| objc_msgSend((id)objc_msgSend(internal, "clientKeyForIdentityValidation"), "isEqualToString:", @"icom.apple.Spotlight:"))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v11 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289026;
      __int16 v24 = 2082;
      unsigned int v25 = "";
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"This CLLocationManager resolved to an invalid location client.\"}", (uint8_t *)&buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    int v12 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      uint64_t buf = 68289026;
      __int16 v24 = 2082;
      unsigned int v25 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "This CLLocationManager resolved to an invalid location client.", "{\"msg%{public}.0s\":\"This CLLocationManager resolved to an invalid location client.\"}", (uint8_t *)&buf, 0x12u);
    }
  }
  __int16 v13 = (void *)[internal[35] copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend((id)(*(uint64_t (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))(), "updateIdentityToken:withStorageToken:", objc_msgSend(internal, "clientKeyForIdentityValidation"), objc_msgSend(internal, "monitorLedgerAccessKey"));
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }

  os_activity_scope_leave(&state);
  objc_sync_exit(self);
}

- (void)startUpdatingLocation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLAccuracyAuthorization v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    CLAuthorizationStatus v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v21 = 2082;
    *(void *)&v21[2] = "";
    *(_WORD *)&v21[10] = 2082;
    *(void *)&v21[12] = "activity";
    *(_WORD *)&v21[20] = 2114;
    *(void *)&v21[22] = v6;
    *(_WORD *)&v21[30] = 2050;
    int v22 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:4];
  internal = (char *)self->_internal;
  uint64_t v8 = [internal delegate];
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  if ([*((id *)internal + 4) requestingLocation])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v9 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "Canceling requestLocation", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v18 = 0;
      int v16 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager startUpdatingLocation]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    [internal cancelLocationRequest];
  }
  if (([*((id *)internal + 4) updatingLocation] & 1) == 0)
  {
    [*((id *)internal + 4) setUpdatingLocation:1];
    *(void *)(internal + 60) = 0xBFF0000000000000;
  }
  if ([*((id *)internal + 4) paused])
  {
    [*((id *)internal + 4) setPaused:0];
    uint64_t v10 = *((void *)internal + 1);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1906FDFB4;
    v17[3] = &unk_1E5696FA8;
    v17[4] = self;
    v17[5] = v8;
    v17[6] = internal;
    if (v10)
    {
      int v11 = *(void **)(v10 + 232);
      *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
      *(void *)__int16 v21 = 3221225472;
      *(void *)&v21[8] = sub_1906DD850;
      *(void *)&v21[16] = &unk_1E5696C40;
      *(void *)&v21[24] = v17;
      [v11 async:buf];
    }
  }
  uint64_t v12 = *((void *)internal + 1);
  [*((id *)internal + 4) distanceFilter];
  double v14 = v13;
  [*((id *)internal + 4) desiredAccuracy];
  CLClientStartLocationUpdatesWithDynamicAccuracyReductionAndAlteredAccessoryLocations_0(v12, (int)v15, [*((id *)internal + 4) dynamicAccuracyReductionEnabled], objc_msgSend(*((id *)internal + 4), "allowsAlteredAccessoryLocations"), v14);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)startMonitoringSignificantLocationChanges
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLAccuracyAuthorization v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    CLAuthorizationStatus v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2082;
    double v14 = "activity";
    __int16 v15 = 2114;
    int v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:256];
  internal = (uint64_t *)self->_internal;
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  sub_1906E68FC(internal[1], 0, 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)setDistanceFilter:(CLLocationDistance)distanceFilter
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CLAuthorizationStatus v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    double v14 = "";
    __int16 v15 = 2082;
    int v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    long long v20 = self;
    __int16 v21 = 2050;
    CLLocationDistance v22 = distanceFilter;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"distance\":\"%{public}f\"}", buf, 0x3Au);
  }
  internal = (id *)self->_internal;
  objc_sync_enter(self);
  [internal[4] setDistanceFilter:distanceFilter];
  if ([internal[4] updatingLocation]) {
    [(CLLocationManager *)self startUpdatingLocation];
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)setDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CLAuthorizationStatus v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    double v14 = "";
    __int16 v15 = 2082;
    int v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    long long v20 = self;
    __int16 v21 = 2050;
    CLLocationAccuracy v22 = desiredAccuracy;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"accuracy\":\"%{public}f\"}", buf, 0x3Au);
  }
  internal = (id *)self->_internal;
  objc_sync_enter(self);
  [internal[4] setDesiredAccuracy:desiredAccuracy];
  if ([internal[4] updatingLocation]) {
    [(CLLocationManager *)self startUpdatingLocation];
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)setDelegate:(id)delegate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CLAuthorizationStatus v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2050;
    __int16 v19 = self;
    __int16 v20 = 2050;
    id v21 = delegate;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"delegate\":\"%{public}p\"}", buf, 0x3Au);
  }
  [self->_internal setDelegate:delegate];
  os_activity_scope_leave(&v9);
}

- (void)resumeLocationUpdates
{
  internal = (id *)self->_internal;
  objc_sync_enter(self);
  if ([internal[4] paused]) {
    [(CLLocationManager *)self startUpdatingLocation];
  }

  objc_sync_exit(self);
}

- (void)onDidBecomeActive:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CLAuthorizationStatus v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v14 = 2082;
    *(void *)&v14[2] = "";
    *(_WORD *)&v14[10] = 2082;
    *(void *)&v14[12] = "activity";
    *(_WORD *)&v14[20] = 2114;
    *(void *)&v14[22] = v8;
    *(_WORD *)&v14[30] = 2050;
    __int16 v15 = self;
    __int16 v16 = 2113;
    id v17 = a3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"notification\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"UIApplicationDidBecomeActiveNotification"))
  {
    uint64_t v9 = *((void *)self->_internal + 1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1906DDA64;
    v11[3] = &unk_1E5696BF0;
    v11[4] = self;
    if (v9)
    {
      os_activity_scope_state_s v10 = *(void **)(v9 + 232);
      *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
      *(void *)__int16 v14 = 3221225472;
      *(void *)&v14[8] = sub_1906DD850;
      *(void *)&v14[16] = &unk_1E5696C40;
      *(void *)&v14[24] = v11;
      [v10 async:buf];
    }
  }
  os_activity_scope_leave(&state);
}

- (CLLocationManager)init
{
  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:0 bundlePath:0 websiteIdentifier:0 delegate:0 silo:0];
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLAccuracyAuthorization v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    CLAuthorizationStatus v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  [internal cancelLocationRequest];
  [internal invalidate];

  v8.receiver = self;
  v8.super_class = (Class)CLLocationManager;
  [(CLLocationManager *)&v8 dealloc];
  os_activity_scope_leave(&state);
}

- (void)collectMetricForFunction:(unint64_t)a3
{
}

- (id)_initWithDelegate:(id)a3 onQueue:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    objc_super v8 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2082;
      __int16 v16 = "assert";
      __int16 v17 = 2081;
      __int16 v18 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    uint64_t v9 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2082;
      __int16 v16 = "assert";
      __int16 v17 = 2081;
      __int16 v18 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    os_activity_scope_state_s v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2082;
      __int16 v16 = "assert";
      __int16 v17 = 2081;
      __int16 v18 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a4 bePermissive:1];

  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:0 bundlePath:0 websiteIdentifier:0 delegate:a3 silo:v6];
}

+ (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return MEMORY[0x1F4181798](a1, sel__authorizationStatusForBundleIdentifier_bundlePath_);
}

+ (int)_authorizationStatusForBundleIdentifier:(id)a3 bundlePath:(id)a4
{
  int v9 = 0;
  if ((unint64_t)a3 | (unint64_t)a4) {
    id v4 = a3;
  }
  else {
    id v4 = (id)qword_1E929FFC0;
  }
  if ((unint64_t)a3 | (unint64_t)a4) {
    id v5 = a4;
  }
  else {
    id v5 = (id)qword_1E929FFC8;
  }
  int v6 = sub_1906E678C((uint64_t)v4, (uint64_t)v5, (uint64_t)&v9);
  int v7 = v9;
  if ((v9 - 1) >= 4) {
    int v7 = 0;
  }
  if (v6) {
    return v7;
  }
  else {
    return 0;
  }
}

- (CLLocationManager)initWithIdentifier:(id)a3
{
  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:0 bundlePath:0 websiteIdentifier:0 delegate:0 silo:0];
}

- (CLLocationManager)initWithWebsiteIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    id v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil websiteIdentifier", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithWebsiteIdentifier:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:0 bundlePath:0 websiteIdentifier:a3 delegate:0 silo:0];
}

- (CLLocationManager)initWithWebsiteIdentifier:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  objc_super v8 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3) {
    goto LABEL_6;
  }
  p_cache = CLCircularRegion.cache;
  if (qword_1EB2713E8 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    os_activity_scope_state_s v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil websiteIdentifier", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (p_cache[125] != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      p_cache = buf;
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithWebsiteIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
LABEL_6:
    if (a4 && a5) {
      break;
    }
    objc_super v8 = CLCircularRegion.cache;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    self = (CLLocationManager *)CLCircularRegion.cache;
    int v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      uint64_t v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v13 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      uint64_t v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    a4 = (id)qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      uint64_t v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_20:
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  return -[CLLocationManager initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:](self, "initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:", 0, 0, v8, a4, (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a5 bePermissive:1]);
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 websiteIdentifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil identifier", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundleIdentifier:websiteIdentifier:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:a3 bundlePath:0 websiteIdentifier:a4 delegate:0 silo:0];
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    id v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil identifier", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundleIdentifier:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:a3 bundlePath:0 websiteIdentifier:0 delegate:0 silo:0];
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  objc_super v8 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3) {
    goto LABEL_6;
  }
  p_cache = CLCircularRegion.cache;
  if (qword_1EB2713E8 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    os_activity_scope_state_s v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil identifier", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (p_cache[125] != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      p_cache = buf;
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundleIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
LABEL_6:
    if (a4 && a5) {
      break;
    }
    objc_super v8 = CLCircularRegion.cache;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    self = (CLLocationManager *)CLCircularRegion.cache;
    int v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      uint64_t v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v13 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      uint64_t v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    a4 = (id)qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      uint64_t v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "delegate && queue";
      _os_log_impl(&dword_1906B8000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_20:
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  return -[CLLocationManager initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:](self, "initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:", v8, 0, 0, a4, (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a5 bePermissive:1]);
}

- (CLLocationManager)initWithEffectiveBundlePath:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    id v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil bundle path", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:0 bundlePath:a3 websiteIdentifier:0 delegate:0 silo:0];
}

- (CLLocationManager)initWithEffectiveBundle:(id)a3
{
  [a3 bundlePath];

  return (CLLocationManager *)MEMORY[0x1F4181798](self, sel_initWithEffectiveBundlePath_);
}

- (CLLocationManager)initWithEffectiveBundlePath:(id)a3 limitingBundleIdentifier:(id)a4 delegate:(id)a5 onQueue:(id)a6
{
  os_activity_scope_state_s v10 = (const char *)a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    p_cache = CLCircularRegion.cache;
    if (qword_1EB2713E8 == -1) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
  if ([&unk_1EE023808 containsObject:a3])
  {
    while (1)
    {
      if (a4)
      {
        if (([&unk_1EE023808 containsObject:a4] & 1) == 0)
        {
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          __int16 v18 = qword_1EB2713E0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            int v27 = 0;
            __int16 v28 = 2082;
            __int16 v29 = "";
            __int16 v30 = 2114;
            __int16 v31 = (const char *)a4;
            _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported limiting identifier\", \"identifier\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            }
          }
          uint64_t v19 = qword_1EB2713E0;
          if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            int v27 = 0;
            __int16 v28 = 2082;
            __int16 v29 = "";
            __int16 v30 = 2114;
            __int16 v31 = (const char *)a4;
            __int16 v14 = "initializing CLLocationManager with unsupported limiting identifier";
            __int16 v15 = "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported limiting identifier\", \"identi"
                  "fier\":%{public, location:escape_only}@}";
            int v16 = v19;
            goto LABEL_23;
          }
          return 0;
        }
      }
      else
      {
        p_cache = CLCircularRegion.cache;
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        __int16 v21 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil limiting identifier", buf, 2u);
        }
        if (sub_1906CB57C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          p_cache = buf;
          unsigned int v25 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:limitingBundleIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v25);
          if (v25 != (char *)buf) {
            free(v25);
          }
        }
      }
      if (a5 && a6) {
        return -[CLLocationManager initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:](self, "initWithEffectiveBundleIdentifier:bundlePath:websiteIdentifier:delegate:silo:", a4, v10, 0, a5, (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a6 bePermissive:1]);
      }
      os_activity_scope_state_s v10 = (const char *)CLCircularRegion.cache;
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      a5 = CLCircularRegion.cache;
      uint64_t v22 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v27 = 0;
        __int16 v28 = 2082;
        __int16 v29 = "";
        __int16 v30 = 2082;
        __int16 v31 = "assert";
        __int16 v32 = 2081;
        uint64_t v33 = "delegate && queue";
        _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
      }
      uint64_t v23 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v27 = 0;
        __int16 v28 = 2082;
        __int16 v29 = "";
        __int16 v30 = 2082;
        __int16 v31 = "assert";
        __int16 v32 = 2081;
        uint64_t v33 = "delegate && queue";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
      }
      a4 = (id)qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v27 = 0;
        __int16 v28 = 2082;
        __int16 v29 = "";
        __int16 v30 = 2082;
        __int16 v31 = "assert";
        __int16 v32 = 2081;
        uint64_t v33 = "delegate && queue";
        _os_log_impl(&dword_1906B8000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np();
LABEL_44:
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
LABEL_11:
      __int16 v17 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil bundle path", buf, 2u);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (p_cache[125] != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        p_cache = buf;
        __int16 v24 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:limitingBundleIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
    }
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v12 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v27 = 0;
    __int16 v28 = 2082;
    __int16 v29 = "";
    __int16 v30 = 2114;
    __int16 v31 = v10;
    _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported bundle path\", \"bundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
  }
  uint64_t v13 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v27 = 0;
    __int16 v28 = 2082;
    __int16 v29 = "";
    __int16 v30 = 2114;
    __int16 v31 = v10;
    __int16 v14 = "initializing CLLocationManager with unsupported bundle path";
    __int16 v15 = "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported bundle path\", \"bundlePath\":%{public,"
          " location:escape_only}@}";
    int v16 = v13;
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v14, v15, buf, 0x1Cu);
  }
  return 0;
}

- (CLLocationManager)initWithEffectiveBundle:(id)a3 limitingBundleIdentifier:(id)a4 delegate:(id)a5 onQueue:(id)a6
{
  [a3 bundlePath];

  return (CLLocationManager *)MEMORY[0x1F4181798](self, sel_initWithEffectiveBundlePath_limitingBundleIdentifier_delegate_onQueue_);
}

- (id)initOnQueue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v6 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2082;
      __int16 v14 = "assert";
      __int16 v15 = 2081;
      int v16 = "queue";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    int v7 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2082;
      __int16 v14 = "assert";
      __int16 v15 = 2081;
      int v16 = "queue";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "queue must not be nil", "{\"msg%{public}.0s\":\"queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    objc_super v8 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2082;
      __int16 v14 = "assert";
      __int16 v15 = 2081;
      int v16 = "queue";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a3 bePermissive:1];

  return [(CLLocationManager *)self initWithEffectiveBundleIdentifier:0 bundlePath:0 websiteIdentifier:0 delegate:0 silo:v4];
}

+ (id)sharedManager
{
  id result = (id)qword_1E92A0180;
  if (!qword_1E92A0180)
  {
    id result = objc_alloc_init(CLLocationManager);
    qword_1E92A0180 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedQueue
{
  if (qword_1E92A0178 != -1) {
    dispatch_once(&qword_1E92A0178, &unk_1EE002D20);
  }
  return (id)qword_1E92A0170;
}

+ (id)weakSharedInstance
{
  objc_sync_enter(a1);
  id Weak = objc_loadWeak(&qword_1E92A01E8);
  if (!Weak)
  {
    id Weak = [[CLLocationManager alloc] initOnQueue:+[CLLocationManager sharedQueue]];
    objc_storeWeak(&qword_1E92A01E8, Weak);
  }
  objc_sync_exit(a1);
  return Weak;
}

+ (BOOL)reportLocationUtilityEvent:(int)a3 atDate:(id)a4
{
  return sub_1907FD8B4() != 0;
}

+ (void)resetLocationAuthorizationForBundleId:(id)a3 orBundlePath:(id)a4
{
}

+ (BOOL)locationServicesEnabled
{
  return CLClientIsLocationServicesEnabled() != 0;
}

+ (BOOL)locationServicesEnabled:(BOOL)a3
{
  return MEMORY[0x1F4181798](a1, sel_locationServicesEnabled);
}

+ (void)setLocationServicesEnabled:(BOOL)a3
{
}

+ (id)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3
{
  return (id)sub_1907FF7E8();
}

+ (BOOL)authorizationPromptMapDisplayEnabled
{
  return CLClientIsAuthorizationPromptMapDisplayEnabled() != 0;
}

+ (BOOL)headingAvailable
{
  [a1 collectMetricForFunction:2];
  char v2 = sub_1906C2708();
  if (v2) {
    sub_1906D54D4();
  }
  return v2 & 1;
}

+ (BOOL)significantLocationChangeMonitoringAvailable
{
  return 1;
}

+ (BOOL)isMonitoringAvailableForClass:(Class)regionClass
{
  [a1 collectMetricForFunction:2];
  if ((Class)objc_opt_class() == regionClass)
  {
    unsigned int v5 = 3;
  }
  else if ((Class)objc_opt_class() == regionClass)
  {
    unsigned int v5 = 0;
  }
  else if ((Class)objc_opt_class() == regionClass)
  {
    unsigned int v5 = 2;
  }
  else
  {
    if ((Class)objc_opt_class() != regionClass && (Class)objc_opt_class() != regionClass) {
      return 0;
    }
    unsigned int v5 = 1;
  }
  return sub_1906ED390(0, v5) != 0;
}

+ (BOOL)regionMonitoringAvailable
{
  return (sub_190794774() >> 8) & 1;
}

+ (BOOL)regionMonitoringEnabled
{
  return sub_1906ED3DC() != 0;
}

+ (BOOL)isRangingAvailable
{
  return (sub_190794774() >> 22) & 1;
}

- (id)delegate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  int v7 = (void *)[self->_internal delegate];
  os_activity_scope_leave(&v9);
  return v7;
}

- (CLLocationDistance)distanceFilter
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [*((id *)self->_internal + 4) distanceFilter];
  double v8 = v7;
  os_activity_scope_leave(&v10);
  return v8;
}

- (BOOL)_limitsPrecision
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) limitsPrecision];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setPausesLocationUpdatesAutomatically:(BOOL)pausesLocationUpdatesAutomatically
{
  BOOL v3 = pausesLocationUpdatesAutomatically;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v8;
    __int16 v20 = 2050;
    uint64_t v21 = self;
    __int16 v22 = 1026;
    BOOL v23 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"pausesLocationUpdatesAutomatically\":%{public}hhd}", buf, 0x36u);
  }
  id internal = (id *)self->_internal;
  objc_sync_enter(self);
  if (!sub_1906D575C()) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 981, @"Non-UI clients cannot be autopaused");
  }
  sub_1906D54D4();
  if (sub_1906D5518())
  {
    if (v3) {
      uint64_t v10 = 6;
    }
    else {
      uint64_t v10 = 4;
    }
    [internal setPausesLocationUpdatesAutomatically:v10];
    if ([internal[4] paused]
      && [internal[4] pausesLocationUpdatesAutomatically] <= 4)
    {
      [(CLLocationManager *)self startUpdatingLocation];
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v11);
}

- (BOOL)pausesLocationUpdatesAutomatically
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  BOOL v7 = [self->_internal PausesLocationUpdatesAutomatically] > 4;
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setAllowsBackgroundLocationUpdates:(BOOL)allowsBackgroundLocationUpdates
{
  BOOL v3 = allowsBackgroundLocationUpdates;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v8;
    __int16 v20 = 2050;
    uint64_t v21 = self;
    __int16 v22 = 1026;
    BOOL v23 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"allows\":%{public}hhd}", buf, 0x36u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  if (v3)
  {
    uint64_t v10 = internal[1];
    if ((!v10 || !*(unsigned char *)(v10 + 16)) && !_CFMZEnabled()) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1026, @"Invalid parameter not satisfying: %@", @"!stayUp || CLClientIsBackgroundable(internal->fClient) || _CFMZEnabled()");
    }
  }
  [internal setAllowsBackgroundLocationUpdates:v3];
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (BOOL)allowsBackgroundLocationUpdates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [self->_internal allowsBackgroundLocationUpdates];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setShowsBackgroundLocationIndicator:(BOOL)showsBackgroundLocationIndicator
{
  BOOL v3 = showsBackgroundLocationIndicator;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    __int16 v21 = 1026;
    BOOL v22 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"shows\":%{public}hhd}", buf, 0x36u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  [internal setShowsBackgroundLocationIndicator:v3];
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (BOOL)showsBackgroundLocationIndicator
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [self->_internal showsBackgroundLocationIndicator];
  os_activity_scope_leave(&v9);
  return v7;
}

+ (BOOL)mapCorrectionAvailable
{
  sub_1906D54D4();

  return sub_19079593C();
}

- (CLLocation)location
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v4, &v21);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&unsigned char buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2050;
    *(void *)&buf[40] = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = (char *)self->_internal;
  objc_sync_enter(self);
  double v8 = *(double *)(internal + 44);
  double v9 = *(double *)(internal + 52);
  BOOL v10 = v9 != 0.0 && v8 != 0.0;
  if (*(double *)(internal + 60) >= 0.0 && !v10)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v11 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&unsigned char buf[20] = v8 != 0.0;
      *(_WORD *)&buf[24] = 1026;
      *(_DWORD *)&buf[26] = v9 != 0.0;
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NullIsland Either the latitude or longitude was exactly 0! That's highly unlikely: refreshing property\", \"latIsNonzero\":%{public}hhd, \"lonIsNonzero\":%{public}hhd}", buf, 0x1Eu);
    }
  }
  if (![*((id *)internal + 4) updatingLocation]
    || *(double *)(internal + 60) < 0.0
    || v8 == 0.0
    || v9 == 0.0)
  {
    if (!CLClientRetrieveLocationWithDynamicAccuracyReductionAndAlteredAccessoryLocations(*((void *)internal + 1), [*((id *)internal + 4) dynamicAccuracyReductionEnabled], objc_msgSend(*((id *)internal + 4), "allowsAlteredAccessoryLocations"), (uint64_t)(internal + 40)))
    {
      __int16 v19 = 0;
      goto LABEL_30;
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v13 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&unsigned char buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(void *)&buf[26] = internal + 40;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"No valid, cached location. Fetched from daemon\", \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x22u);
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&unsigned char buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(void *)&buf[26] = internal + 40;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"We have a valid, cached location. Fetching from internal state\", \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x22u);
    }
  }
  __int16 v14 = [CLLocation alloc];
  long long v15 = *(_OWORD *)(internal + 152);
  long long v26 = *(_OWORD *)(internal + 136);
  long long v27 = v15;
  v28[0] = *(_OWORD *)(internal + 168);
  *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)(internal + 180);
  long long v16 = *(_OWORD *)(internal + 88);
  *(_OWORD *)&buf[32] = *(_OWORD *)(internal + 72);
  long long v23 = v16;
  long long v17 = *(_OWORD *)(internal + 120);
  long long v24 = *(_OWORD *)(internal + 104);
  long long v25 = v17;
  long long v18 = *(_OWORD *)(internal + 56);
  *(_OWORD *)uint64_t buf = *(_OWORD *)(internal + 40);
  *(_OWORD *)&buf[16] = v18;
  __int16 v19 = [(CLLocation *)v14 initWithClientLocation:buf];
LABEL_30:
  objc_sync_exit(self);
  os_activity_scope_leave(&v21);
  return v19;
}

- (BOOL)locationServicesAvailable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    long long v16 = v6;
    __int16 v17 = 2050;
    long long v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v8);
  return 1;
}

- (BOOL)locationServicesEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  BOOL v7 = CLClientIsLocationServicesEnabled() != 0;
  os_activity_scope_leave(&v9);
  return v7;
}

- (BOOL)locationServicesApproved
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  BOOL v7 = +[CLLocationManager _authorizationStatus] == 3;
  os_activity_scope_leave(&v9);
  return v7;
}

- (double)expectedGpsUpdateInterval
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v8);
  return 1.0;
}

- (void)setSupportInfo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 2050;
    os_activity_scope_state_s v21 = self;
    __int16 v22 = 1026;
    BOOL v23 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"supportInfo\":%{public}hhd}", buf, 0x36u);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
  }
  os_activity_scope_state_s v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "Obsolete", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager setSupportInfo:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  os_activity_scope_leave(&state);
}

- (BOOL)supportInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v8);
  return 0;
}

- (__CLClient)internalClient
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  BOOL v7 = (__CLClient *)*((void *)self->_internal + 1);
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setPrivateMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    __int16 v20 = 1026;
    BOOL v21 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"privateMode\":%{public}hhd}", buf, 0x36u);
  }
  sub_1907FED78();
  os_activity_scope_leave(&v9);
}

- (BOOL)privateMode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  BOOL v7 = sub_1907FEDB8() != 0;
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setPurpose:(NSString *)purpose
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    __int16 v21 = 2113;
    uint64_t v22 = purpose;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"purpose\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EBE30(internal[1], (const __CFString *)purpose);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (NSString)purpose
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = (void **)self->_internal;
  objc_sync_enter(self);
  os_activity_scope_state_s v8 = (NSString *)sub_1906EBF14(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
  return v8;
}

- (void)setActivityType:(CLActivityType)activityType
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    *(_DWORD *)uint64_t v24 = 0;
    *(_WORD *)&v24[4] = 2082;
    *(void *)&v24[6] = "";
    *(_WORD *)&v24[14] = 2082;
    *(void *)&v24[16] = "activity";
    __int16 v25 = 2114;
    long long v26 = v8;
    __int16 v27 = 2050;
    __int16 v28 = self;
    __int16 v29 = 2050;
    CLActivityType v30 = activityType;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"activityType\":%{public, location:CLActivityType}lld}", buf, 0x3Au);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v10 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "UTF8String");
    *(_DWORD *)uint64_t buf = 136315394;
    *(void *)uint64_t v24 = v11;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = activityType;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEBUG, "Client,%s,setActivityType,%ld", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "UTF8String");
    int v19 = 136315394;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    CLActivityType v22 = activityType;
    __int16 v17 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager setActivityType:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  [*((id *)internal + 4) setActivityType:activityType];
  switch(activityType)
  {
    case CLActivityTypeFitness:
      [*((id *)internal + 4) setAllowsMapCorrection:1];
      CLClientSetAllowsMapCorrection(*((void *)internal + 1), 1);
      LODWORD(activityType) = 3;
      break;
    case CLActivityTypeAirborne:
      [*((id *)internal + 4) setAllowsMapCorrection:0];
      LODWORD(activityType) = 5;
      break;
    case CLActivityTypeOtherNavigation:
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "containsString:", @"com.apple.Maps") & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.NanoMaps"))
      {
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        int v12 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "UTF8String");
          *(_DWORD *)uint64_t buf = 136315138;
          *(void *)uint64_t v24 = v13;
          _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEBUG, "Client,%s,setActivityType,allowing map correction", buf, 0xCu);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "UTF8String");
          int v19 = 136315138;
          uint64_t v20 = v14;
          __int16 v15 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager setActivityType:]", "CoreLocation: %s\n", v15);
          if (v15 != (char *)buf) {
            free(v15);
          }
        }
      }
      else
      {
        [*((id *)internal + 4) setAllowsMapCorrection:0];
      }
      LODWORD(activityType) = 2;
      break;
  }
  sub_1906F1D8C(*((void *)internal + 1), activityType);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (CLActivityType)activityType
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    uint64_t v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  unint64_t v7 = [*((id *)self->_internal + 4) activityType];
  if (v7 <= 1) {
    CLActivityType v8 = CLActivityTypeOther;
  }
  else {
    CLActivityType v8 = v7;
  }
  os_activity_scope_leave(&v10);
  return v8;
}

- (void)markAsHavingReceivedLocation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2082;
    __int16 v13 = "activity";
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2050;
    __int16 v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLClientMarkAsHavingReceivedLocation(*((void *)self->_internal + 1));
  os_activity_scope_leave(&v7);
}

+ (BOOL)_checkAndExerciseAuthorizationForBundleID:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v7 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLActivityType v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    uint64_t v10 = [a3 UTF8String];
    *(_DWORD *)uint64_t buf = 68290050;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    __int16 v22 = 2050;
    id v23 = a1;
    __int16 v24 = 2082;
    uint64_t v25 = v10;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"bundleID\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  char v11 = sub_190801094();
  os_activity_scope_leave(&v13);
  return v11;
}

+ (BOOL)_checkAndExerciseAuthorizationForBundle:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v7 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLActivityType v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
    *(_DWORD *)uint64_t buf = 68290050;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    __int16 v22 = 2050;
    id v23 = a1;
    __int16 v24 = 2082;
    uint64_t v25 = v10;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"bundlePath\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  [a3 bundlePath];
  char v11 = sub_190801094();
  os_activity_scope_leave(&v13);
  return v11;
}

- (void)startUpdatingLocationWithPrompt
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    char v11 = "";
    __int16 v12 = 2082;
    os_activity_scope_state_s v13 = "activity";
    __int16 v14 = 2114;
    int v15 = v6;
    __int16 v16 = 2050;
    __int16 v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLClientSetShowLocationPrompt(*((void *)self->_internal + 1), 1);
  [(CLLocationManager *)self startUpdatingLocation];
  os_activity_scope_leave(&v7);
}

- (void)stopUpdatingLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    uint64_t v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:8];
  id internal = self->_internal;
  objc_sync_enter(self);
  if ([*((id *)internal + 4) requestingLocation]) {
    [internal cancelLocationRequest];
  }
  [*((id *)internal + 4) setUpdatingLocation:0];
  if ([*((id *)internal + 4) paused]) {
    [*((id *)internal + 4) setPaused:0];
  }
  CLClientStopLocationUpdates_0(*((void *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)requestLocation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)uint64_t v19 = 2082;
    *(void *)&v19[2] = "";
    *(_WORD *)&v19[10] = 2082;
    *(void *)&v19[12] = "activity";
    *(_WORD *)&v19[20] = 2114;
    *(void *)&v19[22] = v6;
    *(_WORD *)&v19[30] = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:16];
  id internal = (char *)self->_internal;
  [internal delegate];
  objc_sync_enter(self);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1333, @"Delegate must respond to locationManager:didUpdateLocations:");
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1335, @"Delegate must respond to locationManager:didFailWithError:");
  }
  if (([*((id *)internal + 4) requestingLocation] & 1) != 0
    || ([*((id *)internal + 4) updatingLocation] & 1) != 0
    || [*((id *)internal + 4) batchingLocation])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v8 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring requestLocation due to ongoing location.", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v16 = 0;
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager requestLocation]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
  else
  {
    [*((id *)internal + 4) setRequestingLocation:1];
    *(void *)(internal + 60) = 0xBFF0000000000000;
    uint64_t v9 = *((void *)internal + 1);
    double v10 = *((double *)internal + 27);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1906FE7BC;
    v15[3] = &unk_1E5696BF0;
    v15[4] = self;
    __int16 v11 = (void *)[*(id *)(v9 + 232) newTimer];
    *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
    *(void *)uint64_t v19 = 3221225472;
    *(void *)&v19[8] = sub_1906F3E08;
    *(void *)&v19[16] = &unk_1E5696C40;
    *(void *)&v19[24] = v15;
    [v11 setHandler:buf];
    [v11 setNextFireDelay:v10];
    *((void *)internal + 26) = v11;
    uint64_t v12 = *((void *)internal + 1);
    [*((id *)internal + 4) desiredAccuracy];
    CLClientStartLocationUpdatesWithDynamicAccuracyReductionAndAlteredAccessoryLocations_0(v12, (int)v13, 0, 0, -1.0);
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)allowDeferredLocationUpdatesUntilTraveled:(CLLocationDistance)distance timeout:(NSTimeInterval)timeout
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290306;
    int v17 = 0;
    __int16 v18 = 2082;
    uint64_t v19 = "";
    __int16 v20 = 2082;
    uint64_t v21 = "activity";
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2050;
    uint64_t v25 = self;
    __int16 v26 = 2050;
    CLLocationDistance v27 = distance;
    __int16 v28 = 2050;
    NSTimeInterval v29 = timeout;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"distance\":\"%{public}f\", \"timeout_s\":\"%{public}.09f\"}", buf, 0x44u);
  }
  [(CLLocationManager *)self collectMetricForFunction:32];
  id internal = self->_internal;
  [internal delegate];
  objc_sync_enter(self);
  if ([*((id *)internal + 4) requestingLocation])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "Canceling requestLocation.", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager allowDeferredLocationUpdatesUntilTraveled:timeout:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    [internal cancelLocationRequest];
  }
  [*((id *)internal + 4) setBatchingLocation:1];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1365, @"Delegate must respond to locationManager:didUpdateLocations:");
  }
  uint64_t v13 = *((void *)internal + 1);
  if (!v13 || !*(unsigned char *)(v13 + 16))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1367, @"Application must support the location background mode (in app's Info.plist, {UIBackgroundModes=(location);}");
    uint64_t v13 = *((void *)internal + 1);
  }
  sub_1906F230C(v13, distance, timeout);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)disallowDeferredLocationUpdates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:32];
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906F2454(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

+ (BOOL)deferredLocationUpdatesAvailable
{
  return 0;
}

- (BOOL)headingAvailable
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = sub_1906C2708();
  if (v7) {
    sub_1906D54D4();
  }
  os_activity_scope_leave(&v9);
  return v7 & 1;
}

- (void)setHeadingFilter:(CLLocationDegrees)headingFilter
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 2050;
    uint64_t v21 = self;
    __int16 v22 = 2050;
    CLLocationDegrees v23 = headingFilter;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"filter\":\"%{public}f\"}", buf, 0x3Au);
  }
  id internal = (id *)self->_internal;
  objc_sync_enter(self);
  double v10 = 360.0;
  if (headingFilter <= 360.0) {
    double v10 = headingFilter;
  }
  if (headingFilter <= 0.0) {
    double v10 = -1.0;
  }
  [internal[4] setHeadingFilter:v10];
  if ([internal[4] updatingHeading]) {
    [(CLLocationManager *)self startUpdatingHeading];
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v11);
}

- (CLLocationDegrees)headingFilter
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [*((id *)self->_internal + 4) headingFilter];
  double v8 = v7;
  os_activity_scope_leave(&v10);
  return v8;
}

- (void)setHeadingOrientation:(CLDeviceOrientation)headingOrientation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  double v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    __int16 v20 = self;
    __int16 v21 = 2050;
    uint64_t v22 = headingOrientation;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"orientation\":%{public, location:CLDeviceOrientation}lld}", buf, 0x3Au);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  if ((headingOrientation - 1) <= 3)
  {
    *((_DWORD *)internal + 56) = headingOrientation;
    if ([*((id *)internal + 4) updatingHeading]) {
      [(CLLocationManager *)self startUpdatingHeading];
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (CLDeviceOrientation)headingOrientation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLDeviceOrientation v7 = *((_DWORD *)self->_internal + 56);
  os_activity_scope_leave(&v9);
  return v7;
}

- (CLHeading)heading
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&unsigned char buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2050;
    *(void *)&buf[40] = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = (uint64_t *)self->_internal;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  LODWORD(internal) = CLClientGetHeading(internal[1], (uint64_t)&v15);
  objc_sync_exit(self);
  double v8 = 0;
  if (internal && *(double *)&v18 > 0.0)
  {
    os_activity_scope_state_s v9 = [CLHeading alloc];
    *(_OWORD *)&buf[32] = v17;
    long long v25 = v18;
    long long v26 = v19;
    uint64_t v27 = v20;
    *(_OWORD *)uint64_t buf = v15;
    *(_OWORD *)&buf[16] = v16;
    double v8 = [(CLHeading *)v9 initWithClientHeading:buf];
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = objc_msgSend(-[CLHeading description](v8, "description"), "UTF8String");
      *(_DWORD *)uint64_t buf = 136380675;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEBUG, "heading, %{private}s", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v13 = objc_msgSend(-[CLHeading description](v8, "description"), "UTF8String");
      int v22 = 136380675;
      uint64_t v23 = v13;
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager heading]", "CoreLocation: %s\n", v14);
      if (v14 != buf) {
        free(v14);
      }
    }
  }
  os_activity_scope_leave(&state);
  return v8;
}

- (void)startUpdatingHeading
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)long long v18 = 0;
    *(_WORD *)&v18[4] = 2082;
    *(void *)&v18[6] = "";
    __int16 v19 = 2082;
    uint64_t v20 = "activity";
    __int16 v21 = 2114;
    int v22 = v6;
    __int16 v23 = 2050;
    uint64_t v24 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:64];
  id internal = self->_internal;
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  [*((id *)internal + 4) setUpdatingHeading:1];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  double v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    [*((id *)internal + 4) headingFilter];
    *(_DWORD *)uint64_t buf = 134349056;
    *(void *)long long v18 = v9;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Start updating heading. HeadingFilter, %{public}.2f", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    [*((id *)internal + 4) headingFilter];
    int v15 = 134349056;
    uint64_t v16 = v12;
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager startUpdatingHeading]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  uint64_t v10 = *((void *)internal + 1);
  [*((id *)internal + 4) headingFilter];
  CLClientStartHeadingUpdates(v10, *((_DWORD *)internal + 56), v11);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopUpdatingHeading
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    long long v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:128];
  id internal = self->_internal;
  objc_sync_enter(self);
  [*((id *)internal + 4) setUpdatingHeading:0];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  double v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Stop updating heading", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager stopUpdatingHeading]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  CLClientStopHeadingUpdates(*((void *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)dismissHeadingCalibrationDisplay
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    long long v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  double v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing Compass Calibration HUD", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager dismissHeadingCalibrationDisplay]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  CLClientShowHeadingCalibration(internal[1], 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)_startMonitoringSignificantLocationChangesOfDistance:(double)a3 withPowerBudget:(int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v12 = a3;
  int v11 = a4;
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2082;
    long long v18 = "activity";
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    __int16 v21 = 2050;
    int v22 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  *(void *)((char *)internal + 60) = 0xBFF0000000000000;
  sub_1906E68FC(internal[1], &v12, &v11);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)stopMonitoringSignificantLocationChanges
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    double v12 = "";
    __int16 v13 = 2082;
    int v14 = "activity";
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    __int16 v17 = 2050;
    long long v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:512];
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EDD38(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)startMonitoringLocationPushesWithCompletion:(void *)completion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    long long v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:1024];
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906ECA48(internal[1], (uint64_t)completion);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)stopMonitoringLocationPushes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    int v14 = "activity";
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    __int16 v17 = 2050;
    long long v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:2048];
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906ECCDC(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)startMonitoringForRegion:(CLRegion *)region desiredAccuracy:(CLLocationAccuracy)accuracy
{
}

- (void)startMonitoringForRegion:(CLRegion *)region
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&unsigned char buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v8;
    *(_WORD *)&buf[38] = 2050;
    NSTimeInterval v29 = self;
    __int16 v30 = 2113;
    uint64_t v31 = region;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:4096];
  BOOL v9 = region == 0;
  if (!region)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v11 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = region;
  }
  else {
    int v12 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v13 = region;
  }
  else {
    __int16 v13 = 0;
  }
  if (v12)
  {
    uint64_t v14 = [(CLRegion *)v12 UUID];
    if (region) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    BOOL v9 = v15;
  }
  else if (v13)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v16 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = objc_msgSend((id)-[CLRegion vertices](v13, "vertices"), "count");
      *(_DWORD *)uint64_t buf = 134349056;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEBUG, "Number of vertices %{public}lu", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v22 = objc_msgSend((id)-[CLRegion vertices](v13, "vertices"), "count");
      int v26 = 134349056;
      uint64_t v27 = v22;
      uint64_t v23 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager startMonitoringForRegion:]", "CoreLocation: %s\n", v23);
      if (v23 != buf) {
        free(v23);
      }
    }
  }
  id internal = (uint64_t *)self->_internal;
  uint64_t v19 = [internal delegate];
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  if (v9 || !sub_1906EE178(internal[1], region))
  {
    uint64_t v20 = internal[1];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_190700E08;
    v24[3] = &unk_1E5696FA8;
    v24[4] = self;
    v24[5] = v19;
    v24[6] = region;
    if (v20)
    {
      uint64_t v21 = *(void **)(v20 + 232);
      *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1906DD850;
      *(void *)&buf[24] = &unk_1E5696C40;
      *(void *)&buf[32] = v24;
      [v21 async:buf];
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopMonitoringForRegion:(CLRegion *)region
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2082;
    long long v18 = "activity";
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    __int16 v21 = 2050;
    uint64_t v22 = self;
    __int16 v23 = 2113;
    uint64_t v24 = region;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x2000];
  if (region)
  {
    id internal = self->_internal;
    objc_sync_enter(self);
    sub_1906EE30C(internal[1], region);
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = "";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v11 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  os_activity_scope_leave(&v12);
}

- (void)requestStateForRegion:(CLRegion *)region
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2082;
    long long v18 = "activity";
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    __int16 v21 = 2050;
    uint64_t v22 = self;
    __int16 v23 = 2113;
    uint64_t v24 = region;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x4000];
  if (region)
  {
    id internal = (uint64_t *)self->_internal;
    objc_sync_enter(self);
    [internal performCourtesyPromptIfNeeded];
    sub_1906EF5E8(internal[1], region);
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = "";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v11 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  os_activity_scope_leave(&v12);
}

- (CLLocationDistance)maximumRegionMonitoringDistance
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    os_activity_scope_state_s v12 = "";
    __int16 v13 = 2082;
    int v14 = "activity";
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    __int16 v17 = 2050;
    long long v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x8000];
  objc_sync_enter(self);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
  return 2128000.0;
}

- (NSSet)monitoredRegions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = "activity";
    __int16 v20 = 2114;
    __int16 v21 = v6;
    __int16 v22 = 2050;
    __int16 v23 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x10000];
  id internal = self->_internal;
  objc_sync_enter(self);
  os_activity_scope_state_s v8 = (void *)internal[1];
  objc_sync_exit(self);
  BOOL v9 = (void *)sub_1906EF8E0(v8);
  if (v9)
  {
    int v10 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v9];

    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v10 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
  if (v10) {
LABEL_9:
  }
    __int16 v11 = v10;
LABEL_10:
  os_activity_scope_leave(&v13);
  return v10;
}

- (void)startRangingBeaconsInRegion:(CLBeaconRegion *)region
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)uint64_t v25 = 2082;
    *(void *)&v25[2] = "";
    *(_WORD *)&v25[10] = 2082;
    *(void *)&v25[12] = "activity";
    *(_WORD *)&v25[20] = 2114;
    *(void *)&v25[22] = v8;
    *(_WORD *)&v25[30] = 2050;
    int v26 = self;
    __int16 v27 = 2113;
    uint64_t v28 = region;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x20000];
  BOOL v9 = region == 0;
  if (!region)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v25 = 2082;
      *(void *)&v25[2] = "";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v11 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v25 = 2082;
      *(void *)&v25[2] = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  if ([(NSString *)[(CLRegion *)region onBehalfOfBundleId] length])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      os_activity_scope_state_s v13 = [(NSString *)[(CLRegion *)region onBehalfOfBundleId] UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v25 = 2082;
      *(void *)&v25[2] = "";
      *(_WORD *)&v25[10] = 2082;
      *(void *)&v25[12] = v13;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Cannot start ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    int v14 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      int v15 = [(NSString *)[(CLRegion *)region onBehalfOfBundleId] UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v25 = 2082;
      *(void *)&v25[2] = "";
      *(_WORD *)&v25[10] = 2082;
      *(void *)&v25[12] = v15;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot start ranging beacons on behalf of another app", "{\"msg%{public}.0s\":\"Cannot start ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    BOOL v9 = 1;
  }
  if ([(CLRegion *)region type])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v16 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v25 = 2082;
      *(void *)&v25[2] = "";
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    __int16 v17 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v25 = 2082;
      *(void *)&v25[2] = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is not an instance of CLBeaconRegion", "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}", buf, 0x12u);
    }
    BOOL v9 = 1;
  }
  id internal = (uint64_t *)self->_internal;
  uint64_t v19 = [internal delegate];
  objc_sync_enter(self);
  if (v9
    || ([internal performCourtesyPromptIfNeeded],
        objc_msgSend((id)objc_msgSend(internal, "rangedRegions"), "removeObject:", region),
        objc_msgSend((id)objc_msgSend(internal, "rangedRegions"), "addObject:", region),
        !sub_1906F0ED0(internal[1], (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithSet:copyItems:", objc_msgSend(internal, "rangedRegions"), 1), 1)))
  {
    uint64_t v20 = internal[1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_190701F54;
    v22[3] = &unk_1E5696FA8;
    v22[4] = self;
    v22[5] = v19;
    v22[6] = region;
    if (v20)
    {
      __int16 v21 = *(void **)(v20 + 232);
      *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
      *(void *)uint64_t v25 = 3221225472;
      *(void *)&v25[8] = sub_1906DD850;
      *(void *)&v25[16] = &unk_1E5696C40;
      *(void *)&v25[24] = v22;
      [v21 async:buf];
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopRangingBeaconsInRegion:(CLBeaconRegion *)region
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v6, &v21);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    int v23 = 0;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    __int16 v26 = 2082;
    __int16 v27 = "activity";
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    __int16 v30 = 2050;
    uint64_t v31 = self;
    __int16 v32 = 2113;
    uint64_t v33 = region;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x20000];
  if (!region)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v17 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      uint64_t v25 = "";
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    uint64_t v18 = qword_1EB2713E0;
    if (!os_signpost_enabled((os_log_t)qword_1EB2713E0)) {
      goto LABEL_31;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v23 = 0;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    os_activity_scope_state_s v13 = "Region is nil";
    int v14 = "{\"msg%{public}.0s\":\"Region is nil\"}";
    goto LABEL_29;
  }
  if (![(NSString *)[(CLRegion *)region onBehalfOfBundleId] length])
  {
    if (![(CLRegion *)region type])
    {
      id internal = (uint64_t *)self->_internal;
      objc_sync_enter(self);
      objc_msgSend((id)objc_msgSend(internal, "rangedRegions"), "removeObject:", region);
      sub_1906F0ED0(internal[1], (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithSet:copyItems:", objc_msgSend(internal, "rangedRegions"), 1), 0);
      objc_sync_exit(self);
      goto LABEL_31;
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v19 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      uint64_t v25 = "";
      _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    uint64_t v18 = qword_1EB2713E0;
    if (!os_signpost_enabled((os_log_t)qword_1EB2713E0)) {
      goto LABEL_31;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v23 = 0;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    os_activity_scope_state_s v13 = "Region is not an instance of CLBeaconRegion";
    int v14 = "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}";
LABEL_29:
    int v15 = v18;
    uint32_t v16 = 18;
    goto LABEL_30;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    int v10 = [(NSString *)[(CLRegion *)region onBehalfOfBundleId] UTF8String];
    *(_DWORD *)uint64_t buf = 68289282;
    int v23 = 0;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    __int16 v26 = 2082;
    __int16 v27 = v10;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Cannot stop ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
  }
  uint64_t v11 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    os_activity_scope_state_s v12 = [(NSString *)[(CLRegion *)region onBehalfOfBundleId] UTF8String];
    *(_DWORD *)uint64_t buf = 68289282;
    int v23 = 0;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    __int16 v26 = 2082;
    __int16 v27 = v12;
    os_activity_scope_state_s v13 = "Cannot stop ranging beacons on behalf of another app";
    int v14 = "{\"msg%{public}.0s\":\"Cannot stop ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, locati"
          "on:escape_only}s}";
    int v15 = v11;
    uint32_t v16 = 28;
LABEL_30:
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v13, v14, buf, v16);
  }
LABEL_31:
  os_activity_scope_leave(&v21);
}

- (void)startRangingBeaconsSatisfyingConstraint:(CLBeaconIdentityConstraint *)constraint
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    *(void *)uint64_t buf = 68290051;
    *(_WORD *)__int16 v27 = 2082;
    *(void *)&v27[2] = "";
    *(_WORD *)&v27[10] = 2082;
    *(void *)&v27[12] = "activity";
    *(_WORD *)&v27[20] = 2114;
    *(void *)&v27[22] = v8;
    *(_WORD *)&v27[30] = 2050;
    __int16 v28 = self;
    __int16 v29 = 2113;
    __int16 v30 = constraint;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"constraint\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x20000];
  if (!constraint) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1856, @"Invalid parameter not satisfying: %@", @"constraint");
  }
  id internal = (uint64_t *)self->_internal;
  uint64_t v17 = [internal delegate];
  objc_sync_enter(self);
  objc_msgSend((id)objc_msgSend(internal, "rangedConstraints"), "addObject:", constraint);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v18 = constraint;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = (void *)[internal rangedConstraints];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v10, "addObject:", -[CLBeaconRegion initWithBeaconIdentityConstraint:identifier:]([CLBeaconRegion alloc], "initWithBeaconIdentityConstraint:identifier:", *(void *)(*((void *)&v20 + 1) + 8 * i), &stru_1EE006720));
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }
  if (!sub_1906F0ED0(internal[1], v10, 1))
  {
    uint64_t v15 = internal[1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_190702A38;
    v19[3] = &unk_1E5696FA8;
    v19[4] = self;
    v19[5] = v17;
    v19[6] = v18;
    if (v15)
    {
      uint32_t v16 = *(void **)(v15 + 232);
      *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
      *(void *)__int16 v27 = 3221225472;
      *(void *)&v27[8] = sub_1906DD850;
      *(void *)&v27[16] = &unk_1E5696C40;
      *(void *)&v27[24] = v19;
      [v16 async:buf];
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopRangingBeaconsSatisfyingConstraint:(CLBeaconIdentityConstraint *)constraint
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v8 = NSStringFromSelector(a2);
    uint64_t buf = 68290051;
    __int16 v22 = 2082;
    long long v23 = "";
    __int16 v24 = 2082;
    uint64_t v25 = "activity";
    __int16 v26 = 2114;
    __int16 v27 = v8;
    __int16 v28 = 2050;
    __int16 v29 = self;
    __int16 v30 = 2113;
    uint64_t v31 = constraint;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"constraint\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x20000];
  if (!constraint) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 1891, @"Invalid parameter not satisfying: %@", @"constraint != nil");
  }
  id internal = (uint64_t *)self->_internal;
  objc_sync_enter(self);
  objc_msgSend((id)objc_msgSend(internal, "rangedConstraints"), "removeObject:", constraint);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v11 = (void *)[internal rangedConstraints];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v10, "addObject:", -[CLBeaconRegion initWithBeaconIdentityConstraint:identifier:]([CLBeaconRegion alloc], "initWithBeaconIdentityConstraint:identifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), &stru_1EE006720));
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
  sub_1906F0ED0(internal[1], v10, 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (NSSet)rangedBeaconConstraints
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2082;
    long long v16 = "activity";
    __int16 v17 = 2114;
    long long v18 = v6;
    __int16 v19 = 2050;
    long long v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x20000];
  id internal = self->_internal;
  objc_sync_enter(self);
  os_activity_scope_state_s v8 = (NSSet *)(id)objc_msgSend((id)objc_msgSend(internal, "rangedConstraints"), "copy");
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
  return v8;
}

- (NSSet)rangedRegions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2082;
    long long v16 = "activity";
    __int16 v17 = 2114;
    long long v18 = v6;
    __int16 v19 = 2050;
    long long v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x20000];
  id internal = self->_internal;
  objc_sync_enter(self);
  os_activity_scope_state_s v8 = (NSSet *)(id)objc_msgSend((id)objc_msgSend(internal, "rangedRegions"), "copy");
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
  return v8;
}

+ (BOOL)isPeerRangingAvailable
{
  return 1;
}

+ (id)metadataForHomekitAccessoryControlEventWithUUID:(id)a3 stateString:(id)a4 serviceUUID:(id)a5 serviceType:(id)a6 characteristicType:(id)a7 serviceGroupUUID:(id)a8 source:(id)a9 roomUUID:(id)a10
{
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setValue:a3 forKey:0x1EE008C20];
  [v16 setValue:a4 forKey:0x1EE008CA0];
  [v16 setValue:a5 forKey:0x1EE008CC0];
  [v16 setValue:a6 forKey:0x1EE008C40];
  [v16 setValue:a7 forKey:0x1EE008C60];
  [v16 setValue:a8 forKey:0x1EE008CE0];
  [v16 setValue:a9 forKey:0x1EE008C80];
  [v16 setValue:a10 forKey:0x1EE008D00];
  return v16;
}

- (id)getMicroLocationInternalVersion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2082;
    id v16 = "activity";
    __int16 v17 = 2114;
    long long v18 = v6;
    __int16 v19 = 2050;
    long long v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  CLDeviceOrientation v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received internal version get request\"}", buf, 0x12u);
  }
  id v8 = (id)CLCopyMicroLocationInternalVersion();
  os_activity_scope_leave(&v10);
  return v8;
}

- (void)exportMicroLocationDatabaseTablesWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2050;
    long long v23 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  BOOL v9 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to export copy of MiLo DB tables\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  uint64_t v11 = internal[1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1907037D8;
  v12[3] = &unk_1E5696FD0;
  v12[4] = a3;
  sub_1906F3178(v11, (uint64_t)v12);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)exportMicroLocationDataForMigrationWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2050;
    long long v23 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  BOOL v9 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to export copy of MiLo DB tables for migration\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  uint64_t v11 = internal[1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_190703C04;
  v12[3] = &unk_1E5696FD0;
  v12[4] = a3;
  sub_1906F33C8(v11, (uint64_t)v12);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)requestMicroLocationStaticSourcesStatisticsWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2050;
    long long v23 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  BOOL v9 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to get per anchor per cluster measured value statistics\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  uint64_t v11 = internal[1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_190704030;
  v12[3] = &unk_1E5696FD0;
  v12[4] = a3;
  sub_1906F3618(v11, (uint64_t)v12);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)requestMicroLocationLearningWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v8;
    __int16 v20 = 2050;
    uint64_t v21 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  BOOL v9 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received learning request\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906F3868(internal[1], (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v11);
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3 withCompletion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  BOOL v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v10 = NSStringFromSelector(a2);
    *(void *)uint64_t buf = 68289794;
    *(_WORD *)long long v41 = 2082;
    *(void *)&v41[2] = "";
    *(_WORD *)&v41[10] = 2082;
    *(void *)&v41[12] = "activity";
    *(_WORD *)&v41[20] = 2114;
    *(void *)&v41[22] = v10;
    *(_WORD *)&v41[30] = 2050;
    __int16 v42 = self;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  os_activity_scope_state_s v11 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(void *)uint64_t buf = 68289026;
    *(_WORD *)long long v41 = 2082;
    *(void *)&v41[2] = "";
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received localization scan request\"}", buf, 0x12u);
  }
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  int v12 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v25 = (CLLocationManager *)a4;
  __int16 v26 = self;
  int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3 copyItems:1];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  uint64_t v14 = [a3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v18 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v29;
LABEL_16:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v12);
            }
            [v13 objectForKeyedSubscript:v17];
            if (objc_opt_isKindOfClass()) {
              break;
            }
            if (v18 == ++v20)
            {
              uint64_t v18 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v18) {
                goto LABEL_16;
              }
              goto LABEL_22;
            }
          }
        }
        else
        {
LABEL_22:
          [v13 removeObjectForKey:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v14);
  }
  id internal = v26->_internal;
  objc_sync_enter(v26);
  uint64_t v22 = internal[1];
  uint64_t v23 = *(void *)(v22 + 232);
  *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
  *(void *)long long v41 = 3221225472;
  *(void *)&v41[8] = sub_1906F2ABC;
  *(void *)&v41[16] = &unk_1E5696C90;
  *(void *)&v41[24] = v23;
  __int16 v42 = v25;
  sub_1906F45D8(v22, "kCLConnectionMessageRequestMicroLocation", (uint64_t)v13, 0, (uint64_t)buf);
  objc_sync_exit(v26);
  id v24 = v13;
  os_activity_scope_leave(&state);
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3
{
}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3
{
}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CLDeviceOrientation v7 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = NSStringFromSelector(a2);
    *(void *)uint64_t buf = 68289794;
    *(_WORD *)__int16 v40 = 2082;
    *(void *)&v40[2] = "";
    *(_WORD *)&v40[10] = 2082;
    *(void *)&v40[12] = "activity";
    *(_WORD *)&v40[20] = 2114;
    *(void *)&v40[22] = v9;
    *(_WORD *)&v40[30] = 2050;
    long long v41 = self;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  os_activity_scope_state_s v10 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(void *)uint64_t buf = 68289282;
    *(_WORD *)__int16 v40 = 2082;
    *(void *)&v40[2] = "";
    *(_WORD *)&v40[10] = 1026;
    *(_DWORD *)&v40[12] = v4;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received recording scan request\", \"forced:\":%{public}hhd}", buf, 0x18u);
  }
  if (!a3) {
    a3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3 copyItems:1];
  int v12 = v11;
  if (v4) {
    uint64_t v13 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CC28];
  }
  [v11 setValue:v13 forKey:0x1EE008E00];
  if (![v12 objectForKey:0x1EE008E20]) {
    objc_msgSend(v12, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F29128], "UUID"), 0x1EE008E20);
  }
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  uint64_t v14 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  uint64_t v25 = self;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(a3);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v19 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v28;
LABEL_23:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v14);
            }
            [v12 objectForKeyedSubscript:v18];
            if (objc_opt_isKindOfClass()) {
              break;
            }
            if (v19 == ++v21)
            {
              uint64_t v19 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
              if (v19) {
                goto LABEL_23;
              }
              goto LABEL_29;
            }
          }
        }
        else
        {
LABEL_29:
          [v12 removeObjectForKey:v18];
        }
      }
      uint64_t v15 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v15);
  }
  id internal = v25->_internal;
  objc_sync_enter(v25);
  uint64_t v23 = internal[1];
  uint64_t v24 = *(void *)(v23 + 232);
  *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
  *(void *)__int16 v40 = 3221225472;
  *(void *)&v40[8] = sub_1906F2ABC;
  *(void *)&v40[16] = &unk_1E5696C90;
  *(void *)&v40[24] = v24;
  long long v41 = 0;
  sub_1906F45D8(v23, "kCLConnectionMessageRequestMicroLocationRecordingScan", (uint64_t)v12, 0, (uint64_t)buf);
  objc_sync_exit(v25);
  os_activity_scope_leave(&state);
}

- (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  BOOL v9 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v10 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromSelector(a2);
    *(void *)uint64_t buf = 68289794;
    *(_WORD *)uint64_t v45 = 2082;
    *(void *)&v45[2] = "";
    *(_WORD *)&v45[10] = 2082;
    *(void *)&v45[12] = "activity";
    *(_WORD *)&v45[20] = 2114;
    *(void *)&v45[22] = v11;
    *(_WORD *)&v45[30] = 2050;
    uint64_t v46 = self;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  int v12 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(void *)uint64_t buf = 68289282;
    *(_WORD *)uint64_t v45 = 2082;
    *(void *)&v45[2] = "";
    *(_WORD *)&v45[10] = 1026;
    *(_DWORD *)&v45[12] = v6;
    _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received recording scan request\", \"forced:\":%{public}hhd}", buf, 0x18u);
  }
  uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
  if (!a3) {
    a3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v14 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3 copyItems:1];
  [v14 setValue:v13 forKey:0x1EE008E20];
  if (v6) {
    uint64_t v15 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CC28];
  }
  [v14 setValue:v15 forKey:0x1EE008E00];
  long long v29 = (CLLocationManager *)a5;
  long long v30 = self;
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  v43[2] = objc_opt_class();
  uint64_t v16 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  long long v28 = (void *)v13;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v17 = [a3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(a3);
        }
        uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v21 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v33;
LABEL_21:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v16);
            }
            [v14 objectForKeyedSubscript:v20];
            if (objc_opt_isKindOfClass()) {
              break;
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
              if (v21) {
                goto LABEL_21;
              }
              goto LABEL_27;
            }
          }
        }
        else
        {
LABEL_27:
          [v14 removeObjectForKey:v20];
        }
      }
      uint64_t v17 = [a3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v17);
  }
  id internal = v30->_internal;
  objc_sync_enter(v30);
  uint64_t v25 = internal[1];
  uint64_t v26 = *(void *)(v25 + 232);
  *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
  *(void *)uint64_t v45 = 3221225472;
  *(void *)&v45[8] = sub_1906F2ABC;
  *(void *)&v45[16] = &unk_1E5696C90;
  *(void *)&v45[24] = v26;
  uint64_t v46 = v29;
  sub_1906F45D8(v25, "kCLConnectionMessageRequestMicroLocationRecordingScan", (uint64_t)v14, 0, (uint64_t)buf);
  objc_sync_exit(v30);
  os_activity_scope_leave(&state);
  return v28;
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v10 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v11 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v17 = 0;
    __int16 v18 = 2082;
    uint64_t v19 = "";
    __int16 v20 = 2082;
    uint64_t v21 = "activity";
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2050;
    uint64_t v25 = self;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  uint64_t v13 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v17 = 0;
    __int16 v18 = 2082;
    uint64_t v19 = "";
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received truth label donation request for a recording trigger\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906F2C68(internal[1], [a3 UUIDString], objc_msgSend(a4, "UUIDString"), (uint64_t)a5);
  objc_sync_exit(self);
  os_activity_scope_leave(&v15);
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v12 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v12, &v18);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v13 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v22 = 0;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2082;
    uint64_t v26 = "activity";
    __int16 v27 = 2114;
    long long v28 = v14;
    __int16 v29 = 2050;
    long long v30 = self;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if ([a4 compare:a5] == 1)
  {
    if (a6)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F28568];
      __int16 v20 = @"donateTruthTagLabelForClient failed because startDate is later than endDate";
      (*((void (**)(id, id))a6 + 2))(a6, (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 5, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
    }
    uint64_t v16 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v22 = 0;
      __int16 v23 = 2082;
      __int16 v24 = "";
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received truth label donation request between Dates\"}", buf, 0x12u);
    }
    id internal = self->_internal;
    objc_sync_enter(self);
    sub_1906F2EE4(internal[1], [a3 UUIDString], (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
    objc_sync_exit(self);
  }
  os_activity_scope_leave(&v18);
}

- (void)startTranscriptSessionInstantlyWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    os_activity_scope_state_s v18 = v8;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EE48C(internal[1], 1, 0, (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)startTranscriptSessionWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    os_activity_scope_state_s v18 = v8;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EE48C(internal[1], 1, 1, (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)endTranscriptSessionWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = "activity";
    __int16 v17 = 2114;
    os_activity_scope_state_s v18 = v8;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EE48C(internal[1], 0, 0, (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)fetchTranscriptLocationsWithRadius:(double)a3 sampleCount:(int)a4 center:(CLLocationCoordinate2D)a5 completionHandler:(id)a6
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  uint64_t v9 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  __int16 v13 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v13, &v17);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v14 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v19 = 0;
    __int16 v20 = 2082;
    uint64_t v21 = "";
    __int16 v22 = 2082;
    __int16 v23 = "activity";
    __int16 v24 = 2114;
    __int16 v25 = v15;
    __int16 v26 = 2050;
    __int16 v27 = self;
    _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EE634(internal[1], v9, (uint64_t)a6, a3, latitude, longitude);
  objc_sync_exit(self);
  os_activity_scope_leave(&v17);
}

- (void)requestHistoricalLocationsWithPurposeKey:(NSString *)purposeKey sampleCount:(NSInteger)sampleCount completionHandler:(void *)handler
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v10 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v10, &v14);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v11 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v16 = 0;
    __int16 v17 = 2082;
    os_activity_scope_state_s v18 = "";
    __int16 v19 = 2082;
    __int16 v20 = "activity";
    __int16 v21 = 2114;
    __int16 v22 = v12;
    __int16 v23 = 2050;
    __int16 v24 = self;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x40000];
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EEAE0(internal[1], (uint64_t)purposeKey, sampleCount, (uint64_t)handler);
  objc_sync_exit(self);
  os_activity_scope_leave(&v14);
}

- (void)willPromptForTranscriptSessionWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    os_activity_scope_state_s v14 = "";
    __int16 v15 = 2082;
    int v16 = "activity";
    __int16 v17 = 2114;
    os_activity_scope_state_s v18 = v8;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EEF2C(internal[1], (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)isConsideredInRemoteAreaWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  CLDeviceOrientation v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    os_activity_scope_state_s v14 = "";
    __int16 v15 = 2082;
    int v16 = "activity";
    __int16 v17 = 2114;
    os_activity_scope_state_s v18 = v8;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EF2A0(internal[1], (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

+ (id)metadataForHomekitActionSetEventWithUUID:(id)a3 name:(id)a4 type:(id)a5 clientName:(id)a6 source:(id)a7 homeName:(id)a8
{
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v14 setValue:a3 forKey:0x1EE008D20];
  [v14 setValue:a4 forKey:0x1EE008D40];
  [v14 setValue:a5 forKey:0x1EE008D60];
  [v14 setValue:a6 forKey:0x1EE008D80];
  [v14 setValue:a7 forKey:0x1EE008DA0];
  [v14 setValue:a8 forKey:0x1EE008DC0];
  return v14;
}

+ (id)metadataForMicroLocationTruthTagEventWithTagUUID:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setValue:a3 forKey:0x1EE008DE0];
  return v4;
}

- (void)purgeMicroLocationSemiSupervisedData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  CLDeviceOrientation v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to purge semi-supervised models\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906F3A94(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v9);
}

- (void)purgeMicroLocationData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE002DE0);
  }
  CLDeviceOrientation v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to purge MicroLocation data\"}", buf, 0x12u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906F3AF8(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v9);
}

- (void)resetApps
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2082;
    __int16 v13 = "activity";
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2050;
    __int16 v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_sync_enter(self);
  sub_1907FDA70();
  objc_sync_exit(self);
  os_activity_scope_leave(&v7);
}

- (id)appsUsingLocation
{
  return 0;
}

+ (id)activeLocationClientsWithInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    id v19 = a1;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id v7 = (id)CLCopyActiveClientsUsingLocation();
  os_activity_scope_leave(&v9);
  return v7;
}

- (id)appsUsingLocationWithDetails
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    id v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id v7 = (id)CLCopyAppsUsingLocation();
  os_activity_scope_leave(&v9);
  return v7;
}

+ (id)userLocationClientsWithInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    id v19 = a1;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id v7 = (id)CLCopyAppsUsingLocation();
  os_activity_scope_leave(&v9);
  return v7;
}

- (id)appLocationInfo
{
  return CLClientGetClientDictionary(*((void *)self->_internal + 1));
}

+ (id)_archivedAuthorizationDecisionsWithError:(id *)a3
{
  return (id)CLGetArchivedAuthorizationDecisions((uint64_t)a3);
}

+ (id)_applyArchivedAuthorizationDecisions:(id)a3
{
  return (id)CLApplyArchivedAuthorizationDecisions((uint64_t)a3);
}

- (id)technologiesInUse
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    id v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id v7 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:(id)CLCopyTechnologiesInUse()];
  os_activity_scope_leave(&v9);
  return v7;
}

- (id)_zAxisStatistics
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    id v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id v7 = (id)CLCopyZaxisStats();
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)addIdentifiableClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v14 = 2082;
    *(void *)&v14[2] = "";
    *(_WORD *)&v14[10] = 2082;
    *(void *)&v14[12] = "activity";
    *(_WORD *)&v14[20] = 2114;
    *(void *)&v14[22] = v8;
    __int16 v15 = 2050;
    __int16 v16 = self;
    __int16 v17 = 2050;
    id v18 = a3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"client\":\"%{public}p\"}", buf, 0x3Au);
  }
  if (a3)
  {
    id internal = (id *)self->_internal;
    objc_initWeak(&location, a3);
    *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
    *(void *)__int16 v14 = 3221225472;
    *(void *)&v14[8] = sub_1906F8D7C;
    *(void *)&v14[16] = &unk_1E5696F60;
    objc_copyWeak((id *)&v14[24], &location);
    __int16 v10 = _Block_copy(buf);
    objc_destroyWeak((id *)&v14[24]);
    objc_destroyWeak(&location);
    objc_sync_enter(self);
    [internal[35] addObject:v10];
    objc_sync_exit(self);
    [a3 setWeakClient:v10];
    objc_msgSend(a3, "updateIdentityToken:withStorageToken:", objc_msgSend(internal, "clientKeyForIdentityValidation"), objc_msgSend(internal, "monitorLedgerAccessKey"));
  }
  os_activity_scope_leave(&state);
}

- (void)removeIdentifiableClient:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [a3 weakClient];
    *(_DWORD *)uint64_t buf = 68290306;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 2050;
    uint64_t v21 = self;
    __int16 v22 = 2050;
    id v23 = a3;
    __int16 v24 = 2050;
    uint64_t v25 = v9;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"client\":\"%{public}p\", \"weakClient\":\"%{public}p\"}", buf, 0x44u);
  }
  if (a3 && [a3 weakClient])
  {
    id internal = (id *)self->_internal;
    objc_sync_enter(self);
    objc_msgSend(internal[35], "removeObject:", objc_msgSend(a3, "weakClient"));
    [a3 setWeakClient:0];
    objc_sync_exit(self);
  }
  os_activity_scope_leave(&v11);
}

- (NSString)processName
{
  char v2 = (void *)[MEMORY[0x1E4F28F80] processInfo];

  return (NSString *)[v2 processName];
}

- (void)onLocationRequestTimeout
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v4, &v21);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&unsigned char buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2050;
    *(void *)&unsigned char buf[40] = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = (char *)self->_internal;
  id v8 = (void *)[internal delegate];
  objc_sync_enter(self);
  if ([*((id *)internal + 4) requestingLocation])
  {
    [internal cancelLocationRequest];
    CLClientStopLocationUpdates_0(*((void *)internal + 1));
    if (*(double *)(internal + 60) >= 0.0)
    {
      os_activity_scope_state_s v11 = [CLLocation alloc];
      __int16 v12 = internal + 40;
      long long v13 = *(_OWORD *)(internal + 152);
      long long v26 = *(_OWORD *)(internal + 136);
      long long v27 = v13;
      v28[0] = *(_OWORD *)(internal + 168);
      *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)(internal + 180);
      long long v14 = *(_OWORD *)(internal + 88);
      *(_OWORD *)&buf[32] = *(_OWORD *)(internal + 72);
      long long v23 = v14;
      long long v15 = *(_OWORD *)(internal + 120);
      long long v24 = *(_OWORD *)(internal + 104);
      long long v25 = v15;
      long long v16 = *(_OWORD *)(internal + 56);
      *(_OWORD *)uint64_t buf = *(_OWORD *)(internal + 40);
      *(_OWORD *)&buf[16] = v16;
      __int16 v17 = [(CLLocation *)v11 initWithClientLocation:buf];
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
      entr_act_modify();
      uint64_t v19 = NSStringFromSelector(sel_locationManager_didUpdateLocations_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v20 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290307;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&unsigned char buf[20] = self;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2114;
        *(void *)&unsigned char buf[40] = v19;
        LOWORD(v23) = 1040;
        *(_DWORD *)((char *)&v23 + 2) = 156;
        WORD3(v23) = 2097;
        *((void *)&v23 + 1) = v12;
        _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate - request timeout\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x40u);
      }
      [v8 locationManager:self didUpdateLocations:v18];
    }
    else
    {
      uint64_t v9 = NSStringFromSelector(sel_locationManager_didFailWithError_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v10 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289794;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&unsigned char buf[20] = self;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2114;
        *(void *)&unsigned char buf[40] = v9;
        _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate - request timeout\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", buf, 0x30u);
      }
      objc_msgSend(v8, "locationManager:didFailWithError:", self, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomain", 0, 0));
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v21);
}

- (void)onClientEventLocationUnavailable:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id internal = (id *)self->_internal;
  unsigned int v5 = objc_msgSend(internal, "delegate", a3);
  if ([internal[4] requestingLocation] & 1) == 0 && (objc_opt_respondsToSelector())
  {
    BOOL v6 = NSStringFromSelector(sel_locationManager_didFailWithError_);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    id v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289794;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2050;
      __int16 v12 = self;
      __int16 v13 = 2050;
      long long v14 = v5;
      __int16 v15 = 2114;
      long long v16 = v6;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate - location unavailable\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x30u);
    }
    objc_msgSend(v5, "locationManager:didFailWithError:", self, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomain", 0, 0));
  }
}

- (void)onClientEventHeading:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id internal = (uint64_t *)self->_internal;
  unsigned int v5 = objc_msgSend(internal, "delegate", a3);
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  if (CLClientGetHeading(internal[1], (uint64_t)&v12))
  {
    objc_sync_enter(self);
    if (objc_opt_respondsToSelector())
    {
      BOOL v6 = [CLHeading alloc];
      *(_OWORD *)&buf[32] = v14;
      long long v19 = v15;
      long long v20 = v16;
      uint64_t v21 = v17;
      *(_OWORD *)uint64_t buf = v12;
      *(_OWORD *)&buf[16] = v13;
      id v7 = [(CLHeading *)v6 initWithClientHeading:buf];
      entr_act_modify();
      id v8 = NSStringFromSelector(sel_locationManager_didUpdateHeading_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&unsigned char buf[20] = self;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v5;
        *(_WORD *)&buf[38] = 2114;
        *(void *)&unsigned char buf[40] = v8;
        LOWORD(v19) = 2114;
        *(void *)((char *)&v19 + 2) = v7;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"heading\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      [v5 locationManager:self didUpdateHeading:v7];
    }
    else
    {
      entr_act_modify();
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "could not get updated heading", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventHeading:]", "CoreLocation: %s\n", v11);
      if (v11 != buf) {
        free(v11);
      }
    }
  }
}

- (void)onClientEventHeadingCalibration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id internal = (uint64_t *)self->_internal;
  unsigned int v5 = objc_msgSend(internal, "delegate", a3);
  objc_sync_enter(self);
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = NSStringFromSelector(sel_locationManagerShouldDisplayHeadingCalibration_);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    id v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289794;
      int v13 = 0;
      __int16 v14 = 2082;
      long long v15 = "";
      __int16 v16 = 2050;
      uint64_t v17 = self;
      __int16 v18 = 2050;
      long long v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if ([v5 locationManagerShouldDisplayHeadingCalibration:self])
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      id v8 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "CL: Invoking Compass Calibration HUD", buf, 2u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        __int16 v10 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager onClientEventHeadingCalibration:]", "CoreLocation: %s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      if (!CLClientShowHeadingCalibration(internal[1], 1))
      {
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        __int16 v9 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEBUG, "Could not show heading calibration", buf, 2u);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          __int16 v11 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager onClientEventHeadingCalibration:]", "CoreLocation: %s\n", v11);
          if (v11 != (char *)buf) {
            free(v11);
          }
        }
      }
    }
  }
  objc_sync_exit(self);
}

- (void)onClientEventPlaceInferenceResult:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "in onClientEventPlaceInferenceResult for CLPlaceInferenceSubscription", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v18 = 0;
    __int16 v16 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager onClientEventPlaceInferenceResult:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  id internal = self->_internal;
  uint64_t v7 = [a3 objectForKey:@"kCLConnectionMessagePlaceInferencePlaceInferenceKey"];
  if (v7)
  {
    uint64_t v8 = v7;
    __int16 v9 = self;
    uint64_t v10 = 0;
LABEL_8:
    [(CLLocationManager *)v9 callPlaceInferenceHandlerWithResult:v8 error:v10];
    return;
  }
  uint64_t v11 = [a3 objectForKey:@"kCLConnectionMessagePlaceInferencePlaceInferenceFallbackLocationKey"];
  if (!v11)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      uint64_t v22 = "";
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Got a place inference result without a result!?\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    long long v15 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      uint64_t v22 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got a place inference result without a result!?", "{\"msg%{public}.0s\":\"Got a place inference result without a result!?\"}", buf, 0x12u);
    }
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomainPrivate" code:5 userInfo:0];
    __int16 v9 = self;
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = v11;
  int v13 = objc_alloc_init(CLGeocoder);
  [(CLGeocoder *)v13 _setResponseSilo:internal[36]];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19070890C;
  v17[3] = &unk_1E5696FF8;
  v17[4] = v13;
  v17[5] = self;
  v17[6] = v12;
  [(CLGeocoder *)v13 reverseGeocodeLocation:v12 completionHandler:v17];
}

- (void)onClientEventPlaceInferenceError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  unsigned int v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "in onClientEventPlaceInferenceError for CLPlaceInferenceSubscription", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager onClientEventPlaceInferenceError:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v6 = [a3 objectForKey:@"kCLConnectionMessageError"];
  if (!v6)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      int v13 = "";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Got a place inference error without an error!?\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    uint64_t v8 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      int v13 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got a place inference error without an error!?", "{\"msg%{public}.0s\":\"Got a place inference error without an error!?\"}", buf, 0x12u);
    }
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomainPrivate" code:5 userInfo:0];
  }
  [(CLLocationManager *)self callPlaceInferenceHandlerWithResult:0 error:v6];
}

- (void)callPlaceInferenceHandlerWithResult:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id internal = (id *)self->_internal;
  objc_sync_enter(self);
  uint64_t v8 = internal[31];
  internal[31] = 0;
  objc_sync_exit(self);
  if (v8)
  {
    __int16 v9 = (void (*)(void *, id, id))v8[2];
    v9(v8, a3, a4);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289026;
      v11[1] = 0;
      __int16 v12 = 2082;
      int v13 = "";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Got place inference result without a handler block\"}", (uint8_t *)v11, 0x12u);
    }
  }
}

- (void)onClientEventError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  uint64_t v6 = (void *)[internal delegate];
  int v15 = 0;
  uint64_t v14 = 0;
  if (CLClientGetError(a3, &v14))
  {
    if (v14 == 1)
    {
      if (dyld_program_sdk_at_least()
        && [*((id *)internal + 4) requestingLocation])
      {
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        uint64_t v7 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v17 = 0;
          __int16 v18 = 2082;
          long long v19 = "";
          _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location access was denied; bailing early cancelling requestLocation\"}",
            buf,
            0x12u);
        }
        [internal cancelLocationRequest];
        CLClientStopLocationUpdates_0(*((void *)internal + 1));
      }
      else
      {
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        uint64_t v10 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v17 = 0;
          __int16 v18 = 2082;
          long long v19 = "";
          _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Location access was denied; but not bailing early\"}",
            buf,
            0x12u);
        }
      }
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:(int)v14 userInfo:0];
      __int16 v12 = NSStringFromSelector(sel_locationManager_didFailWithError_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v13 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        __int16 v18 = 2082;
        int v17 = 0;
        long long v19 = "";
        __int16 v20 = 2050;
        __int16 v21 = self;
        __int16 v22 = 2050;
        uint64_t v23 = v6;
        __int16 v24 = 2114;
        long long v25 = v12;
        __int16 v26 = 2114;
        uint64_t v27 = v11;
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      [v6 locationManager:self didFailWithError:v11];
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v8 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_FAULT, "could not get error", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventError:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)onClientEventRegion:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id internal = (uint64_t *)self->_internal;
  uint64_t v6 = (void *)[internal delegate];
  id v39 = 0;
  int v38 = 0;
  if (sub_1906F0B80((CFDictionaryRef)a3, &v39, &v38))
  {
    id v7 = v39;
    if (v39)
    {
      id v8 = v39;
      if (v38 == 1)
      {
        if (objc_opt_respondsToSelector())
        {
          sub_1906F3E18(internal[1], 4, 720896, 1, (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "identifier"), "UTF8String"), (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "onBehalfOfBundleId"), "UTF8String"));
          int v15 = NSStringFromSelector(sel_locationManager_didExit_completion_);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          __int16 v16 = qword_1EB2713E0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68290051;
            int v41 = 0;
            __int16 v42 = 2082;
            uint64_t v43 = "";
            __int16 v44 = 2050;
            uint64_t v45 = self;
            __int16 v46 = 2050;
            uint64_t v47 = v6;
            __int16 v48 = 2114;
            v49 = v15;
            __int16 v50 = 2113;
            id v51 = v7;
            _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
          }
          [v6 locationManager:self didExit:v7 completion:&unk_1EE002D60];
        }
        else
        {
          char v24 = objc_opt_respondsToSelector();
          uint64_t v25 = internal[1];
          __int16 v26 = (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "identifier"), "UTF8String");
          uint64_t v27 = (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "onBehalfOfBundleId"), "UTF8String");
          if (v24)
          {
            sub_1906F3E18(v25, 4, 720896, 1, v26, v27);
            uint64_t v28 = NSStringFromSelector(sel_locationManager_didExitRegion_);
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            }
            uint64_t v29 = qword_1EB2713E0;
            if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68290051;
              int v41 = 0;
              __int16 v42 = 2082;
              uint64_t v43 = "";
              __int16 v44 = 2050;
              uint64_t v45 = self;
              __int16 v46 = 2050;
              uint64_t v47 = v6;
              __int16 v48 = 2114;
              v49 = v28;
              __int16 v50 = 2113;
              id v51 = v7;
              _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
            }
            [v6 locationManager:self didExitRegion:v7];
          }
          else
          {
            sub_1906F3E18(v25, 4, 720896, 0, v26, v27);
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            }
            uint64_t v31 = qword_1EB2713E0;
            if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289282;
              int v41 = 0;
              __int16 v42 = 2082;
              uint64_t v43 = "";
              __int16 v44 = 2050;
              uint64_t v45 = self;
              _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring event, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
            }
          }
        }
        uint64_t v17 = 2;
      }
      else if (v38)
      {
        uint64_t v17 = 0;
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          sub_1906F3E18(internal[1], 4, 655360, 1, (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "identifier"), "UTF8String"), (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "onBehalfOfBundleId"), "UTF8String"));
          __int16 v9 = NSStringFromSelector(sel_locationManager_didEnter_completion_);
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          uint64_t v10 = qword_1EB2713E0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68290051;
            int v41 = 0;
            __int16 v42 = 2082;
            uint64_t v43 = "";
            __int16 v44 = 2050;
            uint64_t v45 = self;
            __int16 v46 = 2050;
            uint64_t v47 = v6;
            __int16 v48 = 2114;
            v49 = v9;
            __int16 v50 = 2113;
            id v51 = v7;
            _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
          }
          [v6 locationManager:self didEnter:v7 completion:&unk_1EE002D60];
        }
        else
        {
          char v18 = objc_opt_respondsToSelector();
          uint64_t v19 = internal[1];
          __int16 v20 = (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "identifier"), "UTF8String");
          __int16 v21 = (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "onBehalfOfBundleId"), "UTF8String");
          if (v18)
          {
            sub_1906F3E18(v19, 4, 655360, 1, v20, v21);
            __int16 v22 = NSStringFromSelector(sel_locationManager_didEnterRegion_);
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            }
            uint64_t v23 = qword_1EB2713E0;
            if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68290051;
              int v41 = 0;
              __int16 v42 = 2082;
              uint64_t v43 = "";
              __int16 v44 = 2050;
              uint64_t v45 = self;
              __int16 v46 = 2050;
              uint64_t v47 = v6;
              __int16 v48 = 2114;
              v49 = v22;
              __int16 v50 = 2113;
              id v51 = v7;
              _os_log_impl(&dword_1906B8000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
            }
            [v6 locationManager:self didEnterRegion:v7];
          }
          else
          {
            sub_1906F3E18(v19, 4, 655360, 0, v20, v21);
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
            }
            long long v30 = qword_1EB2713E0;
            if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289282;
              int v41 = 0;
              __int16 v42 = 2082;
              uint64_t v43 = "";
              __int16 v44 = 2050;
              uint64_t v45 = self;
              _os_log_impl(&dword_1906B8000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring event, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
            }
          }
        }
        uint64_t v17 = 1;
      }
      char v32 = objc_opt_respondsToSelector();
      uint64_t v33 = internal[1];
      long long v34 = (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "identifier"), "UTF8String");
      long long v35 = (unsigned char *)objc_msgSend((id)objc_msgSend(v7, "onBehalfOfBundleId"), "UTF8String");
      if (v32)
      {
        sub_1906F3E18(v33, 4, 720896, 1, v34, v35);
        long long v36 = NSStringFromSelector(sel_locationManager_didDetermineState_forRegion_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        long long v37 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68290307;
          int v41 = 0;
          __int16 v42 = 2082;
          uint64_t v43 = "";
          __int16 v44 = 2050;
          uint64_t v45 = self;
          __int16 v46 = 2050;
          uint64_t v47 = v6;
          __int16 v48 = 2114;
          v49 = v36;
          __int16 v50 = 2113;
          id v51 = v7;
          __int16 v52 = 2050;
          uint64_t v53 = v17;
          _os_log_impl(&dword_1906B8000, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"state\":%{public, location:CLRegionState}lld}", buf, 0x44u);
        }
        [v6 locationManager:self didDetermineState:v17 forRegion:v7];
      }
      else
      {
        sub_1906F3E18(v33, 4, 720896, 0, v34, v35);
      }
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v13 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v41 = 0;
        __int16 v42 = 2082;
        uint64_t v43 = "";
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Fence: onClientEventRegion, unable to fetch region\"}", buf, 0x12u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
      }
      uint64_t v14 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v41 = 0;
        __int16 v42 = 2082;
        uint64_t v43 = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Fence: onClientEventRegion, unable to fetch region", "{\"msg%{public}.0s\":\"Fence: onClientEventRegion, unable to fetch region\"}", buf, 0x12u);
      }
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v11 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegion:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (void)onClientEventRegionState:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  uint64_t v6 = (void *)[internal delegate];
  id v24 = 0;
  unsigned int v23 = 0;
  if (sub_1906F0C18((CFDictionaryRef)a3, &v24, &v23))
  {
    id v7 = v24;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v12 = internal[1];
      int v13 = (unsigned char *)objc_msgSend((id)objc_msgSend(v24, "identifier"), "UTF8String");
      sub_1906F3E18(v12, 4, 720896, 0, v13, (unsigned char *)objc_msgSend((id)objc_msgSend(v24, "onBehalfOfBundleId"), "UTF8String"));
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v14 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        uint64_t v28 = "";
        __int16 v29 = 2050;
        unint64_t v30 = (unint64_t)self;
        _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring state request, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
      goto LABEL_37;
    }
    unsigned int v8 = sub_19070A3E0();
    if (v8 < 4)
    {
      uint64_t v9 = v23;
      if (v23 != 1)
      {
        if (v23 == 2)
        {
          uint64_t v9 = 2;
        }
        else
        {
          if (qword_1EB2713E8 != -1) {
            dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
          }
          char v18 = qword_1EB2713E0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            int v26 = 0;
            __int16 v27 = 2082;
            uint64_t v28 = "";
            __int16 v29 = 2050;
            unint64_t v30 = v23;
            _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Fence: onClientEventRegionState, unknown state\", \"regionState\":%{public, location:CLClientRegionState}lld}", buf, 0x1Cu);
          }
          uint64_t v9 = 0;
        }
      }
      uint64_t v19 = internal[1];
      __int16 v20 = (unsigned char *)objc_msgSend((id)objc_msgSend(v24, "identifier"), "UTF8String");
      sub_1906F3E18(v19, 4, 720896, 1, v20, (unsigned char *)objc_msgSend((id)objc_msgSend(v24, "onBehalfOfBundleId"), "UTF8String"));
      __int16 v21 = NSStringFromSelector(sel_locationManager_didDetermineState_forRegion_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v22 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290307;
        int v26 = 0;
        __int16 v27 = 2082;
        uint64_t v28 = "";
        __int16 v29 = 2050;
        unint64_t v30 = (unint64_t)self;
        __int16 v31 = 2050;
        char v32 = v6;
        __int16 v33 = 2114;
        long long v34 = v21;
        __int16 v35 = 2113;
        id v36 = v24;
        __int16 v37 = 2050;
        uint64_t v38 = v9;
        _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"state\":%{public, location:CLRegionState}lld}", buf, 0x44u);
      }
      [v6 locationManager:self didDetermineState:v9 forRegion:v24];
LABEL_37:

      return;
    }
    unsigned int v15 = v8;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v16 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v26 = 0;
      __int16 v27 = 2082;
      uint64_t v28 = "";
      __int16 v29 = 2050;
      unint64_t v30 = v15;
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Fence: onClientEventRegionState, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    uint64_t v17 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v26 = 0;
      __int16 v27 = 2082;
      uint64_t v28 = "";
      __int16 v29 = 2050;
      unint64_t v30 = v15;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Fence: onClientEventRegionState, unknown region type", "{\"msg%{public}.0s\":\"Fence: onClientEventRegionState, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "could not get the region state", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionState:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onClientEventRegionError:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  id v18 = 0;
  int v17 = 0;
  uint64_t v16 = 0;
  if (sub_1906F0CBC((CFDictionaryRef)a3, &v18, &v16))
  {
    id v6 = v18;
    if (sub_19070A3E0() >= 4)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      id v7 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v20 = 0;
        __int16 v21 = 2082;
        __int16 v22 = "";
        __int16 v23 = 2050;
        uint64_t v24 = 4;
        _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Fence: onClientEventRegionError, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
      }
      unsigned int v8 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v20 = 0;
        __int16 v21 = 2082;
        __int16 v22 = "";
        __int16 v23 = 2050;
        uint64_t v24 = 4;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Fence: onClientEventRegionError, unknown region type", "{\"msg%{public}.0s\":\"Fence: onClientEventRegionError, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
      }
    }
    uint64_t v9 = self;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:(int)v16 userInfo:0];
      uint64_t v11 = NSStringFromSelector(sel_locationManager_monitoringDidFailForRegion_withError_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v12 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290307;
        int v20 = 0;
        __int16 v21 = 2082;
        __int16 v22 = "";
        __int16 v23 = 2050;
        uint64_t v24 = (uint64_t)self;
        __int16 v25 = 2050;
        int v26 = v5;
        __int16 v27 = 2114;
        uint64_t v28 = v11;
        __int16 v29 = 2113;
        id v30 = v18;
        __int16 v31 = 2114;
        uint64_t v32 = v10;
        _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
      }
      [v5 locationManager:self monitoringDidFailForRegion:v18 withError:v10];
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      unsigned int v15 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v20 = 0;
        __int16 v21 = 2082;
        __int16 v22 = "";
        __int16 v23 = 2050;
        uint64_t v24 = (uint64_t)self;
        _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring failure, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    int v13 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionError:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
}

- (void)onClientEventRanging:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  id v6 = (void *)[internal delegate];
  char v7 = objc_opt_respondsToSelector();
  int v8 = objc_opt_respondsToSelector();
  int v9 = v8;
  if (v7 & 1) != 0 || (v8)
  {
    __int16 v27 = 0;
    id v28 = 0;
    if (sub_1906F1304((CFDictionaryRef)a3, &v28, (CFTypeRef *)&v27))
    {
      id v22 = v28;
      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      cf = v27;
      id v24 = (id)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v27, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_19070AED8;
      v25[3] = &unk_1E5697020;
      v25[4] = v24;
      [cf enumerateObjectsUsingBlock:v25];
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"proximity" ascending:1];
      objc_msgSend(v24, "sortUsingDescriptors:", objc_msgSend(v11, "arrayWithObjects:", v12, objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"accuracy", 1), 0));
      entr_act_modify();
      uint64_t v13 = [v22 beaconIdentityConstraint];
      objc_sync_enter(self);
      LODWORD(v12) = objc_msgSend((id)objc_msgSend(internal, "rangedConstraints"), "containsObject:", v13);
      objc_sync_exit(self);
      if ((v9 & v12) == 1)
      {
        uint64_t v14 = NSStringFromSelector(sel_locationManager_didRangeBeacons_satisfyingConstraint_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        unsigned int v15 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 68290051;
          int v30 = 0;
          __int16 v31 = 2082;
          uint64_t v32 = "";
          __int16 v33 = 2050;
          long long v34 = self;
          __int16 v35 = 2050;
          id v36 = v6;
          __int16 v37 = 2114;
          uint64_t v38 = v14;
          __int16 v39 = 2113;
          uint64_t v40 = v13;
          _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"constraint\":%{private, location:escape_only}@}", buf, 0x3Au);
        }
        [v6 locationManager:self didRangeBeacons:v24 satisfyingConstraint:v13];
      }
      else if (v7)
      {
        id v18 = NSStringFromSelector(sel_locationManager_didRangeBeacons_inRegion_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        uint64_t v19 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 68290051;
          int v30 = 0;
          __int16 v31 = 2082;
          uint64_t v32 = "";
          __int16 v33 = 2050;
          long long v34 = self;
          __int16 v35 = 2050;
          id v36 = v6;
          __int16 v37 = 2114;
          uint64_t v38 = v18;
          __int16 v39 = 2113;
          uint64_t v40 = (uint64_t)v22;
          _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
        }
        [v6 locationManager:self didRangeBeacons:v24 inRegion:v22];
      }
      id v20 = v28;
      id v21 = v24;
      CFRelease(cf);
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v16 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_FAULT, "could not get ranged beacons", buf, 2u);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        __int16 v26 = 0;
        int v17 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRanging:]", "CoreLocation: %s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
    }
  }
  else
  {
    entr_act_modify();
  }
}

- (void)onClientEventRangingError:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  char v6 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  char v8 = v7;
  if (v6 & 1) != 0 || (v7)
  {
    id v24 = 0;
    int v23 = 0;
    uint64_t v22 = 0;
    if (sub_1906F13F0((CFDictionaryRef)a3, &v24, &v22))
    {
      id v9 = v24;
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:(int)v22 userInfo:0];
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        int v26 = 0;
        __int16 v27 = 2082;
        id v28 = "";
        __int16 v29 = 2050;
        int v30 = self;
        __int16 v31 = 2050;
        uint64_t v32 = v5;
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering range error to client's delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\"}", buf, 0x26u);
      }
      id v12 = v24;
      id v13 = v24;
      if (v8)
      {
        uint64_t v14 = [v12 beaconIdentityConstraint];
        unsigned int v15 = NSStringFromSelector(sel_locationManager_didFailRangingBeaconsForConstraint_error_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        uint64_t v16 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68290307;
          int v26 = 0;
          __int16 v27 = 2082;
          id v28 = "";
          __int16 v29 = 2050;
          int v30 = self;
          __int16 v31 = 2050;
          uint64_t v32 = v5;
          __int16 v33 = 2114;
          long long v34 = v15;
          __int16 v35 = 2113;
          uint64_t v36 = v14;
          __int16 v37 = 2114;
          uint64_t v38 = v10;
          _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"constraint\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
        }
        [v5 locationManager:self didFailRangingBeaconsForConstraint:v14 error:v10];
      }
      else
      {
        uint64_t v19 = NSStringFromSelector(sel_locationManager_rangingBeaconsDidFailForRegion_withError_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        id v20 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68290307;
          int v26 = 0;
          __int16 v27 = 2082;
          id v28 = "";
          __int16 v29 = 2050;
          int v30 = self;
          __int16 v31 = 2050;
          uint64_t v32 = v5;
          __int16 v33 = 2114;
          long long v34 = v19;
          __int16 v35 = 2113;
          uint64_t v36 = (uint64_t)v12;
          __int16 v37 = 2114;
          uint64_t v38 = v10;
          _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
        }
        [v5 locationManager:self rangingBeaconsDidFailForRegion:v12 withError:v10];
      }
      id v21 = v24;
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v17 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_FAULT, "could not get ranging error", buf, 2u);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        id v18 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRangingError:]", "CoreLocation: %s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
    }
  }
}

- (void)onClientEventRegionResponseDelayed:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  id v16 = 0;
  id v17 = 0;
  char v15 = 0;
  if (sub_1906F0D64((CFDictionaryRef)a3, &v17, &v15, &v16))
  {
    id v6 = v17;
    id v7 = v16;
    char v8 = self;
    if (objc_opt_respondsToSelector())
    {
      if (v15) {
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v16 forKey:@"kCLErrorUserInfoAlternateRegionKey"];
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:7 userInfo:v9];
      id v13 = NSStringFromSelector(sel_locationManager_monitoringDidFailForRegion_withError_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v14 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290307;
        int v19 = 0;
        __int16 v20 = 2082;
        id v21 = "";
        __int16 v22 = 2050;
        int v23 = self;
        __int16 v24 = 2050;
        __int16 v25 = v5;
        __int16 v26 = 2114;
        __int16 v27 = v13;
        __int16 v28 = 2113;
        id v29 = v17;
        __int16 v30 = 2114;
        uint64_t v31 = v12;
        _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
      }
      [v5 locationManager:self monitoringDidFailForRegion:v17 withError:v12];
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionResponseDelayed:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onClientEventNoLocationWatchdog:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  double v12 = 0.0;
  if (sub_1906F0E5C((CFDictionaryRef)a3, &v12))
  {
    double v6 = v12;
    if (objc_opt_respondsToSelector())
    {
      id v7 = NSStringFromSelector(sel_locationManager_didNotReceiveLocationUpdatesForRegionMonitoringInInterval_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      char v8 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        int v14 = 0;
        __int16 v15 = 2082;
        id v16 = "";
        __int16 v17 = 2050;
        id v18 = self;
        __int16 v19 = 2050;
        __int16 v20 = v5;
        __int16 v21 = 2114;
        __int16 v22 = v7;
        __int16 v23 = 2050;
        double v24 = v6;
        _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"duration_s\":\"%{public}.09f\"}", buf, 0x3Au);
      }
      [v5 locationManager:self didNotReceiveLocationUpdatesForRegionMonitoringInInterval:v6];
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v14 = 0;
        __int16 v15 = 2082;
        id v16 = "";
        __int16 v17 = 2050;
        id v18 = self;
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring watchdog, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v9 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "could not get updated paused state", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventNoLocationWatchdog:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (void)onClientEventRegionSetupCompleted:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  id v14 = 0;
  if (CLClientPopulateRegionFromInfo(&v14, (const __CFDictionary *)a3))
  {
    id v6 = v14;
    id v7 = v14;
    if (sub_19070A3E0() >= 4)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      double v12 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2050;
        uint64_t v20 = 4;
        _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Client region type is not supported.\n\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
      }
      id v13 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2050;
        uint64_t v20 = 4;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Client region type is not supported.\n", "{\"msg%{public}.0s\":\"Client region type is not supported.\n\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
      }
    }
    else if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v8 = NSStringFromSelector(sel_locationManager_didStartMonitoringForRegion_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290051;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2050;
        uint64_t v20 = (uint64_t)self;
        __int16 v21 = 2050;
        __int16 v22 = v5;
        __int16 v23 = 2114;
        double v24 = v8;
        __int16 v25 = 2113;
        id v26 = v6;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
      }
      [v5 locationManager:self didStartMonitoringForRegion:v6];
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionSetupCompleted:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)pauseLocationUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id internal = (id *)self->_internal;
  id v6 = (void *)[internal delegate];
  objc_sync_enter(self);
  if ([internal[4] updatingLocation])
  {
    if ([internal[4] pausesLocationUpdatesAutomatically] > 4 || v3)
    {
      [internal stopUpdatingLocationAutoPaused];
      if (objc_opt_respondsToSelector())
      {
        entr_act_modify();
        char v8 = NSStringFromSelector(sel_locationManagerDidPauseLocationUpdates_);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
        uint64_t v9 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          v10[0] = 68289794;
          v10[1] = 0;
          __int16 v11 = 2082;
          double v12 = "";
          __int16 v13 = 2050;
          id v14 = self;
          __int16 v15 = 2050;
          int v16 = v6;
          __int16 v17 = 2114;
          id v18 = v8;
          _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x30u);
        }
        [v6 locationManagerDidPauseLocationUpdates:self];
      }
      else
      {
        entr_act_modify();
      }
    }
  }
  objc_sync_exit(self);
}

- (void)onWillEnterForeground:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    __int16 v20 = 2113;
    id v21 = a3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"notification\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  os_activity_scope_leave(&v9);
}

- (void)onDidEnterBackground:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  id v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290051;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = self;
    __int16 v20 = 2113;
    id v21 = a3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"notification\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  os_activity_scope_leave(&v9);
}

- (void)onClientEventAutopauseStatus:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  __int16 v7 = 0;
  if (sub_1906F1E50((CFDictionaryRef)a3, (unsigned char *)&v7 + 1, &v7))
  {
    if (HIBYTE(v7)) {
      [(CLLocationManager *)self pauseLocationUpdates:(_BYTE)v7 != 0];
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    unsigned int v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "could not get updated paused state", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventAutopauseStatus:]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  objc_sync_exit(self);
}

- (void)onClientEventBatch:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  id v6 = (void *)[internal delegate];
  int v18 = 0;
  uint64_t v17 = 0;
  BOOL v16 = 0;
  if (sub_1906F2538(*((void *)internal + 1), (const __CFDictionary *)a3, &v16, &v17))
  {
    if (v16) {
      __int16 v7 = 0;
    }
    else {
      __int16 v7 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:(int)v17 userInfo:0];
    }
    if (objc_opt_respondsToSelector())
    {
      entr_act_modify();
      uint64_t v10 = NSStringFromSelector(sel_locationManager_didFinishDeferredUpdatesWithError_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      int v11 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        *(_WORD *)&v22[4] = 2082;
        *(_DWORD *)uint64_t v22 = 0;
        *(void *)&v22[6] = "";
        __int16 v23 = 2050;
        double v24 = self;
        __int16 v25 = 2050;
        id v26 = v6;
        __int16 v27 = 2114;
        __int16 v28 = v10;
        __int16 v29 = 2114;
        __int16 v30 = v7;
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      [v6 locationManager:self didFinishDeferredUpdatesWithError:v7];
    }
    else
    {
      entr_act_modify();
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      }
      else {
        __int16 v13 = "success";
      }
      *(_DWORD *)uint64_t buf = 136315138;
      *(void *)uint64_t v22 = v13;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "Finished deferred updates: %s", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      if (v7) {
        __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      }
      else {
        __int16 v14 = "success";
      }
      int v19 = 136315138;
      __int16 v20 = v14;
      __int16 v15 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager onClientEventBatch:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    [*((id *)internal + 4) setBatchingLocation:0];
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    char v8 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_FAULT, "could not get batch result", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      LOWORD(v19) = 0;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventBatch:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)onClientEventInterrupted:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  unsigned int v5 = objc_msgSend(internal, "delegate", a3);
  objc_sync_enter(self);
  if ([*((id *)internal + 4) batchingLocation])
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:11 userInfo:0];
    if (objc_opt_respondsToSelector())
    {
      entr_act_modify();
      __int16 v7 = NSStringFromSelector(sel_locationManager_didFinishDeferredUpdatesWithError_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      char v8 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        __int16 v20 = 2082;
        int v19 = 0;
        id v21 = "";
        __int16 v22 = 2050;
        __int16 v23 = self;
        __int16 v24 = 2050;
        __int16 v25 = v5;
        __int16 v26 = 2114;
        __int16 v27 = v7;
        __int16 v28 = 2114;
        uint64_t v29 = v6;
        _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      [v5 locationManager:self didFinishDeferredUpdatesWithError:v6];
    }
    else
    {
      entr_act_modify();
    }
    [*((id *)internal + 4) setBatchingLocation:0];
  }
  if (*((void *)internal + 31)) {
    sub_1906EDE08(*((void *)internal + 1), *((_DWORD *)internal + 64));
  }
  [internal setClientKeyForIdentityValidation:0];
  uint64_t v9 = (void *)[*((id *)internal + 35) copy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [(id)(*(uint64_t (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * i) + 16))() updateIdentityToken:0 withStorageToken:0];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_sync_exit(self);
}

- (void)onClientEventVehicleSpeed:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  long long v12 = 0u;
  long long v13 = 0u;
  if (sub_1906F275C((CFDictionaryRef)a3, (UInt8 *)&v12))
  {
    objc_sync_enter(self);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [CLVehicleSpeed alloc];
      __int16 v7 = -[CLVehicleSpeed initWithClientVehicleSpeed:](v6, "initWithClientVehicleSpeed:", v12, v13);
      char v8 = NSStringFromSelector(sel_locationManager_didUpdateVehicleSpeed_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        __int16 v16 = 2082;
        int v15 = 0;
        uint64_t v17 = "";
        __int16 v18 = 2050;
        int v19 = self;
        __int16 v20 = 2050;
        id v21 = v5;
        __int16 v22 = 2114;
        __int16 v23 = v8;
        __int16 v24 = 2114;
        __int16 v25 = v7;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"vehicleSpeed\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      [v5 locationManager:self didUpdateVehicleSpeed:v7];
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "could not get updated vehicle speed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventVehicleSpeed:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onClientEventVehicleHeading:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  double v12 = 0.0;
  double v13 = 0.0;
  if (sub_1906F2808((CFDictionaryRef)a3, (UInt8 *)&v12))
  {
    objc_sync_enter(self);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [CLVehicleHeading alloc];
      __int16 v7 = -[CLVehicleHeading initWithClientVehicleHeading:](v6, "initWithClientVehicleHeading:", v12, v13);
      char v8 = NSStringFromSelector(sel_locationManager_didUpdateVehicleHeading_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        __int16 v16 = 2082;
        int v15 = 0;
        uint64_t v17 = "";
        __int16 v18 = 2050;
        int v19 = self;
        __int16 v20 = 2050;
        id v21 = v5;
        __int16 v22 = 2114;
        __int16 v23 = v8;
        __int16 v24 = 2114;
        __int16 v25 = v7;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"vehicleHeading\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      [v5 locationManager:self didUpdateVehicleHeading:v7];
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "could not get updated vehicle heading", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationManager onClientEventVehicleHeading:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onClientEventSignificantLocationVisit:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id internal = (uint64_t *)self->_internal;
  uint64_t v6 = (void *)[internal delegate];
  objc_sync_enter(self);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [a3 objectForKey:@"kCLConnectionMessageSignificantLocationVisitKey"];
    int v15 = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:&v15];
    if (v15)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      uint64_t v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v17 = 0;
        __int16 v18 = 2082;
        int v19 = "";
        __int16 v20 = 2114;
        id v21 = v15;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Unarchiver error in -[CLLocationManager onClientEventSignificantLocationVisit:]\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
        }
      }
      uint64_t v10 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v17 = 0;
        __int16 v18 = 2082;
        int v19 = "";
        __int16 v20 = 2114;
        id v21 = v15;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unarchiver error in -[CLLocationManager onClientEventSignificantLocationVisit:]", "{\"msg%{public}.0s\":\"Unarchiver error in -[CLLocationManager onClientEventSignificantLocationVisit:]\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v11 = (void *)v8;
      double v12 = [[CLVisit alloc] initWithCoder:v8];
      sub_1906F3E18(internal[1], 6, 917504, 1, 0, 0);
      double v13 = NSStringFromSelector(sel_locationManager_didVisit_);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      long long v14 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290051;
        int v17 = 0;
        __int16 v18 = 2082;
        int v19 = "";
        __int16 v20 = 2050;
        id v21 = self;
        __int16 v22 = 2050;
        __int16 v23 = v6;
        __int16 v24 = 2114;
        __int16 v25 = v13;
        __int16 v26 = 2113;
        __int16 v27 = v12;
        _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"visit\":%{private, location:escape_only}@}", buf, 0x3Au);
      }
      [v6 locationManager:self didVisit:v12];
      [v11 finishDecoding];
    }
  }
  else
  {
    sub_1906F3E18(internal[1], 6, 917504, 0, 0, 0);
  }
  objc_sync_exit(self);
}

- (void)onClientEventSignificantLocationVisitStateRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[self->_internal delegate];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v6 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    long long v14 = "";
    __int16 v15 = 2050;
    __int16 v16 = self;
    __int16 v17 = 2050;
    __int16 v18 = v5;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Processing Significant Location Visit State Request Event\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\"}", (uint8_t *)&v11, 0x26u);
  }
  objc_sync_enter(self);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = (CLVisit *)[a3 objectForKey:@"kCLConnectionMessageSignificantLocationVisitStateKey"];
    if (v7)
    {
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:0];
      uint64_t v7 = [[CLVisit alloc] initWithCoder:v8];
      [v8 finishDecoding];
    }
    uint64_t v9 = NSStringFromSelector(sel_locationManager_didReportVisit_);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v15 = 2050;
      __int16 v16 = self;
      __int16 v17 = 2050;
      __int16 v18 = v5;
      __int16 v19 = 2114;
      __int16 v20 = v9;
      __int16 v21 = 2113;
      __int16 v22 = v7;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x3Au);
    }
    [v5 locationManager:self didReportVisit:v7];
  }
  objc_sync_exit(self);
}

+ (int)authorizationStatusForBundlePath:(id)a3
{
  return MEMORY[0x1F4181798](a1, sel__authorizationStatusForBundleIdentifier_bundlePath_);
}

+ (int)authorizationStatusForBundle:(id)a3
{
  uint64_t v4 = [a3 bundlePath];

  return [a1 authorizationStatusForBundlePath:v4];
}

+ (int)_authorizationStatus
{
  return MEMORY[0x1F4181798](a1, sel__authorizationStatusForBundleIdentifier_bundlePath_);
}

+ (CLAuthorizationStatus)authorizationStatus
{
  [a1 collectMetricForFunction:0x80000];

  return [a1 _authorizationStatus];
}

- (BOOL)isAuthorizedForPreciseLocation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  BOOL v3 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"isAuthorizedForPreciseLocation is deprecated and will be removed in the next seed. use accuracyAuthorization\"}", (uint8_t *)&v6, 0x12u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
  }
  uint64_t v4 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "isAuthorizedForPreciseLocation is deprecated and will be removed in the next seed. use accuracyAuthorization", "{\"msg%{public}.0s\":\"isAuthorizedForPreciseLocation is deprecated and will be removed in the next seed. use accuracyAuthorization\"}", (uint8_t *)&v6, 0x12u);
  }
  return [(CLLocationManager *)self accuracyAuthorization] == CLAccuracyAuthorizationFullAccuracy;
}

- (BOOL)isAuthorizedForWidgetUpdates
{
  objc_sync_enter(self);
  id internal = (id *)self->_internal;
  if ([internal[4] previousAuthorizationStatusValid])
  {
    char v4 = [internal[4] isAuthorizedForWidgetUpdates];
  }
  else
  {
    [(CLLocationManager *)self collectMetricForFunction:0x200000];
    int v7 = 0;
    sub_1907FF998(*((void *)internal[1] + 45), *((void *)internal[1] + 46), (uint64_t)&v7);
    CLAuthorizationStatus v5 = [(CLLocationManager *)self authorizationStatus];
    char v4 = v5 == kCLAuthorizationStatusAuthorizedAlways || v5 == kCLAuthorizationStatusAuthorizedWhenInUse && v7 == 3;
  }
  objc_sync_exit(self);
  return v4;
}

+ (void)setAuthorizationStatus:(BOOL)a3 forBundleIdentifier:(id)a4
{
}

+ (void)setAuthorizationStatus:(BOOL)a3 forBundlePath:(id)a4
{
}

+ (void)setAuthorizationStatus:(BOOL)a3 forBundle:(id)a4
{
  [a4 bundlePath];

  MEMORY[0x1F4181798](a1, sel_setAuthorizationStatus_forBundlePath_);
}

+ (void)setAuthorizationStatusByType:(int)a3 forBundleIdentifier:(id)a4
{
}

+ (void)setAuthorizationStatusByType:(int)a3 forBundlePath:(id)a4
{
}

+ (void)setAuthorizationStatusByType:(int)a3 forBundle:(id)a4
{
  [a4 bundlePath];

  MEMORY[0x1F4181798](a1, sel_setAuthorizationStatusByType_forBundlePath_);
}

+ (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 forBundleIdentifier:(id)a5
{
}

+ (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
}

+ (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 forBundle:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v7 = [a5 bundlePath];

  sub_190802130(0, v7, 0, 0, v6, v5);
}

+ (void)setIncidentalUseMode:(int)a3 forBundle:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = [a4 bundlePath];

  sub_190802390(0, v5, v4);
}

+ (void)setIncidentalUseMode:(int)a3 forBundleIdentifier:(id)a4
{
}

+ (void)getIncidentalUseMode:(int *)a3 forBundle:(id)a4
{
  uint64_t v5 = [a4 bundlePath];

  sub_1907FF998(0, v5, (uint64_t)a3);
}

+ (void)getIncidentalUseMode:(int *)a3 forBundleIdentifier:(id)a4
{
}

+ (void)setLocationButtonUseMode:(int)a3 forBundle:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = [a4 bundlePath];

  sub_190801FC0(0, v5, v4);
}

+ (void)setLocationButtonUseMode:(int)a3 forBundleIdentifier:(id)a4
{
}

+ (void)registerCircularInterestZoneWithId:(id)a3 latitue:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleIdentifier:(id)a9 error:(id *)a10
{
}

+ (void)registerCircularInterestZoneWithId:(id)a3 latitue:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundle:(id)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v17 = [a9 bundlePath];

  sub_1907FFB08(0, v17, (uint64_t)a3, v12, v11, (uint64_t)a10, a4, a5, a6);
}

+ (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleIdentifier:(id)a7 error:(id *)a8
{
}

+ (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundle:(id)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v13 = [a7 bundlePath];

  sub_1907FFB9C(0, v13, (uint64_t)a3, v11, v10, v9, (uint64_t)a8);
}

+ (void)setAuthorizationStatus:(int)a3 withCorrectiveCompensation:(int)a4 forInterestZoneWithId:(id)a5 registeredForBundleIdentifier:(id)a6
{
}

+ (void)setAuthorizationStatus:(int)a3 withCorrectiveCompensation:(int)a4 forInterestZoneWithId:(id)a5 registeredForBundle:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v9 = [a6 bundlePath];

  sub_190802130(0, v9, (uint64_t)a5, 0, v8, v7);
}

+ (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleIdentifier:(id)a5 error:(id *)a6
{
}

+ (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundle:(id)a5 error:(id *)a6
{
  BOOL v8 = a3;
  uint64_t v9 = [a5 bundlePath];

  sub_1907FFC20(0, v9, (uint64_t)a4, v8, (uint64_t)a6);
}

+ (void)deleteInterestZoneWithId:(id)a3 registeredForBundleIdentifier:(id)a4 error:(id *)a5
{
}

+ (void)deleteInterestZoneWithId:(id)a3 registeredForBundle:(id)a4 error:(id *)a5
{
  uint64_t v7 = [a4 bundlePath];

  sub_1907FFC88(0, v7, (uint64_t)a3, (uint64_t)a5);
}

+ (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleIdentifier:(id)a4
{
  memset(v4, 0, sizeof(v4));
  sub_190801B48((uint64_t)a4, 0, v4, a3, 0, 0);
}

+ (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundle:(id)a4
{
  sub_190801B48(0, objc_msgSend(a4, "bundlePath", 0, 0, 0, 0), &v4, a3, 0, 0);
}

+ (void)grantTemporaryAuthorizationUsingLocationButtonToClientWithAuditToken:(id *)a3 voiceInteractionEnabled:(BOOL)a4
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  sub_190801B48(0, 0, v5, 1, 1, a4);
}

+ (void)setTemporaryFullAccuracyAuthorizationGranted:(BOOL)a3 forBundleIdentifier:(id)a4
{
}

+ (void)setTemporaryFullAccuracyAuthorizationGranted:(BOOL)a3 forBundlePath:(id)a4
{
}

+ (void)tearDownLocationAuthorizationPromptForBundleId:(id)a3
{
}

+ (void)tearDownLocationAuthorizationPromptForBundlePath:(id)a3
{
}

+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleIdentifier:(id)a4
{
}

+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundle:(id)a4
{
  [a4 bundlePath];

  sub_190802500();
}

+ (void)setDefaultEffectiveBundleIdentifier:(id)a3
{
}

+ (void)setDefaultEffectiveBundle:(id)a3
{
  CFStringRef v3 = (const __CFString *)[a3 bundlePath];

  sub_1906EB750(v3);
}

- (void)requestWhenInUseAuthorization
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x400000];
  id internal = (void **)self->_internal;
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  BOOL v8 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting when in use authorization\"}", buf, 0x12u);
  }
  CLClientRequestAuthorization(internal[1], 4);
  os_activity_scope_leave(&v9);
}

- (void)requestWhenInUseAuthorizationWithPrompt
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2082;
    uint64_t v13 = "activity";
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2050;
    uint64_t v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLClientSetShowLocationPrompt(*((void *)self->_internal + 1), 1);
  [(CLLocationManager *)self requestWhenInUseAuthorization];
  os_activity_scope_leave(&v7);
}

- (void)requestWhenInUseAuthorizationWithPurposeKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 3982, @"Invalid parameter not satisfying: %@", @"purposeKey");
  }
  sub_1906EC74C(*((void **)self->_internal + 1), (uint64_t)a3, 4);
  os_activity_scope_leave(&state);
}

- (void)requestAlwaysAuthorization
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    Name = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    __int16 v21 = 2082;
    __int16 v22 = Name;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"SEL\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x800000];
  id internal = (void **)self->_internal;
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  int v9 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting always authorization\"}", buf, 0x12u);
  }
  CLClientRequestAuthorization(internal[1], 3);
  os_activity_scope_leave(&v10);
}

- (void)changeFencesStateMatchingHandoffTags:(id)a3 forDeviceID:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v10 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v10, &v13);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v11 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    __int16 v21 = v12;
    __int16 v22 = 2050;
    uint64_t v23 = self;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  sub_1906EBFC8(*((void *)self->_internal + 1), (uint64_t)a3, [a4 UUIDString], (uint64_t)a5);
  os_activity_scope_leave(&v13);
}

- (void)_requestTemporaryFullAccuracyWithUsageDescription:(id)a3
{
}

- (void)_requestTemporaryFullAccuracyWithUsageDescription:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v8, &v13);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    os_activity_scope_state_s v10 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    __int16 v19 = "activity";
    __int16 v20 = 2114;
    __int16 v21 = v10;
    __int16 v22 = 2050;
    uint64_t v23 = self;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  int v12 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting temporary accuracy increase\"}", buf, 0x12u);
  }
  CLClientRequestTemporaryPrecise(internal[1], (uint64_t)a3, 0, (uint64_t)a4);
  os_activity_scope_leave(&v13);
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  uint64_t v5 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    os_activity_scope_state_s v10 = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v7, 0x12u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
  }
  uint64_t v6 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    os_activity_scope_state_s v10 = "";
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey", "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v7, 0x12u);
  }
  [(CLLocationManager *)self requestTemporaryFullAccuracyAuthorizationWithPurposeKey:a3];
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
  }
  int v7 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
  {
    int v9 = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v9, 0x12u);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE002DC0);
    }
  }
  int v8 = qword_1EB2713D0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
  {
    int v9 = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey", "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v9, 0x12u);
  }
  [(CLLocationManager *)self requestTemporaryFullAccuracyAuthorizationWithPurposeKey:a3 completion:a4];
}

- (void)requestTemporaryFullAccuracyAuthorizationWithPurposeKey:(NSString *)purposeKey
{
  [(CLLocationManager *)self collectMetricForFunction:0x1000000];

  [(CLLocationManager *)self requestTemporaryFullAccuracyAuthorizationWithPurposeKey:purposeKey completion:0];
}

- (void)requestTemporaryFullAccuracyAuthorizationWithPurposeKey:(NSString *)purposeKey completion:(void *)completion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v10;
    __int16 v20 = 2050;
    __int16 v21 = self;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationManager *)self collectMetricForFunction:0x1000000];
  CLClientRequestTemporaryPrecise(*((void *)self->_internal + 1), 0, (uint64_t)purposeKey, (uint64_t)completion);
  os_activity_scope_leave(&v11);
}

- (BOOL)isLocationServicesPreferencesDialogEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    int v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) allowsLocationPrompts];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setLocationServicesPreferencesDialogEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    __int16 v21 = 1026;
    BOOL v22 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"enabled\":%{public}hhd}", buf, 0x36u);
  }
  id internal = self->_internal;
  sub_1906F1878(*((void *)internal + 1), v3);
  [*((id *)internal + 4) setAllowsLocationPrompts:v3];
  os_activity_scope_leave(&v10);
}

- (BOOL)isDynamicAccuracyReductionEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) dynamicAccuracyReductionEnabled];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setDynamicAccuracyReductionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    __int16 v21 = 1026;
    BOOL v22 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"enabled\":%{public}hhd}", buf, 0x36u);
  }
  id internal = (id *)self->_internal;
  objc_sync_enter(self);
  [internal[4] setDynamicAccuracyReductionEnabled:v3];
  if ([internal[4] updatingLocation]) {
    [(CLLocationManager *)self startUpdatingLocation];
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (BOOL)allowsAlteredAccessoryLocations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) allowsAlteredAccessoryLocations];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setAllowsAlteredAccessoryLocations:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    __int16 v21 = 1026;
    BOOL v22 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"enabled\":%{public}hhd}", buf, 0x36u);
  }
  id internal = (id *)self->_internal;
  objc_sync_enter(self);
  [internal[4] setAllowsAlteredAccessoryLocations:v3];
  if ([internal[4] updatingLocation]) {
    [(CLLocationManager *)self startUpdatingLocation];
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)registerAsLocationClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2082;
    __int16 v13 = "activity";
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2050;
    __int16 v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  sub_1906F26C4(*((void *)self->_internal + 1));
  os_activity_scope_leave(&v7);
}

+ (BOOL)dumpLogsWithMessage:(id)a3
{
  return sub_1907FFE8C() != 0;
}

+ (void)dumpDiagnosticFilesWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v3 = a3;
    if (qword_1EB2713E8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2082;
      uint64_t v18 = "assert";
      __int16 v19 = 2081;
      uint64_t v20 = "handler";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"must pass handler to dumpDiagnosticFilesWithHandler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    int v8 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2082;
      uint64_t v18 = "assert";
      __int16 v19 = 2081;
      uint64_t v20 = "handler";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "must pass handler to dumpDiagnosticFilesWithHandler", "{\"msg%{public}.0s\":\"must pass handler to dumpDiagnosticFilesWithHandler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
    }
    BOOL v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2082;
      uint64_t v18 = "assert";
      __int16 v19 = 2081;
      uint64_t v20 = "handler";
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"must pass handler to dumpDiagnosticFilesWithHandler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
LABEL_3:
  long long v4 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "dumpDiagnosticFiles called, trying to make an xpc call", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v12 = 0;
    int v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLLocationManager dumpDiagnosticFilesWithHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.diagnostic" options:4096];
  objc_msgSend(v5, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EE040F78));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _DWORD v11[2] = sub_19071048C;
  v11[3] = &unk_1E5697048;
  v11[4] = v5;
  uint64_t v6 = (void *)[v5 remoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_190710644;
  v10[3] = &unk_1E5697070;
  v10[4] = v5;
  v10[5] = v3;
  [v6 copyRegisteredFilesWithHandler:v10];
}

+ (BOOL)shutdownDaemon
{
  return sub_1907FFE2C() != 0;
}

+ (BOOL)bundleSupported:(id)a3
{
  if (a3) {
    [a3 bundlePath];
  }
  return a3 != 0;
}

+ (BOOL)advertiseAsBeacon:(id)a3 withPower:(id)a4
{
  return CLStartStopAdvertisingBeacon((uint64_t)a3, (uint64_t)a4);
}

- (void)setIsActuallyAWatchKitExtension:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68290050;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2050;
    __int16 v19 = self;
    __int16 v20 = 1026;
    BOOL v21 = v3;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"isActuallyAWatchKitExtension\":%{public}hhd}", buf, 0x36u);
  }
  sub_1906EDB54(*((void *)self->_internal + 1), v3);
  os_activity_scope_leave(&v9);
}

+ (id)_getClientTransientAuthorizationInfoForBundleId:(id)a3 error:(id *)a4
{
  return (id)CLGetClientTransientAuthorizationInfo((uint64_t)a3, 0, (uint64_t)a4);
}

+ (id)_getClientTransientAuthorizationInfoForBundlePath:(id)a3 error:(id *)a4
{
  return (id)CLGetClientTransientAuthorizationInfo(0, (uint64_t)a3, (uint64_t)a4);
}

+ (id)_setClientTransientAuthorizationInfoForBundleId:(id)a3 data:(id)a4
{
  return (id)CLSetClientTransientAuthorizationInfo((uint64_t)a3, 0, (uint64_t)a4);
}

+ (id)_setClientTransientAuthorizationInfoForBundlePath:(id)a3 data:(id)a4
{
  return (id)CLSetClientTransientAuthorizationInfo(0, (uint64_t)a3, (uint64_t)a4);
}

- (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  return (id)MEMORY[0x1F4181798](self, sel__historicalUpdaterWithCenter_radius_dateInterval_sampleCount_queue_handler_);
}

- (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel__historicalUpdaterWithDateInterval_sampleCount_queue_handler_);
}

- (id)liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel__liveUpdaterWithConfiguration_queue_handler_);
}

- (id)liveUpdaterWithQueue:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel__liveUpdaterWithConfiguration_queue_handler_);
}

- (id)_liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel_liveUpdaterWithConfiguration_locationManager_queue_handler_);
}

- (id)_liveUpdaterWithQueue:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel__liveUpdaterWithConfiguration_queue_handler_);
}

- (id)_historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel_historicalUpdaterWithDateInterval_sampleCount_locationManager_queue_handler_);
}

- (id)_historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel_historicalUpdaterWithCenter_radius_dateInterval_sampleCount_locationManager_queue_handler_);
}

- (id)backgroundActivitySession
{
  [*((id *)self->_internal + 36) queue];

  return (id)MEMORY[0x1F4181798](CLBackgroundActivitySession, sel_sessionWithLocationManager_queue_handler_);
}

- (id)serviceSession
{
  [*((id *)self->_internal + 36) queue];

  return (id)MEMORY[0x1F4181798](CLServiceSession, sel_sessionWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_);
}

- (id)privilegedServiceSession
{
  [*((id *)self->_internal + 36) queue];

  return (id)MEMORY[0x1F4181798](CLServiceSession, sel_sessionWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_);
}

- (BOOL)isMasquerading
{
  return *(unsigned char *)(*((void *)self->_internal + 1) + 17) != 0;
}

- (void)requestMonitorWithConfiguration:(id)a3 completion:(id)a4
{
}

+ (void)collectMetricForFunction:(unint64_t)a3
{
}

- (void)startUpdatingVehicleSpeed
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  [*((id *)internal + 4) setUpdatingVehicleSpeed:1];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Start updating vehicle speed", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) startUpdatingVehicleSpeed]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  CLClientStartVehicleSpeedUpdates(*((void *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopUpdatingVehicleSpeed
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  [*((id *)internal + 4) setUpdatingVehicleSpeed:0];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Stop updating vehicle speed", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) stopUpdatingVehicleSpeed]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  CLClientStopVehicleSpeedUpdates(*((void *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)startUpdatingVehicleHeading
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  [*((id *)internal + 4) setUpdatingVehicleHeading:1];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Start updating vehicle heading", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) startUpdatingVehicleHeading]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  CLClientStartVehicleHeadingUpdates(*((void *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopUpdatingVehicleHeading
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    __int16 v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  [*((id *)internal + 4) setUpdatingVehicleHeading:0];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  int v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Stop updating vehicle heading", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) stopUpdatingVehicleHeading]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  CLClientStopVehicleHeadingUpdates(*((void *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (BOOL)isMatchInfoEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) matchInfoEnabled];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  CLClientSetMatchInfoEnabled(*((void *)internal + 1), v3);
  [*((id *)internal + 4) setMatchInfoEnabled:v3];
  os_activity_scope_leave(&v10);
}

- (BOOL)_isGroundAltitudeEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) groundAltitudeEnabled];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)_setGroundAltitudeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  sub_1906F1650(*((void *)internal + 1), v3);
  [*((id *)internal + 4) setGroundAltitudeEnabled:v3];
  os_activity_scope_leave(&v10);
}

- (id)_groundAltitudeAtLocation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&unsigned char buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v8;
    __int16 v13 = 2050;
    __int16 v14 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (a3)
  {
    if ([(CLLocationManager *)self _isGroundAltitudeEnabled]
      && (memset(buf, 0, 32), CLClientGetGroundAltitudeAtLocation())
      && *(double *)&buf[8] > 0.0)
    {
      os_activity_scope_state_s v10 = [_CLLocationGroundAltitude alloc];
      a3 = [(_CLLocationGroundAltitude *)v10 initWithEstimate:*(unsigned int *)&buf[24] uncertainty:*(double *)buf undulation:*(double *)&buf[8] undulationModel:*(double *)&buf[16]];
    }
    else
    {
      a3 = 0;
    }
  }
  os_activity_scope_leave(&v11);
  return a3;
}

- (BOOL)_isFusionInfoEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    uint64_t v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) fusionInfoEnabled];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)_setFusionInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  sub_1906F1708(*((void *)internal + 1), v3);
  [*((id *)internal + 4) setFusionInfoEnabled:v3];
  os_activity_scope_leave(&v10);
}

- (BOOL)isTrackRunInfoEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  char v7 = [*((id *)self->_internal + 4) trackRunInfoEnabled];
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setTrackRunInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  char v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v8;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  sub_1906F17C0(*((void *)internal + 1), v3);
  [*((id *)internal + 4) setTrackRunInfoEnabled:v3];
  os_activity_scope_leave(&v10);
}

- (void)startMonitoringVisits
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = (uint64_t *)self->_internal;
  objc_sync_enter(self);
  [internal performCourtesyPromptIfNeeded];
  sub_1906EDF04(internal[1], 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)stopMonitoringVisits
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906EDFF4(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)_startLeechingVisits
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v10 = 0;
    __int16 v11 = 2082;
    int v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = "activity";
    __int16 v15 = 2114;
    __int16 v16 = v6;
    __int16 v17 = 2050;
    __int16 v18 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  *(_DWORD *)uint64_t buf = 1;
  sub_1906EDF04(internal[1], buf);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)_requestVisitState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "#slv: Request visit state", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(CLVisitExtensions) _requestVisitState]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  sub_1906EE0C4(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (id)_startPlaceInferencesCommonLogic:(unint64_t)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Setup PlaceInferences common logic", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    __int16 v17 = 0;
    __int16 v15 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(_CLPlaceInferenceExtensions) _startPlaceInferencesCommonLogic:handler:]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  objc_sync_enter(self);
  os_activity_scope_state_s v9 = (void *)internal[33];
  if (v9 && ([v9 fireInterval], v10 != 1.79769313e308) || internal[31])
  {
    __int16 v11 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:10 userInfo:0];
    objc_sync_exit(self);
    if (v11)
    {
      uint64_t v12 = internal[1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_190713034;
      v16[3] = &unk_1E5696C68;
      v16[4] = v11;
      v16[5] = a4;
      if (v12)
      {
        __int16 v13 = *(void **)(v12 + 232);
        *(void *)uint64_t buf = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = sub_1906DD850;
        uint64_t v21 = &unk_1E5696C40;
        uint64_t v22 = v16;
        [v13 async:buf];
      }
    }
  }
  else
  {
    internal[31] = [a4 copy];
    internal[32] = a3;
    objc_sync_exit(self);
    return 0;
  }
  return v11;
}

- (void)_fetchPlaceInferencesWithFidelityPolicy:(unint64_t)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = NSStringFromSelector(a2);
    *(_DWORD *)uint64_t buf = 68289794;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2082;
    uint64_t v20 = "activity";
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    __int16 v23 = 2050;
    uint64_t v24 = self;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 4546, @"Invalid parameter not satisfying: %@", @"placeInferenceHandler");
  }
  id internal = self->_internal;
  if (![(CLLocationManager *)self _startPlaceInferencesCommonLogic:a3 handler:a4])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    uint64_t v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "Start oneshot PlaceInferences", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
      }
      __int16 v13 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(_CLPlaceInferenceExtensions) _fetchPlaceInferencesWithFidelityPolicy:handler:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    sub_1906EDE08(internal[1], a3);
  }
  os_activity_scope_leave(&state);
}

- (void)_fetchContinuousPlaceInferencesWithFidelityPolicy:(unint64_t)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = NSStringFromSelector(a2);
    id buf = (id)68289794;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2082;
    uint64_t v20 = "activity";
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    __int16 v23 = 2050;
    uint64_t v24 = self;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", (uint8_t *)&buf, 0x30u);
  }
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 4559, @"Invalid parameter not satisfying: %@", @"placeInferenceHandler");
  }
  id internal = self->_internal;
  if (![(CLLocationManager *)self _startPlaceInferencesCommonLogic:a3 handler:a4])
  {
    objc_sync_enter(self);
    if (!*((void *)internal + 33)) {
      *((void *)internal + 33) = [*((id *)internal + 36) newTimer];
    }
    objc_initWeak(&buf, self);
    uint64_t v12 = (void *)*((void *)internal + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19071362C;
    v13[3] = &unk_1E5697098;
    objc_copyWeak(v14, &buf);
    v13[4] = internal;
    v13[5] = a4;
    v14[1] = (id)a3;
    [v12 setHandler:v13];
    [*((id *)internal + 33) setNextFireDelay:0.0 interval:20.0];
    objc_destroyWeak(v14);
    objc_destroyWeak(&buf);
    objc_sync_exit(self);
  }
  os_activity_scope_leave(&state);
}

- (void)_stopFetchingContinuousPlaceInferences
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  uint64_t v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)id buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    int v16 = "activity";
    __int16 v17 = 2114;
    __int16 v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
    id internal = self->_internal;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
  }
  else
  {
    id internal = self->_internal;
  }
  os_activity_scope_state_s v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "Stop continuous PlaceInferences", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
    }
    os_activity_scope_state_s v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManager(_CLPlaceInferenceExtensions) _stopFetchingContinuousPlaceInferences]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  objc_sync_enter(self);
  sub_1906EDE84(*((void *)internal + 1));
  [*((id *)internal + 33) setNextFireDelay:1.79769313e308 interval:1.79769313e308];

  *((void *)internal + 31) = 0;
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)_fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v8 = _os_activity_create(&dword_1906B8000, "CL: CLLocationManager", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE002DA0);
  }
  os_activity_scope_state_s v9 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = NSStringFromSelector(a2);
    *(_DWORD *)id buf = 68289794;
    int v14 = 0;
    __int16 v15 = 2082;
    int v16 = "";
    __int16 v17 = 2082;
    __int16 v18 = "activity";
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2050;
    uint64_t v22 = self;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManager.m", 4610, @"Invalid parameter not satisfying: %@", @"handler");
  }
  id internal = self->_internal;
  objc_sync_enter(self);
  sub_1906F3B5C(internal[1], (uint64_t)a3, (uint64_t)a4);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)_updateVLLocalizationResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  if (v8) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005B00);
    }
    uint64_t v6 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Could not serialize _CLVLLocalizationResult\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005B00);
      }
    }
    char v7 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)id buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not serialize _CLVLLocalizationResult", "{\"msg%{public}.0s\":\"Could not serialize _CLVLLocalizationResult\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    CLClientUpdateVLLocalizationResult((uint64_t)[(CLLocationManager *)self internalClient], v4);
  }
}

+ (uint64_t)updatePromptedLatitude:longitude:
{
  id v0 = +[CLLocationInternalClient sharedServiceClient];

  return MEMORY[0x1F4181798](v0, sel_updatePromptedLatitude_longitude_);
}

- (void)_updateARSessionState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:8];
  if (v4)
  {
    CLClientUpdateARSessionState((uint64_t)[(CLLocationManager *)self internalClient], v4);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005D60);
    }
    BOOL v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Could not serialize _CLARSessionState\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005D60);
      }
    }
    uint64_t v6 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)id buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not serialize _CLARSessionState", "{\"msg%{public}.0s\":\"Could not serialize _CLARSessionState\"}", buf, 0x12u);
    }
  }
}

- (void)_updateVIOEstimation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  if (v8) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005E80);
    }
    uint64_t v6 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Could not serialize _CLVIOEstimation\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E80);
      }
    }
    unint64_t v7 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)id buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not serialize _CLVIOEstimation", "{\"msg%{public}.0s\":\"Could not serialize _CLVIOEstimation\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    CLClientUpdateVIOEstimation((uint64_t)[(CLLocationManager *)self internalClient], v4);
  }
}

+ (void)setStatusBarIconEnabled:(BOOL)a3 forLocationEntityClass:(unint64_t)a4
{
}

+ (BOOL)isStatusBarIconEnabledForLocationEntityClass:(unint64_t)a3
{
  return 0;
}

+ (unint64_t)primaryEntityClassForLocationDictionary:(id)a3
{
  return qword_190885DF8[sub_190825E0C(a3, 1)];
}

+ (unint64_t)entityClassesForLocationDictionary:(id)a3
{
  unint64_t result = [a1 primaryEntityClassForLocationDictionary:a3];
  if ((result & 0x3C) != 0) {
    result |= 6uLL;
  }
  return result;
}

+ (BOOL)isLocationActiveForLocationDictionary:(id)a3
{
  return [a1 activeLocationServiceTypesForLocationDictionary:a3] != 0;
}

+ (unint64_t)activeLocationServiceTypesForLocationDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "isEntityAuthorizedForLocationDictionary:")) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  uint64_t v5 = sub_19082591C(a3, v4);
  if (v5 == 3)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005F40);
    }
    unint64_t v7 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      id v14 = a3;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Dictionary utilites reported the arrow is in max state?!\", \"clientRecord\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE005F40);
      }
    }
    uint64_t v8 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      __int16 v13 = 2114;
      id v14 = a3;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Dictionary utilites reported the arrow is in max state?!", "{\"msg%{public}.0s\":\"Dictionary utilites reported the arrow is in max state?!\", \"clientRecord\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
    return 0;
  }
  else if (v5 == 2)
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

+ (id)dateLocationLastUsedForLocationDictionary:(id)a3
{
  return (id)sub_190825C38(a3);
}

+ (BOOL)hasUsedBackgroundLocationServices:(id)a3
{
  return sub_190825A60(a3);
}

+ (BOOL)isEntityAuthorizedForLocationDictionary:(id)a3
{
  return ([a1 entityAuthorizationForLocationDictionary:a3] & 6) != 0;
}

+ (unint64_t)entityAuthorizationForLocationDictionary:(id)a3
{
  return sub_1908252D4(a3);
}

+ (unint64_t)allowableAuthorizationForLocationDictionary:(id)a3
{
  return sub_190825B20(a3);
}

+ (BOOL)correctiveCompensationStatusForLocationDictionary:(id)a3
{
  return sub_190825B54(a3);
}

+ (unint64_t)incidentalUseModeForLocationDictionary:(id)a3
{
  return (unint64_t)sub_190825B80(a3);
}

+ (id)interestZonesIdentifierListForLocationDictionary:(id)a3
{
  id result = (id)sub_190825BB0(a3, a2);
  if (result)
  {
    return (id)[result allKeys];
  }
  return result;
}

+ (id)interestZoneDictionaryIdentifiedById:(id)a3 forLocationDictionary:(id)a4
{
  uint64_t v6 = (void *)sub_190825BB0(a4, a2);
  unint64_t v7 = v6;
  if (v6)
  {
    if ([v6 objectForKey:a3])
    {
      unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v7, "objectForKey:", a3));
      [v7 setObject:a3 forKey:@"ZoneId"];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(a4, "objectForKey:", @"BundleId"), @"BundleId");
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(a4, "objectForKey:", @"BundlePath"), @"BundlePath");
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

+ (BOOL)isInterestZoneReleventForLocationDictionary:(id)a3
{
  return sub_190825BBC(a3);
}

+ (void)setEntityAuthorized:(BOOL)a3 forLocationDictionary:(id)a4
{
  uint64_t v6 = [a4 objectForKey:@"BundleId"];
  uint64_t v7 = [a4 objectForKey:@"BundlePath"];
  if (v6)
  {
    MEMORY[0x1F4181798](a1, sel_setAuthorizationStatus_forBundleIdentifier_);
  }
  else if (v7)
  {
    [MEMORY[0x1E4F28B50] bundleWithPath:v7];
    MEMORY[0x1F4181798](a1, sel_setAuthorizationStatus_forBundle_);
  }
}

+ (void)setEntityAuthorization:(unint64_t)a3 forLocationDictionary:(id)a4
{
}

+ (void)setEntityAuthorization:(unint64_t)a3 withCorrectiveCompensation:(BOOL)a4 forLocationDictionary:(id)a5
{
}

+ (void)setEntityAuthorization:(unint64_t)a3 withCorrectiveCompensationType:(int)a4 forLocationDictionary:(id)a5
{
  uint64_t v8 = [a5 objectForKey:@"BundleId"];
  uint64_t v9 = [a5 objectForKey:@"BundlePath"];
  uint64_t v10 = [a5 objectForKey:@"ZoneId"];
  if (a3 > 4)
  {
    if (v10)
    {
LABEL_3:
      if (v8)
      {
        MEMORY[0x1F4181798](a1, sel_setAuthorizationStatus_withCorrectiveCompensation_forInterestZoneWithId_registeredForBundleIdentifier_);
      }
      else if (v9)
      {
        [MEMORY[0x1E4F28B50] bundleWithPath:v9];
        MEMORY[0x1F4181798](a1, sel_setAuthorizationStatus_withCorrectiveCompensation_forInterestZoneWithId_registeredForBundle_);
      }
      return;
    }
  }
  else if (v10)
  {
    goto LABEL_3;
  }
  if (v8)
  {
    MEMORY[0x1F4181798](a1, sel_setAuthorizationStatusByType_withCorrectiveCompensation_forBundleIdentifier_);
  }
  else if (v9)
  {
    [MEMORY[0x1E4F28B50] bundleWithPath:v9];
    MEMORY[0x1F4181798](a1, sel_setAuthorizationStatusByType_withCorrectiveCompensation_forBundle_);
  }
}

+ (BOOL)backgroundIndicatorEnabledForLocationDictionary:(id)a3
{
  return sub_190825BF8(a3);
}

+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forLocationDictionary:(id)a4
{
  uint64_t v6 = [a4 objectForKey:@"BundleId"];
  uint64_t v7 = [a4 objectForKey:@"BundlePath"];
  if (v6)
  {
    MEMORY[0x1F4181798](a1, sel_setBackgroundIndicatorEnabled_forBundleIdentifier_);
  }
  else if (v7)
  {
    [MEMORY[0x1E4F28B50] bundleWithPath:v7];
    MEMORY[0x1F4181798](a1, sel_setBackgroundIndicatorEnabled_forBundle_);
  }
}

@end