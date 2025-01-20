@interface AFSiriTaskService
+ (id)_machServiceNameForAppTaskServiceWithBundleIdentifier:(id)a3;
+ (id)appTaskService;
- (AFSiriTaskService)initWithMachServiceName:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)dealloc;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation AFSiriTaskService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryHandler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.siri.task.client"];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__AFSiriTaskService_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E592C710;
    id v9 = v5;
    id v14 = v9;
    v15 = self;
    dispatch_async(queue, v13);
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[AFSiriTaskService listener:shouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s accepting incoming connection (%@)", buf, 0x16u);
    }
  }
  else
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[AFSiriTaskService listener:shouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = @"com.apple.siri.task.client";
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s rejecting incoming connection (%@) because it doesn't have the \"%@\" entitlement", buf, 0x20u);
    }
  }

  return v7;
}

uint64_t __56__AFSiriTaskService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(MEMORY[0x1E4F29280], "af_siriTaskDeliveringInterface");
  [v2 setExportedInterface:v3];

  [*(id *)(a1 + 32) setExportedObject:*(void *)(*(void *)(a1 + 40) + 24)];
  v4 = *(void **)(a1 + 32);
  return [v4 resume];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__AFSiriTaskService_setDelegate___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __33__AFSiriTaskService_setDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:*(void *)(a1 + 40)];
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AFSiriTaskService_resume__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__AFSiriTaskService_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resume];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFSiriTaskService;
  [(AFSiriTaskService *)&v3 dealloc];
}

- (AFSiriTaskService)initWithMachServiceName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[AFSiriTaskService initWithMachServiceName:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v17.receiver = self;
  v17.super_class = (Class)AFSiriTaskService;
  id v6 = [(AFSiriTaskService *)&v17 init];
  if (v6)
  {
    id v7 = [@"SiriTaskService-" stringByAppendingString:v4];
    id v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v4];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v12;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    id v14 = objc_alloc_init(AFSiriTaskDeliveryHandler);
    deliveryHandler = v6->_deliveryHandler;
    v6->_deliveryHandler = v14;

    [(AFSiriTaskDeliveryHandler *)v6->_deliveryHandler setQueue:v6->_queue];
    [(AFSiriTaskDeliveryHandler *)v6->_deliveryHandler setService:v6];
  }
  return v6;
}

+ (id)appTaskService
{
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  if (!v4)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"AFSiriTaskService.m" lineNumber:48 description:@"Cannot create an app task service for a process without a bundle"];
  }
  id v5 = [v4 bundleIdentifier];
  id v6 = [a1 _machServiceNameForAppTaskServiceWithBundleIdentifier:v5];
  id v7 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:v6];

  return v7;
}

+ (id)_machServiceNameForAppTaskServiceWithBundleIdentifier:(id)a3
{
  return (id)[@"com.apple.siri.task.app." stringByAppendingString:a3];
}

@end