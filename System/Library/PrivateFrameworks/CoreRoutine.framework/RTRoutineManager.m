@interface RTRoutineManager
+ (id)defaultManager;
+ (id)modeOfTransportationToString:(int64_t)a3;
+ (id)routineModeToString:(int64_t)a3;
- (BOOL)selectorIsAllowed:(SEL)a3;
- (BOOL)targetUserSession;
- (NSString)restorationIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (RTEventAgentHelper)eventAgentHelper;
- (RTPlaceInferenceOptions)placeInferenceOptions;
- (RTRoutineManager)init;
- (RTRoutineManager)initWithRestorationIdentifier:(id)a3;
- (RTRoutineManager)initWithRestorationIdentifier:(id)a3 targertUserSession:(BOOL)a4;
- (RTRoutineManager)initWithTargetUserSession:(BOOL)a3;
- (RTRoutineManagerRegistrantAction)actionRegistrant;
- (RTRoutineManagerRegistrantPeopleDiscovery)peopleDiscoveryRegistrant;
- (RTRoutineManagerRegistrantScenarioTrigger)scenarioTriggerRegistrant;
- (RTTokenBucket)clientThrottle;
- (id)_proxyForServicingSelector:(SEL)a3 asynchronous:(BOOL)a4 withErrorHandler:(id)a5;
- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4;
- (id)leechedLowConfidenceVisitHandler;
- (id)leechedVisitHandler;
- (id)peopleDiscoveryErrorHandler;
- (id)placeInferencesHandler;
- (id)vehicleEventsHandler;
- (id)visitHandler;
- (void)_createConnection;
- (void)_enumerateStoredLocationsWithOptions:(id)a3 usingBlock:(id)a4;
- (void)_launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6;
- (void)addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4;
- (void)addElevations:(id)a3 handler:(id)a4;
- (void)addLocationOfInterestOfType:(int64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6;
- (void)clearAllVehicleEvents;
- (void)clearAllVehicleEvents:(id)a3;
- (void)clearAllVehicleEventsWithHandler:(id)a3;
- (void)clearRoutineWithHandler:(id)a3;
- (void)createConnection;
- (void)dealloc;
- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4;
- (void)engageInVehicleEventWithIdentifier:(id)a3;
- (void)enumerateObjectsWithOptions:(id)a3 usingBlock:(id)a4;
- (void)enumerateStoredLocationsWithOptions:(id)a3 usingBlock:(id)a4;
- (void)extendLifetimeOfVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4;
- (void)fetchAllLocationsOfInterestForSettingsWithHandler:(id)a3;
- (void)fetchAuthorizedLocationStatus:(id)a3;
- (void)fetchAutomaticVehicleEventDetectionSupportedWithHandler:(id)a3;
- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchCloudSyncAuthorizationState:(id)a3;
- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchCurrentPeopleDensity:(id)a3;
- (void)fetchCurrentPredictedLocationsOfInterestLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5;
- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchElevationsWithOptions:(id)a3 reply:(id)a4;
- (void)fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4;
- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3;
- (void)fetchLastVehicleEventsWithHandler:(id)a3;
- (void)fetchLocationOfInterestAtLocation:(id)a3 withHandler:(id)a4;
- (void)fetchLocationOfInterestForRegion:(id)a3 withHandler:(id)a4;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4;
- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5;
- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 withHandler:(id)a4;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withHandler:(id)a5;
- (void)fetchLookbackWindowStartDateWithHandler:(id)a3;
- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 handler:(id)a4;
- (void)fetchMonitoredScenarioTriggerTypesWithHandler:(id)a3;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withHandler:(id)a6;
- (void)fetchNextPredictedLocationsOfInterestWithHandler:(id)a3;
- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchPeopleCountEventsHistory:(id)a3 completionHandler:(id)a4;
- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)fetchPlaceInferencesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5;
- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6;
- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5;
- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withHandler:(id)a4;
- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)fetchRemoteStatusWithHandler:(id)a3;
- (void)fetchRoutineEnabledWithHandler:(id)a3;
- (void)fetchRoutineModeFromLocation:(id)a3 withHandler:(id)a4;
- (void)fetchRoutineStateWithHandler:(id)a3;
- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4;
- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchVehiclesWithOptions:(id)a3 handler:(id)a4;
- (void)launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6;
- (void)onDensityUpdate:(id)a3 error:(id)a4;
- (void)onLeechedLowConfidenceVisit:(id)a3 withError:(id)a4;
- (void)onLeechedVisit:(id)a3 withError:(id)a4;
- (void)onPlaceInferences:(id)a3 error:(id)a4;
- (void)onScenarioTrigger:(id)a3 withError:(id)a4;
- (void)onVehicleEvents:(id)a3 error:(id)a4;
- (void)onVisit:(id)a3 withError:(id)a4;
- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5;
- (void)processHindsightVisitsWithHandler:(id)a3;
- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)setActionRegistrant:(id)a3;
- (void)setClientThrottle:(id)a3;
- (void)setEventAgentHelper:(id)a3;
- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withHandler:(id)a5;
- (void)setLeechedLowConfidenceVisitHandler:(id)a3;
- (void)setLeechedVisitHandler:(id)a3;
- (void)setPeopleDiscoveryErrorHandler:(id)a3;
- (void)setPeopleDiscoveryRegistrant:(id)a3;
- (void)setPlaceInferenceOptions:(id)a3;
- (void)setPlaceInferencesHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRestorationIdentifier:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)setRoutineEnabled:(BOOL)a3 withHandler:(id)a4;
- (void)setScenarioTriggerRegistrant:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setVehicleEventsHandler:(id)a3;
- (void)setVisitHandler:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)startLeechingLowConfidenceVisitsWithHandler:(id)a3;
- (void)startLeechingVisitsWithHandler:(id)a3;
- (void)startMonitoringForPeopleDiscovery:(id)a3 handler:(id)a4;
- (void)startMonitoringPlaceInferencesWithOptions:(id)a3 handler:(id)a4;
- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 withHandler:(id)a4;
- (void)startMonitoringVehicleEventsWithHandler:(id)a3;
- (void)startMonitoringVisitsWithHandler:(id)a3;
- (void)stopLeechingLowConfidenceVisits;
- (void)stopLeechingVisits;
- (void)stopMonitoringForPeopleDiscoveryWithHandler:(id)a3;
- (void)stopMonitoringPlaceInferences;
- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3;
- (void)stopMonitoringVehicleEvents;
- (void)stopMonitoringVisits;
- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 handler:(id)a4;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 handler:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 customLabel:(id)a5 handler:(id)a6;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 handler:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 mapItem:(id)a5 customLabel:(id)a6 handler:(id)a7;
- (void)updateVehicleEventWithIdentifier:(id)a3 geoMapItem:(id)a4;
- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4;
- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4;
- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4;
- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5;
- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 geoMapItem:(id)a6 handler:(id)a7;
- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4;
- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5;
@end

@implementation RTRoutineManager

uint64_t __89__RTRoutineManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchTaskWithSelector:*(void *)(a1 + 56) remainingAttempts:*(void *)(a1 + 64) proxyErrorHandler:*(void *)(a1 + 40) taskBlock:*(void *)(a1 + 48)];
}

uint64_t __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RTRoutineManager)initWithRestorationIdentifier:(id)a3 targertUserSession:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)RTRoutineManager;
  v7 = [(RTRoutineManager *)&v39 init];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v34 = v6;
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v36;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
            v14 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v13;
              _os_log_debug_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v10);
      }

      id v6 = v34;
    }
    v15 = v7;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (const char *)[(RTRoutineManager *)v15 UTF8String];
    }
    else
    {
      id v18 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v15];
      v17 = (const char *)[v18 UTF8String];
    }
    dispatch_queue_t v19 = dispatch_queue_create(v17, v16);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v19;

    v21 = [[RTTokenBucket alloc] initWithFillRate:10.0 capacity:10.0 initialAllocation:10.0];
    clientThrottle = v15->_clientThrottle;
    v15->_clientThrottle = v21;

    uint64_t v23 = objc_opt_new();
    scenarioTriggerRegistrant = v15->_scenarioTriggerRegistrant;
    v15->_scenarioTriggerRegistrant = (RTRoutineManagerRegistrantScenarioTrigger *)v23;

    v25 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v6;
      _os_log_impl(&dword_1A8FEF000, v25, OS_LOG_TYPE_DEFAULT, "rdar122420473 creating _peopleDiscoveryRegistrant initWithConfigurationIdentifier %@", buf, 0xCu);
    }

    v26 = [[RTRoutineManagerRegistrantPeopleDiscovery alloc] initWithConfigurationIdentifier:v6];
    peopleDiscoveryRegistrant = v15->_peopleDiscoveryRegistrant;
    v15->_peopleDiscoveryRegistrant = v26;

    uint64_t v28 = [v6 copy];
    restorationIdentifier = v15->_restorationIdentifier;
    v15->_restorationIdentifier = (NSString *)v28;

    v30 = [[RTEventAgentHelper alloc] initWithRestorationIdentifier:v15->_restorationIdentifier];
    eventAgentHelper = v15->_eventAgentHelper;
    v15->_eventAgentHelper = v30;

    v15->_targetUserSession = a4;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v15, (CFNotificationCallback)onDaemonStartNotification, @"com.apple.routined.registration", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(RTRoutineManager *)v15 createConnection];
  }

  return v7;
}

- (void)_launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__RTRoutineManager__launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke;
  v19[3] = &unk_1E5D73BE0;
  unint64_t v22 = a4;
  SEL v23 = a3;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  uint64_t v12 = (void (**)(id, void *))v11;
  id v13 = v10;
  v14 = [(RTRoutineManager *)self _proxyForServicingSelector:a3 withErrorHandler:v19];
  v15 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    id v18 = NSStringFromSelector(a3);
    *(_DWORD *)buf = 138412546;
    v25 = v17;
    __int16 v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_INFO, "%@, %@, running task block", buf, 0x16u);
  }
  v12[2](v12, v14);
}

- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4
{
  return [(RTRoutineManager *)self _proxyForServicingSelector:a3 asynchronous:1 withErrorHandler:a4];
}

- (id)_proxyForServicingSelector:(SEL)a3 asynchronous:(BOOL)a4 withErrorHandler:(id)a5
{
  BOOL v5 = a4;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__RTRoutineManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke;
  v30[3] = &unk_1E5D73C08;
  v30[4] = self;
  SEL v32 = a3;
  id v9 = v8;
  id v31 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x1AD0EBF30](v30);
  if (![(RTRoutineManager *)self selectorIsAllowed:a3]
    && ![(RTTokenBucket *)self->_clientThrottle operationAllowed])
  {
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"Client is exceeding maximum call rate!";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTErrorDomain" code:12 userInfo:v11];
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v28 = [(RTTokenBucket *)self->_clientThrottle dumpStatistics];
      *(_DWORD *)buf = 138412546;
      id v34 = v12;
      __int16 v35 = 2112;
      long long v36 = v28;
      _os_log_fault_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_FAULT, "Error: %@, %@", buf, 0x16u);
    }
  }
  v14 = [(RTRoutineManager *)self xpcConnection];
  id v21 = v14;
  if (!v14)
  {
    SEL v23 = @"no xpc connection";
LABEL_15:
    __int16 v26 = RTErrorConnectionCreate(a3, v23, v15, v16, v17, v18, v19, v20, v29);
    ((void (**)(void, void *))v10)[2](v10, v26);

    v25 = 0;
    goto LABEL_16;
  }
  if (v5)
  {
    uint64_t v22 = [v14 remoteObjectProxyWithErrorHandler:v10];
  }
  else
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8FEF000, v24, OS_LOG_TYPE_INFO, "vending synchronous remote object proxy.", buf, 2u);
    }

    uint64_t v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v10];
  }
  v25 = (void *)v22;
  if (!v22)
  {
    SEL v23 = @"no remote object proxy";
    goto LABEL_15;
  }
LABEL_16:

  return v25;
}

- (BOOL)selectorIsAllowed:(SEL)a3
{
  return sel_isEqual(a3, sel_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler_);
}

void __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_3;
  v6[3] = &unk_1E5D73C58;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [a2 fetchPredictedLocationsOfInterestAssociatedToTitle:v3 location:v4 calendarIdentifier:v5 reply:v6];
}

void __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  [a2 fetchLocationsOfInterestOfType:v3 reply:v4];
}

void __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D74120;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLocationOfInterestAtLocation:v3 reply:v4];
}

