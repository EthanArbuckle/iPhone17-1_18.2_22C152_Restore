@interface HDWorkoutSessionRapportSyncController
+ (id)_decodedTransactionWithData:(id)a3 error:(id *)a4;
- (BOOL)_isDataRateLimiterDisabledByUserDefaults;
- (HDWorkoutSessionRapportSyncController)initWithRapportMessenger:(id)a3 sessionServer:(id)a4;
- (double)heartbeatInterval;
- (double)heartbeatReceiveTimeout;
- (id)sessionConfiguration;
- (id)sessionGlobalState;
- (void)_cancelReceiveHeartbeatTimeout;
- (void)_cancelSendHeartbeat;
- (void)_cancelSendHeartbeatTimeout;
- (void)_enqueueTransaction:(id)a3 requestName:(id)a4;
- (void)_lock_cancelReceiveHeartbeatTimeout;
- (void)_lock_cancelSendHeartbeat;
- (void)_lock_cancelSendHeartbeatTimeout;
- (void)_receiveHeartbeatDidTimeout;
- (void)_resetHeartbeat;
- (void)_scheduleHeartbeat;
- (void)_scheduleReceiveHeartbeatTimeout;
- (void)_scheduleSendHeartbeatTimeout;
- (void)_sendHeartbeat;
- (void)_sendPendingTransactions;
- (void)rapportMessenger:(id)a3 didReceiveRequest:(id)a4 data:(id)a5 responseHandler:(id)a6;
- (void)receivedBackgroundRuntimeRequestWithCompletion:(id)a3;
- (void)receivedCurrentActivityUpdate:(id)a3 completion:(id)a4;
- (void)receivedDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)receivedEventUpdate:(id)a3 completion:(id)a4;
- (void)receivedHeartbeatWithCompletion:(id)a3;
- (void)receivedMirroringStopRequestWithCompletion:(id)a3;
- (void)receivedRecoveryRequestWithResponseHandler:(id)a3;
- (void)receivedStateEvent:(id)a3 completion:(id)a4;
- (void)receivedStateUpdate:(id)a3 completion:(id)a4;
- (void)sendBackgroundRuntimeRequestWithCompletion:(id)a3;
- (void)sendCurrentActivityUpdate:(id)a3 completion:(id)a4;
- (void)sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)sendEventUpdate:(id)a3 completion:(id)a4;
- (void)sendMirroringStartRequestWithCompletion:(id)a3;
- (void)sendMirroringStopRequestWithCompletion:(id)a3;
- (void)sendRequest:(id)a3 transaction:(id)a4 completion:(id)a5;
- (void)sendRequest:(id)a3 transaction:(id)a4 responseHandler:(id)a5;
- (void)sendStateEvent:(int64_t)a3 date:(id)a4 completion:(id)a5;
- (void)sendStateUpdate:(int64_t)a3 date:(id)a4 completion:(id)a5;
@end

@implementation HDWorkoutSessionRapportSyncController

- (HDWorkoutSessionRapportSyncController)initWithRapportMessenger:(id)a3 sessionServer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDWorkoutSessionRapportSyncController;
  v9 = [(HDWorkoutSessionRapportSyncController *)&v20 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_rapportMessenger, a3);
    objc_storeWeak((id *)&v10->_sessionServer, v8);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F2B3F8]) initWithLimit:102400 timeInterval:10.0];
    dataRateLimiter = v10->_dataRateLimiter;
    v10->_dataRateLimiter = (HKRateLimiter *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_pendingTransactionsByRequest = v10->_lock_pendingTransactionsByRequest;
    v10->_lock_pendingTransactionsByRequest = v13;

    if ([v8 sessionType] == 1) {
      [(HDWorkoutSessionRapportSyncController *)v10 _scheduleReceiveHeartbeatTimeout];
    }
    if (![v8 sessionType] && objc_msgSend(v8, "isMirroring"))
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        v17 = v15;
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        id v19 = v18;
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session was previously mirroring, resume heartbeats", buf, 0xCu);
      }
      [(HDWorkoutSessionRapportSyncController *)v10 _scheduleHeartbeat];
    }
  }

  return v10;
}

