@interface HDCloudSyncObserverTaskServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDCloudSyncObserverTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSString)description;
- (id)_readRestoreCompletionDateWithError:(id)a1;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)remote_retrieveProgressForIdentifier:(id)a3 completion:(id)a4;
- (id)remote_startSyncIfRestoreNotCompletedWithUUID:(id)a3 completion:(id)a4;
- (uint64_t)_queue_verifyCloudSyncEnabledWithError:(dispatch_queue_t *)a1;
- (uint64_t)_shouldNotifyObserverAboutRequest:(uint64_t)a1;
- (void)_cloudKitIdentityUpdated:(id)a3;
- (void)_queue_didFailToPopulateStatusWithError:(uint64_t)a1;
- (void)_queue_didUpdateSyncStatus;
- (void)_queue_didUpdateSyncStatusWithErrorRequiringUserAction:(uint64_t)a1;
- (void)_queue_didUpdateSyncStatusWithSyncEnabled:(uint64_t)a1;
- (void)_queue_instantiateCloudSyncObserverStatus:(uint64_t)a1;
- (void)_queue_syncDidStart;
- (void)_queue_updateSyncStatusWithBlock:(uint64_t)a1;
- (void)cloudSyncCoordinator:(id)a3 syncRequestDidCompleteForRequest:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)cloudSyncCoordinator:(id)a3 syncStartedForRequest:(id)a4 progress:(id)a5;
- (void)cloudSyncManager:(id)a3 didUpdateDataUploadRequestStatus:(int64_t)a4 startDate:(id)a5 endDate:(id)a6;
- (void)cloudSyncManager:(id)a3 didUpdateErrorRequiringUserAction:(id)a4;
- (void)cloudSyncManager:(id)a3 didUpdateLastLitePushDate:(id)a4;
- (void)cloudSyncManager:(id)a3 didUpdateLastPullDate:(id)a4;
- (void)cloudSyncManager:(id)a3 didUpdateLastPulledUpdateDate:(id)a4;
- (void)cloudSyncManager:(id)a3 didUpdateLastPushDate:(id)a4;
- (void)cloudSyncManager:(id)a3 didUpdateRestoreCompletionDate:(id)a4;
- (void)cloudSyncManager:(id)a3 didUpdateSyncEnabled:(BOOL)a4;
- (void)connectionInvalidated;
- (void)remote_startObservingSyncRequestsMatchingFilter:(unint64_t)a3;
- (void)remote_startObservingSyncStatusWithCompletion:(id)a3;
- (void)remote_stopObservingSyncRequests;
@end

@implementation HDCloudSyncObserverTaskServer

- (HDCloudSyncObserverTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncObserverTaskServer;
  v6 = [(HDStandardTaskServer *)&v12 initWithUUID:a3 configuration:0 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_filter = 0;
    v6->_isObservingSyncRequests = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressTracker = v6->_progressTracker;
    v6->_progressTracker = v9;
  }
  return v6;
}

- (void)connectionInvalidated
{
  v3 = [(HDStandardTaskServer *)self profile];
  v4 = [v3 daemon];
  v5 = [v4 cloudSyncCoordinator];
  [v5 removeObserver:self];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  id v8 = [(HDStandardTaskServer *)self profile];
  uint64_t v7 = [v8 cloudSyncManager];
  [v7 removeObserver:self];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HDStandardTaskServer *)self client];
  uint64_t v7 = [v6 profile];
  id v8 = [v7 profileIdentifier];
  v9 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v8];

  return (NSString *)v9;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F298F8];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  uint64_t v5 = *MEMORY[0x1E4F2A548];
  id v6 = a3;
  LOBYTE(v5) = [v6 hasRequiredEntitlement:v5 error:a4];
  LOBYTE(a4) = [v6 hasRequiredArrayEntitlement:*MEMORY[0x1E4F2A558] containing:*MEMORY[0x1E4F29AF0] error:a4];

  return v5 | a4;
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AD38] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AD38] serverInterface];
}

- (void)remote_startObservingSyncStatusWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  uint64_t v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 cloudSyncManager];

  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke;
    block[3] = &unk_1E62F4E40;
    block[4] = self;
    id v9 = v6;
    v10 = v4;
    dispatch_sync(queue, block);
  }
  else
  {
    v4[2](v4);
  }
}

void __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke_2;
  v3[3] = &unk_1E62F2A18;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  -[HDCloudSyncObserverTaskServer _queue_instantiateCloudSyncObserverStatus:](v2, v3);
}

