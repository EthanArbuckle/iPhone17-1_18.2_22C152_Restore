@interface CPLEngineStore
+ (BOOL)dontBatchTransactions;
+ (NSArray)storageNames;
+ (id)platformImplementationProtocol;
+ (id)stateDescriptionForState:(unint64_t)a3;
+ (void)setDontBatchTransactions:(BOOL)a3;
- (BOOL)_applyAndDiscardPendingUpdate:(id)a3 error:(id *)a4;
- (BOOL)_applyPendingUpdate:(id)a3 error:(id *)a4;
- (BOOL)_canHaveActivatedScope:(id)a3 libraryOptions:(unint64_t)a4 error:(id *)a5;
- (BOOL)_canRead;
- (BOOL)_canWrite;
- (BOOL)_handleException:(id)a3;
- (BOOL)_resetCompleteSyncStateIncludingIDMappingWithCause:(id)a3 scope:(id)a4 error:(id *)a5;
- (BOOL)_resetCompleteSyncStateWithCause:(id)a3 scope:(id)a4 error:(id *)a5;
- (BOOL)_resetGlobalStateWithError:(id *)a3;
- (BOOL)_resetLocalSyncStateWithCause:(id)a3 scope:(id)a4 date:(id)a5 error:(id *)a6;
- (BOOL)_resetSyncAnchorWithCause:(id)a3 scope:(id)a4 error:(id *)a5;
- (BOOL)_shouldSyncScopeListWithOptions:(unint64_t)a3;
- (BOOL)_storeChangeSessionUpdate:(id)a3 error:(id *)a4;
- (BOOL)addPushPullGatekeeper:(id)a3 error:(id *)a4;
- (BOOL)applyPreviousChangeSessionUpdateWithExpectedLibraryVersion:(id)a3 error:(id *)a4;
- (BOOL)beginChangeSession:(id)a3 withLibraryVersion:(id)a4 resetTracker:(id)a5 error:(id *)a6;
- (BOOL)canActivateScope:(id)a3 error:(id *)a4;
- (BOOL)checkExpectedLibraryVersion:(id)a3 error:(id *)a4;
- (BOOL)clearAllPushPullGatekeepersWithError:(id *)a3;
- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4;
- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4;
- (BOOL)forceApplyPendingChangeSessionUpdateWithError:(id *)a3;
- (BOOL)hasPendingChangeSessionUpdate;
- (BOOL)hasPendingResetSync;
- (BOOL)hasUnacknowledgedChanges;
- (BOOL)isClientInSyncWithClientCache;
- (BOOL)isFeatureDisabled:(id)a3;
- (BOOL)mainScopeSupportsSharingScopeWithIdentifier:(id)a3;
- (BOOL)pushRepositoryIsFull;
- (BOOL)resetCompleteSyncStateIncludingIDMappingWithCause:(id)a3 error:(id *)a4;
- (BOOL)resetCompleteSyncStateWithCause:(id)a3 error:(id *)a4;
- (BOOL)resetLocalSyncStateWithCause:(id)a3 date:(id)a4 error:(id *)a5;
- (BOOL)resetLocalSyncStateWithCause:(id)a3 error:(id *)a4;
- (BOOL)resetSyncAnchorWithCause:(id)a3 error:(id *)a4;
- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3;
- (BOOL)shouldGenerateDerivatives;
- (BOOL)shouldSyncScopeList;
- (BOOL)shouldUpdateDisabledFeatures;
- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4;
- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3;
- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4;
- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4;
- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4;
- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4;
- (BOOL)supportsSharingScopeWithIdentifier:(id)a3 forScopeWithIdentifier:(id)a4;
- (BOOL)syncSessionShouldRequestMoreTime;
- (BOOL)updateDisabledFeatures:(id)a3 didReset:(BOOL *)a4 error:(id *)a5;
- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4;
- (CPLEngineChangePipe)pullQueue;
- (CPLEngineCloudCache)cloudCache;
- (CPLEngineDerivativesCache)derivativesCache;
- (CPLEngineIDMapping)idMapping;
- (CPLEngineIgnoredRecords)ignoredRecords;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineOutgoingResources)outgoingResources;
- (CPLEnginePendingRecordChecks)pendingRecordChecks;
- (CPLEnginePushRepository)pushRepository;
- (CPLEngineQuarantinedRecords)quarantinedRecords;
- (CPLEngineRecordComputeStatePushQueue)recordComputeStatePushQueue;
- (CPLEngineRemappedRecords)remappedRecords;
- (CPLEngineResourceDownloadQueue)downloadQueue;
- (CPLEngineResourceStorage)resourceStorage;
- (CPLEngineRevertRecords)revertRecords;
- (CPLEngineScopeCleanupTasks)cleanupTasks;
- (CPLEngineScopeStorage)scopes;
- (CPLEngineStatusCenter)statusCenter;
- (CPLEngineStore)initWithEngineLibrary:(id)a3;
- (CPLEngineTransientRepository)transientPullRepository;
- (CPLPlatformObject)platformObject;
- (CPLRecordStorageView)transactionClientCacheView;
- (CPLTransportScopeMapping)transactionTransportScopeMapping;
- (NSArray)disabledFeatures;
- (NSArray)pushPullGatekeepers;
- (NSArray)storages;
- (NSDate)libraryCreationDate;
- (NSString)description;
- (NSString)mainScopeIdentifier;
- (NSString)sharingScopeIdentifier;
- (id)_currentTransaction;
- (id)_performWriteTransactionByPassBlocker:(id)a3 WithBlock:(id)a4 completionHandler:(id)a5;
- (id)_resetEventsDescriptions;
- (id)_resetEventsJSON;
- (id)_storedDisabledFeatures;
- (id)clientCacheIdentifier;
- (id)componentName;
- (id)corruptionInfo;
- (id)createNewLibraryVersion;
- (id)derivativesFilter;
- (id)lastQuarantineCountReportDate;
- (id)libraryVersion;
- (id)localResourceForCloudResource:(id)a3 recordClass:(Class *)a4;
- (id)newClientCacheViewUsesPushRepository:(BOOL *)a3;
- (id)performReadTransactionWithBlock:(id)a3;
- (id)performWriteTransactionWithBlock:(id)a3 completionHandler:(id)a4;
- (id)unacknowledgedChangeWithLocalScopedIdentifier:(id)a3;
- (id)userIdentifier;
- (unint64_t)libraryOptions;
- (unint64_t)state;
- (void)_addCleanupBlock:(id)a3;
- (void)_closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)_commitWriteTransaction:(id)a3 commitError:(id)a4;
- (void)_dropTransactionClientCacheView;
- (void)_finishTransaction;
- (void)_loadResetEvents;
- (void)_performBarrierTransaction:(id)a3 withBlock:(id)a4;
- (void)_performTransaction:(id)a3 withBlock:(id)a4;
- (void)_reallyPerformBatchedTransactionsLocked;
- (void)_reallySchedulePendingUpdateApply;
- (void)_reallyUnschedulePendingUpdateApply;
- (void)_removeTransactionOnCurrentThread:(id)a3;
- (void)_scheduleBatchedTransactionsLocked;
- (void)_schedulePendingUpdateApply;
- (void)_setSharingScopeIdentifier:(id)a3;
- (void)_setTransactionOnCurrentThread:(id)a3;
- (void)_storeResetEvent:(id)a3 scopeIdentifier:(id)a4 date:(id)a5 cause:(id)a6;
- (void)_storeResetEvent:(id)a3 scopeIdentifier:(id)a4 date:(id)a5 pending:(BOOL)a6 cause:(id)a7;
- (void)_unschedulePendingUpdateApply;
- (void)_updateShouldSyncScopeList:(BOOL)a3;
- (void)assertCanRead;
- (void)assertCanWrite;
- (void)assertNoUnacknowledgedChanges;
- (void)blockWriteTransactionsWithCompletionHandler:(id)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)dropSharingScopeIdentifier:(id)a3;
- (void)dropUnacknowledgedBatch;
- (void)emergencyClose;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)keepUnacknowledgedBatch:(id)a3;
- (void)markAsCorrupted;
- (void)noteInvalidRecordScopedIdentifiersInPushSession:(id)a3;
- (void)noteOtherResetEvent:(id)a3 cause:(id)a4;
- (void)notePushRepositoryStoredSomeChanges;
- (void)noteResetSyncFinished;
- (void)openWithCompletionHandler:(id)a3;
- (void)performBarrier;
- (void)performBatchedWriteTransactionBarrier;
- (void)performBatchedWriteTransactionBarrierWithCompletionBlock:(id)a3;
- (void)performBatchedWriteTransactionWithBlock:(id)a3 completionHandler:(id)a4;
- (void)predictSyncSessionValue:(id)a3 ofType:(id)a4;
- (void)registerStorage:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)startVacuumWithCompletionHandler:(id)a3;
- (void)stopVacuum;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)transactionDidFinish;
- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivativesCache, 0);
  objc_storeStrong((id *)&self->_recordComputeStatePushQueue, 0);
  objc_storeStrong((id *)&self->_ignoredRecords, 0);
  objc_storeStrong((id *)&self->_pendingRecordChecks, 0);
  objc_storeStrong((id *)&self->_statusCenter, 0);
  objc_storeStrong((id *)&self->_quarantinedRecords, 0);
  objc_storeStrong((id *)&self->_remappedRecords, 0);
  objc_storeStrong((id *)&self->_outgoingResources, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_resourceStorage, 0);
  objc_storeStrong((id *)&self->_transientPullRepository, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_revertRecords, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
  objc_storeStrong((id *)&self->_cleanupTasks, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_transactionTransportScopeMapping, 0);
  objc_storeStrong((id *)&self->_transactionClientCacheView, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_disabledFeatures, 0);
  objc_storeStrong((id *)&self->_shouldSyncScopeListQueue, 0);
  objc_storeStrong((id *)&self->_pendingUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pendingUpdateTimer, 0);
  objc_storeStrong((id *)&self->_lastInvalidRecordsDate, 0);
  objc_storeStrong((id *)&self->_lastInvalidRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionNewPredictions, 0);
  objc_storeStrong((id *)&self->_unacknowledgedBatch, 0);
  objc_storeStrong((id *)&self->_pendingTracker, 0);
  objc_storeStrong((id *)&self->_resetEvents, 0);
  objc_storeStrong((id *)&self->_resetEventsURL, 0);
  objc_storeStrong((id *)&self->_batchedTransactions, 0);
  objc_storeStrong((id *)&self->_batchedTransactionsQueue, 0);
  objc_storeStrong((id *)&self->_sharingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_storages, 0);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (CPLEngineDerivativesCache)derivativesCache
{
  return self->_derivativesCache;
}

- (CPLEngineRecordComputeStatePushQueue)recordComputeStatePushQueue
{
  return self->_recordComputeStatePushQueue;
}

- (CPLEngineIgnoredRecords)ignoredRecords
{
  return self->_ignoredRecords;
}

- (CPLEnginePendingRecordChecks)pendingRecordChecks
{
  return self->_pendingRecordChecks;
}

- (CPLEngineStatusCenter)statusCenter
{
  return self->_statusCenter;
}

- (CPLEngineQuarantinedRecords)quarantinedRecords
{
  return self->_quarantinedRecords;
}

- (CPLEngineRemappedRecords)remappedRecords
{
  return self->_remappedRecords;
}

- (CPLEngineOutgoingResources)outgoingResources
{
  return self->_outgoingResources;
}

- (CPLEngineResourceDownloadQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (CPLEngineResourceStorage)resourceStorage
{
  return self->_resourceStorage;
}

- (CPLEngineTransientRepository)transientPullRepository
{
  return self->_transientPullRepository;
}

- (CPLEngineCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (CPLEngineRevertRecords)revertRecords
{
  return self->_revertRecords;
}

- (CPLEngineChangePipe)pullQueue
{
  return self->_pullQueue;
}

- (CPLEngineScopeCleanupTasks)cleanupTasks
{
  return self->_cleanupTasks;
}

- (CPLEngineScopeStorage)scopes
{
  return self->_scopes;
}

- (CPLEnginePushRepository)pushRepository
{
  return self->_pushRepository;
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__670;
  v24[4] = __Block_byref_object_dispose__671;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__CPLEngineStore_testKey_value_completionHandler___block_invoke;
  v19[3] = &unk_1E60A7470;
  v19[4] = self;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  v22 = v26;
  v23 = v24;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60A6E30;
  v17 = v26;
  id v13 = v10;
  id v16 = v13;
  v18 = v24;
  id v14 = [(CPLEngineStore *)self performWriteTransactionWithBlock:v19 completionHandler:v15];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

void __50__CPLEngineStore_testKey_value_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60A6E08;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 56);
  [a2 do:v5];
}

void __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_3(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    id v6 = [a2 error];
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, 1, v3, v6);
  }
  else
  {
    v4 = *(void (**)(uint64_t, void, void, void))(v2 + 16);
    uint64_t v5 = a1[4];
    v4(v5, 0, 0, 0);
  }
}

uint64_t __50__CPLEngineStore_testKey_value_completionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = *(id *)(a1[4] + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    id v10 = v7;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      uint64_t v12 = a1[5];
      uint64_t v13 = a1[6];
      uint64_t v14 = *(void *)(a1[7] + 8) + 24;
      uint64_t v15 = *(void *)(a1[8] + 8);
      id v16 = *(void **)(v15 + 40);
      id v19 = v10;
      id obj = v16;
      uint64_t v17 = [v11 testKey:v12 value:v13 didHandle:v14 result:&obj error:&v19];
      objc_storeStrong((id *)(v15 + 40), obj);
      id v7 = v19;

      if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
        break;
      }
      ++v9;
      id v10 = v7;
      if (v6 == v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v17 = 1;
  }

  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    if (a2) {
      *a2 = v7;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }

  return v17;
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CPLEngineStore_getStatusDictionaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60AB2A0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CPLEngineStore *)self performReadTransactionWithBlock:v7];
}

void __59__CPLEngineStore_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 error];
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "name", (void)v16);
          uint64_t v14 = [v12 statusDictionary];
          if (v14) {
            [v6 setObject:v14 forKeyedSubscript:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [*(id *)(a1 + 32) _resetEventsJSON];
    if ([v15 count]) {
      [v6 setObject:v15 forKeyedSubscript:@"resets"];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60AB2A0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CPLEngineStore *)self performReadTransactionWithBlock:v7];
}

