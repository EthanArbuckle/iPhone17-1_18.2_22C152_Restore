@interface CPLEngineLibrary
+ (BOOL)failOnPushingChangesTimeout;
+ (double)timeToWaitForClientToActivateScopes;
+ (double)timeToWaitForClientToPullChanges;
+ (double)timeToWaitForClientToPushChanges;
+ (double)timeToWaitForLibrary;
+ (id)platformImplementationProtocol;
+ (void)setFailOnPushingChangesTimeout:(BOOL)a3;
+ (void)setTimeToWaitForClientToActivateScopes:(double)a3;
+ (void)setTimeToWaitForClientToPullChanges:(double)a3;
+ (void)setTimeToWaitForClientToPushChanges:(double)a3;
+ (void)setTimeToWaitForLibrary:(double)a3;
- (BOOL)containerHasBeenWiped;
- (BOOL)hasAssetCountOnServer;
- (BOOL)hasChangesToProcess;
- (BOOL)iCloudLibraryClientIsNotAuthenticated;
- (BOOL)iCloudLibraryClientVersionTooOld;
- (BOOL)iCloudLibraryExists;
- (BOOL)iCloudLibraryHasBeenWiped;
- (BOOL)isAppLibrary;
- (BOOL)isExceedingQuota;
- (BOOL)isExceedingSharedLibraryQuota;
- (BOOL)isKeychainCDPEnabled;
- (BOOL)isStuckInExitForSharedLibrary;
- (BOOL)isSystemLibrary;
- (BOOL)isUpgradeSuggestedToAccessAllPhotos;
- (BOOL)isWalrusEnabled;
- (BOOL)libraryIsCorrupted;
- (CPLConfiguration)configuration;
- (CPLEngineFeedbackManager)feedback;
- (CPLEngineLibrary)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8;
- (CPLEngineLibraryOwner)owner;
- (CPLEngineLibrarySupervisor)supervisor;
- (CPLEngineScheduler)scheduler;
- (CPLEngineStore)store;
- (CPLEngineSyncManager)syncManager;
- (CPLEngineSystemMonitor)systemMonitor;
- (CPLEngineTransport)transport;
- (CPLPlatformObject)platformObject;
- (NSArray)processesInvolvedInSyncSessions;
- (NSDate)exitDeleteTime;
- (NSDate)initialDownloadDate;
- (NSDate)initialSyncDate;
- (NSString)clientAppBundleIdentifier;
- (NSString)currentClosingComponentName;
- (NSString)description;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSURL)clientLibraryBaseURL;
- (NSURL)cloudLibraryResourceStorageURL;
- (NSURL)cloudLibraryStateStorageURL;
- (id)_allComponentsIncludingPlatformObjects:(BOOL)a3 respondingToSelector:(SEL)a4;
- (id)_libraryObject;
- (id)_performBlockWhenLibraryAttaches:(id)a3;
- (id)componentName;
- (id)corruptionInfo;
- (id)redactedDescription;
- (int64_t)busyState;
- (int64_t)serverFeatureCompatibleVersion;
- (unint64_t)estimatedCountOfRemainingRecordsDuringSharedLibraryExit;
- (unint64_t)libraryOptions;
- (unint64_t)totalAssetCountOnServer;
- (void)_cancelBlockWhenLibraryAttaches:(id)a3;
- (void)_closeNextComponent:(id)a3 deactivate:(BOOL)a4 lastError:(id)a5 completionHandler:(id)a6;
- (void)_fillStatus:(id)a3 forComponents:(id)a4 completionHandler:(id)a5;
- (void)_fillStatusArray:(id)a3 forComponents:(id)a4 completionHandler:(id)a5;
- (void)_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged;
- (void)_openNextComponent:(id)a3 completionHandler:(id)a4;
- (void)_performBlockWithLibrary:(BOOL)a3 enumerateAttachedObjects:(id)a4;
- (void)_performPendingBlockForWhenLibraryAttaches;
- (void)_reportQuarantineCountIfNecessaryWithLastReportDate:(id)a3;
- (void)_setCurrentClosingComponentName:(id)a3;
- (void)_testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)_updateTotalAssetCountWithAssetCounts:(id)a3;
- (void)attachObject:(id)a3 withCompletionHandler:(id)a4;
- (void)blockEngineWithReason:(id)a3 onlyIfBlocked:(BOOL)a4 block:(id)a5;
- (void)clientIsPushingChanges;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)detachObject:(id)a3 withCompletionHandler:(id)a4;
- (void)emergencyClose;
- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5;
- (void)forceInitialDownloadWithActivity:(id)a3 scopeIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)getListOfComponentsWithCompletionHandler:(id)a3;
- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4;
- (void)markAttachedObjectAsInvalid:(id)a3;
- (void)noteMainScopeHasBeenActivated;
- (void)notifyAttachedObjectsHasStatusChanges;
- (void)notifyAttachedObjectsPullQueueIsFull;
- (void)notifyAttachedObjectsResourceDidDownloadInBackground:(id)a3;
- (void)notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:(id)a3;
- (void)notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7;
- (void)notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged;
- (void)notifyAttachedObjectsUploadTask:(id)a3 didFinishWithError:(id)a4;
- (void)notifyAttachedObjectsUploadTask:(id)a3 didProgress:(float)a4;
- (void)notifyAttachedObjectsUploadTaskDidStart:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)performBlockOnLibrary:(id)a3;
- (void)performMaintenanceCleanupWithCompletionHandler:(id)a3;
- (void)provideCloudResource:(id)a3 completionHandler:(id)a4;
- (void)providePayloadForComputeStates:(id)a3 inFolderWithURL:(id)a4 completionHandler:(id)a5;
- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)reportLibraryCorrupted;
- (void)reportQuarantineCountIfNecessary;
- (void)requestAttachedLibrary;
- (void)requestClientToPullAllChangesWithScopeIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3;
- (void)requestScopesWithIdentifiersToBeActivated:(id)a3 completionHandler:(id)a4;
- (void)setBusyState:(int64_t)a3;
- (void)setConnectedToNetwork:(BOOL)a3 cellularIsRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5;
- (void)setContainerHasBeenWiped:(BOOL)a3;
- (void)setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:(unint64_t)a3;
- (void)setExitDeleteTime:(id)a3;
- (void)setHasCellularBudget:(BOOL)a3 hasBatteryBudget:(BOOL)a4 hasLowBatteryLevel:(BOOL)a5 isConstrainedNetwork:(BOOL)a6 isBlockedByLowPowerMode:(BOOL)a7 hasHeavyResourceUsage:(BOOL)a8 hasPoorNetworkQuality:(BOOL)a9 hasModerateThermalPressure:(BOOL)a10 hasThermalPressure:(BOOL)a11 hasPoorSystemConditions:(BOOL)a12 isBudgetValid:(BOOL)a13 blockedReason:(int64_t)a14 unBlockedReason:(int64_t)a15;
- (void)setHasChangesToProcess:(BOOL)a3;
- (void)setICloudLibraryClientIsNotAuthenticated:(BOOL)a3;
- (void)setICloudLibraryClientVersionTooOld:(BOOL)a3;
- (void)setICloudLibraryExists:(BOOL)a3;
- (void)setICloudLibraryHasBeenWiped:(BOOL)a3;
- (void)setIsExceedingQuota:(BOOL)a3;
- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3;
- (void)setIsStuckInExitForSharedLibrary:(BOOL)a3;
- (void)setKeychainCDPEnabled:(BOOL)a3;
- (void)setLowDiskSpace:(BOOL)a3 veryLowDiskSpace:(BOOL)a4;
- (void)setOwner:(id)a3;
- (void)setServerFeatureCompatibleVersion:(int64_t)a3;
- (void)setSupervisor:(id)a3;
- (void)setUpgradeSuggestedToAccessAllPhotos:(BOOL)a3;
- (void)setWalrusEnabled:(BOOL)a3;
- (void)startSyncSession;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)updateAccountFlagsData:(id)a3;
- (void)updateAssetCountsFromServer:(id)a3;
- (void)updateBlockedMetrics:(BOOL)a3 syncRequested:(BOOL)a4;
- (void)updateComputeSyncMetrics:(int64_t)a3 silentDecryptionFailed:(BOOL)a4 error:(id)a5;
- (void)updateDisabledFeatures:(id)a3;
- (void)updateInitialDownloadDate:(id)a3;
- (void)updateInitialSyncDate:(id)a3;
- (void)updateLastSuccessfullSyncDate:(id)a3;
@end

@implementation CPLEngineLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_supervisor, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudLibraryResourceStorageURL, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateStorageURL, 0);
  objc_storeStrong((id *)&self->_clientLibraryBaseURL, 0);
  objc_storeStrong((id *)&self->_mainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_currentClosingComponentName, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong(&self->_metricsObserver, 0);
  objc_storeStrong((id *)&self->_mostRecentScopeStatusCountsDidChangeNotificationDate, 0);
  objc_storeStrong((id *)&self->_timerForPushRepositoryFlagsCountsHaveChanged, 0);
  objc_storeStrong(&self->_pingRequestToPushAllChanges, 0);
  objc_storeStrong((id *)&self->_holdTestAssertions, 0);
  objc_storeStrong((id *)&self->_cachedLastQuarantineCountReportDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_openingError, 0);
  objc_storeStrong((id *)&self->_invalidAttachedObjects, 0);
  objc_storeStrong((id *)&self->_attachedObjects, 0);
  objc_storeStrong((id *)&self->_blocksToDispatchWhenLibraryAttaches, 0);
  objc_storeStrong((id *)&self->_closingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

- (BOOL)libraryIsCorrupted
{
  return self->_libraryIsCorrupted;
}

- (CPLConfiguration)configuration
{
  return self->_configuration;
}

- (CPLEngineFeedbackManager)feedback
{
  return self->_feedback;
}

- (CPLEngineSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (CPLEngineTransport)transport
{
  return self->_transport;
}

- (CPLEngineSyncManager)syncManager
{
  return self->_syncManager;
}

- (CPLEngineScheduler)scheduler
{
  return self->_scheduler;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void)setSupervisor:(id)a3
{
}

- (CPLEngineLibrarySupervisor)supervisor
{
  return self->_supervisor;
}

- (void)setOwner:(id)a3
{
}

- (CPLEngineLibraryOwner)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (CPLEngineLibraryOwner *)WeakRetained;
}

- (unint64_t)libraryOptions
{
  return self->_libraryOptions;
}

- (BOOL)isAppLibrary
{
  return self->_isAppLibrary;
}

- (BOOL)isSystemLibrary
{
  return self->_isSystemLibrary;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSURL)cloudLibraryResourceStorageURL
{
  return self->_cloudLibraryResourceStorageURL;
}

- (NSURL)cloudLibraryStateStorageURL
{
  return self->_cloudLibraryStateStorageURL;
}

- (NSURL)clientLibraryBaseURL
{
  return self->_clientLibraryBaseURL;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (NSString)clientAppBundleIdentifier
{
  v2 = [(CPLEngineLibrary *)self libraryIdentifier];
  v3 = CPLAppBundleIdentifierForLibraryIdentifier(v2);

  return (NSString *)v3;
}

- (NSArray)processesInvolvedInSyncSessions
{
  v3 = [(CPLEngineStore *)self->_store derivativesCache];
  v4 = objc_msgSend((id)objc_msgSend(v3, "derivativeGeneratorClass"), "involvedProcesses");
  id v5 = (id)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v6 = [(CPLEngineTransport *)self->_transport involvedProcesses];
  [v5 addObjectsFromArray:v6];

  v7 = [MEMORY[0x1E4F28F80] processInfo];
  v8 = [v7 processName];
  [v5 addObject:v8];

  return (NSArray *)v5;
}

- (void)emergencyClose
{
  [(CPLEngineLibrarySupervisor *)self->_supervisor engineWillClose:self];
  store = self->_store;

  [(CPLEngineStore *)store emergencyClose];
}

- (void)performMaintenanceCleanupWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v6 = CPLCopyDefaultSerialQueueAttributes();
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.cpl.enginelibrary.maintenance", v6);

  v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E60A5EE8;
  id v9 = v8;
  id v30 = v9;
  id v10 = v5;
  id v31 = v10;
  v11 = (void *)MEMORY[0x1BA994060](v29);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2;
  v23[3] = &unk_1E60A9E78;
  v12 = v7;
  v24 = v12;
  v25 = self;
  v27 = v34;
  SEL v28 = a2;
  v26 = v32;
  [v9 setCancellationHandler:v23];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_187;
  v15[3] = &unk_1E60A9F40;
  v15[4] = self;
  v13 = v12;
  v16 = v13;
  v18 = v32;
  v19 = v21;
  id v14 = v11;
  id v17 = v14;
  v20 = v34;
  [v9 performAsCurrentWithPendingUnitCount:1 usingBlock:v15];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E60AB818;
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v2;
  v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  v4 = v1;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_187(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 232);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_188;
  v15[3] = &unk_1E60A9EF0;
  v15[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v16 = v4;
  uint64_t v18 = v5;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v10;
  long long v17 = v10;
  uint64_t v19 = *(void *)(a1 + 72);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_192;
  v11[3] = &unk_1E60A9F18;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 72);
  id v12 = v7;
  uint64_t v14 = v8;
  id v13 = *(id *)(a1 + 48);
  id v9 = (id)[v3 performWriteTransactionWithBlock:v15 completionHandler:v11];
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_188(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_189;
  v9[3] = &unk_1E60A9EC8;
  id v4 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  id v10 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v8;
  long long v11 = v8;
  uint64_t v13 = *(void *)(a1 + 72);
  [a2 do:v9];
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_192(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E60A9718;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v6;
  long long v8 = v6;
  v3 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  id v4 = v1;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3_189(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Performing store maintenance", buf, 2u);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  dispatch_block_t v5 = [*(id *)(*(void *)(a1 + 32) + 232) storages];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v20 = a2;
    id v8 = 0;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      uint64_t v10 = 0;
      long long v11 = v8;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        uint64_t v13 = (void *)MEMORY[0x1BA993DF0]();
        id v27 = v11;
        LODWORD(v12) = [v12 performMaintenanceWithError:&v27];
        id v8 = v27;

        if (!v12)
        {

          if (v20)
          {
            id v8 = v8;
            uint64_t v18 = 0;
            void *v20 = v8;
          }
          else
          {
            uint64_t v18 = 0;
          }
          goto LABEL_22;
        }
        uint64_t v14 = *(NSObject **)(a1 + 40);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_190;
        block[3] = &unk_1E60A9BA8;
        long long v26 = *(_OWORD *)(a1 + 56);
        dispatch_sync(v14, block);
        int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if (!v15) {
          goto LABEL_16;
        }
        ++v10;
        long long v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_16:

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_191;
    v22[3] = &unk_1E60A9EA0;
    id v16 = *(NSObject **)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    long long v21 = *(_OWORD *)(a1 + 48);
    id v17 = (id)v21;
    long long v23 = v21;
    uint64_t v24 = *(void *)(a1 + 72);
    dispatch_sync(v16, v22);
  }
  uint64_t v18 = 1;
LABEL_22:

  return v18;
}

uint64_t __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_190(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
  }
  return result;
}

void *__67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_2_191(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[6] + 8) + 24))
  {
    v1 = result;
    result = (void *)[*(id *)(result[4] + 232) startVacuumWithCompletionHandler:result[5]];
    *(unsigned char *)(*(void *)(v1[7] + 8) + 24) = 1;
  }
  return result;
}

void __67__CPLEngineLibrary_performMaintenanceCleanupWithCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      id v4 = (const char *)a1[7];
      id v5 = v3;
      uint64_t v6 = NSStringFromSelector(v4);
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "-[%@ %@] was cancelled by caller", (uint8_t *)&v7, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    [*(id *)(a1[4] + 232) stopVacuum];
  }
}

- (void)blockEngineWithReason:(id)a3 onlyIfBlocked:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  scheduler = self->_scheduler;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke;
  v11[3] = &unk_1E60A9E50;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(CPLEngineScheduler *)scheduler blockAllSyncSessionsWithReason:a3 onlyIfBlocked:v5 block:v11];
}