- (void)sendMirroringStartRequestWithCompletion:(id)a3
{
  id v4 = a3;
  [(HDWorkoutSessionRapportSyncController *)self _scheduleHeartbeat];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__HDWorkoutSessionRapportSyncController_sendMirroringStartRequestWithCompletion___block_invoke;
  v5[3] = &unk_1E62FEB00;
  v5[4] = self;
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"startMirroring" transaction:v5 completion:v4];
}

void __81__HDWorkoutSessionRapportSyncController_sendMirroringStartRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 sessionConfiguration];
  [v4 setConfiguration:v5];

  id v6 = [*(id *)(a1 + 32) sessionGlobalState];
  [v4 setGlobalState:v6];
}

- (id)sessionConfiguration
{
  v3 = objc_alloc_init(HDCodableWorkoutSessionConfiguration);
  self = (HDWorkoutSessionRapportSyncController *)((char *)self + 16);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  v5 = [WeakRetained workoutConfiguration];
  id v6 = [v5 codableRepresentationForSync];
  [(HDCodableWorkoutSessionConfiguration *)v3 setWorkoutConfiguration:v6];

  id v7 = objc_loadWeakRetained((id *)&self->super.isa);
  id v8 = [v7 taskServer];
  v9 = [v8 client];
  v10 = [v9 sourceBundleIdentifier];

  if ([v10 isEqualToString:*MEMORY[0x1E4F2BEC8]])
  {
    id v11 = (id)*MEMORY[0x1E4F2BD50];

    v10 = v11;
  }
  [(HDCodableWorkoutSessionConfiguration *)v3 setSourceBundleIdentifier:v10];

  return v3;
}

- (id)sessionGlobalState
{
  v3 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  p_sessionServer = &self->_sessionServer;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  -[HDCodableWorkoutSessionGlobalState setSessionState:](v3, "setSessionState:", [WeakRetained state]);

  id v6 = objc_loadWeakRetained((id *)p_sessionServer);
  id v7 = [v6 startDate];

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_sessionServer);
    v9 = [v8 startDate];
    [v9 timeIntervalSinceReferenceDate];
    -[HDCodableWorkoutSessionGlobalState setStartDate:](v3, "setStartDate:");
  }
  id v10 = objc_loadWeakRetained((id *)p_sessionServer);
  id v11 = [v10 stopDate];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_sessionServer);
    v13 = [v12 stopDate];
    [v13 timeIntervalSinceReferenceDate];
    -[HDCodableWorkoutSessionGlobalState setEndDate:](v3, "setEndDate:");
  }
  id v14 = objc_loadWeakRetained((id *)p_sessionServer);
  v15 = [v14 currentActivity];
  v16 = [v15 codableRepresentationForSync];
  [(HDCodableWorkoutSessionGlobalState *)v3 setCurrentActivity:v16];

  id v17 = objc_loadWeakRetained((id *)p_sessionServer);
  v18 = [v17 workoutDataAccumulator];
  id v19 = [v18 currentEvents];
  objc_super v20 = objc_msgSend(v19, "hk_map:", &__block_literal_global_86);
  v21 = (void *)[v20 mutableCopy];
  [(HDCodableWorkoutSessionGlobalState *)v3 setEvents:v21];

  return v3;
}

uint64_t __59__HDWorkoutSessionRapportSyncController_sessionGlobalState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 codableRepresentationForSync];
}

- (void)sendMirroringStopRequestWithCompletion:(id)a3
{
  id v4 = a3;
  [(HDWorkoutSessionRapportSyncController *)self _cancelSendHeartbeat];
  [(HDWorkoutSessionRapportSyncController *)self _cancelSendHeartbeatTimeout];
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"stopMirroring" transaction:0 completion:v4];
}

- (void)receivedMirroringStopRequestWithCompletion:(id)a3
{
  v5 = (void (**)(id, uint64_t, void))a3;
  [(HDWorkoutSessionRapportSyncController *)self _cancelReceiveHeartbeatTimeout];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  [WeakRetained didDisconnectFromRemoteWithError:0];

  v5[2](v5, 1, 0);
}

- (void)receivedRecoveryRequestWithResponseHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_sessionServer = &self->_sessionServer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  if (([WeakRetained isMirroring] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = [v7 isCompanionCapable];

  if (v8)
  {
LABEL_7:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = objc_loadWeakRetained((id *)&self->_sessionServer);
    int v24 = 138543618;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@ Active mirroring session. Replying to recover request with workout %{public}@", (uint8_t *)&v24, 0x16u);
  }
  id v12 = objc_alloc_init(HDCodableWorkoutSessionSyncTransaction);
  id v13 = objc_loadWeakRetained((id *)p_sessionServer);
  id v14 = [v13 identifier];
  v15 = objc_msgSend(v14, "hk_dataForUUIDBytes");
  [(HDCodableWorkoutSessionSyncTransaction *)v12 setSessionUUID:v15];

  id v16 = objc_loadWeakRetained((id *)p_sessionServer);
  id v17 = [v16 syncController];
  v18 = [v17 sessionConfiguration];
  [(HDCodableWorkoutSessionSyncTransaction *)v12 setConfiguration:v18];

  id v19 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_super v20 = [v19 syncController];
  v21 = [v20 sessionGlobalState];
  [(HDCodableWorkoutSessionSyncTransaction *)v12 setGlobalState:v21];

  v22 = [(HDCodableWorkoutSessionSyncTransaction *)v12 data];
  (*((void (**)(id, void *, void))v4 + 2))(v4, v22, 0);

  id v23 = objc_loadWeakRetained((id *)p_sessionServer);
  [v23 remoteSessionDidRecover];

LABEL_8:
}

- (double)heartbeatInterval
{
  double result = 0.5;
  if (!_HDIsUnitTesting) {
    return 5.0;
  }
  return result;
}

- (void)_scheduleHeartbeat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelSendHeartbeatTimeout];
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelSendHeartbeat];
  id v4 = dispatch_get_global_queue(0, 0);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  heartbeatSource = self->_heartbeatSource;
  self->_heartbeatSource = v5;

  id v7 = self->_heartbeatSource;
  [(HDWorkoutSessionRapportSyncController *)self heartbeatInterval];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  id v10 = self->_heartbeatSource;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HDWorkoutSessionRapportSyncController__scheduleHeartbeat__block_invoke;
  v11[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_heartbeatSource);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__HDWorkoutSessionRapportSyncController__scheduleHeartbeat__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendHeartbeat];
}

- (void)_sendHeartbeat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  int v4 = [WeakRetained isMirroring];

  if (v4)
  {
    [(HDWorkoutSessionRapportSyncController *)self _sendPendingTransactions];
    os_unfair_lock_lock(&self->_lock);
    v5 = self->_lock_lastPingDate;
    os_unfair_lock_unlock(&self->_lock);
    if (v5
      && ([MEMORY[0x1E4F1C9C8] date],
          id v6 = objc_claimAutoreleasedReturnValue(),
          [v6 timeIntervalSinceDate:v5],
          double v8 = v7,
          v6,
          [(HDWorkoutSessionRapportSyncController *)self heartbeatInterval],
          v8 < v9))
    {
      [(HDWorkoutSessionRapportSyncController *)self _scheduleHeartbeat];
    }
    else
    {
      [(HDWorkoutSessionRapportSyncController *)self _scheduleSendHeartbeatTimeout];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__HDWorkoutSessionRapportSyncController__sendHeartbeat__block_invoke;
      v10[3] = &unk_1E62F2978;
      v10[4] = self;
      [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"heartbeat" transaction:0 completion:v10];
    }
  }
}

void __55__HDWorkoutSessionRapportSyncController__sendHeartbeat__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      double v7 = v6;
      *(_DWORD *)double v9 = 138543618;
      *(void *)&v9[4] = objc_opt_class();
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = v5;
      id v8 = *(id *)&v9[4];
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Heartbeat failed with error %{public}@", v9, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleHeartbeat", *(_OWORD *)v9, *(void *)&v9[16], v10);
}

- (void)_scheduleSendHeartbeatTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelSendHeartbeatTimeout];
  int v4 = dispatch_get_global_queue(0, 0);
  id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  sendHeartbeatTimeoutSource = self->_sendHeartbeatTimeoutSource;
  self->_sendHeartbeatTimeoutSource = v5;

  double v7 = self->_sendHeartbeatTimeoutSource;
  [(HDWorkoutSessionRapportSyncController *)self heartbeatInterval];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  uint64_t v10 = self->_sendHeartbeatTimeoutSource;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __70__HDWorkoutSessionRapportSyncController__scheduleSendHeartbeatTimeout__block_invoke;
  handler[3] = &unk_1E62F74E0;
  handler[4] = self;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_sendHeartbeatTimeoutSource);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__HDWorkoutSessionRapportSyncController__scheduleSendHeartbeatTimeout__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    id v5 = v2;
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Heartbeat timed out. Retrying now.", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained recordHeartbeatFailure];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _sendHeartbeat];
}

