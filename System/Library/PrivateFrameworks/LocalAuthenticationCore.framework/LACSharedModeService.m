@interface LACSharedModeService
- (LACSharedModeService)initWithReplyQueue:(id)a3;
- (id)_dataSource;
- (id)_policyCoordinator;
- (id)_policyTraitsManager;
- (id)processor;
@end

@implementation LACSharedModeService

- (id)processor
{
  v3 = [LACSharedModeProcessor alloc];
  replyQueue = self->_replyQueue;
  v5 = [(LACSharedModeService *)self _dataSource];
  v6 = [(LACSharedModeService *)self _policyTraitsManager];
  v7 = [(LACSharedModeService *)self _policyCoordinator];
  v8 = [(LACSharedModeProcessor *)v3 initWithReplyQueue:replyQueue dataSource:v5 policyTraitsManager:v6 policyCoordinator:v7];

  return v8;
}

- (id)_policyTraitsManager
{
  v2 = objc_alloc_init(LACSharedModePolicyTraitsManager);
  return v2;
}

- (id)_policyCoordinator
{
  v3 = objc_alloc_init(LACSharedModePolicyCoordinatorACMStorageRequestFactory);
  v4 = objc_alloc_init(LACSharedModePolicyCoordinatorACMStorage);
  v5 = [[LACSharedModePolicyCoordinatorACMAdapter alloc] initWithReplyQueue:self->_replyQueue storageRequestFactory:v3 storage:v4];

  return v5;
}

- (id)_dataSource
{
  v3 = [LACSharedModeDataSourceTaskDecorator alloc];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__LACSharedModeService__dataSource__block_invoke;
  v7[3] = &unk_2653B64D0;
  v7[4] = self;
  v4 = __35__LACSharedModeService__dataSource__block_invoke((uint64_t)v7);
  v5 = [(LACSharedModeDataSourceTaskDecorator *)v3 initWithDataSource:v4 runtime:self->_runtime replyQueue:self->_replyQueue];

  return v5;
}

LACSharedModeDataSourceDefaultsDecorator *__35__LACSharedModeService__dataSource__block_invoke(uint64_t a1)
{
  v2 = [[LACSharedModeDataSourceFTRCAdapter alloc] initWithReplyQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  if (+[LACGlobalDomain osVariantAllowsDomainOverrides])
  {
    v3 = [[LACSharedModeDataSourceDefaultsDecorator alloc] initWithDataSource:v2 replyQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (LACSharedModeService)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LACSharedModeService;
  v6 = [(LACSharedModeService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = objc_alloc_init(LACSharedModeDataSourceTaskDecoratorRuntime);
    runtime = v7->_runtime;
    v7->_runtime = v8;
  }
  return v7;
}

LACSharedModeDataSourceFTRCAdapter *__35__LACSharedModeService__dataSource__block_invoke_2(uint64_t a1)
{
  v1 = [[LACSharedModeDataSourceFTRCAdapter alloc] initWithReplyQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtime, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end