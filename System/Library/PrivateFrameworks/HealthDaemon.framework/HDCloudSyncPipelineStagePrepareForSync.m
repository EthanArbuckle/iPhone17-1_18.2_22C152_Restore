@interface HDCloudSyncPipelineStagePrepareForSync
- (void)main;
@end

@implementation HDCloudSyncPipelineStagePrepareForSync

- (void)main
{
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v30 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Target Computation & Validation" continueOnSubOperationError:0];

  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 context];
  char v7 = [v6 isFastPushOrPull];

  if ((v7 & 1) == 0)
  {
    v8 = [HDCloudSyncRepairStoreRecordsOperation alloc];
    v9 = [(HDCloudSyncOperation *)self configuration];
    v10 = [(HDCloudSyncOperation *)v8 initWithConfiguration:v9 cloudState:0];
    v11 = [(HDCloudSyncOperation *)v10 operationIgnoringErrors];
    [(HDCloudSyncCompoundOperation *)v30 addOperation:v11 transitionHandler:0];
  }
  v12 = [HDCloudSyncRepairRegistryRecordsOperation alloc];
  v13 = [(HDCloudSyncOperation *)self configuration];
  v14 = [(HDCloudSyncRepairRegistryRecordsOperation *)v12 initWithConfiguration:v13 cloudState:0];
  v15 = [(HDCloudSyncOperation *)v14 operationIgnoringErrors];
  [(HDCloudSyncCompoundOperation *)v30 addOperation:v15 transitionHandler:0];

  id v16 = [(HDCloudSyncOperation *)self configuration];
  if (self)
  {
    v17 = [[HDCloudSyncCompoundOperation alloc] initWithConfiguration:v16 cloudState:0 name:@"Targets & Validation" continueOnSubOperationError:0];
    [(HDCloudSyncCompoundOperation *)v17 addOperationOfClass:objc_opt_class() transitionHandler:0];
    [(HDCloudSyncCompoundOperation *)v17 addOperationOfClass:objc_opt_class() transitionHandler:0];
    v18 = [(HDCloudSyncOperation *)self configuration];
    v19 = [v18 context];
    char v20 = [v19 isFastPushOrPull];

    if ((v20 & 1) == 0)
    {
      [(HDCloudSyncCompoundOperation *)v17 addOperationOfClass:objc_opt_class() transitionHandler:0];
      v21 = [[HDCloudSyncValidatePushTargetOperation alloc] initWithConfiguration:v16];
      [(HDCloudSyncCompoundOperation *)v17 addOperation:v21 transitionHandler:0];
    }
    [(HDCloudSyncCompoundOperation *)v17 addOperationOfClass:objc_opt_class() transitionHandler:0];
  }
  else
  {
    v17 = 0;
  }

  [(HDCloudSyncCompoundOperation *)v30 addOperation:v17 transitionHandler:0];
  v22 = [(HDCloudSyncOperation *)self configuration];
  v23 = [v22 context];
  char v24 = [v23 isFastPushOrPull];

  if ((v24 & 1) == 0)
  {
    v25 = [(HDCloudSyncOperation *)self configuration];
    v26 = v25;
    if (self)
    {
      id v27 = v25;
      v28 = [(HDCloudSyncOperation *)[HDCloudSyncValidateSubscriptionsOperation alloc] initWithConfiguration:v27 cloudState:0];
    }
    else
    {
      v28 = 0;
    }

    v29 = [(HDCloudSyncOperation *)v28 operationIgnoringErrors];
    [(HDCloudSyncCompoundOperation *)v30 addOperation:v29 transitionHandler:0];
  }
  [(HDCloudSyncOperation *)self delegateToOperation:v30];
}

@end