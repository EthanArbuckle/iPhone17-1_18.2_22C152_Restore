@interface SGDCloudKitSync
+ (id)_callbackQueue;
+ (id)_sharedInstanceConfigurationQueue;
+ (id)apsEnvironmentStringForContainer:(id)a3;
+ (id)sharedInstance;
+ (void)setSharedInstanceConfigurationBlock:(id)a3;
- (BOOL)pauseIfNeededAndReturnRetryEligibilityForError:(id)a3;
- (BOOL)shouldRecreateZoneForRecordError:(id)a3 operationError:(id)a4;
- (SGDCloudKitSync)init;
- (id)_ckErrorForId:(id)a3 inError:(id)a4;
- (id)accountInfo;
- (id)addCreateZoneAttemptOperationWithRetries:(unint64_t)a3;
- (id)addCreateZoneOperation;
- (id)addDeleteAndRecreateZoneOperation;
- (id)addDeleteZoneAttemptOperationWithRetries:(unint64_t)a3;
- (id)addDeleteZoneOperation;
- (id)addFetchNewEntitiesAttemptOperationWithRetries:(unint64_t)a3;
- (id)addFetchNewEntitiesOperation;
- (id)addManateeSanityCheckOperation;
- (id)addOperation;
- (id)addOperation:(id)a3;
- (id)addProcureSaltAttemptOperationWithRetries:(unint64_t)a3;
- (id)addProcureSaltOperation;
- (id)addWriteOperationForRecordGetter:(id)a3 deleteGetter:(id)a4 withRetries:(unint64_t)a5;
- (id)addWriteOperationForRecordGetter:(id)a3 deleteGetter:(id)a4 withRetries:(unint64_t)a5 isFirstTry:(BOOL)a6;
- (id)getUnderlyingError:(id)a3;
- (id)invokeNewEntitiesCallbackWithEntity:(id)a3;
- (id)privacySalt;
- (id)recordZoneId;
- (id)shouldRemoveEventsFromEventKit;
- (void)_addDependency:(id)a3 toTrain:(id)a4;
- (void)_coupleOperationTrainWithStart:(id)a3 end:(id)a4;
- (void)accountChanged:(id)a3;
- (void)addEnrichment:(id)a3 withParentEntity:(id)a4;
- (void)clearErrors;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)createSubscriptionWithRetries:(unint64_t)a3;
- (void)dealloc;
- (void)deleteGroupId:(id)a3;
- (void)deleteStorageEvent:(id)a3;
- (void)deleteZoneWithCompletion:(id)a3;
- (void)disable;
- (void)failSalt;
- (void)processStateChanges;
- (void)resume;
- (void)setDatabase:(id)a3;
- (void)setDeleteAllSyncedItemsCallback:(id)a3;
- (void)setNewEntitiesCallback:(id)a3;
- (void)setReadyForNewEntities:(BOOL)a3;
- (void)suspend;
- (void)suspendAndResumeAfter:(double)a3;
@end

@implementation SGDCloudKitSync

void __23__SGDCloudKitSync_init__block_invoke_239(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x1E4F5DAF0];
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  [v2 setCloudKitPersistedState:v3];
}

void __23__SGDCloudKitSync_init__block_invoke_244(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SGDCloudKitSync_init__block_invoke_2;
  block[3] = &unk_1E65C0018;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __23__SGDCloudKitSync_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processStateChanges];
}

- (void)processStateChanges
{
  v17[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_processingStateChanges)
  {
    self->_processingStateChanges = 1;
    v7 = [(SGDCloudKitSync *)self accountInfo];
    v8 = [(SGDCloudKitSync *)self shouldRemoveEventsFromEventKit];
    v9 = (void *)MEMORY[0x1E4F5DA30];
    v17[0] = v8;
    v17[1] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke;
    v12[3] = &unk_1E65BF1A8;
    v12[4] = self;
    id v13 = v7;
    id v14 = v8;
    SEL v15 = a2;
    id v11 = v8;
    v5 = v7;
    [v9 waitForFuturesToComplete:v10 withCallback:v12];

LABEL_6:
    return;
  }
  BOOL pendingProcessStateChanges = self->_pendingProcessStateChanges;
  v5 = sgLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (pendingProcessStateChanges)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGCK Already processing state changes and re-processing once complete already scheduled as well.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGCK Already processing state changes -- will re-process again once complete.", buf, 2u);
  }

  self->_BOOL pendingProcessStateChanges = 1;
}

- (id)shouldRemoveEventsFromEventKit
{
  v16[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = +[SGAccountsAdapter sharedInstance];
  v4 = [v3 primaryICloudCalendarAccount];

  v5 = sgLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGCK Going to request account info to determine whether events should be removed from EK...", buf, 2u);
    }

    v7 = [(SGDCloudKitSync *)self accountInfo];
    v8 = (void *)MEMORY[0x1E4F5DA30];
    v16[0] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke;
    v13[3] = &unk_1E65B8E28;
    v13[4] = self;
    id v14 = v7;
    id v10 = v7;
    id v11 = [v8 createAfter:v9 onCreate:v13];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGCK should remove events from EK because there is no primary iCloud Calendar account", buf, 2u);
    }

    id v11 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:MEMORY[0x1E4F1CC38] error:0];
  }
  return v11;
}

- (id)accountInfo
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_accountInfoFuture)
  {
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - returning existing SGFuture", buf, 2u);
    }

    v4 = self->_accountInfoFuture;
  }
  else
  {
    v5 = objc_opt_new();
    [v5 setTargetQueue:self->_queue useAfterCompletion:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __30__SGDCloudKitSync_accountInfo__block_invoke;
    v19[3] = &unk_1E65B8DD8;
    v19[4] = self;
    id v6 = v5;
    id v20 = v6;
    v7 = (void *)[v19 copy];
    v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (self->_accountInfoInFlight) {
        v16 = @"YES";
      }
      else {
        v16 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - Scheduling call to CloudKit (already one in flight: %@)", buf, 0xCu);
    }

    if (self->_accountInfoInFlight) {
      int64_t v9 = 1000000000;
    }
    else {
      int64_t v9 = 0;
    }
    dispatch_time_t v10 = dispatch_time(0, v9);
    self->_accountInfoInFlight = 0;
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __30__SGDCloudKitSync_accountInfo__block_invoke_262;
    void v17[3] = &unk_1E65C0440;
    v17[4] = self;
    id v18 = v7;
    id v12 = v7;
    dispatch_after(v10, queue, v17);
    accountInfoFuture = self->_accountInfoFuture;
    self->_accountInfoFuture = (SGFuture *)v6;
    id v14 = v6;

    v4 = self->_accountInfoFuture;
  }
  return v4;
}

void __38__SGDCloudKitSync_processStateChanges__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56));
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LODWORD(v46) = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke_2;
  v44[3] = &unk_1E65BF380;
  uint64_t v2 = *(void *)(a1 + 56);
  v44[5] = buf;
  v44[6] = v2;
  v44[4] = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1CB79B4C0](v44);
  v4 = (void (**)(void))MEMORY[0x1CB79B4C0]();

  _Block_object_dispose(buf, 8);
  v5 = [*(id *)(a1 + 40) result];
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) result];
    if ([v6 accountStatus])
    {
      v7 = [*(id *)(a1 + 40) result];
      char v8 = [v7 supportsDeviceToDeviceEncryption];

      if ((v8 & 1) == 0)
      {
        int64_t v9 = sgLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGCK processStateChanges -- failing salt because !supportsDeviceToDeviceEncryption", buf, 2u);
        }

        [*(id *)(a1 + 32) failSalt];
      }
    }
    else
    {
    }
  }
  dispatch_time_t v10 = [*(id *)(a1 + 48) error];
  BOOL v11 = v10 == 0;

  if (!v11) {
    goto LABEL_31;
  }
  id v12 = [*(id *)(a1 + 48) result];
  int v13 = [v12 BOOLValue];

  id v14 = [*(id *)(*(void *)(a1 + 32) + 104) eventsWereRemovedFromEventKit];
  int v15 = [v14 BOOLValue];

  if (v13 == v15) {
    goto LABEL_31;
  }
  v16 = sgLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [*(id *)(*(void *)(a1 + 32) + 104) eventsWereRemovedFromEventKit];
    int v18 = [v17 BOOLValue];
    v19 = @"ENABLED";
    if (v18) {
      id v20 = @"DISABLED";
    }
    else {
      id v20 = @"ENABLED";
    }
    if (v13) {
      v19 = @"DISABLED";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_INFO, "SGCK System State Change: Sync %@ --> %@", buf, 0x16u);
  }
  v21 = +[SGXpcTransaction transactionWithName:"SGDCloudKitSync.processStateChanges"];
  if (!v13)
  {
    v30 = [*(id *)(*(void *)(a1 + 32) + 104) hasSubscription];
    char v31 = [v30 BOOLValue];

    if ((v31 & 1) == 0)
    {
      v32 = sgLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v32, OS_LOG_TYPE_INFO, "SGCK Creating subscription in response to state change", buf, 2u);
      }

      [*(id *)(a1 + 32) createSubscriptionWithRetries:3];
    }
    v33 = sgLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_INFO, "SGCK Will fetch new entities in response to state change", buf, 2u);
    }

    id v34 = (id)[*(id *)(a1 + 32) addFetchNewEntitiesOperation];
    [*(id *)(*(void *)(a1 + 32) + 104) setEventsWereRemovedFromEventKit:MEMORY[0x1E4F1CC28]];
    v35 = sgLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v35, OS_LOG_TYPE_INFO, "SGCK Set new persisted state.", buf, 2u);
    }

LABEL_31:
    v4[2](v4);
    goto LABEL_32;
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__256;
  v47 = __Block_byref_object_dispose__257;
  id v48 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke_258;
  v41[3] = &unk_1E65BE4B8;
  uint64_t v23 = *(void *)(a1 + 32);
  v22 = (uint64_t *)(a1 + 32);
  v41[4] = v23;
  v41[5] = v42;
  v41[6] = buf;
  v24 = (void *)MEMORY[0x1CB79B4C0](v41);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke_259;
  v38[3] = &unk_1E65B8DB0;
  uint64_t v25 = *v22;
  v40 = v42;
  v38[4] = v25;
  v39 = v4;
  uint64_t v26 = MEMORY[0x1CB79B4C0](v38);
  v27 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v26;

  if (*(unsigned char *)(*v22 + 40))
  {
    v28 = sgLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1CA650000, v28, OS_LOG_TYPE_INFO, "SGCK About to hop on to background queue to invoke _deleteAllSyncedItemsCallback", v37, 2u);
    }

    v29 = +[SGDCloudKitSync _callbackQueue];
    dispatch_async(v29, v24);
  }
  else
  {
    v36 = sgLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1CA650000, v36, OS_LOG_TYPE_INFO, "SGCK Skipping background queue block because _readyForNewEntities is false.", v37, 2u);
    }

    (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
  }

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(buf, 8);

LABEL_32:
}

void __38__SGDCloudKitSync_processStateChanges__block_invoke_2(uint64_t a1)
{
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1u))
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"SGDCloudKitSync.m" lineNumber:1354 description:@"This block should not be run more than once"];
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56));
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 193))
  {
    *(unsigned char *)(v2 + 193) = 0;
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGCK Re-processing state changes because a request came in while this one was in progress...", v5, 2u);
    }

    [*(id *)(a1 + 32) processStateChanges];
  }
}

- (void)failSalt
{
  [(_SGDCloudKitSyncPersistedState *)self->_persistedState setSalt:0];
  [(_SGDCloudKitSyncPersistedState *)self->_persistedState setSaltAtomicReferenceId:0];
  persistedState = self->_persistedState;
  [(_SGDCloudKitSyncPersistedState *)persistedState setSaltUsesManatee:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySaltFuture, 0);
  objc_storeStrong((id *)&self->_procureSaltError, 0);
  objc_storeStrong((id *)&self->_deleteZoneError, 0);
  objc_storeStrong((id *)&self->_createZoneError, 0);
  objc_storeStrong((id *)&self->_inProgressFetchNewEntitiesOperation, 0);
  objc_storeStrong((id *)&self->_inProgressDeleteZoneOperation, 0);
  objc_storeStrong((id *)&self->_inProgressCreateZoneOperation, 0);
  objc_storeStrong((id *)&self->_inProgressProcureSaltOperation, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_accountInfoFuture, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_operationsToAddToOpQueue, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong(&self->_deleteAllSyncedItemsCallback, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_kvoHandler, 0);
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK connectionDidReconnect:%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = @"NO";
    if (v4) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    BOOL v11 = v7;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didChangeConnectedStatus:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didFailToSendOutgoingMessage:%@ error:%@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didSendOutgoingMessage:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didReceiveIncomingMessage:%@", buf, 0x16u);
  }

  __int16 v10 = (void *)MEMORY[0x1E4F1A1D0];
  id v11 = [v8 userInfo];
  uint64_t v12 = [v10 notificationFromRemoteNotificationDictionary:v11];

  if ([v12 notificationType] == 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 1996, @"Invalid parameter not satisfying: %@", @"[notification isKindOfClass:[CKDatabaseNotification class]]" object file lineNumber description];
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SGDCloudKitSync_connection_didReceiveIncomingMessage___block_invoke;
    block[3] = &unk_1E65BEF88;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __56__SGDCloudKitSync_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) eventsWereRemovedFromEventKit];
  int v3 = [v2 BOOLValue];

  BOOL v4 = sgLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK Got an APNS notification, but not syncing because sync is currently disabled.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK Will fetch new entities for incoming message", v7, 2u);
    }

    id v6 = (id)[*(id *)(a1 + 32) addFetchNewEntitiesOperation];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didReceivePublicToken:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138413058;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didReceiveToken:%@ forTopic:%@ identifier:%@", (uint8_t *)&v14, 0x2Au);
  }
}

