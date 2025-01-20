@interface HDHRHealthKitSyncManager
- (HDHRHealthKitSyncManager)initWithProfile:(id)a3;
- (void)triggerImmediateSyncWithReason:(id)a3 loggingCategory:(id)a4;
@end

@implementation HDHRHealthKitSyncManager

- (HDHRHealthKitSyncManager)initWithProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRHealthKitSyncManager;
  v6 = [(HDHRHealthKitSyncManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profile, a3);
  }

  return v7;
}

- (void)triggerImmediateSyncWithReason:(id)a3 loggingCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HDProfile *)self->_profile nanoSyncManager];
  objc_super v9 = [NSString stringWithFormat:@"[%@] %@", self, v6];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke;
  v22[3] = &unk_1E69B4388;
  id v10 = v7;
  id v23 = v10;
  v24 = self;
  id v11 = v6;
  id v25 = v11;
  [v8 syncHealthDataWithOptions:0 reason:v9 completion:v22];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:v12];
  v14 = [(HDProfile *)self->_profile cloudSyncManager];
  v15 = [NSString stringWithFormat:@"[%@] %@", self, v11];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_286;
  v18[3] = &unk_1E69B4388;
  id v19 = v10;
  v20 = self;
  id v21 = v11;
  id v16 = v11;
  id v17 = v10;
  [v14 syncWithRequest:v13 reason:v15 completion:v18];
}

void __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = a1[4];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
  }
}

void __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_286(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = a1[4];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "[%{public}@] Cloud sync request completed after %{public}@";
      __int16 v11 = v6;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
  }
  else if (v7)
  {
    uint64_t v13 = a1[5];
    uint64_t v14 = a1[6];
    int v15 = 138543874;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    __int16 v19 = 2114;
    id v20 = v5;
    uint64_t v10 = "[%{public}@] Cloud sync request failed after %{public}@: %{public}@";
    __int16 v11 = v6;
    uint32_t v12 = 32;
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

void __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%{public}@] NanoSync failed after %{public}@: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end