void __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__cloudKitIdentityUpdated_ name:*MEMORY[0x1E4F19C98] object:0];

  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 40));
      if (*(unsigned char *)(v6 + 64))
      {
        _HKInitializeLogging();
        uint64_t v7 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v10 = v6;
          _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Observering sync status is YES. No need to inform client again.", buf, 0xCu);
        }
      }
      else
      {
        *(unsigned char *)(v6 + 64) = 1;
        -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v6);
      }
    }
  }
  else
  {
    -[HDCloudSyncObserverTaskServer _queue_didFailToPopulateStatusWithError:](*(void *)(a1 + 32), v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_queue_didFailToPopulateStatusWithError:(uint64_t)a1
{
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 40);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    *(unsigned char *)(a1 + 64) = 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__HDCloudSyncObserverTaskServer__queue_didFailToPopulateStatusWithError___block_invoke;
    v6[3] = &unk_1E62F3170;
    v6[4] = a1;
    id v5 = [(id)a1 remoteObjectProxyWithErrorHandler:v6];
    objc_msgSend(v5, "clientRemote_didFailToPopulateStatusWithError:", v4);
  }
}

- (void)_queue_instantiateCloudSyncObserverStatus:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(void *)(a1 + 48))
    {
      v3[2](v3, 1, 0);
    }
    else
    {
      id v4 = [(id)a1 profile];
      id v5 = [v4 cloudSyncManager];

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke;
      v7[3] = &unk_1E62FAA10;
      v7[4] = a1;
      id v8 = v5;
      id v9 = v3;
      id v6 = v5;
      [v6 accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:v7];
    }
  }
}

- (id)remote_startSyncIfRestoreNotCompletedWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke;
  v16[3] = &unk_1E62F7128;
  id v19 = v7;
  v16[4] = self;
  id v17 = v6;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(queue, v16);
  v13 = v18;
  id v14 = v10;

  return v14;
}

void __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = (void **)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  id v41 = 0;
  char v4 = -[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v2, &v41);
  id v5 = v41;
  id v6 = *v3;
  if (v4)
  {
    id v7 = [v6 profile];
    id v8 = [v7 daemon];
    id v9 = [v8 cloudSyncCoordinator];
    id v10 = [v9 accountProvider];
    int v11 = [v10 isAccountInManateeUnavailableCFUState];

    if (v11)
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 706, @"Manatee container is unavailable, device is in CFU state", v5);

      -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithErrorRequiringUserAction:](*(void *)(a1 + 32), v12);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v5 = v12;
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        id v18 = (void *)MEMORY[0x1E4F1C9C8];
        id v19 = v15;
        v20 = [v18 date];
        v21 = HKDiagnosticStringFromDate();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2114;
        v51 = v21;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: start syncIfRestoreNotCompleted: date (%{public}@)", buf, 0x20u);
      }
      uint64_t v23 = *(void *)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_324;
      v39[3] = &unk_1E62F94E0;
      id v40 = *(id *)(a1 + 56);
      id v24 = v22;
      v25 = v39;
      if (v23)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v23 + 40));
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2020000000;
        v49[3] = -1;
        v26 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
        id v27 = objc_alloc(MEMORY[0x1E4F65CD8]);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke;
        v51 = &unk_1E62FA8A8;
        v55 = v49;
        uint64_t v52 = v23;
        id v28 = v24;
        id v53 = v28;
        v54 = v25;
        v29 = (void *)[v27 initWithDescription:@"Determine if sync is complete enough stop stop waiting" completion:buf];
        v30 = v25;
        id v31 = v24;
        uint64_t v32 = *(void *)(v23 + 40);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_332;
        v45[3] = &unk_1E62FA970;
        v45[4] = v23;
        v48 = v49;
        id v46 = v28;
        id v33 = v26;
        id v47 = v33;
        uint64_t v34 = v32;
        id v24 = v31;
        v25 = v30;
        [v29 addTaskOnQueue:v34 task:v45];
        uint64_t v35 = *(void *)(v23 + 40);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_341;
        v42[3] = &unk_1E62FA998;
        v44 = v49;
        v42[4] = v23;
        id v36 = v33;
        id v43 = v36;
        [v29 addTaskOnQueue:v35 task:v42];
        [v29 begin];
        v37 = v43;
        id v38 = v36;

        _Block_object_dispose(v49, 8);
      }
      else
      {
        id v38 = 0;
      }

      [*(id *)(a1 + 48) addChild:v38 withPendingUnitCount:1];
    }
  }
  else
  {
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithSyncEnabled:]((uint64_t)v6, 0);
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = objc_msgSend(v5, "hk_sanitizedError");
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 4, v14);
  }
}

- (uint64_t)_queue_verifyCloudSyncEnabledWithError:(dispatch_queue_t *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(a1[5]);
  char v4 = [(dispatch_queue_t *)a1 profile];
  id v5 = [v4 daemon];
  id v6 = [v5 cloudSyncCoordinator];
  id v12 = 0;
  uint64_t v7 = [v6 canPerformCloudSyncWithError:&v12];
  id v8 = v12;

  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = a1;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: syncIfRestoreNotCompleted triggered, but Health cloud sync is not enabled: %{public}@", buf, 0x16u);
    }
    id v10 = v8;
    if (v10)
    {
      if (a2) {
        *a2 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v7;
}

- (void)_queue_didUpdateSyncStatusWithSyncEnabled:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __75__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithSyncEnabled___block_invoke;
    v4[3] = &unk_1E62F8638;
    v4[4] = a1;
    char v5 = a2;
    -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:](a1, v4);
  }
}