- (id)privacySalt
{
  int v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGCK privacySalt ensuring not already on _queue...", buf, 2u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if ([MEMORY[0x1E4F5DAF0] useManateeSaltForHistory])
  {
    *(void *)buf = 0;
    __int16 v18 = buf;
    uint64_t v19 = 0x3032000000;
    __int16 v20 = __Block_byref_object_copy__19097;
    id v21 = __Block_byref_object_dispose__19098;
    id v22 = 0;
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    BOOL v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v12 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK privacySalt about to dispatch_sync to _queue", v12, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_327;
    block[3] = &unk_1E65BE4B8;
    void block[4] = self;
    void block[5] = buf;
    block[6] = &v13;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v14 + 24))
    {
      id v6 = (void *)*((void *)v18 + 5);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_331;
      v10[3] = &unk_1E65B9008;
      v10[4] = self;
      [v6 wait:v10];
    }
    id v7 = *((id *)v18 + 5);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGCK privacySalt immediately returning empty NSData because [SGPreferenceStorage useManateeSaltForHistory] is false", buf, 2u);
    }

    if (privacySalt__pasOnceToken177 != -1) {
      dispatch_once(&privacySalt__pasOnceToken177, &__block_literal_global_326);
    }
    id v7 = (id)privacySalt__pasExprOnceResult;
  }
  return v7;
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_327(void *a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK privacySalt is now on _queue", buf, 2u);
  }

  if (*(void *)(a1[4] + 208))
  {
    int v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGCK privacySalt reusing existing future", buf, 2u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 208));
  }
  else
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(a1[5] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    id v7 = (unsigned char *)a1[4];
    if (v7[121])
    {
      int v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGCK privacySalt is resolving to empty data because CKErrorIncompatibleVersion was previously encountered, indicating that the server no longer supports syncing with this software version", buf, 2u);
      }

      [*(id *)(*(void *)(a1[5] + 8) + 40) succeed:*MEMORY[0x1E4F93BF8]];
    }
    else
    {
      id v9 = [v7 accountInfo];
      id v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGCK privacySalt about to wait on accountInfoFuture", buf, 2u);
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_328;
      v14[3] = &unk_1E65B8FE0;
      long long v15 = *((_OWORD *)a1 + 2);
      [v9 wait:v14];
      if (([*(id *)(*(void *)(a1[5] + 8) + 40) isComplete] & 1) == 0)
      {
        id v11 = sgLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_INFO, "SGCK privacySalt future did not complete synchronously; will store future in _privacySaltFuture for reuse",
            buf,
            2u);
        }

        objc_storeStrong((id *)(a1[4] + 208), *(id *)(*(void *)(a1[5] + 8) + 40));
        id v12 = *(void **)(*(void *)(a1[5] + 8) + 40);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_329;
        v13[3] = &unk_1E65B9008;
        v13[4] = a1[4];
        [v12 wait:v13];
      }
    }
  }
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  id v7 = a2;
  dispatch_assert_queue_not_V2(v6);
  uint64_t v8 = [v7 length];

  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = @"0-length";
    id v11 = @"nil";
    if (!v7) {
      id v10 = @"nil";
    }
    if (v8) {
      id v10 = @"successful";
    }
    if (v5) {
      id v11 = v5;
    }
    int v12 = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    long long v15 = v11;
    _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGCK privacySalt outcome: %@ result, %@ error", (uint8_t *)&v12, 0x16u);
  }
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_328(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56));
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK privacySalt finished waiting on accountInfoFuture", (uint8_t *)&v17, 2u);
  }

  if (v6)
  {
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGCK privacySalt error retrieving account info: %@", (uint8_t *)&v17, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fail:v6];
    goto LABEL_23;
  }
  if ([v5 accountStatus] == 2)
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      id v10 = "SGCK privacySalt resolving to empty data because iCloud account is restricted (parental controls, etc)";
LABEL_21:
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v17, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if ([v5 accountStatus] == 3)
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      id v10 = "SGCK privacySalt resolving to empty data because there is no iCloud account";
      goto LABEL_21;
    }
LABEL_22:

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) succeed:*MEMORY[0x1E4F93BF8]];
    goto LABEL_23;
  }
  if (([v5 supportsDeviceToDeviceEncryption] & 1) == 0)
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      id v10 = "SGCK privacySalt resolving to empty data because device-to-device encryption is not supported";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  id v11 = [*(id *)(*(void *)(a1 + 32) + 104) saltUsesManatee];
  if (([v11 BOOLValue] & 1) == 0)
  {

LABEL_25:
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGCK privacySalt resolving to empty data because no salt has been generated yet", (uint8_t *)&v17, 2u);
    }
    goto LABEL_22;
  }
  int v12 = [*(id *)(*(void *)(a1 + 32) + 104) salt];

  if (!v12) {
    goto LABEL_25;
  }
  uint64_t v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "SGCK privacySalt succeeded (using existing known salt)", (uint8_t *)&v17, 2u);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  long long v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v16 = [*(id *)(v14 + 104) salt];
  [v15 succeed:v16];

LABEL_23:
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_329(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_2;
  block[3] = &unk_1E65BEF88;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGCK privacySalt future asynchronously completed, will set _privacySaltFuture to nil", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 208);
  *(void *)(v3 + 208) = 0;
}

void __30__SGDCloudKitSync_privacySalt__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:*MEMORY[0x1E4F93BF8]];
  uint64_t v2 = (void *)privacySalt__pasExprOnceResult;
  privacySalt__pasExprOnceResult = v1;
}

- (void)deleteZoneWithCompletion:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke;
  v7[3] = &unk_1E65C0440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_2;
  id v11 = &unk_1E65C0440;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v4;
  id v5 = [v2 blockOperationWithBlock:&v8];
  id v6 = objc_msgSend(v3, "addOperation:", v5, v8, v9, v10, v11);
  id v7 = [*(id *)(a1 + 32) addDeleteZoneOperation];
  [v6 addDependency:v7];
}

void __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 176) copy];
    uint64_t v3 = +[SGDCloudKitSync _callbackQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_3;
    v6[3] = &unk_1E65C0440;
    id v4 = *(id *)(a1 + 40);
    id v7 = v2;
    id v8 = v4;
    id v5 = v2;
    dispatch_async(v3, v6);
  }
}

uint64_t __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)deleteStorageEvent:(id)a3
{
  id v4 = [a3 opaqueKey];
  if (v4)
  {
    [(SGDCloudKitSync *)self deleteGroupId:v4];
  }
  else
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGCK deleteStorageEvent failed because no group id", v6, 2u);
    }
  }
}

- (id)recordZoneId
{
  if (recordZoneId__pasOnceToken173 != -1) {
    dispatch_once(&recordZoneId__pasOnceToken173, &__block_literal_global_320);
  }
  uint64_t v2 = (void *)recordZoneId__pasExprOnceResult;
  return v2;
}

void __31__SGDCloudKitSync_recordZoneId__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v2 = [v1 initWithZoneName:@"events" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v3 = (void *)recordZoneId__pasExprOnceResult;
  recordZoneId__pasExprOnceResult = v2;
}

- (id)invokeNewEntitiesCallbackWithEntity:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(_SGDCloudKitSyncPersistedState *)self->_persistedState eventsWereRemovedFromEventKit];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    id v8 = objc_opt_new();
    [v8 setTargetQueue:self->_queue useAfterCompletion:0];
    uint64_t v9 = +[SGDCloudKitSync _callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SGDCloudKitSync_invokeNewEntitiesCallbackWithEntity___block_invoke;
    block[3] = &unk_1E65C0688;
    id v10 = v8;
    id v14 = v10;
    long long v15 = self;
    id v16 = v4;
    dispatch_async(v9, block);

    id v11 = v16;
    id v7 = v10;
  }
  return v7;
}

void __55__SGDCloudKitSync_invokeNewEntitiesCallbackWithEntity___block_invoke(void *a1)
{
  id v1 = (void *)a1[4];
  objc_msgSend(NSNumber, "numberWithBool:", (*(uint64_t (**)(void, void))(*(void *)(a1[5] + 24) + 16))(*(void *)(a1[5] + 24), a1[6]));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 succeed:v2];
}

- (void)setDeleteAllSyncedItemsCallback:(id)a3
{
  id v5 = a3;
  if (self->_deleteAllSyncedItemsCallback)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 1816, @"Invalid parameter not satisfying: %@", @"_deleteAllSyncedItemsCallback == nil" object file lineNumber description];
  }
  int v6 = (void *)[v5 copy];

  id v7 = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SGDCloudKitSync_setDeleteAllSyncedItemsCallback___block_invoke;
  v13[3] = &unk_1E65BF970;
  id v14 = v7;
  id v15 = v6;
  id v8 = v6;
  uint64_t v9 = v7;
  id v10 = (void *)[v13 copy];
  id deleteAllSyncedItemsCallback = self->_deleteAllSyncedItemsCallback;
  self->_id deleteAllSyncedItemsCallback = v10;
}

uint64_t __51__SGDCloudKitSync_setDeleteAllSyncedItemsCallback___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)setNewEntitiesCallback:(id)a3
{
  id v5 = a3;
  if (self->_callback)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 1805, @"Invalid parameter not satisfying: %@", @"_callback == nil" object file lineNumber description];
  }
  int v6 = (void *)[v5 copy];

  id v7 = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SGDCloudKitSync_setNewEntitiesCallback___block_invoke;
  v13[3] = &unk_1E65B8FB8;
  id v14 = v7;
  id v15 = v6;
  id v8 = v6;
  uint64_t v9 = v7;
  id v10 = (void *)[v13 copy];
  id callback = self->_callback;
  self->_id callback = v10;
}

uint64_t __42__SGDCloudKitSync_setNewEntitiesCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_assert_queue_not_V2(v3);
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v5;
}

- (void)setReadyForNewEntities:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SGDCloudKitSync_setReadyForNewEntities___block_invoke;
  v4[3] = &unk_1E65BBAB8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

void __42__SGDCloudKitSync_setReadyForNewEntities___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    int v16 = 138412290;
    int v17 = v3;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGCK setReadyForNewEntities:%@", (uint8_t *)&v16, 0xCu);
  }

  int v4 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 == *(unsigned __int8 *)(v5 + 40))
  {
    int v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGCK ignoring because readyForNewEntities == _readyForNewEntities", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    *(unsigned char *)(v5 + 40) = v4;
    if (*(unsigned char *)(a1 + 40))
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 104) hasDeferredProcessStateChanges];
      int v8 = [v7 BOOLValue];

      uint64_t v9 = sgLogHandle();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v10)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGCK processing deferred state changes...", (uint8_t *)&v16, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 104) setHasDeferredProcessStateChanges:MEMORY[0x1E4F1CC28]];
        [*(id *)(a1 + 32) processStateChanges];
      }
      else
      {
        if (v10)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGCK no deferred state changes", (uint8_t *)&v16, 2u);
        }
      }
      id v11 = [*(id *)(*(void *)(a1 + 32) + 104) hasDeferredSync];
      int v12 = [v11 BOOLValue];

      id v13 = sgLogHandle();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_INFO, "SGCK processing deferred sync...", (uint8_t *)&v16, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 104) setHasDeferredSync:MEMORY[0x1E4F1CC28]];
        id v15 = (id)[*(id *)(a1 + 32) addFetchNewEntitiesOperation];
      }
      else
      {
        if (v14)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_INFO, "SGCK no deferred sync", (uint8_t *)&v16, 2u);
        }
      }
    }
  }
}

- (void)deleteGroupId:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGCK deleteGroupId:%@", buf, 0xCu);
  }

  if (v4)
  {
    int v6 = [(SGDCloudKitSync *)self recordZoneId];
    id v7 = +[SGXpcTransaction transactionWithName:"com.apple.suggestions.sgckDeleteGroupId"];
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__SGDCloudKitSync_deleteGroupId___block_invoke;
    v11[3] = &unk_1E65C0638;
    v11[4] = self;
    id v12 = v4;
    id v13 = v6;
    id v14 = v7;
    id v9 = v7;
    BOOL v10 = v6;
    dispatch_async(queue, v11);
  }
  else
  {
    BOOL v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGCK deleteGroupId: passed nil groupId...returning...", buf, 2u);
    }
  }
}

