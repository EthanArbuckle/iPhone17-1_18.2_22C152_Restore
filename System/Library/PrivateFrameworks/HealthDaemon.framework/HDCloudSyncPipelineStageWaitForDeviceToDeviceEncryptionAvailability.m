@interface HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability)initWithConfiguration:(id)a3;
- (void)_checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:(void *)a1;
- (void)_cloudKitIdentityUpdated:(id)a3;
- (void)main;
- (void)unitTest_setExpirationInterval:(double)a3;
@end

@implementation HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability

- (HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability;
  result = [(HDCloudSyncPipelineStage *)&v4 initWithConfiguration:a3 cloudState:0];
  if (result) {
    result->_expirationInterval = 60.0;
  }
  return result;
}

- (void)main
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__cloudKitIdentityUpdated_ name:*MEMORY[0x1E4F19C98] object:0];

  objc_super v4 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v5 = [v4 repository];
  v6 = [(id)v5 primaryCKContainer];

  v7 = [v6 containerIdentifier];
  LOBYTE(v5) = [v7 isEqualToString:@"com.apple.health.sync.secure"];

  if (v5)
  {
    -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability _checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:](self, 1);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [v6 containerIdentifier];
      int v11 = 138543618;
      v12 = self;
      __int16 v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Primary container %{public}@ is not secure; skipping D2DE check.",
        (uint8_t *)&v11,
        0x16u);
    }
    [(HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability *)self finishWithSuccess:1 error:0];
  }
}

- (void)_checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:(void *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    objc_super v4 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v11 = a1;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Looking up account info to check for device-to-device encryption availability...", buf, 0xCu);
    }
    uint64_t v5 = [a1 configuration];
    v6 = [v5 repository];
    v7 = [v6 primaryCKContainer];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __137__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving___block_invoke;
    v8[3] = &unk_1E62FF858;
    v8[4] = a1;
    char v9 = a2;
    [v7 accountInfoWithCompletionHandler:v8];
  }
}

void __137__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v33[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to fetch account info while waiting on device-to-device encryption availability: %{public}@", buf, 0x16u);
    }
    char v9 = *(void **)(a1 + 32);
    uint64_t v10 = 0;
    id v11 = v6;
    goto LABEL_9;
  }
  if ([v5 supportsDeviceToDeviceEncryption])
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Device-to-device encryption is available.", buf, 0xCu);
    }
    char v9 = *(void **)(a1 + 32);
    uint64_t v10 = 1;
    id v11 = 0;
LABEL_9:
    [v9 finishWithSuccess:v10 error:v11];
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Device-to-device encryption not currently available; waiting for account update notification.",
        buf,
        0xCu);
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      if (!*(void *)(v16 + 128))
      {
        v17 = [(id)v16 profile];
        v18 = [v17 daemon];
        v19 = [v18 behavior];
        char v20 = [v19 tinkerModeEnabled];

        if ((v20 & 1) == 0)
        {
          v21 = [(id)v16 profile];
          v22 = [v21 cloudSyncManager];
          v23 = [v22 queue];
          dispatch_source_t v24 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v23);
          v25 = *(void **)(v16 + 128);
          *(void *)(v16 + 128) = v24;

          objc_initWeak(&location, (id)v16);
          v26 = *(NSObject **)(v16 + 128);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __100__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__startExpirationTimerIfNeeded__block_invoke;
          v32 = &unk_1E62F6BD0;
          objc_copyWeak(v33, &location);
          dispatch_source_set_event_handler(v26, buf);
          v27 = *(NSObject **)(v16 + 128);
          dispatch_time_t v28 = dispatch_walltime(0, (uint64_t)(*(double *)(v16 + 136) * 1000000000.0));
          dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
          dispatch_resume(*(dispatch_object_t *)(v16 + 128));
          objc_destroyWeak(v33);
          objc_destroyWeak(&location);
        }
      }
    }
  }
  else
  {
    v29 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Timeout waiting for device to device encryption availability");
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v29];
  }
LABEL_10:
}

- (void)_cloudKitIdentityUpdated:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received CKIdentityUpdateNotification", (uint8_t *)&v5, 0xCu);
  }
  -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability _checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:](self, 1);
}

void __100__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__startExpirationTimerIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[16];
    WeakRetained[16] = 0;

    -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability _checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:](WeakRetained, 0);
  }
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    uint64_t v8 = self->_expirationTimer;
    self->_expirationTimer = 0;
  }
  char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability;
  BOOL v10 = [(HDCloudSyncOperation *)&v12 finishWithSuccess:v4 error:v6];

  return v10;
}

- (void)unitTest_setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (void).cxx_destruct
{
}

@end