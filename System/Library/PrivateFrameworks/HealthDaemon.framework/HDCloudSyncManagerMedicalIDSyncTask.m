@interface HDCloudSyncManagerMedicalIDSyncTask
- (BOOL)combineWithTask:(id)a3;
- (id)pipelineForRepository:(id)a3;
- (void)didFailWithErrors:(id)a3;
- (void)didFinishWithSuccess;
@end

@implementation HDCloudSyncManagerMedicalIDSyncTask

- (id)pipelineForRepository:(id)a3
{
  id v4 = a3;
  v5 = [HDCloudSyncPipeline alloc];
  v6 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v7 = [(HDCloudSyncManagerPipelineTask *)self accessibilityAssertion];
  v8 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  v9 = [v8 queue];
  id v10 = [(HDCloudSyncPipeline *)v5 initForContext:v6 repository:v4 accessibilityAssertion:v7 queue:v9];

  v11 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  v12 = [v10 operationConfiguration];
  v13 = [(HDCloudSyncPipelineStage *)v11 initWithConfiguration:v12 cloudState:0];
  [v10 addStage:v13];

  v14 = [HDCloudSyncPipelineStageSynchronize alloc];
  v15 = [v10 operationConfiguration];
  v16 = [(HDCloudSyncPipelineStage *)v14 initWithConfiguration:v15 cloudState:0];
  [v10 addStage:v16];

  v17 = [HDCloudSyncPipelineStageMedicalID alloc];
  v18 = [v10 operationConfiguration];
  v19 = [(HDCloudSyncPipelineStage *)v17 initWithConfiguration:v18 cloudState:0];
  [v10 addStage:v19];

  return v10;
}

- (void)didFinishWithSuccess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  [v3 updateErrorRequiringUserAction:0];

  [(HDCloudSyncManagerPipelineTask *)self callCompletionWithSuccess:1 error:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(HDCloudSyncManagerTask *)self mirroringTasks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) didFinishWithSuccess];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)didFailWithErrors:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  uint64_t v6 = [v4 firstObject];
  [v5 updateErrorRequiringUserAction:v6];

  uint64_t v7 = [v4 firstObject];
  [(HDCloudSyncManagerPipelineTask *)self callCompletionWithSuccess:0 error:v7];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [(HDCloudSyncManagerTask *)self mirroringTasks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) didFailWithErrors:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)combineWithTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = [(HDCloudSyncManagerRepositoryTask *)self context];
  uint64_t v6 = [v4 context];
  if (([v5 isEquivalent:v6] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v7 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  uint64_t v8 = [v7 profileIdentifier];
  uint64_t v9 = [v4 manager];
  uint64_t v10 = [v9 profileIdentifier];
  int v11 = [v8 isEqual:v10];

  if (!v11)
  {
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  [v4 mirrorTask:self];
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (void).cxx_destruct
{
}

@end