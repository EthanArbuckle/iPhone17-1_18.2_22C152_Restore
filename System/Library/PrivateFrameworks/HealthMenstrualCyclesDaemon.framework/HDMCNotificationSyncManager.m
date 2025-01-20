@interface HDMCNotificationSyncManager
- (HDMCNotificationSyncManager)initWithProfile:(id)a3;
- (HDNotificationSyncClient)notificationSyncClient;
- (id)holdInstructionCategoryIdentifiersWithError:(id *)a3;
- (id)unitTest_didProcessNotificationInstruction;
- (void)_handleDismissInstructionWithClient:(id)a3;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
- (void)sendNotificationInstructionsForSchedulingChanges:(id)a3 sampleInfo:(id)a4;
- (void)setUnitTest_didProcessNotificationInstruction:(id)a3;
@end

@implementation HDMCNotificationSyncManager

- (HDMCNotificationSyncManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMCNotificationSyncManager;
  v5 = [(HDMCNotificationSyncManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x263F432A0]);
    uint64_t v8 = *MEMORY[0x263F450C8];
    v9 = HKCreateSerialDispatchQueue();
    uint64_t v10 = [v7 initWithProfile:v4 clientIdentifier:v8 queue:v9];
    notificationSyncClient = v6->_notificationSyncClient;
    v6->_notificationSyncClient = (HDNotificationSyncClient *)v10;

    [(HDNotificationSyncClient *)v6->_notificationSyncClient setDelegate:v6];
  }

  return v6;
}

- (void)sendNotificationInstructionsForSchedulingChanges:(id)a3 sampleInfo:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __91__HDMCNotificationSyncManager_sendNotificationInstructionsForSchedulingChanges_sampleInfo___block_invoke;
  v4[3] = &unk_264750848;
  v4[4] = self;
  objc_msgSend(a3, "hdmc_enumerateNotificationInstructionsFromAnalysisSampleInfo:block:", a4, v4);
}

void __91__HDMCNotificationSyncManager_sendNotificationInstructionsForSchedulingChanges_sampleInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = *(void **)(*(void *)(a1 + 32) + 16);
  id v15 = 0;
  int v7 = [v6 sendNotificationInstruction:v5 criteria:a3 error:&v15];
  id v8 = v15;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x263F09930];
  uint64_t v10 = *MEMORY[0x263F09930];
  if (!v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v11 = v9;
    v14 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v17 = v14;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v8;
    id v13 = v14;
    _os_log_error_impl(&dword_225722000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error sending %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v9;
    v12 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    __int16 v18 = 2114;
    id v19 = v5;
    id v13 = v12;
    _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sent %{public}@", buf, 0x16u);
LABEL_4:
  }
LABEL_6:
}

- (id)holdInstructionCategoryIdentifiersWithError:(id *)a3
{
  return (id)[(HDNotificationSyncClient *)self->_notificationSyncClient notificationHoldInstructionsWithError:a3];
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  _HKInitializeLogging();
  int v7 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = NSStringFromHKNotificationInstructionAction();
    int v18 = 138543618;
    id v19 = v9;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %{public}@", (uint8_t *)&v18, 0x16u);
  }
  if (a4 == 2)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x263F09948];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      v14 = objc_opt_class();
      int v18 = 138543362;
      id v19 = v14;
      id v15 = v14;
      _os_log_impl(&dword_225722000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received hold instruction. Doing nothing.", (uint8_t *)&v18, 0xCu);
    }
  }
  else if (a4 == 1)
  {
    [(HDMCNotificationSyncManager *)self _handleDismissInstructionWithClient:v6];
  }
  else
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x263F09948];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_ERROR)) {
      -[HDMCNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:](v16);
    }
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction) {
    unitTest_didProcessNotificationInstruction[2]();
  }
}

- (void)_handleDismissInstructionWithClient:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void **)MEMORY[0x263F09930];
  id v6 = *MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = self;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling dismiss instruction", buf, 0xCu);
  }
  id v28 = 0;
  int v7 = [v4 pendingNotificationDismissInstructionsWithError:&v28];
  id v8 = v28;
  _HKInitializeLogging();
  v9 = *v5;
  id v10 = *v5;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v9;
      v12 = (HDMCNotificationSyncManager *)objc_opt_class();
      id v13 = v12;
      v14 = [v7 messageIdentifiers];
      *(_DWORD *)buf = 138543618;
      v30 = v12;
      __int16 v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification dismiss instructions with identifiers: %{public}@", buf, 0x16u);
    }
    id v15 = [v7 categoryIdentifiers];
    v16 = [v15 allObjects];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    int v18 = [WeakRetained notificationManager];
    [v18 removePendingNotificationsWithIdentifiers:v16];

    id v19 = objc_loadWeakRetained((id *)&self->_profile);
    __int16 v20 = [v19 notificationManager];
    [v20 removeDeliveredNotificationsWithIdentifiers:v16];

    id v27 = v8;
    LODWORD(v20) = [v4 markPendingNotificationInstructionsAsProcessed:v7 error:&v27];
    id v21 = v27;

    _HKInitializeLogging();
    uint64_t v22 = *v5;
    v23 = *v5;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v22;
        v25 = (HDMCNotificationSyncManager *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = v25;
        __int16 v31 = 2114;
        v32 = v16;
        v26 = v25;
        _os_log_impl(&dword_225722000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed notifications: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[HDMCNotificationSyncManager _handleDismissInstructionWithClient:](v22);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HDMCNotificationSyncManager _handleDismissInstructionWithClient:](v9);
    }
    id v21 = v8;
  }
}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationSyncClient:(void *)a1 didReceiveInstructionWithAction:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  v9 = NSStringFromHKNotificationInstructionAction();
  OUTLINED_FUNCTION_1(&dword_225722000, v3, v4, "[%{public}@] Unexpected notification instruction received: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Pending notification dismiss instructions returned nil with error = [%{public}@]", v6, v7, v8, v9, v10);
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.2(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v6, v7, v8, v9, v10);
}

@end