void __33__SGDCloudKitSync_deleteGroupId___block_invoke(id *a1)
{
  id v2 = [*((id *)a1[4] + 13) eventsWereRemovedFromEventKit];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGCK Not deleting entity from CloudKit because current state prohibits syncing", buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = getCTGreenTeaOsLogHandle();
    int v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "Begin: Transmitting Confirm/Reject Of Calendar Event", buf, 2u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __33__SGDCloudKitSync_deleteGroupId___block_invoke_309;
    v19[3] = &unk_1E65B8F90;
    id v7 = a1[4];
    __int16 v20 = a1[5];
    id v21 = a1[6];
    int v8 = [v7 addWriteOperationForRecordGetter:0 deleteGetter:v19 withRetries:3];
    id v9 = (void *)MEMORY[0x1CB79B230]();
    BOOL v10 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __33__SGDCloudKitSync_deleteGroupId___block_invoke_2;
    id v16 = &unk_1E65BFD88;
    id v17 = a1[4];
    id v18 = a1[7];
    id v11 = [v10 blockOperationWithBlock:&v13];

    objc_msgSend(v11, "addDependency:", v8, v13, v14, v15, v16, v17);
    id v12 = (id)[a1[4] addOperation:v11];

    id v4 = v20;
  }
}

id __33__SGDCloudKitSync_deleteGroupId___block_invoke_309(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  int v6 = SGSha256HMACData(v5, v3);

  id v7 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  int v8 = [v6 base64EncodedStringWithOptions:0];
  id v9 = (void *)[v7 initWithRecordName:v8 zoneID:*(void *)(a1 + 40)];

  v12[0] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

uint64_t __33__SGDCloudKitSync_deleteGroupId___block_invoke_2(uint64_t a1)
{
  id v2 = getCTGreenTeaOsLogHandle();
  id v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "End: Transmitting Confirm/Reject Of Calendar Event", v5, 2u);
  }

  return [*(id *)(a1 + 40) done];
}

- (void)addEnrichment:(id)a3 withParentEntity:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 duplicateKey];
  id v9 = [v8 entityKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v10 = [v9 groupId];
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "SGCK addEntity:%@ %@", buf, 0x16u);
  }

  if (v10)
  {
    id v12 = [(SGDCloudKitSync *)self recordZoneId];
    uint64_t v13 = +[SGXpcTransaction transactionWithName:"com.apple.suggestions.sgckAddEntity"];
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke;
    void v17[3] = &unk_1E65B8F68;
    v17[4] = self;
    id v18 = v10;
    id v19 = v12;
    id v20 = v6;
    id v21 = v7;
    id v22 = v13;
    id v15 = v13;
    id v16 = v12;
    dispatch_async(queue, v17);
  }
  else
  {
    id v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, "SGCK addEntity: - ignoring because groupId is nil", buf, 2u);
    }
  }
}

void __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke(id *a1)
{
  id v2 = [*((id *)a1[4] + 13) eventsWereRemovedFromEventKit];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGCK Not adding entity to CloudKit because current state prohibits syncing", buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = getCTGreenTeaOsLogHandle();
    id v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "Begin: Transmitting Calendar Event", buf, 2u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_302;
    v19[3] = &unk_1E65B8F40;
    id v7 = a1[4];
    id v20 = a1[5];
    id v21 = a1[6];
    id v22 = a1[7];
    id v23 = a1[8];
    int v8 = [v7 addWriteOperationForRecordGetter:v19 deleteGetter:0 withRetries:3];
    id v9 = (void *)MEMORY[0x1CB79B230]();
    BOOL v10 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_2;
    id v16 = &unk_1E65BFD88;
    id v17 = a1[4];
    id v18 = a1[9];
    id v11 = [v10 blockOperationWithBlock:&v13];

    objc_msgSend(v11, "addDependency:", v8, v13, v14, v15, v16, v17);
    id v12 = (id)[a1[4] addOperation:v11];

    id v4 = v20;
  }
}

id __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79B230]();
  int v8 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  id v9 = SGSha256HMACData(v8, v5);

  id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v11 = [v9 base64EncodedStringWithOptions:0];
  id v12 = (void *)[v10 initWithRecordName:v11 zoneID:*(void *)(a1 + 40)];

  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v14 = [*(id *)(a1 + 56) duplicateKey];
  id v15 = objc_msgSend(v13, "toCloudKitRecordWithId:parentEntityType:", v12, objc_msgSend(v14, "entityType"));

  id v16 = objc_alloc(MEMORY[0x1E4F1A348]);
  id v17 = (void *)[v16 initWithRecordID:v6 action:*MEMORY[0x1E4F19D98]];
  [v15 setObject:v17 forKeyedSubscript:@"r"];

  v20[0] = v15;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  return v18;
}

uint64_t __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_2(uint64_t a1)
{
  id v2 = getCTGreenTeaOsLogHandle();
  int v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "End: Transmitting Calendar Event", v5, 2u);
  }

  return [*(id *)(a1 + 40) done];
}

- (void)setDatabase:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_database)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 1620, @"Invalid parameter not satisfying: %@", @"_database == nil" object file lineNumber description];
  }
  if (!self->_callback)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 1621, @"Invalid parameter not satisfying: %@", @"_callback" object file lineNumber description];
  }
  id v7 = [v6 container];
  container = self->_container;
  self->_container = v7;

  objc_storeStrong((id *)&self->_database, a3);
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v21 = self->_container;
    *(_DWORD *)buf = 138412546;
    id v34 = v6;
    __int16 v35 = 2112;
    v36 = v21;
    _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGCK Got database: %@, container: %@", buf, 0x16u);
  }

  dispatch_resume((dispatch_object_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SGDCloudKitSync_setDatabase___block_invoke;
  block[3] = &unk_1E65BEF88;
  void block[4] = self;
  dispatch_async(queue, block);
  id location = 0;
  objc_initWeak(&location, self);
  if (self->_container)
  {
    id v11 = +[SGDCloudKitSync apsEnvironmentStringForContainer:](SGDCloudKitSync, "apsEnvironmentStringForContainer:");
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_283;
    v29[3] = &unk_1E65B8EF0;
    v29[4] = self;
    objc_copyWeak(&v30, &location);
    [v11 wait:v29];

    objc_destroyWeak(&v30);
  }
  else
  {
    id v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "CloudKit database %@ has nil container, therefore cannot get APS environment strong and APNS will not work.", buf, 0xCu);
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel_accountChanged_ name:*MEMORY[0x1E4F19BE0] object:0];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_296;
  v28[3] = &unk_1E65BEF88;
  v28[4] = self;
  uint64_t v14 = (void *)[v28 copy];
  kvoHandler = self->_kvoHandler;
  id v16 = NSStringFromSelector(sel_primaryICloudCalendarAccount);
  id v17 = +[SGAccountsAdapter sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_297;
  v26[3] = &unk_1E65B8F18;
  v26[4] = self;
  id v18 = v14;
  id v27 = v18;
  [(_PASKVOHandler *)kvoHandler reactAfterChangesToKeyPath:v16 ofObject:v17 usingBlock:v26];

  id v19 = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_2_299;
  v24[3] = &unk_1E65B8D68;
  id v25 = v18;
  id v20 = v18;
  dispatch_async(v19, v24);

  objc_destroyWeak(&location);
}

void __31__SGDCloudKitSync_setDatabase___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resume];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) hasSubscription];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK device does not have a subscription. Checking eligibility before creating one...", buf, 2u);
    }

    id v5 = [*(id *)(a1 + 32) shouldRemoveEventsFromEventKit];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_282;
    v6[3] = &unk_1E65B8E00;
    void v6[4] = *(void *)(a1 + 32);
    [v5 wait:v6];
  }
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_2;
  v11[3] = &unk_1E65B8EC8;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v9 = v5;
  id v10 = v6;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  dispatch_async(v8, v11);
  objc_destroyWeak(&v15);
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_296(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) primaryICloudCalendarAccount];
  char v3 = +[SGAccountsAdapter sharedInstance];
  id v4 = [v3 primaryICloudCalendarAccount];

  if (v4 != v2 && ([v4 isEqualToString:v2] & 1) == 0)
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      int v8 = v2;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGCK Handling primary iCloud Calendar account change (%@ --> %@)", (uint8_t *)&v7, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 104) setSyncToken:0];
    [*(id *)(*(void *)(a1 + 32) + 104) setHasSubscription:MEMORY[0x1E4F1CC28]];
    id v6 = (id)[*(id *)(a1 + 32) addFetchNewEntitiesOperation];
    [*(id *)(*(void *)(a1 + 32) + 104) setPrimaryICloudCalendarAccount:v4];
    [*(id *)(a1 + 32) processStateChanges];
  }
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_297(uint64_t a1)
{
}

uint64_t __31__SGDCloudKitSync_setDatabase___block_invoke_2_299(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = sgLogHandle();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v5;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGCK Error getting APS environment string -- APNS will not work!: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK APS (APNS) Environment: %@", buf, 0xCu);
    }

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F4E1E8]) initWithEnvironmentName:*(void *)(a1 + 40) namedDelegatePort:@"com.apple.aps.suggestd" queue:*(void *)(*(void *)(a1 + 48) + 56)];
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [*(id *)(*(void *)(a1 + 48) + 48) setDelegate:WeakRetained];

    id v4 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.suggestd"];
    id v12 = v4;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [*(id *)(*(void *)(a1 + 48) + 48) _setEnabledTopics:v10];
  }
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_282(uint64_t a1, void *a2)
{
  char v3 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  char v5 = [v4 BOOLValue];

  uint64_t v6 = sgLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK device account (or lack thereof) is not eligible -- not creating subscription", v14, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK Device is eligible. Creating subscription via setDatabase: path...", buf, 2u);
    }

    int v8 = [*(id *)(*(void *)(a1 + 32) + 104) hasSubscription];
    char v9 = [v8 BOOLValue];

    id v10 = sgLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)id v16 = 0;
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGCK setDatabase: not going to create subscription because something else created it...", v16, 2u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)id v17 = 0;
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGCK actually creating subscription via setDatabase path...", v17, 2u);
      }

      [*(id *)(a1 + 32) createSubscriptionWithRetries:3];
    }
    id v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGCK backfill via setDatabase: path...", v15, 2u);
    }

    id v13 = (id)[*(id *)(a1 + 32) addFetchNewEntitiesOperation];
  }
}

- (void)createSubscriptionWithRetries:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v5 = objc_opt_new();
  [v5 setRecordType:@"com_apple_suggestions_ck_event"];
  uint64_t v6 = objc_opt_new();
  [v6 setShouldSendContentAvailable:1];
  BOOL v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "SGCK Going to create subscription (retries: %lu)", buf, 0xCu);
  }

  database = self->_database;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke;
  v9[3] = &unk_1E65B8EA0;
  v9[4] = self;
  v9[5] = a3;
  [(CKDatabase *)database saveSubscription:v5 completionHandler:v9];
}

void __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_2;
  block[3] = &unk_1E65BFEB0;
  id v9 = v4;
  uint64_t v10 = v5;
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = v4;
  dispatch_async(v6, block);
}

void __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "getUnderlyingError:");
    uint64_t v3 = [v2 code];
    id v4 = sgLogHandle();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v3 == 2032)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGCK Setting hasSubscription persisted flag because duplicate subscription already exists on server. This should only happen after a suggest_tool reset.", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 40) + 104) setHasSubscription:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v2;
        _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGCK Error while attempting to create subscription: %@", buf, 0xCu);
      }

      if ([*(id *)(a1 + 40) pauseIfNeededAndReturnRetryEligibilityForError:v2]
        && *(void *)(a1 + 48))
      {
        id v7 = sgLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGCK Will re-attempt subscription creation", buf, 2u);
        }

        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_274;
        v12[3] = &unk_1E65BF9C0;
        uint64_t v8 = *(void *)(a1 + 48);
        id v13 = *(void **)(a1 + 40);
        id v9 = v13;
        uint64_t v14 = v8;
        uint64_t v10 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v12];
        id v11 = (id)[v9 addOperation:v10];
      }
    }
  }
  else
  {
    uint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGCK Setting hasSubscription persisted flag because new subscription was created successfully", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 40) + 104) setHasSubscription:MEMORY[0x1E4F1CC38]];
  }
}

uint64_t __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_274(uint64_t a1)
{
  return [*(id *)(a1 + 32) createSubscriptionWithRetries:*(void *)(a1 + 40) - 1];
}

void __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56));
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 56) useAfterCompletion:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke_2;
  v8[3] = &unk_1E65B8E00;
  v8[4] = *(void *)(a1 + 32);
  [v3 wait:v8];
  id v4 = [*(id *)(a1 + 40) error];

  BOOL v5 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v6 = [v5 error];
    [v3 fail:v6];
  }
  else
  {
    uint64_t v6 = [v5 result];
    if ([v6 supportsDeviceToDeviceEncryption]) {
      uint64_t v7 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v7 = MEMORY[0x1E4F1CC38];
    }
    [v3 succeed:v7];
  }
}

void __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56));
  uint64_t v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK Received account info, decision on whether to remove events from EK: %@ (error: %@)", (uint8_t *)&v8, 0x16u);
  }
}

