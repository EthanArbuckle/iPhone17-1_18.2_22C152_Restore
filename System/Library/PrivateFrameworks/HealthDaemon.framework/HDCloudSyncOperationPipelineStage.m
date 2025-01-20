@interface HDCloudSyncOperationPipelineStage
- (HDCloudSyncOperation)operation;
- (HDCloudSyncOperationPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncOperationPipelineStage)initWithOperation:(id)a3;
- (id)description;
- (void)main;
@end

@implementation HDCloudSyncOperationPipelineStage

- (HDCloudSyncOperationPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncOperationPipelineStage)initWithOperation:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 configuration];
  v7 = [v5 cloudState];
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncOperationPipelineStage;
  v8 = [(HDCloudSyncPipelineStage *)&v10 initWithConfiguration:v6 cloudState:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_operation, a3);
  }

  return v8;
}

- (void)main
{
}

- (id)description
{
  v2 = NSString;
  v3 = [(HDCloudSyncOperationPipelineStage *)self operation];
  v4 = [v2 stringWithFormat:@"[Wrap: %@]", v3];

  return v4;
}

- (HDCloudSyncOperation)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
}

@end