void __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = *(void **)(*(void *)(a1 + 32) + 232);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke_2;
    v6[3] = &unk_1E60A9E28;
    id v7 = v3;
    id v8 = *(id *)(a1 + 40);
    [v5 blockWriteTransactionsWithCompletionHandler:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __62__CPLEngineLibrary_blockEngineWithReason_onlyIfBlocked_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[CPLEngineBlocker alloc] initWithWriteTransactionBlocker:v3 schedulerBlocker:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)forceInitialDownloadWithActivity:(id)a3 scopeIdentifiers:(id)a4 completionHandler:(id)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!_CPLSilentLogging)
  {
    id v10 = __CPLInitialDownloadOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 componentsJoinedByString:@", "];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Forcing initial download of %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:3];
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  char v99 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__15943;
  v103 = __Block_byref_object_dispose__15944;
  id v104 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x2020000000;
  char v97 = 0;
  v42 = self->_store;
  uint64_t v13 = self->_queue;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__15943;
  v94[4] = __Block_byref_object_dispose__15944;
  id v95 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x2020000000;
  char v93 = 0;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke;
  v80[3] = &unk_1E60A9C98;
  uint64_t v14 = v13;
  v81 = v14;
  v86 = v98;
  id v15 = v12;
  uint64_t v91 = 3;
  id v82 = v15;
  p_long long buf = &buf;
  id v16 = v8;
  id v83 = v16;
  v88 = v92;
  v89 = v96;
  id v41 = v9;
  v84 = self;
  id v85 = v41;
  v90 = v94;
  id v17 = (void *)MEMORY[0x1BA994060](v80);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_5;
  v76[3] = &unk_1E60A6868;
  uint64_t v18 = v14;
  v77 = v18;
  id v19 = v16;
  id v78 = v19;
  id v20 = v17;
  id v79 = v20;
  [v15 setCancellationHandler:v76];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_166;
  v70[3] = &unk_1E60A9CC0;
  long long v21 = v18;
  v71 = v21;
  v75 = v98;
  id v22 = v15;
  id v72 = v22;
  v73 = self;
  id v23 = v20;
  id v74 = v23;
  uint64_t v24 = (void *)MEMORY[0x1BA994060](v70);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_170;
  v61[3] = &unk_1E60A9D38;
  v25 = v21;
  v68 = v98;
  v69 = &buf;
  v62 = v25;
  v63 = self;
  id v44 = v43;
  id v64 = v44;
  id v26 = v23;
  id v66 = v26;
  id v27 = v22;
  id v65 = v27;
  id v28 = v24;
  id v67 = v28;
  long long v29 = (void *)MEMORY[0x1BA994060](v61);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_175;
  v53[3] = &unk_1E60A9DB0;
  long long v30 = v25;
  v54 = v30;
  v55 = self;
  v59 = v98;
  v60 = v96;
  id v31 = v27;
  id v56 = v31;
  id v32 = v26;
  id v57 = v32;
  id v33 = v29;
  id v58 = v33;
  uint64_t v34 = (void *)MEMORY[0x1BA994060](v53);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_178;
  v45[3] = &unk_1E60A9E00;
  v45[4] = self;
  id v35 = v32;
  id v49 = v35;
  v36 = v42;
  v46 = v36;
  id v37 = v19;
  id v47 = v37;
  v38 = v30;
  v48 = v38;
  v51 = v94;
  id v39 = v34;
  id v50 = v39;
  v52 = v92;
  id v40 = [(CPLEngineStore *)v36 performReadTransactionWithBlock:v45];

  _Block_object_dispose(v92, 8);
  _Block_object_dispose(v94, 8);

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v98, 8);
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2;
    v22[3] = &unk_1E60A9C48;
    id v23 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 112);
    uint64_t v6 = *(void *)(a1 + 80);
    id v24 = v5;
    uint64_t v28 = v6;
    id v25 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 64);
    long long v29 = *(_OWORD *)(a1 + 88);
    uint64_t v26 = *(void *)(a1 + 56);
    id v27 = v7;
    uint64_t v8 = MEMORY[0x1BA994060](v22);
    id v9 = (void *)v8;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    }
    else
    {
      id v10 = [*(id *)(a1 + 56) store];
      uint64_t v11 = [v10 scopes];
      id v12 = [*(id *)(a1 + 56) store];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_164;
      v19[3] = &unk_1E60AB878;
      uint64_t v13 = *(void *)(a1 + 104);
      id v20 = v11;
      uint64_t v21 = v13;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3;
      v16[3] = &unk_1E60AB2A0;
      id v17 = *(id *)(a1 + 32);
      id v18 = v9;
      id v14 = v11;
      id v15 = (id)[v12 performWriteTransactionWithBlock:v19 completionHandler:v16];
    }
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_5(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_6;
  v6[3] = &unk_1E60A5EE8;
  id v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  uint64_t v4 = v2;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_166(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_167;
    v8[3] = &unk_1E60A6868;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 56);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_170(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    id v7 = [(CPLEngineForceSyncTask *)[CPLEngineDownloadSyncTask alloc] initWithScopeIdentifiers:v6 engineLibrary:*(void *)(a1 + 40) filter:v5 delegate:*(void *)(*(void *)(a1 + 40) + 248)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setTaskActivity:*(void *)(a1 + 48)];
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v10 UUIDString];
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setTaskIdentifier:v11];

    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setBypassForceSyncLimitations:1];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_172;
    id v19 = &unk_1E60A9D10;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 80);
    id v20 = v12;
    uint64_t v25 = v13;
    id v23 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 72);
    id v22 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setTaskDidFinishWithErrorBlock:&v16];
    if (!_CPLSilentLogging)
    {
      id v14 = __CPLInitialDownloadOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v15;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);
      }
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "launchTask", v16, v17, v18, v19);
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(*(void *)(a1 + 40) + 240) disableSynchronizationWithReason:@"initial download"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_176;
    v8[3] = &unk_1E60A9D88;
    id v7 = *(void **)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v9 = v5;
    id v10 = v6;
    [v7 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_178(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_179;
    v46[3] = &unk_1E60A9C70;
    id v48 = *(id *)(a1 + 64);
    id v47 = v3;
    id v6 = v46;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    v51 = __cpl_dispatch_async_block_invoke_15925;
    v52 = &unk_1E60A6978;
    id v53 = v6;
    id v7 = v5;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v7, v8);

    id v9 = v48;
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) scopes];
    id v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    id v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v30 = a1;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * v14);
          uint64_t v16 = objc_msgSend(v9, "scopeWithIdentifier:", v15, v30);
          if (!v16
            || ([v9 valueForFlag:16 forScope:v16] & 1) != 0
            || ([v9 hasFinishedInitialDownloadForScope:v16] & 1) != 0)
          {
            if (!_CPLSilentLogging)
            {
              uint64_t v17 = __CPLInitialDownloadOSLogDomain();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(block) = 138543362;
                *(void *)((char *)&block + 4) = v15;
                _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ does not need to perform initial download", (uint8_t *)&block, 0xCu);
              }
            }
          }
          else
          {
            [v32 addObject:v15];
            [v31 addObject:v16];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v18 = [v10 countByEnumeratingWithState:&v42 objects:v49 count:16];
        uint64_t v12 = v18;
      }
      while (v18);
    }

    if ([v32 count])
    {
      id v19 = [v9 filterForIncludedScopeIdentifiers:v32];
      id v20 = *(void **)(v30 + 56);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_181;
      v36[3] = &unk_1E60A9DD8;
      uint64_t v41 = *(void *)(v30 + 80);
      id v21 = v31;
      id v37 = v31;
      id v40 = *(id *)(v30 + 72);
      id v38 = v19;
      id v39 = v32;
      id v22 = v36;
      *(void *)&long long block = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      v51 = __cpl_dispatch_async_block_invoke_15925;
      v52 = &unk_1E60A6978;
      id v53 = v22;
      id v23 = v20;
      id v24 = v19;
      dispatch_block_t v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v23, v25);
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_182;
      v33[3] = &unk_1E60A9718;
      uint64_t v35 = *(void *)(v30 + 88);
      uint64_t v26 = *(void **)(v30 + 56);
      id v34 = *(id *)(v30 + 64);
      uint64_t v27 = v33;
      *(void *)&long long block = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      v51 = __cpl_dispatch_async_block_invoke_15925;
      v52 = &unk_1E60A6978;
      id v53 = v27;
      uint64_t v28 = v26;
      dispatch_block_t v29 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v28, v29);

      id v24 = v34;
      id v21 = v31;
    }
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_179(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_181(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (id)[*(id *)(a1 + 48) copy];
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_182(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_176(uint64_t a1)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLInitialDownloadOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Making sure client has pushed all changes", buf, 2u);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_177;
  v4[3] = &unk_1E60A9D60;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 requestClientToPushAllChangesWithCompletionHandler:v4];
}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_177(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else {
    return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5]);
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3_172(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4_173;
  v10[3] = &unk_1E60A9CE8;
  uint64_t v16 = *(void *)(a1 + 72);
  id v11 = v4;
  id v14 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v6;
  id v7 = v5;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4_173(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 72) + 8) + 24))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      uint64_t v2 = *(void *)(result + 56);
    }
    else
    {
      [*(id *)(result + 40) setCompletedUnitCount:2];
      uint64_t v2 = *(void *)(v1 + 64);
    }
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 16);
    return v3();
  }
  return result;
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_167(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLInitialDownloadOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
      *(_DWORD *)long long buf = 138412290;
      dispatch_block_t v9 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Making sure client has pulled all changes for %@", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_168;
  v6[3] = &unk_1E60A69E8;
  id v7 = *(id *)(a1 + 48);
  [v4 requestClientToPullAllChangesWithScopeIdentifiers:v5 completionHandler:v6];
}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLInitialDownloadOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Forced initial download of %{public}@ has been cancelled", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = +[CPLErrors operationCancelledError];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  [*(id *)(a1 + 40) setCompletedUnitCount:*(void *)(a1 + 96)];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v5)
  {
    [v5 cancelTask];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  if (!v3)
  {
    if (_CPLSilentLogging) {
      goto LABEL_17;
    }
    uint64_t v8 = __CPLInitialDownloadOSLogDomain();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    dispatch_block_t v9 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
    int v14 = 138543362;
    id v15 = v9;
    uint64_t v10 = "Initial download of %{public}@ finished successfully";
LABEL_11:
    id v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 12;
LABEL_15:
    _os_log_impl(&dword_1B4CAC000, v11, v12, v10, (uint8_t *)&v14, v13);

    goto LABEL_16;
  }
  if ([v3 isCPLOperationCancelledError])
  {
    if (_CPLSilentLogging) {
      goto LABEL_17;
    }
    uint64_t v8 = __CPLInitialDownloadOSLogDomain();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    dispatch_block_t v9 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
    int v14 = 138543362;
    id v15 = v9;
    uint64_t v10 = "Initial download of %{public}@ has been cancelled";
    goto LABEL_11;
  }
  if (_CPLSilentLogging) {
    goto LABEL_17;
  }
  uint64_t v8 = __CPLInitialDownloadOSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    dispatch_block_t v9 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
    int v14 = 138543618;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    uint64_t v10 = "Initial download of %{public}@ finished with error: %@";
    id v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 22;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v3, v4);
  [*(id *)(a1 + 40) setCancellationHandler:0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    [*(id *)(*(void *)(a1 + 56) + 240) enableSynchronizationWithReason:@"initial download"];
  }
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_164(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_165;
  v6[3] = &unk_1E60AB500;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 do:v6];
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4;
  v10[3] = &unk_1E60A9C70;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __88__CPLEngineLibrary_forceInitialDownloadWithActivity_scopeIdentifiers_completionHandler___block_invoke_2_165(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) validLocalScopeIndexes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsIndex:", objc_msgSend(v11, "localIndex")))
        {
          id v12 = *(void **)(a1 + 32);
          id v17 = v8;
          int v13 = [v12 setHasFinishedInitialDownloadForScope:v11 error:&v17];
          id v14 = v17;

          if (!v13)
          {

            if (a2)
            {
              id v14 = v14;
              uint64_t v15 = 0;
              *a2 = v14;
            }
            else
            {
              uint64_t v15 = 0;
            }
            goto LABEL_17;
          }
          id v8 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v15 = 1;
  id v14 = v8;
LABEL_17:

  return v15;
}

- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  id v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v10];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__15943;
  v40[4] = __Block_byref_object_dispose__15944;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke;
  v37[3] = &unk_1E60AB220;
  v37[4] = self;
  v37[5] = v40;
  v37[6] = v38;
  [v11 setCancellationHandler:v37];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_153;
  void v34[3] = &unk_1E60A9BD0;
  v34[4] = self;
  v36 = v38;
  id v12 = v9;
  id v35 = v12;
  int v13 = (void *)MEMORY[0x1BA994060](v34);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2_157;
  v28[3] = &unk_1E60A9CE8;
  v28[4] = self;
  id v14 = v13;
  id v31 = v14;
  id v33 = v40;
  id v15 = v8;
  id v29 = v15;
  id v16 = v11;
  id v30 = v16;
  id v17 = v12;
  id v32 = v17;
  long long v18 = (void (**)(void))MEMORY[0x1BA994060](v28);
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      long long v19 = __CPLBackupOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Starting forced backup - asking client to push all pending changes first", buf, 2u);
      }
    }
    [v16 becomeCurrentWithPendingUnitCount:1];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_160;
    id v24 = &unk_1E60A9C20;
    id v25 = v17;
    uint64_t v26 = v18;
    [(CPLEngineLibrary *)self requestClientToPushAllChangesWithCompletionHandler:&v21];
    objc_msgSend(v16, "resignCurrent", v21, v22, v23, v24);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      long long v20 = __CPLBackupOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Starting forced backup", buf, 2u);
      }
    }
    v18[2](v18);
  }

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A9BA8;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v2;
  id v3 = v1;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);
}

uint64_t __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_153(void *a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = +[CPLErrors operationCancelledError];
LABEL_5:
    dispatch_block_t v4 = (void *)v3;
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);

    return 0;
  }
  if (*(unsigned char *)(a1[4] + 80))
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = +[CPLErrors incorrectMachineStateErrorWithReason:@"closed"];
    goto LABEL_5;
  }
  return 1;
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2_157(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60A9CE8;
  id v3 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v12 = v3;
  v9[4] = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 64);
  long long v6 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v16 = v6;
  uint64_t v7 = v2;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  if ([v3 isCPLErrorWithCode:255])
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLBackupOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Client might not have pushed all changes yet - continuing backup nonetheless", (uint8_t *)&v7, 2u);
      }
    }
    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    long long v6 = __CPLBackupOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      dispatch_block_t v8 = v4;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Client failed to push all changes to engine: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_14:
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    uint64_t v2 = [[CPLEngineBackupSyncTask alloc] initWithEngineLibrary:*(void *)(a1 + 32) delegate:*(void *)(*(void *)(a1 + 32) + 248)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTaskActivity:*(void *)(a1 + 40)];
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    long long v6 = [MEMORY[0x1E4F29128] UUID];
    int v7 = [v6 UUIDString];
    [v5 setTaskIdentifier:v7];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setBypassForceSyncLimitations:1];
    dispatch_block_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_4;
    id v16 = &unk_1E60A9BF8;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    long long v12 = *(_OWORD *)(a1 + 64);
    id v9 = (id)v12;
    long long v19 = v12;
    [v8 setTaskDidFinishWithErrorBlock:&v13];
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLBackupOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v21 = v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Launching forced backup task %@", buf, 0xCu);
      }
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "launchTask", v12, v13, v14, v15, v16, v17);
  }
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_5;
  v12[3] = &unk_1E60A6000;
  id v13 = *(id *)(a1 + 40);
  id v14 = v4;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v11;
  long long v15 = v11;
  int v7 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v17 = v7;
  dispatch_block_t v8 = v5;
  id v9 = v4;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    if (_CPLSilentLogging)
    {
      uint64_t v3 = 0;
      goto LABEL_10;
    }
    id v4 = __CPLBackupOSLogDomain();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v14 = 138412290;
    uint64_t v15 = v11;
    int v7 = "Forced backup task %@ did finish successfully";
    dispatch_block_t v8 = v4;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLBackupOSLogDomain();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      uint64_t v3 = *(void *)(a1 + 40);
      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v6 = *(void *)(a1 + 40);
    int v14 = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    int v7 = "Forced backup task %@ did finish with error %@";
    dispatch_block_t v8 = v4;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 22;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v8, v9, v7, (uint8_t *)&v14, v10);
    goto LABEL_9;
  }
LABEL_10:
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v2);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

void __78__CPLEngineLibrary_forceBackupWithActivity_forceClientPush_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLBackupOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        int v6 = 138412290;
        uint64_t v7 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Backup task %@ has been cancelled", (uint8_t *)&v6, 0xCu);
      }

      uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v2 cancelTask];
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLBackupOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Backup has been cancelled", (uint8_t *)&v6, 2u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (void)requestScopesWithIdentifiersToBeActivated:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_log_type_t v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:3];
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  char v106 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x2020000000;
  char v104 = 0;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__15943;
  v101[4] = __Block_byref_object_dispose__15944;
  id v102 = 0;
  uint32_t v10 = self->_store;
  uint64_t v11 = [(CPLEngineStore *)v10 scopes];
  SEL v48 = a2;
  uint64_t v12 = self->_queue;
  id v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v7];
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x3032000000;
  v99[3] = __Block_byref_object_copy__15943;
  v99[4] = __Block_byref_object_dispose__15944;
  id v100 = 0;
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke;
  void v96[3] = &unk_1E60AA7E0;
  id v13 = v12;
  char v97 = v13;
  v98 = v99;
  int v14 = (void *)MEMORY[0x1BA994060](v96);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2;
  v87[3] = &unk_1E60A9A38;
  uint64_t v15 = v13;
  v88 = v15;
  v94 = v101;
  v46 = v10;
  v89 = v46;
  id v44 = v11;
  id v90 = v44;
  id v95 = v103;
  id v16 = v14;
  id v92 = v16;
  id v17 = v9;
  id v91 = v17;
  id v43 = v8;
  id v93 = v43;
  uint64_t v18 = (void *)MEMORY[0x1BA994060](v87);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4;
  v80[3] = &unk_1E60A9A90;
  long long v19 = v15;
  v81 = v19;
  id v85 = v103;
  id v42 = v16;
  id v83 = v42;
  v86 = v99;
  id v20 = v7;
  id v82 = v20;
  id v21 = v18;
  id v84 = v21;
  uint64_t v22 = (void *)MEMORY[0x1BA994060](v80);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_140;
  v76[3] = &unk_1E60A9740;
  uint64_t v23 = v19;
  v77 = v23;
  id v79 = v105;
  id v24 = v21;
  id v78 = v24;
  [v17 setCancellationHandler:v76];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_142;
  v70[3] = &unk_1E60A9AB8;
  id v25 = v23;
  v75 = v105;
  v71 = v25;
  id v72 = self;
  id v26 = v20;
  id v73 = v26;
  id v27 = v24;
  id v74 = v27;
  uint64_t v28 = (void *)MEMORY[0x1BA994060](v70);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_143;
  v63[3] = &unk_1E60A9AE0;
  id v29 = v25;
  v68 = v101;
  SEL v69 = v48;
  id v64 = v29;
  id v65 = self;
  id v30 = v17;
  id v66 = v30;
  id v31 = v22;
  id v67 = v31;
  id v32 = (void *)MEMORY[0x1BA994060](v63);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_147;
  v50[3] = &unk_1E60A9B80;
  id v49 = v26;
  id v51 = v49;
  id v45 = v44;
  id v52 = v45;
  id v33 = v47;
  id v53 = v33;
  id v34 = v29;
  uint64_t v54 = v34;
  id v35 = v27;
  id v58 = v35;
  id v36 = v28;
  id v59 = v36;
  id v37 = v31;
  id v60 = v37;
  id v38 = v46;
  v62 = v101;
  v55 = v38;
  id v56 = self;
  id v39 = v32;
  id v61 = v39;
  id v40 = v30;
  id v57 = v40;
  id v41 = [(CPLEngineStore *)v38 performReadTransactionWithBlock:v50];

  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);

  _Block_object_dispose(v103, 8);
  _Block_object_dispose(v105, 8);
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    uint32_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3;
    v16[3] = &unk_1E60AB550;
    uint64_t v11 = *(void **)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    id v18 = v8;
    id v12 = v8;
    id v13 = (id)[v11 performReadTransactionWithBlock:v16];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v4, v5, v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v3, v14, v15);
    [*(id *)(a1 + 56) setCancellationHandler:0];
  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 32));
    dispatch_time_t v3 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)&_timeToWaitForClientToActivateScopes);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5;
    v9[3] = &unk_1E60A9A68;
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)(a1 + 72);
    uint32_t v10 = v4;
    uint64_t v13 = v5;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 56);
    dispatch_source_set_event_handler(v4, v9);
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;
    id v8 = v4;

    dispatch_resume(v8);
  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_140(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_141;
  v7[3] = &unk_1E60A9718;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v6;
  long long v8 = v6;
  dispatch_time_t v3 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  uint64_t v4 = v1;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_142(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 80)) {
      return 1;
    }
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v3 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
        int v7 = 138543362;
        long long v8 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Engine got a request to have %{public}@ activated but it is closed", (uint8_t *)&v7, 0xCu);
      }
    }
    uint64_t v4 = *(void *)(a1 + 56);
    dispatch_block_t v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Engine is closed"];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  return 0;
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_143(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Engine should be observing scopes changes", v9, 2u);
      }
    }
    dispatch_block_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 40);
    long long v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m"];
    [v5 handleFailureInMethod:v6 object:v7 file:v8 lineNumber:2014 description:@"Engine should be observing scopes changes"];

    abort();
  }
  [*(id *)(a1 + 48) setCompletedUnitCount:2];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_147(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v42 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        long long v8 = [*(id *)(a1 + 40) scopeWithIdentifier:v7];
        if (v8 && ([*(id *)(a1 + 40) valueForFlag:16 forScope:v8] & 1) == 0) {
          [*(id *)(a1 + 48) removeObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v4);
  }

  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_149;
    v33[3] = &unk_1E60A9B30;
    id v11 = *(void **)(a1 + 40);
    id v34 = *(id *)(a1 + 48);
    id v35 = *(id *)(a1 + 56);
    id v36 = *(id *)(a1 + 88);
    id v37 = *(id *)(a1 + 96);
    id v38 = *(id *)(a1 + 104);
    [v11 addScopeFlagsObserver:v33 withIdentifier:v10];
    id v12 = *(void **)(a1 + 56);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_6;
    v23[3] = &unk_1E60A9B58;
    id v29 = *(id *)(a1 + 96);
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 40);
    id v26 = v10;
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(void **)(a1 + 112);
    uint64_t v32 = *(void *)(a1 + 120);
    uint64_t v27 = v13;
    id v30 = v14;
    id v28 = *(id *)(a1 + 80);
    id v31 = *(id *)(a1 + 88);
    uint64_t v15 = v23;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    id v47 = __cpl_dispatch_async_block_invoke_15925;
    SEL v48 = &unk_1E60A6978;
    id v49 = v15;
    id v16 = v12;
    id v17 = v10;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v16, v18);
  }
  else
  {
    long long v19 = *(void **)(a1 + 56);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_148;
    v39[3] = &unk_1E60A6978;
    id v40 = *(id *)(a1 + 88);
    id v20 = v39;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    id v47 = __cpl_dispatch_async_block_invoke_15925;
    SEL v48 = &unk_1E60A6978;
    id v49 = v20;
    id v21 = v19;
    dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v21, v22);

    id v17 = v40;
  }
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3_149(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = [a3 scopeIdentifier];
  if (![*(id *)(a1 + 32) containsObject:v7]
    || ([v6 valueForFlag:16] & 1) != 0
    || ([*(id *)(a1 + 32) removeObject:v7], objc_msgSend(*(id *)(a1 + 32), "count")))
  {
    long long v8 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5_151;
    v17[3] = &unk_1E60A9B08;
    uint64_t v9 = &v18;
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    id v10 = v17;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __cpl_dispatch_async_block_invoke_15925;
    id v25 = &unk_1E60A6978;
    id v26 = v10;
    id v11 = v8;
    dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v11, v12);
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4_150;
    v20[3] = &unk_1E60A6978;
    uint64_t v9 = &v21;
    uint64_t v13 = *(void **)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    uint64_t v14 = v20;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __cpl_dispatch_async_block_invoke_15925;
    id v25 = &unk_1E60A6978;
    id v26 = v14;
    uint64_t v15 = v13;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v15, v16);
  }
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_6(uint64_t a1)
{
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 48));
    uint64_t v2 = [*(id *)(a1 + 56) _libraryObject];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      [*(id *)(a1 + 64) setCompletedUnitCount:1];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_8;
      v7[3] = &unk_1E60A98D0;
      id v6 = *(void **)(a1 + 64);
      void v7[4] = *(void *)(a1 + 56);
      id v8 = *(id *)(a1 + 72);
      id v9 = *(id *)(a1 + 80);
      id v10 = *(id *)(a1 + 88);
      [v6 performAsCurrentWithPendingUnitCount:1 usingBlock:v7];

      uint64_t v3 = 0;
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_7;
    v11[3] = &unk_1E60AB550;
    uint64_t v4 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v5 = (id)[v4 performReadTransactionWithBlock:v11];

    uint64_t v3 = v12;
  }
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeScopeFlagsObserverWithIdentifier:*(void *)(a1 + 40)];
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_8(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_9;
  v3[3] = &unk_1E60A98A8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performBlockOnLibrary:v3];
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_9(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    if (a2)
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v6 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Engine failed to get a client to get scopes activated", v7, 2u);
        }
      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_4_150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5_151(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_2_141(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CPLErrors operationCancelledError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
        *(_DWORD *)long long buf = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Client has not tried to activate %@ for a long time", buf, 0xCu);
      }
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v7 = @"CPLErrorLibraryHasNotBeenActivated";
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v6 = +[CPLErrors cplErrorWithCode:83 underlyingError:0 userInfo:v5 description:@"Client failed to activate scopes in time"];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

uint64_t __80__CPLEngineLibrary_requestScopesWithIdentifiersToBeActivated_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeScopeFlagsObserverWithIdentifier:*(void *)(a1 + 40)];
}