void __30__SGDCloudKitSync_accountInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __30__SGDCloudKitSync_accountInfo__block_invoke_2;
  v12[3] = &unk_1E65C0638;
  id v13 = v5;
  id v14 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __30__SGDCloudKitSync_accountInfo__block_invoke_262(uint64_t a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - Calling CloudKit (-[CKContainer accountInfoWithCompletionHandler:])", v4, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 80) accountInfoWithCompletionHandler:*(void *)(a1 + 40)];
}

void __30__SGDCloudKitSync_accountInfo__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 138412546;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - completionHandler - %@, %@", (uint8_t *)&v16, 0x16u);
  }

  if (!*(void *)(a1 + 32) || *(void *)(a1 + 40))
  {
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_error_impl(&dword_1CA650000, v3, OS_LOG_TYPE_ERROR, "SGCK accountInfo - completionHandler - received error and/or failed to get account info: %@, %@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 88);
  id v6 = sgLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7)
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - completionHandler - completing future", (uint8_t *)&v16, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 56) + 96) = 0;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9 | (unint64_t)v8)
    {
      id v6 = v8;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:-1 userInfo:0];
      uint64_t v9 = *(void *)(a1 + 32);
    }
    [*(id *)(*(void *)(a1 + 56) + 88) completeWithResult:v9 error:v6];
    if (!*(void *)(a1 + 32))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      id v11 = *(void **)(v10 + 88);
      *(void *)(v10 + 88) = 0;
    }
  }
  else if (v7)
  {
    LOWORD(v16) = 0;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - completionHandler - ignoring result because a newer request is in flight", (uint8_t *)&v16, 2u);
  }
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SGDCloudKitSync_accountChanged___block_invoke;
  v7[3] = &unk_1E65BFD88;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __34__SGDCloudKitSync_accountChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412290;
    uint64_t v15 = v13;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK accountChanged:%@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 88))
  {
    if ([*(id *)(v3 + 88) isComplete])
    {
      id v4 = sgLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK accountChanged: - existing future is complete. Setting to nil.", (uint8_t *)&v14, 2u);
      }

      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 88);
      *(void *)(v5 + 88) = 0;
LABEL_12:

      uint64_t v3 = *(void *)(a1 + 40);
      return [(id)v3 processStateChanges];
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v3 + 96))
    {
      BOOL v7 = sgLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK accountChanged: - existing future is in-flight. Creating a new request...", (uint8_t *)&v14, 2u);
      }

      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(v8 + 88);
      *(void *)(v8 + 88) = 0;
      id v10 = v9;

      id v6 = [*(id *)(a1 + 40) accountInfo];
      id v11 = [v10 completer];

      [v6 wait:v11];
      goto LABEL_12;
    }
  }
  return [(id)v3 processStateChanges];
}

void __38__SGDCloudKitSync_processStateChanges__block_invoke_258(void *a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGCK About to invoke _deleteAllSyncedItemsCallback from background queue...", buf, 2u);
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1[4] + 32) + 16))();
  uint64_t v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "SGCK Finished invoking _deleteAllSyncedItemsCallback on background queue. Now hopping back onto _queue...", v4, 2u);
  }

  dispatch_async(*(dispatch_queue_t *)(a1[4] + 56), *(dispatch_block_t *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __38__SGDCloudKitSync_processStateChanges__block_invoke_259(void *a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGCK Entering sgckQueueBlock.", buf, 2u);
  }

  int v3 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  id v4 = sgLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGCK deleteAllSyncedItemsSucceeded == YES", v10, 2u);
    }

    [*(id *)(a1[4] + 104) setSyncToken:0];
    [*(id *)(a1[4] + 104) setEventsWereRemovedFromEventKit:MEMORY[0x1E4F1CC38]];
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGCK Set new persisted state.", v9, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGCK deleteAllSyncedItemsSucceeded == NO. Will defer a processStateChanges.", v8, 2u);
    }

    [*(id *)(a1[4] + 104) setHasDeferredProcessStateChanges:MEMORY[0x1E4F1CC38]];
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SGDCloudKitSync;
  [(SGDCloudKitSync *)&v3 dealloc];
}

- (SGDCloudKitSync)init
{
  v35.receiver = self;
  v35.super_class = (Class)SGDCloudKitSync;
  id v2 = [(SGDCloudKitSync *)&v35 init];
  if (!v2) {
    return (SGDCloudKitSync *)v2;
  }
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  *((void *)v2 + 25) = ct_green_tea_logger_create();
  BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.suggestd.aps", v5);
  BOOL v7 = (void *)*((void *)v2 + 7);
  *((void *)v2 + 7) = v6;

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)*((void *)v2 + 8);
  *((void *)v2 + 8) = v8;

  [*((id *)v2 + 8) setUnderlyingQueue:*((void *)v2 + 7)];
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
  id v11 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = v10;

  uint64_t v12 = *((void *)v2 + 7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SGDCloudKitSync_init__block_invoke;
  block[3] = &unk_1E65BEF88;
  uint64_t v13 = (id *)v2;
  id v34 = v13;
  dispatch_sync(v12, block);
  dispatch_suspend(*((dispatch_object_t *)v2 + 7));
  *((unsigned char *)v13 + 40) = 0;
  *((unsigned char *)v13 + 96) = 0;
  int v14 = [MEMORY[0x1E4F5DAF0] cloudKitPersistedState];
  if (![v14 length])
  {
    uint64_t v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_INFO, "SGCK No persisted state exists for this user.", buf, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0];
  id v16 = v13[13];
  v13[13] = (id)v15;

  id v17 = v13[13];
  if (!v17)
  {
    uint64_t v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGCK Existing persisted state was saved but could not be deserialized.", buf, 2u);
    }
LABEL_9:

    __int16 v18 = v13 + 13;
    id v17 = v13[13];
    if (!v17)
    {
      uint64_t v20 = sgLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_INFO, "SGCK Creating new persisted state.", buf, 2u);
      }

      uint64_t v21 = objc_opt_new();
      id v22 = *v18;
      *__int16 v18 = (id)v21;

      id v17 = *v18;
    }
    goto LABEL_13;
  }
  __int16 v18 = v13 + 13;
LABEL_13:
  [v17 setChangeCallback:&__block_literal_global_242_19249];
  id v23 = [*v18 salt];

  if (v23)
  {
    v24 = [*v18 saltUsesManatee];
    char v25 = [v24 BOOLValue];

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = sgLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v26, OS_LOG_TYPE_INFO, "SGCK Discarding non-manatee salt", buf, 2u);
      }

      [v13 failSalt];
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, v13);
  id v27 = (void *)MEMORY[0x1E4F5DAF0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __23__SGDCloudKitSync_init__block_invoke_244;
  v29[3] = &unk_1E65BB450;
  id v30 = v13;
  objc_copyWeak(&v31, (id *)buf);
  [v27 registerBlockOnSuggestionsSettingsChange:v29];
  objc_destroyWeak(&v31);

  objc_destroyWeak((id *)buf);
  return (SGDCloudKitSync *)v2;
}

uint64_t __23__SGDCloudKitSync_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) suspend];
}

- (id)addOperation
{
  uint64_t v3 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_231_19254];
  id v4 = [(SGDCloudKitSync *)self addOperation:v3];

  return v4;
}

- (id)addOperation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 setDatabase:self->_database];
    [v5 setCallbackQueue:self->_queue];
    dispatch_queue_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK Will add CK operation to queue: %@", buf, 0xCu);
    }
  }
  [(NSMutableArray *)self->_operationsToAddToOpQueue addObject:v4];
  if ([(NSMutableArray *)self->_operationsToAddToOpQueue count] == 1)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__SGDCloudKitSync_addOperation___block_invoke;
    block[3] = &unk_1E65BEF88;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  return v4;
}

uint64_t __32__SGDCloudKitSync_addOperation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 64) addOperations:*(void *)(*(void *)(a1 + 32) + 72) waitUntilFinished:0];
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) count];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 64) operationCount];
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK added %lu operations to queue (pending operation count: %lu)", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

- (id)addWriteOperationForRecordGetter:(id)a3 deleteGetter:(id)a4 withRetries:(unint64_t)a5 isFirstTry:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(SGDCloudKitSync *)self addOperation];
  int v14 = [(SGDCloudKitSync *)self addOperation];
  [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v13 end:v14];
  id location = 0;
  objc_initWeak(&location, v14);
  uint64_t v15 = (void *)MEMORY[0x1E4F28B48];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke;
  v26[3] = &unk_1E65B8D40;
  objc_copyWeak(v29, &location);
  v29[1] = (id)a2;
  v26[4] = self;
  BOOL v30 = v6;
  id v16 = v11;
  id v27 = v16;
  id v17 = v12;
  id v28 = v17;
  v29[2] = (id)a5;
  __int16 v18 = [v15 blockOperationWithBlock:v26];
  uint64_t v19 = [(SGDCloudKitSync *)self addOperation:v18];

  [v19 addDependency:v13];
  [v14 addDependency:v19];
  if (self->_inProgressProcureSaltOperation)
  {
    uint64_t v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "SGCK Will wait for in-progress procure salt operation before writing or deleting an entity", buf, 2u);
    }

    [v13 addDependency:self->_inProgressProcureSaltOperation];
  }
  if (self->_inProgressCreateZoneOperation)
  {
    uint64_t v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, "SGCK Will wait for in-progress create zone operation before writing or deleting an entity", buf, 2u);
    }

    [v13 addDependency:self->_inProgressCreateZoneOperation];
  }
  if (v6)
  {
    id v22 = [(SGDCloudKitSync *)self addManateeSanityCheckOperation];
    [v13 addDependency:v22];
  }
  id v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"WriteRecord operation attempt completion [retries: %lu]", a5);
  [v14 setName:v23];

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

  return v14;
}

void __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    BOOL v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 1055, @"Invalid parameter not satisfying: %@", @"strongEndOperation" object file lineNumber description];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 168);
  if (*(unsigned char *)(a1 + 80))
  {
    *(void *)(v4 + 168) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 184);
    *(void *)(v6 + 184) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    goto LABEL_5;
  }
  if (!v5)
  {
    uint64_t v5 = *(void **)(v4 + 184);
    if (!v5)
    {
LABEL_5:
      if (*(unsigned char *)(v4 + 120))
      {
        __int16 v8 = sgLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "SGCK Adding and waiting for zone creation before writing entity.", buf, 2u);
        }

        id v9 = [*(id *)(a1 + 32) addCreateZoneOperation];
        uint64_t v10 = [*(id *)(a1 + 32) addWriteOperationForRecordGetter:*(void *)(a1 + 40) deleteGetter:*(void *)(a1 + 48) withRetries:*(void *)(a1 + 72) isFirstTry:0];
        [*(id *)(a1 + 32) _addDependency:v9 toTrain:v10];
        [WeakRetained addDependency:v10];
      }
      else
      {
        id v11 = [*(id *)(v4 + 104) salt];

        if (v11)
        {
          id v12 = *(void **)(a1 + 32);
          uint64_t v13 = objc_opt_new();
          id v9 = [v12 addOperation:v13];

          if (*(void *)(a1 + 40))
          {
            int v14 = (void *)MEMORY[0x1CB79B230]();
            uint64_t v15 = *(void *)(a1 + 40);
            id v16 = [*(id *)(*(void *)(a1 + 32) + 104) salt];
            id v17 = [*(id *)(*(void *)(a1 + 32) + 104) saltAtomicReferenceId];
            __int16 v18 = (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v16, v17);
          }
          else
          {
            __int16 v18 = 0;
          }
          if (*(void *)(a1 + 48))
          {
            uint64_t v20 = (void *)MEMORY[0x1CB79B230]();
            uint64_t v21 = *(void *)(a1 + 48);
            id v22 = [*(id *)(*(void *)(a1 + 32) + 104) salt];
            id v23 = (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
          }
          else
          {
            id v23 = 0;
          }
          v24 = sgLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            id v28 = sgMapSelector();
            uint64_t v29 = *(void *)(a1 + 72);
            *(_DWORD *)buf = 138412802;
            id v38 = v28;
            __int16 v39 = 2112;
            v40 = v23;
            __int16 v41 = 2048;
            uint64_t v42 = v29;
            _os_log_debug_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEBUG, "SGCK Will write entity records: %@, delete entity records: %@, retries remaining: %lu", buf, 0x20u);
          }
          [v9 setRecordsToSave:v18];
          [v9 setRecordIDsToDelete:v23];
          [v9 setAtomic:0];
          [v9 setSavePolicy:2];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke_219;
          v31[3] = &unk_1E65B8D18;
          objc_copyWeak(v36, v2);
          uint64_t v25 = *(void *)(a1 + 32);
          v36[1] = *(id *)(a1 + 64);
          v31[4] = v25;
          uint64_t v10 = v18;
          v32 = v10;
          id v26 = v23;
          id v27 = *(void **)(a1 + 72);
          id v33 = v26;
          v36[2] = v27;
          id v34 = *(id *)(a1 + 40);
          id v35 = *(id *)(a1 + 48);
          [v9 setModifyRecordsCompletionBlock:v31];
          [WeakRetained addDependency:v9];

          objc_destroyWeak(v36);
        }
        else
        {
          uint64_t v19 = sgLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGCK Adding and waiting for salt procurement before writing entity.", buf, 2u);
          }

          id v9 = [*(id *)(a1 + 32) addProcureSaltOperation];
          uint64_t v10 = [*(id *)(a1 + 32) addWriteOperationForRecordGetter:*(void *)(a1 + 40) deleteGetter:*(void *)(a1 + 48) withRetries:*(void *)(a1 + 72) isFirstTry:0];
          [*(id *)(a1 + 32) _addDependency:v9 toTrain:v10];
          [WeakRetained addDependency:v10];
        }
      }
      goto LABEL_26;
    }
  }
  id v9 = v5;
  uint64_t v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v9;
    _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGCK Failing to write entity due to unrecoverable error: %@", buf, 0xCu);
  }
