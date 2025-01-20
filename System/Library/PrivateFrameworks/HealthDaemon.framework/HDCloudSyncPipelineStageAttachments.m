@interface HDCloudSyncPipelineStageAttachments
- (void)main;
@end

@implementation HDCloudSyncPipelineStageAttachments

- (void)main
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncOperation *)self cloudState];
  v6 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:v5 name:@"Sync Attachments" continueOnSubOperationError:0];

  v7 = [(HDCloudSyncOperation *)self configuration];
  v8 = [v7 repository];
  uint64_t v9 = [v8 profileType];

  if (v9 == 1)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1A310]);
    v11 = (void *)MEMORY[0x1E4F1A320];
    v12 = [(HDCloudSyncOperation *)self configuration];
    v13 = [v12 repository];
    v14 = [v13 syncCircleIdentifier];
    v15 = objc_msgSend(v11, "hd_attachmentZoneIDWithSyncCircleIdentifier:", v14);
    v16 = (void *)[v10 initWithZoneID:v15];

    v17 = [HDCloudSyncCreateZonesOperation alloc];
    v18 = [(HDCloudSyncOperation *)self configuration];
    v24[0] = v16;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v20 = [(HDCloudSyncOperation *)self configuration];
    v21 = [v20 repository];
    v22 = [v21 primaryCKContainer];
    v23 = [(HDCloudSyncCreateZonesOperation *)v17 initWithConfiguration:v18 cloudState:0 zones:v19 container:v22];

    [(HDCloudSyncCompoundOperation *)v6 addOperation:v23 transitionHandler:0];
  }
  [(HDCloudSyncCompoundOperation *)v6 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v6 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v6 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v6 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncCompoundOperation *)v6 addOperationOfClass:objc_opt_class() transitionHandler:0];
  [(HDCloudSyncOperation *)self delegateToOperation:v6];
}

@end