void __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v107 = a2;
  uint64_t v2 = [v107 error];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [v107 error];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
  else
  {
    v103 = [*(id *)(a1 + 32) userIdentifier];
    if (objc_opt_respondsToSelector()) {
      [v103 cplShareParticipantUserIdentifier];
    }
    else {
    v102 = [v103 description];
    }
    v106 = [*(id *)(a1 + 32) libraryCreationDate];
    id v5 = [*(id *)(a1 + 32) platformObject];
    v108 = [v5 storedChangeSessionUpdate];

    v109 = [v108 storageForStatusInStore:*(void *)(a1 + 32)];
    if (v108)
    {
      id v6 = [NSString alloc];
      id v7 = [v108 libraryVersion];
      v101 = (__CFString *)[v6 initWithFormat:@" (pending: %@ for %@)", v7, objc_opt_class()];
    }
    else
    {
      v101 = &stru_1F0D5F858;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v9 = v106;
    if (v106)
    {
      +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:");
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v106;
    }
    else
    {
      uint64_t v10 = @"unknown";
    }
    BOOL v11 = v9 == 0;
    uint64_t v12 = [*(id *)(a1 + 32) libraryVersion];
    uint64_t v13 = [*(id *)(a1 + 32) clientCacheIdentifier];
    int v14 = [*(id *)(a1 + 32) isClientInSyncWithClientCache];
    uint64_t v15 = @"out of sync";
    if (v14) {
      uint64_t v15 = @"in sync";
    }
    long long v16 = (void *)[v8 initWithFormat:@"creation date: %@\nlibrary version: %@%@\nclient cache id: %@ (%@)\nuser identifier: %@\n", v10, v12, v101, v13, v15, v102];

    if (!v11) {
    uint64_t v17 = a1;
    }
    if ([*(id *)(a1 + 32) shouldSyncScopeList]) {
      [v16 appendString:@"synchronizing scope list: enabled\n"];
    }
    long long v18 = *(void **)(a1 + 32);
    long long v19 = (void *)v18[20];
    v115 = v16;
    if (!v19)
    {
      uint64_t v20 = [v18 _storedDisabledFeatures];
      uint64_t v17 = a1;
      uint64_t v21 = *(void *)(a1 + 32);
      long long v22 = *(void **)(v21 + 160);
      *(void *)(v21 + 160) = v20;

      long long v19 = *(void **)(*(void *)(a1 + 32) + 160);
    }
    if ([v19 count])
    {
      long long v23 = [*(id *)(*(void *)(v17 + 32) + 160) componentsJoinedByString:@", "];
      [v16 appendFormat:@"disabled features: %@\n", v23];

      uint64_t v17 = a1;
    }
    long long v24 = [*(id *)(*(void *)(v17 + 32) + 216) primaryScope];
    if (v24)
    {
      uint64_t v25 = a1;
      int v26 = [*(id *)(*(void *)(a1 + 32) + 216) valueForFlag:16 forScope:v24] ^ 1;
    }
    else
    {
      int v26 = 0;
      uint64_t v25 = a1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v25 + 32) + 200));
    v28 = [WeakRetained libraryIdentifier];

    if ([v28 hasPrefix:CPLAppLibraryIdentifierPrefix])
    {
      id v29 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
      v30 = [v29 libraryIdentifier];
      v31 = CPLAppBundleIdentifierForLibraryIdentifier(v30);

      id v32 = [NSString alloc];
      v33 = [*(id *)(a1 + 32) mainScopeIdentifier];
      v34 = (void *)[v32 initWithFormat:@"Synchronizing App Library for %@ with %@", v31, v33];
    }
    else
    {
      id v35 = [NSString alloc];
      v31 = [*(id *)(a1 + 32) mainScopeIdentifier];
      v34 = (void *)[v35 initWithFormat:@"Synchronizing %@ with %@", v28, v31];
    }

    v36 = @"is NOT enabled";
    if (v26) {
      v36 = @"is ENABLED";
    }
    [v115 appendFormat:@"\n%@ %@", v34, v36];
    if (*(void *)(*(void *)(a1 + 32) + 16)) {
      [v115 appendFormat:@"\nSharing is enabled using %@", *(void *)(*(void *)(a1 + 32) + 16)];
    }
    [v115 appendString:@"\n"];

    v105 = [*(id *)(a1 + 32) _resetEventsDescriptions];
    if (v105)
    {
      v37 = [v105 componentsJoinedByString:@"\n\t"];
      [v115 appendFormat:@"\nresets:\n\t%@", v37];
    }
    v38 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v39 = [v38 BOOLForKey:@"CPLShowPossibleResets"];

    if (v39)
    {
      v40 = +[CPLResetTracker currentReasonDescriptions];
      if ([v40 count])
      {
        v41 = [v40 componentsJoinedByString:@"\n\t"];
        [v115 appendFormat:@"\nmight reset soon because:\n\t%@", v41];
      }
    }
    uint64_t v42 = *(void *)(a1 + 32);
    if (*(void *)(v42 + 104))
    {
      unint64_t v43 = [*(id *)(v42 + 96) count];
      if (v43 < 4)
      {
        v46 = +[CPLDateFormatter stringFromDateAgo:*(void *)(*(void *)(a1 + 32) + 104) now:0];
        v47 = [*(id *)(*(void *)(a1 + 32) + 96) allObjects];
        v48 = [v47 componentsJoinedByString:@", "];
        [v115 appendFormat:@"\nlast invalid records pushed by client %@:\n\t%@", v46, v48, v100];
      }
      else
      {
        unint64_t v44 = v43;
        v45 = [*(id *)(*(void *)(a1 + 32) + 96) allObjects];
        v46 = objc_msgSend(v45, "subarrayWithRange:", 0, 3);

        v47 = +[CPLDateFormatter stringFromDateAgo:*(void *)(*(void *)(a1 + 32) + 104) now:0];
        v48 = [v46 componentsJoinedByString:@", "];
        [v115 appendFormat:@"\nlast invalid records pushed by client %@:\n\t%@ + %lu more", v47, v48, v44 - 3];
      }

      uint64_t v42 = *(void *)(a1 + 32);
    }
    v49 = [(id)v42 platformObject];
    v104 = [v49 status];

    if (v104)
    {
      v50 = [v104 componentsSeparatedByString:@"\n"];
      v51 = [v50 componentsJoinedByString:@"\n\t"];
      [v115 appendFormat:@"\n%@", v51];
    }
    id v116 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id obj = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v52 = [obj countByEnumeratingWithState:&v129 objects:v140 count:16];
    if (v52)
    {
      id v113 = *(id *)v130;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(id *)v130 != v113) {
            objc_enumerationMutation(obj);
          }
          v54 = *(void **)(*((void *)&v129 + 1) + 8 * v53);
          if ([v54 shouldIncludeInStatus])
          {
            v55 = [v54 name];
            uint64_t v56 = [v54 status];
            v57 = (void *)v56;
            if (v109 == v54)
            {
              uint64_t v133 = 0;
              uint64_t v134 = (uint64_t)&v133;
              uint64_t v135 = 0x2020000000;
              LOBYTE(v136) = 0;
              uint64_t v64 = *(void *)(a1 + 32);
              v65 = *(NSObject **)(v64 + 120);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_2;
              block[3] = &unk_1E60A5CE8;
              block[4] = v64;
              block[5] = &v133;
              dispatch_sync(v65, block);
              v66 = [v108 statusDescription];
              v67 = [v108 queuedDate];
              v68 = [MEMORY[0x1E4F1C9C8] date];
              if (v67)
              {
                if (*(unsigned char *)(v134 + 24))
                {
                  v69 = [v67 dateByAddingTimeInterval:30.0];
                  [v69 timeIntervalSinceDate:v68];
                  if (v70 >= 0.0)
                  {
                    id v75 = [NSString alloc];
                    v72 = +[CPLDateFormatter stringForTimeIntervalAgo:v69 now:v68];
                    uint64_t v73 = [v75 initWithFormat:@"will auto-apply %@", v72];
                  }
                  else
                  {
                    id v71 = [NSString alloc];
                    v72 = +[CPLDateFormatter stringFromDateAgo:v67 now:v68];
                    uint64_t v73 = [v71 initWithFormat:@"%@ - auto-apply overdue", v72];
                  }
                  v74 = (__CFString *)v73;
                }
                else
                {
                  v74 = +[CPLDateFormatter stringFromDateAgo:v67 now:0];
                }
              }
              else if (*(unsigned char *)(v134 + 24))
              {
                v74 = @"no queued date - waiting for auto-apply";
              }
              else
              {
                v74 = @"no queued date";
              }
              if (v57)
              {
                uint64_t v76 = [[NSString alloc] initWithFormat:@"%@\nPending update: %@ - %@", v57, v66, v74];

                v57 = (void *)v76;
              }
              else
              {
                v57 = (void *)[[NSString alloc] initWithFormat:@"Pending update: %@ - %@", v66, v74];
              }

              _Block_object_dispose(&v133, 8);
            }
            else
            {
              uint64_t v58 = *(void *)(a1 + 32);
              if (*(void *)(v58 + 72) && v54 == *(void **)(v58 + 232))
              {
                BOOL v59 = v56 == 0;
                id v60 = [NSString alloc];
                uint64_t v61 = [*(id *)(*(void *)(a1 + 32) + 72) summaryDescription];
                v62 = (void *)v61;
                if (v59)
                {
                  v57 = (void *)[v60 initWithFormat:@"Pending update: waiting for ack of %@", v61];
                }
                else
                {
                  uint64_t v63 = [v60 initWithFormat:@"%@\nPending update: waiting for ack of %@", v57, v61];

                  v57 = (void *)v63;
                }
              }
            }
            if (v57) {
              [v116 setObject:v57 forKey:v55];
            }
          }
          ++v53;
        }
        while (v52 != v53);
        uint64_t v77 = [obj countByEnumeratingWithState:&v129 objects:v140 count:16];
        uint64_t v52 = v77;
      }
      while (v77);
    }

    if ([v116 count])
    {
      [v115 appendString:@"\nstorages:"];
      id v114 = [(id)objc_opt_class() storageNames];
      long long v126 = 0u;
      long long v127 = 0u;
      long long v125 = 0u;
      long long v124 = 0u;
      uint64_t v78 = [v114 countByEnumeratingWithState:&v124 objects:v139 count:16];
      if (v78)
      {
        uint64_t v79 = *(void *)v125;
        do
        {
          for (uint64_t i = 0; i != v78; ++i)
          {
            if (*(void *)v125 != v79) {
              objc_enumerationMutation(v114);
            }
            uint64_t v81 = *(void *)(*((void *)&v124 + 1) + 8 * i);
            v82 = [v116 objectForKeyedSubscript:v81];
            v83 = v82;
            if (v82)
            {
              v84 = [v82 componentsSeparatedByString:@"\n"];
              v85 = [v84 componentsJoinedByString:@"\n\t\t"];
              [v115 appendFormat:@"\n\t%@ = %@", v81, v85];

              [v116 removeObjectForKey:v81];
            }
          }
          uint64_t v78 = [v114 countByEnumeratingWithState:&v124 objects:v139 count:16];
        }
        while (v78);
      }
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      v86 = [v116 allKeys];
      id obja = [v86 sortedArrayUsingSelector:sel_compare_];

      uint64_t v87 = [obja countByEnumeratingWithState:&v120 objects:v138 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v121;
        do
        {
          for (uint64_t j = 0; j != v87; ++j)
          {
            if (*(void *)v121 != v88) {
              objc_enumerationMutation(obja);
            }
            uint64_t v90 = *(void *)(*((void *)&v120 + 1) + 8 * j);
            v91 = [v116 objectForKey:v90];
            v92 = [v91 componentsSeparatedByString:@"\n"];
            v93 = [v92 componentsJoinedByString:@"\n\t\t"];
            [v115 appendFormat:@"\n\t%@ = %@", v90, v93];
          }
          uint64_t v87 = [obja countByEnumeratingWithState:&v120 objects:v138 count:16];
        }
        while (v87);
      }
    }
    uint64_t v94 = *(void *)(a1 + 32);
    v95 = *(void **)(v94 + 24);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_3;
    v117[3] = &unk_1E60A6868;
    v117[4] = v94;
    id v118 = v115;
    id v119 = *(id *)(a1 + 40);
    v96 = v117;
    uint64_t v133 = MEMORY[0x1E4F143A8];
    uint64_t v134 = 3221225472;
    uint64_t v135 = (uint64_t)__cpl_dispatch_async_block_invoke_676;
    v136 = &unk_1E60A6978;
    id v137 = v96;
    id v97 = v115;
    v98 = v95;
    dispatch_block_t v99 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v133);
    dispatch_async(v98, v99);
  }
}

uint64_t __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 112) != 0;
  return result;
}

uint64_t __49__CPLEngineStore_getStatusWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (v2) {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"\nlow-priority transactions: %lu pending", v2);
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (id)componentName
{
  return @"store";
}

- (void)assertNoUnacknowledgedChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_unacknowledgedBatch)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unacknowledgedBatch = self->_unacknowledgedBatch;
        *(_DWORD *)buf = 138412290;
        long long v16 = unacknowledgedBatch;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Store still has an unacknowledged batch %@", buf, 0xCu);
      }
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    [v8 handleFailureInMethod:a2, self, v9, 2268, @"Store still has an unacknowledged batch %@", self->_unacknowledgedBatch object file lineNumber description];
LABEL_14:

    abort();
  }
  id v4 = [(CPLEngineStore *)self platformObject];
  int v5 = [v4 hasStoredChangeSessionUpdate];

  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v10 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = [(CPLEngineStore *)self platformObject];
        uint64_t v12 = [v11 storedChangeSessionUpdate];
        *(_DWORD *)buf = 138412290;
        long long v16 = v12;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Store still has an un-applied session update: %@", buf, 0xCu);
      }
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    uint64_t v13 = [(CPLEngineStore *)self platformObject];
    int v14 = [v13 storedChangeSessionUpdate];
    [v8 handleFailureInMethod:a2, self, v9, 2269, @"Store still has an un-applied session update: %@", v14 object file lineNumber description];

    goto LABEL_14;
  }
}

- (void)assertCanRead
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(CPLEngineStore *)self _canRead])
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = [MEMORY[0x1E4F29060] currentThread];
        id v6 = [(CPLEngineStore *)self _currentTransaction];
        *(_DWORD *)buf = 134218498;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        int v14 = self;
        __int16 v15 = 2112;
        long long v16 = v6;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to read on thread %p in %@ outside of a read transaction (current transaction is %@)", buf, 0x20u);
      }
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    uint64_t v9 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v10 = [(CPLEngineStore *)self _currentTransaction];
    [v7 handleFailureInMethod:a2, self, v8, 2264, @"Trying to read on thread %p in %@ outside of a read transaction (current transaction is %@)", v9, self, v10 object file lineNumber description];

    abort();
  }
}

- (void)assertCanWrite
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(CPLEngineStore *)self _canWrite])
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = [MEMORY[0x1E4F29060] currentThread];
        id v6 = [(CPLEngineStore *)self _currentTransaction];
        *(_DWORD *)buf = 134218498;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        int v14 = self;
        __int16 v15 = 2112;
        long long v16 = v6;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to write on thread %p in %@ outside of a write transaction (current transaction is %@)", buf, 0x20u);
      }
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    uint64_t v9 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v10 = [(CPLEngineStore *)self _currentTransaction];
    [v7 handleFailureInMethod:a2, self, v8, 2260, @"Trying to write on thread %p in %@ outside of a write transaction (current transaction is %@)", v9, self, v10 object file lineNumber description];

    abort();
  }
}

- (BOOL)_canWrite
{
  uint64_t v2 = [(CPLEngineStore *)self _currentTransaction];
  char v3 = [v2 canWrite];

  return v3;
}

- (BOOL)_canRead
{
  uint64_t v2 = [(CPLEngineStore *)self _currentTransaction];
  char v3 = [v2 canRead];

  return v3;
}

- (void)_removeTransactionOnCurrentThread:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  [v13 _transactionDidFinish];
  int v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];
  id v7 = [v6 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];

  if (v7 != v13)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v6 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];
        *(_DWORD *)buf = 138412290;
        __int16 v15 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to remove the wrong transaction on thread: %@", buf, 0xCu);
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    uint64_t v12 = [v6 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];
    [v10 handleFailureInMethod:a2, self, v11, 2243, @"Trying to remove the wrong transaction on thread: %@", v12 object file lineNumber description];

    abort();
  }
  [v6 removeObjectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];
}

- (void)_setTransactionOnCurrentThread:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  int v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];
  id v7 = [v6 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v6 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];
        *(_DWORD *)buf = 138412546;
        id v15 = v13;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to setup a transaction %@ on a thread which already has one: %@", buf, 0x16u);
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    uint64_t v12 = [v6 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];
    [v10 handleFailureInMethod:a2, self, v11, 2234, @"Trying to setup a transaction %@ on a thread which already has one: %@", v13, v12 object file lineNumber description];

    abort();
  }
  [v6 setObject:v13 forKey:@"com.apple.cloudphotolibrary.currenttransaction"];
  [v13 _transactionWillBeginOnThread:v5];
}

- (id)_currentTransaction
{
  uint64_t v2 = [MEMORY[0x1E4F29060] currentThread];
  char v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];

  return v4;
}

- (void)_addCleanupBlock:(id)a3
{
  id v10 = a3;
  int v5 = [(CPLEngineStore *)self _currentTransaction];
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Trying to add a clean-up block while not in a transaction", buf, 2u);
      }
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    [v8 handleFailureInMethod:a2 object:self file:v9 lineNumber:2222 description:@"Trying to add a clean-up block while not in a transaction"];

    abort();
  }
  id v6 = v5;
  [v5 addCleanupBlock:v10];
}

- (NSString)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(CPLEngineStore *)self engineLibrary];
  id v6 = [v5 libraryIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@ %p %@>", v4, self, v6];

  return (NSString *)v7;
}

- (NSString)sharingScopeIdentifier
{
  return self->_sharingScopeIdentifier;
}

- (void)dropSharingScopeIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  sharingScopeIdentifier = self->_sharingScopeIdentifier;
  if (!v4 || !sharingScopeIdentifier)
  {
    if (v4 | (unint64_t)sharingScopeIdentifier) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (objc_msgSend((id)v4, "isEqual:")) {
LABEL_6:
  }
    [(CPLEngineStore *)self _setSharingScopeIdentifier:0];
LABEL_7:
  MEMORY[0x1F41817F8]();
}

- (void)_setSharingScopeIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = (NSString *)a3;
  if (v5
    && ![(CPLEngineStore *)self mainScopeSupportsSharingScopeWithIdentifier:v5])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v12 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [(CPLEngineStore *)self mainScopeIdentifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v5;
        __int16 v22 = 2112;
        long long v23 = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Trying to bind sharing scope %@ with %@", buf, 0x16u);
      }
    }
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    __int16 v16 = [(CPLEngineStore *)self mainScopeIdentifier];
    [v14 handleFailureInMethod:a2, self, v15, 2179, @"Trying to bind sharing scope %@ with %@", v5, v16 object file lineNumber description];

    abort();
  }
  id v6 = self->_sharingScopeIdentifier;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v5;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Setting sharing scope identifier to %{public}@", buf, 0xCu);
    }
  }
  sharingScopeIdentifier = self->_sharingScopeIdentifier;
  self->_sharingScopeIdentifier = v5;
  uint64_t v9 = v5;

  if (!self->_sharingScopeIdentifier)
  {
    id v10 = [(CPLEngineStore *)self engineLibrary];
    [v10 setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:0];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__CPLEngineStore__setSharingScopeIdentifier___block_invoke;
  v17[3] = &unk_1E60AB438;
  uint64_t v18 = v6;
  long long v19 = self;
  BOOL v11 = v6;
  [(CPLEngineStore *)self _addCleanupBlock:v17];
}

void __45__CPLEngineStore__setSharingScopeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v4 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 138543362;
        uint64_t v7 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Resetting sharing scope identifier to %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 32));
  }
}

- (void)markAsCorrupted
{
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Marking the store as corrupted manually", v5, 2u);
    }
  }
  unint64_t v4 = [(CPLEngineStore *)self platformObject];
  [v4 markAsCorrupted];
}

- (void)emergencyClose
{
  id v2 = [(CPLEngineStore *)self platformObject];
  [v2 emergencyClose];
}

- (void)stopVacuum
{
  id v2 = [(CPLEngineStore *)self platformObject];
  [v2 stopVacuum];
}

- (void)startVacuumWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStore *)self platformObject];
  [v5 startVacuumWithCompletionHandler:v4];
}

- (BOOL)canActivateScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CPLEngineStore *)self libraryOptions];
  if ([(CPLEngineStore *)self _canHaveActivatedScope:v6 libraryOptions:v7 error:a4])
  {
    BOOL v8 = +[CPLScopeChange shouldAutoActivateScopeWithType:](CPLScopeChange, "shouldAutoActivateScopeWithType:", [v6 scopeType]);
    BOOL v9 = !v8;
    if (a4 && v8)
    {
      id v10 = [v6 scopeIdentifier];
      BOOL v11 = +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", [v6 scopeType]);
      uint64_t v12 = +[CPLLibraryManager descriptionForLibraryOptions:v7];
      *a4 = +[CPLErrors cplErrorWithCode:38, @"You are not allowed to activate %@ (%@) with these library options (%@)", v10, v11, v12 description];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_canHaveActivatedScope:(id)a3 libraryOptions:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 scopeType];
  if ((unint64_t)(v9 - 2) < 2)
  {
    self = (CPLEngineStore *)((a4 >> 2) & 1);
    if (!a5) {
      goto LABEL_15;
    }
  }
  else if ((unint64_t)(v9 - 4) >= 2)
  {
    if (v9 == 1)
    {
      BOOL v11 = [v8 scopeIdentifier];
      uint64_t v12 = [(CPLEngineStore *)self mainScopeIdentifier];
      char v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        LOBYTE(self) = 1;
        goto LABEL_15;
      }
      self = (CPLEngineStore *)((a4 >> 1) & 1);
      if (!a5) {
        goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(self) = 0;
      if (!a5) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    id v10 = [v8 scopeIdentifier];
    LOBYTE(self) = [(CPLEngineStore *)self mainScopeSupportsSharingScopeWithIdentifier:v10];

    if (!a5) {
      goto LABEL_15;
    }
  }
  if ((self & 1) == 0)
  {
    int v14 = [v8 scopeIdentifier];
    id v15 = +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", [v8 scopeType]);
    __int16 v16 = +[CPLLibraryManager descriptionForLibraryOptions:a4];
    *a5 = +[CPLErrors cplErrorWithCode:38, @"%@ (%@) can't be active with these library options (%@)", v14, v15, v16 description];

    LOBYTE(self) = 0;
  }
LABEL_15:

  return (char)self;
}

- (CPLTransportScopeMapping)transactionTransportScopeMapping
{
  transactionTransportScopeMapping = self->_transactionTransportScopeMapping;
  if (!transactionTransportScopeMapping)
  {
    id v4 = [CPLTransportScopeMapping alloc];
    id v5 = [(CPLEngineStore *)self engineLibrary];
    id v6 = [v5 transport];
    unint64_t v7 = [(CPLTransportScopeMapping *)v4 initWithTranslator:v6];
    id v8 = self->_transactionTransportScopeMapping;
    self->_transactionTransportScopeMapping = v7;

    transactionTransportScopeMapping = self->_transactionTransportScopeMapping;
  }
  return transactionTransportScopeMapping;
}

- (BOOL)syncSessionShouldRequestMoreTime
{
  id v3 = [(CPLEngineScopeStorage *)self->_scopes primaryScope];
  if (v3 && ![(CPLEngineScopeStorage *)self->_scopes valueForFlag:16 forScope:v3])
  {
    if ([(CPLEngineScopeStorage *)self->_scopes hasFinishedInitialDownloadForScope:v3])
    {
      id v6 = [(CPLEngineScopeStorage *)self->_scopes sharingScopeForScope:v3];
      if (v6) {
        BOOL v4 = ![(CPLEngineScopeStorage *)self->_scopes hasFinishedInitialDownloadForScope:v6];
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)predictSyncSessionValue:(id)a3 ofType:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    id v8 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Updating prediction for %@ to %@", (uint8_t *)&v12, 0x16u);
    }
  }
  transactionNewPredictions = self->_transactionNewPredictions;
  if (!transactionNewPredictions)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v11 = self->_transactionNewPredictions;
    self->_transactionNewPredictions = v10;

    transactionNewPredictions = self->_transactionNewPredictions;
  }
  [(NSMutableDictionary *)transactionNewPredictions setObject:v6 forKeyedSubscript:v7];
}

- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineStore *)self platformObject];
  [v8 wipeStoreAtNextOpeningWithReason:v7 completionBlock:v6];
}

- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a4) = [v7 storeDerivativesFilter:v6 error:a4];

  return (char)a4;
}

- (id)derivativesFilter
{
  id v2 = [(CPLEngineStore *)self platformObject];
  id v3 = [v2 derivativesFilter];

  return v3;
}

- (id)localResourceForCloudResource:(id)a3 recordClass:(Class *)a4
{
  id v6 = a3;
  id v7 = [v6 itemScopedIdentifier];
  if (v7)
  {
    char v12 = 0;
    id v8 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifier:v7 isFinal:&v12];
    if (v8)
    {
      uint64_t v9 = [(CPLEngineStore *)self transactionClientCacheView];
      id v10 = objc_msgSend(v9, "resourceOfType:forRecordWithScopedIdentifier:recordClass:error:", objc_msgSend(v6, "resourceType"), v8, a4, 0);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3
{
  id v5 = [(CPLEngineStore *)self platformObject];
  int v6 = [v5 setShouldUpdateDisabledFeaturesWithError:a3];

  if (v6) {
    self->_scheduleDisabledFeatureUpdateOnWriteSuccess = 1;
  }
  return v6;
}

- (BOOL)shouldUpdateDisabledFeatures
{
  id v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 shouldUpdateDisabledFeatures];

  return v3;
}

- (NSArray)disabledFeatures
{
  disabledFeatures = self->_disabledFeatures;
  if (!disabledFeatures)
  {
    BOOL v4 = [(CPLEngineStore *)self _storedDisabledFeatures];
    id v5 = self->_disabledFeatures;
    self->_disabledFeatures = v4;

    disabledFeatures = self->_disabledFeatures;
  }
  if (disabledFeatures) {
    int v6 = disabledFeatures;
  }
  else {
    int v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (BOOL)isFeatureDisabled:(id)a3
{
  id v4 = a3;
  disabledFeatures = self->_disabledFeatures;
  if (!disabledFeatures)
  {
    int v6 = [(CPLEngineStore *)self _storedDisabledFeatures];
    id v7 = self->_disabledFeatures;
    self->_disabledFeatures = v6;

    disabledFeatures = self->_disabledFeatures;
  }
  BOOL v8 = [(NSArray *)disabledFeatures containsObject:v4];

  return v8;
}

- (BOOL)updateDisabledFeatures:(id)a3 didReset:(BOOL *)a4 error:(id *)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v58 = a4;
  *a4 = 0;
  disabledFeatures = self->_disabledFeatures;
  *(_WORD *)&self->_hasUpdatedDisabledFeatures = 257;
  if (!disabledFeatures)
  {
    id v10 = [(CPLEngineStore *)self _storedDisabledFeatures];
    BOOL v11 = self->_disabledFeatures;
    self->_disabledFeatures = v10;
  }
  v66 = self;
  char v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    char v12 = v8;
  }
  BOOL v59 = v12;
  id v13 = v12;

  __int16 v14 = (void *)[v13 mutableCopy];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  p_disabledFeatures = &self->_disabledFeatures;
  uint64_t v16 = self->_disabledFeatures;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v84 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        uint64_t v22 = [v14 indexOfObject:v21];
        if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
          [v15 addObject:v21];
        }
        else {
          [v14 removeObjectAtIndex:v22];
        }
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v18);
  }

  if (![v15 count] && !objc_msgSend(v14, "count"))
  {
    id v36 = 0;
    v69 = 0;
    v67 = 0;
    v47 = v66;
    goto LABEL_72;
  }
  if ([v15 count])
  {
    if (!_CPLSilentLogging)
    {
      long long v23 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v15 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v24;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "Features re-enabled: %@", buf, 0xCu);
      }
    }
    uint64_t v61 = a5;
    id v62 = v13;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v15;
    uint64_t v25 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      uint64_t v64 = *(void *)v80;
      uint64_t v27 = 1;
      v28 = v66;
LABEL_24:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v80 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v79 + 1) + 8 * v29);
        v31 = (void *)MEMORY[0x1BA993DF0]();
        id v32 = +[CPLFeature featureWithName:v30];
        v33 = v32;
        if (v32)
        {
          id v78 = v68;
          uint64_t v34 = [v32 enableFeatureInStore:v28 error:&v78];
          id v35 = v78;

          v68 = v35;
        }
        else
        {
          uint64_t v34 = v27;
        }
        uint64_t v27 = v34;
        if ((v34 & 1) == 0) {
          goto LABEL_66;
        }
        v28 = v66;
        if (v66->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate && !v69) {
          v69 = (void *)[[NSString alloc] initWithFormat:@"%@ has been re-enabled", v30];
        }
        if (v66->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate && !v67) {
          v67 = (void *)[[NSString alloc] initWithFormat:@"%@ has been re-enabled", v30];
        }

        if (v26 == ++v29)
        {
          uint64_t v26 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
          if (v26) {
            goto LABEL_24;
          }
          goto LABEL_42;
        }
      }
    }
    v68 = 0;
    v69 = 0;
    v67 = 0;
    uint64_t v27 = 1;
LABEL_42:

    a5 = v61;
    id v13 = v62;
    id v36 = v68;
  }
  else
  {
    id v36 = 0;
    v69 = 0;
    v67 = 0;
    uint64_t v27 = 1;
  }
  if (![v14 count]) {
    goto LABEL_69;
  }
  if (!_CPLSilentLogging)
  {
    v37 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [v14 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412290;
      uint64_t v90 = v38;
      _os_log_impl(&dword_1B4CAC000, v37, OS_LOG_TYPE_DEFAULT, "Features disabled: %@", buf, 0xCu);
    }
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v14;
  uint64_t v39 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    v68 = v36;
    uint64_t v61 = a5;
    id v62 = v13;
    uint64_t v65 = *(void *)v75;
    v41 = v66;
LABEL_50:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v75 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v43 = *(void *)(*((void *)&v74 + 1) + 8 * v42);
      v31 = (void *)MEMORY[0x1BA993DF0]();
      unint64_t v44 = +[CPLFeature featureWithName:v43];
      v33 = v44;
      if (v44)
      {
        id v73 = v68;
        uint64_t v45 = [v44 disableFeatureInStore:v41 error:&v73];
        id v46 = v73;

        v68 = v46;
      }
      else
      {
        uint64_t v45 = v27;
      }
      uint64_t v27 = v45;
      if ((v45 & 1) == 0) {
        break;
      }
      v41 = v66;
      if (v66->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate && !v69) {
        v69 = (void *)[[NSString alloc] initWithFormat:@"%@ has been disabled", v43];
      }
      if (v66->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate && !v67) {
        v67 = (void *)[[NSString alloc] initWithFormat:@"%@ has been disabled", v43];
      }

      if (v40 == ++v42)
      {
        uint64_t v40 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
        if (v40) {
          goto LABEL_50;
        }
        goto LABEL_67;
      }
    }
LABEL_66:

LABEL_67:
    a5 = v61;
    id v13 = v62;
    id v36 = v68;
  }

LABEL_69:
  v47 = v66;
  v48 = [(CPLEngineStore *)v66 engineLibrary];
  [v48 updateDisabledFeatures:v13];

  if ((v27 & 1) == 0) {
    goto LABEL_79;
  }
LABEL_72:
  v49 = v36;
  v50 = [(CPLEngineStore *)v47 platformObject];
  id v72 = v36;
  int v51 = [v50 storeDisabledFeatures:v13 error:&v72];
  id v36 = v72;

  if (!v51)
  {
LABEL_79:
    char v53 = 0;
    v47->_isUpdatingDisabledFeatures = 0;
    goto LABEL_87;
  }
  objc_storeStrong((id *)p_disabledFeatures, v59);
  v47->_isUpdatingDisabledFeatures = 0;
  if (v47->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v52 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v69;
        _os_log_impl(&dword_1B4CAC000, v52, OS_LOG_TYPE_ERROR, "Triggering complete reset sync now because %@", buf, 0xCu);
      }
    }
    *uint64_t v58 = 1;
    id v71 = v36;
    v47 = v66;
    char v53 = [(CPLEngineStore *)v66 resetCompleteSyncStateWithCause:v69 error:&v71];
    v54 = v71;
  }
  else
  {
    if (!v47->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate)
    {
      *(_WORD *)&v47->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate = 0;
      char v53 = 1;
      goto LABEL_90;
    }
    if (!_CPLSilentLogging)
    {
      v55 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v69;
        _os_log_impl(&dword_1B4CAC000, v55, OS_LOG_TYPE_ERROR, "Triggering complete reset sync now because %@", buf, 0xCu);
      }
    }
    *uint64_t v58 = 1;
    id v70 = v36;
    v47 = v66;
    char v53 = [(CPLEngineStore *)v66 resetLocalSyncStateWithCause:v67 error:&v70];
    v54 = v70;
  }
  id v56 = v54;

  id v36 = v56;
LABEL_87:
  *(_WORD *)&v47->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate = 0;
  if (a5 && (v53 & 1) == 0)
  {
    id v36 = v36;
    char v53 = 0;
    *a5 = v36;
  }
LABEL_90:

  return v53;
}

- (id)_storedDisabledFeatures
{
  id v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 disabledFeatures];

  return v3;
}

- (BOOL)hasUnacknowledgedChanges
{
  if ([(CPLChangeBatch *)self->_unacknowledgedBatch count]) {
    return 1;
  }
  id v4 = [(CPLEngineStore *)self platformObject];
  char v5 = [v4 hasStoredChangeSessionUpdate];

  return v5;
}

- (id)unacknowledgedChangeWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  unacknowledgedBatch = self->_unacknowledgedBatch;
  if (unacknowledgedBatch)
  {
    int v6 = [(CPLChangeBatch *)unacknowledgedBatch recordWithScopedIdentifier:v4];
  }
  else
  {
    id v7 = [(CPLEngineStore *)self platformObject];
    id v8 = [v7 storedChangeSessionUpdate];

    if (v8)
    {
      int v6 = [v8 pendingRecordChangeForClientCacheWithLocalScopedIdentifier:v4];
    }
    else
    {
      int v6 = 0;
    }
  }
  return v6;
}

- (void)dropUnacknowledgedBatch
{
  unacknowledgedBatch = self->_unacknowledgedBatch;
  self->_unacknowledgedBatch = 0;

  [(CPLEngineStore *)self _dropTransactionClientCacheView];
  self->_discardUnacknowledgedBatchOnTransactionFail = 0;
}

- (void)keepUnacknowledgedBatch:(id)a3
{
  self->_discardUnacknowledgedBatchOnTransactionFail = 1;
}

- (BOOL)checkExpectedLibraryVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStore *)self libraryVersion];
  char v8 = [v7 isEqualToString:v6];

  if (a4 && (v8 & 1) == 0)
  {
    *a4 = +[CPLErrors invalidClientCacheErrorWithReason:@"Client cache has been reset during session"];
  }

  return v8;
}

- (BOOL)hasPendingChangeSessionUpdate
{
  id v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 hasStoredChangeSessionUpdate];

  return v3;
}

- (BOOL)forceApplyPendingChangeSessionUpdateWithError:(id *)a3
{
  if (!self->_applyingChangeSessionUpdate)
  {
    id v6 = (void *)MEMORY[0x1BA993DF0]();
    id v7 = [(CPLEngineStore *)self platformObject];
    char v8 = [v7 storedChangeSessionUpdate];

    if (v8)
    {
      id v12 = 0;
      BOOL v9 = [(CPLEngineStore *)self _applyAndDiscardPendingUpdate:v8 error:&v12];
      id v10 = v12;
      if (!v9)
      {

        if (a3)
        {
          id v10 = v10;
          BOOL v3 = 0;
          *a3 = v10;
        }
        else
        {
          BOOL v3 = 0;
        }
        goto LABEL_11;
      }
      [(CPLEngineStore *)self _unschedulePendingUpdateApply];
    }
    else
    {
      id v10 = 0;
    }

    BOOL v3 = 1;
LABEL_11:

    return v3;
  }
  return 1;
}

- (BOOL)applyPreviousChangeSessionUpdateWithExpectedLibraryVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_dontDelayChangeSessionUpdate)
  {
    BOOL v7 = [(CPLEngineStore *)self checkExpectedLibraryVersion:v6 error:a4];
  }
  else
  {
    char v8 = (void *)MEMORY[0x1BA993DF0]();
    BOOL v9 = [(CPLEngineStore *)self platformObject];
    id v10 = [v9 storedChangeSessionUpdate];

    if (v10)
    {
      id v17 = 0;
      BOOL v11 = [(CPLEngineStore *)self _applyAndDiscardPendingUpdate:v10 error:&v17];
      id v12 = v17;
      if (v11)
      {
        [(CPLEngineStore *)self _unschedulePendingUpdateApply];
        id v16 = v12;
        BOOL v7 = [(CPLEngineStore *)self storeClientIsInSyncWithClientCacheWithError:&v16];
        id v13 = v16;

        id v12 = v13;
      }
      else
      {
        +[CPLResetTracker registerLikelyResetReason:@"Failed to apply delayed update (%@) to client cache", objc_opt_class()];
        BOOL v7 = 0;
      }
    }
    else
    {
      id v15 = 0;
      BOOL v7 = [(CPLEngineStore *)self checkExpectedLibraryVersion:v6 error:&v15];
      id v12 = v15;
    }

    if (a4 && !v7) {
      *a4 = v12;
    }
  }
  return v7;
}

- (BOOL)beginChangeSession:(id)a3 withLibraryVersion:(id)a4 resetTracker:(id)a5 error:(id *)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  BOOL v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (_CPLDontDelayChangeSessionUpdate)
  {
    self->_dontDelayChangeSessionUpdate = 1;
  }
  else
  {
    __int16 v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    self->_dontDelayChangeSessionUpdate = [v14 BOOLForKey:@"CPLDontDelayChangeSessionUpdate"];
  }
  p_pendingTracker = (id *)&self->_pendingTracker;
  pendingTracker = self->_pendingTracker;
  if (pendingTracker)
  {
    id v17 = [(CPLResetTracker *)pendingTracker likelyResetDate];
    [v17 timeIntervalSinceNow];
    if (v18 < -60.0)
    {
      id v19 = *p_pendingTracker;
      id *p_pendingTracker = 0;
    }
  }
  SEL v84 = a2;
  if (v12)
  {
    uint64_t v20 = [(CPLEngineStore *)self libraryVersion];
    if (!v20)
    {
      if (!_CPLSilentLogging)
      {
        long long v74 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v74, OS_LOG_TYPE_ERROR, "Library version should be set here", buf, 2u);
        }
      }
      long long v75 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v76 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
      [v75 handleFailureInMethod:a2 object:self file:v76 lineNumber:1733 description:@"Library version should be set here"];

      abort();
    }
    uint64_t v21 = v20;
    if (!_CPLSilentLogging)
    {
      uint64_t v22 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v87 = v12;
        __int16 v88 = 2112;
        v89 = v21;
        __int16 v90 = 2112;
        v91 = v11;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEBUG, "Checking client version %@ against our own version %@ during %@", buf, 0x20u);
      }
    }
    long long v23 = v11;
    char v24 = [v21 isEqualToString:v12];
    uint64_t v25 = [(CPLEngineStore *)self platformObject];
    uint64_t v26 = [v25 storedChangeSessionUpdate];

    if (v24)
    {
      uint64_t v27 = a6;
      if (!v26)
      {
        uint64_t v42 = v23;
        if (!_CPLSilentLogging)
        {
          v57 = __CPLStoreOSLogDomain_2929();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v87 = v12;
            __int16 v88 = 2112;
            v89 = v23;
            _os_log_impl(&dword_1B4CAC000, v57, OS_LOG_TYPE_DEBUG, "Client has the correct version (%@). Starting %@", buf, 0x16u);
          }
        }
        BOOL v58 = [(CPLEngineStore *)self storeClientIsInSyncWithClientCacheWithError:a6];

        int v40 = 0;
        BOOL v41 = 0;
        if (!v58) {
          goto LABEL_87;
        }
        goto LABEL_68;
      }
      if (!_CPLSilentLogging)
      {
        v28 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [v26 libraryVersion];
          *(_DWORD *)buf = 138412802;
          id v87 = v12;
          __int16 v88 = 2112;
          v89 = v29;
          __int16 v90 = 2112;
          v91 = v23;
          _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_ERROR, "Client has an incorrect version (%@) but it matches the previous version, discarding lost pending update (%@). Recovering %@", buf, 0x20u);

          uint64_t v27 = a6;
        }
      }
      if ([v26 discardFromStore:self error:v27])
      {
        BOOL v30 = [(CPLEngineStore *)self _storeChangeSessionUpdate:0 error:v27];
        [(CPLEngineStore *)self _unschedulePendingUpdateApply];

        if (!v30) {
          goto LABEL_76;
        }
        goto LABEL_37;
      }
      goto LABEL_75;
    }
    if (v26)
    {
      uint64_t v43 = [v26 libraryVersion];
      int v44 = [v12 isEqualToString:v43];

      if (v44)
      {
        uint64_t v27 = a6;
        if (!_CPLSilentLogging)
        {
          uint64_t v45 = __CPLStoreOSLogDomain_2929();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v87 = v12;
            __int16 v88 = 2112;
            v89 = v23;
            _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_ERROR, "Client has the correct version (%@) after an unfinished session. Recovering %@", buf, 0x16u);
          }
        }
        if ([(CPLEngineStore *)self _applyAndDiscardPendingUpdate:v26 error:a6])
        {
          [(CPLEngineStore *)self _unschedulePendingUpdateApply];

LABEL_37:
          BOOL v46 = [(CPLEngineStore *)self storeClientIsInSyncWithClientCacheWithError:v27];

          uint64_t v42 = v23;
          if (!v46) {
            goto LABEL_77;
          }
          int v40 = 1;
          goto LABEL_68;
        }
        +[CPLResetTracker registerLikelyResetReason:@"Failed to apply delayed update (%@) to client cache", objc_opt_class()];