- (void)_cancelSendHeartbeat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelSendHeartbeat];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelSendHeartbeat
{
  heartbeatSource = self->_heartbeatSource;
  if (heartbeatSource)
  {
    dispatch_source_cancel(heartbeatSource);
    id v4 = self->_heartbeatSource;
    self->_heartbeatSource = 0;
  }
}

- (void)_cancelSendHeartbeatTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelSendHeartbeatTimeout];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelSendHeartbeatTimeout
{
  sendHeartbeatTimeoutSource = self->_sendHeartbeatTimeoutSource;
  if (sendHeartbeatTimeoutSource)
  {
    dispatch_source_cancel(sendHeartbeatTimeoutSource);
    id v4 = self->_sendHeartbeatTimeoutSource;
    self->_sendHeartbeatTimeoutSource = 0;
  }
}

- (double)heartbeatReceiveTimeout
{
  double result = 1.5;
  if (!_HDIsUnitTesting) {
    return 30.0;
  }
  return result;
}

- (void)receivedHeartbeatWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  [(HDWorkoutSessionRapportSyncController *)self _scheduleReceiveHeartbeatTimeout];
  v4[2](v4, 1, 0);
}

- (void)_scheduleReceiveHeartbeatTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelReceiveHeartbeatTimeout];
  id v4 = dispatch_get_global_queue(0, 0);
  id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  receiveHeartbeatTimeoutSource = self->_receiveHeartbeatTimeoutSource;
  self->_receiveHeartbeatTimeoutSource = v5;

  int v7 = self->_receiveHeartbeatTimeoutSource;
  [(HDWorkoutSessionRapportSyncController *)self heartbeatReceiveTimeout];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  uint64_t v10 = self->_receiveHeartbeatTimeoutSource;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HDWorkoutSessionRapportSyncController__scheduleReceiveHeartbeatTimeout__block_invoke;
  v11[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_receiveHeartbeatTimeoutSource);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __73__HDWorkoutSessionRapportSyncController__scheduleReceiveHeartbeatTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _receiveHeartbeatDidTimeout];
}

- (void)_cancelReceiveHeartbeatTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDWorkoutSessionRapportSyncController *)self _lock_cancelReceiveHeartbeatTimeout];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelReceiveHeartbeatTimeout
{
  receiveHeartbeatTimeoutSource = self->_receiveHeartbeatTimeoutSource;
  if (receiveHeartbeatTimeoutSource)
  {
    dispatch_source_cancel(receiveHeartbeatTimeoutSource);
    id v4 = self->_receiveHeartbeatTimeoutSource;
    self->_receiveHeartbeatTimeoutSource = 0;
  }
}

- (void)_receiveHeartbeatDidTimeout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    id v6 = v3;
    [(HDWorkoutSessionRapportSyncController *)self heartbeatReceiveTimeout];
    int v8 = 138543618;
    dispatch_time_t v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: No heartbeat received in the last %f seconds, marking session as disconnected.", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 554, @"Primary session is unreachable.");
  [WeakRetained didDisconnectFromRemoteWithError:v5];
}

- (void)sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HDWorkoutSessionRapportSyncController *)self _isDataRateLimiterDisabledByUserDefaults])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke;
    v16[3] = &unk_1E62FEB00;
    id v17 = v6;
    [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"arbitraryData" transaction:v16 completion:v7];
    id v8 = v17;
  }
  else
  {
    dataRateLimiter = self->_dataRateLimiter;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_2;
    v12[3] = &unk_1E62F4E40;
    id v13 = self;
    id v14 = v6;
    id v10 = v7;
    id v15 = v10;
    if ((-[HKRateLimiter perform:cost:](dataRateLimiter, "perform:cost:", v12, objc_msgSend(v14, "length", v12[0], 3221225472, __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_2, &unk_1E62F4E40, v13)) & 1) == 0)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 13, @"Data sent over the past 10 seconds exceeded the 100 KB size limit");
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v11);
    }
    id v8 = v14;
  }
}

