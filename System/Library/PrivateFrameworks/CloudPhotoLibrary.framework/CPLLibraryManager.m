@interface CPLLibraryManager
+ (NSArray)allLibraryOptionsDescriptions;
+ (NSDictionary)availableExitSources;
+ (NSDictionary)availableRetentionPolicies;
+ (NSDictionary)mappingExitSources;
+ (NSDictionary)mappingForLibraryOptions;
+ (NSDictionary)mappingRetentionPolicies;
+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3;
+ (id)_reverseMappingForLibraryOptions;
+ (id)descriptionForExitSource:(int64_t)a3;
+ (id)descriptionForLibraryOptions:(unint64_t)a3;
+ (id)descriptionForProvideContentResult:(unint64_t)a3;
+ (id)platformImplementationProtocol;
+ (id)stateDescriptionForState:(unint64_t)a3;
+ (unint64_t)optionsFromDescription:(id)a3;
+ (void)useCloudPhotoDaemonImplementation;
- (BOOL)_setStatus:(unint64_t)a3 andError:(id)a4;
- (CPLConfiguration)configuration;
- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6;
- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8;
- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 options:(unint64_t)a7;
- (CPLLibraryManagerDelegate)delegate;
- (CPLLibraryManagerForceSyncDelegate)forceSyncDelegate;
- (CPLLibraryManagerOwner)owner;
- (CPLPlatformObject)platformObject;
- (CPLRecordComputeStateDelegate)recordComputeStateDelegate;
- (CPLResourceProgressDelegate)resourceProgressDelegate;
- (CPLStatus)syncStatus;
- (NSError)statusError;
- (NSString)description;
- (NSString)effectiveClientBundleIdentifier;
- (NSString)libraryIdentifier;
- (NSString)libraryVersion;
- (NSString)mainScopeIdentifier;
- (NSString)userOverride;
- (NSURL)clientLibraryBaseURL;
- (NSURL)cloudLibraryResourceStorageURL;
- (NSURL)cloudLibraryStateStorageURL;
- (id)_mappedUnscopedIdentifiersFromScopedIdentifiers:(id)a3;
- (id)addSubscriberUsingPublishingHandler:(id)a3;
- (id)currentSession;
- (id)initForManagement;
- (id)initForManagementWithLibraryIdentifier:(id)a3;
- (unint64_t)estimatedInitialAssetCountForLocalLibrary;
- (unint64_t)estimatedInitialSizeForLocalLibrary;
- (unint64_t)libraryOptions;
- (unint64_t)numberOfImagesToUpload;
- (unint64_t)numberOfOtherItemsToUpload;
- (unint64_t)numberOfVideosToUpload;
- (unint64_t)sizeOfOriginalResourcesToUpload;
- (unint64_t)sizeOfResourcesToUpload;
- (unint64_t)state;
- (unint64_t)status;
- (void)_closeDeactivating:(BOOL)a3 completionHandler:(id)a4;
- (void)_configurationDidChange;
- (void)_getMappedIdentifiersForIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5;
- (void)_getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5;
- (void)_setCurrentSession:(id)a3;
- (void)_setLibraryVersion:(id)a3;
- (void)_setSizeOfResourcesToUpload:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7;
- (void)_statusDidChange;
- (void)acceptMomentShare:(id)a3 completionHandler:(id)a4;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeChangedStatuses:(id)a3;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)addInfoToLog:(id)a3;
- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4;
- (void)attachComputeStates:(id)a3 completionHandler:(id)a4;
- (void)barrier;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 completionHandler:(id)a6;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 intent:(unint64_t)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginDownloadForResource:(id)a3 highPriority:(BOOL)a4 completionHandler:(id)a5;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5;
- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4;
- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5;
- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4;
- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)closeWithCompletionHandler:(id)a3;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5;
- (void)compactFileCacheWithCompletionHandler:(id)a3;
- (void)createOwnedLibraryShareScopeWithShare:(id)a3 title:(id)a4 completionHandler:(id)a5;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteResourcesIfSafe:(id)a3 completionHandler:(id)a4;
- (void)deleteScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMainScopeWithCompletionHandler:(id)a3;
- (void)disableMingling;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)discardCurrentSession;
- (void)enableMainScopeWithCompletionHandler:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 onDemand:(BOOL)a5 completionHandler:(id)a6;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3;
- (void)fetchMomentShareFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getChangedStatusesWithCompletionHandler:(id)a3;
- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getCloudIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getCloudScopedIdentifiersForLocalScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getListOfComponentsWithCompletionHandler:(id)a3;
- (void)getLocalIdentifiersForCloudIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)getStatusForRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5;
- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 clientBundleID:(id)a6 completionHandler:(id)a7;
- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 completionHandler:(id)a6;
- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (void)getStreamingURLOrMediaMakerDataForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)markLibraryManagerAsInvalid;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForeground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)noteClientReceivedNotificationOfServerChanges;
- (void)openWithCompletionHandler:(id)a3;
- (void)provideCloudResource:(id)a3 completionHandler:(id)a4;
- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)publishMomentShare:(id)a3 completionHandler:(id)a4;
- (void)publishResource:(id)a3 completionHandler:(id)a4;
- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4;
- (void)queryUserIdentitiesWithParticipants:(id)a3 completionHandler:(id)a4;
- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5;
- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7;
- (void)reportMiscInformation:(id)a3;
- (void)reportSetting:(id)a3 hasBeenEnabled:(BOOL)a4;
- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4;
- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3;
- (void)resetCacheWithOption:(unint64_t)a3 completionHandler:(id)a4;
- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)resetStatus;
- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEffectiveClientBundleIdentifier:(id)a3;
- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3;
- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3;
- (void)setForceSyncDelegate:(id)a3;
- (void)setOwner:(id)a3;
- (void)setRecordComputeStateDelegate:(id)a3;
- (void)setResourceProgressDelegate:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)setShouldOverrideSystemBudgetsForSyncSession:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setUserOverride:(id)a3;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startSyncSession;
- (void)takeStatisticsSnapshotSinceDate:(id)a3 completionHandler:(id)a4;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLLibraryManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordComputeStateDelegate);
  objc_storeStrong((id *)&self->_effectiveClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userOverride, 0);
  objc_storeStrong((id *)&self->_statusError, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_destroyWeak((id *)&self->_forceSyncDelegate);
  objc_destroyWeak((id *)&self->_resourceProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_libraryVersion, 0);
  objc_storeStrong((id *)&self->_mainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudLibraryResourceStorageURL, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateStorageURL, 0);
  objc_storeStrong((id *)&self->_clientLibraryBaseURL, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_weakSelf, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_initLock, 0);
  objc_storeStrong((id *)&self->_sessionLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
}

- (void)setRecordComputeStateDelegate:(id)a3
{
}

- (CPLRecordComputeStateDelegate)recordComputeStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordComputeStateDelegate);
  return (CPLRecordComputeStateDelegate *)WeakRetained;
}

- (void)setEffectiveClientBundleIdentifier:(id)a3
{
}

- (NSString)effectiveClientBundleIdentifier
{
  return self->_effectiveClientBundleIdentifier;
}

- (void)setUserOverride:(id)a3
{
}

- (NSString)userOverride
{
  return self->_userOverride;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSError)statusError
{
  return self->_statusError;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setOwner:(id)a3
{
}

- (CPLLibraryManagerOwner)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (CPLLibraryManagerOwner *)WeakRetained;
}

- (void)setForceSyncDelegate:(id)a3
{
}

- (CPLLibraryManagerForceSyncDelegate)forceSyncDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forceSyncDelegate);
  return (CPLLibraryManagerForceSyncDelegate *)WeakRetained;
}

- (void)setResourceProgressDelegate:(id)a3
{
}

- (CPLResourceProgressDelegate)resourceProgressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
  return (CPLResourceProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CPLLibraryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLLibraryManagerDelegate *)WeakRetained;
}

- (unint64_t)numberOfOtherItemsToUpload
{
  return self->_numberOfOtherItemsToUpload;
}

- (unint64_t)numberOfVideosToUpload
{
  return self->_numberOfVideosToUpload;
}

- (unint64_t)numberOfImagesToUpload
{
  return self->_numberOfImagesToUpload;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  return self->_sizeOfOriginalResourcesToUpload;
}

- (unint64_t)sizeOfResourcesToUpload
{
  return self->_sizeOfResourcesToUpload;
}

- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialAssetCountForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialAssetCountForLocalLibrary
{
  return self->_estimatedInitialAssetCountForLocalLibrary;
}

- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialSizeForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialSizeForLocalLibrary
{
  return self->_estimatedInitialSizeForLocalLibrary;
}

- (NSString)libraryVersion
{
  return self->_libraryVersion;
}

- (unint64_t)libraryOptions
{
  return self->_libraryOptions;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
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

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 onDemand:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = objc_opt_class();
  v16 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = ___CPLProgressForAsyncCall_block_invoke_0;
  v36 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v37 = v15;
  SEL v38 = a2;
  [v16 setCancellationHandler:&block];
  queue = self->_queue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke;
  v26[3] = &unk_1E60A8A18;
  id v29 = v13;
  id v30 = v14;
  v26[4] = self;
  id v27 = v16;
  id v28 = v12;
  BOOL v31 = a5;
  BOOL v32 = a6;
  v18 = v26;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __cpl_dispatch_async_block_invoke_11406;
  v36 = &unk_1E60A6978;
  id v37 = v18;
  v19 = queue;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  id v23 = v14;
  dispatch_block_t v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v19, v24);
}

void __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_467;
    v6[3] = &unk_1E60A6908;
    v2 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    __int16 v11 = *(_WORD *)(a1 + 72);
    id v10 = *(id *)(a1 + 64);
    id v9 = *(id *)(a1 + 40);
    [v2 performAsCurrentWithPendingUnitCount:1 usingBlock:v6];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v3 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Trying to fetch compute states while the library is not open", buf, 2u);
      }
    }
    uint64_t v4 = *(void *)(a1 + 64);
    v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to fetch compute states while the library is not open"];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_467(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 73);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2;
  v7[3] = &unk_1E60A68E0;
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  [v2 fetchComputeStatesForRecordsWithScopedIdentifiers:v3 validator:v4 shouldDecrypt:v5 onDemand:v6 completionHandler:v7];
}

uint64_t __122__CPLLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CPLLibraryManager_attachComputeStates_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __59__CPLLibraryManager_attachComputeStates_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 attachComputeStates:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__CPLLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E60A6528;
  v16[4] = self;
  id v17 = v8;
  BOOL v19 = a4;
  id v18 = v9;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __88__CPLLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 addDropDerivativesRecipe:*(void *)(a1 + 40) writeToUserDefaults:*(unsigned __int8 *)(a1 + 56) withCompletionHandler:*(void *)(a1 + 48)];
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__CPLLibraryManager_provideCloudResource_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __60__CPLLibraryManager_provideCloudResource_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 provideCloudResource:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CPLLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __77__CPLLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 provideRecordWithCloudScopeIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__CPLLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __80__CPLLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 provideScopeChangeForScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  libraryIdentifier = self->_libraryIdentifier;
  id v6 = [(id)objc_opt_class() stateDescriptionForState:self->_state];
  id v7 = [v3 stringWithFormat:@"[%@ %p %@ %@]", v4, self, libraryIdentifier, v6];

  return (NSString *)v7;
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  dispatch_block_t v24 = ___CPLProgressForAsyncCall_block_invoke_0;
  v25 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E60A62F8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v7;
  id v21 = v8;
  id v12 = v18;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  dispatch_block_t v24 = __cpl_dispatch_async_block_invoke_11406;
  v25 = &unk_1E60A6978;
  id v26 = v12;
  dispatch_block_t v13 = queue;
  id v14 = v7;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