- (void)_createConnection
{
  uint64_t v4 = [(RTRoutineManager *)self xpcConnection];
  [v4 invalidate];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.routined.registration" options:4096];
  [(RTRoutineManager *)self setXpcConnection:v5];

  id v6 = [(RTRoutineManager *)self xpcConnection];

  if (v6)
  {
    id v7 = [(RTRoutineManager *)self xpcConnection];
    id v8 = [(RTRoutineManager *)self queue];
    [v7 _setQueue:v8];

    id v9 = [(RTRoutineManager *)self xpcConnection];
    id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFF93918];
    [v9 setExportedInterface:v10];

    id v11 = [(RTRoutineManager *)self xpcConnection];
    uint64_t v12 = [[RTRoutineManagerExportedObject alloc] initWithRoutineManager:self];
    [v11 setExportedObject:v12];

    id v13 = [(RTRoutineManager *)self xpcConnection];
    v14 = [v13 exportedInterface];
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    [v14 setClasses:v17 forSelector:sel_onVehicleEvents_error_ argumentIndex:0 ofReply:0];

    uint64_t v18 = [(RTRoutineManager *)self xpcConnection];
    uint64_t v19 = [v18 exportedInterface];
    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    [v19 setClasses:v22 forSelector:sel_onDensityUpdate_error_ argumentIndex:0 ofReply:0];

    SEL v23 = [(RTRoutineManager *)self xpcConnection];
    v24 = [v23 exportedInterface];
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    [v24 setClasses:v27 forSelector:sel_onPlaceInferences_error_ argumentIndex:0 ofReply:0];

    uint64_t v28 = [(RTRoutineManager *)self xpcConnection];
    uint64_t v29 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFF9CA58];
    [v28 setRemoteObjectInterface:v29];

    v30 = [(RTRoutineManager *)self xpcConnection];
    id v31 = [v30 remoteObjectInterface];
    SEL v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v31 setClasses:v32 forSelector:sel_fetchPathToDiagnosticFilesWithOptions_reply_ argumentIndex:0 ofReply:0];

    v33 = [(RTRoutineManager *)self xpcConnection];
    id v34 = [v33 remoteObjectInterface];
    __int16 v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    [v34 setClasses:v37 forSelector:sel_fetchLocationsOfInterestWithinDistance_ofLocation_reply_ argumentIndex:0 ofReply:1];

    long long v38 = [(RTRoutineManager *)self xpcConnection];
    objc_super v39 = [v38 remoteObjectInterface];
    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    [v39 setClasses:v42 forSelector:sel_fetchLocationsOfInterestOfType_reply_ argumentIndex:0 ofReply:1];

    uint64_t v43 = [(RTRoutineManager *)self xpcConnection];
    v44 = [v43 remoteObjectInterface];
    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    [v44 setClasses:v47 forSelector:sel_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply_ argumentIndex:0 ofReply:1];

    v48 = [(RTRoutineManager *)self xpcConnection];
    v49 = [v48 remoteObjectInterface];
    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    [v49 setClasses:v52 forSelector:sel_fetchAllLocationsOfInterestForSettingsWithReply_ argumentIndex:0 ofReply:1];

    v53 = [(RTRoutineManager *)self xpcConnection];
    v54 = [v53 remoteObjectInterface];
    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    [v54 setClasses:v57 forSelector:sel_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply_ argumentIndex:0 ofReply:1];

    v58 = [(RTRoutineManager *)self xpcConnection];
    v59 = [v58 remoteObjectInterface];
    v60 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v61 = objc_opt_class();
    v62 = objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    [v59 setClasses:v62 forSelector:sel_fetchLocationsOfInterestAssociatedToIdentifier_reply_ argumentIndex:0 ofReply:1];

    v63 = [(RTRoutineManager *)self xpcConnection];
    v64 = [v63 remoteObjectInterface];
    v65 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v66 = objc_opt_class();
    v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
    [v64 setClasses:v67 forSelector:sel_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply_ argumentIndex:0 ofReply:1];

    v68 = [(RTRoutineManager *)self xpcConnection];
    v69 = [v68 remoteObjectInterface];
    v70 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v71 = objc_opt_class();
    v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    [v69 setClasses:v72 forSelector:sel_fetchPredictedLocationsOfInterestOnDate_reply_ argumentIndex:0 ofReply:1];

    v73 = [(RTRoutineManager *)self xpcConnection];
    v74 = [v73 remoteObjectInterface];
    v75 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v76 = objc_opt_class();
    v77 = objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
    [v74 setClasses:v77 forSelector:sel_fetchPredictedExitDatesFromLocation_onDate_reply_ argumentIndex:0 ofReply:1];

    v78 = [(RTRoutineManager *)self xpcConnection];
    v79 = [v78 remoteObjectInterface];
    v80 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v81 = objc_opt_class();
    v82 = objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
    [v79 setClasses:v82 forSelector:sel_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply_ argumentIndex:0 ofReply:1];

    v83 = [(RTRoutineManager *)self xpcConnection];
    v84 = [v83 remoteObjectInterface];
    v85 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v86 = objc_opt_class();
    uint64_t v87 = objc_opt_class();
    v88 = objc_msgSend(v85, "setWithObjects:", v86, v87, objc_opt_class(), 0);
    [v84 setClasses:v88 forSelector:sel_performBluePOIQueryLookingBack_lookingAhead_reply_ argumentIndex:0 ofReply:1];

    v89 = [(RTRoutineManager *)self xpcConnection];
    v90 = [v89 remoteObjectInterface];
    v91 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v92 = objc_opt_class();
    uint64_t v93 = objc_opt_class();
    uint64_t v94 = objc_opt_class();
    uint64_t v95 = objc_opt_class();
    v96 = objc_msgSend(v91, "setWithObjects:", v92, v93, v94, v95, objc_opt_class(), 0);
    [v90 setClasses:v96 forSelector:sel_performBluePOIQueryLookingBack_lookingAhead_reply_ argumentIndex:1 ofReply:1];

    v97 = [(RTRoutineManager *)self xpcConnection];
    v98 = [v97 remoteObjectInterface];
    v99 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v100 = objc_opt_class();
    v101 = objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
    [v98 setClasses:v101 forSelector:sel_performBluePOIQueryLookingBack_lookingAhead_reply_ argumentIndex:2 ofReply:1];

    v102 = [(RTRoutineManager *)self xpcConnection];
    v103 = [v102 remoteObjectInterface];
    v104 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v105 = objc_opt_class();
    v106 = objc_msgSend(v104, "setWithObjects:", v105, objc_opt_class(), 0);
    [v103 setClasses:v106 forSelector:sel_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply_ argumentIndex:0 ofReply:1];

    v107 = [(RTRoutineManager *)self xpcConnection];
    v108 = [v107 remoteObjectInterface];
    v109 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v110 = objc_opt_class();
    v111 = objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0);
    [v108 setClasses:v111 forSelector:sel_fetchLastVehicleEventsWithReply_ argumentIndex:0 ofReply:1];

    v112 = [(RTRoutineManager *)self xpcConnection];
    v113 = [v112 remoteObjectInterface];
    v114 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v115 = objc_opt_class();
    v116 = objc_msgSend(v114, "setWithObjects:", v115, objc_opt_class(), 0);
    [v113 setClasses:v116 forSelector:sel_fetchLocationOfInterestWithIdentifier_reply_ argumentIndex:0 ofReply:1];

    v117 = [(RTRoutineManager *)self xpcConnection];
    v118 = [v117 remoteObjectInterface];
    v119 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v120 = objc_opt_class();
    v121 = objc_msgSend(v119, "setWithObjects:", v120, objc_opt_class(), 0);
    [v118 setClasses:v121 forSelector:sel_addLocationOfInterestOfType_mapItemStorage_customLabel_reply_ argumentIndex:1 ofReply:1];

    v122 = [(RTRoutineManager *)self xpcConnection];
    v123 = [v122 remoteObjectInterface];
    v124 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v125 = objc_opt_class();
    v126 = objc_msgSend(v124, "setWithObjects:", v125, objc_opt_class(), 0);
    [v123 setClasses:v126 forSelector:sel_fetchTransitionsBetweenStartDate_endDate_reply_ argumentIndex:0 ofReply:1];

    v127 = [(RTRoutineManager *)self xpcConnection];
    v128 = [v127 remoteObjectInterface];
    v129 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v130 = objc_opt_class();
    v131 = objc_msgSend(v129, "setWithObjects:", v130, objc_opt_class(), 0);
    [v128 setClasses:v131 forSelector:sel_fetchStoredLocationsWithContext_reply_ argumentIndex:0 ofReply:1];

    v132 = [(RTRoutineManager *)self xpcConnection];
    v133 = [v132 remoteObjectInterface];
    v134 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v135 = objc_opt_class();
    v136 = objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
    [v133 setClasses:v136 forSelector:sel_fetchStoredLocationsWithContext_reply_ argumentIndex:0 ofReply:0];

    v137 = [(RTRoutineManager *)self xpcConnection];
    v138 = [v137 remoteObjectInterface];
    v139 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v140 = objc_opt_class();
    v141 = objc_msgSend(v139, "setWithObjects:", v140, objc_opt_class(), 0);
    [v138 setClasses:v141 forSelector:sel_fetchPlaceInferencesWithOptions_reply_ argumentIndex:0 ofReply:1];

    v142 = [(RTRoutineManager *)self xpcConnection];
    v143 = [v142 remoteObjectInterface];
    v144 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v145 = objc_opt_class();
    v146 = objc_msgSend(v144, "setWithObjects:", v145, objc_opt_class(), 0);
    [v143 setClasses:v146 forSelector:sel_fetchFamiliarityIndexResultsWithOptions_reply_ argumentIndex:0 ofReply:1];

    v147 = [(RTRoutineManager *)self xpcConnection];
    v148 = [v147 remoteObjectInterface];
    [v148 setClass:objc_opt_class() forSelector:sel_fetchAuthorizedLocationStatus_ argumentIndex:0 ofReply:1];

    v149 = [(RTRoutineManager *)self xpcConnection];
    v150 = [v149 remoteObjectInterface];
    v151 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v152 = objc_opt_class();
    v153 = objc_msgSend(v151, "setWithObjects:", v152, objc_opt_class(), 0);
    [v150 setClasses:v153 forSelector:sel_fetchEstimatedLocationAtDate_options_reply_ argumentIndex:0 ofReply:0];

    v154 = [(RTRoutineManager *)self xpcConnection];
    v155 = [v154 remoteObjectInterface];
    v156 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v155 setClasses:v156 forSelector:sel_fetchEstimatedLocationAtDate_options_reply_ argumentIndex:0 ofReply:1];

    v157 = [(RTRoutineManager *)self xpcConnection];
    v158 = [v157 remoteObjectInterface];
    v159 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v158 setClasses:v159 forSelector:sel_fetchEstimatedLocationAtDate_options_reply_ argumentIndex:1 ofReply:1];

    v160 = [(RTRoutineManager *)self xpcConnection];
    v161 = [v160 remoteObjectInterface];
    v162 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v163 = objc_opt_class();
    v164 = objc_msgSend(v162, "setWithObjects:", v163, objc_opt_class(), 0);
    [v161 setClasses:v164 forSelector:sel_fetchStoredVisitsWithOptions_reply_ argumentIndex:0 ofReply:1];

    v165 = [(RTRoutineManager *)self xpcConnection];
    v166 = [v165 remoteObjectInterface];
    v167 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v168 = objc_opt_class();
    v169 = objc_msgSend(v167, "setWithObjects:", v168, objc_opt_class(), 0);
    [v166 setClasses:v169 forSelector:sel_fetchTripSegmentsWithOptions_reply_ argumentIndex:0 ofReply:1];

    v170 = [(RTRoutineManager *)self xpcConnection];
    v171 = [v170 remoteObjectInterface];
    [v171 setClass:objc_opt_class() forSelector:sel_fetchLocationsForTripSegmentWithOptions_reply_ argumentIndex:0 ofReply:0];

    v172 = [(RTRoutineManager *)self xpcConnection];
    v173 = [v172 remoteObjectInterface];
    v174 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v175 = objc_opt_class();
    v176 = objc_msgSend(v174, "setWithObjects:", v175, objc_opt_class(), 0);
    [v173 setClasses:v176 forSelector:sel_fetchLocationsForTripSegmentWithOptions_reply_ argumentIndex:0 ofReply:1];

    v177 = [(RTRoutineManager *)self xpcConnection];
    v178 = [v177 remoteObjectInterface];
    v179 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v178 setClasses:v179 forSelector:sel_deleteTripSegmentWithUUID_reply_ argumentIndex:0 ofReply:0];

    v180 = [(RTRoutineManager *)self xpcConnection];
    v181 = [v180 remoteObjectInterface];
    v182 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v183 = objc_opt_class();
    v184 = objc_msgSend(v182, "setWithObjects:", v183, objc_opt_class(), 0);
    [v181 setClasses:v184 forSelector:sel_fetchVehiclesWithOptions_reply_ argumentIndex:0 ofReply:1];

    v185 = [(RTRoutineManager *)self xpcConnection];
    v186 = [v185 remoteObjectInterface];
    [v186 setClass:objc_opt_class() forSelector:sel_fetchTripSegmentMetadataWithOptions_reply_ argumentIndex:0 ofReply:0];

    v187 = [(RTRoutineManager *)self xpcConnection];
    v188 = [v187 remoteObjectInterface];
    v189 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v190 = objc_opt_class();
    v191 = objc_msgSend(v189, "setWithObjects:", v190, objc_opt_class(), 0);
    [v188 setClasses:v191 forSelector:sel_fetchTripSegmentMetadataWithOptions_reply_ argumentIndex:0 ofReply:1];

    v192 = [(RTRoutineManager *)self xpcConnection];
    v193 = [v192 remoteObjectInterface];
    v194 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v195 = objc_opt_class();
    uint64_t v196 = objc_opt_class();
    v197 = objc_msgSend(v194, "setWithObjects:", v195, v196, objc_opt_class(), 0);
    [v193 setClasses:v197 forSelector:sel_fetchEnumerableObjectsWithOptions_offset_reply_ argumentIndex:0 ofReply:0];

    v198 = [(RTRoutineManager *)self xpcConnection];
    v199 = [v198 remoteObjectInterface];
    v200 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v201 = objc_opt_class();
    uint64_t v202 = objc_opt_class();
    uint64_t v203 = objc_opt_class();
    v204 = objc_msgSend(v200, "setWithObjects:", v201, v202, v203, objc_opt_class(), 0);
    [v199 setClasses:v204 forSelector:sel_fetchEnumerableObjectsWithOptions_offset_reply_ argumentIndex:0 ofReply:1];

    v205 = [(RTRoutineManager *)self xpcConnection];
    v206 = [v205 remoteObjectInterface];
    [v206 setClass:objc_opt_class() forSelector:sel_fetchEnumerableObjectsWithOptions_offset_reply_ argumentIndex:1 ofReply:1];

    v207 = [(RTRoutineManager *)self xpcConnection];
    v208 = [v207 remoteObjectInterface];
    v209 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v210 = objc_opt_class();
    v211 = objc_msgSend(v209, "setWithObjects:", v210, objc_opt_class(), 0);
    [v208 setClasses:v211 forSelector:sel_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply_ argumentIndex:0 ofReply:1];

    v212 = [(RTRoutineManager *)self xpcConnection];
    v213 = [v212 remoteObjectInterface];
    v214 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v215 = objc_opt_class();
    v216 = objc_msgSend(v214, "setWithObjects:", v215, objc_opt_class(), 0);
    [v213 setClasses:v216 forSelector:sel_fetchElevationsWithOptions_reply_ argumentIndex:0 ofReply:1];

    v217 = [(RTRoutineManager *)self xpcConnection];
    v218 = [v217 remoteObjectInterface];
    v219 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v220 = objc_opt_class();
    v221 = objc_msgSend(v219, "setWithObjects:", v220, objc_opt_class(), 0);
    [v218 setClasses:v221 forSelector:sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_ argumentIndex:0 ofReply:1];

    v222 = [(RTRoutineManager *)self xpcConnection];
    v223 = [v222 remoteObjectInterface];
    v224 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v225 = objc_opt_class();
    v226 = objc_msgSend(v224, "setWithObjects:", v225, objc_opt_class(), 0);
    [v223 setClasses:v226 forSelector:sel_addBackgroundInertialOdometrySamples_reply_ argumentIndex:0 ofReply:0];

    v227 = [(RTRoutineManager *)self xpcConnection];
    v228 = [v227 remoteObjectInterface];
    v229 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v228 setClasses:v229 forSelector:sel_startMonitoringPlaceInferencesWithOptions_reply_ argumentIndex:0 ofReply:0];

    v230 = [(RTRoutineManager *)self xpcConnection];
    v231 = [v230 remoteObjectInterface];
    [v231 setClass:objc_opt_class() forSelector:sel_startMonitoringForPeopleDiscovery_configuration_reply_ argumentIndex:0 ofReply:0];

    v232 = [(RTRoutineManager *)self xpcConnection];
    v233 = [v232 remoteObjectInterface];
    [v233 setClass:objc_opt_class() forSelector:sel_fetchOngoingPeopleDensity_ argumentIndex:0 ofReply:1];

    v234 = [(RTRoutineManager *)self xpcConnection];
    v235 = [v234 remoteObjectInterface];
    [v235 setClass:objc_opt_class() forSelector:sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_ argumentIndex:0 ofReply:0];

    v236 = [(RTRoutineManager *)self xpcConnection];
    v237 = [v236 remoteObjectInterface];
    [v237 setClass:objc_opt_class() forSelector:sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_ argumentIndex:1 ofReply:0];

    v238 = [(RTRoutineManager *)self xpcConnection];
    v239 = [v238 remoteObjectInterface];
    v240 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v241 = objc_opt_class();
    v242 = objc_msgSend(v240, "setWithObjects:", v241, objc_opt_class(), 0);
    [v239 setClasses:v242 forSelector:sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_ argumentIndex:0 ofReply:1];

    v243 = [(RTRoutineManager *)self xpcConnection];
    v244 = [v243 remoteObjectInterface];
    v245 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v246 = objc_opt_class();
    v247 = objc_msgSend(v245, "setWithObjects:", v246, objc_opt_class(), 0);
    [v244 setClasses:v247 forSelector:sel_fetchProximityHistoryFromEventIDs_completionHandler_ argumentIndex:0 ofReply:0];

    v248 = [(RTRoutineManager *)self xpcConnection];
    v249 = [v248 remoteObjectInterface];
    v250 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v251 = objc_opt_class();
    v252 = objc_msgSend(v250, "setWithObjects:", v251, objc_opt_class(), 0);
    [v249 setClasses:v252 forSelector:sel_fetchProximityHistoryFromEventIDs_completionHandler_ argumentIndex:0 ofReply:1];

    v253 = [(RTRoutineManager *)self xpcConnection];
    v254 = [v253 remoteObjectInterface];
    v255 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v256 = objc_opt_class();
    v257 = objc_msgSend(v255, "setWithObjects:", v256, objc_opt_class(), 0);
    [v254 setClasses:v257 forSelector:sel_fetchPeopleCountEventsHistory_completionHandler_ argumentIndex:0 ofReply:0];

    v258 = [(RTRoutineManager *)self xpcConnection];
    v259 = [v258 remoteObjectInterface];
    v260 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v261 = objc_opt_class();
    v262 = objc_msgSend(v260, "setWithObjects:", v261, objc_opt_class(), 0);
    [v259 setClasses:v262 forSelector:sel_fetchPeopleCountEventsHistory_completionHandler_ argumentIndex:0 ofReply:1];

    v263 = [(RTRoutineManager *)self xpcConnection];
    v264 = [v263 remoteObjectInterface];
    [v264 setClass:objc_opt_class() forSelector:sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_ argumentIndex:0 ofReply:0];

    v265 = [(RTRoutineManager *)self xpcConnection];
    v266 = [v265 remoteObjectInterface];
    [v266 setClass:objc_opt_class() forSelector:sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_ argumentIndex:1 ofReply:0];

    v267 = [(RTRoutineManager *)self xpcConnection];
    v268 = [v267 remoteObjectInterface];
    v269 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v270 = objc_opt_class();
    v271 = objc_msgSend(v269, "setWithObjects:", v270, objc_opt_class(), 0);
    [v268 setClasses:v271 forSelector:sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_ argumentIndex:0 ofReply:1];

    v272 = [(RTRoutineManager *)self xpcConnection];
    v273 = [v272 remoteObjectInterface];
    v274 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v275 = objc_opt_class();
    v276 = objc_msgSend(v274, "setWithObjects:", v275, objc_opt_class(), 0);
    [v273 setClasses:v276 forSelector:sel_fetchContactScoresFromContactIDs_completionHandler_ argumentIndex:0 ofReply:0];

    v277 = [(RTRoutineManager *)self xpcConnection];
    v278 = [v277 remoteObjectInterface];
    v279 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v280 = objc_opt_class();
    v281 = objc_msgSend(v279, "setWithObjects:", v280, objc_opt_class(), 0);
    [v278 setClasses:v281 forSelector:sel_fetchContactScoresFromContactIDs_completionHandler_ argumentIndex:0 ofReply:1];

    v282 = [(RTRoutineManager *)self xpcConnection];
    [v282 resume];

    v283 = [(RTRoutineManager *)self restorationIdentifier];

    if (v283)
    {
      v284 = [(RTRoutineManager *)self xpcConnection];
      v304[0] = MEMORY[0x1E4F143A8];
      v304[1] = 3221225472;
      v304[2] = __37__RTRoutineManager__createConnection__block_invoke;
      v304[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v304[4] = a2;
      v285 = [v284 remoteObjectProxyWithErrorHandler:v304];
      v286 = [(RTRoutineManager *)self restorationIdentifier];
      [v285 setRestorationIdentifier:v286];
    }
    v287 = [(RTRoutineManager *)self visitHandler];

    if (v287)
    {
      v288 = [(RTRoutineManager *)self visitHandler];
      [(RTRoutineManager *)self startMonitoringVisitsWithHandler:v288];
    }
    v289 = [(RTRoutineManager *)self leechedVisitHandler];

    if (v289)
    {
      v290 = [(RTRoutineManager *)self leechedVisitHandler];
      [(RTRoutineManager *)self startLeechingVisitsWithHandler:v290];
    }
    v291 = [(RTRoutineManager *)self leechedLowConfidenceVisitHandler];

    if (v291)
    {
      v292 = [(RTRoutineManager *)self leechedLowConfidenceVisitHandler];
      [(RTRoutineManager *)self startLeechingLowConfidenceVisitsWithHandler:v292];
    }
    uint64_t v293 = [(RTRoutineManager *)self placeInferencesHandler];
    if (v293)
    {
      v294 = (void *)v293;
      v295 = [(RTRoutineManager *)self placeInferenceOptions];

      if (v295)
      {
        v296 = [(RTRoutineManager *)self placeInferenceOptions];
        v297 = [(RTRoutineManager *)self placeInferencesHandler];
        [(RTRoutineManager *)self startMonitoringPlaceInferencesWithOptions:v296 handler:v297];
      }
    }
    if ([(RTRoutineManagerRegistrantScenarioTrigger *)self->_scenarioTriggerRegistrant registered])
    {
      v298 = [(RTRoutineManagerRegistrantScenarioTrigger *)self->_scenarioTriggerRegistrant scenarioTriggerHandlers];
      v303[0] = MEMORY[0x1E4F143A8];
      v303[1] = 3221225472;
      v303[2] = __37__RTRoutineManager__createConnection__block_invoke_367;
      v303[3] = &unk_1E5D73B68;
      v303[4] = self;
      [v298 enumerateKeysAndObjectsUsingBlock:v303];
    }
    if ([(RTRoutineManagerRegistrantPeopleDiscovery *)self->_peopleDiscoveryRegistrant registered])
    {
      v299 = [(RTRoutineManagerRegistrantPeopleDiscovery *)self->_peopleDiscoveryRegistrant configuration];
      v300 = [(RTRoutineManager *)self peopleDiscoveryErrorHandler];
      [(RTRoutineManager *)self startMonitoringForPeopleDiscovery:v299 handler:v300];
    }
    v301 = [(RTRoutineManager *)self vehicleEventsHandler];

    if (v301)
    {
      v302 = [(RTRoutineManager *)self vehicleEventsHandler];
      [(RTRoutineManager *)self startMonitoringVehicleEventsWithHandler:v302];
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (id)visitHandler
{
  return self->_visitHandler;
}

- (id)vehicleEventsHandler
{
  return self->_vehicleEventsHandler;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (id)placeInferencesHandler
{
  return self->_placeInferencesHandler;
}

- (id)leechedVisitHandler
{
  return self->_leechedVisitHandler;
}

- (id)leechedLowConfidenceVisitHandler
{
  return self->_leechedLowConfidenceVisitHandler;
}

- (void)createConnection
{
  uint64_t v3 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__RTRoutineManager_createConnection__block_invoke;
  block[3] = &unk_1E5D73B90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 withHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[RTRoutineManager fetchLocationOfInterestAtLocation:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 1878;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 withHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:]";
      __int16 v17 = 1024;
      int v18 = 1926;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke;
  v13[3] = &unk_1E5D73C30;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_2;
  v10[3] = &unk_1E5D74148;
  id v11 = v14;
  int64_t v12 = a3;
  id v9 = v14;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v10];
}

- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 withHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[RTRoutineManager fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 1423;
      _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke;
  v25[3] = &unk_1E5D73C30;
  id v26 = v14;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke_2;
  v20[3] = &unk_1E5D73F28;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v26;
  id v16 = v26;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v25 taskBlock:v20];
}

- (void)launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__RTRoutineManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke;
  block[3] = &unk_1E5D73BB8;
  SEL v18 = a3;
  unint64_t v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchNextPredictedLocationsOfInterestFromLocation:*(void *)(a1 + 32) startDate:*(void *)(a1 + 40) timeInterval:*(void *)(a1 + 48) reply:*(double *)(a1 + 56)];
}