- (void)noteMainScopeHasBeenActivated
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CPLEngineLibrary_noteMainScopeHasBeenActivated__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __49__CPLEngineLibrary_noteMainScopeHasBeenActivated__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 64) hasFinishedInitialDownload] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = [*(id *)(a1 + 32) mainScopeIdentifier];
        uint64_t v4 = *(void *)(a1 + 32);
        int v6 = 138543618;
        uint64_t v7 = v3;
        __int16 v8 = 2112;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ for %@ has been activated - signaling owner", (uint8_t *)&v6, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
    [WeakRetained engineLibraryNeedsInitialDownloadOfMainScope:*(void *)(a1 + 32)];
  }
}

- (void)requestClientToPullAllChangesWithScopeIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:3];
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  char v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  char v99 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  void v96[3] = __Block_byref_object_copy__15943;
  void v96[4] = __Block_byref_object_dispose__15944;
  id v97 = 0;
  __int16 v8 = self->_store;
  uint64_t v9 = [(CPLEngineStore *)v8 pullQueue];
  uint64_t v10 = self->_queue;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__15943;
  v94[4] = __Block_byref_object_dispose__15944;
  id v95 = 0;
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke;
  v91[3] = &unk_1E60AA7E0;
  uint64_t v11 = v10;
  id v92 = v11;
  id v93 = v94;
  id v12 = (void *)MEMORY[0x1BA994060](v91);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2;
  v82[3] = &unk_1E60A9A38;
  id v13 = v11;
  id v83 = v13;
  id v14 = v12;
  id v87 = v14;
  v89 = v96;
  uint64_t v15 = v8;
  id v84 = v15;
  id v16 = v9;
  id v85 = v16;
  id v90 = v98;
  id v17 = v7;
  id v86 = v17;
  id v43 = v6;
  id v88 = v43;
  id v18 = (void *)MEMORY[0x1BA994060](v82);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4;
  v76[3] = &unk_1E60A98F8;
  id v19 = v13;
  v77 = v19;
  v80 = v98;
  id v42 = v14;
  id v78 = v42;
  v81 = v94;
  id v20 = v18;
  id v79 = v20;
  id v21 = (void *)MEMORY[0x1BA994060](v76);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_117;
  v72[3] = &unk_1E60A9740;
  dispatch_block_t v22 = v19;
  id v73 = v22;
  v75 = v100;
  id v23 = v20;
  id v74 = v23;
  [v17 setCancellationHandler:v72];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_119;
  v64[3] = &unk_1E60A9920;
  id v24 = v22;
  SEL v69 = v100;
  v70 = v98;
  SEL v71 = a2;
  id v65 = v24;
  id v66 = self;
  id v25 = v44;
  id v67 = v25;
  id v26 = v23;
  id v68 = v26;
  uint64_t v27 = (void *)MEMORY[0x1BA994060](v64);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_123;
  v53[3] = &unk_1E60A99E8;
  id v28 = v27;
  uint64_t v54 = v15;
  id v55 = v25;
  id v60 = v28;
  id v56 = v16;
  id v29 = v24;
  id v57 = v29;
  id v30 = v26;
  id v61 = v30;
  id v58 = self;
  id v31 = v17;
  id v59 = v31;
  id v62 = v21;
  v63 = v96;
  id v32 = v21;
  id v45 = v16;
  id v47 = v25;
  id v33 = v15;
  id v34 = (void *)MEMORY[0x1BA994060](v53);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_132;
  v48[3] = &unk_1E60A9A10;
  id v50 = v28;
  id v51 = v34;
  v48[4] = self;
  id v49 = v31;
  id v52 = v30;
  id v35 = v48;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v103 = v35;
  id v36 = v29;
  id v37 = v30;
  id v38 = v31;
  id v39 = v34;
  id v40 = v28;
  dispatch_block_t v41 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v36, v41);

  _Block_object_dispose(v94, 8);
  _Block_object_dispose(v96, 8);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v100, 8);
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3;
    v14[3] = &unk_1E60AB550;
    __int16 v8 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v16 = v5;
    id v9 = v5;
    id v10 = (id)[v8 performReadTransactionWithBlock:v14];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
  if (!*(unsigned char *)(v11 + 24))
  {
    *(unsigned char *)(v11 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v3, v12, v13);
    [*(id *)(a1 + 56) setCancellationHandler:0];
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 32));
    dispatch_time_t v3 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)&_timeToWaitForClientToPullChanges);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_5;
    handler[3] = &unk_1E60A9740;
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)(a1 + 64);
    id v10 = v4;
    uint64_t v12 = v5;
    id v11 = *(id *)(a1 + 48);
    dispatch_source_set_event_handler(v4, handler);
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;
    __int16 v8 = v4;

    dispatch_resume(v8);
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_117(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_118;
  v7[3] = &unk_1E60A9718;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v6;
  long long v8 = v6;
  dispatch_time_t v3 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  uint64_t v4 = v1;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_119(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      if (!_CPLSilentLogging)
      {
        id v2 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Completion handler should have been called by cancellation handler", (uint8_t *)&v12, 2u);
        }
      }
      dispatch_time_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = *(void *)(a1 + 80);
      uint64_t v5 = *(void *)(a1 + 40);
      long long v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m"];
      [v3 handleFailureInMethod:v4 object:v5 file:v6 lineNumber:1828 description:@"Completion handler should have been called by cancellation handler"];

      abort();
    }
  }
  else
  {
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 80)) {
      return 1;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        long long v8 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
        int v12 = 138543362;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to pull changes in %{public}@ but it is closed", (uint8_t *)&v12, 0xCu);
      }
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Engine is closed"];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  return 0;
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_123(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 16))())
  {
    id v2 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_124;
    v8[3] = &unk_1E60A99C0;
    id v9 = v2;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v3 = *(id *)(a1 + 88);
    uint64_t v4 = *(void *)(a1 + 64);
    id v15 = v3;
    uint64_t v13 = v4;
    id v16 = *(id *)(a1 + 80);
    id v14 = *(id *)(a1 + 72);
    id v5 = *(id *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 104);
    id v17 = v5;
    uint64_t v18 = v6;
    id v7 = (id)[v9 performReadTransactionWithBlock:v8];
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_132(id *a1)
{
  if ((*((unsigned int (**)(void))a1[6] + 2))())
  {
    id v2 = [a1[4] _libraryObject];
    if (v2)
    {
      (*((void (**)(void))a1[7] + 2))();
    }
    else
    {
      [a1[5] setCompletedUnitCount:1];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_133;
      v4[3] = &unk_1E60A98D0;
      id v3 = a1[5];
      void v4[4] = a1[4];
      id v5 = a1[6];
      id v6 = a1[7];
      id v7 = a1[8];
      [v3 performAsCurrentWithPendingUnitCount:1 usingBlock:v4];
    }
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_133(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4_134;
  v3[3] = &unk_1E60A98A8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performBlockOnLibrary:v3];
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_4_134(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    if (a2)
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v6 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v7 = 0;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Engine failed to get a client to get changes pulled", v7, 2u);
        }
      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_124(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) scopes];
  id v3 = [v2 filterForIncludedScopeIdentifiers:*(void *)(a1 + 40)];

  if ([*(id *)(a1 + 48) hasSomeChangeWithScopeFilter:v3])
  {
    [*(id *)(a1 + 64) notifyAttachedObjectsPullQueueIsFull];
    id v4 = *(void **)(a1 + 48);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_126;
    v27[3] = &unk_1E60A9970;
    id v5 = &v28;
    id v28 = v3;
    id v29 = *(id *)(a1 + 40);
    id v30 = *(id *)(a1 + 56);
    id v32 = *(id *)(a1 + 80);
    id v33 = *(id *)(a1 + 88);
    id v31 = *(id *)(a1 + 72);
    id v34 = *(id *)(a1 + 96);
    id v6 = [v4 addDequeueObserverWithDequeueSignalBlock:v27];
    id v7 = *(void **)(a1 + 56);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_130;
    v19[3] = &unk_1E60A9998;
    id v8 = *(id *)(a1 + 88);
    uint64_t v26 = *(void *)(a1 + 104);
    id v24 = v8;
    id v20 = v6;
    id v21 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 96);
    id v22 = *(id *)(a1 + 32);
    id v23 = *(id *)(a1 + 48);
    id v9 = v19;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    id v38 = __cpl_dispatch_async_block_invoke_15925;
    id v39 = &unk_1E60A6978;
    id v40 = v9;
    id v10 = v7;
    id v11 = v6;
    dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v10, v12);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v13 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
        LODWORD(block) = 138543362;
        *(void *)((char *)&block + 4) = v14;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Client has no changes to pull for %{public}@", (uint8_t *)&block, 0xCu);
      }
    }
    id v15 = *(void **)(a1 + 56);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_125;
    v35[3] = &unk_1E60A6978;
    id v5 = &v36;
    id v36 = *(id *)(a1 + 80);
    id v16 = v35;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    id v38 = __cpl_dispatch_async_block_invoke_15925;
    id v39 = &unk_1E60A6978;
    id v40 = v16;
    id v17 = v15;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v17, v18);
  }
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_126(uint64_t a1, void *a2, int a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3 && ([v5 hasSomeChangeWithScopeFilter:*(void *)(a1 + 32)] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v12 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
        LODWORD(block) = 138543362;
        *(void *)((char *)&block + 4) = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Client has no more changes to pull for %{public}@", (uint8_t *)&block, 0xCu);
      }
    }
    id v14 = *(void **)(a1 + 48);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_127;
    v22[3] = &unk_1E60A6978;
    id v8 = &v23;
    id v23 = *(id *)(a1 + 64);
    id v15 = v22;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    id v25 = __cpl_dispatch_async_block_invoke_15925;
    uint64_t v26 = &unk_1E60A6978;
    id v27 = v15;
    id v16 = v14;
    dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v16, v17);
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_128;
    v18[3] = &unk_1E60A9948;
    id v8 = &v20;
    id v20 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 80);
    id v9 = v18;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    id v25 = __cpl_dispatch_async_block_invoke_15925;
    uint64_t v26 = &unk_1E60A6978;
    id v27 = v9;
    id v10 = v7;
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v10, v11);
  }
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3_130(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 32));
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
        *(_DWORD *)long long buf = 138543362;
        id v10 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Start waiting for client to pull all changes for %{public}@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_131;
    v6[3] = &unk_1E60AB550;
    id v4 = *(void **)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    id v5 = (id)[v4 performReadTransactionWithBlock:v6];
  }
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_131(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeDequeueObserver:*(void *)(a1 + 40)];
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_127(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_128(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    [*(id *)(a1 + 32) setCompletedUnitCount:2];
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_2_118(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CPLErrors operationCancelledError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_5(void *a1)
{
  if (a1[4] == *(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Client has not tried to pull or acknowledge changes for a long time", v5, 2u);
      }
    }
    uint64_t v3 = a1[5];
    id v4 = +[CPLErrors cplErrorWithCode:83 description:@"Client failed to pull changes in time"];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

uint64_t __88__CPLEngineLibrary_requestClientToPullAllChangesWithScopeIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeDequeueObserver:*(void *)(a1 + 40)];
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:3];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke;
  v39[3] = &unk_1E60A9808;
  void v39[4] = self;
  id v42 = v43;
  id v7 = v6;
  id v40 = v7;
  id v8 = v5;
  id v41 = v8;
  id v9 = (void *)MEMORY[0x1BA994060](v39);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2;
  v36[3] = &unk_1E60A9740;
  void v36[4] = self;
  id v38 = v45;
  id v10 = v9;
  id v37 = v10;
  [v7 setCancellationHandler:v36];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4;
  v31[3] = &unk_1E60A9830;
  v31[4] = self;
  id v33 = v45;
  id v34 = v43;
  SEL v35 = a2;
  id v11 = v10;
  id v32 = v11;
  dispatch_block_t v12 = (void *)MEMORY[0x1BA994060](v31);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_99;
  v28[3] = &unk_1E60A9880;
  v28[4] = self;
  id v30 = v45;
  id v13 = v11;
  id v29 = v13;
  id v14 = (void *)MEMORY[0x1BA994060](v28);
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_111;
  v23[3] = &unk_1E60A9A10;
  void v23[4] = self;
  id v24 = v7;
  id v25 = v12;
  id v26 = v14;
  id v27 = v13;
  id v16 = v23;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v48 = v16;
  dispatch_block_t v17 = queue;
  id v18 = v13;
  id v19 = v14;
  id v20 = v7;
  id v21 = v12;
  dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v17, v22);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;

    [*(id *)(a1 + 40) setCancellationHandler:0];
  }
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E60A9718;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v6;
  long long v8 = v6;
  uint64_t v3 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  uint64_t v4 = v1;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4(void *a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      if (!_CPLSilentLogging)
      {
        id v2 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Completion handler should have been called by cancellation handler", buf, 2u);
        }
      }
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = a1[8];
      uint64_t v5 = a1[4];
      long long v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m"];
      [v3 handleFailureInMethod:v4 object:v5 file:v6 lineNumber:1646 description:@"Completion handler should have been called by cancellation handler"];

      abort();
    }
  }
  else
  {
    if (!*(unsigned char *)(a1[4] + 80)) {
      return 1;
    }
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to push all changes but it is closed", v11, 2u);
      }
    }
    uint64_t v8 = a1[5];
    id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Engine is closed"];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  return 0;
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_99(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Engine is asking client to push all changes", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  dispatch_block_t v22 = buf;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__15943;
  id v25 = __Block_byref_object_dispose__15944;
  id v26 = 0;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_100;
  v16[3] = &unk_1E60A9EA0;
  id v6 = v5;
  id v17 = v6;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v19 = buf;
  uint64_t v20 = v7;
  id v18 = v8;
  uint64_t v9 = [v16 copy];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 112);
  *(void *)(v10 + 112) = v9;

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 112) + 16))();
  uint64_t v12 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_105;
  v13[3] = &unk_1E60A9858;
  v13[4] = v12;
  id v15 = buf;
  id v14 = *(id *)(a1 + 40);
  [v3 engineLibrary:v12 pushAllChangesWithCompletionHandler:v13];

  _Block_object_dispose(buf, 8);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_111(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v2 = [*(id *)(a1 + 32) _libraryObject];
    id v3 = *(void **)(a1 + 40);
    if (v2)
    {
      [v3 setCompletedUnitCount:2];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      [v3 setCompletedUnitCount:1];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_112;
      v5[3] = &unk_1E60A98D0;
      uint64_t v4 = *(void **)(a1 + 40);
      void v5[4] = *(void *)(a1 + 32);
      id v6 = *(id *)(a1 + 48);
      id v7 = *(id *)(a1 + 56);
      id v8 = *(id *)(a1 + 64);
      [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v5];
    }
  }
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_112(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_113;
  v3[3] = &unk_1E60A98A8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performBlockOnLibrary:v3];
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_113(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    if (v5)
    {
      id v7 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Engine failed to get a client to get all changes pushed", v9, 2u);
        }
      }
      id v7 = *(void (**)(void))(a1[6] + 16);
    }
    v7();
  }
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_100(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Client is pushing changes...", buf, 2u);
      }

      id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    dispatch_source_cancel(v2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  id v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 32));
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)&_timeToWaitForClientToPushChanges);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_101;
  handler[3] = &unk_1E60A9EA0;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 56);
  id v16 = v8;
  uint64_t v18 = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v14;
  long long v17 = v14;
  dispatch_source_set_event_handler(v8, handler);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_resume(v13);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_106;
  v11[3] = &unk_1E60A9A68;
  id v12 = v3;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v10;
  long long v14 = v10;
  uint64_t v13 = *(void *)(a1 + 32);
  id v6 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v16 = v6;
  dispatch_time_t v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_106(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    if ([v5 isCPLErrorWithCode:255])
    {
      if (!_CPLSilentLogging)
      {
        id v6 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Client does not support pushing all changes yet - some changes might not be uploaded", buf, 2u);
        }
      }
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
LABEL_16:
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v8);
      return;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v9 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v19 = v10;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Client failed to push all changes: %@", buf, 0xCu);
        }

        uint64_t v8 = *(void *)(a1 + 32);
      }
      uint64_t v7 = *(void *)(a1 + 48);
      goto LABEL_16;
    }
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Client successfully pushed all changes", buf, 2u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void **)(v12 + 232);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_107;
  v17[3] = &unk_1E60AB578;
  void v17[4] = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_109;
  v15[3] = &unk_1E60AB2A0;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  id v14 = (id)[v13 performWriteTransactionWithBlock:v17 completionHandler:v15];
}