LABEL_75:

LABEL_76:
        uint64_t v42 = v23;
LABEL_77:
        if (v27)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v21 = __CPLStoreOSLogDomain_2929();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v69 = *v27;
              *(_DWORD *)buf = 138412290;
              id v87 = v69;
              id v70 = "Failed to recover mismatched session: %@";
              id v71 = v21;
              uint32_t v72 = 12;
LABEL_84:
              _os_log_impl(&dword_1B4CAC000, v71, OS_LOG_TYPE_ERROR, v70, buf, v72);
              goto LABEL_85;
            }
            goto LABEL_85;
          }
        }
        else if (!_CPLSilentLogging)
        {
          uint64_t v21 = __CPLStoreOSLogDomain_2929();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            id v70 = "Failed to recover mismatched session";
            id v71 = v21;
            uint32_t v72 = 2;
            goto LABEL_84;
          }
LABEL_85:
          BOOL v41 = 0;
LABEL_86:

          goto LABEL_87;
        }
        BOOL v41 = 0;
        goto LABEL_87;
      }
      if (!_CPLSilentLogging)
      {
        BOOL v59 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          id v60 = [v26 libraryVersion];
          *(_DWORD *)buf = 138412802;
          id v87 = v12;
          __int16 v88 = 2112;
          v89 = v21;
          __int16 v90 = 2112;
          v91 = v60;
          _os_log_impl(&dword_1B4CAC000, v59, OS_LOG_TYPE_ERROR, "Client has an incorrect version (%@) - current version is (%@) and pending version is (%@). Client will have to perform a reset sync", buf, 0x20u);
        }
LABEL_63:
      }
    }
    else if (!_CPLSilentLogging)
    {
      BOOL v59 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v87 = v12;
        __int16 v88 = 2112;
        v89 = v21;
        _os_log_impl(&dword_1B4CAC000, v59, OS_LOG_TYPE_ERROR, "Client has an incorrect version (%@) - current version is (%@). Client will have to perform a reset sync", buf, 0x16u);
      }
      goto LABEL_63;
    }
    if (a6)
    {
      *a6 = +[CPLErrors versionMismatchError];
    }
    +[CPLResetTracker registerLikelyResetReason:@"version mismatch during %@", v23];

    uint64_t v42 = v23;
    goto LABEL_85;
  }
  id v31 = [NSString alloc];
  long long v83 = v11;
  id v32 = [(id)objc_opt_class() shortDescription];
  v33 = (void *)[v31 initWithFormat:@"client library version reset in a %@ session", v32];

  if (([v13 hasReasons] & 1) == 0 && *p_pendingTracker)
  {
    id v34 = *p_pendingTracker;

    id v13 = v34;
  }
  id v35 = [(CPLEngineStore *)self platformObject];
  int v36 = [v35 isClientInSyncWithClientCache];

  if (v36)
  {
    v37 = [v13 likelyResetReasonWithImmediateReason:v33];
    v38 = [v13 likelyResetDate];
    BOOL v39 = [(CPLEngineStore *)self resetLocalSyncStateWithCause:v37 date:v38 error:a6];

    int v40 = 0;
    BOOL v41 = 0;
    uint64_t v42 = v83;
    if (!v39) {
      goto LABEL_87;
    }
  }
  else
  {
    v47 = [(CPLEngineStore *)self platformObject];
    v48 = [v47 storedChangeSessionUpdate];

    if (v48)
    {
      id v82 = v13;
      if (!_CPLSilentLogging)
      {
        v49 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = [v13 likelyResetReasonWithImmediateReason:v33];
          *(_DWORD *)buf = 138412290;
          id v87 = v50;
          _os_log_impl(&dword_1B4CAC000, v49, OS_LOG_TYPE_ERROR, "Client is resetting library version but we are already out of sync - we still need to discard a pending update (%@)", buf, 0xCu);
        }
      }
      id v85 = 0;
      char v51 = [v48 discardFromStore:self error:&v85];
      uint64_t v52 = v85;
      if ((v51 & 1) == 0 && !_CPLSilentLogging)
      {
        char v53 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v87 = v54;
          __int16 v88 = 2112;
          v89 = v52;
          id v55 = v54;
          _os_log_impl(&dword_1B4CAC000, v53, OS_LOG_TYPE_ERROR, "Failed to cleanly discard pending update (%@): %@", buf, 0x16u);
        }
      }
      BOOL v56 = [(CPLEngineStore *)self _storeChangeSessionUpdate:0 error:a6];

      int v40 = 0;
      BOOL v41 = 0;
      id v13 = v82;
      uint64_t v42 = v83;
      if (!v56) {
        goto LABEL_87;
      }
    }
    else
    {

      int v40 = 0;
      uint64_t v42 = v83;
    }
  }
LABEL_68:
  uint64_t v61 = [(CPLEngineStore *)self platformObject];
  int v62 = [v61 hasStoredChangeSessionUpdate];

  if (v62)
  {
    if (!_CPLSilentLogging)
    {
      long long v77 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        id v78 = [(id)objc_opt_class() shortDescription];
        *(_DWORD *)buf = 138412290;
        id v87 = v78;
        _os_log_impl(&dword_1B4CAC000, v77, OS_LOG_TYPE_ERROR, "A %@ session should always start with not pending updates", buf, 0xCu);
      }
    }
    long long v79 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    long long v81 = [(id)objc_opt_class() shortDescription];
    [v79 handleFailureInMethod:v84, self, v80, 1803, @"A %@ session should always start with not pending updates", v81 object file lineNumber description];

    abort();
  }
  if (v40)
  {
    id v63 = [NSString alloc];
    uint64_t v64 = v42;
    uint64_t v65 = [(id)objc_opt_class() shortDescription];
    uint64_t v21 = [v63 initWithFormat:@"client library version reset in a %@ session", v65];

    v66 = [(CPLEngineStore *)self mainScopeIdentifier];
    v67 = [v13 likelyResetDate];
    v68 = [v13 likelyResetReasonWithImmediateReason:v21];
    [(CPLEngineStore *)self _storeResetEvent:@"recover" scopeIdentifier:v66 date:v67 pending:0 cause:v68];

    if ([v13 hasReasons]) {
      objc_storeStrong((id *)&self->_pendingTracker, v13);
    }
    BOOL v41 = 1;
    uint64_t v42 = v64;
    goto LABEL_86;
  }
  BOOL v41 = 1;
LABEL_87:

  return v41;
}

- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = v7;
  if (self->_dontDelayChangeSessionUpdate)
  {
    if (![v7 applyToStore:self error:a4])
    {
      BOOL v12 = 0;
      goto LABEL_8;
    }
    BOOL v9 = [(CPLEngineStore *)self storeClientIsInSyncWithClientCacheWithError:a4];
  }
  else
  {
    id v10 = [(CPLEngineStore *)self platformObject];
    int v11 = [v10 hasStoredChangeSessionUpdate];

    if (v11)
    {
      if (!_CPLSilentLogging)
      {
        __int16 v14 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = [(CPLEngineStore *)self platformObject];
          id v16 = [v15 storedChangeSessionUpdate];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v8;
          __int16 v23 = 2112;
          char v24 = v16;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Trying to store %@ while %@ is already stored", buf, 0x16u);
        }
      }
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      double v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
      id v19 = [(CPLEngineStore *)self platformObject];
      uint64_t v20 = [v19 storedChangeSessionUpdate];
      [v17 handleFailureInMethod:a2, self, v18, 1713, @"Trying to store %@ while %@ is already stored", v8, v20 object file lineNumber description];

      abort();
    }
    [(CPLEngineStore *)self _schedulePendingUpdateApply];
    BOOL v9 = [(CPLEngineStore *)self _storeChangeSessionUpdate:v8 error:a4];
  }
  BOOL v12 = v9;
LABEL_8:

  return v12;
}

- (BOOL)_storeChangeSessionUpdate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(CPLEngineStore *)self _dropTransactionClientCacheView];
  id v7 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a4) = [v7 storeChangeSessionUpdate:v6 error:a4];

  return (char)a4;
}

- (NSArray)pushPullGatekeepers
{
  id v2 = [(CPLEngineStore *)self platformObject];
  BOOL v3 = [v2 pushPullGatekeepers];

  return (NSArray *)v3;
}

- (BOOL)clearAllPushPullGatekeepersWithError:(id *)a3
{
  id v4 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a3) = [v4 storePushPullGatekeepers:0 error:a3];

  return (char)a3;
}

- (BOOL)addPushPullGatekeeper:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CPLEngineStore *)self platformObject];
  char v8 = [v7 pushPullGatekeepers];

  uint64_t v9 = [v8 count];
  id v10 = [(CPLEngineStore *)self platformObject];
  if (v9)
  {
    uint64_t v11 = [v8 arrayByAddingObject:v6];
  }
  else
  {
    v15[0] = v6;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  BOOL v12 = (void *)v11;

  char v13 = [v10 storePushPullGatekeepers:v12 error:a4];
  return v13;
}

- (void)_dropTransactionClientCacheView
{
  if (self->_transactionClientCacheView)
  {
    self->_transactionClientCacheView = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (void)_unschedulePendingUpdateApply
{
  if (self->_schedulePendingUpdateApplyOnWriteSuccess) {
    self->_schedulePendingUpdateApplyOnWriteSuccess = 0;
  }
  self->_unschedulePendingUpdateApplyOnWriteSuccess = 1;
}

- (void)_schedulePendingUpdateApply
{
  if (self->_unschedulePendingUpdateApplyOnWriteSuccess) {
    self->_unschedulePendingUpdateApplyOnWriteSuccess = 0;
  }
  self->_schedulePendingUpdateApplyOnWriteSuccess = 1;
}

- (void)_reallyUnschedulePendingUpdateApply
{
  self->_pendingUpdateInterval = 0.0;
  pendingUpdateQueue = self->_pendingUpdateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CPLEngineStore__reallyUnschedulePendingUpdateApply__block_invoke;
  block[3] = &unk_1E60A5DD8;
  block[4] = self;
  dispatch_sync(pendingUpdateQueue, block);
}

void __53__CPLEngineStore__reallyUnschedulePendingUpdateApply__block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = 0;
  }
}

- (void)_reallySchedulePendingUpdateApply
{
  double pendingUpdateInterval = self->_pendingUpdateInterval;
  double v3 = 30.0;
  if (pendingUpdateInterval > 0.0)
  {
    if (pendingUpdateInterval <= 30.0) {
      double v3 = self->_pendingUpdateInterval;
    }
    self->_double pendingUpdateInterval = 0.0;
  }
  pendingUpdateQueue = self->_pendingUpdateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke;
  v5[3] = &unk_1E60A6598;
  v5[4] = self;
  *(double *)&void v5[5] = v3;
  dispatch_sync(pendingUpdateQueue, v5);
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(v2 + 112);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v2 + 120));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_2;
  v10[3] = &unk_1E60A6728;
  v10[4] = *(void *)(a1 + 32);
  char v5 = v4;
  uint64_t v11 = v5;
  dispatch_source_set_event_handler(v5, v10);
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)(a1 + 40));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_resume(v5);
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 112);
  *(void *)(v7 + 112) = v5;
  uint64_t v9 = v5;
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[14];
  if (v2 == *(void **)(a1 + 40))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_3;
    v4[3] = &unk_1E60AB550;
    v4[4] = v1;
    id v5 = v2;
    id v3 = (id)[v1 performWriteTransactionWithBlock:v4 completionHandler:&__block_literal_global_329];
  }
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_4;
  block[3] = &unk_1E60AA830;
  block[4] = v4;
  id v21 = *(id *)(a1 + 40);
  uint64_t v22 = &v23;
  dispatch_sync(v5, block);
  if (*((unsigned char *)v24 + 24))
  {
    dispatch_time_t v6 = [v3 error];
    BOOL v7 = v6 == 0;

    if (v7)
    {
      char v8 = [*(id *)(a1 + 32) platformObject];
      uint64_t v9 = [v8 storedChangeSessionUpdate];

      if (v9)
      {
        id v10 = *(void **)(a1 + 32);
        id v19 = 0;
        int v11 = [v10 _applyPendingUpdate:v9 error:&v19];
        id v12 = v19;
        if (v11)
        {
          if (!_CPLSilentLogging)
          {
            char v13 = __CPLStoreOSLogDomain_2929();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              __int16 v14 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v28 = v14;
              id v15 = v14;
              _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Applied pending update %@ automatically because client did not do it", buf, 0xCu);
            }
          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            id v16 = __CPLStoreOSLogDomain_2929();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v28 = v17;
              __int16 v29 = 2112;
              id v30 = v12;
              id v18 = v17;
              _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Failed to apply pending update %@ automatically because client did not do it: %@", buf, 0x16u);
            }
          }
          [v3 setError:v12];
        }
      }
    }
  }

  _Block_object_dispose(&v23, 8);
}

void __51__CPLEngineStore__reallySchedulePendingUpdateApply__block_invoke_4(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 112);
  if (v2 == (void *)a1[5])
  {
    *(void *)(v1 + 112) = 0;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)_applyPendingUpdate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v18 = 0;
  BOOL v7 = [(CPLEngineStore *)self _applyAndDiscardPendingUpdate:v6 error:&v18];
  id v8 = v18;
  uint64_t v9 = v8;
  if (!v7)
  {
    if ([v8 isCPLErrorWithCode:20]
      && ([v9 userInfo],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 objectForKeyedSubscript:@"CPLErrorResetReason"],
          int v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          v11))
    {
      uint64_t v12 = [[NSString alloc] initWithFormat:@"Failed to apply delayed update (%@) to client cache: %@", objc_opt_class(), v11, v17];
    }
    else
    {
      id v13 = [NSString alloc];
      uint64_t v14 = objc_opt_class();
      int v11 = [v9 domain];
      uint64_t v12 = [v13 initWithFormat:@"Failed to apply delayed update (%@) to client cache (%@/%ld)", v14, v11, objc_msgSend(v9, "code")];
    }
    id v15 = (void *)v12;

    if (a4) {
      *a4 = v9;
    }
    +[CPLResetTracker registerLikelyResetReason:@"%@", v15];
  }
  return v7;
}

- (BOOL)_applyAndDiscardPendingUpdate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  LOBYTE(v8) = 1;
  if (!self->_applyingChangeSessionUpdate)
  {
    self->_applyingChangeSessionUpdate = 1;
    id v14 = 0;
    int v8 = [v6 applyToStore:self error:&v14];
    id v9 = v14;
    id v10 = v9;
    if (v8)
    {
      id v13 = v9;
      LOBYTE(v8) = [(CPLEngineStore *)self _storeChangeSessionUpdate:0 error:&v13];
      id v11 = v13;

      id v10 = v11;
    }
    if (a4 && (v8 & 1) == 0) {
      *a4 = v10;
    }
    self->_applyingChangeSessionUpdate = 0;
  }
  return v8;
}

- (void)notePushRepositoryStoredSomeChanges
{
  if (self->_transactionClientCacheView)
  {
    if (!self->_transactionClientCacheViewHasPushRepository) {
      [(CPLEngineStore *)self _dropTransactionClientCacheView];
    }
  }
}

- (CPLRecordStorageView)transactionClientCacheView
{
  transactionClientCacheView = self->_transactionClientCacheView;
  if (!transactionClientCacheView)
  {
    uint64_t v4 = [(CPLEngineStore *)self newClientCacheViewUsesPushRepository:&self->_transactionClientCacheViewHasPushRepository];
    id v5 = self->_transactionClientCacheView;
    self->_transactionClientCacheView = v4;

    transactionClientCacheView = self->_transactionClientCacheView;
  }
  return transactionClientCacheView;
}

- (BOOL)shouldGenerateDerivatives
{
  return [(CPLEngineDerivativesCache *)self->_derivativesCache derivativeGeneratorClass] != 0;
}

- (id)corruptionInfo
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  id v3 = [v2 corruptionInfo];

  return v3;
}

- (NSDate)libraryCreationDate
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  id v3 = [v2 libraryCreationDate];

  return (NSDate *)v3;
}

- (BOOL)isClientInSyncWithClientCache
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 isClientInSyncWithClientCache];

  return v3;
}

- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3
{
  uint64_t v4 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a3) = [v4 storeClientIsInSyncWithClientCacheWithError:a3];

  return (char)a3;
}

- (id)clientCacheIdentifier
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 clientCacheIdentifier];

  return v3;
}

- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a4) = [v7 storeLastQuarantineCountReportDate:v6 error:a4];

  return (char)a4;
}

- (id)lastQuarantineCountReportDate
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 lastQuarantineCountReportDate];

  return v3;
}

- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineStore *)self platformObject];
  int v8 = [v7 storeUserIdentifier:v6 error:a4];

  if (!v6 && v8) {
    self->_scheduleSetupOnWriteSuccess = 1;
  }
  return v8;
}

- (id)userIdentifier
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 userIdentifier];

  return v3;
}

