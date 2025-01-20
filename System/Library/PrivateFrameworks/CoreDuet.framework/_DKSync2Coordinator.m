@interface _DKSync2Coordinator
+ (BOOL)isOnPower;
+ (NSObject)_syncTypeFromActivity:(uint64_t)a1;
+ (id)keyValueStoreForDomain:(uint64_t)a1;
+ (id)storage;
+ (id)streamNamesToTombstone;
+ (uint64_t)canPerformSyncOperationWithClass:(void *)a3 syncType:(void *)a4 history:(void *)a5 transport:(void *)a6 peer:(void *)a7 policy:;
+ (uint64_t)shouldDeferSyncOperationWithClass:(void *)a3 syncType:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:;
+ (void)_updateEventStatsWithSyncElapsedTimeStartDate:(void *)a3 endDate:;
+ (void)_updateEventStatsWithSyncType:(uint64_t)a1;
- (BOOL)isBusy;
- (BOOL)isSingleDevice;
- (NSUUID)deviceUUID;
- (_DKKnowledgeStorage)storage;
- (_DKSync2Coordinator)initWithContext:(id)a3;
- (_DKSync2Coordinator)initWithStorage:(id)a3;
- (_DKSyncType)syncType;
- (double)_intervalForJobGivenIsSingleDevice:(id *)a1;
- (id)_executionCriteriaWithInterval:(uint64_t)a1;
- (id)_updatedExecutionCriteriaFromType:(uint64_t)a1;
- (id)createBusyTransactionWithName:(uint64_t)a1;
- (id)deletedEventIDsSinceDate:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 endDate:(id *)a6 error:(id *)a7;
- (id)policyForSyncTransportType:(int64_t)a3;
- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 compatibility:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 error:(id *)a8;
- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 fetchOrder:(int64_t)a6 error:(id *)a7;
- (uint64_t)_unregisterDatabaseObservers;
- (uint64_t)removeBusyTransaction:(uint64_t)result;
- (void)__finishSyncWithTransaction:(void *)a3 startDate:(void *)a4 completion:;
- (void)__performSyncWithCompletion:(id *)a1;
- (void)_checkInTriggeredSyncActivity:(int)a3 isStartup:;
- (void)_cloudIsAvailableToggle;
- (void)_cloudIsUnavailableToggle;
- (void)_cloudSyncAvailabilityDidChange:(id)a3;
- (void)_createPushConnection;
- (void)_databaseDidDeleteFromStreamNameCounts:(id)a3;
- (void)_deleteForeignSiriEvents;
- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:(uint64_t)a1;
- (void)_deleteSiriCloudEvents;
- (void)_deleteSiriEventsIfSiriCloudSyncHasBeenDisabled;
- (void)_finishActivityWithError:(uint64_t)a1;
- (void)_noTransportIsAvailableToggle;
- (void)_performEnableAndStart;
- (void)_performInitialSync;
- (void)_performPeriodicJob;
- (void)_performSyncTogglesChangedActions;
- (void)_performSyncWithForceSync:(void *)a3 completion:;
- (void)_performSyncWithSyncType:(void *)a3 completion:;
- (void)_possiblyPerformInitialSync;
- (void)_rapportIsAvailableToggle;
- (void)_rapportIsUnavailableToggle;
- (void)_registerCloudDeviceCountChangedObserver;
- (void)_registerCloudSyncAvailablityObserver;
- (void)_registerDatabaseObservers;
- (void)_registerPeriodicJob;
- (void)_registerPeriodicJobWithInterval:(uint64_t)a1;
- (void)_registerRapportAvailablityObserver;
- (void)_registerRapportLaunchOnDemandHandler;
- (void)_registerSiriSyncEnabledObserver;
- (void)_registerSyncPolicyChangedObserver;
- (void)_registerTriggeredSyncActivityWithIsStartup:(unsigned char *)a1;
- (void)_reregisterPeriodicJob;
- (void)_runTriggeredSyncActivity:(void *)a1;
- (void)_someTransportIsAvailableToggle;
- (void)_syncDisabledToggle;
- (void)_syncEnabledToggle;
- (void)_syncPolicyDidChange:(id)a3;
- (void)_synchronizeWithUrgency:(void *)a3 client:(void *)a4 completion:;
- (void)_unregisterCloudDeviceCountChangedObserver;
- (void)_unregisterCloudSyncAvailablityObserver;
- (void)_unregisterDatabaseObservers;
- (void)_unregisterPeriodicJob;
- (void)_unregisterRapportAvailablityObserver;
- (void)_unregisterSiriSyncEnabledObserver;
- (void)_unregisterTriggeredSyncActivity;
- (void)_updateTriggeredSyncActivity;
- (void)configureTracker;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)deleteRemoteStateWithReply:(id)a3;
- (void)fetchSourceDeviceIDFromPeer:(uint64_t)a1;
- (void)handleDataProtectionChangeFor:(int)a3 willBeAvailable:;
- (void)handleFetchedSourceDeviceID:(void *)a3 version:(void *)a4 fromPeer:(void *)a5 error:;
- (void)handleStatusChangeForPeer:(id)a3 previousTransports:(int64_t)a4;
- (void)knowledgeStorage:(id)a3 didDeleteEventsWithStreamNameCounts:(id)a4;
- (void)knowledgeStorage:(id)a3 didHaveInsertsAndDeletesWithCount:(unint64_t)a4;
- (void)possiblyUpdateIsBusyProperty;
- (void)setupStorage;
- (void)start;
- (void)syncWithReply:(id)a3;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5;
@end

@implementation _DKSync2Coordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportRapport, 0);
  objc_storeStrong((id *)&self->_transportCloudUp, 0);
  objc_storeStrong((id *)&self->_transportCloudDown, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_triggeredSyncActivity, 0);
  objc_storeStrong((id *)&self->_periodicJob, 0);
  objc_storeStrong((id *)&self->_rapportIsAvailableToggler, 0);
  objc_storeStrong((id *)&self->_cloudIsAvailableToggler, 0);
  objc_storeStrong((id *)&self->_someTransportIsAvailableToggler, 0);
  objc_storeStrong((id *)&self->_syncEnabledToggler, 0);
  objc_storeStrong((id *)&self->_streamNamesObservedForDeletions, 0);
  objc_storeStrong((id *)&self->_streamNamesObservedForAdditions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_syncState, 0);
  objc_storeStrong((id *)&self->_syncActivityName, 0);
  objc_storeStrong((id *)&self->_triggeredSyncDelayActivityName, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_activatedPeers, 0);
  objc_storeStrong((id *)&self->_deletedSyncedEvents, 0);
  objc_storeStrong((id *)&self->_insertedSyncedEvents, 0);
  objc_storeStrong((id *)&self->_busyTransactions, 0);
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_activityThrottler, 0);
}

- (_DKSync2Coordinator)initWithStorage:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [v5 storage];
  v7 = [v6 directory];
  v8 = [v4 stringWithFormat:@"com.apple.coreduet.sync.context:%@", v7];

  v9 = [v5 storage];
  v10 = [v9 databaseName];
  v11 = [v8 stringByAppendingPathComponent:v10];

  v12 = [[_DKSyncContext alloc] initWithName:v11];
  [(_DKSyncContext *)v12 setStorage:v5];

  v13 = [(_DKSync2Coordinator *)self initWithContext:v12];
  return v13;
}

- (_DKSync2Coordinator)initWithContext:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)_DKSync2Coordinator;
  id v5 = [(_DKSyncContextObject *)&v68 initWithContext:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    busyTransactions = v5->_busyTransactions;
    v5->_busyTransactions = (NSMutableSet *)v6;

    uint64_t v8 = [v4 storage];
    storage = v5->_storage;
    v5->_storage = (_DKKnowledgeStorage *)v8;

    objc_storeStrong((id *)&_DKSyncKnowledgeStorage, v5->_storage);
    v10 = v5->_storage;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [(_DKKnowledgeStorage *)v10 keyValueStoreForDomain:v12];
    keyValueStore = v5->_keyValueStore;
    v5->_keyValueStore = (_DKKeyValueStore *)v13;

    v15 = [[_DKThrottledActivity alloc] initWithStore:v5->_keyValueStore namespace:@"_DKSync2Coordinator"];
    activityThrottler = v5->_activityThrottler;
    v5->_activityThrottler = v15;

    uint64_t v17 = objc_opt_new();
    insertedSyncedEvents = v5->_insertedSyncedEvents;
    v5->_insertedSyncedEvents = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    deletedSyncedEvents = v5->_deletedSyncedEvents;
    v5->_deletedSyncedEvents = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    activatedPeers = v5->_activatedPeers;
    v5->_activatedPeers = (NSMutableSet *)v21;

    uint64_t v23 = objc_opt_new();
    streamNamesObservedForAdditions = v5->_streamNamesObservedForAdditions;
    v5->_streamNamesObservedForAdditions = (NSMutableSet *)v23;

    uint64_t v25 = objc_opt_new();
    streamNamesObservedForDeletions = v5->_streamNamesObservedForDeletions;
    v5->_streamNamesObservedForDeletions = (NSMutableSet *)v25;

    v27 = [(_DKSync2Coordinator *)v5 policyForSyncTransportType:1];
    if (([v27 syncDisabled] & 1) == 0)
    {
      v28 = v5->_streamNamesObservedForAdditions;
      v29 = [v27 streamNamesWithAdditionsTriggeringSync];
      [(NSMutableSet *)v28 addObjectsFromArray:v29];

      v30 = v5->_streamNamesObservedForDeletions;
      v31 = [v27 streamNamesWithDeletionsTriggeringSync];
      [(NSMutableSet *)v30 addObjectsFromArray:v31];
    }
    v32 = [(_DKSync2Coordinator *)v5 policyForSyncTransportType:4];
    if (([v32 syncDisabled] & 1) == 0)
    {
      v33 = v5->_streamNamesObservedForAdditions;
      v34 = [v32 streamNamesWithAdditionsTriggeringSync];
      [(NSMutableSet *)v33 addObjectsFromArray:v34];

      v35 = v5->_streamNamesObservedForDeletions;
      v36 = [v32 streamNamesWithDeletionsTriggeringSync];
      [(NSMutableSet *)v35 addObjectsFromArray:v36];
    }
    v37 = [(_DKSync2Coordinator *)v5 policyForSyncTransportType:8];
    if (([v37 syncDisabled] & 1) == 0)
    {
      v38 = v5->_streamNamesObservedForAdditions;
      v39 = [v37 streamNamesWithAdditionsTriggeringSync];
      [(NSMutableSet *)v38 addObjectsFromArray:v39];

      v40 = v5->_streamNamesObservedForDeletions;
      v41 = [v37 streamNamesWithDeletionsTriggeringSync];
      [(NSMutableSet *)v40 addObjectsFromArray:v41];
    }
    uint64_t v42 = [NSString stringWithFormat:@"SyncCoordinatorTriggeredSyncDelay"];
    triggeredSyncDelayActivityName = v5->_triggeredSyncDelayActivityName;
    v5->_triggeredSyncDelayActivityName = (NSString *)v42;

    uint64_t v44 = [NSString stringWithFormat:@"SyncCoordinatorSync"];
    syncActivityName = v5->_syncActivityName;
    v5->_syncActivityName = (NSString *)v44;

    uint64_t v46 = +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, @"sync enabled", (uint64_t)sel__syncEnabledToggle, (uint64_t)sel__syncDisabledToggle);
    syncEnabledToggler = v5->_syncEnabledToggler;
    v5->_syncEnabledToggler = (_DKSyncToggle *)v46;

    uint64_t v48 = +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, @"some transport is available", (uint64_t)sel__someTransportIsAvailableToggle, (uint64_t)sel__noTransportIsAvailableToggle);
    someTransportIsAvailableToggler = v5->_someTransportIsAvailableToggler;
    v5->_someTransportIsAvailableToggler = (_DKSyncToggle *)v48;

    uint64_t v50 = +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, @"Cloud is available", (uint64_t)sel__cloudIsAvailableToggle, (uint64_t)sel__cloudIsUnavailableToggle);
    cloudIsAvailableToggler = v5->_cloudIsAvailableToggler;
    v5->_cloudIsAvailableToggler = (_DKSyncToggle *)v50;

    uint64_t v52 = +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, @"Rapport is available", (uint64_t)sel__rapportIsAvailableToggle, (uint64_t)sel__rapportIsUnavailableToggle);
    rapportIsAvailableToggler = v5->_rapportIsAvailableToggler;
    v5->_rapportIsAvailableToggler = (_DKSyncToggle *)v52;

    v54 = objc_alloc_init(_DKDataProtectionStateMonitor);
    dataProtectionMonitor = v5->_dataProtectionMonitor;
    v5->_dataProtectionMonitor = v54;

    objc_initWeak(&location, v5);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __39___DKSync2Coordinator_initWithContext___block_invoke;
    v65[3] = &unk_1E560D528;
    objc_copyWeak(&v66, &location);
    [(_DKDataProtectionStateMonitor *)v5->_dataProtectionMonitor setChangeHandler:v65];
    v60 = v27;
    v56 = +[_DKSyncUrgencyTracker sharedInstance]();
    v57 = +[_CDObservationCenter sharedInstance];
    v58 = +[_DKSyncSerializer underlyingQueue];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __39___DKSync2Coordinator_initWithContext___block_invoke_2;
    v63[3] = &unk_1E560D550;
    objc_copyWeak(&v64, &location);
    [v57 addObserver:v5 name:@"_DKSyncUrgencyDidChangeNotification" sender:v56 queue:v58 usingBlock:v63];

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __39___DKSync2Coordinator_initWithContext___block_invoke_3;
    v61[3] = &unk_1E560D578;
    v62 = v5;
    +[_DKSyncSerializer performAsyncBlock:v61];

    objc_destroyWeak(&v64);
    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)handleDataProtectionChangeFor:(int)a3 willBeAvailable:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1 && [v5 isEqualToString:*MEMORY[0x1E4F28358]])
  {
    v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(id)objc_opt_class() description];
      v9 = @"unavailable";
      *(_DWORD *)buf = 138543874;
      v12 = v8;
      __int16 v13 = 2112;
      if (a3) {
        v9 = @"available";
      }
      v14 = v6;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Data protection availability changed for %@ to %@", buf, 0x20u);
    }
    if (a3)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69___DKSync2Coordinator_handleDataProtectionChangeFor_willBeAvailable___block_invoke;
      v10[3] = &unk_1E560D578;
      v10[4] = a1;
      +[_DKSyncSerializer performAsyncBlock:v10];
    }
  }
}

