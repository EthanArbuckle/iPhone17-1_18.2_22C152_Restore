@interface HDCloudSyncPipelineStageReset
- (HDCloudSyncResetOperation)_resetOperationForContainer:(int)a3 primary:;
- (void)main;
@end

@implementation HDCloudSyncPipelineStageReset

- (void)main
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncOperation *)self cloudState];
  v6 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:v5 name:@"Reset All Containers" continueOnSubOperationError:1];

  v7 = [(HDCloudSyncOperation *)self configuration];
  v8 = [v7 repository];
  v9 = [v8 primaryCKContainer];
  v10 = -[HDCloudSyncPipelineStageReset _resetOperationForContainer:primary:](self, v9, 1);

  [(HDCloudSyncCompoundOperation *)v6 addOperation:v10 transitionHandler:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(HDCloudSyncOperation *)self configuration];
  v12 = [v11 repository];
  v13 = [v12 secondaryCKContainers];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = -[HDCloudSyncPipelineStageReset _resetOperationForContainer:primary:](self, *(void **)(*((void *)&v19 + 1) + 8 * v17), 0);
        [(HDCloudSyncCompoundOperation *)v6 addOperation:v18 transitionHandler:0];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  [(HDCloudSyncOperation *)self delegateToOperation:v6];
}

- (HDCloudSyncResetOperation)_resetOperationForContainer:(int)a3 primary:
{
  if (a1)
  {
    id v5 = a2;
    v6 = [HDCloudSyncResetOperation alloc];
    v7 = [a1 configuration];
    v8 = [a1 cloudState];
    v9 = [(HDCloudSyncResetOperation *)v6 initWithConfiguration:v7 cloudState:v8 container:v5];

    if (a3)
    {
      v10 = v9;
    }
    else
    {
      v10 = [(HDCloudSyncOperation *)v9 operationIgnoringErrors];
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end