- (BOOL)pushRepositoryIsFull
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v3 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        pushRepository = self->_pushRepository;
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) scopeIdentifier];
        LOBYTE(pushRepository) = [(CPLEnginePushRepository *)pushRepository hasChangesInScopeWithIdentifier:v9];

        if (pushRepository)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)createNewLibraryVersion
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 createNewLibraryVersion];

  return v3;
}

- (id)libraryVersion
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  char v3 = [v2 libraryVersion];

  return v3;
}

- (BOOL)shouldSyncScopeList
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  shouldSyncScopeListQueue = self->_shouldSyncScopeListQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CPLEngineStore_shouldSyncScopeList__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(shouldSyncScopeListQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__CPLEngineStore_shouldSyncScopeList__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 172);
  return result;
}

- (void)_updateShouldSyncScopeList:(BOOL)a3
{
  shouldSyncScopeListQueue = self->_shouldSyncScopeListQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CPLEngineStore__updateShouldSyncScopeList___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(shouldSyncScopeListQueue, v4);
}

uint64_t __45__CPLEngineStore__updateShouldSyncScopeList___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 172))
  {
    if (*(unsigned char *)(result + 40)) {
      *(unsigned char *)(v1 + 152) = 1;
    }
  }
  return result;
}

- (BOOL)_shouldSyncScopeListWithOptions:(unint64_t)a3
{
  return a3 != 0;
}

- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  BOOL v7 = [(CPLEngineStore *)self platformObject];
  int v8 = [v7 updateLibraryOptions:a3 error:a4];

  if (v8) {
    [(CPLEngineStore *)self _updateShouldSyncScopeList:[(CPLEngineStore *)self _shouldSyncScopeListWithOptions:a3]];
  }
  return v8;
}

- (unint64_t)libraryOptions
{
  uint64_t v2 = [(CPLEngineStore *)self platformObject];
  unint64_t v3 = [v2 libraryOptions];

  return v3;
}

- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a4) = [v7 storeLibraryVersion:v6 withError:a4];

  return (char)a4;
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__CPLEngineStore_closeAndDeactivate_completionHandler___block_invoke;
    v8[3] = &unk_1E60AA2D8;
    v8[4] = self;
    char v10 = 1;
    id v9 = v6;
    [(CPLEngineStore *)self wipeStoreAtNextOpeningWithReason:@"wiping database because it has been marked as deactivated" completionBlock:v8];
  }
  else
  {
    [(CPLEngineStore *)self _closeAndDeactivate:0 completionHandler:v6];
  }
}

uint64_t __55__CPLEngineStore_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeAndDeactivate:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(CPLEngineStore *)self state] == 2)
  {
    [(CPLEngineStore *)self setState:3];
    id v7 = [[CPLEngineStoreTransaction alloc] initForWrite:1 store:self identifier:@"cpl.store.close" description:@"close store"];
    if (!_CPLSilentLogging)
    {
      int v8 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [(CPLEngineStore *)self platformObject];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Closing concrete store: %@", buf, 0xCu);
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke;
    v12[3] = &unk_1E60A6528;
    v12[4] = self;
    id v13 = v7;
    BOOL v15 = a3;
    id v14 = v6;
    id v10 = v7;
    [(CPLEngineStore *)self _performBarrierTransaction:v10 withBlock:v12];
  }
  else
  {
    id v11 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Library is not open"];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

void __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60AA350;
  char v7 = *(unsigned char *)(a1 + 56);
  v5[4] = v3;
  id v6 = v2;
  [v3 _performTransaction:v6 withBlock:v5];
  [*(id *)(a1 + 32) _unschedulePendingUpdateApply];
  [*(id *)(a1 + 32) _commitWriteTransaction:*(void *)(a1 + 40) commitError:0];
  BOOL v4 = [*(id *)(a1 + 40) error];
  [*(id *)(a1 + 32) setState:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) _releaseDirty];
}

uint64_t __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v3 = @"Deactivating";
      if (!*(unsigned char *)(a1 + 48)) {
        unint64_t v3 = @"Closing";
      }
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ all storages: %@", buf, 0x16u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_314;
  v7[3] = &unk_1E60A6DE0;
  char v8 = *(unsigned char *)(a1 + 48);
  BOOL v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  return [v5 do:v7];
}

uint64_t __56__CPLEngineStore__closeAndDeactivate_completionHandler___block_invoke_314(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Marking database as deactivated", buf, 2u);
      }
    }
    BOOL v5 = [*(id *)(a1 + 32) platformObject];
    int v6 = [v5 markDatabaseAsDeactivatedWithError:a2];
  }
  else
  {
    int v6 = 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
        v6 &= objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "closeWithError:", a2, (void)v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [*(id *)(a1 + 32) platformObject];
  int v13 = [v12 closeWithError:a2];

  return v13 & v6;
}

- (void)performBarrier
{
  [(CPLEngineStore *)self performBatchedWriteTransactionBarrier];
  id v3 = [(CPLEngineStore *)self platformObject];
  [v3 performBarrier];
}

- (void)performBatchedWriteTransactionBarrierWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  batchedTransactionsQueue = self->_batchedTransactionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke;
  block[3] = &unk_1E60A5CE8;
  block[4] = self;
  void block[5] = &v15;
  dispatch_sync(batchedTransactionsQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    id v6 = [[CPLEngineStoreTransaction alloc] initForWrite:0 store:self identifier:@"cpl.store.batch.barrier" description:@"barrier for batched write"];
    id v7 = [(CPLEngineStore *)self platformObject];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_2;
    v11[3] = &unk_1E60A9C70;
    id v13 = v4;
    id v8 = v6;
    id v12 = v8;
    [v7 performBarrierTransaction:v8 withBlock:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_4;
    v9[3] = &unk_1E60A78C8;
    id v10 = v4;
    [(CPLEngineStore *)self performBatchedWriteTransactionWithBlock:&__block_literal_global_298 completionHandler:v9];
    id v8 = v10;
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

uint64_t __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _releaseDirty];
}

uint64_t __75__CPLEngineStore_performBatchedWriteTransactionBarrierWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBatchedWriteTransactionBarrier
{
  batchedTransactionsQueue = self->_batchedTransactionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CPLEngineStore_performBatchedWriteTransactionBarrier__block_invoke;
  block[3] = &unk_1E60A5DD8;
  block[4] = self;
  dispatch_sync(batchedTransactionsQueue, block);
}

uint64_t __55__CPLEngineStore_performBatchedWriteTransactionBarrier__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyPerformBatchedTransactionsLocked];
}

- (void)performBatchedWriteTransactionWithBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_dontBatchTransactions)
  {
    id v8 = [(CPLEngineStore *)self performWriteTransactionWithBlock:v6 completionHandler:v7];
  }
  else
  {
    batchedTransactionsQueue = self->_batchedTransactionsQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__CPLEngineStore_performBatchedWriteTransactionWithBlock_completionHandler___block_invoke;
    v13[3] = &unk_1E60A9948;
    id v14 = v6;
    id v15 = v7;
    v13[4] = self;
    id v10 = v13;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_676;
    block[3] = &unk_1E60A6978;
    id v17 = v10;
    __int16 v11 = batchedTransactionsQueue;
    dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v11, v12);
  }
}

void __76__CPLEngineStore_performBatchedWriteTransactionWithBlock_completionHandler___block_invoke(void *a1)
{
  id v3 = objc_alloc_init(_CPLEngineStoreBatchedTransaction);
  [(_CPLEngineStoreBatchedTransaction *)v3 setBlock:a1[5]];
  [(_CPLEngineStoreBatchedTransaction *)v3 setCompletionHandler:a1[6]];
  [*(id *)(a1[4] + 32) addObject:v3];
  uint64_t v2 = (unsigned char *)a1[4];
  if (!v2[40]) {
    [v2 _scheduleBatchedTransactionsLocked];
  }
}

- (void)_reallyPerformBatchedTransactionsLocked
{
  if ([(NSMutableArray *)self->_batchedTransactions count])
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3032000000;
    v6[3] = __Block_byref_object_copy__670;
    v6[4] = __Block_byref_object_dispose__671;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    void v4[5] = v6;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke;
    v5[3] = &unk_1E60AB878;
    v5[4] = self;
    void v5[5] = v6;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_3;
    v4[3] = &unk_1E60AB878;
    v4[4] = self;
    id v3 = [(CPLEngineStore *)self performWriteTransactionWithBlock:v5 completionHandler:v4];
    _Block_object_dispose(v6, 8);
  }
}

void __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  while (1)
  {
    uint64_t v11 = 0;
    dispatch_block_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__670;
    id v15 = __Block_byref_object_dispose__671;
    id v16 = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 24);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_2;
    v10[3] = &unk_1E60A5CE8;
    v10[4] = v6;
    void v10[5] = &v11;
    dispatch_sync(v7, v10);
    if (!v12[5]) {
      break;
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:");
    id v8 = [(id)v12[5] block];
    ((void (**)(void, id))v8)[2](v8, v3);

    uint64_t v9 = [v3 error];

    if (v9 || CFAbsoluteTimeGetCurrent() - Current > 2.0) {
      break;
    }
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v11, 8);
}

void __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 completionHandler];
        ((void (**)(void, id))v10)[2](v10, v3);

        [v9 _releaseDirty];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  dispatch_block_t v12 = *(void **)(v11 + 24);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_4;
  v16[3] = &unk_1E60A5DD8;
  v16[4] = v11;
  uint64_t v13 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_676;
  block[3] = &unk_1E60A6978;
  id v22 = v13;
  id v14 = v12;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v15);
}

uint64_t __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 32) count];
    if (result)
    {
      id v3 = *(void **)(v2 + 32);
      return [v3 _scheduleBatchedTransactionsLocked];
    }
  }
  return result;
}

void __57__CPLEngineStore__reallyPerformBatchedTransactionsLocked__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
    [v5 removeObjectAtIndex:0];
  }
}

- (void)_scheduleBatchedTransactionsLocked
{
  self->_batchedTransactionDequeueIsScheduled = 1;
  dispatch_time_t v3 = dispatch_walltime(0, 1000000000);
  batchedTransactionsQueue = self->_batchedTransactionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CPLEngineStore__scheduleBatchedTransactionsLocked__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_after(v3, batchedTransactionsQueue, block);
}

void __52__CPLEngineStore__scheduleBatchedTransactionsLocked__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  [*(id *)(a1 + 32) _reallyPerformBatchedTransactionsLocked];
}

- (void)blockWriteTransactionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStore *)self platformObject];
  [v5 blockWriteTransactionsWithCompletionHandler:v4];
}

- (id)performWriteTransactionWithBlock:(id)a3 completionHandler:(id)a4
{
  return [(CPLEngineStore *)self _performWriteTransactionByPassBlocker:0 WithBlock:a3 completionHandler:a4];
}

- (id)_performWriteTransactionByPassBlocker:(id)a3 WithBlock:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[CPLEngineStoreTransaction alloc] initForWrite:1 store:self identifier:@"cpl.store.write" description:@"write store"];
  [v11 setBlocker:v8];
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v12 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Will write store with %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  char v14 = [WeakRetained hasChangesToProcess];

  char v33 = v14;
  dispatch_block_t v15 = [(CPLEngineStore *)self platformObject];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke;
  v27[3] = &unk_1E60A9A68;
  v27[4] = self;
  id v28 = v11;
  id v16 = v9;
  id v29 = v16;
  p_long long buf = &buf;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_287;
  v22[3] = &unk_1E60A6050;
  id v17 = v28;
  id v23 = v17;
  uint64_t v24 = self;
  char v26 = &buf;
  id v18 = v10;
  id v25 = v18;
  [v15 performWriteTransaction:v17 withBlock:v27 completionHandler:v22];

  long long v19 = v25;
  id v20 = v17;

  _Block_object_dispose(&buf, 8);
  return v20;
}

void __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60A9A68;
  id v7 = v2;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  [v3 _performTransaction:v7 withBlock:v6];
}

void __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_287(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Finished writing %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 40) _commitWriteTransaction:*(void *)(a1 + 32) commitError:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 200));
  [WeakRetained setHasChangesToProcess:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _releaseDirty];
}

uint64_t __84__CPLEngineStore__performWriteTransactionByPassBlocker_WithBlock_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = a1[4];
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Performing %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t result = [*(id *)(a1[5] + 216) hasStagedSyncAnchors];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)_commitWriteTransaction:(id)a3 commitError:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t state = self->_state;
  uint64_t v9 = [v6 error];

  int v36 = v6;
  v37 = self;
  id v35 = v7;
  if (v9)
  {
LABEL_27:
    if (state == 3 && _CPLSilentLogging == 0)
    {
      id v25 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        char v26 = [v6 error];
        *(_DWORD *)long long buf = 138412290;
        id v49 = v26;
        _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "Closing transaction did fail: %@", buf, 0xCu);
      }
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v27 = self->_storages;
    uint64_t v28 = [(NSHashTable *)v27 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (state == 3 && !_CPLSilentLogging)
          {
            char v33 = __CPLStoreOSLogDomain_2929();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = [v32 name];
              *(_DWORD *)long long buf = 138543362;
              id v49 = v34;
              _os_log_impl(&dword_1B4CAC000, v33, OS_LOG_TYPE_DEFAULT, "Closing %{public}@ after failed transaction", buf, 0xCu);
            }
          }
          [v32 writeTransactionDidFail];
        }
        uint64_t v29 = [(NSHashTable *)v27 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v29);
    }

    id v23 = v37;
    [(CPLEngineStore *)v37 writeTransactionDidFail];
    goto LABEL_48;
  }
  if (v7)
  {
    if (state != 3)
    {
      if ([v7 isCPLOperationCancelledError])
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v10 = __CPLTransactionOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            id v49 = v6;
            id v11 = "! %@ commit failed: operation was cancelled";
            dispatch_block_t v12 = v10;
            os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
            uint32_t v14 = 12;
LABEL_24:
            _os_log_impl(&dword_1B4CAC000, v12, v13, v11, buf, v14);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
      }
      else if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLTransactionOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          id v49 = v6;
          __int16 v50 = 2112;
          id v51 = v7;
          id v11 = "! %@ commit failed: %@";
          dispatch_block_t v12 = v10;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          uint32_t v14 = 22;
          goto LABEL_24;
        }
LABEL_25:
      }
    }
    [v6 setError:v7];
    goto LABEL_27;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  dispatch_block_t v15 = self->_storages;
  uint64_t v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        if (state == 3 && !_CPLSilentLogging)
        {
          uint64_t v21 = __CPLStoreOSLogDomain_2929();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v20 name];
            *(_DWORD *)long long buf = 138543362;
            id v49 = v22;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Closing %{public}@", buf, 0xCu);
          }
        }
        [v20 writeTransactionDidSucceed];
      }
      uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v17);
  }

  id v23 = self;
  [(CPLEngineStore *)self writeTransactionDidSucceed];
LABEL_48:
  [(CPLEngineStore *)v23 _finishTransaction];
}

- (void)transactionDidFinish
{
  transactionTransportScopeMapping = self->_transactionTransportScopeMapping;
  self->_transactionTransportScopeMapping = 0;

  [(CPLEngineStore *)self _dropTransactionClientCacheView];
}

- (void)writeTransactionDidFail
{
  self->_shouldEnableScopeListSyncOnWriteSuccess = 0;
  self->_double pendingUpdateInterval = 0.0;
  *(double *)((char *)&self->_pendingUpdateInterval + 5) = 0.0;
  if (self->_discardUnacknowledgedBatchOnTransactionFail)
  {
    self->_discardUnacknowledgedBatchOnTransactionFail = 0;
    unacknowledgedBatch = self->_unacknowledgedBatch;
    self->_unacknowledgedBatch = 0;
  }
  if (self->_hasUpdatedDisabledFeatures)
  {
    disabledFeatures = self->_disabledFeatures;
    self->_disabledFeatures = 0;

    self->_hasUpdatedDisabledFeatures = 0;
  }
  transactionNewPredictions = self->_transactionNewPredictions;
  self->_transactionNewPredictions = 0;

  id v6 = [(CPLEngineStore *)self platformObject];
  [v6 writeTransactionDidFail];
}

- (void)writeTransactionDidSucceed
{
  if (self->_unschedulePendingUpdateApplyOnWriteSuccess) {
    [(CPLEngineStore *)self _reallyUnschedulePendingUpdateApply];
  }
  if (self->_schedulePendingUpdateApplyOnWriteSuccess) {
    [(CPLEngineStore *)self _reallySchedulePendingUpdateApply];
  }
  if (self->_shouldEnableScopeListSyncOnWriteSuccess)
  {
    shouldSyncScopeListQueue = self->_shouldSyncScopeListQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__CPLEngineStore_writeTransactionDidSucceed__block_invoke;
    block[3] = &unk_1E60A5DD8;
    void block[4] = self;
    dispatch_sync(shouldSyncScopeListQueue, block);
    id v4 = [(CPLEngineStore *)self engineLibrary];
    int v5 = [v4 scheduler];
    [v5 noteScopeListNeedsUpdate];

    self->_shouldEnableScopeListSyncOnWriteSuccess = 0;
  }
  if (self->_scheduleSetupOnWriteSuccess)
  {
    id v6 = [(CPLEngineStore *)self engineLibrary];
    id v7 = [v6 scheduler];
    [v7 noteStoreNeedsSetup];

    self->_scheduleSetupOnWriteSuccess = 0;
  }
  if (self->_scheduleDisabledFeatureUpdateOnWriteSuccess)
  {
    uint64_t v8 = [(CPLEngineStore *)self engineLibrary];
    uint64_t v9 = [v8 scheduler];
    [v9 noteStoreNeedsToUpdateDisabledFeatures];

    self->_scheduleDisabledFeatureUpdateOnWriteSuccess = 0;
  }
  if (self->_schedulePullFromClient)
  {
    uint64_t v10 = [(CPLEngineStore *)self engineLibrary];
    [v10 notifyAttachedObjectsPullQueueIsFull];

    self->_schedulePullFromClient = 0;
  }
  self->_discardUnacknowledgedBatchOnTransactionFail = 0;
  self->_double pendingUpdateInterval = 0.0;
  self->_hasUpdatedDisabledFeatures = 0;
  if (self->_transactionNewPredictions)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    dispatch_block_t v12 = [WeakRetained scheduler];
    os_log_type_t v13 = [v12 predictor];
    [v13 updatePredictionWithValuesAndTypes:self->_transactionNewPredictions];

    transactionNewPredictions = self->_transactionNewPredictions;
    self->_transactionNewPredictions = 0;
  }
  dispatch_block_t v15 = [(CPLEngineStore *)self platformObject];
  [v15 writeTransactionDidSucceed];
}