- (void)_reregisterPeriodicJob
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_18ECEB000, v1, v2, "%{public}@: Checking whether periodic job should be re-scheduled with isSingleDevice=%{BOOL}d", v3, v4, v5, v6, v7);
}

- (void)_performSyncTogglesChangedActions
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Performing sync toggles change actions", v3, v4, v5, v6, v7);
}

- (void)dealloc
{
  if (self->_observerToken)
  {
    uint64_t v3 = +[_DKSyncPeerStatusTracker sharedInstance];
    [v3 removeStatusChangeObserver:self->_observerToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKSync2Coordinator;
  [(_DKSync2Coordinator *)&v4 dealloc];
}

- (NSUUID)deviceUUID
{
  return [(_DKKnowledgeStorage *)self->_storage deviceUUID];
}

+ (id)storage
{
  self;
  v0 = (void *)_DKSyncKnowledgeStorage;
  return v0;
}

+ (id)keyValueStoreForDomain:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [(id)_DKSyncKnowledgeStorage keyValueStoreForDomain:v2];

  return v3;
}

- (void)_syncEnabledToggle
{
  uint64_t v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _registerSyncPolicyChangedObserver]((uint64_t)self);
  -[_DKSync2Coordinator _registerRapportAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _registerCloudSyncAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _registerSiriSyncEnabledObserver](self);
  -[_DKSync2Coordinator _registerRapportLaunchOnDemandHandler]((uint64_t)self);
  -[_DKSync2Coordinator _performEnableAndStart]((uint64_t)self);
  -[_DKSync2Coordinator _deleteSiriEventsIfSiriCloudSyncHasBeenDisabled]((uint64_t)self);
}

- (void)_registerSyncPolicyChangedObserver
{
  if (a1 && !*(unsigned char *)(a1 + 117))
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel__syncPolicyDidChange_ name:@"_DKSync2PolicyDidChangeNotification" object:0];
    *(unsigned char *)(a1 + 117) = 1;
  }
}

- (void)_registerRapportAvailablityObserver
{
  if (a1)
  {
    id v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (!*(unsigned char *)(a1 + 115))
    {
      uint64_t v3 = +[_CDObservationCenter sharedInstance];
      objc_super v4 = +[_DKSyncSerializer underlyingQueue];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __58___DKSync2Coordinator__registerRapportAvailablityObserver__block_invoke;
      v5[3] = &unk_1E560D758;
      v5[4] = a1;
      [v3 addObserver:a1 name:@"_DKRapportTransportAvailablityChangedNotification" sender:0 queue:v4 usingBlock:v5];

      *(unsigned char *)(a1 + 115) = 1;
    }
  }
}

- (void)_registerCloudSyncAvailablityObserver
{
  if (a1)
  {
    id v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (!*(unsigned char *)(a1 + 114))
    {
      uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 addObserver:a1 selector:sel__cloudSyncAvailabilityDidChange_ name:@"_DKCloudSyncAvailablityChangedNotification" object:0];
      objc_super v4 = +[_CDObservationCenter sharedInstance];
      uint64_t v5 = +[_DKSyncSerializer underlyingQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __60___DKSync2Coordinator__registerCloudSyncAvailablityObserver__block_invoke;
      v6[3] = &unk_1E560D758;
      v6[4] = a1;
      [v4 addObserver:a1 name:@"_DKCloudTransportAvailablityChangedNotification" sender:0 queue:v5 usingBlock:v6];

      *(unsigned char *)(a1 + 114) = 1;
    }
  }
}

- (void)_registerSiriSyncEnabledObserver
{
  if (a1)
  {
    id v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (!a1[116])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v4 = (const __CFString *)getkAFCloudStorageDeletedByUserDarwinNotification();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_siriSyncEnabledDidChangeCallback, v4, 0, (CFNotificationSuspensionBehavior)0);
      uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v6 = (const __CFString *)getkAFCloudSyncPreferenceDidChangeDarwinNotification();
      CFNotificationCenterAddObserver(v5, a1, (CFNotificationCallback)_siriSyncEnabledDidChangeCallback, v6, 0, (CFNotificationSuspensionBehavior)0);
      a1[116] = 1;
    }
  }
}

- (void)_registerRapportLaunchOnDemandHandler
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "com.apple.rapport.matching";
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Registering xpc_set_event_stream_handler(\"%s\"", (uint8_t *)&v0, 0xCu);
}

- (void)_performEnableAndStart
{
  if (a1)
  {
    uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (!*(unsigned char *)(a1 + 73))
    {
      if ([*(id *)(a1 + 64) isDataAvailableFor:*MEMORY[0x1E4F28358]])
      {
        v3[0] = MEMORY[0x1E4F143A8];
        v3[1] = 3221225472;
        v3[2] = __45___DKSync2Coordinator__performEnableAndStart__block_invoke;
        v3[3] = &unk_1E560D578;
        v3[4] = a1;
        +[_DKSyncSerializer performAsyncBlock:v3];
        *(unsigned char *)(a1 + 73) = 1;
      }
    }
  }
}

- (void)_deleteSiriEventsIfSiriCloudSyncHasBeenDisabled
{
  if (!a1) {
    return;
  }
  id v8 = [*(id *)(a1 + 216) objectForKey:@"_DKSiriCloudSyncEnabled"];
  uint64_t v2 = [getAFPreferencesClass() sharedPreferences];
  uint64_t v3 = [v2 cloudSyncEnabled];

  if (!v8)
  {
    int v4 = 0;
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  int v4 = [v8 BOOLValue] & (v3 ^ 1);
  if (v3) {
LABEL_4:
  }
    [*(id *)(a1 + 216) setObject:MEMORY[0x1E4F1CC28] forKey:@"NeedsSiriCloudDelete"];
LABEL_5:
  uint64_t v5 = *(void **)(a1 + 216);
  CFStringRef v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"_DKSiriCloudSyncEnabled"];

  if (v4)
  {
    -[_DKSync2Coordinator _deleteForeignSiriEvents](a1);
    -[_DKSync2Coordinator _deleteSiriCloudEvents](a1);
  }
  else
  {
    uint8_t v7 = [*(id *)(a1 + 216) objectForKey:@"NeedsSiriCloudDelete"];
    if ([v7 BOOLValue]) {
      -[_DKSync2Coordinator _deleteSiriCloudEvents](a1);
    }
  }
}

- (void)_syncDisabledToggle
{
  uint64_t v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _unregisterRapportAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterCloudSyncAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterSiriSyncEnabledObserver](self);
}

- (void)_unregisterRapportAvailablityObserver
{
  if (a1)
  {
    uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (*(unsigned char *)(a1 + 115))
    {
      id v3 = +[_CDObservationCenter sharedInstance];
      [v3 removeObserver:a1 name:@"_DKRapportTransportAvailablityChangedNotification"];
      *(unsigned char *)(a1 + 115) = 0;
    }
  }
}

- (void)_unregisterCloudSyncAvailablityObserver
{
  if (a1 && *(unsigned char *)(a1 + 114))
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:a1 name:@"_DKCloudSyncAvailablityChangedNotification" object:0];
    uint64_t v2 = +[_CDObservationCenter sharedInstance];
    [v2 removeObserver:a1 name:@"_DKCloudTransportAvailablityChangedNotification"];
    *(unsigned char *)(a1 + 114) = 0;
  }
}

- (void)_unregisterSiriSyncEnabledObserver
{
  if (a1)
  {
    if (a1[116])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v3 = (const __CFString *)getkAFCloudStorageDeletedByUserDarwinNotification();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, v3, 0);
      int v4 = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v5 = (const __CFString *)getkAFCloudSyncPreferenceDidChangeDarwinNotification();
      CFNotificationCenterRemoveObserver(v4, a1, v5, 0);
      a1[116] = 0;
    }
  }
}

- (void)_someTransportIsAvailableToggle
{
  CFStringRef v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _registerPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _registerDatabaseObservers]((uint64_t)self);
  -[_DKSync2Coordinator _registerTriggeredSyncActivityWithIsStartup:](self, 1);
}

- (void)_registerPeriodicJob
{
  int v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_18ECEB000, v1, v2, "%{public}@: Checking whether periodic job should be scheduled with isSingleDevice=%{BOOL}d", v3, v4, v5, v6, v7);
}

- (void)_registerDatabaseObservers
{
  int v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Registering sync database observers", v3, v4, v5, v6, v7);
}

