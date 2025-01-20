@interface HDNotificationSyncManager
- (BOOL)sendNotificationInstructionMessage:(id)a3 error:(id *)a4;
- (HDNotificationInstructionManager)notificationInstructionManager;
- (HDNotificationSyncManager)initWithProfile:(id)a3;
- (void)daemonReady:(id)a3;
- (void)nanoSyncManagerDidReceiveNotificationInstructionRequest:(id)a3 receivedDate:(id)a4 sendingDeviceName:(id)a5 completion:(id)a6;
- (void)notificationInstructionSyncService:(id)a3 didReceiveNotificationInstruction:(id)a4;
@end

@implementation HDNotificationSyncManager

- (HDNotificationSyncManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDNotificationSyncManager;
  v5 = [(HDNotificationSyncManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [[HDNotificationInstructionManager alloc] initWithProfile:v4];
    notificationInstructionManager = v6->_notificationInstructionManager;
    v6->_notificationInstructionManager = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v10 = [WeakRetained daemon];
    [v10 registerDaemonReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  v5 = [v4 notificationInstructionSyncService];
  [v5 registerObserver:self queue:0];
}

void __91__HDNotificationSyncManager__sendNanoSyncNotificationInstructionMessage_requestIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29F80];
  v6 = *MEMORY[0x1E4F29F80];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = v5;
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully sent NanoSync message", (uint8_t *)&v9, 0xCu);
LABEL_7:
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = v5;
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v8 = v10;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error sending NanoSync message: %{public}@", (uint8_t *)&v9, 0x16u);
    goto LABEL_7;
  }
}

- (void)nanoSyncManagerDidReceiveNotificationInstructionRequest:(id)a3 receivedDate:(id)a4 sendingDeviceName:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v33 = a6;
  id v12 = a4;
  uint64_t v13 = [HDNotificationInstructionMessage alloc];
  v14 = [v10 notificationInstruction];
  v15 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v17 = [WeakRetained daemon];
  v18 = [v17 pluginManager];
  v19 = [v18 notificationInstructionCriteriaClasses];
  v20 = [(HDNotificationInstructionMessage *)v13 initWithCodableNotificationInstructionMessage:v14 criteriaClasses:v19];

  v21 = v11;
  v22 = [v10 requestIdentifier];
  v23 = [[HDNotificationInstruction alloc] initWithMessageIdentifier:v22 receivedDate:v12 sendingDeviceName:v11 message:v20];

  _HKInitializeLogging();
  v24 = (void *)*MEMORY[0x1E4F29F80];
  v25 = *MEMORY[0x1E4F29F80];
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v24;
      *(_DWORD *)buf = 138543618;
      id v39 = (id)objc_opt_class();
      __int16 v40 = 2114;
      id v41 = v22;
      id v27 = v39;
      _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully received NanoSync instruction: %{public}@", buf, 0x16u);
    }
    notificationInstructionManager = v15->_notificationInstructionManager;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __127__HDNotificationSyncManager_nanoSyncManagerDidReceiveNotificationInstructionRequest_receivedDate_sendingDeviceName_completion___block_invoke;
    v35[3] = &unk_1E62F2A18;
    v35[4] = v15;
    id v36 = v22;
    v29 = v33;
    id v37 = v33;
    [(HDNotificationInstructionManager *)notificationInstructionManager insertNotificationInstruction:v23 completion:v35];
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v31 = v24;
      *(_DWORD *)buf = 138544130;
      id v39 = (id)objc_opt_class();
      __int16 v40 = 2114;
      id v41 = v10;
      __int16 v42 = 2114;
      v43 = v22;
      __int16 v44 = 2114;
      id v45 = v11;
      id v32 = v39;
      _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to instantiate HDNotificationInstructionMessage from NanoSync request: %{public}@ %{public}@, sendingDeviceName: %{public}@", buf, 0x2Au);
    }
    v30 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 129, @"Unable to instantiate HDNotificationInstructionMessage from NanoSync request", v33);
    v29 = v34;
    v34[2](v34, 0, v30);
  }
}

void __127__HDNotificationSyncManager_nanoSyncManagerDidReceiveNotificationInstructionRequest_receivedDate_sendingDeviceName_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      int v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v6;
      id v11 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error persisting new instruction %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v6, v5);
}

- (void)notificationInstructionSyncService:(id)a3 didReceiveNotificationInstruction:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v5;
    id v8 = v12;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received new instruction: %{public}@", buf, 0x16u);
  }
  notificationInstructionManager = self->_notificationInstructionManager;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__HDNotificationSyncManager_notificationInstructionSyncService_didReceiveNotificationInstruction___block_invoke;
  v10[3] = &unk_1E62F2978;
  v10[4] = self;
  [(HDNotificationInstructionManager *)notificationInstructionManager insertNotificationInstruction:v5 completion:v10];
}

void __98__HDNotificationSyncManager_notificationInstructionSyncService_didReceiveNotificationInstruction___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v4;
      id v7 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error persisting new instruction: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)sendNotificationInstructionMessage:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_profile = &self->_profile;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v9 = [WeakRetained daemon];
  __int16 v10 = [v9 notificationInstructionSyncService];
  id v28 = 0;
  char v11 = [v10 sendNotificationInstructionMessage:v7 identifier:&v28 error:a4];
  id v12 = v28;

  id v13 = v12;
  if (self)
  {
    id v14 = v7;
    uint64_t v15 = objc_alloc_init(HDCodableNotificationInstructionRequest);
    __int16 v16 = v15;
    if (v13)
    {
      [(HDCodableNotificationInstructionRequest *)v15 setRequestIdentifier:v13];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v18 = [v17 UUIDString];
      [(HDCodableNotificationInstructionRequest *)v16 setRequestIdentifier:v18];
    }
    v19 = [v14 codableMessage];

    [(HDCodableNotificationInstructionRequest *)v16 setNotificationInstruction:v19];
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_opt_class();
      id v23 = v22;
      v24 = [(HDCodableNotificationInstructionRequest *)v16 requestIdentifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending NanoSync message: %{public}@", buf, 0x16u);
    }
    id v25 = objc_loadWeakRetained((id *)p_profile);
    v26 = [v25 nanoSyncManager];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __91__HDNotificationSyncManager__sendNanoSyncNotificationInstructionMessage_requestIdentifier___block_invoke;
    v30 = &unk_1E62F2978;
    v31 = self;
    [v26 sendNotificationInstructionMessageRequest:v16 completion:buf];
  }
  return v11;
}

- (HDNotificationInstructionManager)notificationInstructionManager
{
  return self->_notificationInstructionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInstructionManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end