void __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke(id *a1)
{
  if ([a1[4] state] == 2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_460;
    v6[3] = &unk_1E60A62D0;
    id v2 = a1[5];
    v6[4] = a1[4];
    id v7 = a1[6];
    id v9 = a1[7];
    id v8 = a1[5];
    [v2 performAsCurrentWithPendingUnitCount:1 usingBlock:v6];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Trying to force client to pull all changes while the library is not open", buf, 2u);
      }
    }
    uint64_t v4 = (void (**)(id, void *))a1[7];
    if (v4)
    {
      uint64_t v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to force client to pull all changes while the library is not open"];
      v4[2](v4, v5);
    }
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
  }
}

void __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_460(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A5D10;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 requestClientToPullAllChangesInScopeIdentifier:v3 completionHandler:v4];
}

uint64_t __86__CPLLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = ___CPLProgressForAsyncCall_block_invoke_0;
  id v20 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v7;
  id v16 = v5;
  v14[4] = self;
  id v9 = v14;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __cpl_dispatch_async_block_invoke_11406;
  id v20 = &unk_1E60A6978;
  id v21 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

void __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_456;
    v6[3] = &unk_1E60A5EE8;
    uint64_t v2 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 48);
    [v2 performAsCurrentWithPendingUnitCount:1 usingBlock:v6];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Trying to force client to push all changes while the library is not open", buf, 2u);
      }
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to force client to push all changes while the library is not open"];
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    }
  }
}

void __72__CPLLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_456(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 requestClientToPushAllChangesWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = ___CPLProgressForAsyncCall_block_invoke_0;
  id v20 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v7;
  id v16 = v5;
  v14[4] = self;
  id v9 = v14;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __cpl_dispatch_async_block_invoke_11406;
  id v20 = &unk_1E60A6978;
  id v21 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

void __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke(id *a1)
{
  if ([a1[4] state] == 2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke_452;
    v6[3] = &unk_1E60A6078;
    id v2 = a1[5];
    v6[4] = a1[4];
    id v8 = a1[6];
    id v7 = a1[5];
    [v2 performAsCurrentWithPendingUnitCount:1 usingBlock:v6];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Trying to force a backup while the library is not open", buf, 2u);
      }
    }
    uint64_t v4 = (void (**)(id, void *))a1[6];
    if (v4)
    {
      id v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to force a backup while the library is not open"];
      v4[2](v4, v5);
    }
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
  }
}

uint64_t __54__CPLLibraryManager_forceBackupWithCompletionHandler___block_invoke_452(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 forceBackupWithCompletionHandler:*(void *)(a1 + 48)];

  uint64_t v3 = [*(id *)(a1 + 40) totalUnitCount];
  uint64_t v4 = *(void **)(a1 + 40);
  return [v4 setCompletedUnitCount:v3];
}

- (void)addInfoToLog:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLLibraryManager *)self platformObject];
  [v5 addInfoToLog:v4];
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    if (a3 > 3)
    {
      id v8 = 0;
    }
    else
    {
      id v10 = off_1E60A8A78[a3];
      id v11 = +[CPLResetTracker currentTracker];
      id v8 = [v11 likelyResetReasonWithImmediateReason:v10];
    }
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__CPLLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke;
  v18[3] = &unk_1E60A89F0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  unint64_t v21 = a3;
  dispatch_block_t v13 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v23 = v13;
  id v14 = queue;
  id v15 = v9;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);
}

void __67__CPLLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 resetCacheWithOption:*(void *)(a1 + 56) reason:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)resetCacheWithOption:(unint64_t)a3 completionHandler:(id)a4
{
}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CPLLibraryManager_compactFileCacheWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __59__CPLLibraryManager_compactFileCacheWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 compactFileCacheWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CPLLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __79__CPLLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getResourcesForItemWithScopedIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)deleteResourcesIfSafe:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CPLLibraryManager_deleteResourcesIfSafe_completionHandler___block_invoke;
  v8[3] = &unk_1E60A89C8;
  id v9 = v6;
  id v7 = v6;
  [(CPLLibraryManager *)self deleteResources:a3 checkServerIfNecessary:0 completionHandler:v8];
}

void __61__CPLLibraryManager_deleteResourcesIfSafe_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 allKeys];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS) {
    BOOL v11 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v12 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v13 = NSStringFromSelector(a2);
      id v14 = CPLCurrentQOS();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__CPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke;
  v21[3] = &unk_1E60A6280;
  id v22 = v9;
  id v23 = v10;
  v21[4] = self;
  BOOL v24 = a4;
  id v16 = v21;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v26 = &unk_1E60A6978;
  id v27 = v16;
  dispatch_block_t v17 = queue;
  id v18 = v9;
  id v19 = v10;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v17, v20);
}

void __91__CPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    id v8 = [*(id *)(a1 + 32) platformObject];
    [v8 checkResourcesAreSafeToPrune:*(void *)(a1 + 40) checkServerIfNecessary:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Trying to check purgeaable resources while the library is not open", buf, 2u);
      }
    }
    uint64_t v5 = a1 + 40;
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(v5 + 8);
    id v6 = +[CPLErrors libraryClosedError];
    id v7 = +[CPLErrors unsafeResources:v3 withError:v6 realPrune:0 resourceStorage:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, MEMORY[0x1E4F1CBF0], v7);
  }
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS) {
    BOOL v11 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v12 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v13 = NSStringFromSelector(a2);
      id v14 = CPLCurrentQOS();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__CPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v21[3] = &unk_1E60A6280;
  id v22 = v9;
  id v23 = v10;
  v21[4] = self;
  BOOL v24 = a4;
  id v16 = v21;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v26 = &unk_1E60A6978;
  id v27 = v16;
  dispatch_block_t v17 = queue;
  id v18 = v9;
  id v19 = v10;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v17, v20);
}

void __78__CPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    id v8 = [*(id *)(a1 + 32) platformObject];
    [v8 deleteResources:*(void *)(a1 + 40) checkServerIfNecessary:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Trying to delete resources while the library is not open", buf, 2u);
      }
    }
    uint64_t v5 = a1 + 40;
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(v5 + 8);
    id v6 = +[CPLErrors libraryClosedError];
    id v7 = +[CPLErrors unsafeResources:v3 withError:v6 realPrune:1 resourceStorage:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, MEMORY[0x1E4F1CBF0], v7);
  }
}

- (void)markLibraryManagerAsInvalid
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CPLLibraryManager *)self platformObject];
  if (objc_opt_respondsToSelector())
  {
    [v3 markLibraryManagerAsInvalid];
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = NSStringFromSelector(a2);
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2048;
      id v12 = v3;
      id v6 = v10;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to call %@ while <%@ %p> does not support it", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__CPLLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  __int16 v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __81__CPLLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getTargetsForRecordsWithScopedIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__CPLLibraryManager_testKey_value_completionHandler___block_invoke;
  v18[3] = &unk_1E60A64B0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v12 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  dispatch_block_t v13 = queue;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

void __53__CPLLibraryManager_testKey_value_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 testKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)takeStatisticsSnapshotSinceDate:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CPLLibraryManager_takeStatisticsSnapshotSinceDate_completionHandler___block_invoke;
  v11[3] = &unk_1E60A6978;
  id v12 = v5;
  id v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

uint64_t __71__CPLLibraryManager_takeStatisticsSnapshotSinceDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableMingling
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__CPLLibraryManager_enableMingling__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __35__CPLLibraryManager_enableMingling__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platformObject];
  [v1 enableMingling];
}

- (void)disableMingling
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CPLLibraryManager_disableMingling__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __36__CPLLibraryManager_disableMingling__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platformObject];
  [v1 disableMingling];
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__CPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  v15[4] = self;
  id v16 = v7;
  dispatch_block_t v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __82__CPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    [v4 getScopeStatusCountsForScopeWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
        int v8 = 138412290;
        id v9 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to call %@ while the library is not open", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v4 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to get status counts while library is not open"];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
  }
}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  id v7 = a3;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CPLLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke;
  v13[3] = &unk_1E60A6610;
  id v14 = v7;
  SEL v15 = a2;
  v13[4] = self;
  BOOL v16 = a4;
  id v9 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);
}

void __77__CPLLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v6 = 138412290;
        id v7 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v6, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    [v4 addStatusChangesForRecordsWithScopedIdentifiers:*(void *)(a1 + 40) persist:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    uint64_t v4 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      dispatch_block_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to call %@ while the library is not open", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__CPLLibraryManager_acknowledgeChangedStatuses___block_invoke;
  v11[3] = &unk_1E60A65C0;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  id v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  uint64_t v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __48__CPLLibraryManager_acknowledgeChangedStatuses___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v5 = 138412290;
        int v6 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v5, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    [v4 acknowledgeChangedStatuses:*(void *)(a1 + 40)];
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    uint64_t v4 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to check record statuses while the library is not open", (uint8_t *)&v5, 2u);
    }
  }
}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__CPLLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5F60;
  void v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  uint64_t v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __61__CPLLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v7 = 138412290;
        uint64_t v8 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v7, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    [v4 getChangedStatusesWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to check record statuses while the library is not open", (uint8_t *)&v7, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v4 = +[CPLErrors libraryClosedError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

- (void)getStatusForRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CPLLibraryManager_getStatusForRecordsWithIdentifiers_completionHandler___block_invoke;
  v9[3] = &unk_1E60A89A0;
  id v10 = v6;
  id v8 = v6;
  [(CPLLibraryManager *)self getStatusForRecordsWithScopedIdentifiers:v7 completionHandler:v9];
}

void __74__CPLLibraryManager_getStatusForRecordsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = +[CPLScopedIdentifier unscopedIdentifiersFromDictionaryOfScopedIdentifiers:a2];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__CPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  v15[4] = self;
  id v16 = v7;
  id v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  id v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __80__CPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v7, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    [v4 getStatusForRecordsWithScopedIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to check record statuses while the library is not open", (uint8_t *)&v7, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v4 = +[CPLErrors libraryClosedError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60A5F60;
  void v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  int v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_429;
    v8[3] = &unk_1E60A8978;
    id v9 = *(id *)(a1 + 40);
    [v4 checkHasBackgroundDownloadOperationsWithCompletionHandler:v8];

    id v5 = v9;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to check background download operations while the library is not open", buf, 2u);
      }
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v5 = +[CPLErrors libraryClosedError];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
  }
}

uint64_t __79__CPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_429(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)noteClientIsEndingSignificantWork
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CPLLibraryManager_noteClientIsEndingSignificantWork__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __54__CPLLibraryManager_noteClientIsEndingSignificantWork__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platformObject];
  [v1 noteClientIsEndingSignificantWork];
}