LABEL_26:
}

void __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke_219(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 1112, @"Invalid parameter not satisfying: %@", @"muscularEndOperation" object file lineNumber description];

    if (!v5) {
      goto LABEL_51;
    }
LABEL_3:
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v39;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = [*(id *)(*((void *)&v38 + 1) + 8 * v11) recordID];
        int v14 = [v12 ckErrorForRecordId:v13 inError:v5];

        if (v14) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v7 = *(id *)(a1 + 48);
      uint64_t v15 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v7);
            }
            uint64_t v19 = [*(id *)(a1 + 32) ckErrorForRecordId:*(void *)(*((void *)&v34 + 1) + 8 * i) inError:v5];
            if (v19)
            {
              int v14 = (void *)v19;
              goto LABEL_21;
            }
          }
          uint64_t v16 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      int v14 = 0;
    }
LABEL_21:

    if (([*(id *)(a1 + 32) pauseIfNeededAndReturnRetryEligibilityForError:v14] & 1) != 0
      || [*(id *)(a1 + 32) pauseIfNeededAndReturnRetryEligibilityForError:v5])
    {
      uint64_t v20 = *(void *)(a1 + 88);
      if (v20)
      {
        uint64_t v21 = [*(id *)(a1 + 32) addWriteOperationForRecordGetter:*(void *)(a1 + 56) deleteGetter:*(void *)(a1 + 64) withRetries:v20 - 1 isFirstTry:0];
        [WeakRetained addDependency:v21];
        id v22 = v5;
LABEL_49:

        goto LABEL_50;
      }
    }
    id v22 = [*(id *)(a1 + 32) getUnderlyingError:v5];

    if (*(void *)(a1 + 88)
      && [*(id *)(a1 + 32) shouldRecreateZoneForRecordError:v14 operationError:v22])
    {
      id v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (v14) {
          v32 = v14;
        }
        else {
          v32 = v22;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v32;
        _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "SGCK Will recreate zone and salt and try to write record again (error: %@)", buf, 0xCu);
      }

      uint64_t v21 = [*(id *)(a1 + 32) addWriteOperationForRecordGetter:*(void *)(a1 + 56) deleteGetter:*(void *)(a1 + 64) withRetries:*(void *)(a1 + 88) - 1 isFirstTry:0];
      v24 = *(void **)(a1 + 32);
      uint64_t v25 = [v24 addDeleteAndRecreateZoneOperation];
      [v24 _addDependency:v25 toTrain:v21];

      goto LABEL_48;
    }
    uint64_t v26 = [v14 code];
    if (!v26) {
      uint64_t v26 = [v22 code];
    }
    if (v26 != 26)
    {
      if (v26 == 31)
      {
        [*(id *)(a1 + 32) failSalt];
        BOOL v30 = sgLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v30, OS_LOG_TYPE_ERROR, "SGCK Salt atomic reference check failed while trying to write record. Calling failSalt.", buf, 2u);
        }

        if (!*(void *)(a1 + 88)) {
          goto LABEL_50;
        }
        id v31 = sgLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v31, OS_LOG_TYPE_ERROR, "SGCK Retrying after salt missing reference error.", buf, 2u);
        }

LABEL_47:
        uint64_t v21 = [*(id *)(a1 + 32) addWriteOperationForRecordGetter:*(void *)(a1 + 56) deleteGetter:*(void *)(a1 + 64) withRetries:*(void *)(a1 + 88) - 1 isFirstTry:0];
LABEL_48:
        [WeakRetained addDependency:v21];
        goto LABEL_49;
      }
      if (v26 != 28)
      {
LABEL_50:

        goto LABEL_51;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
    id v27 = sgLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "SGCK Zone missing while trying to write or delete record. Setting _noZone flag.", buf, 2u);
    }

    if (!*(void *)(a1 + 88)) {
      goto LABEL_50;
    }
    uint64_t v28 = [*(id *)(a1 + 40) count];
    uint64_t v21 = sgLogHandle();
    BOOL v29 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "SGCK Not retrying because there is nothing to write.", buf, 2u);
      }
      goto LABEL_49;
    }
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "SGCK Retrying after zone missing error", buf, 2u);
    }

    goto LABEL_47;
  }
  if (v5) {
    goto LABEL_3;
  }
LABEL_51:
}

- (id)addWriteOperationForRecordGetter:(id)a3 deleteGetter:(id)a4 withRetries:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGCK addWriteOperationForRecordGetter - Skipping because of out of date software", v14, 2u);
    }

    uint64_t v11 = [(SGDCloudKitSync *)self addOperation];
  }
  else
  {
    uint64_t v11 = [(SGDCloudKitSync *)self addWriteOperationForRecordGetter:v8 deleteGetter:v9 withRetries:a5 isFirstTry:1];
  }
  id v12 = (void *)v11;

  return v12;
}

- (id)addDeleteAndRecreateZoneOperation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(SGDCloudKitSync *)self addOperation];
  uint64_t v4 = [(SGDCloudKitSync *)self addOperation];
  [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v3 end:v4];
  id v5 = [(SGDCloudKitSync *)self addDeleteZoneOperation];
  [(SGDCloudKitSync *)self _addDependency:v3 toTrain:v5];
  uint64_t v6 = [(SGDCloudKitSync *)self addCreateZoneOperation];
  [(SGDCloudKitSync *)self _addDependency:v5 toTrain:v6];
  id v7 = [(SGDCloudKitSync *)self addProcureSaltOperation];
  [(SGDCloudKitSync *)self _addDependency:v6 toTrain:v7];
  [v4 addDependency:v7];

  return v4;
}

- (BOOL)shouldRecreateZoneForRecordError:(id)a3 operationError:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = [(SGDCloudKitSync *)self getUnderlyingError:v7];

  uint64_t v10 = [v8 code];
  if (!v10) {
    uint64_t v10 = [v9 code];
  }
  BOOL v11 = (unint64_t)(v10 - 5000) < 5 || v10 == 112;

  return v11;
}

- (id)addFetchNewEntitiesAttemptOperationWithRetries:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 134217984;
    *(void *)&location[4] = a3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  self->_requestedFetchNewEntitiesWhileRequestAlreadyInFlight = 0;
  id v5 = [(SGDCloudKitSync *)self addOperation];
  uint64_t v6 = [(SGDCloudKitSync *)self addOperation];
  [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v5 end:v6];
  uint64_t v25 = [(_SGDCloudKitSyncPersistedState *)self->_persistedState syncToken];
  id v7 = [(SGDCloudKitSync *)self recordZoneId];
  id v8 = objc_opt_new();
  [v8 setPreviousServerChangeToken:v25];
  id v9 = objc_alloc(MEMORY[0x1E4F1A070]);
  long long v35 = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  id v33 = v7;
  long long v34 = v8;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v12 = (void *)[v9 initWithRecordZoneIDs:v10 configurationsByRecordZoneID:v11];
  uint64_t v13 = [(SGDCloudKitSync *)self addOperation:v12];

  [v13 addDependency:v5];
  [v13 setFetchAllChanges:0];
  int v14 = objc_opt_new();
  uint64_t v15 = [(CKDatabase *)self->_database container];
  [v14 setContainer:v15];

  [v13 setConfiguration:v14];
  uint64_t v16 = objc_opt_new();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke;
  v31[3] = &unk_1E65B8CA0;
  v31[4] = self;
  id v17 = v16;
  id v32 = v17;
  [v13 setRecordChangedBlock:v31];
  __int16 v18 = objc_opt_new();
  [v6 addDependency:v18];
  *(void *)id location = 0;
  objc_initWeak((id *)location, v6);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_207;
  v26[3] = &unk_1E65B8CF0;
  objc_copyWeak(v30, (id *)location);
  v30[1] = (id)a2;
  v26[4] = self;
  id v19 = v18;
  id v27 = v19;
  id v20 = v17;
  id v28 = v20;
  v30[2] = (id)a3;
  id v21 = v7;
  id v29 = v21;
  [v13 setRecordZoneFetchCompletionBlock:v26];
  [v6 addDependency:v13];

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)location);

  return v6;
}

void __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) eventsWereRemovedFromEventKit];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v14 = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK ignoring fetched new entities because we are not in a sync enabled state", v14, 2u);
    }
  }
  else
  {
    id v7 = [v3 recordType];
    int v8 = [v7 isEqualToString:@"com_apple_suggestions_ck_event"];

    if (v8)
    {
      id v9 = +[SGPipelineEntity fromCloudKitRecord:v3];
      uint64_t v10 = [v9 enrichments];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        id v12 = *(void **)(a1 + 40);
        uint64_t v13 = [*(id *)(a1 + 32) invokeNewEntitiesCallbackWithEntity:v9];
        [v12 addObject:v13];
      }
    }
  }
}

void __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_207(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 914, @"Invalid parameter not satisfying: %@", @"strongEndOperation" object file lineNumber description];
  }
  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 104) eventsWereRemovedFromEventKit];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
    __int16 v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "SGCK ignoring record zone completion block because we are not in a sync enabled state", buf, 2u);
    }

    [WeakRetained removeDependency:*(void *)(a1 + 40)];
  }
  else
  {
    id v26 = v13;
    id v19 = (void *)MEMORY[0x1E4F5DA30];
    uint64_t v20 = *(void *)(a1 + 48);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_209;
    v27[3] = &unk_1E65B8CC8;
    objc_copyWeak(v34, (id *)(a1 + 64));
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(void **)(a1 + 40);
    v34[1] = *(id *)(a1 + 72);
    v27[4] = v21;
    id v28 = v22;
    id v29 = *(id *)(a1 + 48);
    id v23 = v14;
    v24 = *(void **)(a1 + 80);
    id v30 = v23;
    v34[2] = v24;
    id v31 = *(id *)(a1 + 56);
    id v32 = v11;
    id v33 = v12;
    char v35 = a5;
    [v19 waitForFuturesToComplete:v20 withCallback:v27];

    objc_destroyWeak(v34);
    id v13 = v26;
  }
}

void __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_209(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:*(void *)(a1 + 96), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 926, @"Invalid parameter not satisfying: %@", @"muscularEndOperation" object file lineNumber description];
  }
  [WeakRetained removeDependency:*(void *)(a1 + 40)];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v4)
  {
LABEL_11:

    uint64_t v10 = (id *)(a1 + 56);
    if (*(void *)(a1 + 56))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:"))
      {
        uint64_t v11 = *(void *)(a1 + 104);
        if (!v11)
        {
          int v17 = sgLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v26 = (__CFString *)*v10;
            *(_DWORD *)buf = 138412290;
            long long v38 = v26;
            _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "SGCK Giving up on fetching new changes because out of retries for error: %@", buf, 0xCu);
          }
          goto LABEL_39;
        }
        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = v11 - 1;
        goto LABEL_36;
      }
      id v15 = *v10;
      int v16 = 1;
LABEL_20:
      int v17 = [*(id *)(a1 + 32) ckErrorForRecordZoneId:*(void *)(a1 + 64) inError:v15];
      uint64_t v18 = [v17 code];
      if (!v18) {
        uint64_t v18 = [*v10 code];
      }
      id v19 = sgLogHandle();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v18 != 21)
      {
        if (v20)
        {
          id v28 = (__CFString *)v17;
          if (!v17) {
            id v28 = (__CFString *)*v10;
          }
          *(_DWORD *)buf = 138412290;
          long long v38 = v28;
          _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGCK Giving up on fetching changes due to unrecoverable error %@", buf, 0xCu);
        }

        goto LABEL_39;
      }
      if (v20)
      {
        id v27 = (__CFString *)v17;
        if (!v17) {
          id v27 = (__CFString *)*v10;
        }
        *(_DWORD *)buf = 138412290;
        long long v38 = v27;
        _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGCK Change token expired (error: %@)", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 104) setSyncToken:0];
      if (!v16)
      {
LABEL_39:

        goto LABEL_40;
      }
      if (*(void *)(a1 + 104))
      {
        uint64_t v21 = sgLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "SGCK Will try fetching again without change token", buf, 2u);
        }

        id v22 = [*(id *)(a1 + 32) addFetchNewEntitiesAttemptOperationWithRetries:*(void *)(a1 + 104) - 1];
        [WeakRetained addDependency:v22];
      }
      if (*v10) {
        goto LABEL_40;
      }
    }
    id v23 = *(void **)(a1 + 72);
    v24 = [*(id *)(a1 + 32) recordZoneId];
    LOBYTE(v23) = [v23 isEqual:v24];

    if ((v23 & 1) == 0)
    {
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:*(void *)(a1 + 96), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 972, @"Invalid parameter not satisfying: %@", @"[recordZoneID isEqual:[self recordZoneId]]" object file lineNumber description];
    }
    [*(id *)(*(void *)(a1 + 32) + 104) setSyncToken:*(void *)(a1 + 80)];
    if (!*(unsigned char *)(a1 + 112) && !*(unsigned char *)(*(void *)(a1 + 32) + 160))
    {
      int v17 = sgLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "SGCK Finished requesting more entities from server.", buf, 2u);
      }
      goto LABEL_39;
    }
    uint64_t v25 = sgLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v29 = @"YES";
      if (*(unsigned char *)(a1 + 112)) {
        id v30 = @"YES";
      }
      else {
        id v30 = @"NO";
      }
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 160)) {
        id v29 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      long long v38 = v30;
      __int16 v39 = 2112;
      long long v40 = v29;
      _os_log_debug_impl(&dword_1CA650000, v25, OS_LOG_TYPE_DEBUG, "SGCK Fetching more entities from server for these reasons: [%@] Server indicated more entities are coming, [%@] Client was asked again to fetch more entities while this request was already in-flight", buf, 0x16u);
    }

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 104);
LABEL_36:
    int v17 = [v12 addFetchNewEntitiesAttemptOperationWithRetries:v13];
    [WeakRetained addDependency:v17];
    goto LABEL_39;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v34;
