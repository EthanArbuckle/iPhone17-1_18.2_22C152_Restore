@interface HDCloudSyncPipelineStageSynchronize
- (void)main;
@end

@implementation HDCloudSyncPipelineStageSynchronize

- (void)main
{
  v36[2] = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Synchronize" continueOnSubOperationError:0];

  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v5 addOperationOfClass:objc_opt_class() transitionHandler:0];
  v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 repository];
  v8 = [v7 primaryCKContainer];
  v9 = [(HDCloudSyncOperation *)self configuration];
  v10 = [v9 repository];
  v11 = [v10 profileIdentifier];
  v12 = HDDatabaseForContainer(v8, v11);
  uint64_t v13 = [v12 databaseScope];

  if (v13 == 2)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1A310]);
    v15 = (void *)MEMORY[0x1E4F1A320];
    v16 = [(HDCloudSyncOperation *)self configuration];
    v17 = [v16 repository];
    v18 = [v17 syncCircleIdentifier];
    v19 = objc_msgSend(v15, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v18);
    v20 = (void *)[v14 initWithZoneID:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F1A310]);
    v22 = (void *)MEMORY[0x1E4F1A320];
    v23 = [(HDCloudSyncOperation *)self configuration];
    v24 = [v23 repository];
    v25 = [v24 syncCircleIdentifier];
    v26 = objc_msgSend(v22, "hd_privateMetadataZoneIDForSyncCircleIdentifier:", v25);
    v27 = (void *)[v21 initWithZoneID:v26];

    v28 = [HDCloudSyncCreateZonesOperation alloc];
    v29 = [(HDCloudSyncOperation *)self configuration];
    v36[0] = v20;
    v36[1] = v27;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v31 = [(HDCloudSyncOperation *)self configuration];
    v32 = [v31 repository];
    v33 = [v32 primaryCKContainer];
    v34 = [(HDCloudSyncCreateZonesOperation *)v28 initWithConfiguration:v29 cloudState:0 zones:v30 container:v33];

    v35 = [(HDCloudSyncOperation *)v34 operationIgnoringErrors];
    [(HDCloudSyncCompoundOperation *)v5 addOperation:v35 transitionHandler:0];
  }
  [(HDCloudSyncOperation *)self delegateToOperation:v5];
}

@end