uint64_t __60__RTRoutineManager_startMonitoringVehicleEventsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 startMonitoringVehicleEventsWithReply:&__block_literal_global_484];
}

uint64_t __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchPlaceInferencesWithOptions:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

uint64_t __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)defaultManager
{
  if (qword_1EB472160 != -1) {
    dispatch_once(&qword_1EB472160, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_7;
  return v2;
}

uint64_t __36__RTRoutineManager_createConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createConnection];
}

uint64_t __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __34__RTRoutineManager_defaultManager__block_invoke()
{
  _MergedGlobals_7 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (RTRoutineManager)init
{
  return [(RTRoutineManager *)self initWithRestorationIdentifier:0 targertUserSession:0];
}

uint64_t __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__RTRoutineManager_startMonitoringVehicleEventsWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVehicleEventsHandler:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_480 taskBlock:&__block_literal_global_482];
}

- (void)setVehicleEventsHandler:(id)a3
{
}

void __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a2;
  id v6 = [v4 distantFuture];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_3;
  v7[3] = &unk_1E5D73C58;
  id v8 = *(id *)(a1 + 40);
  [v5 fetchLocationsOfInterestVisitedBetweenStartDate:v3 endDate:v6 reply:v7];
}

void __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_3;
  v3[3] = &unk_1E5D73C58;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchLastVehicleEventsWithReply:v3];
}

void __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D73D98;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchRoutineModeFromLocation:v3 reply:v4];
}

uint64_t __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, 0);
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 withHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v13)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:]";
      __int16 v27 = 1024;
      int v28 = 1405;
      _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke;
  v23[3] = &unk_1E5D73C30;
  id v24 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke_2;
  v18[3] = &unk_1E5D73F00;
  id v19 = v11;
  id v20 = v12;
  double v22 = a5;
  id v21 = v24;
  id v15 = v24;
  id v16 = v12;
  id v17 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v23 taskBlock:v18];
}

void __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_393(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_2;
  v3[3] = &unk_1E5D73D20;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchRoutineEnabledWithReply:v3];
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 withHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v14 = (void (**)(id, void, id))a4;
  if (!v14)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:]";
      __int16 v25 = 1024;
      int v26 = 1941;
      _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    RTErrorInvalidParameterCreate(a2, @"sinceDate is required", v8, v9, v10, v11, v12, v13, v17);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v15);
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke;
  v21[3] = &unk_1E5D73C30;
  double v22 = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke_2;
  v18[3] = &unk_1E5D73CA8;
  id v19 = v7;
  id v20 = v22;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v18];

  id v15 = v22;
LABEL_8:
}

- (void)fetchLastVehicleEventsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[RTRoutineManager fetchLastVehicleEventsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 2342;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

- (void)fetchRoutineModeFromLocation:(id)a3 withHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      SEL v18 = "-[RTRoutineManager fetchRoutineModeFromLocation:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 1331;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

- (void)startMonitoringVehicleEventsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager startMonitoringVehicleEventsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 2497;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTRoutineManager_startMonitoringVehicleEventsWithHandler___block_invoke;
  block[3] = &unk_1E5D73F50;
  block[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (void)fetchRoutineStateWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager fetchRoutineStateWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 968;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke_393;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

- (void)fetchPlaceInferencesWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v15 = (void (**)(void, void, void))v8;
  if (!v8)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_7;
  }
  if (!v7)
  {
    uint64_t v16 = RTErrorInvalidParameterCreate(a2, @"options is required", v9, v10, v11, v12, v13, v14, v17);
    ((void (**)(void, void, NSObject *))v15)[2](v15, 0, v16);
LABEL_7:

    goto LABEL_8;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke;
  v21[3] = &unk_1E5D73C30;
  id v22 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke_2;
  v18[3] = &unk_1E5D73CA8;
  id v19 = v7;
  id v20 = v22;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v18];

LABEL_8:
}

