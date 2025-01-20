@interface HDCloudSyncPipelineStageSharedSummaryPush
- (void)main;
@end

@implementation HDCloudSyncPipelineStageSharedSummaryPush

- (void)main
{
  v3 = [(HDCloudSyncOperation *)self profile];
  v4 = [v3 daemon];
  v5 = [v4 behavior];
  int v6 = [v5 healthAppHidden];

  if (v6) {
    v7 = HDCloudSyncSharedSummaryDisableAndDeleteOperation;
  }
  else {
    v7 = HDCloudSyncSharedSummaryPushOperation;
  }
  id v8 = [v7 alloc];
  v9 = [(HDCloudSyncOperation *)self configuration];
  id v10 = (id)[v8 initWithConfiguration:v9 cloudState:0];

  [(HDCloudSyncOperation *)self delegateToOperation:v10];
}

@end