LABEL_5:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v34 != v6) {
      objc_enumerationMutation(v3);
    }
    int v8 = [*(id *)(*((void *)&v33 + 1) + 8 * v7) result];
    int v9 = [v8 BOOLValue];

    if (!v9) {
      break;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }

  id v14 = sgLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "SGCK Storage was not ready. Will sync again when it's purportedly available.", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 104) setHasDeferredSync:MEMORY[0x1E4F1CC38]];
  uint64_t v10 = (id *)(a1 + 56);
  id v15 = *(id *)(a1 + 56);
  if (v15)
  {
    int v16 = 0;
    goto LABEL_20;
  }
LABEL_40:
}

- (id)addFetchNewEntitiesOperation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addFetchNewEntitiesOperation - Skipping because of out of date software", buf, 2u);
    }

    uint64_t v4 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v5 = &__block_literal_global_185;
LABEL_5:
    uint64_t v6 = [v4 blockOperationWithBlock:v5];
    uint64_t v7 = [(SGDCloudKitSync *)self addOperation:v6];
LABEL_6:

    goto LABEL_7;
  }
  if (!self->_readyForNewEntities)
  {
    id v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "SGCK addFetchNewEntitiesOperation - Deferring because not ready for new entities.", buf, 2u);
    }

    [(_SGDCloudKitSyncPersistedState *)self->_persistedState setHasDeferredSync:MEMORY[0x1E4F1CC38]];
    uint64_t v4 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v5 = &__block_literal_global_188_19304;
    goto LABEL_5;
  }
  inProgressFetchNewEntitiesOperation = self->_inProgressFetchNewEntitiesOperation;
  uint64_t v10 = sgLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!inProgressFetchNewEntitiesOperation)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesOperation - Adding new operation to operation queue", buf, 2u);
    }

    uint64_t v13 = (void *)MEMORY[0x1CB79B230]([(SGDCloudKitSync *)self clearErrors]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__SGDCloudKitSync_addFetchNewEntitiesOperation__block_invoke_195;
    v19[3] = &unk_1E65BEF88;
    void v19[4] = self;
    id v14 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v19];
    id v15 = [(SGDCloudKitSync *)self addOperation:v14];

    int v16 = self->_inProgressFetchNewEntitiesOperation;
    self->_inProgressFetchNewEntitiesOperation = v15;

    uint64_t v6 = [(SGDCloudKitSync *)self addOperation];
    int v17 = [(SGDCloudKitSync *)self addFetchNewEntitiesAttemptOperationWithRetries:3];
    [(SGDCloudKitSync *)self _addDependency:v6 toTrain:v17];
    [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v6 end:self->_inProgressFetchNewEntitiesOperation];
    [(NSOperation *)self->_inProgressFetchNewEntitiesOperation addDependency:v17];
    uint64_t v7 = self->_inProgressFetchNewEntitiesOperation;

    goto LABEL_6;
  }
  if (v11)
  {
    if (self->_requestedFetchNewEntitiesWhileRequestAlreadyInFlight) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v18;
    _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesOperation - Returning operation already in flight, changing value of _requestedFetchNewEntitiesWhileRequestAlreadyInFlight from %@ to YES", buf, 0xCu);
  }

  self->_requestedFetchNewEntitiesWhileRequestAlreadyInFlight = 1;
  uint64_t v7 = self->_inProgressFetchNewEntitiesOperation;
LABEL_7:
  return v7;
}

void __47__SGDCloudKitSync_addFetchNewEntitiesOperation__block_invoke_195(uint64_t a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesOperation - Operation completed", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = 0;
}

- (id)addProcureSaltAttemptOperationWithRetries:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 134217984;
    *(void *)&location[4] = a3;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  uint64_t v6 = [(SGDCloudKitSync *)self addOperation];
  uint64_t v7 = [(SGDCloudKitSync *)self addOperation];
  uint64_t v8 = [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v6 end:v7];
  createZoneError = self->_createZoneError;
  if (createZoneError)
  {
    objc_storeStrong((id *)&self->_procureSaltError, createZoneError);
    [v7 addDependency:v6];
  }
  else
  {
    context = (void *)MEMORY[0x1CB79B230](v8);
    uint64_t v10 = SGRandomDataOfLength(0x10uLL);
    BOOL v11 = [v10 base64EncodedStringWithOptions:0];

    id v12 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v13 = [@"salt_" stringByAppendingString:v11];
    id v14 = [(SGDCloudKitSync *)self recordZoneId];
    id v15 = (void *)[v12 initWithRecordName:v13 zoneID:v14];

    id v30 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"salt_atomic_reference" recordID:v15];
    int v16 = SGRandomDataOfLength(0x20uLL);
    id v17 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v18 = [(SGDCloudKitSync *)self recordZoneId];
    id v19 = (void *)[v17 initWithRecordName:@"salt-manatee" zoneID:v18];

    BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"salt" recordID:v19];
    uint64_t v21 = [v20 encryptedValuesByKey];
    [v21 setObject:v16 forKeyedSubscript:@"se"];

    uint64_t v22 = [v15 recordName];
    [v20 setObject:v22 forKeyedSubscript:@"a"];

    id v23 = objc_opt_new();
    v24 = [(SGDCloudKitSync *)self addOperation:v23];

    [v24 addDependency:v6];
    v35[0] = v20;
    v35[1] = v30;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    [v24 setRecordsToSave:v25];

    [v24 setAtomic:1];
    [v24 setSavePolicy:0];
    *(void *)id location = 0;
    objc_initWeak((id *)location, v7);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __61__SGDCloudKitSync_addProcureSaltAttemptOperationWithRetries___block_invoke;
    v32[3] = &unk_1E65B8C78;
    objc_copyWeak(v34, (id *)location);
    v34[1] = (id)a2;
    v32[4] = self;
    id v26 = v20;
    id v33 = v26;
    v34[2] = (id)a3;
    [v24 setModifyRecordsCompletionBlock:v32];
    [v7 addDependency:v24];

    objc_destroyWeak(v34);
    objc_destroyWeak((id *)location);
  }
  id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"ProcureSalt operation attempt completion [retries: %lu]", a3);
  [v7 setName:v27];

  return v7;
}

void __61__SGDCloudKitSync_addProcureSaltAttemptOperationWithRetries___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 757, @"Invalid parameter not satisfying: %@", @"strongEndOperation" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_48:
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v13 = (__CFString *)v7;
    uint64_t v36 = [(__CFString *)v13 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      id v55 = WeakRetained;
      id v56 = v8;
      id v38 = v7;
      uint64_t v39 = *(void *)v58;
      while (2)
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v58 != v39) {
            objc_enumerationMutation(v13);
          }
          long long v41 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v42 = [v41 recordType];
          int v43 = [v42 isEqualToString:@"salt"];

          if (v43)
          {
            uint64_t v25 = v41;
            id v17 = 0;
            id v7 = v38;
            id WeakRetained = v55;
            id v8 = v56;
            goto LABEL_58;
          }
        }
        uint64_t v37 = [(__CFString *)v13 countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v37) {
          continue;
        }
        break;
      }
      id v17 = 0;
      id v7 = v38;
      id WeakRetained = v55;
      id v8 = v56;
    }
    else
    {
      id v17 = 0;
    }
    goto LABEL_72;
  }
  if (!v9) {
    goto LABEL_48;
  }
LABEL_3:
  BOOL v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) recordID];
  uint64_t v13 = [v11 ckErrorForRecordId:v12 inError:v9];

  if (([*(id *)(a1 + 32) pauseIfNeededAndReturnRetryEligibilityForError:v13] & 1) != 0
    || [*(id *)(a1 + 32) pauseIfNeededAndReturnRetryEligibilityForError:v9])
  {
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14)
    {
      id v15 = [*(id *)(a1 + 32) addProcureSaltAttemptOperationWithRetries:v14 - 1];
      [WeakRetained addDependency:v15];
    }
    else
    {
      if (v13) {
        int v16 = v13;
      }
      else {
        int v16 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), v16);
    }
    id v17 = v9;
LABEL_72:

    goto LABEL_73;
  }
  id v17 = [*(id *)(a1 + 32) getUnderlyingError:v9];

  if (*(void *)(a1 + 64)
    && [*(id *)(a1 + 32) shouldRecreateZoneForRecordError:v13 operationError:v17])
  {
    uint64_t v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (v13) {
        id v33 = v13;
      }
      else {
        id v33 = v17;
      }
      *(_DWORD *)buf = 138412290;
      v62 = v33;
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "SGCK Will recreate zone and try to procure salt again (error: %@)", buf, 0xCu);
    }

    id v19 = [*(id *)(a1 + 32) addProcureSaltAttemptOperationWithRetries:*(void *)(a1 + 64) - 1];
    BOOL v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v20 addDeleteAndRecreateZoneOperation];
    [v20 _addDependency:v21 toTrain:v19];

    [WeakRetained addDependency:v19];
    goto LABEL_72;
  }
  uint64_t v22 = [(__CFString *)v13 code];
  if (!v22) {
    uint64_t v22 = [(__CFString *)v17 code];
  }
  if (v22 == 28 || v22 == 26)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
    id v26 = sgLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (v13) {
        id v32 = v13;
      }
      else {
        id v32 = v17;
      }
      *(_DWORD *)buf = 138412290;
      v62 = v32;
      _os_log_error_impl(&dword_1CA650000, v26, OS_LOG_TYPE_ERROR, "SGCK Zone missing while procuring salt: %@", buf, 0xCu);
    }

    if (!*(void *)(a1 + 64)) {
      goto LABEL_72;
    }
    id v27 = sgLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "SGCK Will attempt to create zone and then try procuring salt again", buf, 2u);
    }

    v24 = [*(id *)(a1 + 32) addProcureSaltAttemptOperationWithRetries:*(void *)(a1 + 64) - 1];
    id v28 = *(void **)(a1 + 32);
    id v29 = [v28 addCreateZoneOperation];
    [v28 _addDependency:v29 toTrain:v24];

    [WeakRetained addDependency:v24];
    uint64_t v25 = 0;
  }
  else
  {
    if (v22 != 14)
    {
      id v30 = sgLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        if (v13) {
          long long v34 = v13;
        }
        else {
          long long v34 = v17;
        }
        *(_DWORD *)buf = 138412290;
        v62 = v34;
        _os_log_error_impl(&dword_1CA650000, v30, OS_LOG_TYPE_ERROR, "SGCK Unrecoverable error while procuring salt: %@", buf, 0xCu);
      }

      if (v13) {
        id v31 = v13;
      }
      else {
        id v31 = v17;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), v31);
      goto LABEL_72;
    }
    id v23 = sgLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "SGCK Using existing salt record found on server", buf, 2u);
    }

    v24 = [(__CFString *)v13 userInfo];
    uint64_t v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];
  }

LABEL_58:
  if (v25)
  {
    v44 = [(__CFString *)v25 encryptedValuesByKey];
    v45 = [v44 objectForKeyedSubscript:@"se"];

    uint64_t v46 = [(__CFString *)v25 objectForKeyedSubscript:@"a"];
    v47 = sgLogHandle();
    id v48 = v47;
    if (v45) {
      BOOL v49 = v46 == 0;
    }
    else {
      BOOL v49 = 1;
    }
    if (v49)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        v54 = @"non-nil";
        if (!v45) {
          v54 = 0;
        }
        *(_DWORD *)buf = 138412546;
        v62 = v54;
        __int16 v63 = 2112;
        v64 = v46;
        _os_log_fault_impl(&dword_1CA650000, v48, OS_LOG_TYPE_FAULT, "SGCK procuredSaltRecord missing critical fields (se=%@, a=%@)! This should not be possible and no recovery path is implemented. CloudKit writes will fail.", buf, 0x16u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
    else
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v46;
        _os_log_impl(&dword_1CA650000, v48, OS_LOG_TYPE_INFO, "SGCK Successfully procured Manatee salt with atomic reference name %@", buf, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 104) setSalt:v45];
      id v51 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      v52 = [*(id *)(a1 + 32) recordZoneId];
      v53 = (void *)[v51 initWithRecordName:v46 zoneID:v52];
      [*(id *)(*(void *)(a1 + 32) + 104) setSaltAtomicReferenceId:v53];

      [*(id *)(*(void *)(a1 + 32) + 104) setSaltUsesManatee:MEMORY[0x1E4F1CC38]];
    }

    uint64_t v13 = v25;
    goto LABEL_72;
  }