uint64_t __44__CPLEngineStore_writeTransactionDidSucceed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 172) = 1;
  return result;
}

- (id)performReadTransactionWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[CPLEngineStoreTransaction alloc] initForWrite:0 store:self identifier:@"cpl.store.read" description:@"read store"];
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Will read store with %@", buf, 0xCu);
    }
  }
  id v7 = [(CPLEngineStore *)self platformObject];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke;
  v13[3] = &unk_1E60A6868;
  v13[4] = self;
  id v8 = v5;
  id v14 = v8;
  id v15 = v4;
  id v9 = v4;
  [v7 performReadTransaction:v8 withBlock:v13];

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke_2;
  id v7 = &unk_1E60A5EE8;
  id v8 = v2;
  id v9 = *(id *)(a1 + 48);
  [v3 _performTransaction:v8 withBlock:&v4];
  objc_msgSend(*(id *)(a1 + 40), "_releaseDirty", v4, v5, v6, v7);
}

uint64_t __50__CPLEngineStore_performReadTransactionWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Performing %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)openWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  if ([(CPLEngineStore *)self state])
  {
    int v5 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't open library if it's not closed first"];
    v4[2](v4, v5);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = [(CPLEngineStore *)self platformObject];
        *(_DWORD *)long long buf = 138412290;
        id v14 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Opening concrete store: %@", buf, 0xCu);
      }
    }
    [(CPLEngineStore *)self setState:1];
    id v8 = [[CPLEngineStoreTransaction alloc] initForWrite:1 store:self identifier:@"cpl.store.open" description:@"open store"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__CPLEngineStore_openWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E60A6868;
    v10[4] = self;
    id v11 = v8;
    dispatch_block_t v12 = v4;
    id v9 = v8;
    [(CPLEngineStore *)self _performBarrierTransaction:v9 withBlock:v10];
  }
}

void __44__CPLEngineStore_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __44__CPLEngineStore_openWithCompletionHandler___block_invoke_2;
  id v11 = &unk_1E60A6728;
  dispatch_block_t v12 = v3;
  id v13 = v2;
  [v3 _performTransaction:v13 withBlock:&v8];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "error", v8, v9, v10, v11, v12);
  [*(id *)(a1 + 32) setState:2 * (v4 == 0)];
  [*(id *)(a1 + 32) _commitWriteTransaction:*(void *)(a1 + 40) commitError:v4];
  int v5 = [*(id *)(a1 + 32) _resetEventsDescriptions];
  if (v5 && !_CPLSilentLogging)
  {
    uint64_t v6 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 componentsJoinedByString:@"\n\t"];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Last reset events:\n\t%@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) _releaseDirty];
}

uint64_t __44__CPLEngineStore_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Opening all storages: %@", buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 344) discardCache];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CPLEngineStore_openWithCompletionHandler___block_invoke_242;
  v6[3] = &unk_1E60AB410;
  uint64_t v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  return [v4 do:v6];
}

uint64_t __44__CPLEngineStore_openWithCompletionHandler___block_invoke_242(uint64_t a1, void *a2)
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) platformObject];
  int v4 = [v3 openWithError:a2];

  if (!v4) {
    goto LABEL_31;
  }
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 platformObject];
  *(unsigned char *)(*(void *)(a1 + 32) + 172) = objc_msgSend(v5, "_shouldSyncScopeListWithOptions:", objc_msgSend(v6, "libraryOptions"));

  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 172))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    *(unsigned char *)(*(void *)(a1 + 32) + 172) = [v8 BOOLForKey:@"CPLForceScopeListSync"];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v9 = *(id *)(v7 + 8);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v137 objects:v149 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v138 != v11) {
          objc_enumerationMutation(v9);
        }
        if (![*(id *)(*((void *)&v137 + 1) + 8 * i) openWithError:a2])
        {

LABEL_30:
          int v4 = 0;
          goto LABEL_31;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v137 objects:v149 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) _loadResetEvents];
  id v13 = [*(id *)(a1 + 32) platformObject];
  int v4 = [v13 executePostOpenWithError:a2];

  if (!v4) {
    goto LABEL_31;
  }
  id v14 = [*(id *)(*(void *)(a1 + 32) + 208) storedExtractedBatch];
  if (v14)
  {
    id v15 = *(id *)(*(void *)(a1 + 32) + 208);
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v14 batch];
        id v18 = [v15 name];
        *(_DWORD *)long long buf = 138412546;
        id v142 = v17;
        __int16 v143 = 2114;
        double v144 = *(double *)&v18;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Reinjecting %@ in %{public}@", buf, 0x16u);
      }
    }
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v19 = [v14 batch];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v133 objects:v148 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v134;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v134 != v21) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v133 + 1) + 8 * j) _setShouldNotTrustCloudCache:1];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v133 objects:v148 count:16];
      }
      while (v20);
    }

    id v23 = [v14 clientCacheIdentifier];
    BOOL v24 = v23 == 0;

    if (v24)
    {
      if (!_CPLSilentLogging)
      {
        long long v39 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_ERROR, "Found extracted batch but no client cache identifier - triggering a reset sync", buf, 2u);
        }
      }
      id v27 = +[CPLResetTracker currentTracker];
      id v26 = [v27 likelyResetReasonWithImmediateReason:@"found extracted batch at launch without a client cache identifier"];
      char v40 = [*(id *)(a1 + 32) resetLocalSyncStateWithCause:v26 error:a2];
      +[CPLResetTracker discardTracker:v27];
    }
    else
    {
      id v131 = 0;
      id v132 = 0;
      int v25 = [v15 reinjectExtractedBatch:v14 overwrittenRecordIdentifiers:&v132 error:&v131];
      id v26 = v132;
      id v27 = v131;
      if (v25)
      {
        uint64_t v28 = *(void **)(*(void *)(a1 + 32) + 208);
        id v130 = v27;
        char v29 = [v28 storeExtractedBatch:0 error:&v130];
        id v30 = v130;

        if (v29)
        {

          goto LABEL_61;
        }
        id v27 = v30;
      }
      if (!_CPLSilentLogging)
      {
        long long v41 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          id v42 = [v14 batch];
          *(_DWORD *)long long buf = 138412546;
          id v142 = v42;
          __int16 v143 = 2112;
          double v144 = *(double *)&v27;
          _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_ERROR, "Re-injecting %@ failed: %@", buf, 0x16u);
        }
      }
      long long v43 = +[CPLResetTracker currentTracker];
      long long v44 = [v43 likelyResetReasonWithImmediateReason:@"failed to re-inject extracted batch at launch"];
      char v40 = [*(id *)(a1 + 32) resetLocalSyncStateWithCause:v44 error:a2];
      +[CPLResetTracker discardTracker:v43];
    }
    if ((v40 & 1) == 0) {
      goto LABEL_30;
    }
  }
LABEL_61:
  long long v45 = [*(id *)(a1 + 32) platformObject];
  BOOL v46 = [v45 storedChangeSessionUpdate];

  if (v46)
  {
    v47 = [v46 queuedDate];
    [v47 timeIntervalSinceNow];
    if (v47 && v48 >= -30.0)
    {
      double v49 = v48 + 30.0;
      if (v49 <= 30.0) {
        double v50 = v49;
      }
      else {
        double v50 = 30.0;
      }
      if (!_CPLSilentLogging)
      {
        id v51 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          id v52 = (id)objc_opt_class();
          *(_DWORD *)long long buf = 138412546;
          id v142 = v52;
          __int16 v143 = 2048;
          double v144 = v50;
          _os_log_impl(&dword_1B4CAC000, v51, OS_LOG_TYPE_DEFAULT, "Store has some %@ to apply, will apply it in %.1fs", buf, 0x16u);
        }
      }
      *(double *)(*(void *)(a1 + 32) + 128) = v50;
      [*(id *)(a1 + 32) _schedulePendingUpdateApply];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        char v53 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          id v54 = (id)objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          id v142 = v54;
          _os_log_impl(&dword_1B4CAC000, v53, OS_LOG_TYPE_DEFAULT, "Store has some %@ to apply, applying now", buf, 0xCu);
        }
      }
      id v55 = *(void **)(a1 + 32);
      id v129 = 0;
      char v56 = [v55 _applyPendingUpdate:v46 error:&v129];
      id v57 = v129;
      BOOL v58 = v57;
      if ((v56 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v111 = __CPLStoreOSLogDomain_2929();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v142 = v58;
            _os_log_impl(&dword_1B4CAC000, v111, OS_LOG_TYPE_ERROR, "Failed to apply pending update, will trigger a reset sync: %@", buf, 0xCu);
          }
        }
        id v112 = [NSString alloc];
        id v113 = [v58 domain];
        uint64_t v114 = [v112 initWithFormat:@"failed to apply pending update to store (%@/%ld)", v113, objc_msgSend(v58, "code")];

        v115 = +[CPLResetTracker currentTracker];
        id v116 = [v115 likelyResetReasonWithImmediateReason:v114];

        LOBYTE(v114) = [*(id *)(a1 + 32) resetLocalSyncStateWithCause:v116 error:a2];
        +[CPLResetTracker discardTracker:v115];

        if ((v114 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_79;
      }
    }
  }
LABEL_79:
  uint64_t v118 = [*(id *)(a1 + 32) libraryOptions];
  BOOL v59 = [*(id *)(a1 + 32) engineLibrary];
  v117 = [v59 transport];

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 216) enumeratorForScopesIncludeInactive:1];
  uint64_t v121 = [obj countByEnumeratingWithState:&v125 objects:v147 count:16];
  if (!v121) {
    goto LABEL_179;
  }
  uint64_t v120 = *(void *)v126;
  do
  {
    uint64_t v60 = 0;
    do
    {
      if (*(void *)v126 != v120) {
        objc_enumerationMutation(obj);
      }
      uint64_t v61 = *(void **)(*((void *)&v125 + 1) + 8 * v60);
      int v62 = [*(id *)(*(void *)(a1 + 32) + 216) flagsForScope:v61];
      char v63 = [v62 valueForFlag:16];
      int v64 = [v62 valueForFlag:4];
      if ((v63 & 1) == 0)
      {
        if (!v64 || ([v62 valueForFlag:0x10000] & 1) != 0)
        {
          id v69 = *(void **)(a1 + 32);
          id v124 = 0;
          char v70 = [v69 _canHaveActivatedScope:v61 libraryOptions:v118 error:&v124];
          id v71 = v124;
          if ((v70 & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              v103 = __CPLStoreOSLogDomain_2929();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                v104 = [v71 localizedDescription];
                *(_DWORD *)long long buf = 138412546;
                id v142 = v61;
                __int16 v143 = 2112;
                double v144 = *(double *)&v104;
                _os_log_impl(&dword_1B4CAC000, v103, OS_LOG_TYPE_ERROR, "Opening store with incorrectly activated %@ (%@)", buf, 0x16u);
              }
            }
            id v105 = [NSString alloc];
            v106 = +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", [v61 scopeType]);
            long long v75 = (void *)[v105 initWithFormat:@"Found scope with type %@ active at opening time", v106];

            id v107 = *(void **)(a1 + 32);
            v123[0] = MEMORY[0x1E4F143A8];
            v123[1] = 3221225472;
            v123[2] = __44__CPLEngineStore_openWithCompletionHandler___block_invoke_269;
            v123[3] = &unk_1E60A5DD8;
            v123[4] = v107;
            [v107 wipeStoreAtNextOpeningWithReason:v75 completionBlock:v123];
            if (a2) {
              *a2 = v71;
            }
LABEL_189:

LABEL_190:
LABEL_191:

            goto LABEL_30;
          }
          unint64_t v72 = [*(id *)(*(void *)(a1 + 32) + 216) supportedFeatureVersionInLastSyncForScope:v61];
          if (v72 > 0x13)
          {

            goto LABEL_117;
          }
          id v73 = [*(id *)(*(void *)(a1 + 32) + 216) scopeChangeForScope:v61];
          long long v74 = [v73 libraryInfo];
          long long v75 = [v74 featureVersionHistory];

          if (v75)
          {
            if (v72 < [v75 currentFeatureVersion])
            {
              if (!_CPLSilentLogging)
              {
                long long v76 = __CPLStoreOSLogDomain_2929();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  id v77 = [v61 scopeIdentifier];
                  uint64_t v78 = [v75 currentFeatureVersion];
                  *(_DWORD *)long long buf = 138543874;
                  id v142 = v77;
                  __int16 v143 = 2048;
                  double v144 = *(double *)&v72;
                  __int16 v145 = 2048;
                  uint64_t v146 = v78;
                  _os_log_impl(&dword_1B4CAC000, v76, OS_LOG_TYPE_DEFAULT, "Last supported feature version in sync for %{public}@ is %lu while server feature version was at least %lu - will have to catch up some changes though", buf, 0x20u);
                }
                goto LABEL_114;
              }
LABEL_115:
              if (![*(id *)(*(void *)(a1 + 32) + 216) setScopeNeedsUpdateFromTransport:v61 error:a2])goto LABEL_189; {
              char v83 = [*(id *)(*(void *)(a1 + 32) + 216) setScopeHasChangesToPullFromTransport:v61 error:a2];
              }

              if ((v83 & 1) == 0) {
                goto LABEL_191;
              }
LABEL_117:
              if (*(void *)(*(void *)(a1 + 32) + 16)
                || ([v61 scopeType] & 0xFFFFFFFFFFFFFFFELL) != 4)
              {
                if (v63) {
                  goto LABEL_152;
                }
              }
              else
              {
                if ((overridesFeatureFlag != 1 || isFeatureEnabled)
                  && (SEL v84 = *(void **)(a1 + 32),
                      [v61 scopeIdentifier],
                      id v85 = objc_claimAutoreleasedReturnValue(),
                      LODWORD(v84) = [v84 mainScopeSupportsSharingScopeWithIdentifier:v85],
                      v85,
                      v84))
                {
                  if (v63)
                  {
                    if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1) {
                      dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_2_23628);
                    }
                    if (CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope)
                    {
                      if (_CPLSilentLogging) {
                        goto LABEL_152;
                      }
                      id v71 = __CPLStoreOSLogDomain_2929();
                      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_145;
                      }
                      goto LABEL_151;
                    }
                    id v71 = [*(id *)(*(void *)(a1 + 32) + 216) primaryScope];
                    if (!v71
                      || ([*(id *)(*(void *)(a1 + 32) + 216) valueForFlag:16 forScope:v71] & 1) != 0)
                    {
                      goto LABEL_151;
                    }
                    if (!_CPLSilentLogging)
                    {
                      v98 = __CPLStoreOSLogDomain_2929();
                      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        id v142 = v61;
                        _os_log_impl(&dword_1B4CAC000, v98, OS_LOG_TYPE_DEFAULT, "Found inactive shared library scope at opening time: %@ - automatically activating it", buf, 0xCu);
                      }
                    }
                    if (![*(id *)(*(void *)(a1 + 32) + 216) setValue:0 forFlag:16 forScope:v61 error:a2])goto LABEL_190; {
                    dispatch_block_t v99 = [*(id *)(*(void *)(a1 + 32) + 216) primaryScope];
                    }
                    if (!v99) {
                      goto LABEL_151;
                    }
                    if (!_CPLSilentLogging)
                    {
                      uint64_t v100 = __CPLStoreOSLogDomain_2929();
                      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        id v142 = v99;
                        _os_log_impl(&dword_1B4CAC000, v100, OS_LOG_TYPE_DEFAULT, "Resetting sync anchor for %@", buf, 0xCu);
                      }
                    }
                    char v90 = [*(id *)(*(void *)(a1 + 32) + 216) resetSyncAnchorForScope:v99 error:a2];

                    goto LABEL_140;
                  }
                  if (!_CPLSilentLogging)
                  {
                    v96 = __CPLStoreOSLogDomain_2929();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v142 = v61;
                      _os_log_impl(&dword_1B4CAC000, v96, OS_LOG_TYPE_DEFAULT, "Setting sharing scope to %@ at opening", buf, 0xCu);
                    }
                  }
                  id v97 = *(void **)(a1 + 32);
                  uint64_t v94 = [v61 scopeIdentifier];
                  [v97 _setSharingScopeIdentifier:v94];
                }
                else
                {
                  if (v63)
                  {
                    if (_CPLSilentLogging) {
                      goto LABEL_152;
                    }
                    id v71 = __CPLStoreOSLogDomain_2929();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                    {
LABEL_145:
                      *(_DWORD *)long long buf = 138412290;
                      id v142 = v61;
                      _os_log_impl(&dword_1B4CAC000, v71, OS_LOG_TYPE_DEFAULT, "Found inactive shared library scope at opening time: %@", buf, 0xCu);
                    }
LABEL_151:

                    goto LABEL_152;
                  }
                  if (!_CPLSilentLogging)
                  {
                    v93 = __CPLStoreOSLogDomain_2929();
                    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v142 = v61;
                      _os_log_impl(&dword_1B4CAC000, v93, OS_LOG_TYPE_ERROR, "Found an active shared library scope at opening time: %@ - this will need to be cleaned-up first", buf, 0xCu);
                    }
                  }
                  uint64_t v94 = [*(id *)(a1 + 32) engineLibrary];
                  v95 = [v94 syncManager];
                  [v95 addBrokenScope:v61];
                }
              }
              uint64_t v86 = [v61 scopeType];
              if ((unint64_t)(v86 - 1) < 3
                || (unint64_t)(v86 - 4) <= 1 && (overridesFeatureFlag != 1 || isFeatureEnabled))
              {
                goto LABEL_152;
              }
              if (![v62 valueForFlag:4])
              {
                if (!_CPLSilentLogging)
                {
                  v91 = __CPLStoreOSLogDomain_2929();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    id v142 = v61;
                    _os_log_impl(&dword_1B4CAC000, v91, OS_LOG_TYPE_ERROR, "Found broken active scope at opening time: %@ - this will need to be cleaned-up first", buf, 0xCu);
                  }
                }
                id v71 = [*(id *)(a1 + 32) engineLibrary];
                uint64_t v92 = [v71 syncManager];
                [v92 addBrokenScope:v61];

                goto LABEL_151;
              }
              if (!_CPLSilentLogging)
              {
                id v87 = __CPLStoreOSLogDomain_2929();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v142 = v61;
                  _os_log_impl(&dword_1B4CAC000, v87, OS_LOG_TYPE_ERROR, "Found broken active scope at opening time: %@ - the scope is already known to have ben deleted. Deleting the entry immediately", buf, 0xCu);
                }
              }