- (void)_queue_didUpdateSyncStatusWithErrorRequiringUserAction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __88__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithErrorRequiringUserAction___block_invoke;
    v4[3] = &unk_1E62F31C0;
    v4[4] = a1;
    id v5 = v3;
    -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:](a1, v4);
  }
}

void __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_324(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)_queue_didUpdateSyncStatus
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(unsigned char *)(a1 + 64))
    {
      _HKInitializeLogging();
      uint64_t v2 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v7 = a1;
        __int16 v8 = 2114;
        uint64_t v9 = v3;
        _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client didUpdateObserverWithSyncStatus: with status: %{public}@", buf, 0x16u);
      }
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatus__block_invoke;
      v5[3] = &unk_1E62F3170;
      v5[4] = a1;
      uint64_t v4 = [(id)a1 remoteObjectProxyWithErrorHandler:v5];
      objc_msgSend(v4, "clientRemote_didUpdateObserverWithSyncStatus:", *(void *)(a1 + 48));
    }
  }
}

void __75__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithSyncEnabled___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) syncEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setSyncEnabled:v3 != 0];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

- (void)_queue_updateSyncStatusWithBlock:(uint64_t)a1
{
  int v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__HDCloudSyncObserverTaskServer__queue_updateSyncStatusWithBlock___block_invoke;
    v4[3] = &unk_1E62F70B0;
    v4[4] = a1;
    id v5 = v3;
    -[HDCloudSyncObserverTaskServer _queue_instantiateCloudSyncObserverStatus:](a1, v4);
  }
}

void __94__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithAccountSupportsSecureContainer___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) accountSupportsSecureContainer];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setAccountSupportsSecureContainer:v3 != 0];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

void __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPushDate___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) lastPushDate];
  int v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setLastPushDate:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

void __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPullDate___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) lastPullDate];
  int v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setLastPullDate:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

void __80__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastLitePushDate___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) lastLitePushDate];
  int v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setLastLitePushDate:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

void __84__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPulledUpdateDate___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) lastPulledUpdateDate];
  if (!v4 || (int v2 = objc_msgSend(*(id *)(a1 + 40), "hk_isAfterDate:", v4), v3 = (void *)v4, v2))
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setLastPulledUpdateDate:*(void *)(a1 + 40)];
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(void *)(a1 + 32));
    int v3 = (void *)v4;
  }
}

void __83__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithRestoreCompleteDate___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) restoreCompletionDate];
  int v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setRestoreCompletionDate:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

void __88__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithErrorRequiringUserAction___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) errorRequiringUserAction];
  int v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setErrorRequiringUserAction:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v4);
  }
}

void __59__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client didUpdateObserverWithSyncStatus: with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_queue_syncDidStart
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    _HKInitializeLogging();
    int v2 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v4 = v2;
      uint64_t v5 = [v3 date];
      int v6 = HKDiagnosticStringFromDate();
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = a1;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client syncDidStart with date: (%{public}@", buf, 0x16u);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__HDCloudSyncObserverTaskServer__queue_syncDidStart__block_invoke;
    v8[3] = &unk_1E62F3170;
    v8[4] = a1;
    uint64_t v7 = [(dispatch_queue_t *)a1 remoteObjectProxyWithErrorHandler:v8];
    objc_msgSend(v7, "clientRemote_syncDidStart");
  }
}