uint64_t __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setArbitraryData:*(void *)(a1 + 32)];
}

void __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_3;
  v3[3] = &unk_1E62FEB00;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 sendRequest:@"arbitraryData" transaction:v3 completion:*(void *)(a1 + 48)];
}

uint64_t __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setArbitraryData:*(void *)(a1 + 32)];
}

- (void)receivedDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  p_sessionServer = &self->_sessionServer;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  v10[0] = v7;
  dispatch_time_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  [WeakRetained didReceiveDataFromRemoteWorkoutSession:v9 completion:v6];
}

- (void)sendStateEvent:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__HDWorkoutSessionRapportSyncController_sendStateEvent_date_completion___block_invoke;
  v10[3] = &unk_1E62FEB48;
  id v11 = v8;
  int64_t v12 = a3;
  id v9 = v8;
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"stateEvent" transaction:v10 completion:a5];
}

void __72__HDWorkoutSessionRapportSyncController_sendStateEvent_date_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v4 globalState];
  [v5 setSessionStateEvent:v3];

  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  double v7 = v6;
  id v8 = [v4 globalState];

  [v8 setSessionStateEventDate:v7];
}

- (void)receivedStateEvent:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 hasSessionStateEventDate])
  {
    [v6 sessionStateEventDate];
    id v8 = HDDecodeDateForValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
    objc_msgSend(WeakRetained, "syncSessionEvent:date:", objc_msgSend(v6, "sessionStateEvent"), v8);

    v7[2](v7, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = self;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session event does not have an associated date", (uint8_t *)&v12, 0xCu);
    }
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Session event does not have an associated date");
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v11);
  }
}

- (void)sendStateUpdate:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  [(HDCodableWorkoutSessionGlobalState *)v10 setSessionState:a3];
  id v11 = v8;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F1C9C8] date];
  }
  [v11 timeIntervalSinceReferenceDate];
  -[HDCodableWorkoutSessionGlobalState setSessionStateChangeDate:](v10, "setSessionStateChangeDate:");
  if (!v8) {

  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HDWorkoutSessionRapportSyncController_sendStateUpdate_date_completion___block_invoke;
  v13[3] = &unk_1E62FEB00;
  uint64_t v14 = v10;
  int v12 = v10;
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"stateUpdate" transaction:v13 completion:v9];
}

uint64_t __73__HDWorkoutSessionRapportSyncController_sendStateUpdate_date_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGlobalState:*(void *)(a1 + 32)];
}

- (void)receivedStateUpdate:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasSessionStateChangeDate])
  {
    [v6 sessionStateChangeDate];
    id v8 = HDDecodeDateForValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
    objc_msgSend(WeakRetained, "syncTransitionToState:date:completion:", objc_msgSend(v6, "sessionState"), v8, v7);
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = self;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session state does not have an associated date", (uint8_t *)&v12, 0xCu);
    }
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Session state does not have an associated date");
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)sendEventUpdate:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  id v9 = [v7 codableRepresentationForSync];

  v15[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = (void *)[v10 mutableCopy];
  [(HDCodableWorkoutSessionGlobalState *)v8 setEvents:v11];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HDWorkoutSessionRapportSyncController_sendEventUpdate_completion___block_invoke;
  v13[3] = &unk_1E62FEB00;
  uint64_t v14 = v8;
  int v12 = v8;
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"eventUpdate" transaction:v13 completion:v6];
}

uint64_t __68__HDWorkoutSessionRapportSyncController_sendEventUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGlobalState:*(void *)(a1 + 32)];
}

- (void)receivedEventUpdate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "hk_map:", &__block_literal_global_330_0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  [WeakRetained syncWorkoutEvents:v8 completion:v6];
}

uint64_t __72__HDWorkoutSessionRapportSyncController_receivedEventUpdate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B798] createWithCodable:a2];
}

- (void)sendBackgroundRuntimeRequestWithCompletion:(id)a3
{
}

- (void)receivedBackgroundRuntimeRequestWithCompletion:(id)a3
{
  p_sessionServer = &self->_sessionServer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  [WeakRetained receivedBackgroundRuntimeRequestWithCompletion:v4];
}

