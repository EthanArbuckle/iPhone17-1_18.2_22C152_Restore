@interface HDCloudSyncPipelineStageStateSync
- (void)main;
@end

@implementation HDCloudSyncPipelineStageStateSync

- (void)main
{
  v2 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v4 = [(HDCloudSyncOperation *)v2 profile];
    v5 = [v4 daemon];
    v6 = [v5 cloudSyncCoordinator];
    v7 = [v6 stateSyncEntityClasses];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:buf count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v55;
      v11 = &selRef_startFakingWithHKWorkoutActivityType_;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v55 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if ([v13 conformsToProtocol:v11[502]])
          {
            v14 = (void *)MEMORY[0x1E4F1A320];
            [(HDCloudSyncOperation *)v2 configuration];
            v16 = v15 = v2;
            v17 = [v16 syncContainerPrefix];
            v18 = [v13 stateEntitySchema];
            [v18 domain];
            uint64_t v19 = v10;
            v21 = id v20 = v3;
            v22 = objc_msgSend(v14, "hd_stateSyncZoneIDForSyncCircleIdentifier:domain:", v17, v21);

            id v3 = v20;
            uint64_t v10 = v19;

            v2 = v15;
            v11 = &selRef_startFakingWithHKWorkoutActivityType_;
            v23 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v22];
            [v3 addObject:v23];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:buf count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v3 = 0;
  }
  if ([v3 count])
  {
    v24 = [HDCloudSyncCompoundOperation alloc];
    v25 = [(HDCloudSyncOperation *)v2 configuration];
    v26 = [(HDCloudSyncCompoundOperation *)v24 initWithConfiguration:v25 cloudState:0 name:@"State Sync" continueOnSubOperationError:1];

    v27 = [HDCloudSyncCreateZonesOperation alloc];
    v28 = [(HDCloudSyncOperation *)v2 configuration];
    v29 = [(HDCloudSyncOperation *)v2 configuration];
    [v29 repository];
    v31 = v30 = v2;
    v32 = [v31 primaryCKContainer];
    id obja = v3;
    v33 = [(HDCloudSyncCreateZonesOperation *)v27 initWithConfiguration:v28 cloudState:0 zones:v3 container:v32];

    [(HDCloudSyncCompoundOperation *)v26 addOperation:v33 transitionHandler:0];
    v34 = (void *)MEMORY[0x1E4F1CAD0];
    v35 = [(HDCloudSyncOperation *)v30 configuration];
    v36 = [v35 repository];
    v37 = [v36 secondaryCKContainers];
    v38 = [v34 setWithArray:v37];

    v39 = [HDCloudSyncStateSyncOperation alloc];
    v40 = [(HDCloudSyncOperation *)v30 configuration];
    v41 = [(HDCloudSyncStateSyncOperation *)v39 initWithConfiguration:v40 containers:v38];

    [(HDCloudSyncCompoundOperation *)v26 addOperation:v41 transitionHandler:0];
    v42 = [(HDCloudSyncOperation *)v30 configuration];
    v43 = [v42 repository];
    v44 = [v43 primaryCKContainer];

    if (v44)
    {
      v45 = [HDCloudSyncStateSyncOperation alloc];
      v46 = [(HDCloudSyncOperation *)v30 configuration];
      v47 = [MEMORY[0x1E4F1CAD0] setWithObject:v44];
      v48 = [(HDCloudSyncStateSyncOperation *)v45 initWithConfiguration:v46 containers:v47];

      [(HDCloudSyncCompoundOperation *)v26 addOperation:v48 transitionHandler:0];
    }
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __41__HDCloudSyncPipelineStageStateSync_main__block_invoke;
    v53[3] = &unk_1E62F2950;
    v53[4] = v30;
    [(HDCloudSyncOperation *)v26 setOnError:v53];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __41__HDCloudSyncPipelineStageStateSync_main__block_invoke_287;
    v52[3] = &unk_1E62F2928;
    v52[4] = v30;
    [(HDCloudSyncOperation *)v26 setOnSuccess:v52];
    [(HDCloudSyncCompoundOperation *)v26 start];

    id v3 = obja;
  }
  else
  {
    _HKInitializeLogging();
    v49 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "No State Entites found locally", buf, 2u);
    }
    [(HDCloudSyncOperation *)v2 finishWithSuccess:1 error:0];
  }
}

void __41__HDCloudSyncPipelineStageStateSync_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform state sync push %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __41__HDCloudSyncPipelineStageStateSync_main__block_invoke_287(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

@end