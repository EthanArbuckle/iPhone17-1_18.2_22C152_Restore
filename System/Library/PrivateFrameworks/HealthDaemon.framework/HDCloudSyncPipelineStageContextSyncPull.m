@interface HDCloudSyncPipelineStageContextSyncPull
- (void)main;
@end

@implementation HDCloudSyncPipelineStageContextSyncPull

- (void)main
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Pull Context Sync" continueOnSubOperationError:0];

  v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 repository];
  v37 = [v7 primaryCKContainer];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(HDCloudSyncOperation *)self configuration];
  v10 = [v9 repository];
  v11 = [v10 secondaryCKContainers];
  v12 = [v8 setWithArray:v11];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v19 = [HDCloudSyncPullDeviceContextOperation alloc];
        v20 = [(HDCloudSyncOperation *)self configuration];
        v21 = [(HDCloudSyncPullDeviceContextOperation *)v19 initWithConfiguration:v20 container:v18];

        [(HDCloudSyncCompoundOperation *)v5 addOperation:v21 transitionHandler:0];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v15);
  }

  if (v37)
  {
    v22 = [HDCloudSyncPullDeviceContextOperation alloc];
    v23 = [(HDCloudSyncOperation *)self configuration];
    v24 = [(HDCloudSyncPullDeviceContextOperation *)v22 initWithConfiguration:v23 container:v37];

    [(HDCloudSyncCompoundOperation *)v5 addOperation:v24 transitionHandler:0];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v25 = v13;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        v31 = [HDCloudSyncPullDeviceKeyValueOperation alloc];
        v32 = [(HDCloudSyncOperation *)self configuration];
        v33 = [(HDCloudSyncPullDeviceKeyValueOperation *)v31 initWithConfiguration:v32 container:v30];

        [(HDCloudSyncCompoundOperation *)v5 addOperation:v33 transitionHandler:0];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v27);
  }

  if (v37)
  {
    v34 = [HDCloudSyncPullDeviceKeyValueOperation alloc];
    v35 = [(HDCloudSyncOperation *)self configuration];
    v36 = [(HDCloudSyncPullDeviceKeyValueOperation *)v34 initWithConfiguration:v35 container:v37];

    [(HDCloudSyncCompoundOperation *)v5 addOperation:v36 transitionHandler:0];
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke;
  v39[3] = &unk_1E62F2950;
  v39[4] = self;
  [(HDCloudSyncOperation *)v5 setOnError:v39];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke_2;
  v38[3] = &unk_1E62F2928;
  v38[4] = self;
  [(HDCloudSyncOperation *)v5 setOnSuccess:v38];
  [(HDCloudSyncCompoundOperation *)v5 start];
}

uint64_t __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

uint64_t __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

@end