- (void)noteClientIsBeginningSignificantWork
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CPLLibraryManager_noteClientIsBeginningSignificantWork__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __57__CPLLibraryManager_noteClientIsBeginningSignificantWork__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platformObject];
  [v1 noteClientIsBeginningSignificantWork];
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CPLLibraryManager_setShouldOverride_forSystemBudgets___block_invoke;
  v8[3] = &unk_1E60A6570;
  BOOL v9 = a3;
  void v8[4] = self;
  v8[5] = a4;
  dispatch_block_t v5 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v11 = v5;
  uint64_t v6 = queue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

void __56__CPLLibraryManager_setShouldOverride_forSystemBudgets___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 setShouldOverride:*(unsigned __int8 *)(a1 + 48) forSystemBudgets:*(void *)(a1 + 40)];
}

- (void)setShouldOverrideSystemBudgetsForSyncSession:(BOOL)a3
{
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  dispatch_block_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __59__CPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getSystemBudgetsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CPLLibraryManager_enableSynchronizationWithReason___block_invoke;
  v10[3] = &unk_1E60A6728;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  dispatch_block_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __53__CPLLibraryManager_enableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 enableSynchronizationWithReason:*(void *)(a1 + 40)];
}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CPLLibraryManager_disableSynchronizationWithReason___block_invoke;
  v10[3] = &unk_1E60A6728;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  dispatch_block_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __54__CPLLibraryManager_disableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 disableSynchronizationWithReason:*(void *)(a1 + 40)];
}

- (void)noteClientIsInBackground
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CPLLibraryManager_noteClientIsInBackground__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __45__CPLLibraryManager_noteClientIsInBackground__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platformObject];
  [v1 noteClientIsInBackground];
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CPLLibraryManager_noteClientIsInForegroundQuietly___block_invoke;
  v7[3] = &unk_1E60AA7B8;
  void v7[4] = self;
  BOOL v8 = a3;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  dispatch_block_t v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __53__CPLLibraryManager_noteClientIsInForegroundQuietly___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 noteClientIsInForegroundQuietly:*(unsigned __int8 *)(a1 + 40)];
}

- (void)noteClientIsInForeground
{
}

- (void)noteClientReceivedNotificationOfServerChanges
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CPLLibraryManager_noteClientReceivedNotificationOfServerChanges__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __66__CPLLibraryManager_noteClientReceivedNotificationOfServerChanges__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platformObject];
  [v1 noteClientReceivedNotificationOfServerChanges];
}

- (id)addSubscriberUsingPublishingHandler:(id)a3
{
  id v4 = a3;
  if (self->_libraryIdentifier)
  {
    dispatch_block_t v5 = [(CPLLibraryManager *)self libraryIdentifier];
    dispatch_block_t v6 = [@"com.apple.cpl." stringByAppendingString:v5];

    dispatch_block_t v7 = [MEMORY[0x1E4F28F90] _addSubscriberForCategory:v6 usingPublishingHandler:v4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to subscribe to published progress for a library with no identifier", v10, 2u);
      }
    }
    dispatch_block_t v7 = 0;
  }

  return v7;
}

- (void)startSyncSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CPLLibraryManager *)self platformObject];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__CPLLibraryManager_startSyncSession__block_invoke;
    v10[3] = &unk_1E60A5DD8;
    v10[4] = self;
    dispatch_block_t v6 = v10;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    uint64_t v12 = __cpl_dispatch_async_block_invoke_11406;
    id v13 = &unk_1E60A6978;
    id v14 = v6;
    dispatch_block_t v7 = queue;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v7, v8);
  }
  else if (!_CPLSilentLogging)
  {
    dispatch_block_t v9 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = self;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%@ does not support forcing a sync session", (uint8_t *)&block, 0xCu);
    }
  }
}

void __37__CPLLibraryManager_startSyncSession__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ forcing a sync session", (uint8_t *)&v5, 0xCu);
    }
  }
  char v4 = [*(id *)(a1 + 32) platformObject];
  [v4 startSyncSession];
}

- (void)resetStatus
{
  id v2 = [(CPLLibraryManager *)self platformObject];
  [v2 resetStatus];
}

- (void)_setSizeOfResourcesToUpload:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_sizeOfResourcesToUpload == a3
    && self->_sizeOfOriginalResourcesToUpload == a4
    && self->_numberOfImagesToUpload == a5
    && self->_numberOfVideosToUpload == a6
    && self->_numberOfOtherItemsToUpload == a7)
  {
    if (self->_sizeOfResourcesToUploadIsSet) {
      return;
    }
    goto LABEL_15;
  }
  self->_unint64_t sizeOfResourcesToUpload = a3;
  self->_sizeOfOriginalResourcesToUpload = a4;
  self->_numberOfImagesToUpload = a5;
  self->_numberOfVideosToUpload = a6;
  self->_numberOfOtherItemsToUpload = a7;
  if (!self->_sizeOfResourcesToUploadIsSet)
  {
LABEL_15:
    self->_sizeOfResourcesToUploadIsSet = 1;
    return;
  }
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v8 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t sizeOfResourcesToUpload = self->_sizeOfResourcesToUpload;
      int v13 = 134217984;
      unint64_t v14 = sizeOfResourcesToUpload;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Size of resources to upload changed to %llu bytes", (uint8_t *)&v13, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
    [v12 sizeOfResourcesToUploadDidChangeForLibraryManager:self];
  }
}

- (BOOL)_setStatus:(unint64_t)a3 andError:(id)a4
{
  id v7 = a4;
  unint64_t status = self->_status;
  BOOL v9 = status != a3;
  if (status != a3) {
    self->_unint64_t status = a3;
  }
  statusError = self->_statusError;
  p_statusError = (id *)&self->_statusError;
  id v10 = statusError;
  if (statusError)
  {
    if (!v7)
    {
      id *p_statusError = 0;

      goto LABEL_10;
    }
    if ([(NSError *)v10 isEqual:v7]) {
      goto LABEL_11;
    }
LABEL_8:
    objc_storeStrong(p_statusError, a4);
LABEL_10:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  if (v7) {
    goto LABEL_8;
  }
LABEL_11:

  return v9;
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__CPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_1E60A6438;
  id v17 = v8;
  SEL v18 = a2;
  v15[4] = self;
  id v16 = v7;
  id v10 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v20 = v10;
  char v11 = queue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __94__CPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v7, 0xCu);
      }
    }
    char v4 = [*(id *)(a1 + 32) platformObject];
    [v4 resolveLocalScopedIdentifiersForCloudScopedIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to get real cloudIdentifier while the library is not open", (uint8_t *)&v7, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    char v4 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to get real cloudIdentifier while the library is not open"];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

- (void)getLocalIdentifiersForCloudIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)getCloudIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)_getMappedIdentifiersForIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__CPLLibraryManager__getMappedIdentifiersForIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E60A68E0;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(CPLLibraryManager *)self _getMappedScopedIdentifiersForScopedIdentifiers:v9 inAreLocalIdentifiers:v5 completionHandler:v11];
}

void __97__CPLLibraryManager__getMappedIdentifiersForIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = a3;
    id v7 = [v5 _mappedUnscopedIdentifiersFromScopedIdentifiers:a2];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

- (void)getLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)getCloudScopedIdentifiersForLocalScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (id)_mappedUnscopedIdentifiersFromScopedIdentifiers:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v4 = a3;
    BOOL v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__CPLLibraryManager__mappedUnscopedIdentifiersFromScopedIdentifiers___block_invoke;
    v8[3] = &unk_1E60A8950;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __69__CPLLibraryManager__mappedUnscopedIdentifiersFromScopedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 identifier];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 identifier];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)_getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__CPLLibraryManager__getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke;
  v17[3] = &unk_1E60A6890;
  BOOL v21 = a4;
  id v19 = v10;
  SEL v20 = a2;
  v17[4] = self;
  id v18 = v9;
  id v12 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  id v13 = queue;
  id v14 = v9;
  id v15 = v10;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

void __109__CPLLibraryManager__getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v4 = (void *)v3;
        id v5 = "local->cloud";
        if (!*(unsigned char *)(a1 + 64)) {
          id v5 = "cloud->local";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        id v14 = v5;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ (%s) called", buf, 0x16u);
      }
    }
    id v6 = [*(id *)(a1 + 32) platformObject];
    [v6 getMappedScopedIdentifiersForScopedIdentifiers:*(void *)(a1 + 40) inAreLocalIdentifiers:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        if (*(unsigned char *)(a1 + 64)) {
          id v8 = "cloud";
        }
        else {
          id v8 = "local";
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = (uint64_t)v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Trying to get %s identifiers while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 64)) {
      id v10 = "cloud";
    }
    else {
      id v10 = "local";
    }
    id v6 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to get %s identifiers while the library is not open", v10];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v6);
  }
}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS) {
    BOOL v9 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = NSStringFromSelector(a2);
      uint64_t v12 = CPLCurrentQOS();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke;
  v19[3] = &unk_1E60A6438;
  id v21 = v8;
  SEL v22 = a2;
  v19[4] = self;
  id v20 = v7;
  id v14 = v19;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  BOOL v24 = &unk_1E60A6978;
  id v25 = v14;
  uint64_t v15 = queue;
  id v16 = v7;
  id v17 = v8;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v15, v18);
}

void __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    id v4 = [*(id *)(a1 + 32) platformObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_407;
    v7[3] = &unk_1E60A8928;
    uint64_t v5 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v4 forceSynchronizingScopeWithIdentifiers:v5 completionHandler:v7];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to download a resource while the library is not open", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __78__CPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_407(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryUserIdentitiesWithParticipants:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[CPLMomentShareParticipant shareParticipantsFromMomentShareParticipants:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__CPLLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke;
  v9[3] = &unk_1E60A8900;
  id v10 = v6;
  id v8 = v6;
  [(CPLLibraryManager *)self queryUserDetailsForShareParticipants:v7 completionHandler:v9];
}

void __75__CPLLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v8 = +[CPLMomentShareParticipant momentShareParticipantsFromParticipants:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t, void))(v6 + 16);
    id v8 = a3;
    v7(v6, 0);
  }
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  id v27 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v28 = v9;
  SEL v29 = a2;
  [v10 setCancellationHandler:buf];
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    uint64_t v11 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      __int16 v13 = CPLCurrentQOS();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke;
  v21[3] = &unk_1E60A6A60;
  v21[4] = self;
  id v22 = v10;
  id v24 = v8;
  SEL v25 = a2;
  id v23 = v7;
  uint64_t v15 = v21;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v27 = &unk_1E60A6978;
  id v28 = v15;
  id v16 = queue;
  id v17 = v7;
  id v18 = v10;
  id v19 = v8;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v16, v20);
}

void __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412290;
        __int16 v13 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_404;
    v8[3] = &unk_1E60A62D0;
    id v4 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to query user identities while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to query user identities while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_404(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A6460;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 queryUserDetailsForShareParticipants:v3 completionHandler:v4];
}

uint64_t __76__CPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)acceptMomentShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 translateToScopeChangeWithScopeType:3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CPLLibraryManager_acceptMomentShare_completionHandler___block_invoke;
  v9[3] = &unk_1E60A69E8;
  id v10 = v6;
  id v8 = v6;
  [(CPLLibraryManager *)self acceptSharedScope:v7 completionHandler:v9];
}