- (void)sendCurrentActivityUpdate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  id v9 = [v7 codableRepresentationForSync];

  [(HDCodableWorkoutSessionGlobalState *)v8 setCurrentActivity:v9];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HDWorkoutSessionRapportSyncController_sendCurrentActivityUpdate_completion___block_invoke;
  v11[3] = &unk_1E62FEB00;
  int v12 = v8;
  id v10 = v8;
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:@"activityUpdate" transaction:v11 completion:v6];
}

uint64_t __78__HDWorkoutSessionRapportSyncController_sendCurrentActivityUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGlobalState:*(void *)(a1 + 32)];
}

- (void)receivedCurrentActivityUpdate:(id)a3 completion:(id)a4
{
  p_sessionServer = &self->_sessionServer;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  id v8 = [MEMORY[0x1E4F2B720] createWithCodable:v7];

  [WeakRetained syncCurrentActivity:v8 completion:v6];
}

- (void)rapportMessenger:(id)a3 didReceiveRequest:(id)a4 data:(id)a5 responseHandler:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void, id))a6;
  [(HDWorkoutSessionRapportSyncController *)self _resetHeartbeat];
  int v12 = [v9 name];
  int v13 = [v12 isEqualToString:@"recoverSession"];

  if (!v13)
  {
    id v57 = 0;
    uint64_t v14 = [(id)objc_opt_class() _decodedTransactionWithData:v10 error:&v57];
    id v15 = v57;
    if (!v14)
    {
      v11[2](v11, 0, v15);
LABEL_27:

      goto LABEL_28;
    }
    id v16 = (void *)MEMORY[0x1E4F29128];
    id v17 = [v14 sessionUUID];
    uint64_t v18 = objc_msgSend(v16, "hk_UUIDWithData:", v17);

    p_sessionServer = &self->_sessionServer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
    v21 = [WeakRetained identifier];
    v54 = (void *)v18;
    LOBYTE(v18) = [(id)v18 isEqual:v21];

    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v28 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = objc_opt_class();
        id v31 = v30;
        id v32 = objc_loadWeakRetained((id *)p_sessionServer);
        v33 = [v32 identifier];
        *(_DWORD *)buf = 138544130;
        v59 = v30;
        __int16 v60 = 2114;
        id v61 = v9;
        __int16 v62 = 2114;
        v63 = v54;
        __int16 v64 = 2114;
        v65 = v33;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Ignoring incoming request %{public}@ because session UUID is different. Request UUID: %{public}@, local UUID: %{public}@", buf, 0x2Au);
      }
      goto LABEL_26;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__HDWorkoutSessionRapportSyncController_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke;
    aBlock[3] = &unk_1E62F29A0;
    v22 = v11;
    id v56 = v22;
    id v23 = _Block_copy(aBlock);
    int v24 = [v9 name];
    char v25 = [v24 isEqualToString:@"startMirroring"];

    if (v25)
    {
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    __int16 v26 = [v9 name];
    int v27 = [v26 isEqualToString:@"heartbeat"];

    if (v27)
    {
      [(HDWorkoutSessionRapportSyncController *)self receivedHeartbeatWithCompletion:v23];
      goto LABEL_25;
    }
    v34 = [v9 name];
    int v35 = [v34 isEqualToString:@"stopMirroring"];

    if (v35)
    {
      [(HDWorkoutSessionRapportSyncController *)self receivedMirroringStopRequestWithCompletion:v23];
      goto LABEL_25;
    }
    v36 = [v9 name];
    int v37 = [v36 isEqualToString:@"arbitraryData"];

    if (v37)
    {
      v38 = [v14 arbitraryData];
      [(HDWorkoutSessionRapportSyncController *)self receivedDataFromRemoteWorkoutSession:v38 completion:v23];
    }
    else
    {
      v39 = [v9 name];
      int v40 = [v39 isEqualToString:@"stateUpdate"];

      if (v40)
      {
        v38 = [v14 globalState];
        [(HDWorkoutSessionRapportSyncController *)self receivedStateUpdate:v38 completion:v23];
      }
      else
      {
        v41 = [v9 name];
        int v42 = [v41 isEqualToString:@"stateEvent"];

        if (v42)
        {
          v38 = [v14 globalState];
          [(HDWorkoutSessionRapportSyncController *)self receivedStateEvent:v38 completion:v23];
        }
        else
        {
          v43 = [v9 name];
          int v44 = [v43 isEqualToString:@"activityUpdate"];

          if (v44)
          {
            v38 = [v14 globalState];
            v45 = [v38 currentActivity];
            [(HDWorkoutSessionRapportSyncController *)self receivedCurrentActivityUpdate:v45 completion:v23];
          }
          else
          {
            v46 = [v9 name];
            int v47 = [v46 isEqualToString:@"eventUpdate"];

            if (!v47)
            {
              v48 = [v9 name];
              int v49 = [v48 isEqualToString:@"backgroundRuntime"];

              if (v49)
              {
                [(HDWorkoutSessionRapportSyncController *)self receivedBackgroundRuntimeRequestWithCompletion:v23];
                goto LABEL_25;
              }
              _HKInitializeLogging();
              v50 = (void *)*MEMORY[0x1E4F29FB8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
              {
                v51 = v50;
                v52 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v59 = v52;
                __int16 v60 = 2114;
                id v61 = v9;
                id v53 = v52;
                _os_log_error_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_ERROR, " [mirroring] %{public}@: No handler available for request %{public}@", buf, 0x16u);
              }
              v38 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Unknown request");
              v22[2](v22, 0, v38);
              goto LABEL_24;
            }
            v38 = [v14 globalState];
            v45 = [v38 events];
            [(HDWorkoutSessionRapportSyncController *)self receivedEventUpdate:v45 completion:v23];
          }
        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  [(HDWorkoutSessionRapportSyncController *)self receivedRecoveryRequestWithResponseHandler:v11];
LABEL_28:
}

uint64_t __97__HDWorkoutSessionRapportSyncController_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendRequest:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __76__HDWorkoutSessionRapportSyncController_sendRequest_transaction_completion___block_invoke;
  v10[3] = &unk_1E62FEB90;
  id v11 = v8;
  id v9 = v8;
  [(HDWorkoutSessionRapportSyncController *)self sendRequest:a3 transaction:a4 responseHandler:v10];
}

uint64_t __76__HDWorkoutSessionRapportSyncController_sendRequest_transaction_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0);
}

