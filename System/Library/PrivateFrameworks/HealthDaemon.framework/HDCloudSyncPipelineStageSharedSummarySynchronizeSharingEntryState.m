@interface HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState
- (void)main;
@end

@implementation HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState

- (void)main
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  uint64_t v5 = [v4 profileType];

  if (v5 == 1)
  {
    v6 = [HDCloudSyncCompoundOperation alloc];
    v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [(HDCloudSyncCompoundOperation *)v6 initWithConfiguration:v7 cloudState:0 name:@"Synchronize Shared Summary State" continueOnSubOperationError:0];

    id v9 = objc_alloc(MEMORY[0x1E4F1A310]);
    v10 = (void *)MEMORY[0x1E4F1A320];
    v11 = [(HDCloudSyncOperation *)self configuration];
    v12 = [v11 repository];
    v13 = [v12 syncCircleIdentifier];
    v14 = objc_msgSend(v10, "hd_privateMetadataZoneIDForSyncCircleIdentifier:", v13);
    v15 = (void *)[v9 initWithZoneID:v14];

    v16 = [HDCloudSyncCreateZonesOperation alloc];
    v17 = [(HDCloudSyncOperation *)self configuration];
    v23[0] = v15;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v19 = [(HDCloudSyncOperation *)self configuration];
    v20 = [v19 repository];
    v21 = [v20 primaryCKContainer];
    v22 = [(HDCloudSyncCreateZonesOperation *)v16 initWithConfiguration:v17 cloudState:0 zones:v18 container:v21];

    [(HDCloudSyncCompoundOperation *)v8 addOperation:v22 transitionHandler:0];
    [(HDCloudSyncCompoundOperation *)v8 addOperationOfClass:objc_opt_class() transitionHandler:0];
    [(HDCloudSyncCompoundOperation *)v8 addOperationOfClass:objc_opt_class() transitionHandler:0];
    [(HDCloudSyncCompoundOperation *)v8 addOperationOfClass:objc_opt_class() transitionHandler:0];
    [(HDCloudSyncOperation *)self delegateToOperation:v8];
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

@end