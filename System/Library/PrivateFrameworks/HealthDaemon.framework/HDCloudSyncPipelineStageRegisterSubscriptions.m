@interface HDCloudSyncPipelineStageRegisterSubscriptions
- (BOOL)includeSecondaryContainers;
- (HDCloudSyncPipelineStageRegisterSubscriptions)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPipelineStageRegisterSubscriptions)initWithConfiguration:(id)a3 cloudState:(id)a4 subscriptions:(id)a5;
- (HDCloudSyncRegisterSubscriptionsOperation)_operationForContainer:(void *)a3 configuration:(void *)a4 cloudState:;
- (NSDictionary)subscriptions;
- (void)main;
- (void)setIncludeSecondaryContainers:(BOOL)a3;
@end

@implementation HDCloudSyncPipelineStageRegisterSubscriptions

- (HDCloudSyncPipelineStageRegisterSubscriptions)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPipelineStageRegisterSubscriptions)initWithConfiguration:(id)a3 cloudState:(id)a4 subscriptions:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPipelineStageRegisterSubscriptions;
  v9 = [(HDCloudSyncPipelineStage *)&v13 initWithConfiguration:a3 cloudState:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSDictionary *)v10;
  }
  return v9;
}

- (void)main
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(NSDictionary *)self->_subscriptions count])
  {
    v3 = [HDCloudSyncCompoundOperation alloc];
    v4 = [(HDCloudSyncOperation *)self configuration];
    v5 = [(HDCloudSyncOperation *)self cloudState];
    uint64_t v6 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:v5 name:@"Register subscriptions." continueOnSubOperationError:0];

    v7 = [(HDCloudSyncOperation *)self configuration];
    id v8 = [v7 repository];
    v9 = [v8 primaryCKContainer];
    uint64_t v10 = [(HDCloudSyncOperation *)self configuration];
    v11 = [(HDCloudSyncOperation *)self cloudState];
    v12 = -[HDCloudSyncPipelineStageRegisterSubscriptions _operationForContainer:configuration:cloudState:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v9, v10, v11);

    [(HDCloudSyncCompoundOperation *)v6 addOperation:v12 transitionHandler:0];
    if (self->_includeSecondaryContainers)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      objc_super v13 = [(HDCloudSyncOperation *)self configuration];
      v14 = [v13 repository];
      v15 = [v14 secondaryCKContainers];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v21 = [(HDCloudSyncOperation *)self configuration];
            v22 = [(HDCloudSyncOperation *)self cloudState];
            v23 = -[HDCloudSyncPipelineStageRegisterSubscriptions _operationForContainer:configuration:cloudState:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v20, v21, v22);

            v24 = [v23 operationIgnoringErrors];
            [(HDCloudSyncCompoundOperation *)v6 addOperation:v24 transitionHandler:0];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }
    }
    [(HDCloudSyncOperation *)self delegateToOperation:v6];
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

- (HDCloudSyncRegisterSubscriptionsOperation)_operationForContainer:(void *)a3 configuration:(void *)a4 cloudState:
{
  v4 = a1;
  if (a1)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    v4 = [[HDCloudSyncRegisterSubscriptionsOperation alloc] initWithConfiguration:v8 cloudState:v7 container:v9 subscriptions:v4[1].super._onSuccess];
  }

  return v4;
}

- (NSDictionary)subscriptions
{
  return self->_subscriptions;
}

- (BOOL)includeSecondaryContainers
{
  return self->_includeSecondaryContainers;
}

- (void)setIncludeSecondaryContainers:(BOOL)a3
{
  self->_includeSecondaryContainers = a3;
}

- (void).cxx_destruct
{
}

@end