@interface HDMirroredWorkoutSessionServer
- (BOOL)_queue_clientApplicationCanStartWorkoutSessionWithError:(id *)a3;
- (BOOL)beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 error:(id *)a6;
- (BOOL)endCurrentActivityOnDate:(id)a3 error:(id *)a4;
- (BOOL)setTargetState:(int64_t)a3 date:(id)a4 error:(id *)a5;
- (BOOL)shouldStopPreviousSession;
- (HDMirroredWorkoutSessionServer)initWithProfile:(id)a3 configuration:(id)a4 sessionUUID:(id)a5 globalState:(id)a6 clientBundleIdentifier:(id)a7;
- (int64_t)sessionType;
- (int64_t)state;
- (void)_didInvalidateLiveActivityBackgroundAssertion:(id)a3 error:(id)a4;
- (void)_didUpdateLiveActivity:(id)a3;
- (void)_enqueueClientUpdate:(id)a3 launchClient:(BOOL)a4 waitForClientSetup:(BOOL)a5;
- (void)_executeClientDataUpdate:(id)a3 completion:(id)a4;
- (void)_executeClientUpdate:(id)a3;
- (void)_flushPendingData;
- (void)_flushPendingDataRequests;
- (void)_launchClientInTheBackground;
- (void)_liveActivityBackgroundAssertionDidTimeout;
- (void)_schedulePeriodicRuntime;
- (void)_setLiveActivityBackgroundAssertionTimeout;
- (void)_setupLiveActivityObserver;
- (void)_setupProcessStateManagerObserver;
- (void)_takeLiveActivityBackgroundAssertion;
- (void)dealloc;
- (void)didDisconnectFromRemoteWithError:(id)a3;
- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)processDidEnterBackground:(id)a3;
- (void)processDidEnterForeground:(id)a3;
- (void)receivedBackgroundRuntimeRequestWithCompletion:(id)a3;
- (void)setTaskServer:(id)a3;
- (void)syncCurrentActivity:(id)a3 completion:(id)a4;
- (void)syncSessionEvent:(int64_t)a3 date:(id)a4;
- (void)syncTransitionToState:(int64_t)a3 date:(id)a4 completion:(id)a5;
- (void)syncWorkoutEvents:(id)a3 completion:(id)a4;
@end

@implementation HDMirroredWorkoutSessionServer

- (HDMirroredWorkoutSessionServer)initWithProfile:(id)a3 configuration:(id)a4 sessionUUID:(id)a5 globalState:(id)a6 clientBundleIdentifier:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HDMirroredWorkoutSessionServer;
  v14 = [(HDWorkoutSessionServer *)&v27 initWithProfile:a3 configuration:a4 sessionUUID:a5];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->super._clientProcessBundleIdentifier, a7);
    v15->super._isMirroring = 1;
    v15->_sessionState = [v12 sessionState];
    if ([v12 hasStartDate])
    {
      [v12 startDate];
      startDate = HDDecodeDateForValue();
      objc_storeStrong((id *)&v15->super._startDate, startDate);
    }
    else
    {
      startDate = v15->super._startDate;
      v15->super._startDate = 0;
    }

    if ([v12 hasEndDate])
    {
      [v12 endDate];
      stopDate = HDDecodeDateForValue();
      objc_storeStrong((id *)&v15->super._stopDate, stopDate);
    }
    else
    {
      stopDate = v15->super._stopDate;
      v15->super._stopDate = 0;
    }

    v18 = (void *)MEMORY[0x1E4F2B720];
    v19 = [v12 currentActivity];
    uint64_t v20 = [v18 createWithCodable:v19];
    currentActivity = v15->super._currentActivity;
    v15->super._currentActivity = (HKWorkoutActivity *)v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingClientUpdates = v15->_pendingClientUpdates;
    v15->_pendingClientUpdates = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingData = v15->_pendingData;
    v15->_pendingData = v24;

    [(HDMirroredWorkoutSessionServer *)v15 _setupLiveActivityObserver];
    [(HDMirroredWorkoutSessionServer *)v15 _takeLiveActivityBackgroundAssertion];
    [(HDMirroredWorkoutSessionServer *)v15 _launchClientInTheBackground];
    [(HDMirroredWorkoutSessionServer *)v15 _setupProcessStateManagerObserver];
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(BSInvalidatable *)self->_liveActivitySubscription invalidate];
  liveActivitySubscription = self->_liveActivitySubscription;
  self->_liveActivitySubscription = 0;

  if (self->_liveActivityAssertion)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will invalidate Live Activity background assertion after server dealloc.", buf, 0xCu);
    }
    [(SNAAssertion *)self->_liveActivityAssertion invalidate];
    liveActivityAssertion = self->_liveActivityAssertion;
    self->_liveActivityAssertion = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._profile);
  v7 = [WeakRetained daemon];
  v8 = [v7 processStateManager];
  [v8 unregisterObserver:self forBundleIdentifier:self->super._clientProcessBundleIdentifier];

  os_unfair_lock_lock(&self->_lock);
  periodicRuntimeSource = self->_periodicRuntimeSource;
  if (periodicRuntimeSource)
  {
    dispatch_source_cancel(periodicRuntimeSource);
    v10 = self->_periodicRuntimeSource;
    self->_periodicRuntimeSource = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  v11.receiver = self;
  v11.super_class = (Class)HDMirroredWorkoutSessionServer;
  [(HDWorkoutSessionServer *)&v11 dealloc];
}