- (void)_registerTriggeredSyncActivityWithIsStartup:(unsigned char *)a1
{
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    if (!a1[184])
    {
      uint64_t v5 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Coordinator _registerTriggeredSyncActivityWithIsStartup:]();
      }

      a1[184] = 1;
      objc_initWeak(&location, a1);
      uint64_t v6 = (void *)*MEMORY[0x1E4F14158];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke;
      handler[3] = &unk_1E560D820;
      objc_copyWeak(&v8, &location);
      char v9 = a2;
      xpc_activity_register("com.apple.coreduet.sync.triggered", v6, handler);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_noTransportIsAvailableToggle
{
  uint64_t v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _unregisterPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterDatabaseObservers]((uint64_t)self);
}

- (void)_unregisterPeriodicJob
{
  int v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Unscheduling periodic sync job", v3, v4, v5, v6, v7);
}

- (uint64_t)_unregisterDatabaseObservers
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 112))
    {
      uint64_t v2 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Coordinator _unregisterDatabaseObservers]();
      }

      [*(id *)(v1 + 208) removeKnowledgeStorageEventNotificationDelegate:v1];
      result = [*(id *)(v1 + 208) decrementInsertsAndDeletesObserverCount];
      *(unsigned char *)(v1 + 112) = 0;
    }
  }
  return result;
}

- (void)_cloudIsAvailableToggle
{
  uint64_t v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  +[_DKSync2Policy setOkToDownloadPolicyUpdates:1];
  -[_DKSync2Coordinator _createPushConnection]((uint64_t)self);
  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _registerCloudDeviceCountChangedObserver]((uint64_t)self);
  -[_DKSync2Coordinator _deleteSiriEventsIfSiriCloudSyncHasBeenDisabled]((uint64_t)self);
  -[_DKSync2Coordinator _possiblyPerformInitialSync]((id *)&self->super.super.isa);
}

- (void)_createPushConnection
{
  int v0 = [(id)objc_opt_class() description];
  uint64_t v1 = _CDPrettyPrintCollection(&unk_1EDE1E440, 0, 0, 0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v2, v3, "%{public}@: Created connection for topics: %@", v4, v5, v6, v7, 2u);
}

- (void)_registerCloudDeviceCountChangedObserver
{
  if (a1)
  {
    uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (!*(unsigned char *)(a1 + 113))
    {
      uint64_t v3 = +[_CDObservationCenter sharedInstance];
      uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __63___DKSync2Coordinator__registerCloudDeviceCountChangedObserver__block_invoke;
      v5[3] = &unk_1E560D758;
      v5[4] = a1;
      [v3 addObserver:a1 name:@"_DKCloudDeviceCountChangedNotification" sender:0 queue:v4 usingBlock:v5];

      *(unsigned char *)(a1 + 113) = 1;
    }
  }
}

- (void)_possiblyPerformInitialSync
{
  int v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Scheduling initial sync", v3, v4, v5, v6, v7);
}

- (void)_cloudIsUnavailableToggle
{
  uint64_t v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      self->_connection = 0;
    }
  }
  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterCloudDeviceCountChangedObserver]((uint64_t)self);
}

- (void)_unregisterCloudDeviceCountChangedObserver
{
  if (a1)
  {
    uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (*(unsigned char *)(a1 + 113))
    {
      id v3 = +[_CDObservationCenter sharedInstance];
      [v3 removeObserver:a1 name:@"_DKCloudDeviceCountChangedNotification"];
      *(unsigned char *)(a1 + 113) = 0;
    }
  }
}

- (void)_rapportIsAvailableToggle
{
  id v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
}

- (void)_rapportIsUnavailableToggle
{
  id v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
}

- (void)configureTracker
{
  if (a1)
  {
    uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    objc_initWeak(&location, a1);
    id v3 = +[_DKSyncPeerStatusTracker sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39___DKSync2Coordinator_configureTracker__block_invoke;
    v6[3] = &unk_1E560D5A0;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v3 addStatusChangeObserverWithBlock:v6];
    uint64_t v5 = (void *)a1[3];
    a1[3] = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setupStorage
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (_DKSyncLocalKnowledgeStorage *)-[_DKSyncLocalKnowledgeStorage initWithKnowledgeStorage:]((id *)[_DKSyncLocalKnowledgeStorage alloc], self->_storage);
  localStorage = self->_localStorage;
  self->_localStorage = v4;

  uint64_t v6 = [(_DKSync2Coordinator *)self policyForSyncTransportType:1];
  if ([v6 syncDisabled])
  {
  }
  else
  {
    BOOL v7 = +[_DKSync2Policy rapportSyncDisabled];

    if (!v7)
    {
      v10 = +[_DKSyncRapportKnowledgeStorage sharedInstance];
      transportRapport = self->_transportRapport;
      self->_transportRapport = v10;

      [(_DKSyncRemoteKnowledgeStorage *)self->_transportRapport setFetchDelegate:self];
      goto LABEL_8;
    }
  }
  id v8 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = [(id)objc_opt_class() description];
    *(_DWORD *)v26 = 138543362;
    *(void *)&v26[4] = v9;
    _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_INFO, "%{public}@: Rapport transport disabled by policy", v26, 0xCu);
  }
LABEL_8:
  v12 = [(_DKSync2Coordinator *)self policyForSyncTransportType:4];
  if ([v12 syncDisabled])
  {

LABEL_11:
    v14 = +[_CDLogging syncChannel];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      goto LABEL_15;
    }
    __int16 v15 = [(id)objc_opt_class() description];
    *(_DWORD *)v26 = 138543362;
    *(void *)&v26[4] = v15;
    v16 = "%{public}@: Cloud(Down) transport disabled by policy";
LABEL_13:
    _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, v16, v26, 0xCu);

    goto LABEL_14;
  }
  BOOL v13 = +[_DKSync2Policy cloudSyncDisabled];

  if (v13) {
    goto LABEL_11;
  }
  if (!+[_DKCloudUtilities isCloudKitEnabled])
  {
    v14 = +[_CDLogging syncChannel];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    __int16 v15 = [(id)objc_opt_class() description];
    *(_DWORD *)v26 = 138543362;
    *(void *)&v26[4] = v15;
    v16 = "%{public}@: Cloud(Down) transport is not enabled";
    goto LABEL_13;
  }
  v22 = +[_DKSyncDownCloudKitKnowledgeStorage sharedInstance];
  transportCloudDown = self->_transportCloudDown;
  self->_transportCloudDown = v22;

  [(_DKSyncRemoteKnowledgeStorage *)self->_transportCloudDown setFetchDelegate:self];
LABEL_15:
  uint64_t v17 = -[_DKSync2Coordinator policyForSyncTransportType:](self, "policyForSyncTransportType:", 8, *(_OWORD *)v26);
  if ([v17 syncDisabled])
  {

    goto LABEL_18;
  }
  BOOL v18 = +[_DKSync2Policy cloudSyncDisabled];

  if (v18)
  {
LABEL_18:
    uint64_t v19 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = [(id)objc_opt_class() description];
      *(_DWORD *)v26 = 138543362;
      *(void *)&v26[4] = v20;
      uint64_t v21 = "%{public}@: Cloud(Up) transport disabled by policy";
LABEL_20:
      _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_INFO, v21, v26, 0xCu);

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (+[_DKCloudUtilities isCloudKitEnabled])
  {
    v24 = +[_DKSyncUpCloudKitKnowledgeStorage sharedInstance];
    transportCloudUp = self->_transportCloudUp;
    self->_transportCloudUp = v24;

    [(_DKSyncRemoteKnowledgeStorage *)self->_transportCloudUp setFetchDelegate:self];
    return;
  }
  uint64_t v19 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [(id)objc_opt_class() description];
    *(_DWORD *)v26 = 138543362;
    *(void *)&v26[4] = v20;
    uint64_t v21 = "%{public}@: Cloud(Up) transport is not enabled";
    goto LABEL_20;
  }
LABEL_21:
}

- (void)start
{
  int v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Will start transport Rapport", v3, v4, v5, v6, v7);
}

- (id)policyForSyncTransportType:(int64_t)a3
{
  return +[_DKSync2Policy policyForSyncTransportType:a3];
}

+ (uint64_t)shouldDeferSyncOperationWithClass:(void *)a3 syncType:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  self;
  if (shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounterInitialized != -1) {
    dispatch_once(&shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounterInitialized, &__block_literal_global_3);
  }
  v14 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v14);

  if (![v13 canDeferSyncOperationWithSyncType:v10]) {
    goto LABEL_20;
  }
  -[_DKSyncType xpcActivity]((uint64_t)v10);
  __int16 v15 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || !xpc_activity_should_defer(v15))
  {

LABEL_20:
    uint64_t v25 = 0;
    v26 = @"no";
    goto LABEL_21;
  }
  if (!xpc_activity_set_state(v16, 3))
  {
    uint64_t v17 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]();
    }

    xpc_activity_set_state(v16, 5);
  }
  BOOL v18 = +[_CDLogging syncChannel];
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v19)
    {
      v36 = [(id)objc_opt_class() description];
      if ([v11 transportType] == 8) {
        v20 = "up to";
      }
      else {
        v20 = "down from";
      }
      int v21 = [v12 me];
      v22 = &stru_1EDDE58B8;
      uint64_t v23 = @"pseudo ";
      if (!v21) {
        uint64_t v23 = &stru_1EDDE58B8;
      }
      v33 = v23;
      v35 = [v12 identifier];
      v24 = [v12 model];
      v34 = v20;
      if (v24)
      {
        v30 = NSString;
        v32 = [v12 model];
        v22 = [v30 stringWithFormat:@" (%@)", v32];
      }
      v31 = [v11 name];
      *(_DWORD *)buf = 138544898;
      v38 = v36;
      __int16 v39 = 2112;
      uint64_t v40 = a2;
      __int16 v41 = 2082;
      uint64_t v42 = v34;
      __int16 v43 = 2114;
      uint64_t v44 = v33;
      __int16 v45 = 2114;
      uint64_t v46 = v35;
      __int16 v47 = 2114;
      uint64_t v48 = v22;
      __int16 v49 = 2114;
      uint64_t v50 = v31;
      _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ operation because activity should be deferred", buf, 0x48u);

      if (v24)
      {
      }
    }
  }
  else if (v19)
  {
    v28 = [(id)objc_opt_class() description];
    v29 = [v13 name];
    *(_DWORD *)buf = 138543874;
    v38 = v28;
    __int16 v39 = 2112;
    uint64_t v40 = a2;
    __int16 v41 = 2114;
    uint64_t v42 = v29;
    _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping %{public}@ sync operation because activity should be deferred", buf, 0x20u);
  }
  v26 = @"yes";
  uint64_t v25 = 1;
LABEL_21:
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounter, 1, v26);

  return v25;
}