LABEL_139:
              __int16 v88 = *(void **)(*(void *)(a1 + 32) + 216);
              v89 = [v61 scopeIdentifier];
              char v90 = [v88 deleteScopeWithIdentifier:v89 error:a2];

LABEL_140:
              if ((v90 & 1) == 0) {
                goto LABEL_191;
              }
              goto LABEL_152;
            }
            if (_CPLSilentLogging) {
              goto LABEL_115;
            }
            long long v76 = __CPLStoreOSLogDomain_2929();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              id v81 = [v61 scopeIdentifier];
              uint64_t v82 = [v75 currentFeatureVersion];
              *(_DWORD *)long long buf = 138543874;
              id v142 = v81;
              __int16 v143 = 2048;
              double v144 = *(double *)&v72;
              __int16 v145 = 2048;
              uint64_t v146 = v82;
              _os_log_impl(&dword_1B4CAC000, v76, OS_LOG_TYPE_DEFAULT, "Last supported feature version in sync for %{public}@ is %lu while server feature version was likely %lu - might have to catch up some changes though", buf, 0x20u);
            }
          }
          else
          {
            if (_CPLSilentLogging) {
              goto LABEL_115;
            }
            long long v76 = __CPLStoreOSLogDomain_2929();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              id v80 = [v61 scopeIdentifier];
              *(_DWORD *)long long buf = 138543618;
              id v142 = v80;
              __int16 v143 = 2048;
              double v144 = *(double *)&v72;
              _os_log_impl(&dword_1B4CAC000, v76, OS_LOG_TYPE_DEFAULT, "Last supported feature version in sync for %{public}@ is %lu - will have to confirm server feature version and maybe catch up some changes though", buf, 0x16u);
            }
          }
LABEL_114:

          goto LABEL_115;
        }
        if (!_CPLSilentLogging)
        {
          long long v79 = __CPLStoreOSLogDomain_2929();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v142 = v61;
            _os_log_impl(&dword_1B4CAC000, v79, OS_LOG_TYPE_ERROR, "Found remaining deleted scope %@ that should have been removed already", buf, 0xCu);
          }
        }
        goto LABEL_139;
      }
      if (v64) {
        goto LABEL_117;
      }
      uint64_t v65 = [v61 scopeIdentifier];
      int v66 = [v117 shouldIgnoreScopeWithIdentifier:v65];

      if (!v66) {
        goto LABEL_117;
      }
      if (!_CPLSilentLogging)
      {
        v67 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = [v61 scopeIdentifier];
          *(_DWORD *)long long buf = 138543362;
          id v142 = v68;
          _os_log_impl(&dword_1B4CAC000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ should be ignored by this engine - removing it", buf, 0xCu);
        }
      }
      [v62 setValue:1 forFlag:4];
      if (([*(id *)(*(void *)(a1 + 32) + 216) updateFlags:v62 forScope:v61 error:a2] & 1) == 0) {
        goto LABEL_191;
      }
LABEL_152:

      ++v60;
    }
    while (v121 != v60);
    uint64_t v101 = [obj countByEnumeratingWithState:&v125 objects:v147 count:16];
    uint64_t v121 = v101;
  }
  while (v101);
LABEL_179:

  if (![*(id *)(*(void *)(a1 + 32) + 272) sizeOfResourcesToUpload]
    || ![*(id *)(*(void *)(a1 + 32) + 208) isEmpty])
  {
    goto LABEL_193;
  }
  v102 = [*(id *)(*(void *)(a1 + 32) + 208) storedExtractedBatch];
  if (v102)
  {

    goto LABEL_193;
  }
  v108 = [*(id *)(a1 + 32) platformObject];
  char v109 = [v108 hasStoredChangeSessionUpdate];

  if ((v109 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v110 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v110, OS_LOG_TYPE_ERROR, "Resources storage has orphaned resources - clearing", buf, 2u);
      }
    }
    int v4 = [*(id *)(*(void *)(a1 + 32) + 272) resetWithError:a2];
  }
  else
  {
LABEL_193:
    int v4 = 1;
  }
LABEL_31:
  if (!CPLIsInTestReadonlyMode())
  {
    if (!v4) {
      return 0;
    }
    goto LABEL_38;
  }
  uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 216) primaryScope];
  if (!v31) {
    goto LABEL_35;
  }
  uint64_t v32 = [*(id *)(*(void *)(a1 + 32) + 216) disabledDateForScope:v31];
  if (!v32)
  {
    id v35 = [MEMORY[0x1E4F1C9C8] date];
    int v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31536000.0];
    if (!_CPLSilentLogging)
    {
      v37 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v37, OS_LOG_TYPE_DEFAULT, "Simulating Exit mode for Test Read-only mode", buf, 2u);
      }
    }
    if (![*(id *)(*(void *)(a1 + 32) + 216) setDisabledDate:v35 forScope:v31 error:a2])
    {

      uint64_t v33 = 0;
      goto LABEL_39;
    }
    char v38 = [*(id *)(*(void *)(a1 + 32) + 216) setDeleteDate:v36 forScope:v31 error:a2];

    if ((v38 & 1) == 0) {
      return 0;
    }
LABEL_38:
    uint64_t v31 = [*(id *)(a1 + 32) platformObject];
    uint64_t v33 = [v31 performPostUpgradeMigrationsWithError:a2];
LABEL_39:

    return v33;
  }

LABEL_35:
  if (v4) {
    goto LABEL_38;
  }
  return 0;
}

void __44__CPLEngineStore_openWithCompletionHandler___block_invoke_269(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = [*(id *)(a1 + 32) engineLibrary];
  [v3 postNotificationName:@"CPLLibraryMustBeWipedNotificationName" object:v2];
}

- (void)_performBarrierTransaction:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CPLTransaction newTransactionWithIdentifier:@"cpl.store.barrier" description:@"barrier" keepPower:1];
  id v9 = [(CPLEngineStore *)self platformObject];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__CPLEngineStore__performBarrierTransaction_withBlock___block_invoke;
  v12[3] = &unk_1E60AA5C0;
  id v13 = v8;
  id v14 = v6;
  v12[4] = self;
  id v10 = v8;
  id v11 = v6;
  [v9 performBarrierTransaction:v7 withBlock:v12];
}

uint64_t __55__CPLEngineStore__performBarrierTransaction_withBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _finishTransaction];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 endTransaction];
}

- (void)_finishTransaction
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_storages;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "transactionDidFinish", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CPLEngineStore *)self transactionDidFinish];
}

- (void)_performTransaction:(id)a3 withBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v31 = (void (**)(void))a4;
  [(CPLEngineStore *)self _setTransactionOnCurrentThread:v6];
  if ([v6 canWrite] && -[CPLEngineStore state](self, "state") == 2)
  {
    unint64_t v7 = [(CPLEngineOutgoingResources *)self->_outgoingResources sizeOfResourcesToUpload];
    unint64_t v8 = [(CPLEngineOutgoingResources *)self->_outgoingResources sizeOfOriginalResourcesToUpload];
    unint64_t v9 = [(CPLEngineOutgoingResources *)self->_outgoingResources countOfOriginalImages];
    unint64_t v10 = [(CPLEngineOutgoingResources *)self->_outgoingResources countOfOriginalVideos];
    int v11 = 1;
    unint64_t v29 = [(CPLEngineOutgoingResources *)self->_outgoingResources countOfOriginalOthers];
    unint64_t v30 = v10;
    unint64_t v12 = v9;
    unint64_t v13 = v8;
    unint64_t v14 = v7;
  }
  else
  {
    int v11 = 0;
    unint64_t v29 = 0;
    unint64_t v30 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    unint64_t v14 = 0;
  }
  v31[2]();
  if (!v11) {
    goto LABEL_12;
  }
  id v15 = [v6 error];

  if (v15
    || (unint64_t v16 = [(CPLEngineOutgoingResources *)self->_outgoingResources sizeOfResourcesToUpload],
        v17 = [(CPLEngineOutgoingResources *)self->_outgoingResources sizeOfOriginalResourcesToUpload], v18 = [(CPLEngineOutgoingResources *)self->_outgoingResources countOfOriginalImages], v19 = [(CPLEngineOutgoingResources *)self->_outgoingResources countOfOriginalVideos], unint64_t v20 = [(CPLEngineOutgoingResources *)self->_outgoingResources countOfOriginalOthers], v16 == v14)&& v17 == v13&& v18 == v12&& v19 == v30&& v20 == v29)
  {
LABEL_12:
    int v21 = 0;
  }
  else
  {
    int v21 = 1;
    unint64_t v29 = v20;
    unint64_t v30 = v19;
    unint64_t v12 = v18;
    unint64_t v13 = v17;
    unint64_t v14 = v16;
  }
  id v22 = [v6 error];
  id v23 = v22;
  if (v22)
  {
    if (![v22 isCPLOperationCancelledError])
    {
      if ([v23 isCPLError])
      {
        if (_CPLSilentLogging) {
          goto LABEL_30;
        }
        id v26 = __CPLTransactionOSLogDomain();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v6 error];
          *(_DWORD *)long long buf = 138412546;
          id v33 = v6;
          __int16 v34 = 2112;
          id v35 = v27;
          _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "! %@ failed: %@", buf, 0x16u);
        }
      }
      else
      {
        if (_CPLSilentLogging) {
          goto LABEL_30;
        }
        id v26 = __CPLTransactionOSLogDomain();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = [v6 error];
          *(_DWORD *)long long buf = 138412546;
          id v33 = v6;
          __int16 v34 = 2112;
          id v35 = v28;
          _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_ERROR, "! %@ failed: %@", buf, 0x16u);
        }
      }

      goto LABEL_30;
    }
    if (!_CPLSilentLogging)
    {
      BOOL v24 = __CPLTransactionOSLogDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v33 = v6;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "! %@ failed: transaction was cancelled", buf, 0xCu);
      }
    }
  }
  else if (v21)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    [WeakRetained notifyAttachedObjectsSizeOfResourcesToUploadDidChangeToSize:v14 sizeOfOriginalResourcesToUpload:v13 numberOfImages:v12 numberOfVideos:v30 numberOfOtherItems:v29];
  }
LABEL_30:
  [(CPLEngineStore *)self _removeTransactionOnCurrentThread:v6];
}

- (BOOL)_handleException:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 name],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"CPLAssertStoreException"],
        v5,
        v6))
  {
    uint64_t v7 = [v4 reason];
    unint64_t v8 = (void *)v7;
    unint64_t v9 = @"Store exception raised";
    if (v7) {
      unint64_t v9 = (__CFString *)v7;
    }
    unint64_t v10 = v9;

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__CPLEngineStore__handleException___block_invoke;
    v13[3] = &unk_1E60A5DD8;
    id v14 = v4;
    [(CPLEngineStore *)self wipeStoreAtNextOpeningWithReason:v10 completionBlock:v13];

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __35__CPLEngineStore__handleException___block_invoke(uint64_t a1)
{
}

- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a4) = [v7 deleteDynamicallyCreatedStorages:v6 error:a4];

  return (char)a4;
}

- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStore *)self platformObject];
  LOBYTE(a4) = [v7 createStoragesDynamically:v6 error:a4];

  return (char)a4;
}

- (void)noteInvalidRecordScopedIdentifiersInPushSession:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  lastInvalidRecordsDate = self->_lastInvalidRecordsDate;
  self->_lastInvalidRecordsDate = v6;

  unint64_t v8 = (NSSet *)[v5 copy];
  lastInvalidRecordScopedIdentifiers = self->_lastInvalidRecordScopedIdentifiers;
  self->_lastInvalidRecordScopedIdentifiers = v8;
}

- (void)noteOtherResetEvent:(id)a3 cause:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineStore *)self mainScopeIdentifier];
  [(CPLEngineStore *)self _storeResetEvent:v7 scopeIdentifier:v8 date:0 cause:v6];
}

- (BOOL)resetSyncAnchorWithCause:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (![(CPLEngineStore *)self _resetSyncAnchorWithCause:v6 scope:*(void *)(*((void *)&v14 + 1) + 8 * i) error:a4])
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)resetCompleteSyncStateIncludingIDMappingWithCause:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CPLEngineStore *)self _resetGlobalStateWithError:a4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (![(CPLEngineStore *)self _resetCompleteSyncStateIncludingIDMappingWithCause:v6 scope:*(void *)(*((void *)&v14 + 1) + 8 * i) error:a4])
          {

            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    BOOL v12 = [(CPLEngineStore *)self storeUserIdentifier:0 error:a4];
  }
  else
  {
LABEL_12:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)resetCompleteSyncStateWithCause:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_isUpdatingDisabledFeatures)
  {
    BOOL v7 = 1;
    self->_shouldTriggerCompleteResetSyncAfterDisabledFeaturesUpdate = 1;
  }
  else if ([(CPLEngineStore *)self _resetGlobalStateWithError:a4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (![(CPLEngineStore *)self _resetCompleteSyncStateWithCause:v6 scope:*(void *)(*((void *)&v14 + 1) + 8 * i) error:a4])
          {

            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v7 = [(CPLEngineStore *)self storeUserIdentifier:0 error:a4];
  }
  else
  {
LABEL_14:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)resetLocalSyncStateWithCause:(id)a3 date:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_isUpdatingDisabledFeatures)
  {
    BOOL v10 = 1;
    self->_shouldTriggerResetSyncAfterDisabledFeaturesUpdate = 1;
  }
  else
  {
    [(CPLEngineStore *)self isClientInSyncWithClientCache];
    if ([(CPLEngineStore *)self _resetGlobalStateWithError:a5])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self->_scopes, "enumeratorForScopesIncludeInactive:", 0, 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            if (![(CPLEngineStore *)self _resetLocalSyncStateWithCause:v8 scope:*(void *)(*((void *)&v17 + 1) + 8 * i) date:v9 error:a5])
            {

              goto LABEL_14;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      BOOL v10 = 1;
    }
    else
    {
LABEL_14:
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)resetLocalSyncStateWithCause:(id)a3 error:(id *)a4
{
  return [(CPLEngineStore *)self resetLocalSyncStateWithCause:a3 date:0 error:a4];
}

- (BOOL)_resetSyncAnchorWithCause:(id)a3 scope:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 scopeIdentifier];
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      long long v19 = v10;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Resetting sync anchor (%@) for %@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v12 = [(CPLEngineStore *)self mainScopeIdentifier];
  int v13 = [v10 isEqualToString:v12];

  if (v13) {
    [(CPLEngineStore *)self _storeResetEvent:@"anchor" scopeIdentifier:v10 date:0 cause:v8];
  }
  BOOL v14 = [(CPLEngineScopeStorage *)self->_scopes resetSyncAnchorForScope:v9 error:a5];

  return v14;
}

- (BOOL)_resetCompleteSyncStateIncludingIDMappingWithCause:(id)a3 scope:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 scopeIdentifier];
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Resetting complete sync state for %@ (%@)", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v12 = [(CPLEngineStore *)self mainScopeIdentifier];
  int v13 = [v10 isEqualToString:v12];

  if (v13) {
    [(CPLEngineStore *)self _storeResetEvent:@"hard" scopeIdentifier:v10 date:0 cause:v8];
  }
  BOOL v14 = [(CPLEngineScopeStorage *)self->_scopes resetCompleteSyncStateIncludingIDMappingForScope:v9 error:a5];

  return v14;
}

- (BOOL)_resetCompleteSyncStateWithCause:(id)a3 scope:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 scopeIdentifier];
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Resetting complete sync state for %@ (%@)", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v12 = [(CPLEngineStore *)self mainScopeIdentifier];
  int v13 = [v10 isEqualToString:v12];

  if (v13) {
    [(CPLEngineStore *)self _storeResetEvent:@"hard" scopeIdentifier:v10 date:0 cause:v8];
  }
  BOOL v14 = [(CPLEngineScopeStorage *)self->_scopes resetCompleteSyncStateForScope:v9 error:a5];

  return v14;
}

- (BOOL)_resetLocalSyncStateWithCause:(id)a3 scope:(id)a4 date:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [v11 scopeIdentifier];
  if (!_CPLSilentLogging)
  {
    BOOL v14 = __CPLStoreOSLogDomain_2929();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Resetting local sync state for %@ (%@)", (uint8_t *)&v19, 0x16u);
    }
  }
  long long v15 = [(CPLEngineStore *)self mainScopeIdentifier];
  int v16 = [v13 isEqualToString:v15];

  if (v16) {
    [(CPLEngineStore *)self _storeResetEvent:@"soft" scopeIdentifier:v13 date:v12 cause:v10];
  }
  BOOL v17 = [(CPLEngineScopeStorage *)self->_scopes resetLocalSyncStateForScope:v11 error:a6];

  return v17;
}