uint64_t __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_107(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_108;
  v3[3] = &unk_1E60AB410;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 do:v3];
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3_109(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4_110;
  v9[3] = &unk_1E60A5EE8;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v5 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v13 = v5;
  id v6 = v4;
  id v7 = v3;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v8);
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4_110(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLBackupOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = [*(id *)(a1 + 32) error];
        int v8 = 138412290;
        dispatch_block_t v9 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Failed to commit pending change updates: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

uint64_t __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2_108(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) forceApplyPendingChangeSessionUpdateWithError:a2];
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_101(void *a1)
{
  if (a1[4] == *(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if (_failOnPushingChangesTimeout)
    {
      if (!_CPLSilentLogging)
      {
        id v2 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Client has not tried to push any changes for a long time - timing out", buf, 2u);
        }
      }
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      uint64_t v3 = a1[5];
      uint64_t v4 = +[CPLErrors cplErrorWithCode:83 description:@"Client failed to push changes in time"];
      (*(void (**)(uint64_t, NSObject *))(v3 + 16))(v3, v4);
    }
    else
    {
      if (_CPLSilentLogging) {
        return;
      }
      uint64_t v4 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Client has not tried to push any changes for a long time", v5, 2u);
      }
    }
  }
}

void __71__CPLEngineLibrary_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CPLErrors operationCancelledError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v13 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide %@ but it is closed. Should try again later", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide %@", buf, 0xCu);
      }

      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v7 = *(void **)(v2 + 232);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_89;
    v9[3] = &unk_1E60AA9A0;
    void v9[4] = v2;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v8 = (id)[v7 performReadTransactionWithBlock:v9];
  }
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_89(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 232) isClientInSyncWithClientCache])
  {
    uint64_t v2 = [*(id *)(a1 + 40) itemScopedIdentifier];
    uint64_t v3 = [v2 scopeIdentifier];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 232) scopes];
    uint64_t v5 = [v4 scopeWithIdentifier:v3];
    if (!v5)
    {
      if (!_CPLSilentLogging)
      {
        id v12 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412546;
          id v48 = v3;
          __int16 v49 = 2112;
          uint64_t v50 = v13;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@ is an unknown scope. Marking (cloud) %@ as unavailable", buf, 0x16u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_52;
    }
    uint64_t v6 = [v4 scopeForSharingScope:v5];
    if (v6)
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 232) cloudCache];
      id v8 = [v7 targetForRecordWithSharedCloudScopedIdentifier:v2];
      dispatch_block_t v9 = [v8 scopedIdentifier];

      [*(id *)(a1 + 40) setItemScopedIdentifier:v9];
    }
    else
    {
      dispatch_block_t v9 = 0;
    }

    if ([v4 valueForFlag:16 forScope:v5])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v14 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412546;
          id v48 = v3;
          __int16 v49 = 2112;
          uint64_t v50 = v15;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "%@ is inactive. Marking (cloud) %@ as unavailable", buf, 0x16u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_51;
    }
    id v16 = [*(id *)(a1 + 40) identity];
    uint64_t v46 = 0;
    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 232) localResourceForCloudResource:*(void *)(a1 + 40) recordClass:&v46];
    if (v17)
    {
      id v18 = (void *)v17;
      uint64_t v19 = [v16 fingerPrint];
      if (!v19)
      {
LABEL_27:

        dispatch_block_t v22 = (void *)[v18 copy];
        uint64_t v23 = [v22 identity];
        id v24 = [v16 fileURL];
        [v23 setFileURL:v24];

        id v25 = *(void **)(a1 + 32);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_90;
        v39[3] = &unk_1E60A97E0;
        void v39[4] = v25;
        id v40 = v22;
        uint64_t v45 = v46;
        id v41 = v9;
        id v42 = *(id *)(a1 + 40);
        id v43 = v2;
        id v44 = *(id *)(a1 + 48);
        id v26 = v22;
        [v25 performBlockOnLibrary:v39];

LABEL_50:
LABEL_51:

LABEL_52:
        return;
      }
      id v38 = v16;
      uint64_t v20 = [v18 identity];
      id v21 = [v20 fingerPrint];

      if (v21 && ([v19 isEqual:v21] & 1) != 0)
      {

        id v16 = v38;
        goto LABEL_27;
      }

      if (!_CPLSilentLogging)
      {
        id v27 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *(void **)(a1 + 40);
          *(_DWORD *)long long buf = 138412290;
          id v48 = v28;
          _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEFAULT, "Fingerprint for (cloud) %@ does not match the one in client cache", buf, 0xCu);
        }
      }
      id v16 = v38;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 232) hasPendingChangeSessionUpdate])
    {
      if (!_CPLSilentLogging)
      {
        id v29 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = *(void **)(a1 + 40);
          *(_DWORD *)long long buf = 138412290;
          id v48 = v30;
          id v31 = "Engine has pending changes to apply. Should try again later for (cloud) %@";
          id v32 = v29;
          uint32_t v33 = 12;
LABEL_46:
          _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
          goto LABEL_47;
        }
        goto LABEL_47;
      }
    }
    else
    {
      if ([v4 hasFinishedInitialSyncForScope:v5])
      {
        if (!_CPLSilentLogging)
        {
          id v34 = __CPLDataRecoveryOSLogDomain();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            SEL v35 = *(void **)(a1 + 40);
            *(_DWORD *)long long buf = 138412290;
            id v48 = v35;
            _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Unable to find (cloud) %@ for recovery", buf, 0xCu);
          }
        }
        id v36 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        goto LABEL_49;
      }
      if (!_CPLSilentLogging)
      {
        id v29 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412546;
          id v48 = v3;
          __int16 v49 = 2112;
          uint64_t v50 = v37;
          id v31 = "%@ is not fully synchronized. Should try again later for (cloud) %@";
          id v32 = v29;
          uint32_t v33 = 22;
          goto LABEL_46;
        }
LABEL_47:
      }
    }
    id v36 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_49:
    v36();
    goto LABEL_50;
  }
  if (!_CPLSilentLogging)
  {
    id v10 = __CPLDataRecoveryOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      id v48 = v11;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Engine is not in sync with client. Should try again later for (cloud) %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 56);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v24 = v13;
        uint64_t v14 = "Client is not attached. Should try again later for (cloud) %@";
LABEL_10:
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
LABEL_11:
    }
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 56);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v24 = v15;
        uint64_t v14 = "Client has not implemented recovery yet. Should try again later for (cloud) %@";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 80);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_2;
  v16[3] = &unk_1E60A97B8;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 32);
  id v20 = v10;
  uint64_t v21 = v11;
  id v22 = *(id *)(a1 + 72);
  [v10 engineLibrary:v7 provideLocalResource:v8 recordClass:v9 completionHandler:v16];

LABEL_13:
}

void __59__CPLEngineLibrary_provideCloudResource_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v11 = [*(id *)(a1 + 40) itemScopedIdentifier];
      int v12 = [v11 isEqual:*(void *)(a1 + 32)];

      if (v12) {
        [*(id *)(a1 + 40) setItemScopedIdentifier:*(void *)(a1 + 48)];
      }
    }
    uint64_t v13 = [v5 identity];
    uint64_t v14 = [v13 fileURL];
    if (!v14)
    {
      if (!_CPLSilentLogging)
      {
        id v26 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = [*(id *)(a1 + 56) displayableNameForEngineLibrary:*(void *)(a1 + 64)];
          uint64_t v28 = v27;
          if (!v27)
          {
            uint64_t v28 = [*(id *)(a1 + 56) description];
          }
          id v29 = *(void **)(a1 + 40);
          *(_DWORD *)long long buf = 138543618;
          SEL v35 = v28;
          __int16 v36 = 2112;
          uint64_t v37 = v29;
          _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_ERROR, "Client (%{public}@) did not provide a file for (cloud) %@ yet it says the resource is available", buf, 0x16u);
          if (!v27) {
        }
          }
      }
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_44;
    }
    uint64_t v15 = (void *)[v13 copy];
    if (!_CPLSilentLogging)
    {
      id v16 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [*(id *)(a1 + 56) displayableNameForEngineLibrary:*(void *)(a1 + 64)];
        id v18 = v17;
        if (!v17)
        {
          id v18 = [*(id *)(a1 + 56) description];
        }
        id v19 = [v14 path];
        id v20 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543874;
        SEL v35 = v18;
        __int16 v36 = 2112;
        uint64_t v37 = v19;
        __int16 v38 = 2112;
        id v39 = v20;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Client (%{public}@) provided %@ for (cloud) %@", buf, 0x20u);
        if (!v17) {
      }
        }
    }
    uint64_t v21 = [*(id *)(a1 + 40) identity];
    id v22 = [v21 fileURL];

    if (v22)
    {
      if ([v22 isEqual:v14])
      {
LABEL_27:
        [v15 setFileURL:v22];

LABEL_43:
        [*(id *)(a1 + 40) setIdentity:v15];
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

LABEL_44:
        goto LABEL_45;
      }
      uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v33 = 0;
      char v24 = [v23 cplCopyItemAtURL:v14 toURL:v22 error:&v33];
      id v25 = v33;

      if (v24)
      {

        goto LABEL_27;
      }
      if (!_CPLSilentLogging)
      {
        id v30 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = [v14 path];
          id v32 = [v22 path];
          *(_DWORD *)long long buf = 138412802;
          SEL v35 = v31;
          __int16 v36 = 2112;
          uint64_t v37 = v32;
          __int16 v38 = 2112;
          id v39 = v25;
          _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@. Will provide the source URL instead: %@", buf, 0x20u);
        }
      }
    }
    [v15 setFileURL:v14];
    goto LABEL_43;
  }
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLDataRecoveryOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 56) displayableNameForEngineLibrary:*(void *)(a1 + 64)];
      uint64_t v8 = v7;
      if (!v7)
      {
        uint64_t v8 = [*(id *)(a1 + 56) description];
      }
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = +[CPLLibraryManager descriptionForProvideContentResult:a3];
      *(_DWORD *)long long buf = 138543874;
      SEL v35 = v8;
      __int16 v36 = 2112;
      uint64_t v37 = v9;
      __int16 v38 = 2112;
      id v39 = v10;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Client (%{public}@) recovery result for (cloud) %@ is: %@", buf, 0x20u);
      if (!v7) {
    }
      }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_45:
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide record %@ but it is closed. Should try again later", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(void **)(v2 + 232);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_88;
    v7[3] = &unk_1E60AA9A0;
    void v7[4] = v2;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v6 = (id)[v5 performReadTransactionWithBlock:v7];
  }
}

void __76__CPLEngineLibrary_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_88(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 232) isClientInSyncWithClientCache])
  {
    uint64_t v2 = [*(id *)(a1 + 40) scopeIdentifier];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 232) scopes];
    uint64_t v4 = [v3 scopeWithIdentifier:v2];
    if (v4)
    {
      if (![v3 valueForFlag:16 forScope:v4])
      {
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 232) cloudCache];
        uint64_t v12 = [v11 recordWithScopedIdentifier:*(void *)(a1 + 40) isFinal:0];

        if (v12)
        {
          if (!_CPLSilentLogging)
          {
            dispatch_block_t v13 = __CPLDataRecoveryOSLogDomain();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = *(void *)(a1 + 40);
              *(_DWORD *)id v26 = 138412290;
              *(void *)&v26[4] = v14;
              _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Record %@ is available in cloud cache", v26, 0xCu);
            }
          }
          id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        }
        else
        {
          int v16 = [v3 hasFinishedInitialSyncForScope:v4];
          if ((v16 & 1) == 0 && !_CPLSilentLogging)
          {
            id v17 = __CPLDataRecoveryOSLogDomain();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = *(void *)(a1 + 40);
              *(_DWORD *)id v26 = 138412546;
              *(void *)&v26[4] = v2;
              __int16 v27 = 2112;
              uint64_t v28 = v18;
              _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "%@ is not fully synchronized. Should try again later for record %@", v26, 0x16u);
            }
          }
          if (!v16) {
            goto LABEL_32;
          }
          v26[0] = 0;
          id v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "idMapping", *(void *)v26);
          id v20 = [v19 localScopedIdentifierForCloudScopedIdentifier:*(void *)(a1 + 40) isFinal:v26];

          if (!v20) {
            goto LABEL_33;
          }
          int v21 = v16 ^ 1;
          id v22 = [*(id *)(*(void *)(a1 + 32) + 232) transactionClientCacheView];
          int v23 = [v22 hasRecordWithScopedIdentifier:v20];

          if ((v23 | v21) == 1)
          {
LABEL_32:
            id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
          }
          else
          {
LABEL_33:
            if (!_CPLSilentLogging)
            {
              char v24 = __CPLDataRecoveryOSLogDomain();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v25 = *(void *)(a1 + 40);
                *(_DWORD *)id v26 = 138412290;
                *(void *)&v26[4] = v25;
                _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Record %@ is not in cloud cache and it does not seem it might appear later. Marking as unavailable", v26, 0xCu);
              }
            }
            id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
          }
        }
        v15();

        goto LABEL_39;
      }
      if (!_CPLSilentLogging)
      {
        id v5 = __CPLDataRecoveryOSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 40);
          *(_DWORD *)id v26 = 138412546;
          *(void *)&v26[4] = v2;
          __int16 v27 = 2112;
          uint64_t v28 = v6;
          id v7 = "%@ is inactive. Marking record %@ as unavailable";
LABEL_15:
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, v7, v26, 0x16u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v5 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)id v26 = 138412546;
        *(void *)&v26[4] = v2;
        __int16 v27 = 2112;
        uint64_t v28 = v10;
        id v7 = "%@ is an unknown scope. Marking record %@ as unavailable";
        goto LABEL_15;
      }
LABEL_16:
    }
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, 1);
LABEL_39:

    return;
  }
  if (!_CPLSilentLogging)
  {
    id v8 = __CPLDataRecoveryOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)id v26 = 138412290;
      *(void *)&v26[4] = v9;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Engine is not in sync with client. Should try again later to get record %@", v26, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide library info for %@ but it is closed. Should try again later", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(void **)(v2 + 232);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_87;
    v7[3] = &unk_1E60AA9A0;
    void v7[4] = v2;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v6 = (id)[v5 performReadTransactionWithBlock:v7];
  }
}

void __79__CPLEngineLibrary_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_87(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1[4] + 232) isClientInSyncWithClientCache])
  {
    uint64_t v2 = [*(id *)(a1[4] + 232) scopes];
    uint64_t v3 = [v2 scopeWithIdentifier:a1[5]];
    uint64_t v4 = v3;
    if (v3)
    {
      if ([v3 scopeType])
      {
        if ([v2 doesScopeSupportToBePulledByClient:v4])
        {
          id v5 = [v2 scopeChangeForScope:v4];
          if (v5)
          {
            if (!_CPLSilentLogging)
            {
              id v6 = __CPLDataRecoveryOSLogDomain();
              if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v7 = a1[5];
                int v18 = 138412290;
                uint64_t v19 = v7;
                _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Scope Change for %@ is available", (uint8_t *)&v18, 0xCu);
              }
            }
            id v8 = *(void (**)(void))(a1[6] + 16);
          }
          else
          {
            if (!_CPLSilentLogging)
            {
              id v16 = __CPLDataRecoveryOSLogDomain();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v17 = a1[5];
                int v18 = 138412290;
                uint64_t v19 = v17;
                _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Scope Change for %@ is not available", (uint8_t *)&v18, 0xCu);
              }
            }
            id v8 = *(void (**)(void))(a1[6] + 16);
          }
          v8();

          goto LABEL_28;
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v11 = __CPLDataRecoveryOSLogDomain();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = a1[5];
            int v18 = 138412290;
            uint64_t v19 = v15;
            dispatch_block_t v13 = "%@ is inactive. Marking scope info as unavailable";
            goto LABEL_25;
          }
LABEL_26:
        }
LABEL_27:
        (*(void (**)(void, void))(a1[6] + 16))(a1[6], 0);
LABEL_28:

        return;
      }
      if (_CPLSilentLogging) {
        goto LABEL_27;
      }
      uint64_t v11 = __CPLDataRecoveryOSLogDomain();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v14 = a1[5];
      int v18 = 138412290;
      uint64_t v19 = v14;
      dispatch_block_t v13 = "%@ is an unknown type of scope. Marking scope info as unavailable";
    }
    else
    {
      if (_CPLSilentLogging) {
        goto LABEL_27;
      }
      uint64_t v11 = __CPLDataRecoveryOSLogDomain();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v12 = a1[5];
      int v18 = 138412290;
      uint64_t v19 = v12;
      dispatch_block_t v13 = "%@ is an unknown scope. Marking library info as unavailable";
    }
LABEL_25:
    _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 0xCu);
    goto LABEL_26;
  }
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLDataRecoveryOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[5];
      int v18 = 138412290;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Engine is not in sync with client. Should try again later to get library info for %@", (uint8_t *)&v18, 0xCu);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)providePayloadForComputeStates:(id)a3 inFolderWithURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:2];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke;
  v33[3] = &unk_1E60A96F0;
  void v33[4] = self;
  __int16 v36 = v37;
  id v12 = v11;
  id v34 = v12;
  id v13 = v10;
  id v35 = v13;
  uint64_t v14 = (void *)MEMORY[0x1BA994060](v33);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2;
  v30[3] = &unk_1E60A9740;
  v30[4] = self;
  id v32 = v39;
  id v15 = v14;
  id v31 = v15;
  [v12 setCancellationHandler:v30];
  queue = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4;
  v24[3] = &unk_1E60A9790;
  id v28 = v15;
  uint64_t v29 = v39;
  v24[4] = self;
  id v25 = v12;
  id v26 = v8;
  id v27 = v9;
  uint64_t v17 = v24;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v42 = v17;
  int v18 = queue;
  id v19 = v9;
  id v20 = v8;
  id v21 = v12;
  id v22 = v15;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) setCancellationHandler:0];
  }
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60A9718;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v6;
  long long v8 = v6;
  uint64_t v3 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v10 = v3;
  uint64_t v4 = v1;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLDataRecoveryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Engine got a request to try to provide compute state payloads but it is closed. Should try again later", buf, 2u);
      }
    }
    uint64_t v4 = *(void *)(a1 + 64);
    dispatch_block_t v5 = +[CPLErrors libraryClosedError];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (!*(unsigned char *)(*(void *)(v6 + 8) + 24))
    {
      id v7 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_83;
      v8[3] = &unk_1E60A9DD8;
      void v8[4] = v2;
      uint64_t v12 = v6;
      id v11 = *(id *)(a1 + 64);
      id v9 = *(id *)(a1 + 48);
      id v10 = *(id *)(a1 + 56);
      [v7 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
    }
  }
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_83(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2_84;
  v6[3] = &unk_1E60A9768;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v3 = (id)v5;
  long long v9 = v5;
  uint64_t v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 performBlockOnLibrary:v6];
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2_84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3_85;
      v10[3] = &unk_1E60A6818;
      void v10[4] = v7;
      uint64_t v9 = *(void *)(a1 + 48);
      id v11 = *(id *)(a1 + 56);
      [v5 engineLibrary:v7 providePayloadForComputeStates:v8 inFolderWithURL:v9 completionHandler:v10];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3_85(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4_86;
  v14[3] = &unk_1E60AA5C0;
  id v8 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v8;
  id v15 = v5;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v19 = v9;
  id v10 = v7;
  id v11 = v6;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

uint64_t __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4_86(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __85__CPLEngineLibrary_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CPLErrors operationCancelledError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)componentName
{
  return @"engine";
}

- (void)notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __161__CPLEngineLibrary_notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke;
  v7[3] = &unk_1E60A96C8;
  void v7[4] = self;
  void v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  v7[9] = a7;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:1 enumerateAttachedObjects:v7];
}