void __52__HDCloudSyncObserverTaskServer__queue_syncDidStart__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client syncDidStart with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __73__HDCloudSyncObserverTaskServer__queue_didFailToPopulateStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client didFailToPopulateStatusWithError with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (*(void *)(*(void *)(a1[7] + 8) + 24) == -1 && !a3)
  {
    uint64_t v9 = a1[4];
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      char v23 = 0;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__51;
      v20[4] = __Block_byref_object_dispose__51;
      id v21 = 0;
      __int16 v11 = *(NSObject **)(v9 + 40);
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __63__HDCloudSyncObserverTaskServer__persistRestoreCompletionDate___block_invoke;
      v25 = &unk_1E62FA9C0;
      *(void *)&long long v26 = v9;
      id v27 = v22;
      id v12 = v10;
      *((void *)&v26 + 1) = v12;
      id v28 = v20;
      dispatch_sync(v11, block);

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(v22, 8);
    }
  }
  uint64_t v13 = a1[4];
  id v14 = *(void **)(v13 + 56);
  *(void *)(v13 + 56) = 0;

  _HKInitializeLogging();
  __int16 v15 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = a1[4];
    uint64_t v17 = a1[5];
    id v18 = v15;
    id v19 = _HKCloudSyncObserverStatusToString();
    *(_DWORD *)block = 138544130;
    *(void *)&block[4] = v16;
    *(_WORD *)&block[12] = 2114;
    *(void *)&block[14] = v17;
    *(_WORD *)&block[22] = 2114;
    v25 = v19;
    LOWORD(v26) = 2114;
    *(void *)((char *)&v26 + 2) = v8;
    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: taskTree complete: status (%{public}@), error (%{public}@)", block, 0x2Au);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_332(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  id v7 = *(dispatch_queue_t **)(a1 + 32);
  id v58 = 0;
  if (v7)
  {
    dispatch_assert_queue_V2(v7[5]);
    if (-[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v7, &v58))
    {
      *(void *)v59 = 0;
      id v8 = -[HDCloudSyncObserverTaskServer _readRestoreCompletionDateWithError:](v7, v59);
      id v9 = *(id *)v59;
      id v10 = v9;
      if (v8 || !v9)
      {
        if (v8)
        {
          _HKInitializeLogging();
          id v12 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v8;
            _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync restore was already completed on %{public}@.", buf, 0x16u);
          }
          uint64_t v11 = 2;
        }
        else
        {
          uint64_t v13 = [(dispatch_queue_t *)v7 profile];
          id v14 = [v13 cloudSyncManager];
          __int16 v15 = [v14 status];
          uint64_t v16 = [v15 lastSuccessfulPullDate];
          BOOL v17 = v16 == 0;

          if (v17) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = 3;
          }
        }
      }
      else
      {
        uint64_t v11 = -1;
      }
    }
    else
    {
      uint64_t v11 = 4;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v18 = v58;
  id v19 = [*(id *)(a1 + 32) profile];
  v20 = [v19 daemon];
  id v21 = [v20 cloudSyncCoordinator];

  switch(v11)
  {
    case 4:
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 4;
      v6[2](v6, 1, v18);
      break;
    case 3:
      -[HDCloudSyncObserverTaskServer _queue_syncDidStart](*(dispatch_queue_t **)(a1 + 32));
      v6[2](v6, 0, 0);
      break;
    case 2:
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
      v6[2](v6, 0, 0);
      break;
    default:
      if (v21)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v63 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2;
        aBlock[3] = &unk_1E62FA8F8;
        v22 = *(void **)(a1 + 40);
        aBlock[4] = *(void *)(a1 + 32);
        uint64_t v56 = buf;
        id v54 = v22;
        char v23 = v6;
        uint64_t v24 = *(void *)(a1 + 56);
        v55 = v23;
        uint64_t v57 = v24;
        v25 = _Block_copy(aBlock);
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_333;
        v51[3] = &unk_1E62F29A0;
        id v26 = v25;
        id v52 = v26;
        id v27 = [v21 addCloudSyncProgressCompletion:v51];
        if (v27)
        {
          _HKInitializeLogging();
          id v28 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            uint64_t v30 = *(void *)(a1 + 40);
            *(_DWORD *)v59 = 138543618;
            *(void *)&v59[4] = v29;
            __int16 v60 = 2114;
            uint64_t v61 = v30;
            _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: active sync in progress, observe it", v59, 0x16u);
          }
          id v31 = objc_msgSend(MEMORY[0x1E4F28F90], "hd_progressMirroringProgress:", v27);
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v32 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = *(void *)(a1 + 32);
            uint64_t v34 = *(void *)(a1 + 40);
            *(_DWORD *)v59 = 138543618;
            *(void *)&v59[4] = v33;
            __int16 v60 = 2114;
            uint64_t v61 = v34;
            _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: start a sync and observe it", v59, 0x16u);
          }
          [v21 prepareAllProfilesForPeriodicSyncAndRestore];
          id v35 = [[HDCloudSyncContext alloc] initForPurpose:0 options:0 reason:7 xpcActivity:0];
          id v31 = [v21 syncAllProfilesWithContext:v35 completion:v26];
        }
        [*(id *)(a1 + 48) addChild:v31 withPendingUnitCount:1];
        _HKInitializeLogging();
        id v36 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = *(void *)(a1 + 32);
          uint64_t v38 = *(void *)(a1 + 40);
          *(_DWORD *)v59 = 138543618;
          *(void *)&v59[4] = v37;
          __int16 v60 = 2114;
          uint64_t v61 = v38;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: call client startHandler", v59, 0x16u);
        }
        -[HDCloudSyncObserverTaskServer _queue_syncDidStart](*(dispatch_queue_t **)(a1 + 32));
        v39 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:*(void *)(a1 + 48) path:"fractionCompleted"];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_337;
        v47[3] = &unk_1E62FA948;
        id v40 = *(void **)(a1 + 40);
        v47[4] = *(void *)(a1 + 32);
        id v41 = v40;
        uint64_t v42 = *(void *)(a1 + 56);
        id v48 = v41;
        uint64_t v50 = v42;
        id v43 = v26;
        id v49 = v43;
        uint64_t v44 = [v39 addObserverBlock:v47];
        uint64_t v45 = *(void *)(a1 + 32);
        id v46 = *(void **)(v45 + 56);
        *(void *)(v45 + 56) = v44;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -1;
        v6[2](v6, 3, 0);
      }
      break;
  }
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_3;
  block[3] = &unk_1E62FA8D0;
  uint64_t v16 = *(void *)(a1 + 56);
  block[4] = v6;
  id v8 = *(id *)(a1 + 40);
  char v18 = a2;
  id v13 = v8;
  id v14 = v5;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  id v15 = v9;
  uint64_t v17 = v10;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    _HKInitializeLogging();
    id v3 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v4;
      __int16 v15 = 2114;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: syncCompletion already called", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(unsigned __int8 *)(a1 + 80);
      uint64_t v10 = *(void *)(a1 + 48);
      int v13 = 138544130;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 1026;
      int v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: syncCompletion called: result (%{public}id), error (%{public}@)", (uint8_t *)&v13, 0x26u);
    }
    if (*(unsigned char *)(a1 + 80))
    {
      id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(void *)(v12 + 24) == -1) {
        *(void *)(v12 + 24) = 0;
      }
      id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v11();
  }
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_333(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if ((a2 & 1) != 0 || (v6 = objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 726), uint64_t v7 = v8, (v6 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v7 = v8;
  }
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_337(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2_338;
  block[3] = &unk_1E62FA920;
  block[4] = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v8;
  long long v12 = v8;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2_338(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (dispatch_queue_t *)a1[4];
  id v19 = 0;
  if (v2)
  {
    dispatch_assert_queue_V2(v2[5]);
    if (-[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v2, &v19))
    {
      int v3 = 0;
    }
    else
    {
      -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithSyncEnabled:]((uint64_t)v2, 0);
      int v3 = 1;
    }
  }
  else
  {
    int v3 = 0;
  }
  id v4 = v19;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = (void *)a1[6];
    id v10 = v6;
    [v9 doubleValue];
    long long v12 = v11;
    int v13 = _HKCloudSyncObserverStatusToString();
    *(_DWORD *)buf = 138544386;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v8;
    __int16 v24 = 2048;
    v25 = v12;
    __int16 v26 = 2114;
    id v27 = v13;
    __int16 v28 = 2114;
    id v29 = v4;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: waitUUID %{public}@: observer block called: progress (%03.3f%%), status (%{public}@), error (%{public}@)", buf, 0x34u);
  }
  if (v3)
  {
    _HKInitializeLogging();
    os_log_t v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = a1[4];
      uint64_t v16 = a1[5];
      __int16 v17 = v14;
      int v18 = _HKCloudSyncObserverStatusToString();
      *(_DWORD *)buf = 138544130;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      __int16 v24 = 2114;
      v25 = v18;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: stop observer: status (%{public}@), error (%{public}@)", buf, 0x2Au);
    }
    *(void *)(*(void *)(a1[8] + 8) + 24) = 4;
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_341(void *a1, void *a2, void *a3)
{
  id v13 = a3;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) != 2)
  {
    uint64_t v5 = a1[4];
    if (v5)
    {
      id v6 = (void *)a1[5];
      uint64_t v7 = *(NSObject **)(v5 + 40);
      id v8 = v6;
      id v9 = a2;
      dispatch_assert_queue_V2(v7);
      id v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
      [v8 addChild:v10 withPendingUnitCount:1];

      uint64_t v11 = *(void *)(v5 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke;
      v14[3] = &unk_1E62F7640;
      v14[4] = v5;
      id v15 = v10;
      id v12 = v10;
      [v9 addTaskOnQueue:v11 task:v14];
    }
  }
  (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
}

- (id)_readRestoreCompletionDateWithError:(id)a1
{
  id v2 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = [a1 profile];
    uint64_t v5 = [v4 cloudSyncManager];
    id v11 = 0;
    id v6 = [v5 restoreCompletionDateWithError:&v11];
    id v7 = v11;

    if (!v6 && v7)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v13 = v2;
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read the cloud sync restore status: %{public}@.", buf, 0x16u);
      }
      id v2 = 0;
      goto LABEL_15;
    }
    if (v7)
    {
      if (!a2)
      {
        _HKLogDroppedError();
        if (!v6)
        {
LABEL_11:
          _HKInitializeLogging();
          id v9 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v13 = v2;
            _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Restore complete status not set.", buf, 0xCu);
          }
        }
LABEL_14:
        id v2 = v6;
LABEL_15:

        goto LABEL_16;
      }
      *a2 = v7;
    }
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
LABEL_16:

  return v2;
}