uint64_t __57__CPLLibraryManager_acceptMomentShare_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMomentShareFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CPLLibraryManager_fetchMomentShareFromShareURL_completionHandler___block_invoke;
  v8[3] = &unk_1E60A88D8;
  id v9 = v6;
  id v7 = v6;
  [(CPLLibraryManager *)self fetchSharedScopeFromShareURL:a3 completionHandler:v8];
}

void __68__CPLLibraryManager_fetchMomentShareFromShareURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  if (([v8 scopeType] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v6 = [[CPLMomentShare alloc] initWithScopeChange:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
      goto LABEL_9;
    }
    id v6 = +[CPLErrors notImplementedError];
    (*(void (**)(uint64_t, void, CPLMomentShare *))(v7 + 16))(v7, 0, v6);
  }

LABEL_9:
}

- (void)publishMomentShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 translateToScopeChangeWithScopeType:2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CPLLibraryManager_publishMomentShare_completionHandler___block_invoke;
  v9[3] = &unk_1E60A88D8;
  id v10 = v6;
  id v8 = v6;
  [(CPLLibraryManager *)self createScope:v7 completionHandler:v9];
}

void __58__CPLLibraryManager_publishMomentShare_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = a3;
    id v6 = [[CPLMomentShare alloc] initWithScopeChange:v9];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void (**)(uint64_t, void, CPLMomentShare *))(v7 + 16);
    id v6 = a3;
    v8(v7, 0, v6);
  }
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Looking for shared library scope", buf, 2u);
    }
  }
  uint64_t v7 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  id v23 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v24 = v7;
  SEL v25 = a2;
  [v8 setCancellationHandler:buf];
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    id v9 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      id v11 = CPLCurrentQOS();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E60A6438;
  v18[4] = self;
  id v19 = v8;
  id v20 = v5;
  SEL v21 = a2;
  __int16 v13 = v18;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v23 = &unk_1E60A6978;
  id v24 = v13;
  uint64_t v14 = queue;
  id v15 = v8;
  id v16 = v5;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v14, v17);
}

void __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_399;
    v8[3] = &unk_1E60A6078;
    id v4 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to look for shared library scope while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to look for shared library scope while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_399(id *a1)
{
  uint64_t v2 = [a1[4] platformObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60A62A8;
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 fetchExistingSharedLibraryScopeWithCompletionHandler:v3];
}

uint64_t __74__CPLLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 share];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Accepting %@ from %@", buf, 0x16u);
    }
  }
  id v11 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  SEL v29 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v30 = v11;
  SEL v31 = a2;
  [v12 setCancellationHandler:buf];
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    uint64_t v13 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      id v15 = CPLCurrentQOS();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke;
  v23[3] = &unk_1E60A6A60;
  v23[4] = self;
  id v24 = v12;
  id v26 = v8;
  SEL v27 = a2;
  id v25 = v7;
  dispatch_block_t v17 = v23;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  SEL v29 = &unk_1E60A6978;
  id v30 = v17;
  id v18 = queue;
  id v19 = v7;
  id v20 = v12;
  id v21 = v8;
  dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v22);
}

void __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_395;
    v8[3] = &unk_1E60A62D0;
    id v4 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to accept a share while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to accept a share while the library is not open"];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_395(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A5D10;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 acceptSharedScope:v3 completionHandler:v4];
}

uint64_t __57__CPLLibraryManager_acceptSharedScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(v7, "cpl_redactedShareURL");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Fetching share info at %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v11 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v26 = ___CPLProgressForAsyncCall_block_invoke_0;
  SEL v27 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v28 = v11;
  SEL v29 = a2;
  [v12 setCancellationHandler:&buf];
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke;
  v20[3] = &unk_1E60A6A60;
  v20[4] = self;
  id v21 = v12;
  id v23 = v8;
  SEL v24 = a2;
  id v22 = v7;
  uint64_t v14 = v20;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v26 = __cpl_dispatch_async_block_invoke_11406;
  SEL v27 = &unk_1E60A6978;
  id v28 = v14;
  id v15 = queue;
  id v16 = v7;
  id v17 = v12;
  id v18 = v8;
  dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v15, v19);
}

void __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v13 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_391;
    v8[3] = &unk_1E60A62D0;
    id v4 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to fetch a share while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to fetch a share while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_391(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A87E8;
  id v5 = v3;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 fetchSharedScopeFromShareURL:v5 completionHandler:v4];
}

void __68__CPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    id v7 = __CPLManagerOSLogDomain_0();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v8 = objc_msgSend(*(id *)(a1 + 32), "cpl_redactedShareURL");
    *(_DWORD *)uint64_t v13 = 138412546;
    *(void *)&v13[4] = v8;
    *(_WORD *)&v13[12] = 2112;
    *(void *)&v13[14] = v5;
    id v9 = "Fetched share info at %@: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    goto LABEL_10;
  }
  id v7 = __CPLManagerOSLogDomain_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "cpl_redactedShareURL");
    *(_DWORD *)uint64_t v13 = 138412546;
    *(void *)&v13[4] = v8;
    *(_WORD *)&v13[12] = 2112;
    *(void *)&v13[14] = v6;
    id v9 = "Failed to fetch share info at %@: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v10, v11, v9, v13, 0x16u);
  }
LABEL_9:

LABEL_10:
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v13, *(void *)&v13[16], v14));
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__CPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  v17[3] = &unk_1E60A6370;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  SEL v20 = a2;
  unint64_t v21 = a4;
  uint64_t v12 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v23 = v12;
  uint64_t v13 = queue;
  id v14 = v10;
  id v15 = v9;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

void __106__CPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", (uint8_t *)&v8, 0xCu);
      }
    }
    id v4 = [*(id *)(a1 + 32) platformObject];
    [v4 getStatusForPendingRecordsSharedToScopeWithIdentifier:*(void *)(a1 + 40) maximumCount:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = *(void **)(a1 + 40);
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to fetch record status for pending shared records in %{public}@ while the library is not open", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v4 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to remove participant from shared library while the library is not open"];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
LABEL_13:
  }
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS) {
    BOOL v6 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = NSStringFromSelector(a2);
      id v9 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  uint64_t v10 = objc_opt_class();
  os_log_type_t v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  id v23 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v24 = v10;
  SEL v25 = a2;
  [v11 setCancellationHandler:buf];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E60A6438;
  v18[4] = self;
  id v19 = v11;
  id v20 = v5;
  SEL v21 = a2;
  uint64_t v13 = v18;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v23 = &unk_1E60A6978;
  id v24 = v13;
  id v14 = queue;
  id v15 = v11;
  id v16 = v5;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v14, v17);
}

void __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v12 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_386;
    v8[3] = &unk_1E60A6078;
    id v4 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to check shared library ramp while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to check shared library ramp while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_386(id *a1)
{
  uint64_t v2 = [a1[4] platformObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60A6410;
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 sharedLibraryRampCheckWithCompletionHandler:v3];
}

uint64_t __65__CPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
  id v4 = *(void **)(a1 + 32);
  return [v4 setCompletedUnitCount:v3];
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    id v16 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v17 = NSStringFromSelector(a2);
      id v18 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  id v19 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v28[3] = &unk_1E60A88B0;
  v28[4] = self;
  id v29 = v14;
  id v32 = v15;
  SEL v33 = a2;
  id v30 = v19;
  id v31 = v13;
  int64_t v34 = a5;
  int64_t v35 = a6;
  SEL v21 = v28;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v37 = &unk_1E60A6978;
  id v38 = v21;
  id v22 = queue;
  id v23 = v13;
  id v24 = v19;
  id v25 = v15;
  id v26 = v14;
  dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v22, v27);
}

void __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
        *(_DWORD *)long long buf = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_382;
    v9[3] = &unk_1E60A63C0;
    void v9[4] = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 80);
    id v12 = *(id *)(a1 + 64);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        id v15 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to remove participant from shared library %{public}@ while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7)
    {
      int v8 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to remove participant from shared library while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

void __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_382(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v7[3] = &unk_1E60A8888;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  [v2 removeParticipants:v4 fromSharedScopeWithIdentifier:v8 retentionPolicy:v5 exitSource:v6 completionHandler:v7];
}

void __115__CPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = a1[4];
        int v15 = 138543618;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        id v18 = v7;
        id v10 = "Failed to remove participant from shared library %{public}@: %@";
        id v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_1B4CAC000, v11, v12, v10, (uint8_t *)&v15, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v8 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)a1[4];
      uint64_t v13 = a1[5];
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      id v18 = v14;
      id v10 = "Successfully removed participants %{public}@ from shared library %{public}@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:
  }
  (*(void (**)(void, id, id, uint64_t))(a1[6] + 16))(a1[6], v5, v7, v6);
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS) {
    BOOL v13 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    id v14 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = NSStringFromSelector(a2);
      uint64_t v16 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  __int16 v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v25[3] = &unk_1E60A8860;
  v25[4] = self;
  id v26 = v11;
  id v27 = v17;
  id v28 = v12;
  SEL v29 = a2;
  int64_t v30 = a4;
  int64_t v31 = a5;
  uint64_t v19 = v25;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  SEL v33 = &unk_1E60A6978;
  id v34 = v19;
  id v20 = queue;
  id v21 = v17;
  id v22 = v12;
  id v23 = v11;
  dispatch_block_t v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v20, v24);
}

void __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        int v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_377;
    v10[3] = &unk_1E60A6370;
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    long long v13 = *(_OWORD *)(a1 + 72);
    id v12 = *(id *)(a1 + 56);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        int v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to start exit from shared library %{public}@ while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      uint64_t v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to exit from shared library while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
}

void __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_377(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60A8838;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  [v2 startExitFromSharedScopeWithIdentifier:v7 retentionPolicy:v4 exitSource:v5 completionHandler:v6];
}

void __105__CPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        id v18 = v7;
        id v10 = "Failed to exit from shared library %{public}@: %@";
        id v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        uint32_t v13 = 22;
LABEL_8:
        _os_log_impl(&dword_1B4CAC000, v11, v12, v10, (uint8_t *)&v15, v13);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v8 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v14;
      id v10 = "Successfully started exit from %{public}@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 12;
      goto LABEL_8;
    }
LABEL_9:
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v7, v6);
}

- (void)createOwnedLibraryShareScopeWithShare:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[CPLScopeChange newScopeChangeWithAutomaticScopeIdentifierForScopeType:4];
  [v11 setShare:v10];

  [v11 setTitle:v9];
  [(CPLLibraryManager *)self createScope:v11 completionHandler:v8];
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Asking to refresh scope %{public}@", buf, 0xCu);
    }
  }
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    id v10 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      os_log_type_t v12 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  uint32_t v13 = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  id v28 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v29 = v13;
  SEL v30 = a2;
  [v14 setCancellationHandler:buf];
  queue = self->_queue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke;
  v22[3] = &unk_1E60A6638;
  v22[4] = self;
  id v23 = v7;
  id v24 = v14;
  id v25 = v8;
  SEL v26 = a2;
  uint64_t v16 = v22;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v28 = &unk_1E60A6978;
  id v29 = v16;
  __int16 v17 = queue;
  id v18 = v14;
  id v19 = v8;
  id v20 = v7;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v17, v21);
}