void __161__CPLEngineLibrary_notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = a1[5];
      uint64_t v6 = a1[6];
      int v7 = 138543874;
      id v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that size of resources to upload did change to %llu (%llu)", (uint8_t *)&v7, 0x20u);
    }
  }
  [v3 engineLibrary:a1[4] sizeOfResourcesToUploadDidChangeToSize:a1[5] sizeOfOriginalResourcesToUpload:a1[6] numberOfImages:a1[7] numberOfVideos:a1[8] numberOfOtherItems:a1[9]];
}

- (void)notifyAttachedObjectsUploadTask:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didFinishWithError___block_invoke;
  v10[3] = &unk_1E60A96A0;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:1 enumerateAttachedObjects:v10];
}

void __71__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didFinishWithError___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v7 = 138543874;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that %@ did finish with error %@", (uint8_t *)&v7, 0x20u);
    }
  }
  [v3 engineLibrary:a1[6] uploadTask:a1[4] didFinishWithError:a1[5]];
}

- (void)notifyAttachedObjectsUploadTask:(id)a3 didProgress:(float)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didProgress___block_invoke;
  v8[3] = &unk_1E60A9678;
  float v11 = a4;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:0 enumerateAttachedObjects:v8];
}

void __64__CPLEngineLibrary_notifyAttachedObjectsUploadTask_didProgress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      double v7 = (float)(*(float *)(a1 + 48) * 100.0);
      int v8 = 138543874;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      double v13 = v7;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that %@ did progress to %.0f%%", (uint8_t *)&v8, 0x20u);
    }
  }
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  [v3 engineLibrary:*(void *)(a1 + 40) uploadTask:*(void *)(a1 + 32) didProgress:v4];
}

- (void)notifyAttachedObjectsUploadTaskDidStart:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CPLEngineLibrary_notifyAttachedObjectsUploadTaskDidStart___block_invoke;
  v6[3] = &unk_1E60A9650;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:0 enumerateAttachedObjects:v6];
}

void __60__CPLEngineLibrary_notifyAttachedObjectsUploadTaskDidStart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      id v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying %{public}@ that %@ did start", (uint8_t *)&v6, 0x16u);
    }
  }
  [v3 engineLibrary:*(void *)(a1 + 40) didStartUploadTask:*(void *)(a1 + 32)];
}

- (void)notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__CPLEngineLibrary_notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource___block_invoke;
  v6[3] = &unk_1E60A9650;
  id v7 = v4;
  __int16 v8 = self;
  id v5 = v4;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:1 enumerateAttachedObjects:v6];
}

void __85__CPLEngineLibrary_notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying %@ was downloaded in background to %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  [v3 engineLibrary:*(void *)(a1 + 40) didFailBackgroundDownloadOfResource:*(void *)(a1 + 32)];
}

- (void)notifyAttachedObjectsResourceDidDownloadInBackground:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CPLEngineLibrary_notifyAttachedObjectsResourceDidDownloadInBackground___block_invoke;
  v6[3] = &unk_1E60A9650;
  id v7 = v4;
  __int16 v8 = self;
  id v5 = v4;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:1 enumerateAttachedObjects:v6];
}

void __73__CPLEngineLibrary_notifyAttachedObjectsResourceDidDownloadInBackground___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying %@ was downloaded in background to %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  [v3 engineLibrary:*(void *)(a1 + 40) didDownloadResourceInBackground:*(void *)(a1 + 32)];
}

- (void)notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 80) && !*(void *)(v1 + 120))
  {
    dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v1 + 16));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), v3);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke_2;
    id v17 = &unk_1E60A6728;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    int v18 = v4;
    uint64_t v19 = v5;
    dispatch_source_set_event_handler(v4, &v14);
    int v6 = *(void **)(*(void *)(a1 + 32) + 128);
    if (v6)
    {
      objc_msgSend(v6, "timeIntervalSinceNow", v14, v15, v16, v17);
      double v8 = fabs(v7);
      double v9 = 5.0 - v8;
      BOOL v10 = v8 < 5.0;
      double v11 = 0.0;
      if (v10) {
        double v11 = v9;
      }
      int64_t v12 = 1000000000 * (uint64_t)v11;
    }
    else
    {
      int64_t v12 = 0;
    }
    dispatch_time_t v13 = dispatch_time(0, v12);
    dispatch_source_set_timer(v4, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v4);
  }
}

void __81__CPLEngineLibrary_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3 == v2[15])
  {
    [v2 _notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = 0;
  }
}

- (void)_notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  mostRecentScopeStatusCountsDidChangeNotificationDate = self->_mostRecentScopeStatusCountsDidChangeNotificationDate;
  self->_mostRecentScopeStatusCountsDidChangeNotificationDate = v3;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CPLScopeStatusCountsDidChangeNotification", 0, 0, 0);
}

- (void)notifyAttachedObjectsHasStatusChanges
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__CPLEngineLibrary_notifyAttachedObjectsHasStatusChanges__block_invoke;
  v2[3] = &unk_1E60A9628;
  v2[4] = self;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:1 enumerateAttachedObjects:v2];
}

void __57__CPLEngineLibrary_notifyAttachedObjectsHasStatusChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying status changes to %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  [v3 engineLibraryHasStatusChanges:*(void *)(a1 + 32)];
}

- (void)notifyAttachedObjectsPullQueueIsFull
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__CPLEngineLibrary_notifyAttachedObjectsPullQueueIsFull__block_invoke;
  v2[3] = &unk_1E60A9628;
  v2[4] = self;
  [(CPLEngineLibrary *)self _performBlockWithLibrary:1 enumerateAttachedObjects:v2];
}

void __56__CPLEngineLibrary_notifyAttachedObjectsPullQueueIsFull__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Notifying changes in pull queue to %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  [v3 engineLibraryHasChangesInPullQueue:*(void *)(a1 + 32)];
}

- (void)requestAttachedLibrary
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLEngineLibrary_requestAttachedLibrary__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __42__CPLEngineLibrary_requestAttachedLibrary__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 80))
  {
    id v3 = [*(id *)(v1 + 40) objectEnumerator];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (!v4) {
      goto LABEL_10;
    }
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) isLibraryManagerForEngineLibrary:*(void *)(a1 + 32)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    if ((v6 & 1) == 0)
    {
LABEL_10:
      if (!_CPLSilentLogging)
      {
        double v9 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v10 = 0;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Engine has no attached library. Trying to get one", v10, 2u);
        }
      }
      if (_requestBlock) {
        (*(void (**)(void))(_requestBlock + 16))();
      }
    }
  }
}

- (void)performBlockOnLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__15943;
  v26[4] = __Block_byref_object_dispose__15944;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke;
  void v21[3] = &unk_1E60A9600;
  v21[4] = self;
  char v24 = v28;
  id v25 = v26;
  id v6 = v5;
  id v22 = v6;
  id v7 = v4;
  id v23 = v7;
  id v8 = (void *)MEMORY[0x1BA994060](v21);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_2;
  v19[3] = &unk_1E60A5EE8;
  void v19[4] = self;
  id v9 = v8;
  id v20 = v9;
  [v6 setCancellationHandler:v19];
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_4;
  v15[3] = &unk_1E60A9EA0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v28;
  int v18 = v26;
  long long v11 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v31 = v11;
  long long v12 = queue;
  id v13 = v9;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v14);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_cancelBlockWhenLibraryAttaches:");
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;

      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    *(unsigned char *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    [*(id *)(a1 + 40) setCancellationHandler:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_3;
  v5[3] = &unk_1E60A6978;
  id v6 = *(id *)(a1 + 40);
  id v2 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v2;
  id v3 = v1;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_4(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (unsigned char *)a1[4];
  if (v2[80])
  {
    uint64_t v3 = a1[5];
    uint64_t v15 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Engine is closed"];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    dispatch_block_t v4 = [v2 _libraryObject];
    if (v4)
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v5 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v23 = _timeToWaitForLibrary;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Engine has no attached library. Trying to get one and will wait %.0fs", buf, 0xCu);
        }
      }
      if (_requestBlock) {
        (*(void (**)(void))(_requestBlock + 16))();
      }
      id v6 = (void *)a1[4];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_73;
      v20[3] = &unk_1E60A9740;
      void v20[4] = v6;
      *(_OWORD *)id v16 = *(_OWORD *)(a1 + 5);
      id v7 = v16[0];
      long long v21 = *(_OWORD *)v16;
      uint64_t v8 = [v6 _performBlockWhenLibraryAttaches:v20];
      uint64_t v9 = *(void *)(a1[7] + 8);
      BOOL v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(*(double *)&_timeToWaitForLibrary * 1000000000.0));
      uint64_t v12 = a1[4];
      id v13 = *(NSObject **)(v12 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_74;
      block[3] = &unk_1E60A9740;
      void block[4] = v12;
      *(_OWORD *)id v17 = *(_OWORD *)(a1 + 5);
      id v14 = v17[0];
      long long v19 = *(_OWORD *)v17;
      dispatch_after(v11, v13, block);
    }
  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_73(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v2 = (unsigned char *)a1[4];
    if (v2[80])
    {
      uint64_t v3 = a1[5];
      id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Engine is closed"];
      (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v9);
    }
    else
    {
      dispatch_block_t v4 = [v2 _libraryObject];
      if (v4)
      {
        if (!_CPLSilentLogging)
        {
          id v5 = __CPLLibraryOSLogDomain();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Successfully requested a library", buf, 2u);
          }
        }
        (*(void (**)(void))(a1[5] + 16))();
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v6 = __CPLLibraryOSLogDomain();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)BOOL v10 = 0;
            _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Failed to acquire a library", v10, 2u);
          }
        }
        uint64_t v7 = a1[5];
        uint64_t v8 = +[CPLErrors unknownError];
        (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
      }
    }
  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_74(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (!(*(unsigned __int8 *)(a1[4] + 80) | _CPLSilentLogging))
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        int v5 = 134217984;
        uint64_t v6 = _timeToWaitForLibrary;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Engine still has no attached library after %0.fs", (uint8_t *)&v5, 0xCu);
      }
    }
    uint64_t v3 = a1[5];
    dispatch_block_t v4 = +[CPLErrors cplErrorWithCode:83 description:@"Library failed to attach in time"];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

void __42__CPLEngineLibrary_performBlockOnLibrary___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CPLErrors operationCancelledError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_cancelBlockWhenLibraryAttaches:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMutableDictionary *)self->_blocksToDispatchWhenLibraryAttaches removeObjectForKey:v5];
}

- (id)_performBlockWhenLibraryAttaches:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = (void *)MEMORY[0x1BA994060](v5);

  [(NSMutableDictionary *)self->_blocksToDispatchWhenLibraryAttaches setObject:v7 forKeyedSubscript:v6];

  return v6;
}

- (void)_performPendingBlockForWhenLibraryAttaches
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableDictionary *)self->_blocksToDispatchWhenLibraryAttaches count])
  {
    if (self->_closed)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v3 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v4 = [(NSMutableDictionary *)self->_blocksToDispatchWhenLibraryAttaches count];
          *(_DWORD *)uint64_t v7 = 134217984;
          *(void *)&void v7[4] = v4;
          id v5 = "Performing %lu pending blocks after engine was closed";
LABEL_9:
          _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, v5, v7, 0xCu);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [(NSMutableDictionary *)self->_blocksToDispatchWhenLibraryAttaches count];
        *(_DWORD *)uint64_t v7 = 134217984;
        *(void *)&void v7[4] = v6;
        id v5 = "Performing %lu pending blocks after library attached to the engine";
        goto LABEL_9;
      }
LABEL_10:
    }
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_blocksToDispatchWhenLibraryAttaches, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_66, *(_OWORD *)v7);
    [(NSMutableDictionary *)self->_blocksToDispatchWhenLibraryAttaches removeAllObjects];
  }
}

uint64_t __62__CPLEngineLibrary__performPendingBlockForWhenLibraryAttaches__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (void)_performBlockWithLibrary:(BOOL)a3 enumerateAttachedObjects:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CPLEngineLibrary__performBlockWithLibrary_enumerateAttachedObjects___block_invoke;
  v12[3] = &unk_1E60AA2D8;
  void v12[4] = self;
  id v13 = v6;
  BOOL v14 = a3;
  uint64_t v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  id v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

void __70__CPLEngineLibrary__performBlockWithLibrary_enumerateAttachedObjects___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 80))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)(v1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          if ((*(unsigned char *)(a1 + 48) == 0) | v6 & 1) {
            v6 |= *(unsigned char *)(a1 + 48) != 0;
          }
          else {
            char v6 = [v9 isLibraryManagerForEngineLibrary:*(void *)(a1 + 32)];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    else
    {
      char v6 = 0;
    }

    if (*(unsigned char *)(a1 + 48) && (v6 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)dispatch_block_t v11 = 0;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Engine has no attached library. Trying to get one", v11, 2u);
        }
      }
      if (_requestBlock) {
        (*(void (**)(void))(_requestBlock + 16))();
      }
    }
  }
}

- (void)markAttachedObjectAsInvalid:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CPLEngineLibrary_markAttachedObjectAsInvalid___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  char v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __48__CPLEngineLibrary_markAttachedObjectAsInvalid___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        uint64_t v3 = *(void *)(a1 + 40);
        int v5 = 138543618;
        uint64_t v6 = v3;
        __int16 v7 = 2112;
        uint64_t v8 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has become invalid for %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (void)detachObject:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__CPLEngineLibrary_detachObject_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __55__CPLEngineLibrary_detachObject_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1[4] + 40) containsObject:a1[5]])
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = a1[5];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v16 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Detaching %{public}@", buf, 0xCu);
      }
    }
    [*(id *)(a1[4] + 40) removeObject:a1[5]];
    if ([*(id *)(a1[4] + 48) containsObject:a1[5]])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v4 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = (void *)a1[4];
          uint64_t v5 = a1[5];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v16 = v5;
          __int16 v17 = 2112;
          id v18 = v6;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Invalid %{public}@ detached from %@", buf, 0x16u);
        }
      }
      [*(id *)(a1[4] + 48) removeObject:a1[5]];
    }
    if ([*(id *)(a1[4] + 40) count])
    {
      if (!_CPLSilentLogging)
      {
        id v7 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v8 = a1[4];
          uint64_t v9 = [*(id *)(v8 + 40) allObjects];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v16 = v8;
          __int16 v17 = 2114;
          id v18 = v9;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ is opened with attached: %{public}@", buf, 0x16u);
        }
LABEL_24:
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v7 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = a1[4];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v16 = v14;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ is opened", buf, 0xCu);
      }
      goto LABEL_24;
    }
    (*(void (**)(void))(a1[6] + 16))();
    return;
  }
  if (!_CPLSilentLogging)
  {
    id v10 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[5];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "%{public}@ tried to detach while it was not attached", buf, 0xCu);
    }
  }
  uint64_t v12 = a1[6];
  dispatch_block_t v13 = +[CPLErrors incorrectMachineStateErrorWithReason:@"%@ is not attached to %@", a1[5], a1[4]];
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
}

- (void)attachObject:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)])
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "%{public}@ tried to attach twice", buf, 0xCu);
      }
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"%@ is already attached to %@", *(void *)(a1 + 40), *(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)])
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "%{public}@ tried to attach to %@ but it has been marked as invalid", buf, 0x16u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = +[CPLErrors incorrectMachineStateErrorWithReason:@"%@ has been marked as invalid", *(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  }
  else if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    if (!_CPLSilentLogging)
    {
      id v11 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Can't attach %{public}@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v13 = objc_msgSend(*(id *)(a1 + 40), "isLibraryManagerForEngineLibrary:");
    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 32) _libraryObject];
      if (v14)
      {
        id v15 = (void *)v14;
        if (!_CPLSilentLogging)
        {
          id v16 = __CPLLibraryOSLogDomain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = *(void *)(a1 + 40);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "%@ tried to attach to engine while there is already %@ attached to it", buf, 0x16u);
          }
        }
        id v18 = +[CPLErrors incorrectParametersErrorForParameter:@"library"];

        if (v18)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          return;
        }
      }
      else if (!_CPLSilentLogging)
      {
        uint64_t v19 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Attaching client %@ to engine", buf, 0xCu);
        }
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!_CPLSilentLogging)
    {
      long long v21 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = [*(id *)(v22 + 40) allObjects];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ is opened with attached: %{public}@.", buf, 0x16u);
      }
    }
    if (v13 && [*(id *)(*(void *)(a1 + 32) + 32) count])
    {
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = *(void **)(v24 + 16);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_60;
      void v34[3] = &unk_1E60A5DD8;
      v34[4] = v24;
      id v26 = v34;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_15925;
      __int16 v36 = &unk_1E60A6978;
      id v37 = v26;
      id v27 = v25;
      dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v27, v28);
    }
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    uint64_t v29 = *(void *)(a1 + 32);
    id v30 = *(void **)(v29 + 232);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_2;
    void v32[3] = &unk_1E60AB550;
    v32[4] = v29;
    id v33 = *(id *)(a1 + 40);
    id v31 = (id)[v30 performReadTransactionWithBlock:v32];
  }
}

uint64_t __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPendingBlockForWhenLibraryAttaches];
}

void __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_3;
  v5[3] = &unk_1E60AB750;
  uint64_t v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 do:v5];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

uint64_t __55__CPLEngineLibrary_attachObject_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 232) downloadQueue];
  uint64_t v3 = [v2 enumeratorForDownloadedResources];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 40), "engineLibrary:didDownloadResourceInBackground:", *(void *)(a1 + 32), *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      v7 += v6;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (!_CPLSilentLogging)
  {
    id v10 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v26 = v7;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "%lu resources were downloaded since last attachment of %{public}@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "pullQueue", (void)v21);
  uint64_t v13 = [v12 countOfQueuedBatches];

  if (v13)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 134218242;
        uint64_t v26 = v13;
        __int16 v27 = 2114;
        uint64_t v28 = v15;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "%lu batches have been accumulated in the pull queue since the last attachment of %{public}@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 40) engineLibraryHasChangesInPullQueue:*(void *)(a1 + 32)];
  }
  id v16 = [*(id *)(*(void *)(a1 + 32) + 232) statusCenter];
  int v17 = [v16 hasStatusChanges];

  if (v17)
  {
    if (!_CPLSilentLogging)
    {
      id v18 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v26 = v19;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Status changes have been accumulated since the last attachment of %{public}@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) engineLibraryHasStatusChanges:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged];

  return 1;
}

- (id)_libraryObject
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_attachedObjects;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!-[NSHashTable containsObject:](self->_invalidAttachedObjects, "containsObject:", v8, (void)v11)
          && ([v8 isLibraryManagerForEngineLibrary:self] & 1) != 0)
        {
          id v9 = v8;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

- (id)redactedDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CPLEngineLibrary *)self libraryIdentifier];
  uint64_t v6 = [(CPLEngineLibrary *)self clientLibraryBaseURL];
  uint64_t v7 = [v6 path];
  uint64_t v8 = [v7 lastPathComponent];
  id v9 = [v3 stringWithFormat:@"<%@ %@ at %@>", v4, v5, v8];

  return v9;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CPLEngineLibrary *)self libraryIdentifier];
  uint64_t v6 = [(CPLEngineLibrary *)self clientLibraryBaseURL];
  uint64_t v7 = [v6 path];
  uint64_t v8 = [v7 stringByAbbreviatingWithTildeInPath];
  id v9 = [v3 stringWithFormat:@"<%@ %@ at %@>", v4, v5, v8];

  return (NSString *)v9;
}