+ (id)routineModeToString:(int64_t)a3
{
  uint64_t v3 = @"Unknown";
  if (a3 == 2) {
    uint64_t v3 = @"Tourist";
  }
  if (a3 == 1) {
    return @"Local";
  }
  else {
    return v3;
  }
}

+ (id)modeOfTransportationToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5D742C0[a3 - 1];
  }
}

- (RTRoutineManager)initWithRestorationIdentifier:(id)a3
{
  return [(RTRoutineManager *)self initWithRestorationIdentifier:a3 targertUserSession:0];
}

- (RTRoutineManager)initWithTargetUserSession:(BOOL)a3
{
  return [(RTRoutineManager *)self initWithRestorationIdentifier:0 targertUserSession:a3];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [(RTRoutineManager *)self xpcConnection];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)RTRoutineManager;
  [(RTRoutineManager *)&v5 dealloc];
}

void __37__RTRoutineManager__createConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = RTErrorConnectionCreate(*(const char **)(a1 + 32), @"%@", a3, a4, a5, a6, a7, a8, a2);
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v8;
    _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }
}

void __37__RTRoutineManager__createConnection__block_invoke_367(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "startMonitoringScenarioTriggerOfType:withHandler:", objc_msgSend(a2, "unsignedIntegerValue"), v5);
}

void __90__RTRoutineManager__launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  id v5 = v4;
  if (v4 != @"RTErrorDomain")
  {

LABEL_8:
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v16 = 138412802;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v3;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "%@, %@, running proxy error handler, %@", (uint8_t *)&v16, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 8 || !*(void *)(a1 + 56)) {
    goto LABEL_8;
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v11 = *(void *)(a1 + 56) - 1;
    int v16 = 138412802;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_INFO, "%@ retrying, %@, count, %lu", (uint8_t *)&v16, 0x20u);
  }
  [*(id *)(a1 + 32) launchTaskWithSelector:*(void *)(a1 + 64) remainingAttempts:*(void *)(a1 + 56) - 1 proxyErrorHandler:*(void *)(a1 + 40) taskBlock:*(void *)(a1 + 48)];
LABEL_11:
}

void __77__RTRoutineManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = RTErrorConnectionCreate(*(const char **)(a1 + 48), @"%@", a3, a4, a5, a6, a7, a8, a2);
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v9;
    _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }
}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v17 = (void (**)(id, void, id))a5;
  if (v17)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    __int16 v20 = @"startDate is required";
LABEL_10:
    RTErrorInvalidParameterCreate(a2, v20, v11, v12, v13, v14, v15, v16, v21[0]);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v18);
    goto LABEL_11;
  }
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v28 = "-[RTRoutineManager fetchTransitionsBetweenStartDate:endDate:handler:]";
    __int16 v29 = 1024;
    int v30 = 819;
    _os_log_error_impl(&dword_1A8FEF000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (!v10)
  {
    __int16 v20 = @"endDate is required";
    goto LABEL_10;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
  v25[3] = &unk_1E5D73C30;
  int v26 = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = (uint64_t)__69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2;
  v21[3] = (uint64_t)&unk_1E5D73C80;
  id v22 = v9;
  id v23 = v10;
  id v24 = v26;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v25 taskBlock:v21];

  id v18 = v26;
LABEL_11:
}

uint64_t __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_3;
  v5[3] = &unk_1E5D73C58;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchTransitionsBetweenStartDate:v3 endDate:v4 reply:v5];
}

uint64_t __69__RTRoutineManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTRoutineManager fetchTripSegmentsWithOptions:handler:]";
      __int16 v20 = 1024;
      int v21 = 845;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchTripSegmentsWithOptions.", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke;
  v16[3] = &unk_1E5D73C30;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_2;
  v13[3] = &unk_1E5D73CA8;
  id v14 = v7;
  id v15 = v17;
  id v11 = v17;
  id v12 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];
}

uint64_t __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchTripSegmentsWithOptions:v3 reply:v4];
}

uint64_t __57__RTRoutineManager_fetchTripSegmentsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTRoutineManager fetchLocationsCountForTripSegmentWithOptions:handler:]";
      __int16 v20 = 1024;
      int v21 = 866;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchLocationsForTripSegment.", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke;
  v16[3] = &unk_1E5D73C30;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_2;
  v13[3] = &unk_1E5D73CA8;
  id v14 = v7;
  id v15 = v17;
  id v11 = v17;
  id v12 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];
}

uint64_t __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73CD0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLocationsCountForTripSegmentWithOptions:v3 reply:v4];
}

uint64_t __73__RTRoutineManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTRoutineManager fetchLocationsForTripSegmentWithOptions:handler:]";
      __int16 v20 = 1024;
      int v21 = 885;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchLocationsForTripSegmentWithOptions.", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke;
  v16[3] = &unk_1E5D73C30;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_2;
  v13[3] = &unk_1E5D73CA8;
  id v14 = v7;
  id v15 = v17;
  id v11 = v17;
  id v12 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];
}

uint64_t __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLocationsForTripSegmentWithOptions:v3 reply:v4];
}

uint64_t __68__RTRoutineManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTRoutineManager deleteTripSegmentWithUUID:handler:]";
      __int16 v20 = 1024;
      int v21 = 903;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked deleteTripSegmentWithUUID.", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke;
  v16[3] = &unk_1E5D73C30;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_2;
  v13[3] = &unk_1E5D73CA8;
  id v14 = v7;
  id v15 = v17;
  id v11 = v17;
  id v12 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];
}

uint64_t __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 deleteTripSegmentWithUUID:v3 reply:v4];
}

uint64_t __54__RTRoutineManager_deleteTripSegmentWithUUID_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTRoutineManager fetchTripSegmentMetadataWithOptions:handler:]";
      __int16 v20 = 1024;
      int v21 = 920;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchTripSegmentMetadataWithOptions.", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke;
  v16[3] = &unk_1E5D73C30;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_2;
  v13[3] = &unk_1E5D73CA8;
  id v14 = v7;
  id v15 = v17;
  id v11 = v17;
  id v12 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];
}

uint64_t __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73CF8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchTripSegmentMetadataWithOptions:v3 reply:v4];
}

uint64_t __64__RTRoutineManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVehiclesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTRoutineManager fetchVehiclesWithOptions:handler:]";
      __int16 v20 = 1024;
      int v21 = 938;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchVehiclesWithOptions.", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke;
  v16[3] = &unk_1E5D73C30;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_2;
  v13[3] = &unk_1E5D73CA8;
  id v14 = v7;
  id v15 = v17;
  id v11 = v17;
  id v12 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v16 taskBlock:v13];
}

uint64_t __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchVehiclesWithOptions:v3 reply:v4];
}

uint64_t __53__RTRoutineManager_fetchVehiclesWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRoutineEnabledWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[RTRoutineManager fetchRoutineEnabledWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 954;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_391;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

void __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Unable to determine if CoreRoutine is enabled, returning enabled, NO, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_391(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_2;
  v3[3] = &unk_1E5D73D20;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchRoutineEnabledWithReply:v3];
}

uint64_t __51__RTRoutineManager_fetchRoutineEnabledWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__RTRoutineManager_fetchRoutineStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Unable to determine CoreRoutine's state, returning state, RTRoutineStateUnknown, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRoutineEnabled:(BOOL)a3
{
}

- (void)setRoutineEnabled:(BOOL)a3 withHandler:(id)a4
{
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke;
  v12[3] = &unk_1E5D73C30;
  id v13 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_2;
  v9[3] = &unk_1E5D73D70;
  BOOL v11 = a3;
  id v10 = v13;
  id v8 = v13;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v12 taskBlock:v9];
}

uint64_t __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D73C30;
  id v5 = *(id *)(a1 + 32);
  [a2 setRoutineEnabled:v3 reply:v4];
}

uint64_t __50__RTRoutineManager_setRoutineEnabled_withHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 domain];
  if ([v3 isEqualToString:@"RTErrorDomain"]) {
    [v6 code];
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)clearRoutineWithHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__RTRoutineManager_clearRoutineWithHandler___block_invoke;
  v9[3] = &unk_1E5D73C30;
  id v10 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_2;
  v7[3] = &unk_1E5D73D48;
  id v8 = v10;
  id v6 = v10;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

uint64_t __44__RTRoutineManager_clearRoutineWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_3;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 clearRoutineWithReply:v3];
}

uint64_t __44__RTRoutineManager_clearRoutineWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 domain];
  if ([v3 isEqualToString:@"RTErrorDomain"]) {
    [v6 code];
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)fetchCloudSyncAuthorizationState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager fetchCloudSyncAuthorizationState:]";
      __int16 v14 = 1024;
      int v15 = 1029;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_3;
  v3[3] = &unk_1E5D73D98;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchCloudSyncAuthorizationStateWithReply:v3];
}

uint64_t __53__RTRoutineManager_fetchCloudSyncAuthorizationState___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [v8 domain];
  if ([v5 isEqualToString:@"RTErrorDomain"]) {
    [v8 code];
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
  return MEMORY[0x1F4181820]();
}

- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[RTRoutineManager updateCloudSyncProvisionedForAccount:handler:]";
      __int16 v17 = 1024;
      int v18 = 1051;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke;
  v13[3] = &unk_1E5D73C30;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2;
  v10[3] = &unk_1E5D73D70;
  BOOL v12 = a3;
  id v11 = v14;
  id v9 = v14;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v13 taskBlock:v10];
}

uint64_t __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C30;
  id v5 = *(id *)(a1 + 32);
  [a2 updateCloudSyncProvisionedForAccount:v3 reply:v4];
}

uint64_t __65__RTRoutineManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 domain];
  if ([v3 isEqualToString:@"RTErrorDomain"]) {
    [v6 code];
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)fetchRemoteStatusWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke;
    v9[3] = &unk_1E5D73C30;
    id v10 = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_2;
    v7[3] = &unk_1E5D73D48;
    id v8 = v10;
    [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
  }
}

uint64_t __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_3;
  v3[3] = &unk_1E5D73D98;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchRemoteStatusWithReply:v3];
}

uint64_t __49__RTRoutineManager_fetchRemoteStatusWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v18 = "-[RTRoutineManager fetchLookbackWindowStartDateWithLocation:handler:]";
      __int16 v19 = 1024;
      int v20 = 1093;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

void __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
    id v4 = a2;
    id v5 = [v3 date];
    (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);
  }
}

void __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_3;
  v4[3] = &unk_1E5D73DC0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLookbackWindowStartDateWithLocation:v3 reply:v4];
}

uint64_t __69__RTRoutineManager_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchLookbackWindowStartDateWithHandler:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(id)a3 usingBlock:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  if (v8)
  {
    if (v7)
    {
      id v9 = [(RTRoutineManager *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke;
      block[3] = &unk_1E5D73E38;
      block[4] = self;
      SEL v24 = a2;
      id v22 = v8;
      id v23 = &v25;
      id v21 = v7;
      dispatch_sync(v9, block);
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      int v30 = @"options is required";
      int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v16 = [v14 errorWithDomain:@"RTErrorDomain" code:7 userInfo:v15];

      __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        SEL v32 = v19;
        __int16 v33 = 2112;
        id v34 = v16;
        _os_log_error_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      (*((void (**)(id, void, void *, uint64_t *))v8 + 2))(v8, 0, v16, v26 + 3);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"block is required";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    BOOL v12 = [v10 errorWithDomain:@"RTErrorDomain" code:7 userInfo:v11];

    id v13 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      SEL v32 = v18;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_error_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v25, 8);
}

void __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_2;
  v41[3] = &unk_1E5D73DE8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v42 = v4;
  uint64_t v43 = v5;
  id v6 = [v2 _proxyForServicingSelector:v3 asynchronous:0 withErrorHandler:v41];
  if (!v6)
  {
    int v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    v51[0] = @"daemonProxy was nil";
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    id v22 = [v20 errorWithDomain:@"RTErrorDomain" code:0 userInfo:v21];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_22;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy_;
  objc_super v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x3032000000;
  SEL v32 = __Block_byref_object_copy_;
  __int16 v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  aClass = (objc_class *)[*(id *)(a1 + 40) enumeratedType];
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  do
  {
    id v7 = (void *)MEMORY[0x1AD0EBD40]();
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromClass(aClass);
      id v16 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [*(id *)(a1 + 40) batchSize];
      uint64_t v18 = v26[3];
      *(_DWORD *)buf = 138412802;
      v45 = v16;
      __int16 v46 = 2048;
      uint64_t v47 = v17;
      __int16 v48 = 2048;
      uint64_t v49 = v18;
      _os_log_debug_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_DEBUG, "iterating objects of type, %@, batch size, %lu, offset, %lu", buf, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [NSNumber numberWithUnsignedInteger:v26[3]];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_405;
    v24[3] = &unk_1E5D73E10;
    v24[4] = &v35;
    v24[5] = &v29;
    v24[6] = &v25;
    [v6 fetchEnumerableObjectsWithOptions:v9 offset:v10 reply:v24];

    if (v30[5])
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v30[5];
        *(_DWORD *)buf = 138412546;
        v45 = aClass;
        __int16 v46 = 2112;
        uint64_t v47 = v19;
        _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "received error while fetching stored of type %@, %@, breaking out.", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
    if (![(id)v36[5] count])
    {
      BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = aClass;
        id v13 = v12;
        id v14 = "no more stored objects of type %@ to enumerate, breaking out.";
        goto LABEL_15;
      }
LABEL_16:

LABEL_17:
      char v15 = 0;
      goto LABEL_18;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = aClass;
        id v13 = v12;
        id v14 = "client set stop bit while enumerating stored objects of type %@, breaking out.";
LABEL_15:
        _os_log_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    char v15 = 1;
LABEL_18:
  }
  while ((v15 & 1) != 0);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
LABEL_22:
}

void __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "received error while getting synchronous proxy to enumerate stored locations, %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__RTRoutineManager_enumerateObjectsWithOptions_usingBlock___block_invoke_405(void *a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  if (v8) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v8 unsignedIntegerValue];
  }
}