void __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        int v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_327;
    v10[3] = &unk_1E60A62D0;
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        int v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to refresh %{public}@ while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to refresh a scope while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
}

void __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_327(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A87E8;
  id v5 = v3;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 refreshScopeWithIdentifier:v5 completionHandler:v4];
}

void __66__CPLLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    id v7 = __CPLManagerOSLogDomain_0();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)&v14[4] = v5;
    uint64_t v8 = "Successfully updated %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    goto LABEL_10;
  }
  id v7 = __CPLManagerOSLogDomain_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v14 = 138412546;
    *(void *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v6;
    uint64_t v8 = "Failed to update %@: %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v9, v10, v8, v14, v11);
  }
LABEL_9:

LABEL_10:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v14, *(void *)&v14[16], v15));
}

- (void)deleteScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    uint32_t v11 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = &stru_1F0D5F858;
      if (v6) {
        uint64_t v12 = @" (forced)";
      }
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Asking to delete scope %{public}@%@", buf, 0x16u);
    }
  }
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    uint64_t v13 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      uint64_t v15 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke;
  v24[3] = &unk_1E60A8810;
  v24[4] = self;
  id v25 = v9;
  id v27 = v10;
  SEL v28 = a2;
  id v26 = v16;
  BOOL v29 = v6;
  id v18 = v24;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  uint64_t v31 = &unk_1E60A6978;
  id v32 = v18;
  id v19 = queue;
  id v20 = v16;
  id v21 = v10;
  id v22 = v9;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v19, v23);
}

void __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_323;
    v10[3] = &unk_1E60A6528;
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    char v13 = *(unsigned char *)(a1 + 72);
    id v12 = *(id *)(a1 + 56);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      BOOL v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to delete %{public}@ while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to delete a scope while the library is not open"];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_323(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6AB0;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  [v2 deleteScopeWithIdentifier:v6 forced:v4 completionHandler:v5];
}

void __72__CPLLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v13 = 138543618;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        id v16 = v5;
        uint64_t v8 = "Failed to delete %{public}@: %@";
        id v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 22;
LABEL_8:
        _os_log_impl(&dword_1B4CAC000, v9, v10, v8, (uint8_t *)&v13, v11);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v6 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v12;
      uint64_t v8 = "Successfully deleted %{public}@";
      id v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 12;
      goto LABEL_8;
    }
LABEL_9:
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v3, v4);
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v10 = [v7 share];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Updating share for %@ to %@", buf, 0x16u);
    }
  }
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    uint32_t v11 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      int v13 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  uint64_t v14 = objc_opt_class();
  __int16 v15 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  BOOL v29 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v30 = v14;
  SEL v31 = a2;
  [v15 setCancellationHandler:buf];
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke;
  v23[3] = &unk_1E60A6638;
  v23[4] = self;
  id v24 = v7;
  id v25 = v15;
  id v26 = v8;
  SEL v27 = a2;
  uint64_t v17 = v23;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  BOOL v29 = &unk_1E60A6978;
  id v30 = v17;
  id v18 = queue;
  id v19 = v15;
  id v20 = v8;
  id v21 = v7;
  dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v22);
}

void __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        __int16 v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_312;
    v10[3] = &unk_1E60A62D0;
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        __int16 v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to update %{public}@ while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to create a scope while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
}

void __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_312(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A87E8;
  id v5 = v3;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 updateShareForScope:v5 completionHandler:v4];
}

void __59__CPLLibraryManager_updateShareForScope_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    id v7 = __CPLManagerOSLogDomain_0();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)&v14[4] = v5;
    uint64_t v8 = "Successfully updated %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    goto LABEL_10;
  }
  id v7 = __CPLManagerOSLogDomain_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v14 = 138412546;
    *(void *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v6;
    uint64_t v8 = "Failed to update %@: %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v9, v10, v8, v14, v11);
  }
LABEL_9:

LABEL_10:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v14, *(void *)&v14[16], v15));
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Creating %@ in the cloud", buf, 0xCu);
    }
  }
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    os_log_type_t v10 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v11 = NSStringFromSelector(a2);
      uint64_t v12 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  SEL v28 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v29 = v13;
  SEL v30 = a2;
  [v14 setCancellationHandler:buf];
  queue = self->_queue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__CPLLibraryManager_createScope_completionHandler___block_invoke;
  v22[3] = &unk_1E60A6638;
  v22[4] = self;
  id v23 = v7;
  id v24 = v14;
  id v25 = v8;
  SEL v26 = a2;
  uint64_t v16 = v22;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  SEL v28 = &unk_1E60A6978;
  id v29 = v16;
  uint64_t v17 = queue;
  id v18 = v14;
  id v19 = v8;
  id v20 = v7;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v17, v21);
}

void __51__CPLLibraryManager_createScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__CPLLibraryManager_createScope_completionHandler___block_invoke_310;
    v10[3] = &unk_1E60A62D0;
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v4;
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    [v5 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to create %@ while the library is not open", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to create a scope while the library is not open"];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
}

void __51__CPLLibraryManager_createScope_completionHandler___block_invoke_310(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CPLLibraryManager_createScope_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60A87E8;
  id v5 = v3;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 createScope:v5 completionHandler:v4];
}

void __51__CPLLibraryManager_createScope_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    id v7 = __CPLManagerOSLogDomain_0();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)&v14[4] = v5;
    uint64_t v8 = "Successfully created %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    goto LABEL_10;
  }
  id v7 = __CPLManagerOSLogDomain_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v14 = 138412546;
    *(void *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v6;
    uint64_t v8 = "Failed to create %@: %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v9, v10, v8, v14, v11);
  }
LABEL_9:

LABEL_10:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount", *(_OWORD *)v14, *(void *)&v14[16], v15));
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke;
  v19[3] = &unk_1E60A6A60;
  id v22 = v11;
  SEL v23 = a2;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  uint64_t v13 = v19;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v25 = v13;
  uint64_t v14 = queue;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);
}

void __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v12 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_306;
    v9[3] = &unk_1E60A8748;
    id v10 = *(id *)(a1 + 56);
    [v4 beginInMemoryDownloadOfResource:v5 clientBundleID:v6 completionHandler:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Trying to download a resource in-memory while the library is not open", buf, 2u);
      }
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

uint64_t __86__CPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_306(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS) {
    BOOL v10 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      uint64_t v13 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  uint64_t v14 = objc_opt_class();
  id v15 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  id v29 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v30 = v14;
  SEL v31 = a2;
  [v15 setCancellationHandler:buf];
  queue = self->_queue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke;
  v22[3] = &unk_1E60A87C0;
  v22[4] = self;
  id v23 = v15;
  id v24 = v9;
  SEL v25 = a2;
  unint64_t v26 = a3;
  unint64_t v27 = a4;
  id v17 = v22;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v29 = &unk_1E60A6978;
  id v30 = v17;
  dispatch_block_t v18 = queue;
  id v19 = v15;
  id v20 = v9;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v18, v21);
}

void __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412290;
        uint64_t v13 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_304;
    v8[3] = &unk_1E60A61E0;
    uint64_t v4 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    long long v11 = *(_OWORD *)(a1 + 64);
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v8];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to issue ramping request while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to issue ramping request while the library is not open"];
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_304(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A61B8;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v2 rampingRequestForResourceType:v3 numRequested:v4 completionHandler:v5];
}

uint64_t __82__CPLLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    uint64_t v3 = [*(id *)(a1 + 32) totalUnitCount];
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 setCompletedUnitCount:v3];
  }
  return result;
}

- (void)publishResource:(id)a3 completionHandler:(id)a4
{
}

- (void)getStreamingURLOrMediaMakerDataForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    id v17 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v18 = NSStringFromSelector(a2);
      id v19 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Running %@ at %@ QOS", buf, 0x16u);
    }
  }
  id v20 = objc_opt_class();
  dispatch_block_t v21 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = ___CPLProgressForAsyncCall_block_invoke_0;
  v46 = &__block_descriptor_48_e5_v8__0lu32l8;
  id v47 = v20;
  SEL v48 = a2;
  [v21 setCancellationHandler:buf];
  queue = self->_queue;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v34[3] = &unk_1E60A8798;
  v34[4] = self;
  id v35 = v21;
  SEL v40 = a2;
  unint64_t v41 = a4;
  id v36 = v33;
  id v37 = v14;
  long long v23 = *(_OWORD *)&a6->var0.var3;
  long long v42 = *(_OWORD *)&a6->var0.var0;
  long long v43 = v23;
  long long v44 = *(_OWORD *)&a6->var1.var1;
  id v38 = v15;
  id v39 = v16;
  id v24 = v34;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  v46 = &unk_1E60A6978;
  id v47 = v24;
  SEL v25 = queue;
  id v26 = v15;
  id v27 = v14;
  id v28 = v33;
  id v29 = v21;
  id v30 = v16;
  dispatch_block_t v31 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v25, v31);
}

void __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)long long buf = 138412290;
        id v22 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_300;
    v11[3] = &unk_1E60A6168;
    uint64_t v4 = *(void **)(a1 + 40);
    void v11[4] = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 88);
    id v12 = v5;
    uint64_t v17 = v6;
    id v13 = *(id *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 112);
    long long v18 = *(_OWORD *)(a1 + 96);
    long long v19 = v7;
    long long v20 = *(_OWORD *)(a1 + 128);
    id v14 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 40);
    [v4 performAsCurrentWithPendingUnitCount:1 usingBlock:v11];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to publish a resource while the library is not open", buf, 2u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 72);
    id v10 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to publish a resource while the library is not open"];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v9 + 16))(v9, 0, 0, 0, 0, v10);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
}

void __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_300(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformObject];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2;
  v9[3] = &unk_1E60A6140;
  uint64_t v6 = *(void *)(a1 + 80);
  id v11 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 104);
  v8[0] = *(_OWORD *)(a1 + 88);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 120);
  [v2 getStreamingURLForResource:v3 intent:v6 hints:v4 timeRange:v8 clientBundleID:v5 completionHandler:v9];
}

uint64_t __120__CPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__CPLLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v18[3] = &unk_1E60A8770;
  id v19 = v14;
  long long v15 = *(_OWORD *)&a6->var0.var3;
  v17[0] = *(_OWORD *)&a6->var0.var0;
  v17[1] = v15;
  v17[2] = *(_OWORD *)&a6->var1.var1;
  id v16 = v14;
  [(CPLLibraryManager *)self getStreamingURLOrMediaMakerDataForResource:a3 intent:a4 hints:a5 timeRange:v17 clientBundleID:a7 completionHandler:v18];
}