+ (uint64_t)canPerformSyncOperationWithClass:(void *)a3 syncType:(void *)a4 history:(void *)a5 transport:(void *)a6 peer:(void *)a7 policy:
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  self;
  uint64_t v17 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v17);

  if ([v14 isAvailable])
  {
    BOOL v18 = +[_DKSyncPeerStatusTracker sharedInstance];
    uint64_t v19 = [v14 transportType];
    uint64_t v20 = [v18 activeTransportsForPeer:v15];
    if (!v15 || (v20 & v19) != 0)
    {
      if (v13)
      {
        int v21 = [v13 lastSyncDate];
        uint64_t v27 = objc_msgSend(v16, "canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:", v12, v21, objc_msgSend(v13, "lastDaySyncCount"), +[_DKSync2Coordinator isOnPower]());
        if ((v27 & 1) == 0)
        {
          uint64_t v72 = a2;
          v28 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v67 = [(id)objc_opt_class() description];
            uint64_t v45 = [v14 transportType];
            uint64_t v46 = "down from";
            if (v45 == 8) {
              uint64_t v46 = "up to";
            }
            v54 = v46;
            int v47 = [v15 me];
            uint64_t v48 = @"pseudo ";
            if (!v47) {
              uint64_t v48 = &stru_1EDDE58B8;
            }
            v53 = v48;
            v60 = [v15 identifier];
            v56 = [v15 model];
            if (v56)
            {
              uint64_t v50 = NSString;
              uint64_t v52 = [v15 model];
              id v64 = [v50 stringWithFormat:@" (%@)", v52];
            }
            else
            {
              id v64 = &stru_1EDDE58B8;
            }
            uint64_t v51 = [v14 name];
            *(_DWORD *)buf = 138544898;
            v75 = v67;
            __int16 v76 = 2112;
            uint64_t v77 = v72;
            __int16 v78 = 2082;
            v79 = v54;
            __int16 v80 = 2114;
            v81 = v53;
            __int16 v82 = 2114;
            os_log_t v83 = v60;
            __int16 v84 = 2114;
            v85 = v64;
            __int16 v86 = 2114;
            v87 = v51;
            _os_log_debug_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because of policy", buf, 0x48u);

            if (v56)
            {
            }
          }
        }
        goto LABEL_19;
      }
      int v21 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v71 = [(id)objc_opt_class() description];
        uint64_t v41 = [v14 transportType];
        uint64_t v42 = "down from";
        if (v41 == 8) {
          uint64_t v42 = "up to";
        }
        v63 = v42;
        int v43 = [v15 me];
        uint64_t v25 = &stru_1EDDE58B8;
        uint64_t v44 = @"pseudo ";
        if (!v43) {
          uint64_t v44 = &stru_1EDDE58B8;
        }
        v59 = v44;
        os_log_t logb = [v15 identifier];
        v65 = [v15 model];
        if (v65)
        {
          __int16 v49 = NSString;
          v55 = [v15 model];
          uint64_t v25 = [v49 stringWithFormat:@" (%@)", v55];
        }
        __int16 v39 = [v14 name];
        *(_DWORD *)buf = 138544898;
        v75 = v71;
        __int16 v76 = 2112;
        uint64_t v77 = a2;
        __int16 v78 = 2082;
        v79 = v63;
        __int16 v80 = 2114;
        v81 = v59;
        __int16 v82 = 2114;
        os_log_t v40 = logb;
        os_log_t v83 = logb;
        __int16 v84 = 2114;
        v85 = v25;
        __int16 v86 = 2114;
        v87 = v39;
        _os_log_error_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_ERROR, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because history is unavailable", buf, 0x48u);
        goto LABEL_46;
      }
    }
    else
    {
      int v21 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v71 = [(id)objc_opt_class() description];
        uint64_t v22 = [v14 transportType];
        uint64_t v23 = "down from";
        if (v22 == 8) {
          uint64_t v23 = "up to";
        }
        v61 = v23;
        int v24 = [v15 me];
        uint64_t v25 = &stru_1EDDE58B8;
        v26 = @"pseudo ";
        if (!v24) {
          v26 = &stru_1EDDE58B8;
        }
        v58 = v26;
        os_log_t log = [v15 identifier];
        v65 = [v15 model];
        if (v65)
        {
          v38 = NSString;
          v55 = [v15 model];
          uint64_t v25 = [v38 stringWithFormat:@" (%@)", v55];
        }
        __int16 v39 = [v14 name];
        *(_DWORD *)buf = 138544898;
        v75 = v71;
        __int16 v76 = 2112;
        uint64_t v77 = a2;
        __int16 v78 = 2082;
        v79 = v61;
        __int16 v80 = 2114;
        v81 = v58;
        __int16 v82 = 2114;
        os_log_t v40 = log;
        os_log_t v83 = log;
        __int16 v84 = 2114;
        v85 = v25;
        __int16 v86 = 2114;
        v87 = v39;
        _os_log_debug_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because not currently active on transport", buf, 0x48u);
LABEL_46:

        if (v65)
        {
        }
      }
    }
    uint64_t v27 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v18 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v73 = [(id)objc_opt_class() description];
    uint64_t v30 = [v14 transportType];
    v31 = "down from";
    if (v30 == 8) {
      v31 = "up to";
    }
    id v66 = v31;
    int v32 = [v15 me];
    v33 = &stru_1EDDE58B8;
    v34 = @"pseudo ";
    if (!v32) {
      v34 = &stru_1EDDE58B8;
    }
    v62 = v34;
    os_log_t loga = [v15 identifier];
    v35 = [v15 model];
    if (v35)
    {
      v36 = NSString;
      v57 = [v15 model];
      v33 = [v36 stringWithFormat:@" (%@)", v57];
    }
    v37 = [v14 name];
    *(_DWORD *)buf = 138544898;
    v75 = v73;
    __int16 v76 = 2112;
    uint64_t v77 = a2;
    __int16 v78 = 2082;
    v79 = v66;
    __int16 v80 = 2114;
    v81 = v62;
    __int16 v82 = 2114;
    os_log_t v83 = loga;
    __int16 v84 = 2114;
    v85 = v33;
    __int16 v86 = 2114;
    v87 = v37;
    _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because transport is not available", buf, 0x48u);

    if (v35)
    {
    }
  }
  uint64_t v27 = 0;
LABEL_20:

  return v27;
}

+ (BOOL)isOnPower
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  IOPSGetPercentRemaining();
  CFTypeRef v0 = IOPSCopyPowerSourcesInfo();
  CFStringRef v1 = IOPSGetProvidingPowerSourceType(v0);
  CFComparisonResult v2 = CFStringCompare(v1, @"AC Power", 1uLL);
  if (v0) {
    CFRelease(v0);
  }
  uint64_t v3 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138544130;
    uint8_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = 0;
    __int16 v10 = 1024;
    BOOL v11 = v2 == kCFCompareEqualTo;
    __int16 v12 = 1024;
    BOOL v13 = v11;
    _os_log_debug_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Checking AC power found isCharging = %{BOOL}d and isOnAC = %{BOOL}d so isOnPower = %{BOOL}d", buf, 0x1Eu);
  }
  return v2 == kCFCompareEqualTo;
}

- (void)handleStatusChangeForPeer:(id)a3 previousTransports:(int64_t)a4
{
  id v10 = a3;
  uint64_t v6 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v6);

  uint8_t v7 = +[_DKSyncPeerStatusTracker sharedInstance];
  uint64_t v8 = [v7 activeTransportsForPeer:v10];

  if (v8 != a4)
  {
    if (a4 && v8)
    {
LABEL_7:
      if ((v8 & ~a4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
  }
  if (a4 || !v8) {
    goto LABEL_7;
  }
LABEL_8:
  int v9 = [v10 sourceDeviceID];

  if (!v9) {
    -[_DKSync2Coordinator fetchSourceDeviceIDFromPeer:]((uint64_t)self, v10);
  }
LABEL_10:
}

- (void)fetchSourceDeviceIDFromPeer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = -[_DKSync2Coordinator createBusyTransactionWithName:](a1);
    uint64_t v6 = *(void **)(a1 + 248);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51___DKSync2Coordinator_fetchSourceDeviceIDFromPeer___block_invoke;
    v8[3] = &unk_1E560D5C8;
    v8[4] = a1;
    id v9 = v3;
    id v10 = v5;
    id v7 = v5;
    [v6 fetchSourceDeviceIDFromPeer:v9 highPriority:1 completion:v8];
  }
}

- (void)possiblyUpdateIsBusyProperty
{
  CFTypeRef v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Setting sync coordinator state to idle", v3, v4, v5, v6, v7);
}

- (id)createBusyTransactionWithName:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = (void *)os_transaction_create();
    [*(id *)(a1 + 32) addObject:v3];
    -[_DKSync2Coordinator possiblyUpdateIsBusyProperty](a1);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)handleFetchedSourceDeviceID:(void *)a3 version:(void *)a4 fromPeer:(void *)a5 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    BOOL v13 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v13);

    if (v12)
    {
      uint64_t v14 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [(id)objc_opt_class() description];
        id v15 = &stru_1EDDE58B8;
        if ([v11 me]) {
          id v16 = @"pseudo ";
        }
        else {
          id v16 = &stru_1EDDE58B8;
        }
        uint64_t v17 = [v11 identifier];
        BOOL v18 = [v11 model];
        if (v18)
        {
          int v21 = NSString;
          v29 = [v11 model];
          id v15 = [v21 stringWithFormat:@" (%@)", v29];
        }
        uint64_t v22 = [v12 domain];
        *(_DWORD *)buf = 138544898;
        v33 = v30;
        __int16 v34 = 2114;
        v35 = v16;
        __int16 v36 = 2114;
        v37 = v17;
        __int16 v38 = 2114;
        __int16 v39 = v15;
        __int16 v40 = 2114;
        uint64_t v41 = v22;
        __int16 v42 = 2048;
        uint64_t v43 = [v12 code];
        __int16 v44 = 2112;
        id v45 = v12;
        _os_log_error_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed while requesting source device id from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v18)
        {
        }
      }
    }
    else
    {
      uint64_t v19 = +[_CDLogging syncChannel];
      uint64_t v14 = v19;
      if (v9)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v31 = [(id)objc_opt_class() description];
          uint64_t v23 = &stru_1EDDE58B8;
          if ([v11 me]) {
            int v24 = @"pseudo ";
          }
          else {
            int v24 = &stru_1EDDE58B8;
          }
          uint64_t v25 = [v11 identifier];
          v26 = [v11 model];
          if (v26)
          {
            uint64_t v27 = NSString;
            v29 = [v11 model];
            uint64_t v23 = [v27 stringWithFormat:@" (%@)", v29];
          }
          v28 = [v9 UUIDString];
          *(_DWORD *)buf = 138544386;
          v33 = v31;
          __int16 v34 = 2114;
          v35 = v24;
          __int16 v36 = 2114;
          v37 = v25;
          __int16 v38 = 2114;
          __int16 v39 = v23;
          __int16 v40 = 2114;
          uint64_t v41 = v28;
          _os_log_debug_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Received source device id %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x34u);

          if (v26)
          {
          }
        }

        uint64_t v14 = [v9 UUIDString];
        uint64_t v20 = +[_DKSyncPeerStatusTracker sharedInstance];
        [v20 setSourceDeviceID:v14 version:v10 peer:v11];
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[_DKSync2Coordinator handleFetchedSourceDeviceID:version:fromPeer:error:](a1, v11, v14);
      }
    }
  }
}

- (uint64_t)removeBusyTransaction:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    id v3 = a2;
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    [*(id *)(v2 + 32) removeObject:v3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45___DKSync2Coordinator_removeBusyTransaction___block_invoke;
    v5[3] = &unk_1E560D578;
    v5[4] = v2;
    return +[_DKSyncSerializer performAfter:v5 block:0.0001];
  }
  return result;
}

- (void)syncWithReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_DKDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:*MEMORY[0x1E4F28358]])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37___DKSync2Coordinator_syncWithReply___block_invoke;
    v8[3] = &unk_1E560D618;
    v8[4] = self;
    id v9 = v4;
    +[_DKSyncSerializer performSyncBlock:v8];
  }
  else
  {
    uint64_t v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "%{public}@: Not syncing because storage is not yet available", buf, 0xCu);
    }
    if (v4)
    {
      uint8_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
    }
  }
}

