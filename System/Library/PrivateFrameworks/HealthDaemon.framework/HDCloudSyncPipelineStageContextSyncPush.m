@interface HDCloudSyncPipelineStageContextSyncPush
- (void)main;
@end

@implementation HDCloudSyncPipelineStageContextSyncPush

- (void)main
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Push Context Sync" continueOnSubOperationError:0];

  id v6 = objc_alloc(MEMORY[0x1E4F1A310]);
  v7 = (void *)MEMORY[0x1E4F1A320];
  v8 = [(HDCloudSyncOperation *)self configuration];
  v9 = [v8 syncContainerPrefix];
  v10 = objc_msgSend(v7, "hd_contextSyncZoneIDForSyncCircleIdentifier:", v9);
  v11 = (void *)[v6 initWithZoneID:v10];

  v12 = [HDCloudSyncCreateZonesOperation alloc];
  v13 = [(HDCloudSyncOperation *)self configuration];
  v24[0] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v15 = [(HDCloudSyncOperation *)self configuration];
  v16 = [v15 repository];
  v17 = [v16 primaryCKContainer];
  v18 = [(HDCloudSyncCreateZonesOperation *)v12 initWithConfiguration:v13 cloudState:0 zones:v14 container:v17];

  [(HDCloudSyncCompoundOperation *)v5 addOperation:v18 transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke;
  v23[3] = &unk_1E62F2950;
  v23[4] = self;
  [(HDCloudSyncOperation *)v5 setOnError:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke_288;
  v21[3] = &unk_1E62F46F8;
  v21[4] = self;
  id v22 = v19;
  id v20 = v19;
  [(HDCloudSyncOperation *)v5 setOnSuccess:v21];
  [(HDCloudSyncCompoundOperation *)v5 start];
}

void __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform context sync push %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke_288(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 profile];
  uint64_t v6 = [v5 daemon];
  int v7 = [v6 analyticsSubmissionCoordinator];
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  objc_msgSend(v7, "contextSync_triggerDuration:");

  uint64_t v8 = [*(id *)(a1 + 32) profile];
  __int16 v9 = [v8 daemon];
  id v10 = [v9 analyticsSubmissionCoordinator];
  objc_msgSend(v10, "contextSync_operationSucceeded:", v4);

  uint64_t v11 = *(void **)(a1 + 32);

  return [v11 finishWithSuccess:1 error:0];
}

@end