- (void)_setupProcessStateManagerObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._profile);
  v3 = [WeakRetained daemon];
  v4 = [v3 processStateManager];
  [v4 registerObserver:self forBundleIdentifier:self->super._clientProcessBundleIdentifier];
}

- (void)_executeClientDataUpdate:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)HDMirroredWorkoutSessionServer;
    [(HDWorkoutSessionServer *)&v9 didReceiveDataFromRemoteWorkoutSession:v6 completion:v7];
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v11 = self;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "[mirroring] %{public}@: No pending data to deliver", buf, 0xCu);
    }
  }
}

- (void)didDisconnectFromRemoteWithError:(id)a3
{
  id v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  [*(id *)(a1 + 32) _launchClientInTheBackground];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2;
  v3[3] = &unk_1E6300910;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _enqueueClientUpdate:v3 launchClient:0 waitForClientSetup:1];
}

void __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)a2[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_3;
  v7[3] = &unk_1E6300A20;
  id v8 = *(id *)(a1 + 32);
  id v4 = a2;
  [v3 sendToDestinationProcessors:v7];
  id WeakRetained = objc_loadWeakRetained(v4 + 1);
  id v6 = [WeakRetained workoutManager];
  [v6 tearDownMirroredWorkoutSession:v4];
}

uint64_t __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 didDisconnectFromRemoteWithError:*(void *)(a1 + 32)];
}

- (void)syncTransitionToState:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke;
  block[3] = &unk_1E62F4978;
  id v13 = v8;
  int64_t v14 = a3;
  block[4] = self;
  id v10 = v8;
  objc_super v11 = (void (**)(id, uint64_t, void))a5;
  dispatch_async(queue, block);
  v11[2](v11, 1, 0);
}

void __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *(void *)(a1[4] + 288) = a1[6];
  uint64_t v2 = HKWorkoutSessionStateFromServerState();
  uint64_t v3 = HKWorkoutSessionStateFromServerState();
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29FB8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      id v6 = (void *)a1[4];
      id v7 = v4;
      id v8 = _HKWorkoutSessionServerStateToString();
      objc_super v9 = _HKWorkoutSessionServerStateToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Synced state: %@ is equivalent to current state: %@, not notifying the client", buf, 0x20u);
    }
  }
  else
  {
    if (v5)
    {
      id v10 = v4;
      objc_super v11 = objc_opt_class();
      id v12 = v11;
      id v13 = _HKWorkoutSessionServerStateToString();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client of synced transition to new state: %@", buf, 0x16u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_285;
    v16[3] = &unk_1E6300938;
    v15 = (void *)a1[4];
    int64_t v14 = (void *)a1[5];
    uint64_t v18 = a1[6];
    id v17 = v14;
    [v15 _enqueueClientUpdate:v16 launchClient:1 waitForClientSetup:1];
  }
}

