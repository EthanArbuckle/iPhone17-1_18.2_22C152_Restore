@interface HDCloudSyncManagerShowTask
- (HDCloudSyncManagerShowTask)initWithManager:(id)a3 context:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6;
- (NSArray)repositoryDescriptions;
- (id)pipelineForRepository:(id)a3;
- (void)didFailWithErrors:(id)a3;
- (void)didFinishWithSuccess;
@end

@implementation HDCloudSyncManagerShowTask

- (HDCloudSyncManagerShowTask)initWithManager:(id)a3 context:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [a4 subContextByAddingOptions:64];
  v18.receiver = self;
  v18.super_class = (Class)HDCloudSyncManagerShowTask;
  v14 = [(HDCloudSyncManagerPipelineTask *)&v18 initWithManager:v12 context:v13 accessibilityAssertion:v11 completion:v10];

  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allRepositoryDescriptions = v14->_allRepositoryDescriptions;
    v14->_allRepositoryDescriptions = v15;
  }
  return v14;
}

- (id)pipelineForRepository:(id)a3
{
  id v4 = a3;
  v5 = [(HDCloudSyncManagerRepositoryTask *)self context];
  v6 = [v5 subContextByAddingOptions:64];

  v7 = [HDCloudSyncPipeline alloc];
  v8 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  v9 = [v8 queue];
  id v10 = [(HDCloudSyncPipeline *)v7 initForContext:v6 repository:v4 accessibilityAssertion:0 queue:v9];

  id v11 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  id v12 = [v10 operationConfiguration];
  v13 = [(HDCloudSyncPipelineStage *)v11 initWithConfiguration:v12 cloudState:0];
  [v10 addStage:v13];

  v14 = [HDCloudSyncPipelineStageSynchronize alloc];
  v15 = [v10 operationConfiguration];
  v16 = [(HDCloudSyncPipelineStage *)v14 initWithConfiguration:v15 cloudState:0];
  [v10 addStage:v16];

  v17 = [HDCloudSyncPipelineStagePrepareForSync alloc];
  objc_super v18 = [v10 operationConfiguration];
  v19 = [(HDCloudSyncPipelineStage *)v17 initWithConfiguration:v18 cloudState:0];
  [v10 addStage:v19];

  v20 = [HDCloudSyncPipelineStageDescribe alloc];
  v21 = [v10 operationConfiguration];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__HDCloudSyncManagerShowTask_pipelineForRepository___block_invoke;
  v24[3] = &unk_1E6307B28;
  v24[4] = self;
  v22 = [(HDCloudSyncPipelineStageDescribe *)v20 initWithConfiguration:v21 cloudState:0 respositoryDescriptionHandler:v24];
  [v10 addStage:v22];

  return v10;
}

void __52__HDCloudSyncManagerShowTask_pipelineForRepository___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 136);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(*(void *)(a1 + 32) + 144) addObject:v4];

    v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 136);
    os_unfair_lock_unlock(v5);
  }
}

- (void)didFinishWithSuccess
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_allRepositoryDescriptions copy];
  objc_setProperty_atomic_copy(self, v5, v4, 152);

  allRepositoryDescriptions = self->_allRepositoryDescriptions;
  self->_allRepositoryDescriptions = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)didFailWithErrors:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  SEL v5 = (void *)[(NSMutableArray *)self->_allRepositoryDescriptions copy];
  objc_setProperty_atomic_copy(self, v6, v5, 152);

  allRepositoryDescriptions = self->_allRepositoryDescriptions;
  self->_allRepositoryDescriptions = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)repositoryDescriptions
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repositoryDescriptions, 0);

  objc_storeStrong((id *)&self->_allRepositoryDescriptions, 0);
}

@end