- (void)clientIsPushingChanges
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLEngineLibrary_clientIsPushingChanges__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __42__CPLEngineLibrary_clientIsPushingChanges__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 112);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startSyncSession
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __36__CPLEngineLibrary_startSyncSession__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring request for a sync session as the library failed to open (error: %@)", buf, 0xCu);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v5 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Forcing a sync session with all scopes", buf, 2u);
      }

      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v6 = *(void **)(v2 + 232);
    void v8[4] = v2;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke_45;
    v9[3] = &unk_1E60AB578;
    void v9[4] = v2;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke_46;
    v8[3] = &unk_1E60AB578;
    id v7 = (id)[v6 performWriteTransactionWithBlock:v9 completionHandler:v8];
  }
}

void __36__CPLEngineLibrary_startSyncSession__block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 232);
  id v3 = a2;
  uint64_t v4 = [v2 scopes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CPLEngineLibrary_startSyncSession__block_invoke_2;
  v6[3] = &unk_1E60AB410;
  id v7 = v4;
  id v5 = v4;
  [v3 do:v6];
}

void __36__CPLEngineLibrary_startSyncSession__block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = [a2 error];

  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) scheduler];
    [v4 noteServerHasChanges];

    id v5 = [*(id *)(a1 + 32) scheduler];
    [v5 kickOffSyncSession];
  }
}

uint64_t __36__CPLEngineLibrary_startSyncSession__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "enumeratorForScopesIncludeInactive:", 0, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) setScopeHasChangesToPullFromTransport:v9 error:a2] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v11 = __CPLLibraryOSLogDomain();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              uint64_t v12 = [v9 scopeIdentifier];
              *(_DWORD *)long long buf = 138412290;
              uint64_t v19 = v12;
              _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Failed to force %@ to pull changes from transport", buf, 0xCu);
            }
          }
          uint64_t v10 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_15:

  return v10;
}

- (void)setICloudLibraryExists:(BOOL)a3
{
}

- (BOOL)iCloudLibraryExists
{
  return [(CPLStatus *)self->_status iCloudLibraryExists];
}

- (void)setICloudLibraryHasBeenWiped:(BOOL)a3
{
}

- (BOOL)iCloudLibraryHasBeenWiped
{
  return [(CPLStatus *)self->_status iCloudLibraryHasBeenWiped];
}

- (void)updateAccountFlagsData:(id)a3
{
}

- (BOOL)hasAssetCountOnServer
{
  uint64_t v2 = [(CPLStatus *)self->_status cloudAssetCountPerType];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)totalAssetCountOnServer
{
  if (!self->_totalAssetCountHasBeenCalculated)
  {
    BOOL v3 = [(CPLStatus *)self->_status cloudAssetCountPerType];
    [(CPLEngineLibrary *)self _updateTotalAssetCountWithAssetCounts:v3];
  }
  return self->_totalAssetCount;
}

- (void)updateAssetCountsFromServer:(id)a3
{
  status = self->_status;
  id v5 = a3;
  [(CPLStatus *)status setCloudAssetCountPerType:v5 updateCheckDate:1];
  [(CPLEngineLibrary *)self _updateTotalAssetCountWithAssetCounts:v5];
}

- (void)_updateTotalAssetCountWithAssetCounts:(id)a3
{
  id v4 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CPLEngineLibrary__updateTotalAssetCountWithAssetCounts___block_invoke;
  v5[3] = &unk_1E60A95B8;
  void v5[4] = &v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
  self->_totalAssetCount = v7[3];
  self->_totalAssetCountHasBeenCalculated = 1;
  _Block_object_dispose(&v6, 8);
}

uint64_t __58__CPLEngineLibrary__updateTotalAssetCountWithAssetCounts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 unsignedIntegerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)updateDisabledFeatures:(id)a3
{
}

- (void)setLowDiskSpace:(BOOL)a3 veryLowDiskSpace:(BOOL)a4
{
}

- (void)setConnectedToNetwork:(BOOL)a3 cellularIsRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
}

- (void)setHasCellularBudget:(BOOL)a3 hasBatteryBudget:(BOOL)a4 hasLowBatteryLevel:(BOOL)a5 isConstrainedNetwork:(BOOL)a6 isBlockedByLowPowerMode:(BOOL)a7 hasHeavyResourceUsage:(BOOL)a8 hasPoorNetworkQuality:(BOOL)a9 hasModerateThermalPressure:(BOOL)a10 hasThermalPressure:(BOOL)a11 hasPoorSystemConditions:(BOOL)a12 isBudgetValid:(BOOL)a13 blockedReason:(int64_t)a14 unBlockedReason:(int64_t)a15
{
}

- (void)setIsStuckInExitForSharedLibrary:(BOOL)a3
{
}

- (BOOL)isStuckInExitForSharedLibrary
{
  return [(CPLStatus *)self->_status isStuckInExitForSharedLibrary];
}

- (void)updateComputeSyncMetrics:(int64_t)a3 silentDecryptionFailed:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (a3 == 1)
  {
    id v15 = v8;
    metrics = self->_metrics;
    p_metrics = &self->_metrics;
    [(CPLMetrics *)metrics incrementCountForKey:@"DownloadCount"];
    id v8 = v15;
    if (v15)
    {
      [(CPLMetrics *)*p_metrics incrementCountForKey:@"DownloadFailureCount"];
      if (([v15 isCPLEncryptionError] & 1) == 0)
      {
        int v13 = [v15 isCPLThrottlingError];
        uint64_t v11 = &PLCoreAnalyticsLibrarySummaryiCPLComputeSyncDownloadCKErrorCountKey;
        long long v14 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncDownloadThrottledErrorCountKey;
        goto LABEL_13;
      }
    }
    else
    {
      if (!v5) {
        goto LABEL_16;
      }
      [(CPLMetrics *)*p_metrics incrementCountForKey:@"DownloadFailureCount"];
    }
    uint64_t v11 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncDownloadDecryptionErrorCountKey;
    goto LABEL_15;
  }
  if (!a3)
  {
    id v15 = v8;
    uint64_t v10 = self->_metrics;
    p_metrics = &self->_metrics;
    [(CPLMetrics *)v10 incrementCountForKey:@"UploadCount"];
    id v8 = v15;
    if (v15)
    {
      [(CPLMetrics *)*p_metrics incrementCountForKey:@"UploadFailureCount"];
      if ([v15 isCPLEncryptionError])
      {
        uint64_t v11 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncUploadEncryptionErrorCountKey;
LABEL_15:
        [(CPLMetrics *)*p_metrics incrementCountForKey:*v11];
        id v8 = v15;
        goto LABEL_16;
      }
      int v13 = [v15 isCPLThrottlingError];
      uint64_t v11 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncUploadCKErrorCountKey;
      long long v14 = PLCoreAnalyticsLibrarySummaryiCPLComputeSyncUploadThrottledErrorCountKey;
LABEL_13:
      if (v13) {
        uint64_t v11 = v14;
      }
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)updateBlockedMetrics:(BOOL)a3 syncRequested:(BOOL)a4
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CPLEngineLibrary_updateBlockedMetrics_syncRequested___block_invoke;
  v8[3] = &unk_1E60A9540;
  BOOL v9 = a4;
  void v8[4] = self;
  BOOL v10 = a3;
  BOOL v5 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v12 = v5;
  uint64_t v6 = queue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

uint64_t __55__CPLEngineLibrary_updateBlockedMetrics_syncRequested___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = (unsigned char *)(a1 + 32);
    uint64_t v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionTotalSessionsCountKey;
    goto LABEL_36;
  }
  uint64_t v1 = (unsigned char *)(a1 + 32);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1[9])
  {
    __int16 v4 = [v3 blockedReason];
    char v5 = [*(id *)(*(void *)v1 + 64) hasBatteryBudget];
    if ((v5 & 1) == 0) {
      [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"BatteryBlockedCount"];
    }
    if ([*(id *)(*(void *)v1 + 64) hasLowBatteryLevel])
    {
      [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"LowBatteryLevelBlockedCount"];
      char v6 = 1;
    }
    else
    {
      char v6 = v5 ^ 1;
    }
    if (([*(id *)(*(void *)v1 + 64) hasCellularBudget] & 1) == 0)
    {
      [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"CellularBlockedCount"];
      char v6 = 1;
    }
    if ([*(id *)(*(void *)v1 + 64) isBlockedByLowPowerMode])
    {
      [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"LowPowerModeBlockedCount"];
      char v6 = 1;
    }
    if ([*(id *)(*(void *)v1 + 64) isConstrainedNetwork])
    {
      [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"LowDataModeBlockedCount"];
      char v6 = 1;
      if ((v4 & 0x40) == 0)
      {
LABEL_19:
        if ((v4 & 0x80) == 0) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    else if ((v4 & 0x40) == 0)
    {
      goto LABEL_19;
    }
    [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"CPUUsageBlockedCount"];
    char v6 = 1;
    if ((v4 & 0x80) == 0)
    {
LABEL_21:
      if ([*(id *)(*(void *)v1 + 64) hasPoorNetworkQuality])
      {
        [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"PoorNetworkQualityBlockedCount"];
        char v6 = 1;
        if ((v4 & 0x400) == 0)
        {
LABEL_23:
          if ((v4 & 0x4000) == 0)
          {
LABEL_25:
            if ([*(id *)(*(void *)v1 + 64) hasModerateThermalPressure])
            {
              [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"ModerateThermalPressureBlockedCount"];
              char v6 = 1;
            }
            if ([*(id *)(*(void *)v1 + 64) hasThermalPressure])
            {
              [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"ThermalPressureBlockedCount"];
              char v6 = 1;
            }
            if ((v4 & 0xA200) != 0)
            {
              [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"PoorSystemConditionsBlockedCount"];
              char v6 = 1;
            }
            if ([*(id *)(*(void *)v1 + 240) isClientInForeground]) {
              [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"UIVisibleBlockedCount"];
            }
            if ((v6 & 1) == 0) {
              [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"UnknownReasonBlockedCount"];
            }
            uint64_t v2 = &PLCoreAnalyticsLibrarySummaryiCPLSyncSessionBlockedSessionsCountKey;
            goto LABEL_36;
          }
LABEL_24:
          [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"GroupSchedulingBlockedCount"];
          char v6 = 1;
          goto LABEL_25;
        }
      }
      else if ((v4 & 0x400) == 0)
      {
        goto LABEL_23;
      }
      [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"ThunderingHerdBlockedCount"];
      char v6 = 1;
      if ((v4 & 0x4000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_20:
    [*(id *)(*(void *)v1 + 72) incrementCountForKey:@"MemoryPressureBlockedCount"];
    char v6 = 1;
    goto LABEL_21;
  }
  uint64_t result = [v3 unBlockedReason];
  switch(result)
  {
    case 1:
      uint64_t v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionDASUnBlockedCountKey;
      break;
    case 4:
      uint64_t v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionRemoteDeviceIntentUnBlockedCountKey;
      break;
    case 2:
      uint64_t v2 = PLCoreAnalyticsLibrarySummaryiCPLSyncSessionOverrideUnBlockedCountKey;
      break;
    default:
      return result;
  }
LABEL_36:
  id v8 = *(void **)(*(void *)v1 + 72);
  BOOL v9 = *v2;

  return [v8 incrementCountForKey:v9];
}

- (void)setICloudLibraryClientIsNotAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CPLStatus *)self->_status iCloudLibraryClientIsNotAuthenticated];
  [(CPLStatus *)self->_status setICloudLibraryClientIsNotAuthenticated:v3];
  if (v5 && !v3)
  {
    scheduler = self->_scheduler;
    [(CPLEngineScheduler *)scheduler noteNetworkStateDidChange];
  }
}

- (BOOL)iCloudLibraryClientIsNotAuthenticated
{
  return [(CPLStatus *)self->_status iCloudLibraryClientIsNotAuthenticated];
}

- (void)setICloudLibraryClientVersionTooOld:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CPLStatus *)self->_status iCloudLibraryClientVersionTooOld];
  [(CPLStatus *)self->_status setICloudLibraryClientVersionTooOld:v3];
  if (v5 && !v3)
  {
    char v6 = __CPLBuildVersion();
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v7 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v14 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Client version (%@) is no longer blacklisted, resetting to normal operations", buf, 0xCu);
      }
    }
    id v8 = [(CPLEngineLibrary *)self store];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke;
    v11[3] = &unk_1E60AB578;
    id v12 = v8;
    id v9 = v8;
    id v10 = (id)[v9 performWriteTransactionWithBlock:v11 completionHandler:&__block_literal_global_16123];
  }
}

void __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke_2;
  v3[3] = &unk_1E60AB410;
  id v4 = *(id *)(a1 + 32);
  [a2 do:v3];
}

uint64_t __56__CPLEngineLibrary_setICloudLibraryClientVersionTooOld___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resetCompleteSyncStateWithCause:@"out of blacklist" error:a2];
}

- (BOOL)iCloudLibraryClientVersionTooOld
{
  return [(CPLStatus *)self->_status iCloudLibraryClientVersionTooOld];
}

- (void)setContainerHasBeenWiped:(BOOL)a3
{
  BOOL v3 = a3;
  -[CPLStatus setContainerHasBeenWiped:](self->_status, "setContainerHasBeenWiped:");
  if (v3)
  {
    scheduler = self->_scheduler;
    [(CPLEngineScheduler *)scheduler noteContainerHasBeenWiped];
  }
}

- (BOOL)containerHasBeenWiped
{
  return [(CPLStatus *)self->_status containerHasBeenWiped];
}

- (void)setServerFeatureCompatibleVersion:(int64_t)a3
{
}

- (int64_t)serverFeatureCompatibleVersion
{
  return [(CPLStatus *)self->_status serverFeatureCompatibleVersion];
}

- (void)setUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return [(CPLStatus *)self->_status isUpgradeSuggestedToAccessAllPhotos];
}

- (void)setKeychainCDPEnabled:(BOOL)a3
{
}

- (BOOL)isKeychainCDPEnabled
{
  return [(CPLStatus *)self->_status isKeychainCDPEnabled];
}

- (void)setWalrusEnabled:(BOOL)a3
{
}

- (BOOL)isWalrusEnabled
{
  return [(CPLStatus *)self->_status isWalrusEnabled];
}

- (void)setExitDeleteTime:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CPLStatus *)self->_status exitDeleteTime];
  char v6 = (void *)v5;
  if (v4 || !v5)
  {
    if (!v4) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_17;
    }
    [v4 timeIntervalSinceDate:v5];
    if (v17 < 0.0) {
      double v17 = -v17;
    }
    if (v17 <= 1.0)
    {
      if (_CPLSilentLogging) {
        goto LABEL_29;
      }
      id v18 = __CPLLibraryOSLogDomain();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

LABEL_29:
        id v11 = [(NSURL *)self->_clientLibraryBaseURL URLByAppendingPathComponent:@"initialsync_marker"];
        uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v24 = 0;
        char v21 = [v20 removeItemAtURL:v11 error:&v24];
        id v12 = v24;
        if ((v21 & 1) == 0 && ([v20 cplIsFileDoesNotExistError:v12] & 1) == 0 && !_CPLSilentLogging)
        {
          long long v22 = __CPLLibraryOSLogDomain();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            long long v23 = [v11 path];
            *(_DWORD *)long long buf = 138543618;
            id v27 = v23;
            __int16 v28 = 2112;
            uint64_t v29 = (__CFString *)v12;
            _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "Fail to remove %{public}@, error: %@", buf, 0x16u);
          }
        }

        goto LABEL_36;
      }
      *(_DWORD *)long long buf = 138543618;
      id v27 = v4;
      __int16 v28 = 2114;
      uint64_t v29 = @"initialsync_marker";
      uint64_t v19 = "Updating exit mode (%{public}@), removing %{public}@ if present";
    }
    else
    {
LABEL_17:
      if (_CPLSilentLogging) {
        goto LABEL_29;
      }
      id v18 = __CPLLibraryOSLogDomain();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)long long buf = 138543618;
      id v27 = v4;
      __int16 v28 = 2114;
      uint64_t v29 = @"initialsync_marker";
      uint64_t v19 = "Starting exit mode (%{public}@), removing %{public}@ if present";
    }
    _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
    goto LABEL_28;
  }
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v7 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Engine is no longer in exit mode, resetting to normal operations", buf, 2u);
    }
  }
  id v8 = [(CPLStatus *)self->_status initialSyncDate];

  if (v8)
  {
    status = self->_status;
    id v25 = 0;
    BOOL v10 = [(CPLStatus *)status writeInitialSyncMarker:&v25];
    id v11 = v25;
    if (v10)
    {
      if (!_CPLSilentLogging)
      {
        id v12 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          int v13 = "Rewriting initial sync marker";
          long long v14 = v12;
          os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
          uint32_t v16 = 2;
LABEL_23:
          _os_log_impl(&dword_1B4CAC000, v14, v15, v13, buf, v16);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v12 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v11;
        int v13 = "Fail to write initial sync marker, error: %@";
        long long v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 12;
        goto LABEL_23;
      }
LABEL_36:
    }
  }
LABEL_38:
  [(CPLStatus *)self->_status setExitDeleteTime:v4];
}

- (NSDate)exitDeleteTime
{
  return [(CPLStatus *)self->_status exitDeleteTime];
}

- (void)setBusyState:(int64_t)a3
{
}

- (int64_t)busyState
{
  return [(CPLStatus *)self->_status busyState];
}

- (void)setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:(unint64_t)a3
{
}

- (unint64_t)estimatedCountOfRemainingRecordsDuringSharedLibraryExit
{
  return [(CPLStatus *)self->_status estimatedCountOfRemainingRecordsDuringSharedLibraryExit];
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
}

- (BOOL)isExceedingSharedLibraryQuota
{
  return [(CPLStatus *)self->_status isExceedingSharedLibraryQuota];
}

- (void)setIsExceedingQuota:(BOOL)a3
{
}

- (BOOL)isExceedingQuota
{
  return [(CPLStatus *)self->_status isExceedingQuota];
}

- (void)setHasChangesToProcess:(BOOL)a3
{
}

- (BOOL)hasChangesToProcess
{
  return [(CPLStatus *)self->_status hasChangesToProcess];
}

- (NSDate)initialDownloadDate
{
  return [(CPLStatus *)self->_status initialDownloadDate];
}

- (void)updateInitialDownloadDate:(id)a3
{
}

- (NSDate)initialSyncDate
{
  return [(CPLStatus *)self->_status initialSyncDate];
}

- (void)updateInitialSyncDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CPLStatus *)self->_status initialSyncDate];

    if (!v5)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __42__CPLEngineLibrary_updateInitialSyncDate___block_invoke;
      v10[3] = &unk_1E60A5DD8;
      void v10[4] = self;
      dispatch_block_t v7 = v10;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_15925;
      block[3] = &unk_1E60A6978;
      id v12 = v7;
      id v8 = queue;
      dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v8, v9);
    }
  }
  [(CPLStatus *)self->_status setInitialSyncDate:v4];
}

void __42__CPLEngineLibrary_updateInitialSyncDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained engineLibraryDidCompleteInitialSyncOfMainScope:*(void *)(a1 + 32)];
}

- (void)updateLastSuccessfullSyncDate:(id)a3
{
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v7 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Closing %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      id v8 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ is closing", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CPLEngineLibrary_closeAndDeactivate_completionHandler___block_invoke;
  v14[3] = &unk_1E60AA2D8;
  BOOL v16 = a3;
  void v14[4] = self;
  id v15 = v6;
  BOOL v10 = v14;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v18 = __cpl_dispatch_async_block_invoke_15925;
  uint64_t v19 = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v11, v13);
}