void __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) profile];
  id v6 = [v5 daemon];
  id v7 = [v6 cloudSyncCoordinator];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke_2;
  v10[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v8 = v4;
  id v9 = [v7 mergeCloudSyncJournalsWithCompletion:v10];

  [*(id *)(a1 + 40) addChild:v9 withPendingUnitCount:1];
}

uint64_t __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__HDCloudSyncObserverTaskServer__persistRestoreCompletionDate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 65))
  {
    _HKInitializeLogging();
    int v3 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cloud sync restore was completed once successfully, we should not be restoring again.", buf, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v2 + 65) = 1;
    uint64_t v5 = [*(id *)(a1 + 32) profile];
    id v6 = [v5 cloudSyncManager];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    char v9 = [v6 persistRestoreCompletionDate:v7 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  }
}

- (void)_cloudKitIdentityUpdated:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received CKIdentityUpdateNotification", buf, 0xCu);
  }
  uint64_t v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 cloudSyncManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke;
  v7[3] = &unk_1E62F2978;
  v7[4] = self;
  [v6 accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:v7];
}

void __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke_2;
  v4[3] = &unk_1E62F8638;
  v4[4] = v2;
  char v5 = a2;
  dispatch_async(v3, v4);
}

void __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    char v2 = *(unsigned char *)(a1 + 40);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __94__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithAccountSupportsSecureContainer___block_invoke;
    v3[3] = &unk_1E62F8638;
    v3[4] = v1;
    char v4 = v2;
    -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:](v1, v3);
  }
}