- (BOOL)_resetGlobalStateWithError:(id *)a3
{
  id v5 = [(CPLEngineStore *)self platformObject];
  id v6 = [(CPLEngineStore *)self createNewLibraryVersion];
  BOOL v7 = [(CPLEngineStore *)self storeLibraryVersion:v6 withError:a3];

  if (!v7) {
    goto LABEL_10;
  }
  if (![v5 storeClientIsNotInSyncWithClientCacheWithError:a3]) {
    goto LABEL_10;
  }
  id v8 = [v5 createNewClientCacheIdentifier];
  int v9 = [v5 storeClientCacheIdentifier:v8 error:a3];

  if (!v9) {
    goto LABEL_10;
  }
  id v10 = [v5 storedChangeSessionUpdate];
  id v11 = v10;
  if (v10 && ([v10 discardFromStore:self error:a3] & 1) == 0)
  {

LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  int v12 = [v5 storeChangeSessionUpdate:0 error:a3];
  [(CPLEngineStore *)self _unschedulePendingUpdateApply];

  if (!v12
    || ![(CPLEnginePushRepository *)self->_pushRepository storeExtractedBatch:0 error:a3])
  {
    goto LABEL_10;
  }
  [(CPLEnginePushRepository *)self->_pushRepository setExtractionStrategy:0];
  [(CPLEngineScopeStorage *)self->_scopes storeScopeListSyncAnchor:0 error:a3];
  BOOL v13 = 1;
  self->_schedulePullFromClient = 1;
  [(CPLEngineStatusCenter *)self->_statusCenter resetAllTransientStatuses];
LABEL_11:

  return v13;
}

- (id)_resetEventsJSON
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(CPLEngineStore *)self _loadResetEvents];
  id v3 = (void *)[(NSMutableArray *)self->_resetEvents count];
  if (v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = self->_resetEvents;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v10 = (void *)[v9 mutableCopy];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __34__CPLEngineStore__resetEventsJSON__block_invoke;
          v13[3] = &unk_1E60AB3B8;
          id v14 = v10;
          id v11 = v10;
          [v9 enumerateKeysAndObjectsUsingBlock:v13];
          [v3 addObject:v11];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

void __34__CPLEngineStore__resetEventsJSON__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = NSNumber;
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

- (id)_resetEventsDescriptions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(CPLEngineStore *)self _loadResetEvents];
  uint64_t v3 = [(NSMutableArray *)self->_resetEvents count];
  if (v3)
  {
    id v25 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    id v22 = [(NSMutableArray *)self->_resetEvents lastObject];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = self->_resetEvents;
    uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v9 = [v8 objectForKeyedSubscript:@"date"];
          id v10 = [v8 objectForKeyedSubscript:@"endDate"];
          if (v10)
          {
            id v11 = NSString;
            int v12 = [v8 objectForKeyedSubscript:@"type"];
            BOOL v13 = [v8 objectForKeyedSubscript:@"cause"];
            id v14 = +[CPLDateFormatter stringFromDateAgo:v9 now:v4];
            long long v15 = +[CPLDateFormatter stringFromDateAgo:v10 now:v4];
            long long v16 = [v11 stringWithFormat:@"%@ (%@) - %@ finished %@", v12, v13, v14, v15];
            [v25 addObject:v16];
          }
          else
          {
            long long v17 = [v8 objectForKeyedSubscript:@"pending"];
            int v18 = [v17 BOOLValue];

            if (v18)
            {
              int v19 = NSString;
              if (v22 == v8)
              {
                int v12 = [v22 objectForKeyedSubscript:@"type"];
                BOOL v13 = [v22 objectForKeyedSubscript:@"cause"];
                id v14 = +[CPLDateFormatter stringFromDateAgo:v9 now:v4];
                [v19 stringWithFormat:@"%@ (%@) - %@ ongoing", v12, v13, v14];
              }
              else
              {
                int v12 = [v8 objectForKeyedSubscript:@"type"];
                BOOL v13 = [v8 objectForKeyedSubscript:@"cause"];
                id v14 = +[CPLDateFormatter stringFromDateAgo:v9 now:v4];
                [v19 stringWithFormat:@"%@ (%@) - %@ aborted", v12, v13, v14];
              }
            }
            else
            {
              uint64_t v20 = NSString;
              int v12 = [v8 objectForKeyedSubscript:@"type"];
              BOOL v13 = [v8 objectForKeyedSubscript:@"cause"];
              id v14 = +[CPLDateFormatter stringFromDateAgo:v9 now:v4];
              [v20 stringWithFormat:@"%@ (%@) - %@", v12, v13, v14];
            long long v15 = };
            [v25 addObject:v15];
          }
        }
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v25 = 0;
  }
  return v25;
}

- (BOOL)hasPendingResetSync
{
  [(CPLEngineStore *)self _loadResetEvents];
  uint64_t v3 = [(NSMutableArray *)self->_resetEvents lastObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"pending"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)noteResetSyncFinished
{
  [(CPLEngineStore *)self _loadResetEvents];
  uint64_t v3 = [(CPLEngineResourceStorage *)self->_resourceStorage fileStorage];
  [v3 setTrackAllStoresAndDeletes:0];

  id v4 = [(NSMutableArray *)self->_resetEvents lastObject];
  if (v4)
  {
    id v16 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"pending"];
    int v6 = [v5 BOOLValue];

    id v4 = v16;
    if (v6)
    {
      uint64_t v7 = (void *)[v16 mutableCopy];
      [v7 removeObjectForKey:@"pending"];
      id v8 = [MEMORY[0x1E4F1C9C8] date];
      [v7 setObject:v8 forKeyedSubscript:@"endDate"];

      [(NSMutableArray *)self->_resetEvents replaceObjectAtIndex:[(NSMutableArray *)self->_resetEvents count] - 1 withObject:v7];
      [(NSMutableArray *)self->_resetEvents writeToURL:self->_resetEventsURL atomically:1];
      int v9 = [v16 objectForKeyedSubscript:@"uuid"];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
      id v11 = [WeakRetained feedback];
      if (v9) {
        int v12 = v9;
      }
      else {
        int v12 = @"none";
      }
      uint64_t v13 = [v16 objectForKeyedSubscript:@"cause"];
      id v14 = (void *)v13;
      if (v13) {
        long long v15 = (__CFString *)v13;
      }
      else {
        long long v15 = @"End of reset";
      }
      [v11 reportEndOfResetWithUUID:v12 reason:v15];

      id v4 = v16;
    }
  }
}

- (void)_storeResetEvent:(id)a3 scopeIdentifier:(id)a4 date:(id)a5 cause:(id)a6
{
}

- (void)_storeResetEvent:(id)a3 scopeIdentifier:(id)a4 date:(id)a5 pending:(BOOL)a6 cause:(id)a7
{
  BOOL v8 = a6;
  v32[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  long long v15 = (__CFString *)a7;
  id v16 = [(CPLEngineStore *)self mainScopeIdentifier];
  int v17 = [v13 isEqualToString:v16];

  if (v17)
  {
    [(CPLEngineStore *)self _loadResetEvents];
    if ((unint64_t)[(NSMutableArray *)self->_resetEvents count] >= 5)
    {
      do
        [(NSMutableArray *)self->_resetEvents removeObjectAtIndex:0];
      while ((unint64_t)[(NSMutableArray *)self->_resetEvents count] > 4);
    }
    int v18 = [MEMORY[0x1E4F29128] UUID];
    int v19 = [v18 UUIDString];

    if (!v15) {
      long long v15 = @"unknown reason";
    }
    resetEvents = self->_resetEvents;
    if (v8)
    {
      v31[0] = @"type";
      v31[1] = @"cause";
      v32[0] = v12;
      v32[1] = v15;
      v32[2] = v19;
      __int16 v21 = v14;
      v31[2] = @"uuid";
      v31[3] = @"date";
      if (!v14)
      {
        __int16 v21 = [MEMORY[0x1E4F1C9C8] date];
      }
      v31[4] = @"pending";
      v32[3] = v21;
      v32[4] = MEMORY[0x1E4F1CC38];
      id v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = v32;
      uint64_t v24 = v31;
      uint64_t v25 = 5;
    }
    else
    {
      v29[0] = @"type";
      v29[1] = @"cause";
      v30[0] = v12;
      v30[1] = v15;
      v30[2] = v19;
      __int16 v21 = v14;
      v29[2] = @"uuid";
      v29[3] = @"date";
      if (!v14)
      {
        __int16 v21 = [MEMORY[0x1E4F1C9C8] date];
      }
      v30[3] = v21;
      id v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = v30;
      uint64_t v24 = v29;
      uint64_t v25 = 4;
    }
    long long v26 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
    [(NSMutableArray *)resetEvents addObject:v26];

    if (!v14) {
    [(NSMutableArray *)self->_resetEvents writeToURL:self->_resetEventsURL atomically:1];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    long long v28 = [WeakRetained feedback];
    [v28 reportResetType:v12 reason:v15 uuid:v19];
  }
}

- (void)_loadResetEvents
{
  if (!self->_resetEvents)
  {
    uint64_t v3 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithContentsOfURL:self->_resetEventsURL];
    resetEvents = self->_resetEvents;
    self->_resetEvents = v3;

    if (!self->_resetEvents)
    {
      self->_resetEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      MEMORY[0x1F41817F8]();
    }
  }
}

- (void)registerStorage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if ([(CPLEngineStore *)self state])
  {
    if (!_CPLSilentLogging)
    {
      BOOL v8 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v13 = v11;
        __int16 v14 = 2112;
        long long v15 = self;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to register %@ to %@ while the library is already open", buf, 0x16u);
      }
    }
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    [v9 handleFailureInMethod:a2, self, v10, 368, @"Trying to register %@ to %@ while the library is already open", v11, self object file lineNumber description];

    abort();
  }
  storages = self->_storages;
  if (!storages)
  {
    int v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_storages;
    self->_storages = v6;

    storages = self->_storages;
  }
  [(NSHashTable *)storages addObject:v11];
}

- (NSArray)storages
{
  return [(NSHashTable *)self->_storages allObjects];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_state)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = [(id)objc_opt_class() stateDescriptionForState:self->_state];
        *(_DWORD *)long long buf = 138412546;
        id v11 = self;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "at dealloc time, %@ should not be in state %@", buf, 0x16u);
      }
    }
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    BOOL v8 = [(id)objc_opt_class() stateDescriptionForState:self->_state];
    [v6 handleFailureInMethod:a2, self, v7, 360, @"at dealloc time, %@ should not be in state %@", self, v8 object file lineNumber description];

    abort();
  }
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineStore;
  [(CPLEngineStore *)&v9 dealloc];
}

- (CPLEngineStore)initWithEngineLibrary:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)CPLEngineStore;
  int v6 = [(CPLEngineStore *)&v73 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    BOOL v8 = [[CPLEngineScopeStorage alloc] initWithEngineStore:v7 name:@"scopes"];
    scopes = v7->_scopes;
    v7->_scopes = v8;

    id v10 = [(CPLEngineStorage *)[CPLEngineScopeCleanupTasks alloc] initWithEngineStore:v7 name:@"cleanupTasks"];
    cleanupTasks = v7->_cleanupTasks;
    v7->_cleanupTasks = v10;

    __int16 v12 = [[CPLEnginePushRepository alloc] initWithEngineStore:v7 name:@"pushRepository"];
    pushRepository = v7->_pushRepository;
    v7->_pushRepository = v12;

    uint64_t v14 = [(CPLEngineStorage *)[CPLEngineChangePipe alloc] initWithEngineStore:v7 name:@"pullQueue"];
    pullQueue = v7->_pullQueue;
    v7->_pullQueue = v14;

    uint64_t v16 = [(CPLEngineStorage *)[CPLEngineRevertRecords alloc] initWithEngineStore:v7 name:@"revertRecords"];
    revertRecords = v7->_revertRecords;
    v7->_revertRecords = v16;

    int v18 = [(CPLEngineStorage *)[CPLEngineIDMapping alloc] initWithEngineStore:v7 name:@"idMapping"];
    idMapping = v7->_idMapping;
    v7->_idMapping = v18;

    uint64_t v20 = [(CPLEngineStorage *)[CPLEngineCloudCache alloc] initWithEngineStore:v7 name:@"cloudCache"];
    cloudCache = v7->_cloudCache;
    v7->_cloudCache = v20;

    id v22 = [[CPLEngineTransientRepository alloc] initWithEngineStore:v7 name:@"transientPullRepository"];
    transientPullRepository = v7->_transientPullRepository;
    v7->_transientPullRepository = v22;

    uint64_t v24 = [[CPLEngineResourceStorage alloc] initWithEngineStore:v7 name:@"resources"];
    resourceStorage = v7->_resourceStorage;
    v7->_resourceStorage = v24;

    long long v26 = [[CPLEngineResourceDownloadQueue alloc] initWithEngineStore:v7 name:@"downloadQueue"];
    downloadQueue = v7->_downloadQueue;
    v7->_downloadQueue = v26;

    long long v28 = [(CPLEngineStorage *)[CPLEngineOutgoingResources alloc] initWithEngineStore:v7 name:@"outgoingResources"];
    outgoingResources = v7->_outgoingResources;
    v7->_outgoingResources = v28;

    unint64_t v30 = [(CPLEngineStorage *)[CPLEngineRemappedRecords alloc] initWithEngineStore:v7 name:@"remappedDeletes"];
    remappedRecords = v7->_remappedRecords;
    v7->_remappedRecords = v30;

    uint64_t v32 = [(CPLEngineStorage *)[CPLEngineQuarantinedRecords alloc] initWithEngineStore:v7 name:@"quarantinedRecords"];
    quarantinedRecords = v7->_quarantinedRecords;
    v7->_quarantinedRecords = v32;

    __int16 v34 = [[CPLEngineStatusCenter alloc] initWithEngineStore:v7 name:@"statusCenter"];
    statusCenter = v7->_statusCenter;
    v7->_statusCenter = v34;

    uint64_t v36 = [(CPLEngineStorage *)[CPLEnginePendingRecordChecks alloc] initWithEngineStore:v7 name:@"pendingRecordChecks"];
    pendingRecordChecks = v7->_pendingRecordChecks;
    v7->_pendingRecordChecks = v36;

    char v38 = [(CPLEngineStorage *)[CPLEngineIgnoredRecords alloc] initWithEngineStore:v7 name:@"ignoredRecords"];
    ignoredRecords = v7->_ignoredRecords;
    v7->_ignoredRecords = v38;

    char v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    batchedTransactions = v7->_batchedTransactions;
    v7->_batchedTransactions = v40;

    id v42 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v43 = dispatch_queue_create("com.apple.cpl.store.batchedtransactions", v42);
    batchedTransactionsQueue = v7->_batchedTransactionsQueue;
    v7->_batchedTransactionsQueue = (OS_dispatch_queue *)v43;

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_engineLibrary);
    BOOL v46 = [WeakRetained clientLibraryBaseURL];
    uint64_t v47 = [v46 URLByAppendingPathComponent:@"resetevents.plist" isDirectory:0];
    resetEventsURL = v7->_resetEventsURL;
    v7->_resetEventsURL = (NSURL *)v47;

    double v49 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v50 = dispatch_queue_create("com.apple.cpl.pendingupdate", v49);
    pendingUpdateQueue = v7->_pendingUpdateQueue;
    v7->_pendingUpdateQueue = (OS_dispatch_queue *)v50;

    id v52 = objc_loadWeakRetained((id *)&v7->_engineLibrary);
    char v53 = [v52 clientLibraryBaseURL];
    id v54 = [v53 URLByAppendingPathComponent:@"derivatives" isDirectory:1];

    id v55 = [[CPLEngineDerivativesCache alloc] initWithCacheURL:v54];
    derivativesCache = v7->_derivativesCache;
    v7->_derivativesCache = v55;

    id v57 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v58 = dispatch_queue_create("com.apple.cpl.shouldsyncscopelist", v57);
    shouldSyncScopeListQueue = v7->_shouldSyncScopeListQueue;
    v7->_shouldSyncScopeListQueue = (OS_dispatch_queue *)v58;

    uint64_t v60 = [[CPLEngineRecordComputeStatePushQueue alloc] initWithEngineStore:v7 name:@"recordComputeStatePushQueue"];
    recordComputeStatePushQueue = v7->_recordComputeStatePushQueue;
    v7->_recordComputeStatePushQueue = v60;

    if (!_CPLSilentLogging)
    {
      int v62 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        char v63 = [(NSHashTable *)v7->_storages allObjects];
        *(_DWORD *)long long buf = 138412546;
        long long v75 = v7;
        __int16 v76 = 2112;
        id v77 = v63;
        _os_log_impl(&dword_1B4CAC000, v62, OS_LOG_TYPE_DEBUG, "Initing store %@ - storages: %@", buf, 0x16u);
      }
    }
    int v64 = +[CPLPlatform currentPlatform];
    uint64_t v65 = [v64 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v65;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        v68 = __CPLStoreOSLogDomain_2929();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          id v69 = (CPLEngineStore *)objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          long long v75 = v69;
          char v70 = v69;
          _os_log_impl(&dword_1B4CAC000, v68, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      id v71 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
      [v71 handleFailureInMethod:a2, v7, v72, 354, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
  }
  return v7;
}

- (BOOL)mainScopeSupportsSharingScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStore *)self mainScopeIdentifier];
  LOBYTE(self) = [(CPLEngineStore *)self supportsSharingScopeWithIdentifier:v4 forScopeWithIdentifier:v5];

  return (char)self;
}

- (BOOL)supportsSharingScopeWithIdentifier:(id)a3 forScopeWithIdentifier:(id)a4
{
  id v5 = a3;
  int v6 = CPLSharingScopePrefixForScopeWithIdentifier(a4);
  char v7 = [v5 hasPrefix:v6];

  return v7;
}

- (NSString)mainScopeIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  uint64_t v3 = [WeakRetained mainScopeIdentifier];

  return (NSString *)v3;
}

+ (id)platformImplementationProtocol
{
  uint64_t v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [v2 stringByAppendingString:@"Implementation"];
  id v4 = NSProtocolFromString(v3);

  return v4;
}

+ (id)stateDescriptionForState:(unint64_t)a3
{
  if (a3 > 4) {
    return @"UNKNOWN";
  }
  else {
    return off_1E60A6E50[a3];
  }
}

+ (NSArray)storageNames
{
  if (storageNames_onceToken != -1) {
    dispatch_once(&storageNames_onceToken, &__block_literal_global_741);
  }
  uint64_t v2 = (void *)storageNames_storageNames;
  return (NSArray *)v2;
}

void __30__CPLEngineStore_storageNames__block_invoke()
{
  v0 = (void *)storageNames_storageNames;
  storageNames_storageNames = (uint64_t)&unk_1F0D915F8;
}

+ (void)setDontBatchTransactions:(BOOL)a3
{
  _dontBatchTransactions = a3;
}

+ (BOOL)dontBatchTransactions
{
  return _dontBatchTransactions;
}

- (id)newClientCacheViewUsesPushRepository:(BOOL *)a3
{
  id v5 = [[CPLClientCacheBaseView alloc] initWithStore:self];
  int v6 = [(CPLEngineStore *)self pushRepository];
  char v7 = [v6 storedExtractedBatch];
  if (v7)
  {
    BOOL v8 = [CPLChangeBatchChangeStorage alloc];
    objc_super v9 = [v7 batch];
    id v10 = [(CPLChangeBatchChangeStorage *)v8 initWithBatch:v9 name:@"extractedBatch"];

    id v11 = [[CPLChangedRecordStorageView alloc] initWithChangeStorage:v10 overStorageView:v5];
    id v5 = (CPLClientCacheBaseView *)v11;
  }
  if ([v6 isEmpty])
  {
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    __int16 v12 = [[CPLPushRepositoryStorage alloc] initWithPushRepository:v6];
    id v13 = [[CPLChangedRecordStorageView alloc] initWithChangeStorage:v12 overStorageView:v5];

    if (a3) {
      *a3 = 1;
    }

    id v5 = (CPLClientCacheBaseView *)v13;
  }
  if ([(CPLEngineStore *)self hasUnacknowledgedChanges])
  {
    uint64_t v14 = [[CPLUnacknowledgedChangeStorage alloc] initWithStore:self];
    long long v15 = [[CPLChangedRecordStorageView alloc] initWithChangeStorage:v14 overStorageView:v5];

    id v5 = (CPLClientCacheBaseView *)v15;
  }

  return v5;
}

@end