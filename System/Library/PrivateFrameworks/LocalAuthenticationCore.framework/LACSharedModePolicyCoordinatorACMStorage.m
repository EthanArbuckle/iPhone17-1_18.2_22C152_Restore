@interface LACSharedModePolicyCoordinatorACMStorage
- (LACSharedModePolicyCoordinatorACMStorage)init;
- (void)performRequest:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModePolicyCoordinatorACMStorage

- (void).cxx_destruct
{
}

uint64_t __70__LACSharedModePolicyCoordinatorACMStorage_performRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  storage = self->_storage;
  id v8 = a3;
  v9 = [v8 value];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__LACSharedModePolicyCoordinatorACMStorage_performRequest_completion___block_invoke;
  v11[3] = &unk_2653B6C10;
  id v12 = v6;
  id v10 = v6;
  [(LACSecureStorage *)storage setObject:v9 forRequest:v8 connection:0 completionHandler:v11];
}

- (LACSharedModePolicyCoordinatorACMStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)LACSharedModePolicyCoordinatorACMStorage;
  v2 = [(LACSharedModePolicyCoordinatorACMStorage *)&v8 init];
  if (v2)
  {
    v3 = [LACSecureStorage alloc];
    v4 = [[LACSecureStorageConfiguration alloc] initWithBypassEntitlementChecks:1];
    uint64_t v5 = [(LACSecureStorage *)v3 initWithConfig:v4];
    storage = v2->_storage;
    v2->_storage = (LACSecureStorage *)v5;
  }
  return v2;
}

@end