- (void)_performSyncWithForceSync:(void *)a3 completion:
{
  if (a1)
  {
    id v5 = a3;
    uint64_t v6 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v6);

    uint8_t v7 = [_DKSyncType alloc];
    char v8 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)a1);
    id v9 = -[_DKSyncType initWithIsSingleDevice:](v7, v8);
    -[_DKSyncType setForceSync:]((uint64_t)v9, a2);
    -[_DKSync2Coordinator _performSyncWithSyncType:completion:](a1, v9, v5);
  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([(_DKDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:*MEMORY[0x1E4F28358]])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke;
    v13[3] = &unk_1E560D668;
    v13[4] = self;
    unint64_t v16 = a3;
    id v14 = v8;
    id v15 = v9;
    +[_DKSyncSerializer performSyncBlock:v13];
  }
  else
  {
    id v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543362;
      BOOL v18 = v11;
      _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "%{public}@: Not urgently syncing because storage is not yet available", buf, 0xCu);
    }
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
    }
  }
}

- (void)_synchronizeWithUrgency:(void *)a3 client:(void *)a4 completion:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v9);

    +[_DKSyncUrgencyTracker sharedInstance]();
    id v10 = (id *)objc_claimAutoreleasedReturnValue();
    id v11 = [_DKSyncType alloc];
    char v12 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)a1);
    BOOL v13 = -[_DKSyncType initWithIsSingleDevice:](v11, v12);
    -[_DKSyncType setForceSync:]((uint64_t)v13, 1);
    if ([a1[31] isAvailable]) {
      uint64_t v14 = [a1[31] transportType];
    }
    else {
      uint64_t v14 = 0;
    }
    if ([a1[29] isAvailable]) {
      uint64_t v15 = [a1[29] transportType];
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = v15 | v14;
    if ([a1[30] isAvailable]) {
      uint64_t v17 = [a1[30] transportType];
    }
    else {
      uint64_t v17 = 0;
    }
    BOOL v18 = +[_DKSync2Policy disabledFeaturesForSyncType:v13 transports:v16 | v17];
    if ([v7 isEqualToString:@"UsageTracking"]
      && [v18 containsObject:@"DigitalHealth"])
    {
      uint64_t v19 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Coordinator _synchronizeWithUrgency:client:completion:]();
      }
    }
    else
    {
      -[_DKSyncUrgencyTracker updateUrgency:forClient:](v10, a2, v7);
      if (a2 >= 7)
      {
        uint64_t v20 = -[_DKEventData version]((uint64_t)v10);
        -[_DKSyncType setUrgency:]((uint64_t)v13, v20);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __65___DKSync2Coordinator__synchronizeWithUrgency_client_completion___block_invoke;
        v21[3] = &unk_1E560D5F0;
        v21[4] = a1;
        id v22 = v8;
        -[_DKSync2Coordinator _performSyncWithSyncType:completion:](a1, v13, v21);

LABEL_20:
        goto LABEL_21;
      }
    }
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)deleteRemoteStateWithReply:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  if (![(_DKDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:*MEMORY[0x1E4F28358]])
  {
    id v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(id)objc_opt_class() description];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "%{public}@: Not deleting remote state because storage is not yet available", (uint8_t *)&v8, 0xCu);
    }
    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:0];
      v4[2](v4, 0, v7);
    }
  }
}

- (BOOL)isSingleDevice
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = +[_DKSyncPeerStatusTracker sharedInstance];
  BOOL v2 = [v1 foreignPeersCount] == 0;

  return v2;
}

- (void)_performSyncWithSyncType:(void *)a3 completion:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    int v8 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v8);

    id v9 = (uint64_t *)a1[12];
    if (!v9)
    {
      uint64_t v14 = -[_DKSync2State initWithType:completion:]([_DKSync2State alloc], v6, v7);
      id v15 = a1[12];
      a1[12] = v14;

      uint64_t v10 = (uint64_t *)a1[12];
      goto LABEL_42;
    }
    uint64_t v10 = v9;
    BOOL v12 = -[_DKSyncType forceSync]((BOOL)v6);
    if (v12)
    {
      id v3 = objc_getProperty(v10, v11, 16, 1);
      if (!-[_DKSyncType forceSync]((BOOL)v3))
      {

        goto LABEL_19;
      }
      if (!-[_DKSyncType isPeriodicSync]((BOOL)v6))
      {

LABEL_12:
        if ((v10[1] & 1) == 0)
        {
          BOOL v18 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Coordinator _performSyncWithSyncType:completion:]();
          }
LABEL_23:

          -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
LABEL_59:
          id Property = objc_getProperty(v10, v23, 16, 1);
          if (-[_DKSyncType isTriggeredSync]((BOOL)Property)) {
            -[_DKSync2Coordinator _updateTriggeredSyncActivity]((uint64_t)a1);
          }
          goto LABEL_61;
        }
        id v19 = objc_getProperty(v10, v13, 16, 1);
        if (-[_DKSyncType isTriggeredSync]((BOOL)v19))
        {
          id v21 = objc_getProperty(v10, v20, 16, 1);
          id v22 = -[_DKSyncType xpcActivity]((uint64_t)v21);
          if (v22)
          {
          }
          else
          {
            v31 = -[_DKSyncType xpcActivity]((uint64_t)v6);

            if (!v31)
            {
              int v32 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                -[_DKSync2Coordinator _performSyncWithSyncType:completion:]();
              }
            }
          }
          -[_DKSyncType mergeType:](v10[2], v6);
          id v34 = objc_getProperty(v10, v33, 16, 1);
          v35 = -[_DKSyncType xpcActivity]((uint64_t)v34);

          BOOL v27 = v35 != 0;
        }
        else
        {
          BOOL v27 = 0;
        }
        __int16 v36 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          -[_DKSync2Coordinator _performSyncWithSyncType:completion:]();
        }

        -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
        if (!v27) {
          goto LABEL_59;
        }
        goto LABEL_42;
      }
    }
    else if (!-[_DKSyncType isPeriodicSync]((BOOL)v6))
    {
      goto LABEL_12;
    }
    id v16 = objc_getProperty(v10, v13, 16, 1);
    BOOL v17 = -[_DKSyncType isPeriodicSync]((BOOL)v16);
    if (v12) {

    }
    if (v17) {
      goto LABEL_12;
    }
LABEL_19:
    if ((v10[1] & 1) == 0)
    {
      if (!objc_getProperty(v10, v13, 24, 1))
      {
        BOOL v28 = -[_DKSyncType forceSync]((BOOL)v6);
        v29 = +[_CDLogging syncChannel];
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30) {
            -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.4();
          }
        }
        else if (v30)
        {
          -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.5();
        }

        -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
        -[_DKSyncType mergeType:](v10[2], v6);
        goto LABEL_59;
      }
      BOOL v18 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.6();
      }
      goto LABEL_23;
    }
    BOOL v24 = -[_DKSyncType forceSync]((BOOL)v6);
    uint64_t v25 = +[_CDLogging syncChannel];
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24)
    {
      if (v26) {
        -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.7();
      }
    }
    else if (v26)
    {
      -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.8();
    }

    -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
    -[_DKSyncType mergeType:](v10[2], v6);
    *((unsigned char *)v10 + 8) = 0;
    -[_DKSync2Coordinator _unregisterTriggeredSyncActivity]((uint64_t)a1);
LABEL_42:
    objc_initWeak(&location, a1);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke;
    v46[3] = &unk_1E560D690;
    v46[4] = a1;
    uint64_t v10 = v10;
    int v47 = v10;
    objc_copyWeak(&v48, &location);
    __int16 v38 = (void *)MEMORY[0x192FB31A0](v46);
    if (v10) {
      id v39 = objc_getProperty(v10, v37, 16, 1);
    }
    else {
      id v39 = 0;
    }
    id v40 = v39;
    if (-[_DKSyncType isTriggeredSync]((BOOL)v40))
    {
      if (v10) {
        id v42 = objc_getProperty(v10, v41, 16, 1);
      }
      else {
        id v42 = 0;
      }
      id v43 = v42;
      __int16 v44 = -[_DKSyncType xpcActivity]((uint64_t)v43);

      if (!v44)
      {
        if (v10) {
          *((unsigned char *)v10 + 8) = 1;
        }
        -[_DKSync2Coordinator _registerTriggeredSyncActivityWithIsStartup:](a1, 0);
LABEL_55:

        objc_destroyWeak(&v48);
        objc_destroyWeak(&location);
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {
    }
    if (v10) {
      *((unsigned char *)v10 + 8) = 0;
    }
    -[_DKSync2Coordinator __performSyncWithCompletion:](a1, v38);
    goto LABEL_55;
  }
LABEL_62:
}

- (void)_unregisterTriggeredSyncActivity
{
  if (a1)
  {
    BOOL v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    if (*(unsigned char *)(a1 + 184))
    {
      xpc_activity_unregister("com.apple.coreduet.sync.triggered");
      *(unsigned char *)(a1 + 184) = 0;
      id v3 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = 0;
    }
  }
}