- (void)enumerateStoredLocationsWithOptions:(id)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(RTRoutineManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__RTRoutineManager_enumerateStoredLocationsWithOptions_usingBlock___block_invoke;
    block[3] = &unk_1E5D73E60;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_sync(v8, block);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[RTRoutineManager enumerateStoredLocationsWithOptions:usingBlock:]";
      __int16 v20 = 1024;
      int v21 = 1209;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block (in %s:%d)", buf, 0x12u);
    }

    uint64_t v16 = *MEMORY[0x1E4F28568];
    uint64_t v17 = @"An enumeration block is a required parameter.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTErrorDomain" code:7 userInfo:v10];
    BOOL v12 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "An enumeration block is a required parameter, %@", buf, 0xCu);
    }
  }
}

uint64_t __67__RTRoutineManager_enumerateStoredLocationsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateStoredLocationsWithOptions:*(void *)(a1 + 40) usingBlock:*(void *)(a1 + 48)];
}

- (void)_enumerateStoredLocationsWithOptions:(id)a3 usingBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTRoutineManager _enumerateStoredLocationsWithOptions:usingBlock:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1229;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block (in %s:%d)", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke;
  v18[3] = &unk_1E5D73DE8;
  id v19 = v8;
  __int16 v20 = buf;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_410;
  v12[3] = &unk_1E5D73EB0;
  id v10 = v7;
  id v13 = v10;
  id v14 = self;
  uint64_t v16 = buf;
  SEL v17 = a2;
  id v11 = v19;
  id v15 = v11;
  [(RTRoutineManager *)self _launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v18 taskBlock:v12];

  _Block_object_dispose(buf, 8);
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "received error while getting asynchronous proxy to enumerate stored locations, %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_410(uint64_t a1, void *a2)
{
  v111[1] = *MEMORY[0x1E4F143B8];
  id v83 = a2;
  uint64_t v85 = a1;
  v84 = [[RTStoredLocationEnumerationContext alloc] initWithEnumerationOptions:*(void *)(a1 + 32)];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (const char *)[@"fetchLocationsHelperQueue" UTF8String];
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), @"fetchLocationsHelperQueue"];
    id v4 = (const char *)[v5 UTF8String];
  }
  dispatch_queue_t v81 = dispatch_queue_create(v4, v3);

  id v6 = [*(id *)(v85 + 40) xpcConnection];
  uint64_t v7 = [v6 _queue];
  id v8 = [*(id *)(v85 + 40) queue];

  if (v7 != v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v73 = NSStringFromSelector(*(SEL *)(v85 + 64));
      *(_DWORD *)v107 = 138412802;
      *(void *)&v107[4] = v73;
      *(_WORD *)&v107[12] = 2080;
      *(void *)&v107[14] = "-[RTRoutineManager _enumerateStoredLocationsWithOptions:usingBlock:]_block_invoke";
      *(_WORD *)&v107[22] = 1024;
      LODWORD(v108) = 1246;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "%@ XPC Connection wasn't to use self.queue. (in %s:%d)", v107, 0x1Cu);
    }
  }
  id v10 = [*(id *)(v85 + 40) xpcConnection];
  [v10 _setQueue:v81];

  *(void *)v107 = 0;
  *(void *)&v107[8] = v107;
  *(void *)&v107[16] = 0x3032000000;
  v108 = __Block_byref_object_copy_;
  v109 = __Block_byref_object_dispose_;
  id v110 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = (id *)&v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy_;
  v98 = __Block_byref_object_dispose_;
  id v99 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy_;
  uint64_t v92 = __Block_byref_object_dispose_;
  id v93 = 0;
  if (([*(id *)(v85 + 32) downsampleRequired] & 1) == 0)
  {
    int v30 = 0;
    uint64_t v82 = *MEMORY[0x1E4F28568];
    while (1)
    {
      uint64_t v31 = (void *)MEMORY[0x1AD0EBD40]();
      SEL v32 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v61 = [(RTStoredLocationEnumerationContext *)v84 options];
        v62 = [v61 dateInterval];
        v63 = [(RTStoredLocationEnumerationContext *)v84 options];
        [v63 horizontalAccuracy];
        uint64_t v65 = v64;
        uint64_t v66 = [(RTStoredLocationEnumerationContext *)v84 options];
        uint64_t v67 = [v66 batchSize];
        uint64_t v68 = [(RTStoredLocationEnumerationContext *)v84 offset];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v62;
        __int16 v101 = 2048;
        uint64_t v102 = v65;
        __int16 v103 = 2048;
        uint64_t v104 = v67;
        __int16 v105 = 2048;
        uint64_t v106 = v68;
        _os_log_debug_impl(&dword_1A8FEF000, v32, OS_LOG_TYPE_DEBUG, "iterating stored locations between %@, horizontal accuracy, %lf, batch size, %lu, offset, %lu", buf, 0x2Au);
      }
      dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
      id v34 = (void *)v89[5];
      v89[5] = (uint64_t)v33;

      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_415;
      v86[3] = &unk_1E5D73E88;
      v86[4] = v107;
      v86[5] = &v94;
      v86[6] = &v88;
      [v83 fetchStoredLocationsWithContext:v84 reply:v86];
      uint64_t v35 = (id)v89[5];
      uint64_t v36 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v37 = dispatch_time(0, 5000000000);
      id v38 = v30;
      if (dispatch_semaphore_wait(v35, v37))
      {
        objc_super v39 = [MEMORY[0x1E4F1C9C8] now];
        [v39 timeIntervalSinceDate:v36];
        double v41 = v40;
        id v42 = objc_opt_new();
        uint64_t v43 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_715];
        v44 = [MEMORY[0x1E4F29060] callStackSymbols];
        v45 = [v44 filteredArrayUsingPredicate:v43];
        __int16 v46 = [v45 firstObject];

        [v42 submitToCoreAnalytics:v46 type:1 duration:v41];
        uint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1A8FEF000, v47, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        __int16 v48 = (void *)MEMORY[0x1E4F28C58];
        v111[0] = v82;
        *(void *)buf = @"semaphore wait timeout";
        uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v111 count:1];
        uint64_t v50 = [v48 errorWithDomain:@"RTErrorDomain" code:15 userInfo:v49];

        id v38 = v30;
        if (v50)
        {
          id v38 = v50;
        }
      }

      id v51 = v38;
      if (v51)
      {
        v52 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v51;
          _os_log_error_impl(&dword_1A8FEF000, v52, OS_LOG_TYPE_ERROR, "XPC timeout error while waiting for stored locations, %@.", buf, 0xCu);
        }

        objc_storeStrong(v95 + 5, v38);
      }
      (*(void (**)(void))(*(void *)(v85 + 48) + 16))();
      if (*(unsigned char *)(*(void *)(*(void *)(v85 + 56) + 8) + 24))
      {
        v53 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v54 = v53;
          v55 = "client set stop bit while enumerating stored locations, breaking out.";
LABEL_31:
          _os_log_impl(&dword_1A8FEF000, v54, OS_LOG_TYPE_INFO, v55, buf, 2u);
        }
      }
      else
      {
        if (v95[5])
        {
          v53 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            id v69 = v95[5];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v69;
            _os_log_error_impl(&dword_1A8FEF000, v53, OS_LOG_TYPE_ERROR, "received error while fetching stored locations, %@, breaking out.", buf, 0xCu);
          }
          goto LABEL_35;
        }
        if ([*(id *)(*(void *)&v107[8] + 40) count])
        {
          uint64_t v57 = [(RTStoredLocationEnumerationContext *)v84 offset];
          uint64_t v58 = [*(id *)(*(void *)&v107[8] + 40) count];
          v59 = [RTStoredLocationEnumerationContext alloc];
          v53 = [(RTStoredLocationEnumerationContext *)v84 options];
          uint64_t v60 = [(RTStoredLocationEnumerationContext *)v59 initWithEnumerationOptions:v53 offset:v58 + v57];

          char v56 = 1;
          v84 = (RTStoredLocationEnumerationContext *)v60;
          goto LABEL_36;
        }
        v53 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v54 = v53;
          v55 = "no more stored locations to enumerate, breaking out.";
          goto LABEL_31;
        }
      }
LABEL_35:
      char v56 = 0;
LABEL_36:

      int v30 = v51;
      if ((v56 & 1) == 0)
      {
        v70 = [*(id *)(v85 + 40) xpcConnection];
        uint64_t v71 = [*(id *)(v85 + 40) queue];
        [v70 _setQueue:v71];
        goto LABEL_48;
      }
    }
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v74 = [(RTStoredLocationEnumerationContext *)v84 options];
    v75 = [v74 dateInterval];
    uint64_t v76 = [(RTStoredLocationEnumerationContext *)v84 options];
    [v76 horizontalAccuracy];
    uint64_t v78 = v77;
    v79 = [(RTStoredLocationEnumerationContext *)v84 options];
    uint64_t v80 = [v79 batchSize];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v75;
    __int16 v101 = 2048;
    uint64_t v102 = v78;
    __int16 v103 = 2048;
    uint64_t v104 = v80;
    _os_log_debug_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_DEBUG, "fetching downsampled locations between %@, horizontal accuracy, %lf, output size, %lu", buf, 0x20u);
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = (void *)v89[5];
  v89[5] = (uint64_t)v12;

  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_414;
  v87[3] = &unk_1E5D73E88;
  v87[4] = v107;
  v87[5] = &v94;
  v87[6] = &v88;
  [v83 fetchStoredLocationsWithContext:v84 reply:v87];
  id v14 = (id)v89[5];
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_42;
  }
  SEL v17 = [MEMORY[0x1E4F1C9C8] now];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  __int16 v20 = objc_opt_new();
  int v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_715];
  char v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v23 = [v22 filteredArrayUsingPredicate:v21];
  SEL v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A8FEF000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  int v26 = (void *)MEMORY[0x1E4F28C58];
  v111[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v111 count:1];
  uint64_t v28 = [v26 errorWithDomain:@"RTErrorDomain" code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;
  }
  else
  {
LABEL_42:
    id v29 = 0;
  }

  id v51 = v29;
  if (v51)
  {
    v72 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v51;
      _os_log_error_impl(&dword_1A8FEF000, v72, OS_LOG_TYPE_ERROR, "XPC timeout error while waiting for stored locations, %@.", buf, 0xCu);
    }

    objc_storeStrong(v95 + 5, v29);
  }
  *(unsigned char *)(*(void *)(*(void *)(v85 + 56) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(v85 + 48) + 16))();
  v70 = [*(id *)(v85 + 40) xpcConnection];
  uint64_t v71 = [*(id *)(v85 + 40) queue];
  [v70 _setQueue:v71];
LABEL_48:

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  _Block_object_dispose(v107, 8);
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_414(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void __68__RTRoutineManager__enumerateStoredLocationsWithOptions_usingBlock___block_invoke_415(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __61__RTRoutineManager_fetchRoutineModeFromLocation_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[RTRoutineManager fetchEstimatedLocationAtDate:handler:]";
    __int16 v21 = 1024;
    int v22 = 1348;
    _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[RTRoutineManager fetchEstimatedLocationAtDate:handler:]";
      __int16 v21 = 1024;
      int v22 = 1349;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke;
  v17[3] = &unk_1E5D73C30;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_2;
  v14[3] = &unk_1E5D73CA8;
  id v15 = v7;
  id v16 = v18;
  id v12 = v18;
  id v13 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

uint64_t __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_3;
  v4[3] = &unk_1E5D73ED8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchEstimatedLocationAtDate:v3 options:0 reply:v4];
}

uint64_t __57__RTRoutineManager_fetchEstimatedLocationAtDate_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "-[RTRoutineManager fetchEstimatedLocationAtDate:options:handler:]";
    __int16 v26 = 1024;
    int v27 = 1370;
    _os_log_error_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_7:
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[RTRoutineManager fetchEstimatedLocationAtDate:options:handler:]";
      __int16 v26 = 1024;
      int v27 = 1371;
      _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke;
  v22[3] = &unk_1E5D73C30;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_2;
  v18[3] = &unk_1E5D73C80;
  id v19 = v9;
  id v20 = v10;
  id v21 = v23;
  id v15 = v23;
  id v16 = v10;
  id v17 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v18];
}

uint64_t __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_3;
  v5[3] = &unk_1E5D73ED8;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchEstimatedLocationAtDate:v3 options:v4 reply:v5];
}

uint64_t __65__RTRoutineManager_fetchEstimatedLocationAtDate_options_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchNextPredictedLocationsOfInterestWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[RTRoutineManager fetchNextPredictedLocationsOfInterestWithHandler:]";
      __int16 v8 = 1024;
      int v9 = 1392;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }
  }
  [(RTRoutineManager *)self fetchNextPredictedLocationsOfInterestFromLocation:0 startDate:0 timeInterval:v4 withHandler:-1.0];
}

uint64_t __105__RTRoutineManager_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __111__RTRoutineManager_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 withHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTRoutineManager fetchPredictedLocationsOfInterestOnDate:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 1440;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

uint64_t __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchPredictedLocationsOfInterestOnDate:v3 reply:v4];
}

uint64_t __72__RTRoutineManager_fetchPredictedLocationsOfInterestOnDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMonitoringVisitsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager startMonitoringVisitsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1456;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke;
  block[3] = &unk_1E5D73F50;
  block[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisitHandler:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_2;
  v6[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_3;
  v4[3] = &unk_1E5D73D48;
  id v5 = *(id *)(a1 + 40);
  [v3 _launchTaskWithSelector:v2 remainingAttempts:3 proxyErrorHandler:v6 taskBlock:v4];
}

uint64_t __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_4;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 startMonitoringVisitsWithReply:v3];
}