LABEL_73:
}

- (id)_ckErrorForId:(id)a3 inError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 code] == 2)
  {
    id v8 = [v7 userInfo];
    int v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];

    if ([v10 code] == 22)
    {
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = [(SGDCloudKitSync *)self getUnderlyingError:v10];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)addProcureSaltOperation
{
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    uint64_t v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addProcureSaltOperation - Skipping because of out of date software", buf, 2u);
    }

    uint64_t v4 = [(SGDCloudKitSync *)self addOperation];
LABEL_9:
    id v8 = v4;
    goto LABEL_10;
  }
  inProgressProcureSaltOperation = self->_inProgressProcureSaltOperation;
  id v6 = sgLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (inProgressProcureSaltOperation)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltOperation - Returning operation already in flight", buf, 2u);
    }

    uint64_t v4 = self->_inProgressProcureSaltOperation;
    goto LABEL_9;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltOperation - Adding new operation to operation queue", buf, 2u);
  }

  uint64_t v10 = (void *)MEMORY[0x1CB79B230]([(SGDCloudKitSync *)self clearErrors]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __42__SGDCloudKitSync_addProcureSaltOperation__block_invoke;
  v16[3] = &unk_1E65BEF88;
  v16[4] = self;
  BOOL v11 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v16];
  id v12 = [(SGDCloudKitSync *)self addOperation:v11];

  uint64_t v13 = self->_inProgressProcureSaltOperation;
  self->_inProgressProcureSaltOperation = v12;

  uint64_t v14 = [(SGDCloudKitSync *)self addOperation];
  id v15 = [(SGDCloudKitSync *)self addProcureSaltAttemptOperationWithRetries:3];
  [(SGDCloudKitSync *)self _addDependency:v14 toTrain:v15];
  [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v14 end:self->_inProgressProcureSaltOperation];
  [(NSOperation *)self->_inProgressProcureSaltOperation addDependency:v15];
  id v8 = self->_inProgressProcureSaltOperation;

LABEL_10:
  return v8;
}

void __42__SGDCloudKitSync_addProcureSaltOperation__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 184);
  uint64_t v3 = sgLogHandle();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 184);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGCK addProcureSaltOperation - Operation completed with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltOperation - Operation completed successfully", (uint8_t *)&v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = 0;
}

- (id)addManateeSanityCheckOperation
{
  v18[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v4 = !self->_disabledBecauseOutOfDateSoftware;
  uint64_t v5 = sgLogHandle();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK Creating Manatee health check operation...", buf, 2u);
    }

    int v8 = [(SGDCloudKitSync *)self addOperation];
    BOOL v7 = [(SGDCloudKitSync *)self addOperation];
    [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v8 end:v7];
    id v9 = objc_alloc(MEMORY[0x1E4F1A090]);
    uint64_t v10 = [(SGDCloudKitSync *)self recordZoneId];
    v18[0] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v12 = (void *)[v9 initWithRecordZoneIDs:v11];
    uint64_t v13 = [(SGDCloudKitSync *)self addOperation:v12];

    [v13 addDependency:v8];
    [v7 addDependency:v13];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v7);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__SGDCloudKitSync_addManateeSanityCheckOperation__block_invoke;
    v15[3] = &unk_1E65B8C50;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = (id)a2;
    v15[4] = self;
    [v13 setFetchRecordZonesCompletionBlock:v15];
    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGCK addManateeSanityCheckOperation - Skipping because of out of date software", buf, 2u);
    }

    BOOL v7 = [(SGDCloudKitSync *)self addOperation];
  }
  return v7;
}

void __49__SGDCloudKitSync_addManateeSanityCheckOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 653, @"Invalid parameter not satisfying: %@", @"strongEndOperation" object file lineNumber description];
  }
  uint64_t v6 = sgLogHandle();
  BOOL v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGCK Operation error during Manatee sanity check: %@", buf, 0xCu);
    }

    int v8 = *(void **)(a1 + 32);
    id v9 = [v8 recordZoneId];
    BOOL v7 = [v8 ckErrorForRecordZoneId:v9 inError:v4];

    if (v7 && [v7 code] == 112)
    {
      uint64_t v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v7;
        _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGCK Missing Manatee identity detected during sanity check. Deleting-and-then-re-creating zone... (record zone error: %@)", buf, 0xCu);
      }

      BOOL v11 = [*(id *)(a1 + 32) addDeleteAndRecreateZoneOperation];
      [WeakRetained addDependency:v11];
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK Manatee health check returned without errors", buf, 2u);
  }
}

- (id)addCreateZoneAttemptOperationWithRetries:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 134217984;
    *(void *)&location[4] = a3;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  BOOL v7 = [(SGDCloudKitSync *)self addOperation];
  int v8 = [(SGDCloudKitSync *)self addOperation];
  [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v7 end:v8];
  deleteZoneError = self->_deleteZoneError;
  if (deleteZoneError)
  {
    objc_storeStrong((id *)&self->_createZoneError, deleteZoneError);
    [v8 addDependency:v7];
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1A310]);
    BOOL v11 = [(SGDCloudKitSync *)self recordZoneId];
    id v12 = (void *)[v10 initWithZoneID:v11];

    uint64_t v13 = objc_opt_new();
    uint64_t v14 = [(SGDCloudKitSync *)self addOperation:v13];

    [v14 addDependency:v7];
    BOOL v20 = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v14 setRecordZonesToSave:v15];

    *(void *)id location = 0;
    objc_initWeak((id *)location, v8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __60__SGDCloudKitSync_addCreateZoneAttemptOperationWithRetries___block_invoke;
    v18[3] = &unk_1E65B8C28;
    objc_copyWeak(v19, (id *)location);
    v19[1] = (id)a2;
    v19[2] = (id)a3;
    v18[4] = self;
    [v14 setModifyRecordZonesCompletionBlock:v18];
    [v8 addDependency:v14];
    objc_destroyWeak(v19);
    objc_destroyWeak((id *)location);
  }
  int v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"CreateZone operation attempt completion [retries: %lu]", a3);
  [v8 setName:v16];

  return v8;
}

void __60__SGDCloudKitSync_addCreateZoneAttemptOperationWithRetries___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 574, @"Invalid parameter not satisfying: %@", @"strongEndOperation" object file lineNumber description];

    if (v6)
    {
LABEL_3:
      int v8 = *(void **)(a1 + 32);
      id v9 = [v8 recordZoneId];
      id v10 = [v8 ckErrorForRecordZoneId:v9 inError:v6];

      BOOL v11 = [*(id *)(a1 + 32) getUnderlyingError:v10];
      if ([v11 code] == 2053)
      {
        id v12 = sgLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGCK got PCS user identity unknown error while creating zone. Running processStateChanges just to be sure we didn't miss anything.", buf, 2u);
        }

        [*(id *)(a1 + 32) processStateChanges];
      }
      if (([*(id *)(a1 + 32) pauseIfNeededAndReturnRetryEligibilityForError:v10] & 1) != 0
        || [*(id *)(a1 + 32) pauseIfNeededAndReturnRetryEligibilityForError:v6])
      {
        uint64_t v13 = *(void *)(a1 + 56);
        if (v13)
        {
          uint64_t v14 = [*(id *)(a1 + 32) addCreateZoneAttemptOperationWithRetries:v13 - 1];
          [WeakRetained addDependency:v14];
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v15 = sgLogHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
LABEL_16:

          uint64_t v17 = *(void *)(a1 + 32);
          id v18 = v6;
          uint64_t v14 = *(void **)(v17 + 168);
          *(void *)(v17 + 168) = v18;
          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        int v16 = "SGCK aborting create zone because out of retries for retry-able error: %@";
      }
      else
      {
        if ([v6 code] == 18)
        {
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), a4);
          [*(id *)(a1 + 32) disable];
LABEL_18:

          goto LABEL_25;
        }
        uint64_t v15 = sgLogHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        int v16 = "SGCK Unrecoverable error for create zone operation: %@";
      }
      _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      goto LABEL_16;
    }
  }
  BOOL v20 = sgLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    id v23 = v21;
    _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneAttemptOperationWithRetries:%lu - SUCCESS (zone created or already exists)", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
LABEL_25:
}

- (id)addCreateZoneOperation
{
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    uint64_t v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addCreateZoneOperation - Skipping because of out of date software", buf, 2u);
    }

    BOOL v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_150];
    uint64_t v5 = [(SGDCloudKitSync *)self addOperation:v4];
LABEL_5:

    goto LABEL_10;
  }
  inProgressCreateZoneOperation = self->_inProgressCreateZoneOperation;
  BOOL v7 = sgLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!inProgressCreateZoneOperation)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneOperation - Adding new operation to operation queue", buf, 2u);
    }

    id v10 = (void *)MEMORY[0x1CB79B230]([(SGDCloudKitSync *)self clearErrors]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__SGDCloudKitSync_addCreateZoneOperation__block_invoke_151;
    v15[3] = &unk_1E65BEF88;
    v15[4] = self;
    BOOL v11 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v15];
    id v12 = [(SGDCloudKitSync *)self addOperation:v11];

    uint64_t v13 = self->_inProgressCreateZoneOperation;
    self->_inProgressCreateZoneOperation = v12;

    BOOL v4 = [(SGDCloudKitSync *)self addOperation];
    uint64_t v14 = [(SGDCloudKitSync *)self addCreateZoneAttemptOperationWithRetries:3];
    [(SGDCloudKitSync *)self _addDependency:v4 toTrain:v14];
    [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v4 end:self->_inProgressCreateZoneOperation];
    [(NSOperation *)self->_inProgressCreateZoneOperation addDependency:v14];
    uint64_t v5 = self->_inProgressCreateZoneOperation;

    goto LABEL_5;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneOperation - Returning operation already in flight", buf, 2u);
  }

  uint64_t v5 = self->_inProgressCreateZoneOperation;
LABEL_10:
  return v5;
}

void __41__SGDCloudKitSync_addCreateZoneOperation__block_invoke_151(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = sgLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 168);
      int v11 = 138412290;
      uint64_t v12 = v5;
      id v6 = "SGCK addCreateZoneOperation - Operation completed with error: %@";
      BOOL v7 = v3;
      uint32_t v8 = 12;
LABEL_7:
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v4)
  {
    LOWORD(v11) = 0;
    id v6 = "SGCK addCreateZoneOperation - Operation completed successfully";
    BOOL v7 = v3;
    uint32_t v8 = 2;
    goto LABEL_7;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 136);
  *(void *)(v9 + 136) = 0;
}

- (id)addDeleteZoneAttemptOperationWithRetries:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 134217984;
    *(void *)&location[4] = a3;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK addDeleteZoneAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  BOOL v7 = [(SGDCloudKitSync *)self addOperation];
  uint32_t v8 = [(SGDCloudKitSync *)self addOperation];
  [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v7 end:v8];
  uint64_t v9 = objc_opt_new();
  id v10 = [(SGDCloudKitSync *)self addOperation:v9];

  [v10 addDependency:v7];
  int v11 = [(SGDCloudKitSync *)self recordZoneId];
  uint64_t v22 = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v10 setRecordZoneIDsToDelete:v12];

  *(void *)id location = 0;
  objc_initWeak((id *)location, v8);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __60__SGDCloudKitSync_addDeleteZoneAttemptOperationWithRetries___block_invoke;
  id v19 = &unk_1E65B8C28;
  objc_copyWeak(v21, (id *)location);
  v21[1] = (id)a2;
  v21[2] = (id)a3;
  BOOL v20 = self;
  [v10 setModifyRecordZonesCompletionBlock:&v16];
  id v13 = [NSString alloc];
  uint64_t v14 = objc_msgSend(v13, "initWithFormat:", @"DeleteZone operation attempt completion [retries: %lu]", a3, v16, v17, v18, v19);
  [v8 setName:v14];

  [v8 addDependency:v10];
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)location);

  return v8;
}

void __60__SGDCloudKitSync_addDeleteZoneAttemptOperationWithRetries___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SGDCloudKitSync.m", 482, @"Invalid parameter not satisfying: %@", @"strongEndOperation" object file lineNumber description];
  }
  uint32_t v8 = *(id **)(a1 + 32);
  if (v6)
  {
    if ([v8 pauseIfNeededAndReturnRetryEligibilityForError:v6])
    {
      uint64_t v9 = *(void *)(a1 + 56);
      id v10 = *(id **)(a1 + 32);
      if (!v9)
      {
        int v11 = v10 + 22;
LABEL_18:
        objc_storeStrong(v11, a4);
        goto LABEL_19;
      }
      goto LABEL_13;
    }
    uint64_t v12 = [v6 code];
    if (v12 == 4)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9)
      {
        id v10 = *(id **)(a1 + 32);
LABEL_13:
        id v13 = [v10 addDeleteZoneAttemptOperationWithRetries:v9 - 1];
        [WeakRetained addDependency:v13];

        goto LABEL_19;
      }
      uint64_t v14 = sgLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        uint64_t v15 = "SGCK Ran out of retries for delete zone operation with network failure: %@";
        goto LABEL_21;
      }
    }
    else
    {
      if (v12 == 18)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), a4);
        [*(id *)(a1 + 32) disable];
        goto LABEL_19;
      }
      uint64_t v14 = sgLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        uint64_t v15 = "SGCK Unrecoverable error for delete zone operation: %@";