- (void)sendRequest:(id)a3 transaction:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, HDCodableWorkoutSessionSyncTransaction *))a4;
  id v10 = a5;
  id v11 = objc_alloc_init(HDCodableWorkoutSessionSyncTransaction);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  int v13 = [WeakRetained identifier];
  uint64_t v14 = objc_msgSend(v13, "hk_dataForUUIDBytes");
  [(HDCodableWorkoutSessionSyncTransaction *)v11 setSessionUUID:v14];

  if (v9)
  {
    id v15 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
    [(HDCodableWorkoutSessionSyncTransaction *)v11 setGlobalState:v15];

    v9[2](v9, v11);
  }
  os_unfair_lock_lock(&self->_lock);
  id v16 = [MEMORY[0x1E4F1C9C8] date];
  lock_lastPingDate = self->_lock_lastPingDate;
  self->_lock_lastPingDate = v16;

  uint64_t v18 = [(NSMutableDictionary *)self->_lock_pendingTransactionsByRequest objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(&self->_lock);
  if (v18)
  {
    [(HDWorkoutSessionRapportSyncController *)self _enqueueTransaction:v11 requestName:v8];
  }
  else
  {
    id v19 = [[HDRapportRequestIdentifier alloc] initWithSchemaIdentifier:0 name:v8];
    rapportMessenger = self->_rapportMessenger;
    v21 = [(HDCodableWorkoutSessionSyncTransaction *)v11 data];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__HDWorkoutSessionRapportSyncController_sendRequest_transaction_responseHandler___block_invoke;
    v22[3] = &unk_1E62FEBB8;
    v22[4] = self;
    id v23 = v11;
    id v24 = v8;
    id v25 = v10;
    [(HDRapportMessenger *)rapportMessenger sendRequest:v19 data:v21 completion:v22];
  }
}