uint64_t __53__RTRoutineManager_startMonitoringVisitsWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopMonitoringVisits
{
  id v4 = [(RTRoutineManager *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke;
  v5[3] = &unk_1E5D73F78;
  void v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visitHandler];
  [*(id *)(a1 + 32) setVisitHandler:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2;
  v8[3] = &unk_1E5D73C30;
  id v9 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke_418;
  v6[3] = &unk_1E5D73D48;
  id v7 = v9;
  id v5 = v9;
  [v4 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke_418(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2_419;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 stopMonitoringVisitsWithReply:v3];
}

void __40__RTRoutineManager_stopMonitoringVisits__block_invoke_2_419(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

- (void)onVisit:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(RTRoutineManager *)self visitHandler];

  if (v7)
  {
    uint64_t v8 = [(RTRoutineManager *)self visitHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)startLeechingVisitsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager startLeechingVisitsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1507;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke;
  block[3] = &unk_1E5D73F50;
  block[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLeechedVisitHandler:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_2;
  v6[3] = &unk_1E5D73C30;
  id v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_3;
  v4[3] = &unk_1E5D73D48;
  id v5 = *(id *)(a1 + 40);
  [v3 _launchTaskWithSelector:v2 remainingAttempts:3 proxyErrorHandler:v6 taskBlock:v4];
}

uint64_t __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_4;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 startLeechingVisitsWithReply:v3];
}

uint64_t __51__RTRoutineManager_startLeechingVisitsWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopLeechingVisits
{
  id v4 = [(RTRoutineManager *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke;
  v5[3] = &unk_1E5D73F78;
  void v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) leechedVisitHandler];
  [*(id *)(a1 + 32) setLeechedVisitHandler:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke_2;
  v8[3] = &unk_1E5D73C30;
  id v9 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke_420;
  v6[3] = &unk_1E5D73D48;
  id v7 = v9;
  id v5 = v9;
  [v4 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke_420(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__RTRoutineManager_stopLeechingVisits__block_invoke_2_421;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 stopLeechingVisitsWithReply:v3];
}

void __38__RTRoutineManager_stopLeechingVisits__block_invoke_2_421(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

- (void)onLeechedVisit:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(RTRoutineManager *)self leechedVisitHandler];

  if (v7)
  {
    uint64_t v8 = [(RTRoutineManager *)self leechedVisitHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)startLeechingLowConfidenceVisitsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager startLeechingLowConfidenceVisitsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1559;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke;
  block[3] = &unk_1E5D73F50;
  block[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLeechedLowConfidenceVisitHandler:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_2;
  v6[3] = &unk_1E5D73C30;
  id v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_3;
  v4[3] = &unk_1E5D73D48;
  id v5 = *(id *)(a1 + 40);
  [v3 _launchTaskWithSelector:v2 remainingAttempts:3 proxyErrorHandler:v6 taskBlock:v4];
}

uint64_t __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_4;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 startLeechingLowConfidenceVisitsWithReply:v3];
}

uint64_t __64__RTRoutineManager_startLeechingLowConfidenceVisitsWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopLeechingLowConfidenceVisits
{
  id v4 = [(RTRoutineManager *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke;
  v5[3] = &unk_1E5D73F78;
  void v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) leechedLowConfidenceVisitHandler];
  [*(id *)(a1 + 32) setLeechedLowConfidenceVisitHandler:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2;
  v8[3] = &unk_1E5D73C30;
  id v9 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_422;
  v6[3] = &unk_1E5D73D48;
  id v7 = v9;
  id v5 = v9;
  [v4 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching low confidence visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_422(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2_423;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 stopLeechingLowConfidenceVisitsWithReply:v3];
}

void __51__RTRoutineManager_stopLeechingLowConfidenceVisits__block_invoke_2_423(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping leeching low confidence visits, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

- (void)onLeechedLowConfidenceVisit:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(RTRoutineManager *)self leechedLowConfidenceVisitHandler];

  if (v7)
  {
    uint64_t v8 = [(RTRoutineManager *)self leechedLowConfidenceVisitHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)startMonitoringPlaceInferencesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTRoutineManager startMonitoringPlaceInferencesWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 1614;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = [(RTRoutineManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke;
  v13[3] = &unk_1E5D73FA0;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  SEL v16 = a2;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v13);
}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaceInferenceOptions:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPlaceInferencesHandler:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2;
  v7[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_424;
  v4[3] = &unk_1E5D73CA8;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:v7 taskBlock:v4];
}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while starting to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_424(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2_425;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 startMonitoringPlaceInferencesWithOptions:v3 reply:v4];
}

void __70__RTRoutineManager_startMonitoringPlaceInferencesWithOptions_handler___block_invoke_2_425(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while starting to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)stopMonitoringPlaceInferences
{
  id v4 = [(RTRoutineManager *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke;
  v5[3] = &unk_1E5D73F78;
  void v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) placeInferencesHandler];
  [*(id *)(a1 + 32) setPlaceInferencesHandler:0];
  [*(id *)(a1 + 32) setPlaceInferenceOptions:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2;
  v8[3] = &unk_1E5D73C30;
  id v9 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_426;
  v6[3] = &unk_1E5D73D48;
  id v7 = v9;
  id v5 = v9;
  [v4 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_426(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2_427;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 stopMonitoringPlaceInferencesWithReply:v3];
}

void __49__RTRoutineManager_stopMonitoringPlaceInferences__block_invoke_2_427(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping to monitor place inferences, error, %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
}

- (void)onPlaceInferences:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(RTRoutineManager *)self placeInferencesHandler];

  if (v7)
  {
    uint64_t v8 = [(RTRoutineManager *)self placeInferencesHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke;
  v14[3] = &unk_1E5D73C30;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_2;
  v11[3] = &unk_1E5D73FC8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

uint64_t __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchStoredVisitsWithOptions:v3 reply:v4];
}

uint64_t __57__RTRoutineManager_fetchStoredVisitsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processHindsightVisitsWithHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke;
  v9[3] = &unk_1E5D73C30;
  id v10 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke_2;
  v7[3] = &unk_1E5D73FF0;
  id v8 = v10;
  id v6 = v10;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

uint64_t __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__RTRoutineManager_processHindsightVisitsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 processHindsightVisitsWithReply:*(void *)(a1 + 32)];
}

uint64_t __60__RTRoutineManager_fetchPlaceInferencesWithOptions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke;
    v10[3] = &unk_1E5D73C30;
    id v11 = v5;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke_2;
    v8[3] = &unk_1E5D73D48;
    id v9 = v11;
    [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];

    id v7 = v11;
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__RTRoutineManager_fetchFormattedPostalAddressesFromMeCard___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fetchFormattedPostalAddressesFromMeCard:*(void *)(a1 + 32)];
}

- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTRoutineManager fetchPathToDiagnosticFilesWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 1739;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_2;
  v12[3] = &unk_1E5D73FC8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

uint64_t __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D74018;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchPathToDiagnosticFilesWithOptions:v3 reply:v4];
}

void __66__RTRoutineManager_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = [v5 domain];
  if ([v6 isEqualToString:@"RTErrorDomain"]) {
    [v5 code];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 withHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[RTRoutineManager startMonitoringScenarioTriggerOfType:withHandler:]";
      __int16 v17 = 1024;
      int v18 = 1760;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = [(RTRoutineManager *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke;
  v11[3] = &unk_1E5D74090;
  void v11[4] = self;
  id v12 = v7;
  unint64_t v13 = a3;
  SEL v14 = a2;
  id v10 = v7;
  dispatch_async(v9, v11);
}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 120) startMonitoringForScenarioTriggerTypes:*(void *)(a1 + 48) handler:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_2;
  v10[3] = &unk_1E5D74040;
  void v10[4] = v3;
  id v11 = *(id *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_3;
  v7[3] = &unk_1E5D74068;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  void v7[4] = v6;
  id v8 = v5;
  [v3 _launchTaskWithSelector:v4 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v7];
}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 120) registered]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_3(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_4;
  v5[3] = &unk_1E5D74040;
  id v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  void v5[4] = a1[4];
  id v6 = v3;
  [a2 startMonitoringScenarioTriggerOfType:v4 reply:v5];
}

uint64_t __69__RTRoutineManager_startMonitoringScenarioTriggerOfType_withHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 120) registered];
  if (v5 && v3) {
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return MEMORY[0x1F41817F8](v3);
}

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3
{
  id v6 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke;
  block[3] = &unk_1E5D740F8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a2;
  dispatch_async(v6, block);
}

uint64_t __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 120) stopMonitoringForScenarioTriggerTypes:a1[5]];
  uint64_t v3 = a1[6];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_431;
  v6[3] = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v4 = (void *)a1[4];
  void v6[4] = a1[5];
  return [v4 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_430 taskBlock:v6];
}

void __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1A8FEF000, v3, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for scenario triggers, error, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_431(uint64_t a1, void *a2)
{
  return [a2 stopMonitoringScenarioTriggerOfType:*(void *)(a1 + 32) reply:&__block_literal_global_434];
}

void __56__RTRoutineManager_stopMonitoringScenarioTriggerOfType___block_invoke_2_432(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1A8FEF000, v3, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for scenario triggers, error, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)onScenarioTrigger:(id)a3 withError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    scenarioTriggerRegistrant = self->_scenarioTriggerRegistrant;
    id v10 = a3;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];
    -[RTRoutineManagerRegistrantScenarioTrigger onScenarioTriggers:error:](scenarioTriggerRegistrant, "onScenarioTriggers:error:", v9, v7, v10, v11);
  }
}

- (void)fetchMonitoredScenarioTriggerTypesWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v13 = "-[RTRoutineManager fetchMonitoredScenarioTriggerTypesWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1811;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_3;
  v3[3] = &unk_1E5D73CD0;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchMonitoredScenarioTriggerTypesWithReply:v3];
}

uint64_t __66__RTRoutineManager_fetchMonitoredScenarioTriggerTypesWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[RTRoutineManager fetchPredictedExitDatesFromLocation:onDate:withHandler:]";
      __int16 v24 = 1024;
      int v25 = 1828;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke;
  v20[3] = &unk_1E5D73C30;
  id v21 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2;
  v16[3] = &unk_1E5D73C80;
  id v17 = v9;
  id v18 = v10;
  id v19 = v21;
  id v13 = v21;
  id v14 = v10;
  id v15 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];
}

uint64_t __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_3;
  v5[3] = &unk_1E5D73C58;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchPredictedExitDatesFromLocation:v3 onDate:v4 reply:v5];
}

uint64_t __75__RTRoutineManager_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[RTRoutineManager fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:]";
      __int16 v24 = 1024;
      int v25 = 1845;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke;
  v20[3] = &unk_1E5D73C30;
  id v21 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_2;
  v16[3] = &unk_1E5D73C80;
  id v17 = v9;
  id v18 = v10;
  id v19 = v21;
  id v13 = v21;
  id v14 = v10;
  id v15 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];
}

uint64_t __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_3;
  v5[3] = &unk_1E5D73C58;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchPredictedLocationsOfInterestBetweenStartDate:v3 endDate:v4 reply:v5];
}

uint64_t __90__RTRoutineManager_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 withHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTRoutineManager fetchLocationOfInterestWithIdentifier:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 1863;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

uint64_t __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D74120;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLocationOfInterestWithIdentifier:v3 reply:v4];
}

uint64_t __70__RTRoutineManager_fetchLocationOfInterestWithIdentifier_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__RTRoutineManager_fetchLocationOfInterestAtLocation_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestForRegion:(id)a3 withHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTRoutineManager fetchLocationOfInterestForRegion:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 1893;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

uint64_t __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D74120;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLocationOfInterestForRegion:v3 reply:v4];
}

uint64_t __65__RTRoutineManager_fetchLocationOfInterestForRegion_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 withHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:]";
      __int16 v22 = 1024;
      int v23 = 1910;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke;
  v18[3] = &unk_1E5D73C30;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_2;
  v14[3] = &unk_1E5D74068;
  double v17 = a3;
  id v15 = v9;
  id v16 = v19;
  id v12 = v19;
  id v13 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v18 taskBlock:v14];
}

uint64_t __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_3;
  v5[3] = &unk_1E5D73C58;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 fetchLocationsOfInterestWithinDistance:v4 ofLocation:v5 reply:v3];
}

uint64_t __82__RTRoutineManager_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__RTRoutineManager_fetchLocationsOfInterestOfType_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__RTRoutineManager_fetchLocationsOfInterestVisitedSinceDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v17 = a5;
  if (v17)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_9:
    id v18 = @"startDate is required";
    goto LABEL_11;
  }
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[RTRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 1963;
    _os_log_error_impl(&dword_1A8FEF000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  if (!v9) {
    goto LABEL_9;
  }
LABEL_3:
  if (v10)
  {
    if ([v9 compare:v10] != 1)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke;
      v25[3] = &unk_1E5D73C30;
      id v26 = v17;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = (uint64_t)__88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_2;
      v21[3] = (uint64_t)&unk_1E5D73C80;
      id v22 = v9;
      id v23 = v10;
      id v24 = v26;
      [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v25 taskBlock:v21];

      id v20 = v26;
      goto LABEL_12;
    }
    id v18 = @"endDate must be greater than or equal to startDate";
  }
  else
  {
    id v18 = @"endDate is required";
  }
LABEL_11:
  RTErrorInvalidParameterCreate(a2, v18, v11, v12, v13, v14, v15, v16, v21[0]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))v17 + 2))(v17, 0, v20);
LABEL_12:
}

uint64_t __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_3;
  v5[3] = &unk_1E5D73C58;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchLocationsOfInterestVisitedBetweenStartDate:v3 endDate:v4 reply:v5];
}