void __66__HDCloudSyncObserverTaskServer__queue_updateSyncStatusWithBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    -[HDCloudSyncObserverTaskServer _queue_didFailToPopulateStatusWithError:](*(void *)(a1 + 32), v5);
  }
}

void __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2;
  block[3] = &unk_1E62F8A50;
  id v10 = v5;
  uint64_t v11 = v6;
  id v13 = *(id *)(a1 + 48);
  char v14 = a2;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, block);
}

void __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    char v2 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v39 = *(void **)(a1 + 32);
      uint64_t v38 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v51 = v38;
      __int16 v52 = 2114;
      id v53 = v39;
      _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read account D2D encryption availability with error %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    int v3 = *(void **)(*(void *)(a1 + 40) + 48);
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F2AD40]);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = v4;

      int v3 = *(void **)(*(void *)(a1 + 40) + 48);
    }
    [v3 setAccountSupportsSecureContainer:*(unsigned __int8 *)(a1 + 64)];
    uint64_t v7 = [*(id *)(a1 + 40) profile];
    id v8 = [v7 daemon];
    char v9 = [v8 cloudSyncCoordinator];
    id v10 = [v9 accountProvider];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setAccountProhibitedForCloudSync:", objc_msgSend(v10, "primaryAccountIsProhibitedFromCloudSync"));

    uint64_t v11 = *(dispatch_queue_t **)(a1 + 40);
    id v47 = 0;
    uint64_t v12 = -[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v11, &v47);
    id v13 = v47;
    [*(id *)(*(void *)(a1 + 40) + 48) setSyncEnabled:v12];
    if (v13)
    {
      _HKInitializeLogging();
      char v14 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v40 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v51 = v40;
        __int16 v52 = 2114;
        id v53 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to verify cloud sync enabled with error %{public}@", buf, 0x16u);
      }
    }
    id v15 = *(void **)(a1 + 40);
    id v46 = 0;
    uint64_t v16 = -[HDCloudSyncObserverTaskServer _readRestoreCompletionDateWithError:](v15, &v46);
    id v17 = v46;
    [*(id *)(*(void *)(a1 + 40) + 48) setRestoreCompletionDate:v16];

    if (v17)
    {
      _HKInitializeLogging();
      int v18 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v41 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v51 = v41;
        __int16 v52 = 2114;
        id v53 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read restore completion date with error %{public}@", buf, 0x16u);
      }
    }
    id v19 = *(id *)(a1 + 40);
    if (v19)
    {
      uint64_t v20 = [*(id *)(a1 + 40) profile];
      uint64_t v21 = HDCloudSyncKeyValueDomainWithProfile(v20);

      __int16 v22 = @"HDCloudSyncKeyErrorRequiringUserAction";
      id v49 = 0;
      uint64_t v23 = [v21 dataForKey:v22 error:&v49];
      id v24 = v49;
      v25 = v24;
      if (v23)
      {
        id v43 = v17;
        id v26 = v13;
        id v27 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v28 = objc_opt_class();
        id v48 = 0;
        id v29 = [v27 unarchivedObjectOfClass:v28 fromData:v23 error:&v48];
        id v30 = v48;
        id v31 = v30;
        if (v29 || !v30)
        {
          id v19 = v29;
          id v33 = 0;
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v32 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v51 = v19;
            __int16 v52 = 2114;
            id v53 = v31;
            _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive cloud sync error requiring user action: %{public}@", buf, 0x16u);
          }
          id v33 = v31;
          id v19 = 0;
        }

        id v13 = v26;
        id v17 = v43;
      }
      else
      {
        if (v24)
        {
          _HKInitializeLogging();
          uint64_t v34 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v51 = v19;
            __int16 v52 = 2114;
            id v53 = v25;
            _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read cloud sync error requiring user action: %{public}@", buf, 0x16u);
          }
        }
        id v33 = 0;
        id v19 = 0;
      }
    }
    else
    {
      id v33 = 0;
    }
    id v35 = v33;
    [*(id *)(*(void *)(a1 + 40) + 48) setErrorRequiringUserAction:v19];

    if (v35)
    {
      _HKInitializeLogging();
      id v36 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v51 = v42;
        __int16 v52 = 2114;
        id v53 = v35;
        _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read error requiring user action with error %{public}@", buf, 0x16u);
      }
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_344;
    v44[3] = &unk_1E62FA9E8;
    uint64_t v37 = *(void **)(a1 + 48);
    v44[4] = *(void *)(a1 + 40);
    id v45 = *(id *)(a1 + 56);
    [v37 fetchSyncStatusWithCompletion:v44];
  }
}