void __81__HDWorkoutSessionRapportSyncController_sendRequest_transaction_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    [*(id *)(a1 + 32) _resetHeartbeat];
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v6, "hk_isObjectNotFoundError")
    || (id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16)),
        uint64_t v9 = [WeakRetained sessionType],
        WeakRetained,
        v9 != 1))
  {
    [*(id *)(a1 + 32) _enqueueTransaction:*(void *)(a1 + 40) requestName:*(void *)(a1 + 48)];
    if (v5)
    {
LABEL_6:
      id v13 = 0;
      id v11 = [(id)objc_opt_class() _decodedTransactionWithData:v5 error:&v13];
      id v12 = v13;
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      goto LABEL_9;
    }
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) _cancelReceiveHeartbeatTimeout];
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v10 didDisconnectFromRemoteWithError:0];

LABEL_9:
}

+ (id)_decodedTransactionWithData:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [[HDCodableWorkoutSessionSyncTransaction alloc] initWithData:v5];
  if (!v6)
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)id v12 = 138543618;
      *(void *)&void v12[4] = objc_opt_class();
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = v5;
      id v9 = *(id *)&v12[4];
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Unable to decode incoming request transaction with data: %{public}@", v12, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to decode incoming request.", *(_OWORD *)v12, *(void *)&v12[16], v13);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }

  return v6;
}

- (void)_resetHeartbeat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  lock_lastPingDate = self->_lock_lastPingDate;
  self->_lock_lastPingDate = v4;

  os_unfair_lock_unlock(p_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  uint64_t v7 = [WeakRetained sessionType];

  if (v7 == 1)
  {
    [(HDWorkoutSessionRapportSyncController *)self _scheduleReceiveHeartbeatTimeout];
  }
}

- (BOOL)_isDataRateLimiterDisabledByUserDefaults
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"WorkoutSessionDataRateLimiterDisabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)_enqueueTransaction:(id)a3 requestName:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  uint64_t v9 = [WeakRetained sessionType];

  if (!v9
    && ([v7 isEqualToString:@"heartbeat"] & 1) == 0
    && ([v7 isEqualToString:@"arbitraryData"] & 1) == 0)
  {
    _HKInitializeLogging();
    id v10 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      *(_DWORD *)objc_super v20 = 138543618;
      *(void *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v6;
      id v12 = *(id *)&v20[4];
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will enqueue failed transaction: %{public}@", v20, 0x16u);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ([v7 isEqualToString:@"eventUpdate"]
      && ([(NSMutableDictionary *)self->_lock_pendingTransactionsByRequest objectForKeyedSubscript:v7], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = v14;
      id v16 = [v14 globalState];
      id v17 = [v16 events];
      uint64_t v18 = [v6 globalState];
      id v19 = [v18 events];
      [v17 addObjectsFromArray:v19];

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_pendingTransactionsByRequest, "setObject:forKeyedSubscript:", v6, v7, *(_OWORD *)v20, *(void *)&v20[16], v21);
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)_sendPendingTransactions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  uint64_t v4 = [WeakRetained sessionType];

  if (!v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = (void *)[(NSMutableDictionary *)self->_lock_pendingTransactionsByRequest copy];
    [(NSMutableDictionary *)self->_lock_pendingTransactionsByRequest removeAllObjects];
    os_unfair_lock_unlock(&self->_lock);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke;
    v6[3] = &unk_1E62FEBE0;
    v6[4] = self;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)buf = 138543618;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2114;
    id v17 = v5;
    id v9 = v15;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will send pending transaction: %{public}@", buf, 0x16u);
  }
  id v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke_344;
  v12[3] = &unk_1E62FEB00;
  id v13 = v5;
  id v11 = v5;
  [v10 sendRequest:v6 transaction:v12 completion:&__block_literal_global_346];
}

void __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke_344(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 configuration];
  [v4 setConfiguration:v5];

  id v6 = [*(id *)(a1 + 32) globalState];
  [v4 setGlobalState:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_lastPingDate, 0);
  objc_storeStrong((id *)&self->_lock_pendingTransactionsByRequest, 0);
  objc_storeStrong((id *)&self->_receiveHeartbeatTimeoutSource, 0);
  objc_storeStrong((id *)&self->_sendHeartbeatTimeoutSource, 0);
  objc_storeStrong((id *)&self->_heartbeatSource, 0);
  objc_storeStrong((id *)&self->_dataRateLimiter, 0);
  objc_destroyWeak((id *)&self->_sessionServer);

  objc_storeStrong((id *)&self->_rapportMessenger, 0);
}

@end