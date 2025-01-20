@interface HDCloudSyncDisableSyncLocallyOperation
- (void)main;
@end

@implementation HDCloudSyncDisableSyncLocallyOperation

- (void)main
{
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 profile];
  v6 = [v5 legacyRepositoryProfile];

  v7 = [v6 daemon];
  v8 = [v7 cloudSyncCoordinator];
  v9 = [v8 accountProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke;
  v11[3] = &unk_1E62F5D48;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 disableSyncLocallyWithCompletion:v11];
}

void __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = [*(id *)(a1 + 40) cloudSyncManager];
    v7 = [v6 ownerIdentifierManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke_280;
    v9[3] = &unk_1E62F2978;
    v9[4] = *(void *)(a1 + 32);
    [v7 rollOwnerDifferentiatorForReason:@"Disabling cloud sync locally." completion:v9];
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to disable cloud sync: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v5];
  }
}

void __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke_280(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29FA8];
  v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Updated owner identifier after disabling cloud sync.", (uint8_t *)&v11, 2u);
    }
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = 1;
    id v10 = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to update owner differentiator after disabling cloud sync: %{public}@.", (uint8_t *)&v11, 0xCu);
    }
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = 0;
    id v10 = v5;
  }
  [v8 finishWithSuccess:v9 error:v10];
}

@end