LABEL_21:
        _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
      }
    }

    int v11 = (id *)(*(void *)(a1 + 32) + 176);
    goto LABEL_18;
  }
  [v8[13] setSyncToken:0];
  [*(id *)(a1 + 32) failSalt];
LABEL_19:
}

- (id)addDeleteZoneOperation
{
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    uint64_t v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addDeleteZoneOperation - Skipping because of out of date software", buf, 2u);
    }

    BOOL v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_139];
    uint64_t v5 = [(SGDCloudKitSync *)self addOperation:v4];
LABEL_5:

    goto LABEL_10;
  }
  inProgressDeleteZoneOperation = self->_inProgressDeleteZoneOperation;
  BOOL v7 = sgLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!inProgressDeleteZoneOperation)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK addDeleteZoneOperation - Adding new operation to operation queue", buf, 2u);
    }

    id v10 = (void *)MEMORY[0x1CB79B230]([(SGDCloudKitSync *)self clearErrors]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__SGDCloudKitSync_addDeleteZoneOperation__block_invoke_140;
    v15[3] = &unk_1E65BEF88;
    v15[4] = self;
    int v11 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v15];
    uint64_t v12 = [(SGDCloudKitSync *)self addOperation:v11];

    id v13 = self->_inProgressDeleteZoneOperation;
    self->_inProgressDeleteZoneOperation = v12;

    BOOL v4 = [(SGDCloudKitSync *)self addOperation];
    uint64_t v14 = [(SGDCloudKitSync *)self addDeleteZoneAttemptOperationWithRetries:3];
    [(NSOperation *)self->_inProgressDeleteZoneOperation addDependency:v14];
    [(SGDCloudKitSync *)self _addDependency:v4 toTrain:v14];
    [(SGDCloudKitSync *)self _coupleOperationTrainWithStart:v4 end:self->_inProgressDeleteZoneOperation];
    [(SGDCloudKitSync *)self failSalt];
    self->_noZone = 1;
    uint64_t v5 = self->_inProgressDeleteZoneOperation;

    goto LABEL_5;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK addDeleteZoneOperation - Returning operation already in flight", buf, 2u);
  }

  uint64_t v5 = self->_inProgressDeleteZoneOperation;
LABEL_10:
  return v5;
}

void __41__SGDCloudKitSync_addDeleteZoneOperation__block_invoke_140(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 176);
  uint64_t v3 = sgLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 176);
      int v11 = 138412290;
      uint64_t v12 = v5;
      id v6 = "SGCK addDeleteZoneOperation - Operation completed with error: %@";
      BOOL v7 = v3;
      uint32_t v8 = 12;
LABEL_7:
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v4)
  {
    LOWORD(v11) = 0;
    id v6 = "SGCK addDeleteZoneOperation - Operation completed successfully";
    BOOL v7 = v3;
    uint32_t v8 = 2;
    goto LABEL_7;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 144);
  *(void *)(v9 + 144) = 0;
}

- (BOOL)pauseIfNeededAndReturnRetryEligibilityForError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SGDCloudKitSync *)self getUnderlyingError:a3];
  if ([v4 code] == 111 || objc_msgSend(v4, "code") == 5008)
  {
    uint64_t v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGCK Suspending sync due to unsynced keychain: %@", buf, 0xCu);
    }

    [(SGDCloudKitSync *)self suspend];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__19097;
    BOOL v20 = __Block_byref_object_dispose__19098;
    id v21 = 0;
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F19C98];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke;
    void v17[3] = &unk_1E65B8C00;
    v17[4] = self;
    void v17[5] = buf;
    uint64_t v8 = [v6 addObserverForName:v7 object:0 queue:0 usingBlock:v17];
    uint64_t v9 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v8;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v12 = [v4 userInfo];

    if (v12
      && ([v4 userInfo],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          [v13 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      uint64_t v15 = sgLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGCK Delaying for %@ seconds (error: %@)", buf, 0x16u);
      }

      [v14 doubleValue];
      -[SGDCloudKitSync suspendAndResumeAfter:](self, "suspendAndResumeAfter:");
    }
    else
    {
      if (!CKCanRetryForError())
      {
        BOOL v10 = 0;
        goto LABEL_7;
      }
      uint64_t v16 = sgLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGCK CloudKit framework recommends retry without delay for error: %@", buf, 0xCu);
      }
    }
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

void __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke(uint64_t a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA650000, v2, OS_LOG_TYPE_ERROR, "SGCK Resuming sync after suspension due to unsynced keychain", buf, 2u);
  }

  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke_135;
  block[3] = &unk_1E65BEF88;
  void block[4] = v4;
  dispatch_async(v5, block);
}

uint64_t __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

- (id)getUnderlyingError:(id)a3
{
  id v3 = a3;
  if ([v3 code] != 1 && objc_msgSend(v3, "code") != 15
    || ([v3 userInfo],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v5 = v3;
  }

  return v5;
}

- (void)resume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v3 = self->_suspendCount - 1;
  self->_suspendCount = v3;
  if (!v3)
  {
    uint64_t v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGCK Resuming operation queue", v5, 2u);
    }

    [(NSOperationQueue *)self->_opQueue setSuspended:0];
  }
}

- (void)suspendAndResumeAfter:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGCK Will suspend operation queue for delay: %f", buf, 0xCu);
  }

  [(SGDCloudKitSync *)self suspend];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SGDCloudKitSync_suspendAndResumeAfter___block_invoke;
  v7[3] = &unk_1E65BEF88;
  void v7[4] = self;
  [MEMORY[0x1E4F93B18] runAsyncOnQueue:queue afterDelaySeconds:v7 block:a3];
}

uint64_t __41__SGDCloudKitSync_suspendAndResumeAfter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

- (void)suspend
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t suspendCount = self->_suspendCount;
  self->_int64_t suspendCount = suspendCount + 1;
  if (!suspendCount)
  {
    uint64_t v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGCK Operation queue suspended", v5, 2u);
    }

    [(NSOperationQueue *)self->_opQueue setSuspended:1];
  }
}

- (void)disable
{
  int64_t v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGCK Disabling due to incompatible version", v4, 2u);
  }

  self->_disabledBecauseOutOfDateSoftware = 1;
  [(NSOperationQueue *)self->_opQueue cancelAllOperations];
}

- (void)clearErrors
{
  createZoneError = self->_createZoneError;
  self->_createZoneError = 0;

  deleteZoneError = self->_deleteZoneError;
  self->_deleteZoneError = 0;

  procureSaltError = self->_procureSaltError;
  self->_procureSaltError = 0;
}

- (void)_addDependency:(id)a3 toTrain:(id)a4
{
  id object = a4;
  id v5 = a3;
  objc_getAssociatedObject(object, sel__coupleOperationTrainWithStart_end_);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    id v6 = object;
  }
  [v6 addDependency:v5];
}

- (void)_coupleOperationTrainWithStart:(id)a3 end:(id)a4
{
  if (a3 != a4) {
    objc_setAssociatedObject(a4, sel__coupleOperationTrainWithStart_end_, a3, (void *)1);
  }
}

+ (id)apsEnvironmentStringForContainer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5DA30];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke;
  v9[3] = &unk_1E65B8E78;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 futureForObject:v6 withKey:a2 onCreate:v9];

  return v7;
}

void __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_2;
  v11[3] = &unk_1E65B8E50;
  id v12 = *(id *)(a1 + 32);
  [v3 wait:v11];
  id v4 = (void *)xpc_copy_entitlement_for_self();
  if (!v4)
  {
    id v6 = 0;
LABEL_6:
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGCKAPSEnvironmentDomain" code:0 userInfo:0];
    [v3 fail:v8];
    goto LABEL_7;
  }
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = v5;
  if (!v5 || [v5 compare:*MEMORY[0x1E4F19CE0] options:1]) {
    goto LABEL_6;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_268;
  v9[3] = &unk_1E65B8E50;
  id v10 = v3;
  [v7 serverPreferredPushEnvironmentWithCompletionHandler:v9];
  uint64_t v8 = v10;
LABEL_7:
}

void __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK Got APS environment string: %@ (error: %@, container: %@)", (uint8_t *)&v9, 0x20u);
  }
}

void __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_268(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGCK Error when getting preferred push env. Defaulting to prod instead. Error: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *MEMORY[0x1E4F4E1D0];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = a2;
  }
  [v7 succeed:v8];
}

+ (void)setSharedInstanceConfigurationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedInstanceConfigurationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SGDCloudKitSync_setSharedInstanceConfigurationBlock___block_invoke;
  block[3] = &unk_1E65B8D68;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __55__SGDCloudKitSync_setSharedInstanceConfigurationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGCK Setting configuration block...", v11, 2u);
  }

  uint64_t v3 = _SGDCloudKitSyncSharedInstance;
  id v4 = sgLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v10 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK The shared instance already exists, so the configuration block will run immediately.", v10, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK Done running the completion block immediately from +[SGCK setSharedInstanceConfigurationBlock:]", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK The shared instance doesn't exist yet, so the configuration block won't run until it's instantiated.", v8, 2u);
    }

    uint64_t v7 = MEMORY[0x1CB79B4C0](*(void *)(a1 + 32));
    id v6 = _SGDCloudKitSyncSharedInstanceConfigurationBlock;
    _SGDCloudKitSyncSharedInstanceConfigurationBlock = v7;
  }
}

+ (id)sharedInstance
{
  uint64_t v2 = [a1 _sharedInstanceConfigurationQueue];
  dispatch_sync(v2, &__block_literal_global_227);

  uint64_t v3 = (void *)_SGDCloudKitSyncSharedInstance;
  return v3;
}

void __33__SGDCloudKitSync_sharedInstance__block_invoke()
{
  if (!_SGDCloudKitSyncSharedInstance)
  {
    v0 = sgLogHandle();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v0, OS_LOG_TYPE_DEBUG, "SGCK Instantiating +[SGCK sharedInstance]", buf, 2u);
    }

    uint64_t v1 = objc_opt_new();
    uint64_t v2 = (void *)_SGDCloudKitSyncSharedInstance;
    _SGDCloudKitSyncSharedInstance = v1;

    uint64_t v3 = _SGDCloudKitSyncSharedInstanceConfigurationBlock;
    id v4 = sgLogHandle();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)int v9 = 0;
        _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK Running configuration block via +[SGCK sharedInstance] (the configuration block was specified prior to sharedInstance being called for the first time)", v9, 2u);
      }

      (*(void (**)(uint64_t, uint64_t))(_SGDCloudKitSyncSharedInstanceConfigurationBlock + 16))(_SGDCloudKitSyncSharedInstanceConfigurationBlock, _SGDCloudKitSyncSharedInstance);
      id v6 = sgLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v8 = 0;
        _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGCK Configuration block has completed from within +[SGCK sharedInstance]'s first invocation. Setting the block to nil.", v8, 2u);
      }

      id v4 = _SGDCloudKitSyncSharedInstanceConfigurationBlock;
      _SGDCloudKitSyncSharedInstanceConfigurationBlock = 0;
    }
    else if (v5)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGCK No configuration block has been specified before the first invocation of +[SGCK sharedInstance]. If a configuration block is set later on, it will be run immediately.", v7, 2u);
    }
  }
}

+ (id)_sharedInstanceConfigurationQueue
{
  if (_sharedInstanceConfigurationQueue__pasOnceToken87 != -1) {
    dispatch_once(&_sharedInstanceConfigurationQueue__pasOnceToken87, &__block_literal_global_224);
  }
  uint64_t v2 = (void *)_sharedInstanceConfigurationQueue__pasExprOnceResult;
  return v2;
}

void __52__SGDCloudKitSync__sharedInstanceConfigurationQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("SGDCloudKitSync_sharedInstanceConfigurationQueue", v1);
  uint64_t v3 = (void *)_sharedInstanceConfigurationQueue__pasExprOnceResult;
  _sharedInstanceConfigurationQueue__pasExprOnceResult = (uint64_t)v2;
}

+ (id)_callbackQueue
{
  if (_callbackQueue__pasOnceToken6 != -1) {
    dispatch_once(&_callbackQueue__pasOnceToken6, &__block_literal_global_129);
  }
  dispatch_queue_t v2 = (void *)_callbackQueue__pasExprOnceResult;
  return v2;
}

void __33__SGDCloudKitSync__callbackQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGDCloudKitSync-callbacks" qosClass:9];
  dispatch_queue_t v2 = (void *)_callbackQueue__pasExprOnceResult;
  _callbackQueue__pasExprOnceResult = v1;
}

@end