void __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_344(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2_345;
  v12[3] = &unk_1E62F7150;
  id v13 = v6;
  uint64_t v14 = v7;
  id v9 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

uint64_t __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2_345(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    char v2 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch sync status with error %{public}@", (uint8_t *)&v12, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) lastSuccessfulPushDate];
    [*(id *)(*(void *)(a1 + 40) + 48) setLastPushDate:v4];

    id v5 = [*(id *)(a1 + 48) lastSuccessfulPullDate];
    [*(id *)(*(void *)(a1 + 40) + 48) setLastPullDate:v5];

    id v6 = [*(id *)(a1 + 48) lastSuccessfulLitePushDate];
    [*(id *)(*(void *)(a1 + 40) + 48) setLastLitePushDate:v6];

    uint64_t v7 = [*(id *)(a1 + 40) profile];
    id v8 = HDCloudSyncLastPulledUpdateDate(v7);
    [*(id *)(*(void *)(a1 + 40) + 48) setLastPulledUpdateDate:v8];

    id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v9();
  }
}

- (void)cloudSyncManager:(id)a3 didUpdateSyncEnabled:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithSyncEnabled:]((uint64_t)self, a4);
}

- (void)cloudSyncManager:(id)a3 didUpdateLastPushDate:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPushDate___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);
}

- (void)cloudSyncManager:(id)a3 didUpdateLastLitePushDate:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastLitePushDate___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);
}

- (void)cloudSyncManager:(id)a3 didUpdateLastPullDate:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPullDate___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);
}

- (void)cloudSyncManager:(id)a3 didUpdateLastPulledUpdateDate:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPulledUpdateDate___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);
}

- (void)cloudSyncManager:(id)a3 didUpdateErrorRequiringUserAction:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithErrorRequiringUserAction:]((uint64_t)self, v6);
}

- (void)cloudSyncManager:(id)a3 didUpdateRestoreCompletionDate:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithRestoreCompleteDate___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);
}

- (void)cloudSyncManager:(id)a3 didUpdateDataUploadRequestStatus:(int64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  id v22 = a5;
  id v9 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  status = self->_status;
  if (!status)
  {
    uint64_t v11 = (HKCloudSyncObserverStatus *)objc_alloc_init(MEMORY[0x1E4F2AD40]);
    int v12 = self->_status;
    self->_status = v11;

    status = self->_status;
  }
  uint64_t v13 = [(HKCloudSyncObserverStatus *)status dataUploadRequestStatus];
  BOOL v14 = v13 != a4;
  if (v13 != a4) {
    [(HKCloudSyncObserverStatus *)self->_status setDataUploadRequestStatus:a4];
  }
  id v15 = [(HKCloudSyncObserverStatus *)self->_status dataUploadRequestStartDate];
  if (v15 == v22)
  {

    goto LABEL_12;
  }
  if (!v22)
  {

    goto LABEL_11;
  }
  uint64_t v16 = [(HKCloudSyncObserverStatus *)self->_status dataUploadRequestStartDate];
  char v17 = [v16 isEqual:v22];

  if ((v17 & 1) == 0)
  {
LABEL_11:
    [(HKCloudSyncObserverStatus *)self->_status setDataUploadRequestStartDate:v22];
    BOOL v14 = 1;
  }
LABEL_12:
  id v18 = [(HKCloudSyncObserverStatus *)self->_status dataUploadRequestCompletionDate];
  if (v18 != v9)
  {
    id v19 = v18;
    if (v9)
    {
      uint64_t v20 = [(HKCloudSyncObserverStatus *)self->_status dataUploadRequestCompletionDate];
      char v21 = [v20 isEqual:v9];

      if (v21)
      {
        if (!v14) {
          goto LABEL_22;
        }
LABEL_21:
        -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus]((uint64_t)self);
        goto LABEL_22;
      }
    }
    else
    {
    }
    [(HKCloudSyncObserverStatus *)self->_status setDataUploadRequestCompletionDate:v9];
    goto LABEL_21;
  }

  if (v14) {
    goto LABEL_21;
  }
LABEL_22:
}

- (void)remote_startObservingSyncRequestsMatchingFilter:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__HDCloudSyncObserverTaskServer_remote_startObservingSyncRequestsMatchingFilter___block_invoke;
  v4[3] = &unk_1E62F3198;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(queue, v4);
}

unsigned char *__81__HDCloudSyncObserverTaskServer_remote_startObservingSyncRequestsMatchingFilter___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 40);
  result = *(unsigned char **)(a1 + 32);
  if (!result[80])
  {
    int v3 = [result profile];
    id v4 = [v3 daemon];
    id v5 = [v4 cloudSyncCoordinator];
    [v5 addObserver:*(void *)(a1 + 32)];

    result = *(unsigned char **)(a1 + 32);
  }
  result[80] = 1;
  return result;
}

- (void)remote_stopObservingSyncRequests
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDCloudSyncObserverTaskServer_remote_stopObservingSyncRequests__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_sync(queue, block);
}