void __57__CPLEngineLibrary_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "engineWillClose:");
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
  uint64_t v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[15])
  {
    dispatch_source_cancel(v2[15]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 120);
    *(void *)(v3 + 120) = 0;

    uint64_t v2 = *(dispatch_source_t **)(a1 + 32);
  }
  [(dispatch_source_t *)v2 _performPendingBlockForWhenLibraryAttaches];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) reverseObjectEnumerator];
  objc_msgSend(*(id *)(a1 + 32), "_closeNextComponent:deactivate:lastError:completionHandler:");
  if (*(void *)(*(void *)(a1 + 32) + 136))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 removeObserver:*(void *)(*(void *)(a1 + 32) + 136) name:@"CPLMetricsDidChangeNotification" object:0];

    uint64_t v6 = *(void *)(a1 + 32);
    dispatch_block_t v7 = *(void **)(v6 + 136);
    *(void *)(v6 + 136) = 0;
  }
}

- (NSString)currentClosingComponentName
{
  uint64_t v6 = 0;
  dispatch_block_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_block_t v9 = __Block_byref_object_copy__15943;
  BOOL v10 = __Block_byref_object_dispose__15944;
  id v11 = 0;
  closingQueue = self->_closingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CPLEngineLibrary_currentClosingComponentName__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(closingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __47__CPLEngineLibrary_currentClosingComponentName__block_invoke(uint64_t a1)
{
}

- (void)_setCurrentClosingComponentName:(id)a3
{
  id v4 = a3;
  closingQueue = self->_closingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CPLEngineLibrary__setCurrentClosingComponentName___block_invoke;
  v7[3] = &unk_1E60A6728;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(closingQueue, v7);
}

void __52__CPLEngineLibrary__setCurrentClosingComponentName___block_invoke(uint64_t a1)
{
}

- (void)_closeNextComponent:(id)a3 deactivate:(BOOL)a4 lastError:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_block_t v13 = [v10 nextObject];
  if (v13)
  {
    if (!_CPLSilentLogging)
    {
      long long v14 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Closing %{public}@", buf, 0xCu);
      }

      if (!_CPLSilentLogging)
      {
        id v15 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            BOOL v16 = "Deactivating";
          }
          else {
            BOOL v16 = "Closing";
          }
          double v17 = [v13 componentName];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
    }
    id v18 = [v13 componentName];
    [(CPLEngineLibrary *)self _setCurrentClosingComponentName:v18];

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v28 = __Block_byref_object_copy__15943;
    uint64_t v29 = __Block_byref_object_dispose__15944;
    id v30 = v11;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke;
    v20[3] = &unk_1E60A9478;
    BOOL v26 = v8;
    id v25 = buf;
    id v21 = v13;
    long long v22 = self;
    id v23 = v10;
    id v24 = v12;
    +[CPLCallObserver observeAsyncCallOn:v21 selector:sel_closeAndDeactivate_completionHandler_ block:v20];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v19 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ is closed", buf, 0xCu);
      }
    }
    [(CPLStatus *)self->_status setDelegate:0];
    (*((void (**)(id, id))v12 + 2))(v12, v11);
    dispatch_resume((dispatch_object_t)self->_queue);
  }
}

void __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke_2;
  v10[3] = &unk_1E60A9450;
  id v11 = v3;
  id v6 = v4;
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  BOOL v8 = *(void **)(a1 + 48);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  char v17 = *(unsigned char *)(a1 + 72);
  id v15 = *(id *)(a1 + 56);
  id v9 = v3;
  [v6 closeAndDeactivate:v5 completionHandler:v10];
}

void __79__CPLEngineLibrary__closeNextComponent_deactivate_lastError_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) callDidFinish];
  int v4 = _CPLSilentLogging;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Closing %{public}@ completed", (uint8_t *)&v13, 0xCu);
    }

    int v4 = _CPLSilentLogging;
  }
  if (v3)
  {
    if (!v4)
    {
      uint64_t v7 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v13 = 138543618;
        uint64_t v14 = v8;
        __int16 v15 = 2112;
        id v16 = v3;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to close with error: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    if (!*(void *)(v9 + 40))
    {
      id v10 = v3;
      id v11 = *(NSObject **)(v9 + 40);
      *(void *)(v9 + 40) = v10;
LABEL_15:
    }
  }
  else if (!v4)
  {
    id v11 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ is closed", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_15;
  }
  [*(id *)(a1 + 48) _closeNextComponent:*(void *)(a1 + 56) deactivate:*(unsigned __int8 *)(a1 + 80) lastError:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) completionHandler:*(void *)(a1 + 64)];
}

- (void)openWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLLibraryOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Opening %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5EE8;
  void v11[4] = self;
  id v12 = v4;
  uint64_t v7 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v14 = __cpl_dispatch_async_block_invoke_15925;
  __int16 v15 = &unk_1E60A6978;
  id v16 = v7;
  uint64_t v8 = queue;
  id v9 = v4;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v8, v10);
}

void __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectEnumerator];
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60A6AB0;
  void v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _openNextComponent:v2 completionHandler:v4];
}

void __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    id v4 = __CPLLibraryOSLogDomain();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v3;
    uint64_t v6 = "Opening %{public}@ failed: %@";
    uint64_t v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 22;
    goto LABEL_8;
  }
  [*(id *)(*(void *)(a1 + 32) + 64) checkInitialSyncMarker];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "engineDidOpen:");
  dispatch_block_t v10 = [MEMORY[0x1E4F28C40] defaultCenter];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E60A9428;
  void v16[4] = *(void *)(a1 + 32);
  uint64_t v11 = [v10 addObserverForName:@"CPLMetricsDidChangeNotification" object:0 queue:0 usingBlock:v16];
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 136);
  *(void *)(v12 + 136) = v11;

  if (_CPLSilentLogging) {
    goto LABEL_10;
  }
  id v4 = __CPLLibraryOSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v18 = v14;
    uint64_t v6 = "Opening %{public}@ succeeded";
    uint64_t v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v7, v8, v6, buf, v9);
  }
LABEL_9:

LABEL_10:
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

void __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = v1;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = v2;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __46__CPLEngineLibrary_openWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) forceLoad];
}

- (void)_openNextComponent:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 nextObject];
  if (v8)
  {
    if (!_CPLSilentLogging)
    {
      uint32_t v9 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = self;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Opening %{public}@ for %@", buf, 0x16u);
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke;
    v10[3] = &unk_1E60A93F8;
    id v11 = v8;
    uint64_t v12 = self;
    id v14 = v7;
    id v13 = v6;
    +[CPLCallObserver observeAsyncCallOn:v11 selector:sel_openWithCompletionHandler_ block:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke_2;
  v8[3] = &unk_1E60A93D0;
  id v9 = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v13 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  [v5 openWithCompletionHandler:v8];
}

void __57__CPLEngineLibrary__openNextComponent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [*(id *)(a1 + 32) callDidFinish];
  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 48);
        int v11 = 138543874;
        uint64_t v12 = v6;
        __int16 v13 = 2112;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "%{public}@ for %@ failed to open: %@", (uint8_t *)&v11, 0x20u);
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 56), a2);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        int v11 = 138543618;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Opened %{public}@ for %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [*(id *)(a1 + 48) _openNextComponent:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
}

- (id)corruptionInfo
{
  return [(CPLEngineStore *)self->_store corruptionInfo];
}

- (void)reportQuarantineCountIfNecessary
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_async(queue, block);
}

id __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[11])
  {
    return (id)objc_msgSend(v1, "_reportQuarantineCountIfNecessaryWithLastReportDate:");
  }
  else
  {
    id v3 = (void *)v1[29];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_2;
    v4[3] = &unk_1E60AB578;
    void v4[4] = v1;
    return (id)[v3 performReadTransactionWithBlock:v4];
  }
}

void __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 232) lastQuarantineCountReportDate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_3;
  v9[3] = &unk_1E60A6728;
  void v9[4] = v3;
  id v10 = v2;
  id v5 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v12 = v5;
  uint64_t v6 = v4;
  id v7 = v2;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v8);
}

uint64_t __52__CPLEngineLibrary_reportQuarantineCountIfNecessary__block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[11];

  return [v2 _reportQuarantineCountIfNecessaryWithLastReportDate:v3];
}

- (void)_reportQuarantineCountIfNecessaryWithLastReportDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = [v4 date];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  if (v8 > 86400.0 || v8 < 0.0)
  {
    store = self->_store;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke;
    v13[3] = &unk_1E60AB550;
    v13[4] = self;
    id v14 = v6;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_3;
    v11[3] = &unk_1E60AB550;
    void v11[4] = self;
    id v12 = v14;
    id v10 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v13 completionHandler:v11];
  }
}

void __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_2;
  v4[3] = &unk_1E60AB750;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 do:v4];
}

void __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_4;
  v6[3] = &unk_1E60A6728;
  void v6[4] = v1;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v9 = v3;
  id v4 = v2;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_4(uint64_t a1)
{
}

uint64_t __72__CPLEngineLibrary__reportQuarantineCountIfNecessaryWithLastReportDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) storeLastQuarantineCountReportDate:*(void *)(a1 + 40) error:a2];
}

- (void)reportLibraryCorrupted
{
  self->_libraryIsCorrupted = 1;
}

- (CPLEngineLibrary)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v78.receiver = self;
  v78.super_class = (Class)CPLEngineLibrary;
  id v20 = [(CPLEngineLibrary *)&v78 init];
  if (v20)
  {
    uint64_t v21 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.cpl.enginelibrary", v21);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v22;

    id v24 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.cpl.enginelibrary.closing", v24);
    closingQueue = v20->_closingQueue;
    v20->_closingQueue = (OS_dispatch_queue *)v25;

    id v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    blocksToDispatchWhenLibraryAttaches = v20->_blocksToDispatchWhenLibraryAttaches;
    v20->_blocksToDispatchWhenLibraryAttaches = v27;

    uint64_t v29 = [v15 copy];
    clientLibraryBaseURL = v20->_clientLibraryBaseURL;
    v20->_clientLibraryBaseURL = (NSURL *)v29;

    uint64_t v31 = [v16 copy];
    cloudLibraryStateStorageURL = v20->_cloudLibraryStateStorageURL;
    v20->_cloudLibraryStateStorageURL = (NSURL *)v31;

    uint64_t v33 = [v17 copy];
    cloudLibraryResourceStorageURL = v20->_cloudLibraryResourceStorageURL;
    v20->_cloudLibraryResourceStorageURL = (NSURL *)v33;

    uint64_t v35 = [v18 copy];
    libraryIdentifier = v20->_libraryIdentifier;
    v20->_libraryIdentifier = (NSString *)v35;

    objc_storeStrong((id *)&v20->_mainScopeIdentifier, a7);
    v20->_isSystemLibrary = [v18 isEqualToString:@"SystemLibrary"];
    v20->_isAppLibrary = [v18 hasPrefix:CPLAppLibraryIdentifierPrefix];
    v20->_libraryOptions = a8;
    if (!_CPLSilentLogging)
    {
      id v37 = __CPLLibraryOSLogDomain();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138413058;
        id v85 = v20;
        __int16 v86 = 2112;
        id v87 = v15;
        __int16 v88 = 2112;
        id v89 = v16;
        __int16 v90 = 2112;
        id v91 = v17;
        _os_log_impl(&dword_1B4CAC000, v37, OS_LOG_TYPE_DEBUG, "Creating %@ in %@ (storage: %@/resources: %@)", buf, 0x2Au);
      }
    }
    uint64_t v38 = [[CPLStatus alloc] initWithClientLibraryBaseURLForCPLEngine:v20->_clientLibraryBaseURL];
    status = v20->_status;
    v20->_status = v38;

    [(CPLStatus *)v20->_status setDelegate:v20];
    char v40 = [[CPLMetrics alloc] initWithClientLibraryBaseURLForCPLEngine:v20->_clientLibraryBaseURL];
    metrics = v20->_metrics;
    v20->_metrics = v40;

    id v42 = [[CPLEngineStore alloc] initWithEngineLibrary:v20];
    store = v20->_store;
    v20->_store = v42;

    id v44 = [[CPLEngineSyncManager alloc] initWithEngineLibrary:v20];
    syncManager = v20->_syncManager;
    v20->_syncManager = v44;

    uint64_t v46 = [[CPLEngineTransport alloc] initWithEngineLibrary:v20];
    transport = v20->_transport;
    v20->_transport = v46;

    id v48 = [[CPLEngineScheduler alloc] initWithEngineLibrary:v20];
    scheduler = v20->_scheduler;
    v20->_scheduler = v48;

    uint64_t v50 = [[CPLEngineSystemMonitor alloc] initWithEngineLibrary:v20];
    systemMonitor = v20->_systemMonitor;
    v20->_systemMonitor = v50;

    id v52 = [[CPLEngineFeedbackManager alloc] initWithEngineLibrary:v20];
    feedback = v20->_feedback;
    v20->_feedback = v52;

    uint64_t v54 = [[CPLConfiguration alloc] initWithClientLibraryBaseURL:v20->_clientLibraryBaseURL];
    configuration = v20->_configuration;
    v20->_configuration = v54;

    [(CPLConfiguration *)v20->_configuration setConfigurationDictionaryUniquifier:&__block_literal_global_34_9384];
    id v56 = +[CPLPlatform currentPlatform];
    uint64_t v57 = [v56 newPlatformImplementationForObject:v20];
    platformObject = v20->_platformObject;
    v20->_platformObject = (CPLPlatformObject *)v57;

    if (!v20->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        id v73 = __CPLLibraryOSLogDomain();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          id v74 = (CPLEngineLibrary *)objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          id v85 = v74;
          v75 = v74;
          _os_log_impl(&dword_1B4CAC000, v73, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      v76 = [MEMORY[0x1E4F28B00] currentHandler];
      v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineLibrary.m"];
      [v76 handleFailureInMethod:a2, v20, v77, 224, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
    id v59 = [(CPLEngineLibrary *)v20 platformObject];
    id v60 = v20->_store;
    id v61 = v20->_scheduler;
    v79[0] = v59;
    v79[1] = v60;
    long long v80 = *(_OWORD *)&v20->_syncManager;
    id v62 = v20->_systemMonitor;
    v63 = v20->_feedback;
    v81 = v61;
    id v82 = v62;
    id v83 = v63;
    uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:7];
    components = v20->_components;
    v20->_components = (NSArray *)v64;

    uint64_t v66 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    attachedObjects = v20->_attachedObjects;
    v20->_attachedObjects = (NSHashTable *)v66;

    uint64_t v68 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    invalidAttachedObjects = v20->_invalidAttachedObjects;
    v20->_invalidAttachedObjects = (NSHashTable *)v68;

    v70 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    holdTestAssertions = v20->_holdTestAssertions;
    v20->_holdTestAssertions = v70;
  }
  return v20;
}

+ (id)platformImplementationProtocol
{
  uint64_t v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [v2 stringByAppendingString:@"Implementation"];
  id v4 = NSProtocolFromString(v3);

  return v4;
}

+ (void)setTimeToWaitForClientToPullChanges:(double)a3
{
  if (a3 == 0.0) {
    a3 = 60.0;
  }
  _timeToWaitForClientToPullChanges = *(void *)&a3;
}

+ (double)timeToWaitForClientToPullChanges
{
  return *(double *)&_timeToWaitForClientToPullChanges;
}

+ (void)setFailOnPushingChangesTimeout:(BOOL)a3
{
  _failOnPushingChangesTimeout = a3;
}

+ (BOOL)failOnPushingChangesTimeout
{
  return _failOnPushingChangesTimeout;
}

+ (void)setTimeToWaitForClientToPushChanges:(double)a3
{
  if (a3 == 0.0) {
    a3 = 20.0;
  }
  _timeToWaitForClientToPushChanges = *(void *)&a3;
}

+ (double)timeToWaitForClientToPushChanges
{
  return *(double *)&_timeToWaitForClientToPushChanges;
}

+ (void)setTimeToWaitForClientToActivateScopes:(double)a3
{
  if (a3 == 0.0) {
    a3 = 60.0;
  }
  _timeToWaitForClientToActivateScopes = *(void *)&a3;
}

+ (double)timeToWaitForClientToActivateScopes
{
  return *(double *)&_timeToWaitForClientToActivateScopes;
}

+ (void)setTimeToWaitForLibrary:(double)a3
{
  if (a3 == 0.0) {
    a3 = 10.0;
  }
  _timeToWaitForLibrary = *(void *)&a3;
}

+ (double)timeToWaitForLibrary
{
  return *(double *)&_timeToWaitForLibrary;
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  id v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  dispatch_queue_t v25 = __Block_byref_object_copy__15943;
  BOOL v26 = __Block_byref_object_dispose__15944;
  id v27 = 0;
  int v11 = [CPLEngineComponentEnumerator alloc];
  id v12 = [(CPLEngineLibrary *)self _allComponentsIncludingPlatformObjects:1 respondingToSelector:sel_testKey_value_completionHandler_];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke;
  v17[3] = &unk_1E60AA080;
  void v17[4] = self;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  id v15 = v10;
  id v20 = v15;
  uint64_t v21 = &v22;
  id v16 = [(CPLEngineComponentEnumerator *)v11 initWithComponents:v12 handler:v17];

  objc_storeStrong(v23 + 5, v16);
  [(CPLEngineComponentEnumerator *)v16 handleNextComponent];

  _Block_object_dispose(&v22, 8);
}

void __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke_2;
    v12[3] = &unk_1E60AA058;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    id v13 = v6;
    uint64_t v14 = v7;
    [a2 testKey:v4 value:v5 completionHandler:v12];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    [v8 _testKey:v9 value:v10 completionHandler:v11];
  }
}

uint64_t __67__CPLEngineLibrary_CPLManagement__testKey_value_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) handleNextComponent];
  }
}

- (id)_allComponentsIncludingPlatformObjects:(BOOL)a3 respondingToSelector:(SEL)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_components;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v4
          && objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "conformsToProtocol:", &unk_1F0D96410, (void)v15))
        {
          id v13 = [v12 platformObject];
          if ([v13 conformsToProtocol:&unk_1F0D97BA8]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            [v6 addObject:v13];
          }
        }
        if (objc_opt_respondsToSelector()) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  uint64_t v10 = (void (**)(id, __CFString *, void))a5;
  if ([v8 isEqual:@"ping"])
  {
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = @"pong";
    }
    v10[2](v10, v11, 0);
  }
  else
  {
    if ([v8 isEqual:@"hold-assertion"])
    {
      id v12 = [(__CFString *)v9 componentsSeparatedByString:@" "];
      uint64_t v13 = [(__CFString *)v12 firstObject];
      uint64_t v14 = (void *)v13;
      long long v15 = @"ctl.test-assertion";
      if (v13) {
        long long v15 = (__CFString *)v13;
      }
      long long v16 = v15;

      if ((unint64_t)[(__CFString *)v12 count] < 2)
      {
        long long v18 = @"testing assertions";
      }
      else
      {
        long long v17 = -[__CFString subarrayWithRange:](v12, "subarrayWithRange:", 1, [(__CFString *)v12 count] - 1);
        long long v18 = [v17 componentsJoinedByString:@" "];
      }
      queue = self->_queue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke;
      void v34[3] = &unk_1E60A64B0;
      v34[4] = self;
      uint64_t v35 = v16;
      __int16 v36 = v18;
      id v37 = v10;
      BOOL v26 = v34;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      char v40 = __cpl_dispatch_async_block_invoke_15925;
      id v41 = &unk_1E60A6978;
      id v42 = v26;
      id v27 = queue;
      __int16 v28 = v18;
      uint64_t v29 = v16;
      dispatch_block_t v30 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v27, v30);
    }
    else if ([v8 isEqual:@"release-assertion"])
    {
      id v19 = @"ctl.test-assertion";
      if (v9) {
        id v19 = v9;
      }
      uint64_t v20 = v19;
      uint64_t v21 = self->_queue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke_2;
      v31[3] = &unk_1E60A6868;
      v31[4] = self;
      id v32 = v20;
      uint64_t v33 = v10;
      uint64_t v22 = v31;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      char v40 = __cpl_dispatch_async_block_invoke_15925;
      id v41 = &unk_1E60A6978;
      id v42 = v22;
      id v23 = v21;
      id v12 = v20;
      dispatch_block_t v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v23, v24);
    }
    else
    {
      id v12 = +[CPLErrors incorrectParametersErrorForParameter:v8];
      ((void (**)(id, __CFString *, __CFString *))v10)[2](v10, 0, v12);
    }
  }
}

