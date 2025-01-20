@interface HDCloudSyncPipelineStageFetchAndUpdateCache
- (void)main;
@end

@implementation HDCloudSyncPipelineStageFetchAndUpdateCache

- (void)main
{
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Fetch & Update" continueOnSubOperationError:0];

  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  v6 = [HDCloudSyncUpdateCachedRecordsOperation alloc];
  v7 = [(HDCloudSyncOperation *)self configuration];
  v8 = [(HDCloudSyncUpdateCachedRecordsOperation *)v6 initWithConfiguration:v7 cloudState:0];

  [(HDCloudSyncCompoundOperation *)v5 addOperation:v8 transitionHandler:0];
  v9 = [HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation alloc];
  v10 = [(HDCloudSyncOperation *)self configuration];
  v11 = [(HDCloudSyncUpdateCachedRecordsOperation *)v9 initWithConfiguration:v10 cloudState:0];

  [(HDCloudSyncCompoundOperation *)v5 addOperation:v11 transitionHandler:0];
  v12 = [HDCloudSyncHandleMissingManateeIdentityOperation alloc];
  v13 = [(HDCloudSyncOperation *)self configuration];
  v14 = [(HDCloudSyncHandleMissingManateeIdentityOperation *)v12 initWithConfiguration:v13 cloudState:0];

  [(HDCloudSyncCompoundOperation *)v5 addOperation:v14 transitionHandler:0];
  v15 = [HDCloudSyncDeleteRecordsOperation alloc];
  v16 = [(HDCloudSyncOperation *)self configuration];
  v17 = [(HDCloudSyncDeleteRecordsOperation *)v15 initWithConfiguration:v16 cloudState:0];

  v18 = [(HDCloudSyncOperation *)v17 operationIgnoringErrors];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __51__HDCloudSyncPipelineStageFetchAndUpdateCache_main__block_invoke;
  v27 = &unk_1E62F4820;
  v19 = v17;
  v28 = v19;
  v20 = v8;
  v29 = v20;
  [(HDCloudSyncCompoundOperation *)v5 addOperation:v18 transitionHandler:&v24];

  v21 = [(HDCloudSyncOperation *)self configuration];
  v22 = [v21 context];
  char v23 = [v22 options];

  if ((v23 & 4) == 0) {
    [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  }
  [(HDCloudSyncOperation *)self delegateToOperation:v5];
}

void __51__HDCloudSyncPipelineStageFetchAndUpdateCache_main__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) invalidRecordIDs];
  [*(id *)(a1 + 32) setRecordIDsToDelete:v2];
}

@end