unsigned char *__65__HDCloudSyncObserverTaskServer_remote_stopObservingSyncRequests__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[80])
  {
    int v3 = [result profile];
    id v4 = [v3 daemon];
    id v5 = [v4 cloudSyncCoordinator];
    [v5 removeObserver:*(void *)(a1 + 32)];

    result = *(unsigned char **)(a1 + 32);
  }
  result[80] = 0;
  return result;
}

- (id)remote_retrieveProgressForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__HDCloudSyncObserverTaskServer_remote_retrieveProgressForIdentifier_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);

  return 0;
}

void __81__HDCloudSyncObserverTaskServer_remote_retrieveProgressForIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  if (v2)
  {
    id v4 = *(NSObject **)(v2 + 40);
    id v5 = v1;
    dispatch_assert_queue_V2(v4);
    id v6 = [*(id *)(v2 + 88) objectForKeyedSubscript:v5];

    if (v6)
    {
      [v6 setInvalidationBlock:v3];
      [v6 progress];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
}

- (uint64_t)_shouldNotifyObserverAboutRequest:(uint64_t)a1
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  if (*(unsigned char *)(a1 + 80)) {
    uint64_t v4 = [v3 matchesFilter:*(void *)(a1 + 72)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void __69__HDCloudSyncObserverTaskServer__queue_syncRequestDidStart_progress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client syncRequestDidStart: with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __77__HDCloudSyncObserverTaskServer__queue_syncRequestDidComplete_success_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client syncRequestDidComplete:success:error: with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)cloudSyncCoordinator:(id)a3 syncStartedForRequest:(id)a4 progress:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncStartedForRequest_progress___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __85__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncStartedForRequest_progress___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    if (-[HDCloudSyncObserverTaskServer _shouldNotifyObserverAboutRequest:](v1, v3))
    {
      uint64_t v5 = [[HDCloudSyncObserverTaskServerStoredProgress alloc] initWithProgress:v4];
      int v6 = *(void **)(v1 + 88);
      id v7 = [v3 identifier];
      [v6 setObject:v5 forKeyedSubscript:v7];

      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)MEMORY[0x1E4F1C9C8];
        id v10 = v8;
        id v11 = [v9 date];
        int v12 = HKDiagnosticStringFromDate();
        *(_DWORD *)id v14 = 138543618;
        *(void *)&v14[4] = v1;
        *(_WORD *)&v14[12] = 2114;
        *(void *)&v14[14] = v12;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client syncRequestDidStart: with date: (%{public}@", v14, 0x16u);
      }
      *(void *)id v14 = MEMORY[0x1E4F143A8];
      *(void *)&v14[8] = 3221225472;
      *(void *)&v14[16] = __69__HDCloudSyncObserverTaskServer__queue_syncRequestDidStart_progress___block_invoke;
      id v15 = &unk_1E62F3170;
      uint64_t v16 = v1;
      id v13 = [(id)v1 remoteObjectProxyWithErrorHandler:v14];
      objc_msgSend(v13, "clientRemote_syncRequestDidStart:", v3);
    }
  }
}

- (void)cloudSyncCoordinator:(id)a3 syncRequestDidCompleteForRequest:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncRequestDidCompleteForRequest_success_error___block_invoke;
  v14[3] = &unk_1E62F7780;
  v14[4] = self;
  id v15 = v9;
  BOOL v17 = a5;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

void __101__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncRequestDidCompleteForRequest_success_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    int v6 = *(void **)(v1 + 88);
    id v7 = [v4 identifier];
    id v8 = [v6 objectForKeyedSubscript:v7];

    id v9 = *(void **)(v1 + 88);
    id v10 = [v4 identifier];
    [v9 setObject:0 forKeyedSubscript:v10];

    [v8 invalidate];
    if (-[HDCloudSyncObserverTaskServer _shouldNotifyObserverAboutRequest:](v1, v4))
    {
      _HKInitializeLogging();
      id v11 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)MEMORY[0x1E4F1C9C8];
        id v13 = v11;
        id v14 = [v12 date];
        id v15 = HKDiagnosticStringFromDate();
        *(_DWORD *)BOOL v17 = 138543618;
        *(void *)&v17[4] = v1;
        *(_WORD *)&v17[12] = 2114;
        *(void *)&v17[14] = v15;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client syncRequestDidComplete:success:error: with date: (%{public}@", v17, 0x16u);
      }
      *(void *)BOOL v17 = MEMORY[0x1E4F143A8];
      *(void *)&v17[8] = 3221225472;
      *(void *)&v17[16] = __77__HDCloudSyncObserverTaskServer__queue_syncRequestDidComplete_success_error___block_invoke;
      id v18 = &unk_1E62F3170;
      uint64_t v19 = v1;
      id v16 = [(id)v1 remoteObjectProxyWithErrorHandler:v17];
      objc_msgSend(v16, "clientRemote_syncRequestDidComplete:success:error:", v4, v2 != 0, v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_waitForSyncObservations, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end