void __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_285(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_2;
  v4[3] = &unk_1E6300A48;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = v3;
  [v2 sendToDestinationProcessors:v4];
}

void __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 didSyncTransitionToNewState:HKWorkoutSessionStateFromServerState() date:*(void *)(a1 + 32)];
}

- (void)syncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke;
  block[3] = &unk_1E62F4978;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void *__56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 64))
  {
    uint64_t v2 = *(void **)(v1 + 72);
    uint64_t v4 = result[5];
    uint64_t v3 = result[6];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke_2;
    v5[3] = &unk_1E62F2978;
    v5[4] = v1;
    return (void *)[v2 sendStateEvent:v3 date:v4 completion:v5];
  }
  return result;
}

void __56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send state event to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)syncCurrentActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke;
  v10[3] = &unk_1E62F31C0;
  id v11 = v6;
  uint64_t v12 = self;
  id v8 = v6;
  uint64_t v9 = (void (**)(id, uint64_t, void))a4;
  dispatch_async(queue, v10);
  v9[2](v9, 1, 0);
}

void __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 endDate];

    uint64_t v4 = *(void **)(a1 + 32);
    if (!v3)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), v4);
      _HKInitializeLogging();
      id v5 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v5;
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v30 = v7;
        __int16 v31 = 2114;
        uint64_t v32 = v8;
        id v9 = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Remote session beginning new activity: %{public}@", buf, 0x16u);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_287;
      v27[3] = &unk_1E6300960;
      __int16 v10 = (id *)v28;
      id v11 = *(void **)(a1 + 40);
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      v28[0] = v12;
      v28[1] = v13;
      [v11 _enqueueClientUpdate:v27 launchClient:1 waitForClientSetup:1];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  int64_t v14 = [v4 endDate];

  if (!v14) {
    return;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    id v17 = objc_opt_class();
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 56);
    *(_DWORD *)buf = 138543618;
    v30 = v17;
    __int16 v31 = 2114;
    uint64_t v32 = v18;
    id v19 = v17;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Remote session ending current activity: %{public}@", buf, 0x16u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_288;
  v25[3] = &unk_1E6300960;
  __int16 v10 = (id *)v26;
  uint64_t v20 = *(void **)(a1 + 40);
  id v21 = *(id *)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 40);
  v26[0] = v21;
  v26[1] = v22;
  [v20 _enqueueClientUpdate:v25 launchClient:1 waitForClientSetup:1];
  uint64_t v23 = *(void *)(a1 + 40);
  v24 = *(void **)(v23 + 56);
  *(void *)(v23 + 56) = 0;

LABEL_11:
}

void __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_287(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2;
  v6[3] = &unk_1E62F3148;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 sendToDestinationProcessors:v6];
}

uint64_t __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didBeginActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_288(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2_289;
  v6[3] = &unk_1E62F3148;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 sendToDestinationProcessors:v6];
}

uint64_t __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2_289(uint64_t a1, void *a2)
{
  return [a2 didEndActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)syncWorkoutEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke;
  v10[3] = &unk_1E62F31C0;
  id v11 = v6;
  id v12 = self;
  id v8 = v6;
  id v9 = (void (**)(id, uint64_t, void))a4;
  dispatch_async(queue, v10);
  v9[2](v9, 1, 0);
}

void __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_104);
  uint64_t v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_3;
  v5[3] = &unk_1E6300910;
  id v6 = v2;
  id v4 = v2;
  [v3 _enqueueClientUpdate:v5 launchClient:1 waitForClientSetup:1];
}

id __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F2B990];
  id v3 = a2;
  uint64_t v4 = [v2 internalEventTypeWithPublicEvent:v3];
  id v5 = objc_alloc(MEMORY[0x1E4F2B990]);
  id v6 = [v3 sessionUUID];
  id v7 = [v3 dateInterval];
  id v8 = [v3 metadata];

  id v9 = (void *)[v5 initWithEventType:v4 sessionId:v6 dateInterval:v7 metadata:v8];

  return v9;
}

void __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)v3[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_4;
  v6[3] = &unk_1E62F3148;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 sendToDestinationProcessors:v6];
}