uint64_t __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 104) addObject:a1[5]];
  +[CPLTransaction beginTransactionWithIdentifier:a1[5] description:a1[6] keepPower:1];
  uint64_t v2 = *(uint64_t (**)(void))(a1[7] + 16);

  return v2();
}

void __68__CPLEngineLibrary_CPLManagement___testKey_value_completionHandler___block_invoke_2(void *a1)
{
  if ([*(id *)(a1[4] + 104) containsObject:a1[5]])
  {
    [*(id *)(a1[4] + 104) removeObject:a1[5]];
    +[CPLTransaction endTransactionWithIdentifier:a1[5]];
    uint64_t v2 = *(void (**)(void))(a1[6] + 16);
    v2();
  }
  else
  {
    uint64_t v3 = a1[6];
    id v4 = +[CPLErrors incorrectMachineStateErrorWithReason:@"unknown assertion"];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_2;
  v17[3] = &unk_1E60A64B0;
  void v17[4] = *(void *)(a1 + 32);
  id v3 = v2;
  id v18 = v3;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v4 = (void (**)(void))MEMORY[0x1BA994060](v17);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  id v6 = [WeakRetained ownerNameForEngineLibrary:*(void *)(a1 + 32)];
  if (v6 && ((id v7 = *(void **)(a1 + 40)) == 0 || [v7 containsObject:v6]))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_4;
    v11[3] = &unk_1E60AA030;
    id v12 = v3;
    id v13 = v6;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v4;
    [WeakRetained engineLibrary:v8 getStatusDictionaryWithCompletionHandler:v11];
  }
  else
  {
    v4[2](v4);
  }
}

void __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_3;
  v5[3] = &unk_1E60A5D10;
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  [v2 _fillStatusArray:v3 forComponents:v4 completionHandler:v5];
}

void __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v30[0] = @"componentName";
    v30[1] = @"status";
    v31[0] = v8;
    uint64_t v10 = [v6 localizedDescription];
    v31[1] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    [v9 addObject:v11];

LABEL_8:
    goto LABEL_9;
  }
  if (v5)
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v28[0] = @"componentName";
    v28[1] = @"status";
    v29[0] = v12;
    v29[1] = v5;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = v29;
    id v16 = v28;
LABEL_7:
    uint64_t v10 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:2];
    [v13 addObject:v10];
    goto LABEL_8;
  }
  if (*(void *)(a1 + 48))
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    v26[0] = @"componentName";
    v26[1] = @"status";
    v27[0] = v17;
    v27[1] = @"no status";
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = v27;
    id v16 = v26;
    goto LABEL_7;
  }
LABEL_9:
  id v18 = *(void **)(*(void *)(a1 + 56) + 16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_5;
  v22[3] = &unk_1E60A6978;
  id v23 = *(id *)(a1 + 64);
  id v19 = v22;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v25 = v19;
  id v20 = v18;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v20, v21);
}

uint64_t __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__CPLEngineLibrary_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (void)_fillStatusArray:(id)a3 forComponents:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  dispatch_block_t v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__15943;
  id v27 = __Block_byref_object_dispose__15944;
  id v28 = 0;
  id v11 = [CPLEngineComponentEnumerator alloc];
  components = self->_components;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke;
  v17[3] = &unk_1E60AA080;
  id v13 = v9;
  id v18 = v13;
  id v19 = self;
  id v14 = v8;
  id v20 = v14;
  uint64_t v22 = &v23;
  id v15 = v10;
  id v21 = v15;
  id v16 = [(CPLEngineComponentEnumerator *)v11 initWithComponents:components handler:v17];
  objc_storeStrong(v24 + 5, v16);
  [v24[5] handleNextComponent];

  _Block_object_dispose(&v23, 8);
}

void __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    if (!v5
      || ([v3 componentName],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 containsObject:v6],
          v6,
          v7))
    {
      id v8 = [*(id *)(a1 + 40) platformObject];

      if (v8 == v4)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v11 = *(id *)(*(void *)(a1 + 40) + 40);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v38 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              uint64_t v17 = [v16 displayableNameForEngineLibrary:*(void *)(a1 + 40)];
              if (v17)
              {
                [v10 addObject:v17];
              }
              else
              {
                id v18 = [v16 description];
                [v10 addObject:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v47 count:16];
          }
          while (v13);
        }

        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = *(__CFString **)(v19 + 200);
        if (!v20) {
          id v20 = @"???";
        }
        v45[0] = @"libraryIdentifier";
        v45[1] = @"attached";
        v46[0] = v20;
        v46[1] = v10;
        v45[2] = @"libraryPath";
        id v21 = [*(id *)(v19 + 176) path];
        uint64_t v22 = [v21 stringByAbbreviatingWithTildeInPath];
        uint64_t v23 = (void *)v22;
        dispatch_block_t v24 = @"<unknown>";
        if (v22) {
          dispatch_block_t v24 = (__CFString *)v22;
        }
        v46[2] = v24;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];

        if (objc_opt_respondsToSelector()) {
          goto LABEL_24;
        }
        if (v9)
        {
          id v27 = *(void **)(a1 + 48);
          v43[0] = @"componentName";
          id v28 = [v4 componentName];
          v43[1] = @"status";
          v44[0] = v28;
          v44[1] = v9;
          uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
          [v27 addObject:v29];
          goto LABEL_29;
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        id v9 = 0;
LABEL_24:
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_2;
        void v31[3] = &unk_1E60A9F90;
        id v32 = v4;
        id v33 = *(id *)(a1 + 48);
        id v9 = v9;
        id v34 = v9;
        id v25 = *(id *)(a1 + 32);
        uint64_t v26 = *(void *)(a1 + 64);
        id v35 = v25;
        uint64_t v36 = v26;
        +[CPLCallObserver observeAsyncCallOn:v32 selector:sel_getStatusDictionaryWithCompletionHandler_ block:v31];

LABEL_32:
        goto LABEL_33;
      }
      if (!*(void *)(a1 + 32))
      {
        id v9 = 0;
        goto LABEL_31;
      }
      dispatch_block_t v30 = *(void **)(a1 + 48);
      v41[0] = @"componentName";
      id v28 = [v4 componentName];
      v41[1] = @"status";
      v42[0] = v28;
      v42[1] = @"no status";
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
      [v30 addObject:v29];
      id v9 = 0;
LABEL_29:

LABEL_31:
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) handleNextComponent];
      goto LABEL_32;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) handleNextComponent];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_33:
}

void __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_3;
  v8[3] = &unk_1E60AA008;
  id v9 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = v3;
  [v4 getStatusDictionaryWithCompletionHandler:v8];
}

void __84__CPLEngineLibrary_CPLManagement___fillStatusArray_forComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) callDidFinish];
  if (v6)
  {
    v27[0] = @"componentName";
    id v7 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) componentName];
    v27[1] = @"status";
    v28[0] = v8;
    id v9 = [v6 localizedDescription];
    v28[1] = v9;
    id v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v28;
    id v12 = v27;
LABEL_3:
    id v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:2];
    [v7 addObject:v13];

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v5)
  {
    if (v14)
    {
      id v8 = (void *)[v5 mutableCopy];
      [v8 addEntriesFromDictionary:*(void *)(a1 + 56)];
      v25[0] = @"componentName";
      id v7 = *(void **)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) componentName];
      v25[1] = @"status";
      v26[0] = v9;
      v26[1] = v8;
      id v10 = (void *)MEMORY[0x1E4F1C9E8];
      id v11 = v26;
      id v12 = v25;
      goto LABEL_3;
    }
    v23[0] = @"componentName";
    id v15 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) componentName];
    v23[1] = @"status";
    v24[0] = v8;
    v24[1] = v5;
    id v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = v24;
    id v18 = v23;
LABEL_12:
    id v9 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
    [v15 addObject:v9];
    goto LABEL_13;
  }
  if (v14)
  {
    v21[0] = @"componentName";
    id v15 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) componentName];
    v21[1] = @"status";
    v22[0] = v8;
    v22[1] = *(void *)(a1 + 56);
    id v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = v22;
    id v18 = v21;
    goto LABEL_12;
  }
  if (*(void *)(a1 + 64))
  {
    v19[0] = @"componentName";
    id v15 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) componentName];
    v19[1] = @"status";
    v20[0] = v8;
    v20[1] = @"no status";
    id v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = v20;
    id v18 = v19;
    goto LABEL_12;
  }
LABEL_14:
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) handleNextComponent];
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_2;
  v17[3] = &unk_1E60A64B0;
  void v17[4] = *(void *)(a1 + 32);
  id v3 = v2;
  id v18 = v3;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  uint64_t v4 = (void (**)(void))MEMORY[0x1BA994060](v17);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  id v6 = [WeakRetained ownerNameForEngineLibrary:*(void *)(a1 + 32)];
  if (v6 && ((id v7 = *(void **)(a1 + 40)) == 0 || [v7 containsObject:v6]))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_4;
    v10[3] = &unk_1E60A9FE0;
    id v8 = WeakRetained;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    id v13 = v3;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    id v16 = v4;
    +[CPLCallObserver observeAsyncCallOn:v8 selector:sel_getStatusWithCompletionHandler_ block:v10];
  }
  else
  {
    v4[2](v4);
  }
}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_3;
  v5[3] = &unk_1E60A5D10;
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  [v2 _fillStatus:v3 forComponents:v4 completionHandler:v5];
}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_5;
  v9[3] = &unk_1E60A9FB8;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 72);
  id v8 = v3;
  [v4 engineLibrary:v5 getStatusWithCompletionHandler:v9];
}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) callDidFinish];
  if (v6)
  {
    uint64_t v7 = NSString;
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [v6 localizedDescription];
    id v11 = [v7 stringWithFormat:@"%@ (owner): error '%@'", v9, v10];
    [v8 addObject:v11];

LABEL_7:
    goto LABEL_8;
  }
  if (v5)
  {
    id v10 = [v5 componentsSeparatedByString:@"\n"];
    id v12 = NSString;
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [v10 componentsJoinedByString:@"\n\t"];
    id v16 = [v12 stringWithFormat:@"%@ (owner):\n\t%@", v14, v15];
    [v13 addObject:v16];

    goto LABEL_7;
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v17 = *(void **)(a1 + 40);
    id v10 = [NSString stringWithFormat:@"%@ (owner): no status", *(void *)(a1 + 48)];
    [v17 addObject:v10];
    goto LABEL_7;
  }
LABEL_8:
  id v18 = *(void **)(*(void *)(a1 + 64) + 16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_6;
  v22[3] = &unk_1E60A6978;
  id v23 = *(id *)(a1 + 72);
  id v19 = v22;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v25 = v19;
  id v20 = v18;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v20, v21);
}

uint64_t __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__CPLEngineLibrary_CPLManagement__getStatusForComponents_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) componentsJoinedByString:@"\n\n"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_fillStatus:(id)a3 forComponents:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  dispatch_block_t v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__15943;
  id v27 = __Block_byref_object_dispose__15944;
  id v28 = 0;
  id v11 = [CPLEngineComponentEnumerator alloc];
  components = self->_components;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke;
  v17[3] = &unk_1E60AA080;
  id v13 = v9;
  id v18 = v13;
  id v19 = self;
  id v14 = v8;
  id v20 = v14;
  uint64_t v22 = &v23;
  id v15 = v10;
  id v21 = v15;
  id v16 = [(CPLEngineComponentEnumerator *)v11 initWithComponents:components handler:v17];
  objc_storeStrong(v24 + 5, v16);
  [v24[5] handleNextComponent];

  _Block_object_dispose(&v23, 8);
}

void __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    if (!v5
      || ([v3 componentName],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 containsObject:v6],
          v6,
          v7))
    {
      id v8 = [*(id *)(a1 + 40) platformObject];

      if (v8 == v4)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F28E78]);
        uint64_t v11 = *(void *)(a1 + 40);
        if (*(void *)(v11 + 200)) {
          id v12 = *(__CFString **)(v11 + 200);
        }
        else {
          id v12 = @"<unknown>";
        }
        id v13 = [*(id *)(v11 + 176) path];
        uint64_t v14 = [v13 stringByAbbreviatingWithTildeInPath];
        id v15 = (void *)v14;
        if (v14) {
          id v16 = (__CFString *)v14;
        }
        else {
          id v16 = @"<unknown>";
        }
        id v9 = (id)[v10 initWithFormat:@"identifier: %@\n\tpath: %@", v12, v16];

        if (overridesFeatureFlag == 1 && !isFeatureEnabled) {
          [v9 appendFormat:@"\n\tShared library feature is disabled"];
        }
        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
        if ([*(id *)(*(void *)(a1 + 40) + 40) count])
        {
          id v53 = v17;
          uint64_t v54 = v9;
          id v55 = v4;
          id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "count"));
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v19 = *(id *)(*(void *)(a1 + 40) + 40);
          uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v66 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v63 != v22) {
                  objc_enumerationMutation(v19);
                }
                dispatch_block_t v24 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                uint64_t v25 = [v24 displayableNameForEngineLibrary:*(void *)(a1 + 40)];
                uint64_t v26 = v25;
                if (v25)
                {
                  id v27 = v25;
                }
                else
                {
                  id v27 = [v24 description];
                }
                id v28 = v27;

                if ([*(id *)(*(void *)(a1 + 40) + 48) containsObject:v24])
                {
                  uint64_t v29 = [v28 stringByAppendingString:@" (invalid)"];

                  id v28 = (void *)v29;
                }
                [v18 addObject:v28];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v66 count:16];
            }
            while (v21);
          }

          uint64_t v30 = [*(id *)(*(void *)(a1 + 40) + 40) count];
          uint64_t v17 = v53;
          uint64_t v31 = +[CPLDateFormatter stringFromDate:v53];
          id v32 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
          id v33 = [v32 name];
          id v34 = [v18 componentsJoinedByString:@"\n\t\t"];
          id v9 = v54;
          [v54 appendFormat:@"\n\t%lu attached object(s) at %@ (%@):\n\t\t%@", v30, v31, v33, v34];

          id v4 = v55;
        }
        else
        {
          id v35 = +[CPLDateFormatter stringFromDate:v17];
          uint64_t v36 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
          long long v37 = [v36 name];
          [v9 appendFormat:@"\n\tNo attached objects at %@ (%@)", v35, v37];
        }
        long long v38 = [*(id *)(*(void *)(a1 + 40) + 64) statusDescription];
        long long v39 = v38;
        if (v38)
        {
          long long v40 = [v38 componentsSeparatedByString:@"\n"];
          id v41 = [v40 componentsJoinedByString:@"\n\t\t"];
          [v9 appendFormat:@"\n\tstatus:\n\t\t%@", v41];
        }
        id v42 = [*(id *)(a1 + 40) configuration];
        id v43 = [v42 lastUpdateDate];

        if (v43)
        {
          id v44 = +[CPLDateFormatter stringFromDateAgo:v43 now:v17];
          [v9 appendFormat:@"\n\tconfiguration update: %@", v44];
        }
        else
        {
          [v9 appendFormat:@"\n\tconfiguration update: %@", @"never"];
        }

        if (objc_opt_respondsToSelector()) {
          goto LABEL_39;
        }
        if (v9)
        {
          id v47 = *(void **)(a1 + 48);
          uint64_t v48 = NSString;
          __int16 v49 = [v4 componentName];
          uint64_t v50 = [v48 stringWithFormat:@"%@:\n\t%@", v49, v9];
          [v47 addObject:v50];
          goto LABEL_44;
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        id v9 = 0;
LABEL_39:
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_2;
        v56[3] = &unk_1E60A9F90;
        id v57 = v4;
        id v58 = *(id *)(a1 + 48);
        id v9 = v9;
        id v59 = v9;
        id v45 = *(id *)(a1 + 32);
        uint64_t v46 = *(void *)(a1 + 64);
        id v60 = v45;
        uint64_t v61 = v46;
        +[CPLCallObserver observeAsyncCallOn:v57 selector:sel_getStatusWithCompletionHandler_ block:v56];

LABEL_47:
        goto LABEL_48;
      }
      if (!*(void *)(a1 + 32))
      {
        id v9 = 0;
        goto LABEL_46;
      }
      uint64_t v51 = *(void **)(a1 + 48);
      id v52 = NSString;
      __int16 v49 = [v4 componentName];
      uint64_t v50 = [v52 stringWithFormat:@"%@: no status", v49];
      [v51 addObject:v50];
      id v9 = 0;
LABEL_44:

LABEL_46:
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) handleNextComponent];
      goto LABEL_47;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) handleNextComponent];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_48:
}

void __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_3;
  v8[3] = &unk_1E60A9F68;
  id v9 = v3;
  id v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = v3;
  [v4 getStatusWithCompletionHandler:v8];
}

void __79__CPLEngineLibrary_CPLManagement___fillStatus_forComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) callDidFinish];
  if (v5)
  {
    uint64_t v6 = NSString;
    id v7 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) componentName];
    id v9 = [v5 localizedDescription];
    id v10 = [v6 stringWithFormat:@"%@: error '%@'", v8, v9];
    [v7 addObject:v10];
  }
  else if (v22)
  {
    id v8 = [v22 componentsSeparatedByString:@"\n"];
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = NSString;
    id v13 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) componentName];
    if (v11)
    {
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = [v8 componentsJoinedByString:@"\n\t"];
      [v12 stringWithFormat:@"%@:\n\t%@\n\t%@", v9, v14, v15];
    }
    else
    {
      id v15 = [v8 componentsJoinedByString:@"\n\t"];
      [v12 stringWithFormat:@"%@:\n\t%@", v9, v15, v21];
    id v18 = };
    [v13 addObject:v18];
  }
  else
  {
    if (*(void *)(a1 + 56))
    {
      id v16 = NSString;
      uint64_t v17 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) componentName];
      [v16 stringWithFormat:@"%@:\n\t%@", v8, *(void *)(a1 + 56)];
    }
    else
    {
      if (!*(void *)(a1 + 64)) {
        goto LABEL_14;
      }
      id v19 = NSString;
      uint64_t v17 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) componentName];
      [v19 stringWithFormat:@"%@: no status", v8, v20];
    id v9 = };
    [v17 addObject:v9];
  }

LABEL_14:
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) handleNextComponent];
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CPLEngineLibrary_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15925;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __76__CPLEngineLibrary_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));

  if (v4)
  {
    id v5 = [WeakRetained ownerNameForEngineLibrary:*(void *)(a1 + 32)];
    if (v5) {
      [v2 addObject:v5];
    }
  }
  id v16 = WeakRetained;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) platformObject];
        if (v11 == (void *)v12)
        {

LABEL_14:
          id v15 = [v11 componentName];
          [v2 addObject:v15];

          goto LABEL_15;
        }
        id v13 = (void *)v12;
        char v14 = objc_opt_respondsToSelector();

        if (v14) {
          goto LABEL_14;
        }
LABEL_15:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end