uint64_t __88__RTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllLocationsOfInterestForSettingsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[RTRoutineManager fetchAllLocationsOfInterestForSettingsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 1993;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_3;
  v3[3] = &unk_1E5D73C58;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchAllLocationsOfInterestForSettingsWithReply:v3];
}

void __70__RTRoutineManager_fetchAllLocationsOfInterestForSettingsWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = [v5 domain];
  if ([v6 isEqualToString:@"RTErrorDomain"]) {
    [v5 code];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 withHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[RTRoutineManager fetchLocationsOfInterestAssociatedToIdentifier:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 2011;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

uint64_t __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchLocationsOfInterestAssociatedToIdentifier:v3 reply:v4];
}

uint64_t __79__RTRoutineManager_fetchLocationsOfInterestAssociatedToIdentifier_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addLocationOfInterestOfType:(int64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke;
  v22[3] = &unk_1E5D73C30;
  id v23 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_2;
  v17[3] = &unk_1E5D73F00;
  id v18 = v11;
  id v19 = v12;
  id v20 = v23;
  int64_t v21 = a3;
  id v14 = v23;
  id v15 = v12;
  id v16 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v22 taskBlock:v17];
}

uint64_t __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = (void *)MEMORY[0x1E4F646E0];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = [v4 mapItemStorageForGEOMapItem:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_3;
  v9[3] = &unk_1E5D74120;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v6 addLocationOfInterestOfType:v3 mapItemStorage:v7 customLabel:v8 reply:v9];
}

uint64_t __76__RTRoutineManager_addLocationOfInterestOfType_mapItem_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 mapItem:(id)a5 customLabel:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke;
  v27[3] = &unk_1E5D73C30;
  id v28 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_2;
  v21[3] = &unk_1E5D74170;
  id v25 = v28;
  int64_t v26 = a4;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  id v17 = v28;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v27 taskBlock:v21];
}

uint64_t __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = (void *)MEMORY[0x1E4F646E0];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  uint64_t v8 = [v4 mapItemStorageForGEOMapItem:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_3;
  v10[3] = &unk_1E5D74120;
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v7 updateLocationOfInterestWithIdentifier:v5 type:v3 mapItemStorage:v8 customLabel:v9 reply:v10];
}

uint64_t __92__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_mapItem_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke;
  v19[3] = &unk_1E5D73C30;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_2;
  v15[3] = &unk_1E5D73C80;
  id v16 = v9;
  id v17 = v10;
  id v18 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];
}

uint64_t __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F646E0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v3 mapItemStorageForGEOMapItem:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_3;
  v8[3] = &unk_1E5D73C30;
  id v9 = *(id *)(a1 + 48);
  [v6 updateLocationOfInterestWithIdentifier:v4 mapItemStorage:v7 reply:v8];
}

uint64_t __75__RTRoutineManager_updateLocationOfInterestWithIdentifier_mapItem_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v21 = "-[RTRoutineManager updateLocationOfInterestWithIdentifier:type:handler:]";
      __int16 v22 = 1024;
      int v23 = 2091;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke;
  v18[3] = &unk_1E5D73C30;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2;
  v14[3] = &unk_1E5D74068;
  id v16 = v19;
  int64_t v17 = a4;
  id v15 = v9;
  id v12 = v19;
  id v13 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v18 taskBlock:v14];
}

uint64_t __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_3;
  v5[3] = &unk_1E5D73C30;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 updateLocationOfInterestWithIdentifier:v4 type:v3 reply:v5];
}

uint64_t __72__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v23 = "-[RTRoutineManager updateLocationOfInterestWithIdentifier:customLabel:handler:]";
      __int16 v24 = 1024;
      int v25 = 2112;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke;
  v20[3] = &unk_1E5D73C30;
  id v21 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2;
  v16[3] = &unk_1E5D73C80;
  id v17 = v9;
  id v18 = v10;
  id v19 = v21;
  id v13 = v21;
  id v14 = v10;
  id v15 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v20 taskBlock:v16];
}

uint64_t __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_3;
  v5[3] = &unk_1E5D73C30;
  id v6 = *(id *)(a1 + 48);
  [a2 updateLocationOfInterestWithIdentifier:v3 customLabel:v4 reply:v5];
}

uint64_t __79__RTRoutineManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 customLabel:(id)a5 handler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "-[RTRoutineManager updateLocationOfInterestWithIdentifier:type:customLabel:handler:]";
      __int16 v27 = 1024;
      int v28 = 2134;
      _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke;
  v23[3] = &unk_1E5D73C30;
  id v24 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2;
  v18[3] = &unk_1E5D73F00;
  id v19 = v11;
  id v20 = v12;
  id v21 = v24;
  int64_t v22 = a4;
  id v15 = v24;
  id v16 = v12;
  id v17 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v23 taskBlock:v18];
}

uint64_t __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_3;
  v6[3] = &unk_1E5D73C30;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  [a2 updateLocationOfInterestWithIdentifier:v3 type:v5 customLabel:v4 reply:v6];
}

uint64_t __84__RTRoutineManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v15 = (void (**)(void, void))v8;
  if (v7)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke;
    v21[3] = &unk_1E5D73C30;
    id v22 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_2;
    v18[3] = &unk_1E5D73CA8;
    id v19 = v7;
    id v20 = v22;
    [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v18];
  }
  else if (v8)
  {
    id v16 = RTErrorInvalidParameterCreate(a2, @"Identifier must not be nil.", v9, v10, v11, v12, v13, v14, v17);
    ((void (**)(void, void *))v15)[2](v15, v16);
  }
}

uint64_t __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 removeLocationOfInterestWithIdentifier:v3 reply:v4];
}

uint64_t __67__RTRoutineManager_removeLocationOfInterestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke;
  v14[3] = &unk_1E5D73C30;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_2;
  v11[3] = &unk_1E5D73CA8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

uint64_t __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchDedupedLocationOfInterestIdentifiersWithIdentifier:v3 reply:v4];
}

uint64_t __84__RTRoutineManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 withHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke;
  v17[3] = &unk_1E5D73C30;
  id v18 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_2;
  v13[3] = &unk_1E5D74068;
  id v15 = v18;
  int64_t v16 = a3;
  id v14 = v9;
  id v11 = v18;
  id v12 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v13];
}

uint64_t __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_3;
  v5[3] = &unk_1E5D74198;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [a2 setHintForRegionState:v4 significantRegion:v3 reply:v5];
}

uint64_t __72__RTRoutineManager_setHintForRegionState_significantRegion_withHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v15 = (void (**)(void, void))v8;
  if (v7)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke;
    v21[3] = &unk_1E5D73C30;
    id v22 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_2;
    v18[3] = &unk_1E5D73CA8;
    id v19 = v7;
    id v20 = v22;
    [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v18];
  }
  else if (v8)
  {
    int64_t v16 = RTErrorInvalidParameterCreate(a2, @"Visit identifier must not be nil", v9, v10, v11, v12, v13, v14, v17);
    ((void (**)(void, void *))v15)[2](v15, v16);
  }
}

uint64_t __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 removeVisitWithIdentifier:v3 reply:v4];
}

uint64_t __54__RTRoutineManager_removeVisitWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)extendLifetimeOfVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v15 = (void (**)(void, void))v8;
  if (v7)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke;
    v21[3] = &unk_1E5D73C30;
    id v22 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_2;
    v18[3] = &unk_1E5D73CA8;
    id v19 = v7;
    id v20 = v22;
    [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v18];
  }
  else if (v8)
  {
    int64_t v16 = RTErrorInvalidParameterCreate(a2, @"visitIdentifier is required", v9, v10, v11, v12, v13, v14, v17);
    ((void (**)(void, void *))v15)[2](v15, v16);
  }
}

uint64_t __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [v3 setWithObject:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_3;
  v7[3] = &unk_1E5D73C30;
  id v8 = *(id *)(a1 + 40);
  [v5 extendLifetimeOfVisitsWithIdentifiers:v6 reply:v7];
}

uint64_t __64__RTRoutineManager_extendLifetimeOfVisitWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v15 = (void (**)(void, void))v8;
  if (v7)
  {
    if ([v7 count])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke;
      v21[3] = &unk_1E5D73C30;
      id v22 = v15;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_2;
      v18[3] = &unk_1E5D73CA8;
      id v19 = v7;
      id v20 = v22;
      [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v21 taskBlock:v18];
    }
    else if (v15)
    {
      v15[2](v15, 0);
    }
  }
  else if (v8)
  {
    int64_t v16 = RTErrorInvalidParameterCreate(a2, @"visitIdentifiers is required", v9, v10, v11, v12, v13, v14, v17);
    ((void (**)(void, void *))v15)[2](v15, v16);
  }
}

uint64_t __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 extendLifetimeOfVisitsWithIdentifiers:v3 reply:v4];
}

uint64_t __66__RTRoutineManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[RTRoutineManager fetchFamiliarityIndexResultsWithOptions:handler:]";
    __int16 v21 = 1024;
    int v22 = 2300;
    _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[RTRoutineManager fetchFamiliarityIndexResultsWithOptions:handler:]";
      __int16 v21 = 1024;
      int v22 = 2301;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke;
  v17[3] = &unk_1E5D73C30;
  id v18 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2;
  v14[3] = &unk_1E5D73CA8;
  id v15 = v7;
  id v16 = v18;
  id v12 = v18;
  id v13 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v14];
}

uint64_t __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchFamiliarityIndexResultsWithOptions:v3 reply:v4];
}

uint64_t __68__RTRoutineManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchAuthorizedLocationStatus:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager fetchAuthorizedLocationStatus:]";
      __int16 v14 = 1024;
      int v15 = 2322;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_3;
  v3[3] = &unk_1E5D741C0;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchAuthorizedLocationStatus:v3];
}

uint64_t __50__RTRoutineManager_fetchAuthorizedLocationStatus___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__RTRoutineManager_fetchLastVehicleEventsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4
{
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke;
  v19[3] = &unk_1E5D73C30;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_2;
  v15[3] = &unk_1E5D73C80;
  id v16 = v9;
  id v17 = v10;
  id v18 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];
}

uint64_t __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_3;
  v5[3] = &unk_1E5D73C30;
  id v6 = *(id *)(a1 + 48);
  [a2 vehicleEventAtLocation:v3 notes:v4 reply:v5];
}

uint64_t __57__RTRoutineManager_vehicleEventAtLocation_notes_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearAllVehicleEvents
{
}

- (void)clearAllVehicleEventsWithHandler:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke;
  v10[3] = &unk_1E5D741E8;
  SEL v12 = a2;
  id v11 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_458;
  v7[3] = &unk_1E5D74148;
  id v8 = v11;
  SEL v9 = a2;
  id v6 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v7];
}

void __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "%@ return error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_458(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_2;
  v5[3] = &unk_1E5D741E8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 clearAllVehicleEventsWithReply:v5];
}

void __53__RTRoutineManager_clearAllVehicleEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    long long v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "%@ return error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)clearAllVehicleEvents:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__RTRoutineManager_clearAllVehicleEvents___block_invoke;
  v9[3] = &unk_1E5D73C30;
  id v10 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_2;
  v7[3] = &unk_1E5D73D48;
  id v8 = v10;
  id v6 = v10;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v9 taskBlock:v7];
}

uint64_t __42__RTRoutineManager_clearAllVehicleEvents___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_3;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 clearAllVehicleEventsWithReply:v3];
}

uint64_t __42__RTRoutineManager_clearAllVehicleEvents___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__RTRoutineManager_updateVehicleEventWithIdentifier_notes___block_invoke_2;
  v11[3] = &unk_1E5D74210;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_460 taskBlock:v11];
}

uint64_t __59__RTRoutineManager_updateVehicleEventWithIdentifier_notes___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateVehicleEventWithIdentifier:*(void *)(a1 + 32) notes:*(void *)(a1 + 40) reply:&__block_literal_global_462];
}

- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__RTRoutineManager_updateVehicleEventWithIdentifier_photo___block_invoke_2;
  v11[3] = &unk_1E5D74210;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_464 taskBlock:v11];
}

uint64_t __59__RTRoutineManager_updateVehicleEventWithIdentifier_photo___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateVehicleEventWithIdentifier:*(void *)(a1 + 32) photo:*(void *)(a1 + 40) reply:&__block_literal_global_466];
}

- (void)updateVehicleEventWithIdentifier:(id)a3 geoMapItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__RTRoutineManager_updateVehicleEventWithIdentifier_geoMapItem___block_invoke_2;
  v11[3] = &unk_1E5D74210;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_468 taskBlock:v11];
}

void __64__RTRoutineManager_updateVehicleEventWithIdentifier_geoMapItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F646E0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [v3 mapItemStorageForGEOMapItem:v4];
  [v5 updateVehicleEventWithIdentifier:*(void *)(a1 + 40) geoMapItem:v6 reply:&__block_literal_global_470];
}

- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__RTRoutineManager_updateVehicleEventWithIdentifier_location___block_invoke_2;
  v11[3] = &unk_1E5D74210;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_472 taskBlock:v11];
}

uint64_t __62__RTRoutineManager_updateVehicleEventWithIdentifier_location___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateVehicleEventWithIdentifier:*(void *)(a1 + 32) location:*(void *)(a1 + 40) reply:&__block_literal_global_474];
}

- (void)engageInVehicleEventWithIdentifier:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTRoutineManager_engageInVehicleEventWithIdentifier___block_invoke_2;
  v7[3] = &unk_1E5D74238;
  id v8 = v5;
  id v6 = v5;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_476 taskBlock:v7];
}

uint64_t __55__RTRoutineManager_engageInVehicleEventWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 engageInVehicleEventWithIdentifier:*(void *)(a1 + 32) reply:&__block_literal_global_478];
}