- (void)__performSyncWithCompletion:(id *)a1
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v68 = a2;
  val = a1;
  if (a1)
  {
    id v3 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v3);

    if ([val[8] isDataAvailableFor:*MEMORY[0x1E4F28358]])
    {
      v65 = [MEMORY[0x1E4F1C9C8] date];
      id v4 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [(id)objc_opt_class() description];
        id v6 = [val deviceUUID];
        id v7 = [v6 UUIDString];
        *(_DWORD *)buf = 138543618;
        uint64_t v88 = v5;
        __int16 v89 = 2114;
        id v90 = v7;
        _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "%{public}@: Starting sync on %{public}@", buf, 0x16u);
      }
      id v64 = -[_DKSync2Coordinator createBusyTransactionWithName:]((uint64_t)val);
      id Property = val[12];
      if (Property) {
        id Property = objc_getProperty(Property, v8, 16, 1);
      }
      id v69 = Property;
      +[_DKSync2Coordinator _updateEventStatsWithSyncType:]((uint64_t)_DKSync2Coordinator, v69);
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138543618;
        uint64_t v88 = v11;
        __int16 v89 = 2114;
        id v90 = v69;
        _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "%{public}@: Sync type: %{public}@", buf, 0x16u);
      }
      BOOL v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        BOOL v13 = [(id)objc_opt_class() description];
        uint64_t v14 = +[_DKSyncedFeatures sharedInstance]();
        *(_DWORD *)buf = 138543618;
        uint64_t v88 = v13;
        __int16 v89 = 2114;
        id v90 = v14;
        _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "%{public}@: Sync features: %{public}@", buf, 0x16u);
      }
      id v15 = val[30];
      if (v15) {
        int v16 = [v15 isAvailable];
      }
      else {
        int v16 = 0;
      }
      id v19 = val[29];
      if (v19) {
        int v20 = [v19 isAvailable];
      }
      else {
        int v20 = 0;
      }
      id v21 = val[31];
      if (v21) {
        int v22 = [v21 isAvailable];
      }
      else {
        int v22 = 0;
      }
      if (!-[_DKSyncType forceSync]((BOOL)v69))
      {
        if (-[_DKSyncType isTriggeredSync]((BOOL)v69))
        {
          if (![val[5] count]) {
            [val[6] count];
          }
          uint64_t v23 = [val policyForSyncTransportType:8];
          BOOL v24 = [val[27] numberForKey:@"DeletedSyncedEventCount"];
          uint64_t v25 = v24;
          if (v24) {
            unint64_t v26 = [v24 unsignedIntegerValue];
          }
          else {
            unint64_t v26 = 0;
          }
          if (v26 >= [v23 numChangesTriggeringSync]) {
            int v27 = v16;
          }
          else {
            int v27 = 0;
          }

          int v28 = v22;
        }
        else
        {
          int v27 = 0;
          int v28 = 0;
        }
        BOOL v29 = -[_DKSyncType isPeriodicSync]((BOOL)v69);
        if (v29) {
          int v27 = v16;
        }
        BOOL v30 = -[_DKSyncType isInitialSync]((BOOL)v69);
        if (-[_DKSyncType didActivatePeer]((BOOL)v69) || v30 || v29) {
          int v31 = v22;
        }
        else {
          int v31 = v28;
        }
        BOOL v32 = -[_DKSyncType didReceivePush]((BOOL)v69);
        if (![val[7] count])
        {
          v20 &= v32 || v30 || v29;
          int v22 = v31;
        }
        if (*((unsigned char *)val + 201)) {
          int v33 = 0;
        }
        else {
          int v33 = v16;
        }
        if (v33 == 1 && -[_DKSyncType isPeriodicSync]((BOOL)v69)) {
          int v16 = !-[_DKSyncToggle isEnabled]((BOOL)v69) | v27;
        }
        else {
          int v16 = v27;
        }
      }
      v70 = objc_opt_new();
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke;
      v85[3] = &unk_1E560D578;
      v85[4] = val;
      +[_DKSyncBlockCompositeOperation blockCompositeOperationWithBlock:]((uint64_t)_DKSyncBlockCompositeOperation, v85);
      id newValue = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        id v34 = [val policyForSyncTransportType:1];
        v35 = -[_DKPerformSyncDownOperation initWithParent:localStorage:transport:peers:policy:type:]([_DKPerformSyncDownOperation alloc], (uint64_t)newValue, val[28], val[31], 0, v34, v69);
        if ([v70 count])
        {
          __int16 v36 = [v70 lastObject];
          [v35 addDependency:v36];
        }
        [v70 addObject:v35];
      }
      if (v20)
      {
        v37 = [val policyForSyncTransportType:4];
        __int16 v38 = -[_DKPerformSyncDownOperation initWithParent:localStorage:transport:peers:policy:type:]([_DKPerformSyncDownOperation alloc], (uint64_t)newValue, val[28], val[29], 0, v37, v69);
        if ([v70 count])
        {
          id v39 = [v70 lastObject];
          [v38 addDependency:v39];
        }
        [v70 addObject:v38];
      }
      if (v16)
      {
        id v40 = +[_DKSyncPeerStatusTracker sharedInstance];
        uint64_t v41 = [v40 pseudoPeerForSyncTransportCloudUp];

        id v42 = [val policyForSyncTransportType:8];
        id v43 = -[_DKPerformSyncDownPeerDeletionsOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncDownPeerDeletionsOperation alloc], (uint64_t)newValue, val[28], val[30], v41, v42, v69);
        if ([v70 count])
        {
          __int16 v44 = [v70 lastObject];
          [v43 addDependency:v44];
        }
        [v70 addObject:v43];
        id v45 = -[_DKPerformSyncUpHistoryOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncUpHistoryOperation alloc], (uint64_t)newValue, val[28], val[30], v41, v42, v69);
        if ([v70 count])
        {
          uint64_t v46 = [v70 lastObject];
          [v45 addDependency:v46];
        }
        [v70 addObject:v45];
        objc_initWeak((id *)buf, val);
        objc_initWeak(&location, v45);
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_631;
        v81[3] = &unk_1E560D6B8;
        objc_copyWeak(&v82, &location);
        objc_copyWeak(&v83, (id *)buf);
        int v47 = +[_DKSyncBlockOperation blockOperationWithBlock:v81];
        [v47 addDependency:v45];
        [v70 addObject:v47];

        objc_destroyWeak(&v83);
        objc_destroyWeak(&v82);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      if ([v70 count])
      {
        id v49 = val[12];
        if (v49) {
          objc_setProperty_atomic(v49, v48, newValue, 24);
        }
        objc_initWeak(&location, val);
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_2;
        v76[3] = &unk_1E560D6E0;
        v62 = &v80;
        objc_copyWeak(&v80, &location);
        id v77 = v64;
        id v78 = v65;
        id v79 = v68;
        v63 = +[_DKSyncBlockOperation blockOperationWithBlock:v76];
        [v63 addDependency:newValue];
        [v70 addObject:v63];
        [v70 insertObject:newValue atIndex:0];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v50 = v70;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v72 objects:v86 count:16];
        if (v51)
        {
          uint64_t v52 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v73 != v52) {
                objc_enumerationMutation(v50);
              }
              v54 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              v55 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                v56 = [(id)objc_opt_class() description];
                v57 = [v54 debugDescription];
                *(_DWORD *)buf = 138543618;
                uint64_t v88 = v56;
                __int16 v89 = 2114;
                id v90 = v57;
                _os_log_debug_impl(&dword_18ECEB000, v55, OS_LOG_TYPE_DEBUG, "%{public}@: Queuing operation %{public}@", buf, 0x16u);
              }
            }
            uint64_t v51 = [v50 countByEnumeratingWithState:&v72 objects:v86 count:16];
          }
          while (v51);
        }

        +[_DKSyncSerializer addOperations:v50 waitUntilFinished:0];
        v58 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          v59 = [(id)objc_opt_class() description];
          [(_DKSync2Coordinator *)v59 __performSyncWithCompletion:v58];
        }

        objc_destroyWeak(v62);
        objc_destroyWeak(&location);
      }
      else
      {
        v60 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          -[_DKSync2Coordinator __performSyncWithCompletion:]();
        }

        [newValue cancel];
        -[_DKSync2Coordinator __finishSyncWithTransaction:startDate:completion:]((uint64_t)val, v64, v65, v68);
      }
      v61 = +[_DKSyncUrgencyTracker sharedInstance]();
      -[_DKSyncUrgencyTracker ageUrgencies]((uint64_t)v61);
    }
    else
    {
      BOOL v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        BOOL v18 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138543362;
        uint64_t v88 = v18;
        _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_INFO, "%{public}@: Not starting sync because storage is not yet available", buf, 0xCu);
      }
      if (v68)
      {
        id v66 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:0];
        (*((void (**)(id, void *))v68 + 2))(v68, v66);
      }
    }
  }
}

- (void)_updateTriggeredSyncActivity
{
  CFTypeRef v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: No triggered sync type to update activity with", v3, v4, v5, v6, v7);
}

+ (void)_updateEventStatsWithSyncType:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (_updateEventStatsWithSyncType__isSingleDeviceSyncCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithSyncType__isSingleDeviceSyncCounterInitialized, &__block_literal_global_633);
  }
  uint64_t v3 = _updateEventStatsWithSyncType__isSingleDeviceSyncCounter;
  BOOL v4 = -[_DKSyncToggle isEnabled]((BOOL)v2);

  if (v4) {
    uint64_t v5 = @"true";
  }
  else {
    uint64_t v5 = @"false";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](v3, 1, v5);
}

- (void)__finishSyncWithTransaction:(void *)a3 startDate:(void *)a4 completion:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  int v8 = a4;
  if (a1)
  {
    id v9 = a3;
    uint64_t v10 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v10);

    id Property = *(id *)(a1 + 96);
    if (Property) {
      id Property = objc_getProperty(Property, v11, 24, 1);
    }
    uint64_t v14 = [Property errors];
    id v15 = *(void **)(a1 + 96);
    if (v15) {
      objc_setProperty_atomic(v15, v13, 0, 24);
    }
    if (v8)
    {
      int v16 = [v14 firstObject];
      v8[2](v8, v16);
    }
    -[_DKSync2Coordinator removeBusyTransaction:](a1, v7);
    BOOL v17 = +[_DKSyncPeerStatusTracker sharedInstance];
    [v17 debugLogPeers];

    BOOL v18 = [MEMORY[0x1E4F1C9C8] date];
    +[_DKSync2Coordinator _updateEventStatsWithSyncElapsedTimeStartDate:endDate:]((uint64_t)_DKSync2Coordinator, v9, v18);

    id v19 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = [(id)objc_opt_class() description];
      int v21 = 138543362;
      int v22 = v20;
      _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_INFO, "%{public}@: Done syncing", (uint8_t *)&v21, 0xCu);
    }
  }
}

+ (void)_updateEventStatsWithSyncElapsedTimeStartDate:(void *)a3 endDate:
{
  id v4 = a3;
  id v5 = a2;
  self;
  if (_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounterInitialized, &__block_literal_global_650);
  }
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounter, (uint64_t)v5, v4);
}

- (void)_performInitialSync
{
  CFTypeRef v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Running scheduled initial sync", v3, v4, v5, v6, v7);
}

- (void)_finishActivityWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 176) activity];
    if (v4)
    {
      if (v3 && +[_DKCKError isShouldDeferError:]((uint64_t)_DKCKError, v3))
      {
        xpc_activity_state_t state = xpc_activity_get_state(v4);
        if (state != 3 && state != 5)
        {
          uint8_t v7 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Coordinator _finishActivityWithError:].cold.6(a1, v3);
          }

          if (!xpc_activity_set_state(v4, 3))
          {
            int v8 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              -[_DKSync2Coordinator _finishActivityWithError:].cold.5();
            }

            xpc_activity_set_state(v4, 5);
          }
        }
      }
      xpc_activity_state_t v9 = xpc_activity_get_state(v4);
      if (v9 == 5)
      {
        uint64_t v10 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[_DKSync2Coordinator _finishActivityWithError:].cold.4();
        }
      }
      else
      {
        if (v9 != 3)
        {
          id v11 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Coordinator _finishActivityWithError:]();
          }

          xpc_activity_set_state(v4, 5);
          goto LABEL_27;
        }
        uint64_t v10 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[_DKSync2Coordinator _finishActivityWithError:]();
        }
      }
    }
    else
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[_DKSync2Coordinator _finishActivityWithError:]();
      }
    }

LABEL_27:
  }
}

- (void)_performPeriodicJob
{
  CFTypeRef v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Running periodic sync job", v3, v4, v5, v6, v7);
}

- (double)_intervalForJobGivenIsSingleDevice:(id *)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = +[_DKSync2Policy policyForSyncTransportType:1];
  uint64_t v5 = +[_DKSync2Policy policyForSyncTransportType:4];
  uint64_t v6 = +[_DKSync2Policy policyForSyncTransportType:8];
  uint8_t v7 = +[_DKSyncUrgencyTracker sharedInstance]();
  uint64_t v8 = -[_DKEventData version]((uint64_t)v7);
  double v9 = -1.0;
  double v10 = -1.0;
  if ([a1[31] isAvailable])
  {
    [v4 hoursBetweenSyncsWhenIsSingleDevice:a2 urgency:v8];
    double v10 = v11;
  }
  if ([a1[29] isAvailable])
  {
    [v5 hoursBetweenSyncsWhenIsSingleDevice:a2 urgency:v8];
    double v9 = v12;
  }
  int v13 = [a1[30] isAvailable];
  double v14 = -1.0;
  if (v13) {
    objc_msgSend(v6, "hoursBetweenSyncsWhenIsSingleDevice:urgency:", a2, v8, -1.0);
  }
  if (v10 >= 1.79769313e308 || v10 <= 0.0) {
    double v16 = 1.79769313e308;
  }
  else {
    double v16 = v10;
  }
  if (v9 < v16 && v9 > 0.0) {
    double v16 = v9;
  }
  if (v14 >= v16 || v14 <= 0.0) {
    double v14 = v16;
  }
  BOOL v19 = v14 >= 1.79769313e308 || v14 <= 0.0;
  double v20 = v14 * 60.0 * 60.0;
  if (v19) {
    double v21 = 0.0;
  }
  else {
    double v21 = v20;
  }

  return v21;
}