uint64_t __104__CPLLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 clientBundleID:(id)a6 completionHandler:(id)a7
{
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v8[0] = *MEMORY[0x1E4F1FA20];
  v8[1] = v7;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  [(CPLLibraryManager *)self getStreamingURLForResource:a3 intent:a4 hints:a5 timeRange:v8 clientBundleID:a6 completionHandler:a7];
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 completionHandler:(id)a6
{
}

- (void)beginDownloadForResource:(id)a3 highPriority:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (__CPLShouldLogQOS_onceToken != -1) {
    dispatch_once(&__CPLShouldLogQOS_onceToken, &__block_literal_global_44);
  }
  if (__CPLShouldLogQOS_debugQOS && !_CPLSilentLogging)
  {
    long long v18 = __CPLQOSOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = NSStringFromSelector(a2);
      long long v20 = CPLCurrentQOS();
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      id v38 = v20;
      _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Running %@(%@) at %@ QOS", buf, 0x20u);
    }
  }
  queue = self->_queue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke;
  v30[3] = &unk_1E60AA928;
  id v35 = v17;
  SEL v36 = a2;
  v30[4] = self;
  id v31 = v13;
  id v32 = v14;
  id v33 = v15;
  id v34 = v16;
  id v22 = v30;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_11406;
  id v38 = &unk_1E60A6978;
  id v39 = v22;
  uint64_t v23 = queue;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v27 = v13;
  id v28 = v17;
  dispatch_block_t v29 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v23, v29);
}

void __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)long long buf = 138412290;
        id v13 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) platformObject];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_294;
    v10[3] = &unk_1E60A8748;
    id v11 = *(id *)(a1 + 72);
    [v4 beginDownloadForResource:v5 clientBundleID:v6 options:v7 proposedTaskIdentifier:v8 completionHandler:v10];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Trying to download a resource while the library is not open", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __110__CPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 intent:(unint64_t)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[CPLResourceTransferTaskOptions optionsForLegacyIntent:a5];
  [(CPLLibraryManager *)self beginDownloadForResource:v15 clientBundleID:v14 options:v16 proposedTaskIdentifier:v13 completionHandler:v12];
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[CPLResourceTransferTaskOptions alloc] initWithHighPriority:v8];
  [(CPLLibraryManager *)self beginDownloadForResource:v15 clientBundleID:v14 options:v16 proposedTaskIdentifier:v13 completionHandler:v12];
}

- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke;
  v19[3] = &unk_1E60A6A60;
  id v22 = v11;
  SEL v23 = a2;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v13 = v19;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v25 = v13;
  id v14 = queue;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);
}

void __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)long long buf = 138412290;
      dispatch_block_t v18 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  uint64_t v4 = [*(id *)(a1 + 32) currentSession];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!v4)
    {
      id v10 = [(CPLChangeSession *)[CPLPullChangeSession alloc] initWithLibraryManager:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) _setCurrentSession:v10];
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_292;
      v14[3] = &unk_1E60A8720;
      v14[4] = *(void *)(a1 + 32);
      id v13 = *(id *)(a1 + 56);
      id v15 = v10;
      id v16 = v13;
      id v9 = v10;
      [(CPLChangeSession *)v9 beginSessionWithKnownLibraryVersion:v11 resetTracker:v12 completionHandler:v14];

      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        dispatch_block_t v18 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to begin a pull session while %@ is already in place", buf, 0xCu);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = @"Trying to begin a pull session while an other one is already in place";
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      BOOL v8 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to begin a pull session while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = @"Trying to begin a pull session while the library is not open";
  }
  id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:v7];
  (*(void (**)(uint64_t, void, CPLPullChangeSession *))(v6 + 16))(v6, 0, v9);
LABEL_18:
}

void __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_292(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2;
  v10[3] = &unk_1E60A62D0;
  id v11 = v3;
  uint64_t v12 = v4;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v16 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __98__CPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3)
  {
    [v2 discardCurrentSession];
    uint64_t v4 = *(void (**)(void))(a1[7] + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [v2 currentSession];
    if (v5)
    {
      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v6 = __CPLManagerOSLogDomain_0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v7 = a1[6];
          int v10 = 138412290;
          uint64_t v11 = v7;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ was discarded before it was returned", (uint8_t *)&v10, 0xCu);
        }
      }
      uint64_t v8 = a1[7];
      dispatch_block_t v9 = +[CPLErrors libraryClosedError];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
}

- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke;
  v19[3] = &unk_1E60A6A60;
  id v22 = v11;
  SEL v23 = a2;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v13 = v19;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v25 = v13;
  id v14 = queue;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);
}

void __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)long long buf = 138412290;
      dispatch_block_t v18 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  uint64_t v4 = [*(id *)(a1 + 32) currentSession];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (!v4)
    {
      id v10 = [[CPLPushChangeSession alloc] initWithLibraryManager:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) _setCurrentSession:v10];
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_284;
      v14[3] = &unk_1E60A8720;
      v14[4] = *(void *)(a1 + 32);
      id v13 = *(id *)(a1 + 56);
      id v15 = v10;
      id v16 = v13;
      id v9 = v10;
      [(CPLChangeSession *)v9 beginSessionWithKnownLibraryVersion:v11 resetTracker:v12 completionHandler:v14];

      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        dispatch_block_t v18 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to begin a push session while %@ is already in place", buf, 0xCu);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = @"Trying to begin a push session while an other one is already in place";
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to begin a push session while the library is not open", buf, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = @"Trying to begin a push session while the library is not open";
  }
  id v9 = +[CPLErrors incorrectMachineStateErrorWithReason:v7];
  (*(void (**)(uint64_t, void, CPLPushChangeSession *))(v6 + 16))(v6, 0, v9);
LABEL_18:
}

void __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_284(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2;
  v10[3] = &unk_1E60A62D0;
  id v11 = v3;
  uint64_t v12 = v4;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v16 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __98__CPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3)
  {
    [v2 discardCurrentSession];
    uint64_t v4 = *(void (**)(void))(a1[7] + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [v2 currentSession];
    if (v5)
    {
      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v6 = __CPLManagerOSLogDomain_0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v7 = a1[6];
          int v10 = 138412290;
          uint64_t v11 = v7;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ was discarded before it was returned", (uint8_t *)&v10, 0xCu);
        }
      }
      uint64_t v8 = a1[7];
      dispatch_block_t v9 = +[CPLErrors libraryClosedError];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
}

- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
}

- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
}

- (void)_setLibraryVersion:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  libraryVersion = self->_libraryVersion;
  self->_libraryVersion = v4;
  MEMORY[0x1F41817F8](v4, libraryVersion);
}

- (void)_setCurrentSession:(id)a3
{
  id v5 = a3;
  if (v5) {
    +[CPLTransaction beginTransactionWithIdentifier:@"cpl.client.session" description:@"push/pull session is active" keepPower:1];
  }
  sessionLock = self->_sessionLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CPLLibraryManager__setCurrentSession___block_invoke;
  block[3] = &unk_1E60A65C0;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(sessionLock, block);
}

uint64_t __40__CPLLibraryManager__setCurrentSession___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v1 = (void *)a1[5];
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3)
  {
    if (v1)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v6 = __CPLManagerOSLogDomain_0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Setting a new session without finalizing the last", v12, 2u);
        }
      }
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[4];
      SEL v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m"];
      [v7 handleFailureInMethod:v8 object:v9 file:v10 lineNumber:581 description:@"Setting a new session without finalizing the last"];

      abort();
    }
    goto LABEL_3;
  }
  if (!v1)
  {
    uint64_t v3 = 0;
LABEL_3:
    id v4 = 0;
    goto LABEL_6;
  }
  id v4 = v1;
  uint64_t v3 = *(void *)(v2 + 8);
LABEL_6:
  *(void *)(v2 + 8) = v4;
  return MEMORY[0x1F41817F8](v4, v3);
}

- (void)discardCurrentSession
{
  sessionLock = self->_sessionLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CPLLibraryManager_discardCurrentSession__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_async(sessionLock, block);
}

void *__42__CPLLibraryManager_discardCurrentSession__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
        int v7 = 138412290;
        uint64_t v8 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Discarding current session %@", (uint8_t *)&v7, 0xCu);
      }

      uint64_t result = *(void **)(*(void *)(a1 + 32) + 8);
    }
    [result tearDownWithCompletionHandler:&__block_literal_global_270];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0;

    return (void *)+[CPLTransaction endTransactionWithIdentifier:@"cpl.client.session"];
  }
  return result;
}

- (id)currentSession
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11606;
  SEL v10 = __Block_byref_object_dispose__11607;
  id v11 = 0;
  sessionLock = self->_sessionLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CPLLibraryManager_currentSession__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__CPLLibraryManager_currentSession__block_invoke(uint64_t a1)
{
}

- (CPLStatus)syncStatus
{
  if (!self->_clientLibraryBaseURL)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Can't access configuration with client library base URL", buf, 2u);
      }
    }
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m"];
    [v7 handleFailureInMethod:a2 object:self file:v8 lineNumber:540 description:@"Can't access configuration with client library base URL"];

    abort();
  }
  initLock = self->_initLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CPLLibraryManager_syncStatus__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_sync(initLock, block);
  return self->_syncStatus;
}

void __31__CPLLibraryManager_syncStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 56))
  {
    if (*(unsigned char *)(v1 + 72))
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v2 = __CPLManagerOSLogDomain_0();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Client tried to access sync status while the library is not open", v9, 2u);
        }
      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(*(void *)(a1 + 32) + 64), (CFNotificationCallback)_statusDidChange_11626, (CFStringRef)_CPLStatusDidChangeNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
      uint64_t v5 = [[CPLStatus alloc] initWithClientLibraryBaseURL:*(void *)(*(void *)(a1 + 32) + 88)];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 56);
      *(void *)(v6 + 56) = v5;

      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 56);
      [v8 preventDelegateWithDelegationClass:&unk_1F0DBF638 selector:sel_libraryManagerStatusDidChange_];
    }
  }
}

- (void)_statusDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CPLLibraryManager__statusDidChange__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __37__CPLLibraryManager__statusDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 refetchFromDisk];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
    [WeakRetained libraryManagerStatusDidChange:*(void *)(a1 + 32)];
  }
}

- (CPLConfiguration)configuration
{
  if (!self->_clientLibraryBaseURL)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Can't access configuration with client library base URL", buf, 2u);
      }
    }
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m"];
    [v7 handleFailureInMethod:a2 object:self file:v8 lineNumber:509 description:@"Can't access configuration with client library base URL"];

    abort();
  }
  initLock = self->_initLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CPLLibraryManager_configuration__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_sync(initLock, block);
  return self->_configuration;
}

void __34__CPLLibraryManager_configuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 48))
  {
    if (*(unsigned char *)(v1 + 72))
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v2 = __CPLManagerOSLogDomain_0();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Client tried to access configuration while the library is not open", v9, 2u);
        }
      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(*(void *)(a1 + 32) + 64), (CFNotificationCallback)_configurationDidChange, @"_CPLConfigurationDidChangeNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
      uint64_t v5 = [[CPLConfiguration alloc] initWithClientLibraryBaseURL:*(void *)(*(void *)(a1 + 32) + 88)];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 48);
      *(void *)(v6 + 48) = v5;

      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 48);
      [v8 setConfigurationDictionaryUniquifier:&__block_literal_global_34_9384];
    }
  }
}