uint64_t __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 addWorkoutEvents:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)receivedBackgroundRuntimeRequestWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  [(HDMirroredWorkoutSessionServer *)self _launchClientInTheBackground];
  v4[2](v4, 1, 0);
}

- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HDMirroredWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  v10[3] = &unk_1E63009A8;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HDMirroredWorkoutSessionServer *)self _enqueueClientUpdate:v10 launchClient:0 waitForClientSetup:1];
  [(HDMirroredWorkoutSessionServer *)self _schedulePeriodicRuntime];
}

void __84__HDMirroredWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v4 = [WeakRetained daemon];
  id v5 = [v4 processStateManager];

  LOBYTE(WeakRetained) = [v5 isApplicationStateForegroundForBundleIdentifier:*(void *)(a1[4] + 24)];
  int v6 = [v5 isApplicationStateBackgroundRunningForBundleIdentifier:*(void *)(a1[4] + 24)];
  if ((WeakRetained & 1) != 0 || v6)
  {
    [v7 _executeClientDataUpdate:a1[5] completion:a1[6]];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 280));
    [*(id *)(a1[4] + 352) addObjectsFromArray:a1[5]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 280));
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)_executeClientUpdate:(id)a3
{
  uint64_t v4 = (void (**)(id, HDMirroredWorkoutSessionServer *))a3;
  id v5 = objc_initWeak(&location, self);
  v4[2](v4, self);

  objc_destroyWeak(&location);
}

- (void)_enqueueClientUpdate:(id)a3 launchClient:(BOOL)a4 waitForClientSetup:(BOOL)a5
{
  BOOL v6 = a4;
  id aBlock = a3;
  if (self->_hasActiveLiveActivity && v6) {
    [(HDMirroredWorkoutSessionServer *)self _launchClientInTheBackground];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (([(HDWorkoutSessionServer *)self clientDidSetupSession] || a5)
    && ([(NSMutableArray *)self->_pendingClientUpdates count]
     || ([(HDWorkoutSessionServer *)self taskServer],
         __int16 v10 = objc_claimAutoreleasedReturnValue(),
         v10,
         !v10)))
  {
    pendingClientUpdates = self->_pendingClientUpdates;
    id v12 = _Block_copy(aBlock);
    [(NSMutableArray *)pendingClientUpdates addObject:v12];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    [(HDMirroredWorkoutSessionServer *)self _executeClientUpdate:aBlock];
  }
}

- (void)_schedulePeriodicRuntime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_periodicRuntimeSource)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v4 = dispatch_get_global_queue(0, 0);
    id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    periodicRuntimeSource = self->_periodicRuntimeSource;
    self->_periodicRuntimeSource = v5;

    id v7 = self->_periodicRuntimeSource;
    dispatch_time_t v8 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    id v9 = self->_periodicRuntimeSource;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__HDMirroredWorkoutSessionServer__schedulePeriodicRuntime__block_invoke;
    v10[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_periodicRuntimeSource);
    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __58__HDMirroredWorkoutSessionServer__schedulePeriodicRuntime__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _flushPendingDataRequests];
}

- (void)_flushPendingDataRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  periodicRuntimeSource = self->_periodicRuntimeSource;
  self->_periodicRuntimeSource = 0;

  os_unfair_lock_unlock(p_lock);

  [(HDMirroredWorkoutSessionServer *)self _launchClientInTheBackground];
}

- (void)_flushPendingData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_pendingData copy];
  [(NSMutableArray *)self->_pendingData removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HDMirroredWorkoutSessionServer__flushPendingData__block_invoke;
  v6[3] = &unk_1E62F5D48;
  id v7 = v4;
  dispatch_time_t v8 = self;
  id v5 = v4;
  [(HDMirroredWorkoutSessionServer *)self _executeClientDataUpdate:v5 completion:v6];
}

void __51__HDMirroredWorkoutSessionServer__flushPendingData__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 280));
    [*(id *)(*(void *)(a1 + 40) + 352) insertObjects:*(void *)(a1 + 32) atIndexes:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 280));
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(v8 + 24);
      int v10 = 138543874;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send pending data to client: %{public}@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (int64_t)sessionType
{
  return 1;
}

- (int64_t)state
{
  return self->_sessionState;
}