- (id)_executionCriteriaWithInterval:(uint64_t)a1
{
  keys[6] = *(char **)MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (char *)*MEMORY[0x1E4F142F8];
    keys[0] = *(char **)MEMORY[0x1E4F141C8];
    keys[1] = v2;
    uint64_t v3 = (char *)*MEMORY[0x1E4F142B0];
    keys[2] = *(char **)MEMORY[0x1E4F142C8];
    keys[3] = v3;
    uint64_t v4 = (char *)*MEMORY[0x1E4F14320];
    keys[4] = *(char **)MEMORY[0x1E4F14338];
    keys[5] = v4;
    values[0] = xpc_int64_create((uint64_t)a2);
    values[1] = xpc_BOOL_create(1);
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E4F142D0]);
    values[3] = xpc_BOOL_create(1);
    values[4] = xpc_BOOL_create(1);
    values[5] = xpc_BOOL_create(1);
    xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    uint64_t v6 = +[_DKSyncUrgencyTracker sharedInstance]();
    if ((unint64_t)-[_DKEventData version]((uint64_t)v6) <= 6) {
      xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14340], 1);
    }

    for (uint64_t i = 5; i != -1; --i)
  }
  else
  {
    xpc_object_t v5 = 0;
  }
  return v5;
}

- (void)_registerPeriodicJobWithInterval:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    xpc_object_t v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_DKSync2Coordinator _registerPeriodicJobWithInterval:](a2);
    }

    objc_initWeak(&location, (id)a1);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __56___DKSync2Coordinator__registerPeriodicJobWithInterval___block_invoke;
    id v15 = &unk_1E560D358;
    objc_copyWeak(&v16, &location);
    uint64_t v6 = (void *)MEMORY[0x192FB31A0](&v12);
    uint8_t v7 = +[_DKSyncSerializer underlyingQueue];
    uint64_t v8 = +[_CDPeriodicSchedulerJob jobWithInterval:@"com.apple.knowledgestore.sync" schedulerJobName:v7 queue:1 asynchronousHandler:v6 handler:a2];
    double v9 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v8;

    double v10 = -[_DKSync2Coordinator _executionCriteriaWithInterval:](a1, a2);
    [*(id *)(a1 + 176) setExecutionCriteria:v10];
    double v11 = +[_CDPeriodicScheduler sharedInstance];
    [v11 registerJob:*(void *)(a1 + 176)];

    *(double *)(a1 + 104) = a2;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)_cloudSyncAvailabilityDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___DKSync2Coordinator__cloudSyncAvailabilityDidChange___block_invoke;
  v3[3] = &unk_1E560D578;
  v3[4] = self;
  +[_DKSyncSerializer performAsyncBlock:v3];
}

- (void)_syncPolicyDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44___DKSync2Coordinator__syncPolicyDidChange___block_invoke;
  v3[3] = &unk_1E560D578;
  v3[4] = self;
  +[_DKSyncSerializer performAsyncBlock:v3];
}

- (void)_deleteForeignSiriEvents
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:v0];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Deleted %@ foreign Siri events", v5, v6, v7, v8, v9);
}

- (void)_deleteSiriCloudEvents
{
  if (a1)
  {
    [*(id *)(a1 + 216) setObject:MEMORY[0x1E4F1CC38] forKey:@"NeedsSiriCloudDelete"];
    if ([*(id *)(a1 + 240) isAvailable])
    {
      id v2 = [MEMORY[0x1E4F1C9C8] distantPast];
      -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:](a1, v2);
    }
  }
}

- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:(uint64_t)a1
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x192FB2F20]();
    uint64_t v5 = +[_CDPortraitStreams entityStream];
    uint64_t v6 = [v5 name];
    v42[0] = v6;
    uint64_t v7 = +[_CDPortraitStreams topicStream];
    uint64_t v8 = [v7 name];
    v42[1] = v8;
    uint8_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];

    double v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    double v11 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v3, v10);
    uint64_t v41 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];

    uint64_t v13 = *(void **)(a1 + 224);
    id v39 = 0;
    double v14 = [v13 sortedEventsFromSyncWindows:v12 streamNames:v9 limit:1000 fetchOrder:1 error:&v39];
    id v15 = v39;
    if (v15)
    {
      id v16 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:]();
      }
    }
    else if ([v14 count])
    {
      BOOL v29 = v9;
      BOOL v30 = v4;
      id v31 = v3;
      BOOL v17 = [*(id *)(a1 + 208) deviceUUID];
      BOOL v18 = [v17 UUIDString];

      BOOL v19 = objc_opt_new();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      int v28 = v14;
      id v20 = v14;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "UUID", v28);
            -[_DKSyncDeletedEventIDs addDeletedEventID:forSourceDeviceID:]((uint64_t)v19, v25, v18);
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v22);
      }

      unint64_t v26 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:]();
      }

      int v27 = *(void **)(a1 + 240);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke;
      v32[3] = &unk_1E560D7A8;
      id v33 = v20;
      uint64_t v34 = a1;
      [v27 updateStorageWithAddedEvents:0 deletedEventIDs:v19 highPriority:1 completion:v32];

      uint64_t v4 = v30;
      id v3 = v31;
      double v14 = v28;
      uint8_t v9 = v29;
    }
    else
    {
      [*(id *)(a1 + 216) setObject:MEMORY[0x1E4F1CC28] forKey:@"NeedsSiriCloudDelete"];
    }
  }
}

+ (id)streamNamesToTombstone
{
  id v2 = objc_opt_new();
  id v3 = +[_DKSync2Policy policyForSyncTransportType:1];
  uint64_t v4 = [v3 streamNamesToSyncWithDisabledFeatures:0];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[_DKSync2Policy policyForSyncTransportType:4];
  uint64_t v6 = [v5 streamNamesToSyncWithDisabledFeatures:0];
  [v2 addObjectsFromArray:v6];

  uint64_t v7 = +[_DKSync2Policy policyForSyncTransportType:8];
  uint64_t v8 = [v7 streamNamesToSyncWithDisabledFeatures:0];
  [v2 addObjectsFromArray:v8];

  return v2;
}

+ (NSObject)_syncTypeFromActivity:(uint64_t)a1
{
  id v2 = a2;
  self;
  xpc_object_t v3 = xpc_activity_copy_criteria(v2);

  if (v3 && MEMORY[0x192FB3850](v3) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = xpc_dictionary_get_value(v3, "_DKSyncType");
    uint64_t v6 = (void *)v5;
    if (v5 && MEMORY[0x192FB3850](v5) == MEMORY[0x1E4F14580])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9B8];
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      uint64_t v7 = [v8 dataWithBytes:bytes_ptr length:xpc_data_get_length(v6)];
      if ([v7 length])
      {
        id v15 = 0;
        double v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v15];
        id v11 = v15;
        uint64_t v12 = +[_CDLogging syncChannel];
        uint64_t v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            +[_DKSync2Coordinator _syncTypeFromActivity:].cold.4();
          }

          uint64_t v4 = 0;
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            +[_DKSync2Coordinator _syncTypeFromActivity:]();
          }

          uint64_t v4 = v10;
        }
      }
      else
      {
        double v10 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[_DKSync2Coordinator _syncTypeFromActivity:]();
        }
        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v7 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[_DKSync2Coordinator _syncTypeFromActivity:]();
      }
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_updatedExecutionCriteriaFromType:(uint64_t)a1
{
  keys[4] = *(char **)MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  xpc_object_t v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = *(void **)(a1 + 192);
    if (v6)
    {
      +[_DKSync2Coordinator _syncTypeFromActivity:]((uint64_t)_DKSync2Coordinator, v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (-[_DKSyncType isEqualToSyncType:]((uint64_t)v4, v7))
      {
        uint64_t v8 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:]();
        }
        xpc_object_t v5 = 0;
        goto LABEL_27;
      }
      xpc_object_t v10 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 192));
      id v11 = v10;
      if (v10 && MEMORY[0x192FB3850](v10) == MEMORY[0x1E4F14590])
      {
        int64_t int64 = xpc_dictionary_get_int64(v11, (const char *)*MEMORY[0x1E4F14170]);
        if (int64 >= 0) {
          uint64_t v13 = int64;
        }
        else {
          uint64_t v13 = int64 + 1;
        }
        int64_t v9 = v13 >> 1;
        double v14 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:].cold.4();
        }
      }
      else
      {
        int64_t v9 = 10;
      }
    }
    else
    {
      int64_t v9 = 10;
    }
    id v21 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v21];
    id v7 = v21;
    if (v7)
    {
      id v15 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:]();
      }
    }
    else
    {
      id v16 = v8;
      id v15 = xpc_data_create((const void *)[v16 bytes], [v16 length]);
      if (v15)
      {
        BOOL v17 = (char *)*MEMORY[0x1E4F141A8];
        keys[0] = *(char **)MEMORY[0x1E4F14170];
        keys[1] = v17;
        keys[2] = *(char **)MEMORY[0x1E4F142C8];
        keys[3] = "_DKSyncType";
        values[0] = xpc_int64_create(v9);
        values[1] = xpc_int64_create(v9);
        values[2] = xpc_string_create((const char *)*MEMORY[0x1E4F142E0]);
        id v15 = v15;
        values[3] = v15;
        xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
        for (uint64_t i = 3; i != -1; --i)

        goto LABEL_26;
      }
      id v20 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:]();
      }
    }
    xpc_object_t v5 = 0;
LABEL_26:

LABEL_27:
  }

  return v5;
}

- (void)_checkInTriggeredSyncActivity:(int)a3 isStartup:
{
  id v6 = a2;
  if (a1)
  {
    id v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    uint64_t v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_DKSync2Coordinator _checkInTriggeredSyncActivity:isStartup:]();
    }

    objc_storeStrong((id *)(a1 + 192), a2);
    int64_t v9 = +[_DKSync2Coordinator _syncTypeFromActivity:]((uint64_t)_DKSync2Coordinator, v6);
    if (v9)
    {
      xpc_object_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Coordinator _checkInTriggeredSyncActivity:isStartup:]();
      }
    }
    else if (a3)
    {
      -[_DKSync2Coordinator _unregisterTriggeredSyncActivity](a1);
    }
    else
    {
      -[_DKSync2Coordinator _updateTriggeredSyncActivity](a1);
    }
  }
}

- (void)_runTriggeredSyncActivity:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    xpc_object_t v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_DKSync2Coordinator _runTriggeredSyncActivity:]();
    }

    id v6 = +[_DKSync2Coordinator _syncTypeFromActivity:]((uint64_t)_DKSync2Coordinator, v3);
    -[_DKSyncType setXpcActivity:]((uint64_t)v6, v3);
    objc_initWeak(&location, a1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke;
    v7[3] = &unk_1E560D7D0;
    objc_copyWeak(&v8, &location);
    v7[4] = a1;
    -[_DKSync2Coordinator _performSyncWithSyncType:completion:](a1, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  xpc_object_t v5 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceivePublicToken:]();
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceiveIncomingMessage:]();
  }

  id v7 = [_DKSyncType alloc];
  char v8 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)self);
  int64_t v9 = -[_DKSyncType initWithIsSingleDevice:](v7, v8);
  -[_DKSyncType setIsTriggeredSync:]((uint64_t)v9, 1);
  -[_DKSyncType setDidReceivePush:]((uint64_t)v9, 1);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke;
  v10[3] = &unk_1E560D730;
  v10[4] = self;
  -[_DKSync2Coordinator _performSyncWithSyncType:completion:]((id *)&self->super.super.isa, v9, v10);
}