- (void)_configurationDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CPLLibraryManager__configurationDidChange__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __44__CPLLibraryManager__configurationDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    [v2 refetchFromDisk];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
      [v5 libraryManagerDidChangeConfiguration:*(void *)(a1 + 32)];
    }
  }
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  SEL v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) platformObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_1E60A6AB0;
    uint64_t v3 = *(void *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    [v2 boostPriorityForScopeWithIdentifier:v3 completionHandler:v7];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v6 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't boost priority for %@ in state %@", v4, v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3;
  v10[3] = &unk_1E60A9C70;
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __75__CPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6078;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  SEL v10 = queue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) platformObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2;
    v6[3] = &unk_1E60A6AB0;
    uint64_t v3 = *(void *)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 48);
    [v2 deactivateScopeWithIdentifier:v3 completionHandler:v6];
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't disable PrimarySync in state %@", v4];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3;
  v10[3] = &unk_1E60A9C70;
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __69__CPLLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  SEL v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) platformObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_1E60A6AB0;
    uint64_t v3 = *(void *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    [v2 activateScopeWithIdentifier:v3 completionHandler:v7];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v6 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't enable %@ in state %@", v4, v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3;
  v10[3] = &unk_1E60A9C70;
  id v5 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = v4;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __67__CPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)disableMainScopeWithCompletionHandler:(id)a3
{
}

- (void)enableMainScopeWithCompletionHandler:(id)a3
{
}

- (void)deactivateWithCompletionHandler:(id)a3
{
}

- (void)closeWithCompletionHandler:(id)a3
{
}

- (void)_closeDeactivating:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke;
  v12[3] = &unk_1E60AA2D8;
  v12[4] = self;
  id v13 = v6;
  BOOL v14 = a3;
  id v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2;
    block[3] = &unk_1E60A5DD8;
    void block[4] = v2;
    dispatch_sync(v3, block);
    [*(id *)(a1 + 32) setState:3];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_3;
    v18[3] = &unk_1E60AA2D8;
    uint64_t v4 = *(void **)(a1 + 40);
    void v18[4] = *(void *)(a1 + 32);
    id v19 = v4;
    char v20 = *(unsigned char *)(a1 + 48);
    id v5 = (void *)MEMORY[0x1BA994060](v18);
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_188;
    v11[3] = &unk_1E60A5FD8;
    void v11[4] = v6;
    id v8 = v5;
    id v12 = v8;
    id v13 = &v14;
    dispatch_sync(v7, v11);
    if (*((unsigned char *)v15 + 24)) {
      v8[2](v8);
    }

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    dispatch_block_t v9 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v10 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't close a cloud library in state %@", v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(*(void *)(a1 + 32) + 64), @"_CPLConfigurationDidChangeNotification", 0);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 56))
  {
    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, *(const void **)(*(void *)(a1 + 32) + 64), (CFNotificationName)_CPLStatusDidChangeNotification, 0);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0;
  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v16 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ closing", buf, 0xCu);
    }
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  dispatch_block_t v11 = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_186;
  id v12 = &unk_1E60A6AB0;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v4;
  id v5 = (void *)MEMORY[0x1BA994060](&v9);
  int v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "platformObject", v9, v10, v11, v12, v13);
  id v8 = v7;
  if (v6) {
    [v7 deactivateWithCompletionHandler:v5];
  }
  else {
    [v7 closeWithCompletionHandler:v5];
  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_188(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(v5 + 8);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v16 = v5;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "%@ is closing in the middle of %@", buf, 0x16u);
      }

      uint64_t v1 = *(void *)(a1 + 32);
      uint64_t v2 = *(void **)(v1 + 8);
    }
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    dispatch_block_t v11 = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_189;
    id v12 = &unk_1E60A5EE8;
    uint64_t v13 = v1;
    id v14 = *(id *)(a1 + 40);
    [v2 tearDownWithCompletionHandler:&v9];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    if (v8)
    {
      *(void *)(v7 + 8) = 0;

      +[CPLTransaction endTransactionWithIdentifier:@"cpl.client.session", v9, v10, v11, v12, v13];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_189(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2_190;
  v5[3] = &unk_1E60A6978;
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v8 = v2;
  uint64_t v3 = v1;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);
}

uint64_t __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_2_190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CPLLibraryManager__closeDeactivating_completionHandler___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setState:0];
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v4 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "%@ closed", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CPLLibraryManager_openWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  int v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __47__CPLLibraryManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state])
  {
    uint64_t v2 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    id v7 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't open a cloud library in state %@", v2];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setState:1];
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "%@ opening", buf, 0xCu);
      }
    }
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    uint64_t v5 = [*(id *)(a1 + 32) platformObject];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_180;
    _OWORD v8[3] = &unk_1E60A5F38;
    int v6 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    [v5 openWithCompletionHandler:v8];
  }
}

void __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_180(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!_CPLSilentLogging)
  {
    uint64_t v16 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v43 = v17;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEBUG, "%@ opened", buf, 0xCu);
    }
  }
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v18 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v43 = v19;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "%@ failed opening with error %@", buf, 0x16u);
      }
    }
    uint64_t v20 = 0;
    goto LABEL_29;
  }
  id v21 = *(void **)(*(void *)(a1 + 32) + 112);
  if (!v21) {
    goto LABEL_15;
  }
  id v22 = v21;
  SEL v23 = v22;
  if (v13 && ([v22 isEqual:v13] & 1) != 0)
  {

    if (!*(void *)(*(void *)(a1 + 32) + 112))
    {
LABEL_15:
      uint64_t v24 = [v13 copy];
      uint64_t v25 = *(void *)(a1 + 32);
      id v26 = *(NSObject **)(v25 + 112);
      *(void *)(v25 + 112) = v24;
LABEL_19:
    }
  }
  else
  {

    if (!_CPLSilentLogging)
    {
      id v26 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 112);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v43 = v27;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_ERROR, "Unexpected implementation library identifier. Found '%@', expected '%@'", buf, 0x16u);
      }
      goto LABEL_19;
    }
  }
  id v28 = *(void **)(a1 + 32);
  if (!v28[11])
  {
    uint64_t v29 = [v15 copy];
    uint64_t v30 = *(void *)(a1 + 32);
    id v31 = *(void **)(v30 + 88);
    *(void *)(v30 + 88) = v29;

    id v28 = *(void **)(a1 + 32);
  }
  if (!v28[15])
  {
    uint64_t v32 = [v14 copy];
    uint64_t v33 = *(void *)(a1 + 32);
    id v34 = *(void **)(v33 + 120);
    *(void *)(v33 + 120) = v32;

    id v28 = *(void **)(a1 + 32);
  }
  [v28 _setLibraryVersion:v12];
  if (!_CPLSilentLogging)
  {
    id v35 = __CPLManagerOSLogDomain_0();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = *(void *)(v36 + 160);
      uint64_t v38 = *(void *)(v36 + 168);
      *(_DWORD *)long long buf = 138413314;
      uint64_t v43 = v36;
      __int16 v44 = 2112;
      id v45 = v13;
      __int16 v46 = 2112;
      id v47 = v12;
      __int16 v48 = 2048;
      uint64_t v49 = v37;
      __int16 v50 = 2048;
      uint64_t v51 = v38;
      _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_DEBUG, "%@ opened with identifier %@ and version %@. Size of resources to upload is %llu (%llu) bytes", buf, 0x34u);
    }
  }
  uint64_t v20 = 2;
LABEL_29:
  [*(id *)(a1 + 32) setState:v20];
  uint64_t v39 = *(void *)(a1 + 32);
  uint64_t v40 = *(NSObject **)(v39 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_181;
  block[3] = &unk_1E60A5DD8;
  void block[4] = v39;
  dispatch_sync(v40, block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

uint64_t __47__CPLLibraryManager_openWithCompletionHandler___block_invoke_181(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_state)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = [(id)objc_opt_class() stateDescriptionForState:self->_state];
        *(_DWORD *)long long buf = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "at dealloc time, %@ should not be in state %@", buf, 0x16u);
      }
    }
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m"];
    id v8 = [(id)objc_opt_class() stateDescriptionForState:self->_state];
    [v6 handleFailureInMethod:a2, self, v7, 322, @"at dealloc time, %@ should not be in state %@", self, v8 object file lineNumber description];

LABEL_14:
    abort();
  }
  if (self->_currentSession)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Current session not finished", buf, 2u);
      }
    }
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m"];
    [v6 handleFailureInMethod:a2 object:self file:v7 lineNumber:323 description:@"Current session not finished"];
    goto LABEL_14;
  }
  v10.receiver = self;
  v10.super_class = (Class)CPLLibraryManager;
  [(CPLLibraryManager *)&v10 dealloc];
}

- (void)barrier
{
  id v2 = [(CPLLibraryManager *)self platformObject];
  [v2 barrier];
}

- (id)initForManagementWithLibraryIdentifier:(id)a3
{
  return [(CPLLibraryManager *)self initWithClientLibraryBaseURL:0 cloudLibraryStateStorageURL:0 cloudLibraryResourceStorageURL:0 libraryIdentifier:a3 mainScopeIdentifier:0 options:0];
}

- (id)initForManagement
{
  return [(CPLLibraryManager *)self initForManagementWithLibraryIdentifier:@"SystemLibrary"];
}

- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6
{
  return [(CPLLibraryManager *)self initWithClientLibraryBaseURL:a3 cloudLibraryStateStorageURL:a4 cloudLibraryResourceStorageURL:a5 libraryIdentifier:a6 options:0];
}

- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 options:(unint64_t)a7
{
  return [(CPLLibraryManager *)self initWithClientLibraryBaseURL:a3 cloudLibraryStateStorageURL:a4 cloudLibraryResourceStorageURL:a5 libraryIdentifier:a6 mainScopeIdentifier:@"PrimarySync" options:a7];
}

- (CPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__CPLLibraryManager_initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options___block_invoke;
  block[3] = &unk_1E60A5DD8;
  uint64_t v20 = self;
  v56 = v20;
  if (initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options__onceToken != -1) {
    dispatch_once(&initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options__onceToken, block);
  }
  v54.receiver = v20;
  v54.super_class = (Class)CPLLibraryManager;
  id v21 = [(CPLLibraryManager *)&v54 init];
  id v22 = v21;
  if (v21)
  {
    v21->_preventObserving = 1;
    SEL v23 = [[_CPLWeakLibraryManager alloc] initWithLibraryManager:v21];
    weakSelf = v22->_weakSelf;
    v22->_weakSelf = v23;

    uint64_t v25 = [v15 copy];
    clientLibraryBaseURL = v22->_clientLibraryBaseURL;
    v22->_clientLibraryBaseURL = (NSURL *)v25;

    uint64_t v27 = [v16 copy];
    cloudLibraryStateStorageURL = v22->_cloudLibraryStateStorageURL;
    v22->_cloudLibraryStateStorageURL = (NSURL *)v27;

    uint64_t v29 = [v17 copy];
    cloudLibraryResourceStorageURL = v22->_cloudLibraryResourceStorageURL;
    v22->_cloudLibraryResourceStorageURL = (NSURL *)v29;

    uint64_t v31 = [v18 copy];
    libraryIdentifier = v22->_libraryIdentifier;
    v22->_libraryIdentifier = (NSString *)v31;

    uint64_t v33 = [v19 copy];
    mainScopeIdentifier = v22->_mainScopeIdentifier;
    v22->_mainScopeIdentifier = (NSString *)v33;

    v22->_libraryOptions = a8;
    id v35 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.cpl.librarymanager", v35);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v36;

    uint64_t v38 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v39 = dispatch_queue_create("com.apple.cpl.librarymanager.session", v38);
    sessionLock = v22->_sessionLock;
    v22->_sessionLock = (OS_dispatch_queue *)v39;

    unint64_t v41 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v42 = dispatch_queue_create("com.apple.cpl.librarymanager.init", v41);
    initLock = v22->_initLock;
    v22->_initLock = (OS_dispatch_queue *)v42;

    __int16 v44 = +[CPLPlatform currentPlatform];
    uint64_t v45 = [v44 newPlatformImplementationForObject:v22];
    platformObject = v22->_platformObject;
    v22->_platformObject = (CPLPlatformObject *)v45;

    if (!v22->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v49 = __CPLManagerOSLogDomain_0();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          __int16 v50 = (CPLLibraryManager *)objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          v58 = v50;
          uint64_t v51 = v50;
          _os_log_impl(&dword_1B4CAC000, v49, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
      v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLLibraryManager.m"];
      [v52 handleFailureInMethod:a2, v22, v53, 283, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
    if (!_CPLSilentLogging)
    {
      id v47 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v58 = v22;
        _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
      }
    }
  }

  return v22;
}

void __155__CPLLibraryManager_initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options___block_invoke()
{
  v0 = +[CPLPlatform defaultPlatform];

  if (!v0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v1 = __CPLManagerOSLogDomain_0();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v2 = 0;
        _os_log_impl(&dword_1B4CAC000, v1, OS_LOG_TYPE_DEBUG, "No platform has been currently selected. Automatically picking the appropriate one", v2, 2u);
      }
    }
    [(id)objc_opt_class() useCloudPhotoDaemonImplementation];
  }
}

