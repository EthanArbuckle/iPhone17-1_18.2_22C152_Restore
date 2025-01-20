@interface ASDSkannerService
+ (ASDSkannerService)defaultService;
+ (id)interface;
- (ASDSkannerService)init;
- (id)_initWithServiceBroker:(id *)a1;
- (void)fetchStoriesWithCompletionHandler:(id)a3;
@end

@implementation ASDSkannerService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C278];
}

- (ASDSkannerService)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  v4 = (ASDSkannerService *)-[ASDSkannerService _initWithServiceBroker:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)_initWithServiceBroker:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)ASDSkannerService;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

+ (ASDSkannerService)defaultService
{
  if (qword_1EB4D6518 != -1) {
    dispatch_once(&qword_1EB4D6518, &__block_literal_global_13);
  }
  v2 = (void *)_MergedGlobals_38;
  return (ASDSkannerService *)v2;
}

void __35__ASDSkannerService_defaultService__block_invoke()
{
  v0 = [ASDSkannerService alloc];
  id v3 = +[ASDServiceBroker defaultBroker];
  v1 = -[ASDSkannerService _initWithServiceBroker:]((id *)&v0->super.isa, v3);
  v2 = (void *)_MergedGlobals_38;
  _MergedGlobals_38 = (uint64_t)v1;
}

- (void)fetchStoriesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B40E0;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getSkannerServiceWithCompletionHandler:v7];
}

void __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v6 fetchStoriesWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    objc_super v7 = ASDLogHandleForCategory(33);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting skanner service: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(33);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting remote proxy for skanner service: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end