- (BOOL)shouldStopPreviousSession
{
  return 1;
}

- (void)setTaskServer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HDMirroredWorkoutSessionServer;
  -[HDWorkoutSessionServer setTaskServer:](&v15, sel_setTaskServer_);
  if (a3)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = (void *)[(NSMutableArray *)self->_pendingClientUpdates copy];
    [(NSMutableArray *)self->_pendingClientUpdates removeAllObjects];
    os_unfair_lock_unlock(&self->_lock);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[HDMirroredWorkoutSessionServer _executeClientUpdate:](self, "_executeClientUpdate:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)_queue_clientApplicationCanStartWorkoutSessionWithError:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Mirrored workout sessions always allowed to start", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (void)processDidEnterBackground:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    clientProcessBundleIdentifier = self->super._clientProcessBundleIdentifier;
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2114;
    uint64_t v9 = clientProcessBundleIdentifier;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "[mirroring] %{public}@: Send pending data to background client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(HDMirroredWorkoutSessionServer *)self _flushPendingData];
}

- (void)processDidEnterForeground:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    clientProcessBundleIdentifier = self->super._clientProcessBundleIdentifier;
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2114;
    uint64_t v9 = clientProcessBundleIdentifier;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "[mirroring] %{public}@: Send pending data to foreground client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(HDMirroredWorkoutSessionServer *)self _flushPendingData];
}

- (BOOL)setTargetState:(int64_t)a3 date:(id)a4 error:(id *)a5
{
  id v7 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke;
  block[3] = &unk_1E62F4978;
  id v12 = v7;
  int64_t v13 = a3;
  block[4] = self;
  id v9 = v7;
  dispatch_async(queue, block);

  return 1;
}

void __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = HKWorkoutSessionServerStateFromSessionState();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 288);
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = v4;
      __int16 v8 = _HKWorkoutSessionServerStateToString();
      id v9 = _HKWorkoutSessionServerStateToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Target state: %{public}@ is same as current state: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending mirrored session state update", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int64_t v13 = *(void **)(v12 + 72);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke_295;
    v14[3] = &unk_1E62F2978;
    v14[4] = v12;
    [v13 sendStateUpdate:v2 date:v11 completion:v14];
  }
}

void __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke_295(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send session updates to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B720]) initWithWorkoutConfiguration:v9 startDate:v10 endDate:0 metadata:v11];
  syncController = self->super._syncController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__HDMirroredWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke;
  v15[3] = &unk_1E62F2978;
  v15[4] = self;
  [(HDWorkoutSessionRapportSyncController *)syncController sendCurrentActivityUpdate:v12 completion:v15];

  return 1;
}

void __88__HDMirroredWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send new activity request to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)endCurrentActivityOnDate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

void __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(*(void *)(a1 + 32) + 56);
  [v3 _setEndDate:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_2;
  v6[3] = &unk_1E62F2978;
  void v6[4] = v4;
  [v5 sendCurrentActivityUpdate:v3 completion:v6];
}

void __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send end current activity request to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_setupLiveActivityObserver
{
  id v3 = (ACActivityCenter *)objc_alloc_init(MEMORY[0x1E4F18130]);
  liveActivityCenter = self->_liveActivityCenter;
  self->_liveActivityCenter = v3;

  objc_initWeak(&location, self);
  id v5 = self->_liveActivityCenter;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HDMirroredWorkoutSessionServer__setupLiveActivityObserver__block_invoke;
  v8[3] = &unk_1E63009D0;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = [(ACActivityCenter *)v5 observeContentUpdatesWithHandler:v8];
  liveActivitySubscription = self->_liveActivitySubscription;
  self->_liveActivitySubscription = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__HDMirroredWorkoutSessionServer__setupLiveActivityObserver__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didUpdateLiveActivity:v3];
}