- (void)knowledgeStorage:(id)a3 didHaveInsertsAndDeletesWithCount:(unint64_t)a4
{
}

- (void)_databaseDidDeleteFromStreamNameCounts:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_DKKeyValueStore *)self->_keyValueStore numberForKey:@"DeletedSyncedEventCount"];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v8 = self->_streamNamesObservedForDeletions;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 += [v4 countForObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v10);
  }

  if (v7)
  {
    keyValueStore = self->_keyValueStore;
    double v14 = [NSNumber numberWithUnsignedInteger:v7];
    [(_DKKeyValueStore *)keyValueStore setNumber:v14 forKey:@"DeletedSyncedEventCount"];

    LODWORD(v14) = -[_DKSync2Coordinator isSingleDevice]((uint64_t)self);
    id v15 = +[_CDLogging syncChannel];
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16) {
        -[_DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate) _databaseDidDeleteFromStreamNameCounts:]();
      }
    }
    else
    {
      if (v16)
      {
        BOOL v19 = [(id)objc_opt_class() description];
        id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
        id v21 = [NSNumber numberWithUnsignedInteger:v7];
        *(_DWORD *)buf = 138543874;
        BOOL v29 = v19;
        __int16 v30 = 2112;
        id v31 = v20;
        __int16 v32 = 2112;
        id v33 = v21;
        _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Delete from %@ event streams is triggering sync attempt due to event count of %@", buf, 0x20u);
      }
      BOOL v17 = [_DKSyncType alloc];
      char v18 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)self);
      id v15 = -[_DKSyncType initWithIsSingleDevice:](v17, v18);
      -[_DKSyncType setIsTriggeredSync:]((uint64_t)v15, 1);
      -[_DKSyncType setDidDeleteSyncedEvents:]((uint64_t)v15, 1);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke;
      v22[3] = &unk_1E560D7A8;
      v22[4] = self;
      id v23 = v4;
      -[_DKSync2Coordinator _performSyncWithSyncType:completion:]((id *)&self->super.super.isa, v15, v22);
    }
  }
  else
  {
    id v15 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(_DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate) *)(uint64_t)self _databaseDidDeleteFromStreamNameCounts:v15];
    }
  }
}

- (void)knowledgeStorage:(id)a3 didDeleteEventsWithStreamNameCounts:(id)a4
{
  id v5 = a4;
  id v6 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate) knowledgeStorage:didDeleteEventsWithStreamNameCounts:]();
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate__knowledgeStorage_didDeleteEventsWithStreamNameCounts___block_invoke;
  v8[3] = &unk_1E560D848;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  +[_DKSyncSerializer performAsyncBlock:v8];
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 fetchOrder:(int64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  double v14 = +[_DKCompatibility currentCompatibility];
  id v15 = [(_DKSync2Coordinator *)self sortedEventsFromSyncWindows:v13 streamNames:v12 compatibility:v14 limit:a5 fetchOrder:a6 error:a7];

  return v15;
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 compatibility:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 error:(id *)a8
{
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  BOOL v17 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v17);

  char v18 = [(_DKSyncLocalKnowledgeStorage *)self->_localStorage sortedEventsFromSyncWindows:v16 streamNames:v15 compatibility:v14 limit:a6 fetchOrder:a7 error:a8];

  return v18;
}

- (id)deletedEventIDsSinceDate:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 endDate:(id *)a6 error:(id *)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [(_DKSyncLocalKnowledgeStorage *)self->_localStorage tombstonesSinceDate:v12 streamNames:v13 limit:a5 endDate:a6 error:a7];
  if ([v15 count])
  {
    id v36 = v13;
    id v37 = v12;
    id v38 = (id)objc_opt_new();
    id v16 = +[_DKSystemEventStreams appWebUsageStream];
    BOOL v17 = [v16 name];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v35 = v15;
    id obj = v15;
    uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v23 = [v22 metadata];
          long long v24 = +[_DKTombstoneMetadataKey eventSourceDeviceID];
          long long v25 = [v23 objectForKeyedSubscript:v24];

          if (!v25) {
            goto LABEL_9;
          }
          long long v26 = [v22 metadata];
          long long v27 = +[_DKTombstoneMetadataKey eventStreamName];
          int v28 = [v26 objectForKeyedSubscript:v27];

          LODWORD(v26) = [v28 isEqualToString:v17];
          if (v26)
          {
LABEL_9:
            BOOL v29 = [v22 stringValue];
            if (v29)
            {
              __int16 v30 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v29];
              if (v30)
              {
                [v38 addObject:v30];
              }
              else
              {
                __int16 v32 = +[_CDLogging syncChannel];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  id v33 = [(id)objc_opt_class() description];
                  *(_DWORD *)buf = 138543618;
                  id v45 = v33;
                  __int16 v46 = 2112;
                  int v47 = v29;
                  _os_log_error_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to malformed tombstone uuid: %@", buf, 0x16u);
                }
              }
            }
            else
            {
              __int16 v30 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                id v31 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543618;
                id v45 = v31;
                __int16 v46 = 2112;
                int v47 = v22;
                _os_log_error_impl(&dword_18ECEB000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to missing tombstone uuid: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v19);
    }

    id v13 = v36;
    id v12 = v37;
    id v15 = v35;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

- (_DKSyncType)syncType
{
  id v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  syncState = self->_syncState;
  if (syncState) {
    syncState = objc_getProperty(syncState, v4, 16, 1);
  }
  id v6 = syncState;
  return (_DKSyncType *)v6;
}

- (void)_registerTriggeredSyncActivityWithIsStartup:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Registering triggered sync activity", v3, v4, v5, v6, v7);
}

- (void)_unregisterDatabaseObservers
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Unregistering sync database observers", v3, v4, v5, v6, v7);
}

+ (void)shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Failed to defer activity", v3, v4, v5, v6, v7);
}

- (void)handleFetchedSourceDeviceID:(NSObject *)a3 version:fromPeer:error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)objc_opt_class() description];
  uint64_t v6 = &stru_1EDDE58B8;
  if ([a2 me]) {
    uint8_t v7 = @"pseudo ";
  }
  else {
    uint8_t v7 = &stru_1EDDE58B8;
  }
  char v8 = [a2 identifier];
  id v9 = [a2 model];
  if (v9)
  {
    uint64_t v10 = NSString;
    a2 = [a2 model];
    uint64_t v6 = [v10 stringWithFormat:@" (%@)", a2];
  }
  *(_DWORD *)buf = 138544130;
  id v12 = v5;
  __int16 v13 = 2114;
  id v14 = v7;
  __int16 v15 = 2114;
  id v16 = v8;
  __int16 v17 = 2114;
  uint64_t v18 = v6;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Missing source device id requested from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
  if (v9)
  {
  }
}

- (void)_synchronizeWithUrgency:client:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Skipping urgent sync, %{public}@ feature is disabled", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Sync in progress, queueing completion block", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.2()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Sync pending, queueing completion block", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.3()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Triggered sync pending and received another triggered sync", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.4()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Sync not yet started, upgrading to forced sync", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.5()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Sync not yet started, upgrading to periodic sync", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.6()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Currently syncing, will leave current sync type unchanged", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.7()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Sync pending, upgrading to forced sync", v3, v4, v5, v6, v7);
}

- (void)_performSyncWithSyncType:completion:.cold.8()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Sync pending, upgrading to periodic sync", v3, v4, v5, v6, v7);
}

- (void)__performSyncWithCompletion:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: No sync operations to queue", v3, v4, v5, v6, v7);
}

- (void)__performSyncWithCompletion:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Done queuing sync operations", buf, 0xCu);
}

- (void)_finishActivityWithError:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_18ECEB000, v1, v2, "%{public}@: Missing periodic job activity", v3, v4, v5, v6, v7);
}

- (void)_finishActivityWithError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [*(id *)(v3 + 176) jobName];
  uint64_t v6 = [NSNumber numberWithLong:v1];
  int v7 = 138543874;
  char v8 = v4;
  OUTLINED_FUNCTION_15();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Unexpected state for running activity %@: %@", (uint8_t *)&v7, 0x20u);
}

- (void)_finishActivityWithError:.cold.3()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [*(id *)(v0 + 176) jobName];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Deferred running activity %@", v5, v6, v7, v8, v9);
}

- (void)_finishActivityWithError:.cold.4()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [*(id *)(v0 + 176) jobName];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Done running activity %@", v5, v6, v7, v8, v9);
}

- (void)_finishActivityWithError:.cold.5()
{
  OUTLINED_FUNCTION_20();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [*(id *)(v1 + 176) jobName];
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Failed to defer activity %@", v4, 0x16u);
}

- (void)_finishActivityWithError:(uint64_t)a1 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [*(id *)(a1 + 176) jobName];
  uint64_t v6 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_19(&dword_18ECEB000, v7, v8, "%{public}@: Deferring activity %@ due to : %{public}@:%lld (%@)", v9, v10, v11, v12, v13);
}

- (void)_registerPeriodicJobWithInterval:(double)a1 .cold.1(double a1)
{
  uint64_t v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [NSNumber numberWithDouble:a1];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v4, v5, "%{public}@: Scheduling periodic sync job with interval %@", v6, v7, v8, v9, 2u);
}

- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:-[_DKSyncDeletedEventIDs count](v0)];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Deleting %@ Siri events", v5, v6, v7, v8, v9);
}

- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed while deleting foreign Siri events: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

+ (void)_syncTypeFromActivity:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Sync type data unexpectedly missing from the activity", v3, v4, v5, v6, v7);
}

+ (void)_syncTypeFromActivity:.cold.2()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Cannot create NSData from the sync type xpc data", v3, v4, v5, v6, v7);
}

+ (void)_syncTypeFromActivity:.cold.3()
{
  OUTLINED_FUNCTION_6();
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Deserialized sync type from xpc activity: %@", v3, v4, v5, v6, v7);
}

+ (void)_syncTypeFromActivity:.cold.4()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Error deserializing syncType: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

- (void)_updatedExecutionCriteriaFromType:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Error creating syncType xpc data", v3, v4, v5, v6, v7);
}

- (void)_updatedExecutionCriteriaFromType:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Error serializing syncType: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

- (void)_updatedExecutionCriteriaFromType:.cold.3()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Triggered sync type already matches the one in xpc activity", v3, v4, v5, v6, v7);
}

- (void)_updatedExecutionCriteriaFromType:.cold.4()
{
  OUTLINED_FUNCTION_6();
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Pushing out triggered sync's delay by %lld seconds", v3, v4, v5, v6, v7);
}

- (void)_checkInTriggeredSyncActivity:isStartup:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Found previously scheduled triggered sync activity", v3, v4, v5, v6, v7);
}

- (void)_checkInTriggeredSyncActivity:isStartup:.cold.2()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Checking in for triggered sync activity", v3, v4, v5, v6, v7);
}

- (void)_runTriggeredSyncActivity:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Running triggered sync activity", v3, v4, v5, v6, v7);
}

@end