+ (id)descriptionForExitSource:(int64_t)a3
{
  uint64_t v4 = [a1 mappingExitSources];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  int v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown exit source (%ld)", a3);
  }
  id v8 = v7;

  return v8;
}

+ (NSDictionary)mappingExitSources
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CPLLibraryManager_mappingExitSources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (mappingExitSources_onceToken != -1) {
    dispatch_once(&mappingExitSources_onceToken, block);
  }
  id v2 = (void *)mappingExitSources_mappingExitSources;
  return (NSDictionary *)v2;
}

void __39__CPLLibraryManager_mappingExitSources__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableExitSources];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = [*(id *)(a1 + 32) availableExitSources];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__CPLLibraryManager_mappingExitSources__block_invoke_2;
  _OWORD v8[3] = &unk_1E60AAEF8;
  id v5 = v3;
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  int v6 = (void *)mappingExitSources_mappingExitSources;
  mappingExitSources_mappingExitSources = (uint64_t)v5;
  id v7 = v5;
}

uint64_t __39__CPLLibraryManager_mappingExitSources__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (NSDictionary)availableExitSources
{
  return (NSDictionary *)&unk_1F0D91710;
}

+ (NSDictionary)mappingRetentionPolicies
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (mappingRetentionPolicies_onceToken != -1) {
    dispatch_once(&mappingRetentionPolicies_onceToken, block);
  }
  id v2 = (void *)mappingRetentionPolicies_mappingRetentionPolicies;
  return (NSDictionary *)v2;
}

void __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) availableRetentionPolicies];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = [*(id *)(a1 + 32) availableRetentionPolicies];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke_2;
  _OWORD v8[3] = &unk_1E60AAEF8;
  id v5 = v3;
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  int v6 = (void *)mappingRetentionPolicies_mappingRetentionPolicies;
  mappingRetentionPolicies_mappingRetentionPolicies = (uint64_t)v5;
  id v7 = v5;
}

uint64_t __45__CPLLibraryManager_mappingRetentionPolicies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (NSDictionary)availableRetentionPolicies
{
  return (NSDictionary *)&unk_1F0D916E8;
}

+ (id)platformImplementationProtocol
{
  id v2 = [(id)objc_opt_class() description];
  id v3 = [v2 stringByAppendingString:@"Implementation"];
  uint64_t v4 = NSProtocolFromString(v3);

  return v4;
}

+ (id)descriptionForProvideContentResult:(unint64_t)a3
{
  if (a3 > 2) {
    return @"UNKNOWN";
  }
  else {
    return off_1E60A8A60[a3];
  }
}

+ (id)stateDescriptionForState:(unint64_t)a3
{
  if (a3 > 4) {
    return @"UNKNOWN";
  }
  else {
    return off_1E60A8A38[a3];
  }
}

+ (void)useCloudPhotoDaemonImplementation
{
  id v2 = objc_alloc_init(CPLPlatform);
  +[CPLPlatform setProxyImplementationForPlatform:v2];
  +[CPLPlatform setDefaultPlatform:v2];
}

+ (NSArray)allLibraryOptionsDescriptions
{
  id v2 = [a1 mappingForLibraryOptions];
  id v3 = [v2 allValues];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v4;
}

+ (unint64_t)optionsFromDescription:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _reverseMappingForLibraryOptions];
  int v6 = [v4 componentsSeparatedByString:@"|"];
  id v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v7, (void)v20);
        id v15 = [v5 objectForKeyedSubscript:v14];
        id v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 unsignedIntegerValue];
        }
        else
        {
          uint64_t v18 = [v14 integerValue];
          uint64_t v17 = v18 & ~(v18 >> 63);
        }
        v11 |= v17;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (id)descriptionForLibraryOptions:(unint64_t)a3
{
  id v4 = [a1 mappingForLibraryOptions];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  unint64_t v20 = a3;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  __int16 v13 = __50__CPLLibraryManager_descriptionForLibraryOptions___block_invoke;
  id v14 = &unk_1E60A86F0;
  id v16 = &v17;
  id v6 = v5;
  id v15 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v11];
  if (v18[3])
  {
    id v7 = [NSString alloc];
    id v8 = [v6 componentsJoinedByString:@"|"];
    uint64_t v9 = (void *)[v7 initWithFormat:@"%@|%lu", v8, v18[3], v11, v12, v13, v14];
  }
  else
  {
    uint64_t v9 = [v6 componentsJoinedByString:@"|"];
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __50__CPLLibraryManager_descriptionForLibraryOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  if ((*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & v5) != 0)
  {
    uint64_t v6 = v5;
    [*(id *)(a1 + 32) addObject:v7];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) &= ~v6;
  }
}

+ (id)_reverseMappingForLibraryOptions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_reverseMappingForLibraryOptions_onceToken != -1) {
    dispatch_once(&_reverseMappingForLibraryOptions_onceToken, block);
  }
  id v2 = (void *)_reverseMappingForLibraryOptions_reverseMapping;
  return v2;
}

void __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mappingForLibraryOptions];
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke_2;
  v6[3] = &unk_1E60A86C8;
  id v3 = v2;
  id v7 = v3;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (void *)_reverseMappingForLibraryOptions_reverseMapping;
  _reverseMappingForLibraryOptions_reverseMapping = (uint64_t)v3;
  id v5 = v3;
}

uint64_t __53__CPLLibraryManager__reverseMappingForLibraryOptions__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (NSDictionary)mappingForLibraryOptions
{
  if (mappingForLibraryOptions_onceToken != -1) {
    dispatch_once(&mappingForLibraryOptions_onceToken, &__block_literal_global_11746);
  }
  id v2 = (void *)mappingForLibraryOptions_mapping;
  return (NSDictionary *)v2;
}

void __45__CPLLibraryManager_mappingForLibraryOptions__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D91298;
  v2[1] = &unk_1F0D912B0;
  v3[0] = @"primary-scope-management";
  v3[1] = @"library-scope-sync";
  v2[2] = &unk_1F0D912C8;
  v2[3] = &unk_1F0D912E0;
  v3[2] = @"cmm-scope-sync";
  v3[3] = @"share-scope-sync";
  v2[4] = &unk_1F0D912F8;
  void v3[4] = @"inactive-scope-sync";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  uint64_t v1 = (void *)mappingForLibraryOptions_mapping;
  mappingForLibraryOptions_mapping = v0;
}

- (void)unblockEngineElementOnce:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CPLLibraryManager_CPLManagement__unblockEngineElementOnce___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __61__CPLLibraryManager_CPLManagement__unblockEngineElementOnce___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 unblockEngineElementOnce:*(void *)(a1 + 40)];
}

- (void)unblockEngineElement:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CPLLibraryManager_CPLManagement__unblockEngineElement___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __57__CPLLibraryManager_CPLManagement__unblockEngineElement___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 unblockEngineElement:*(void *)(a1 + 40)];
}

- (void)blockEngineElement:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLLibraryManager_CPLManagement__blockEngineElement___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __55__CPLLibraryManager_CPLManagement__blockEngineElement___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 blockEngineElement:*(void *)(a1 + 40)];
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CPLLibraryManager_CPLManagement__reportMiscInformation___block_invoke;
  v10[3] = &unk_1E60A6728;
  void v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __58__CPLLibraryManager_CPLManagement__reportMiscInformation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 reportMiscInformation:*(void *)(a1 + 40)];
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CPLLibraryManager_CPLManagement__reportSetting_hasBeenSetToValue___block_invoke;
  v14[3] = &unk_1E60A6660;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __68__CPLLibraryManager_CPLManagement__reportSetting_hasBeenSetToValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  id v4 = v2;
  if (*(void *)(a1 + 48)) {
    id v3 = *(__CFString **)(a1 + 48);
  }
  else {
    id v3 = @"nil";
  }
  [v2 reportSetting:*(void *)(a1 + 40) hasBeenSetToValue:v3];
}

- (void)reportSetting:(id)a3 hasBeenEnabled:(BOOL)a4
{
  if (a4) {
    id v4 = @"true";
  }
  else {
    id v4 = @"false";
  }
  [(CPLLibraryManager *)self reportSetting:a3 hasBeenSetToValue:v4];
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__CPLLibraryManager_CPLManagement__cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6528;
  v16[4] = self;
  id v17 = v8;
  BOOL v19 = a4;
  id v18 = v9;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __116__CPLLibraryManager_CPLManagement__cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 cloudCacheGetDescriptionForRecordWithScopedIdentifier:*(void *)(a1 + 40) related:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__CPLLibraryManager_CPLManagement__getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __97__CPLLibraryManager_CPLManagement__getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getCloudCacheForRecordWithScopedIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__CPLLibraryManager_CPLManagement__getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke;
  v16[3] = &unk_1E60A6528;
  v16[4] = self;
  id v17 = v8;
  BOOL v19 = a4;
  id v18 = v9;
  id v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v21 = v11;
  id v12 = queue;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __106__CPLLibraryManager_CPLManagement__getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getStatusesForScopesWithIdentifiers:*(void *)(a1 + 40) includeStorages:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__CPLLibraryManager_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __82__CPLLibraryManager_CPLManagement__getStatusArrayForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getStatusArrayForComponents:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CPLLibraryManager_CPLManagement__getStatusForComponents_completionHandler___block_invoke;
  v14[3] = &unk_1E60A6868;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __77__CPLLibraryManager_CPLManagement__getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getStatusForComponents:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__CPLLibraryManager_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_11406;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __77__CPLLibraryManager_CPLManagement__getListOfComponentsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platformObject];
  [v2 getListOfComponentsWithCompletionHandler:*(void *)(a1 + 40)];
}

+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3
{
  +[CPLEngineSystemMonitor nextOverrideTimeIntervalForSystemBudgets:a3];
  return result;
}

@end