- (void)_didUpdateLiveActivity:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 descriptor];
  uint64_t v6 = [v5 platterTargetBundleIdentifier];

  _HKInitializeLogging();
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F29FB8];
  int v8 = (id)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 identifier];
    uint64_t v10 = [v4 state];
    if ((unint64_t)(v10 - 1) > 2) {
      id v11 = @"active";
    }
    else {
      id v11 = off_1E6300A68[v10 - 1];
    }
    int v14 = 138544130;
    objc_super v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    __int16 v18 = 2114;
    __int16 v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Received Live Activity update %{public}@, state: %{public}@, bundle identifier: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  if ([v6 isEqualToString:self->super._clientProcessBundleIdentifier])
  {
    self->_hasActiveLiveActivity = [v4 state] == 0;
    _HKInitializeLogging();
    uint64_t v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hasActiveLiveActivity) {
        int64_t v13 = @"YES";
      }
      else {
        int64_t v13 = @"NO";
      }
      int v14 = 138543362;
      objc_super v15 = (HDMirroredWorkoutSessionServer *)v13;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[mirroring] Did update Live Activity State. Active: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_takeLiveActivityBackgroundAssertion
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F9A7C0]) initWithBundleIdentifier:self->super._clientProcessBundleIdentifier];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F9A7B8]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __70__HDMirroredWorkoutSessionServer__takeLiveActivityBackgroundAssertion__block_invoke;
  uint64_t v10 = &unk_1E63009F8;
  objc_copyWeak(&v11, &location);
  id v5 = (SNAAssertion *)[v4 initWithExplanation:@"Apple Watch workout mirrored to companion iPhone" target:v3 invalidationHandler:&v7];
  liveActivityAssertion = self->_liveActivityAssertion;
  self->_liveActivityAssertion = v5;

  [(HDMirroredWorkoutSessionServer *)self _setLiveActivityBackgroundAssertionTimeout];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__HDMirroredWorkoutSessionServer__takeLiveActivityBackgroundAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _didInvalidateLiveActivityBackgroundAssertion:v6 error:v5];
}

- (void)_didInvalidateLiveActivityBackgroundAssertion:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = NSString;
  id v8 = a3;
  id v9 = objc_msgSend(v8, "hd_description");
  uint64_t v10 = [v7 stringWithFormat:@"[mirroring] %@: Invalidated Live Activity assertion %@.", self, v9];

  uint64_t v11 = [v8 invalidationReason];
  _HKInitializeLogging();
  uint64_t v12 = *MEMORY[0x1E4F29FB8];
  int64_t v13 = *MEMORY[0x1E4F29FB8];
  if (v11 == 3)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v15 = v10;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    objc_super v15 = v10;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@ with error: %{public}@.", buf, 0x16u);
  }
}

- (void)_setLiveActivityBackgroundAssertionTimeout
{
  id v3 = dispatch_get_global_queue(21, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  liveActivityAssertionTimeoutSource = self->_liveActivityAssertionTimeoutSource;
  self->_liveActivityAssertionTimeoutSource = v4;

  id v6 = self->_liveActivityAssertionTimeoutSource;
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  id v8 = self->_liveActivityAssertionTimeoutSource;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HDMirroredWorkoutSessionServer__setLiveActivityBackgroundAssertionTimeout__block_invoke;
  v9[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_liveActivityAssertionTimeoutSource);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __76__HDMirroredWorkoutSessionServer__setLiveActivityBackgroundAssertionTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _liveActivityBackgroundAssertionDidTimeout];
}

- (void)_liveActivityBackgroundAssertionDidTimeout
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will invalidate Live Activity background assertion after timeout.", (uint8_t *)&v5, 0xCu);
  }
  [(SNAAssertion *)self->_liveActivityAssertion invalidate];
  liveActivityAssertion = self->_liveActivityAssertion;
  self->_liveActivityAssertion = 0;
}

- (void)_launchClientInTheBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._profile);
  id v3 = [WeakRetained workoutManager];
  id v4 = [v3 mirroringManager];
  [v4 launchClientWithBundleIdentifier:self->super._clientProcessBundleIdentifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_pendingClientUpdates, 0);
  objc_storeStrong((id *)&self->_liveActivityAssertionTimeoutSource, 0);
  objc_storeStrong((id *)&self->_liveActivitySubscription, 0);
  objc_storeStrong((id *)&self->_liveActivityAssertion, 0);
  objc_storeStrong((id *)&self->_liveActivityCenter, 0);

  objc_storeStrong((id *)&self->_periodicRuntimeSource, 0);
}

@end