- (void)onVehicleEvents:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(RTRoutineManager *)self vehicleEventsHandler];

  if (v7)
  {
    id v8 = [(RTRoutineManager *)self vehicleEventsHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)stopMonitoringVehicleEvents
{
  uint64_t v4 = [(RTRoutineManager *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__RTRoutineManager_stopMonitoringVehicleEvents__block_invoke;
  v5[3] = &unk_1E5D73F78;
  void v5[4] = self;
  void v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t __47__RTRoutineManager_stopMonitoringVehicleEvents__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVehicleEventsHandler:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _launchTaskWithSelector:v3 remainingAttempts:3 proxyErrorHandler:&__block_literal_global_486 taskBlock:&__block_literal_global_488];
}

uint64_t __47__RTRoutineManager_stopMonitoringVehicleEvents__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stopMonitoringVehicleEventsWithReply:&__block_literal_global_490];
}

- (void)fetchAutomaticVehicleEventDetectionSupportedWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager fetchAutomaticVehicleEventDetectionSupportedWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 2527;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_3;
  v3[3] = &unk_1E5D74198;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchAutomaticVehicleEventDetectionSupportedWithReply:v3];
}

uint64_t __76__RTRoutineManager_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5
{
}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 geoMapItem:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke;
  v27[3] = &unk_1E5D73C30;
  id v28 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_2;
  v21[3] = &unk_1E5D74170;
  id v25 = v28;
  unint64_t v26 = a4;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  id v17 = v28;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v27 taskBlock:v21];
}

uint64_t __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)MEMORY[0x1E4F646E0];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = a2;
  id v9 = [v6 mapItemStorageForGEOMapItem:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_3;
  v10[3] = &unk_1E5D73C30;
  id v11 = *(id *)(a1 + 56);
  [v8 userInteractionWithPredictedLocationOfInterest:v4 interaction:v3 feedback:v5 geoMapItem:v9 reply:v10];
}

uint64_t __107__RTRoutineManager_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startMonitoringForPeopleDiscovery:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[RTRoutineManager startMonitoringForPeopleDiscovery:handler:]";
    __int16 v21 = 1024;
    int v22 = 2583;
    _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[RTRoutineManager startMonitoringForPeopleDiscovery:handler:]";
      __int16 v21 = 1024;
      int v22 = 2584;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  [(RTRoutineManager *)self setPeopleDiscoveryErrorHandler:v9];
  id v12 = [(RTRoutineManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke;
  v15[3] = &unk_1E5D73FA0;
  void v15[4] = self;
  id v16 = v7;
  id v17 = v9;
  SEL v18 = a2;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v12, v15);
}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 112) startMonitoringForPeopleDiscovery:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v2;
      _os_log_error_impl(&dword_1A8FEF000, v3, OS_LOG_TYPE_ERROR, "Encountered error while starting monitoring for people discovery service, error, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 112) configurationIdentifier];
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(*(void *)(a1 + 32) + 112);
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_DEFAULT, "rdar122420473 _peopleDiscoveryRegistrant %@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_491;
    v17[3] = &unk_1E5D74040;
    void v17[4] = v7;
    uint64_t v8 = *(void *)(a1 + 56);
    id v18 = *(id *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_2;
    v12[3] = &unk_1E5D73F28;
    id v13 = v4;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = *(id *)(a1 + 48);
    id v11 = v4;
    [v7 _launchTaskWithSelector:v8 remainingAttempts:3 proxyErrorHandler:v17 taskBlock:v12];
  }
}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_491(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 112) registered]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_3;
  v6[3] = &unk_1E5D74040;
  uint64_t v5 = (void *)a1[7];
  void v6[4] = a1[6];
  id v7 = v5;
  [a2 startMonitoringForPeopleDiscovery:v3 configuration:v4 reply:v6];
}

void __62__RTRoutineManager_startMonitoringForPeopleDiscovery_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 112) registered]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)stopMonitoringForPeopleDiscoveryWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager stopMonitoringForPeopleDiscoveryWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 2616;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = [(RTRoutineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke;
  block[3] = &unk_1E5D73F50;
  block[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 112) stopMonitoringForPeopleDiscovery];
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      SEL v11 = v2;
      _os_log_error_impl(&dword_1A8FEF000, v3, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for people discovery service, error, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_492;
    v8[3] = &unk_1E5D73C30;
    id v5 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_493;
    v6[3] = &unk_1E5D73D48;
    id v7 = *(id *)(a1 + 40);
    [v5 _launchTaskWithSelector:v4 remainingAttempts:3 proxyErrorHandler:v8 taskBlock:v6];
  }
}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_492(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for people discovery service, error, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_493(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_2;
  v3[3] = &unk_1E5D73C30;
  id v4 = *(id *)(a1 + 32);
  [a2 stopMonitoringForPeopleDiscoveryWithReply:v3];
}

void __64__RTRoutineManager_stopMonitoringForPeopleDiscoveryWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "Encountered error while stopping monitoring for people discovery service, error, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onDensityUpdate:(id)a3 error:(id)a4
{
  if (a3) {
    [(RTRoutineManagerRegistrantPeopleDiscovery *)self->_peopleDiscoveryRegistrant onDensityUpdate:a3 error:a4];
  }
}

- (void)fetchCurrentPeopleDensity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTRoutineManager fetchCurrentPeopleDensity:]";
      __int16 v14 = 1024;
      int v15 = 2656;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completionHandler (in %s:%d)", buf, 0x12u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke;
  v10[3] = &unk_1E5D73C30;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_2;
  v8[3] = &unk_1E5D73D48;
  id v9 = v11;
  id v7 = v11;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v10 taskBlock:v8];
}

uint64_t __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_3;
  v3[3] = &unk_1E5D74280;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchOngoingPeopleDensity:v3];
}

uint64_t __46__RTRoutineManager_fetchCurrentPeopleDensity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v19[3] = &unk_1E5D73C30;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_495;
  v15[3] = &unk_1E5D73C80;
  id v16 = v9;
  id v17 = v10;
  id v18 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];
}

void __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0], v3);
  }
}

void __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_495(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5D73C58;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchProximityHistoryFromStartDate:v3 endDate:v4 completionHandler:v5];
}

void __81__RTRoutineManager_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromStartDate called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
  v14[3] = &unk_1E5D73C30;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_496;
  v11[3] = &unk_1E5D73CA8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

void __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0], v3);
  }
}

void __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_496(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchProximityHistoryFromEventIDs:v3 completionHandler:v4];
}

void __72__RTRoutineManager_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromEventIDs called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPeopleCountEventsHistory:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke;
  v14[3] = &unk_1E5D73C30;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_497;
  v11[3] = &unk_1E5D73CA8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

void __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0], v3);
  }
}

void __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_497(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchPeopleCountEventsHistory:v3 completionHandler:v4];
}

void __68__RTRoutineManager_fetchPeopleCountEventsHistory_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_DEFAULT, "fetchPeopleCountEventsHistory called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v19[3] = &unk_1E5D73C30;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_498;
  v15[3] = &unk_1E5D73C80;
  id v16 = v9;
  id v17 = v10;
  id v18 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v19 taskBlock:v15];
}

void __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0], v3);
  }
}

void __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_498(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5D73C58;
  id v6 = *(id *)(a1 + 48);
  [a2 fetchPeopleDensityHistoryFromStartDate:v3 endDate:v4 completionHandler:v5];
}

void __85__RTRoutineManager_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_DEFAULT, "fetchPeopleDensityHistoryFromStartDate called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke;
  v14[3] = &unk_1E5D73C30;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_499;
  v11[3] = &unk_1E5D73CA8;
  id v12 = v7;
  id v13 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v14 taskBlock:v11];
}

void __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "error retrieving proxy for selector", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0], v3);
  }
}

void __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_499(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchContactScoresFromContactIDs:v3 completionHandler:v4];
}

void __71__RTRoutineManager_fetchContactScoresFromContactIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_DEFAULT, "fetchContactScoresFromContactIDs called back, error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addElevations:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked addElevations.", buf, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__RTRoutineManager_addElevations_handler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__RTRoutineManager_addElevations_handler___block_invoke_500;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

void __42__RTRoutineManager_addElevations_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_DEBUG, "RTRoutineManager: error from addElevations:handler:.", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __42__RTRoutineManager_addElevations_handler___block_invoke_500(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__RTRoutineManager_addElevations_handler___block_invoke_2;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 addElevations:v3 handler:v4];
}

uint64_t __42__RTRoutineManager_addElevations_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchElevationsWithOptions:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchElevationsWithOptions:reply:.", buf, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_501;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

void __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_DEBUG, "RTRoutineManager: error from fetchElevationsWithOptions:reply:.", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_501(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_2;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchElevationsWithOptions:v3 reply:v4];
}

void __53__RTRoutineManager_fetchElevationsWithOptions_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_DEBUG, "RTRoutineManager: replying from fetchElevationsWithOptions:reply:.", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked fetchBackgroundInertialOdometrySamplesWithOptions:handler:.", buf, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_502;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

void __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "RTRoutineManager: error from fetchBackgroundInertialOdometrySamplesWithOptions:handler:, %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_502(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_2;
  v4[3] = &unk_1E5D73C58;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 fetchBackgroundInertialOdometrySamplesWithOptions:v3 reply:v4];
}

void __78__RTRoutineManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_INFO, "RTRoutineManager: replying from fetchBackgroundInertialOdometrySamplesWithOptions:handler:.", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67174657;
    int v18 = [v7 count];
    _os_log_debug_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_DEBUG, "RTRoutineManager: invoked addBackgroundInertialOdometrySamples:handler: with %{private}d samples.", buf, 8u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke;
  v15[3] = &unk_1E5D73C30;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_503;
  v12[3] = &unk_1E5D73CA8;
  id v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [(RTRoutineManager *)self launchTaskWithSelector:a2 remainingAttempts:3 proxyErrorHandler:v15 taskBlock:v12];
}

void __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "RTRoutineManager: error from addBackgroundInertialOdometrySamples:handler:, %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_503(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2;
  v4[3] = &unk_1E5D73C30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 addBackgroundInertialOdometrySamples:v3 reply:v4];
}

void __65__RTRoutineManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_INFO, "RTRoutineManager: replying from addBackgroundInertialOdometrySamples:handler:.", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVisitHandler:(id)a3
{
}

- (void)setLeechedVisitHandler:(id)a3
{
}

- (void)setLeechedLowConfidenceVisitHandler:(id)a3
{
}

- (RTPlaceInferenceOptions)placeInferenceOptions
{
  return self->_placeInferenceOptions;
}

- (void)setPlaceInferenceOptions:(id)a3
{
}

- (void)setPlaceInferencesHandler:(id)a3
{
}

- (id)peopleDiscoveryErrorHandler
{
  return self->_peopleDiscoveryErrorHandler;
}

- (void)setPeopleDiscoveryErrorHandler:(id)a3
{
}

- (void)setRestorationIdentifier:(id)a3
{
}

- (RTEventAgentHelper)eventAgentHelper
{
  return self->_eventAgentHelper;
}

- (void)setEventAgentHelper:(id)a3
{
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (RTTokenBucket)clientThrottle
{
  return self->_clientThrottle;
}

- (void)setClientThrottle:(id)a3
{
}

- (RTRoutineManagerRegistrantAction)actionRegistrant
{
  return self->_actionRegistrant;
}

- (void)setActionRegistrant:(id)a3
{
}

- (RTRoutineManagerRegistrantPeopleDiscovery)peopleDiscoveryRegistrant
{
  return self->_peopleDiscoveryRegistrant;
}

- (void)setPeopleDiscoveryRegistrant:(id)a3
{
}

- (RTRoutineManagerRegistrantScenarioTrigger)scenarioTriggerRegistrant
{
  return self->_scenarioTriggerRegistrant;
}

- (void)setScenarioTriggerRegistrant:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerRegistrant, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryRegistrant, 0);
  objc_storeStrong((id *)&self->_actionRegistrant, 0);
  objc_storeStrong((id *)&self->_clientThrottle, 0);
  objc_storeStrong((id *)&self->_eventAgentHelper, 0);
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);
  objc_storeStrong(&self->_peopleDiscoveryErrorHandler, 0);
  objc_storeStrong(&self->_vehicleEventsHandler, 0);
  objc_storeStrong(&self->_placeInferencesHandler, 0);
  objc_storeStrong((id *)&self->_placeInferenceOptions, 0);
  objc_storeStrong(&self->_leechedLowConfidenceVisitHandler, 0);
  objc_storeStrong(&self->_leechedVisitHandler, 0);
  objc_storeStrong(&self->_visitHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)fetchCurrentPredictedLocationsOfInterestLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (v9)
  {
    id v10 = [(RTRoutineManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke;
    block[3] = &unk_1E5D74660;
    block[4] = self;
    SEL v14 = a2;
    id v13 = v9;
    double v15 = a3;
    double v16 = a4;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v18 = "-[RTRoutineManager(Skyline) fetchCurrentPredictedLocationsOfInterestLookingBack:lookingAhead:handler:]";
      __int16 v19 = 1024;
      int v20 = 21;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_2;
  v9[3] = &unk_1E5D73C30;
  id v3 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 _proxyForServicingSelector:v2 withErrorHandler:v9];
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_3;
  v7[3] = &unk_1E5D73C58;
  id v8 = *(id *)(a1 + 40);
  [v4 fetchCurrentPredictedLocationsOfInterestLookingBack:v7 lookingAhead:v5 reply:v6];
}

uint64_t __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__RTRoutineManager_Skyline__fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (v9)
  {
    id v10 = [(RTRoutineManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke;
    block[3] = &unk_1E5D74660;
    block[4] = self;
    SEL v14 = a2;
    id v13 = v9;
    double v15 = a3;
    double v16 = a4;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v18 = "-[RTRoutineManager(Skyline) performBluePOIQueryLookingBack:lookingAhead:handler:]";
      __int16 v19 = 1024;
      int v20 = 40;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2;
  v9[3] = &unk_1E5D73C30;
  id v3 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 _proxyForServicingSelector:v2 withErrorHandler:v9];
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3;
  v7[3] = &unk_1E5D74688;
  id v8 = *(id *)(a1 + 40);
  [v4 performBluePOIQueryLookingBack:v7 lookingAhead:v5 reply:v6];
}

uint64_t __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__RTRoutineManager_Skyline__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end