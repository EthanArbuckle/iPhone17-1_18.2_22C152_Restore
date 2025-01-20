@interface AFSiriTaskmaster
+ (id)taskmasterForMachServiceForAppWithBundleIdentifier:(id)a3;
+ (id)taskmasterForMachServiceWithName:(id)a3;
+ (id)taskmasterForUIApplicationWithBundleIdentifier:(id)a3;
- (AFSiriTaskmaster)initWithTaskDeliverer:(id)a3;
- (AFSiriTaskmasterDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)description;
- (void)_handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5;
- (void)dealloc;
- (void)handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5;
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
- (void)handleSiriTaskUsageResult:(id)a3 fromRequest:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AFSiriTaskmaster

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_executorForRequest, 0);
  objc_storeStrong((id *)&self->_usageResultListener, 0);
  objc_storeStrong((id *)&self->_taskDeliverer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AFSiriTaskmasterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFSiriTaskmasterDelegate *)WeakRetained;
}

- (void)handleSiriTaskUsageResult:(id)a3 fromRequest:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F968F8];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [v8 _originatingAceID];
  [v9 setOriginalCommandId:v10];

  v11 = [v7 requestName];

  v16 = v11;
  v12 = [v8 _resultDescription];

  v17[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v9 setOutcomes:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained taskmaster:self didReceivePunchoutOutcome:v9];

  [(NSXPCListener *)self->_usageResultListener setDelegate:0];
  [(NSXPCListener *)self->_usageResultListener invalidate];
  usageResultListener = self->_usageResultListener;
  self->_usageResultListener = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__AFSiriTaskmaster_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_1E592C710;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

uint64_t __55__AFSiriTaskmaster_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEC2890];
  [v2 setExportedInterface:v3];

  [*(id *)(a1 + 32) setExportedObject:*(void *)(a1 + 40)];
  v4 = *(void **)(a1 + 32);
  return [v4 resume];
}

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AFSiriTaskmaster.m", 109, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v12 = +[AFAnalytics sharedAnalytics];
  [v12 logEventWithType:701 context:0];

  v13 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x19F3A50D0](v11);
    *(_DWORD *)buf = 136315650;
    v27 = "-[AFSiriTaskmaster handleSiriRequest:deliveryHandler:completionHandler:]";
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke;
  block[3] = &unk_1E5929050;
  id v22 = v9;
  v23 = self;
  id v24 = v10;
  id v25 = v11;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(queue, block);
}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [[AFSiriTaskExecution alloc] initWithRequest:*(void *)(a1 + 32) taskDeliverer:*(void *)(*(void *)(a1 + 40) + 16) usageResultListener:*(void *)(*(void *)(a1 + 40) + 24)];
  [*(id *)(*(void *)(a1 + 40) + 32) setObject:v2 forKey:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_2;
  v11[3] = &unk_1E592C6E8;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  [(AFSiriTaskExecution *)v2 setDeliveryHandler:v11];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_3;
  id v7 = &unk_1E5929028;
  uint64_t v8 = *(void *)(a1 + 40);
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 56);
  [(AFSiriTaskExecution *)v2 setCompletionHandler:&v4];
  v3 = +[AFAnalytics sharedAnalytics];
  [v3 logEventWithType:702 context:0];

  [(AFSiriTaskExecution *)v2 start];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  id v4 = +[AFAnalytics sharedAnalytics];
  [v4 logEventWithType:703 context:0];
  NSClassFromString(&cfstr_Stgenericinten.isa);
  if (objc_opt_isKindOfClass())
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "_af_analyticsContextDescription");
    [v4 logEventWithType:503 context:v2];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[AFAnalytics sharedAnalytics];
  [v7 logEventWithType:704 context:0];

  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_4;
  block[3] = &unk_1E5929000;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);

  objc_destroyWeak(&v16);
}

uint64_t __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:WeakRetained];
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  return MEMORY[0x1F4181820]();
}

- (NSString)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  id v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @" %p; ", self);
  [v3 appendString:@"taskDeliverer="];
  id v5 = [(AFSiriTaskDelivering *)self->_taskDeliverer description];
  [v3 appendString:v5];

  [v3 appendString:@", taskExecutions="];
  id v6 = NSAllMapTableValues(self->_executorForRequest);
  id v7 = [v6 description];
  [v3 appendString:v7];

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (void)handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[AFSiriTaskmaster handleFailureOfRequest:error:atTime:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s Unexpected failure %@ of request %@", buf, 0x20u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__AFSiriTaskmaster_handleFailureOfRequest_error_atTime___block_invoke;
  v14[3] = &unk_1E5929398;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a5;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

uint64_t __56__AFSiriTaskmaster_handleFailureOfRequest_error_atTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFailureOfRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48) atTime:*(void *)(a1 + 56)];
}

- (void)_handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMapTable *)self->_executorForRequest objectForKey:v8];
  id v11 = v10;
  if (v10)
  {
    [v10 handleFailureOfRequest:v8 error:v9 atTime:a5];
  }
  else
  {
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[AFSiriTaskmaster _handleFailureOfRequest:error:atTime:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s No execution for this request, it can not be failed %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->_usageResultListener setDelegate:0];
  [(NSXPCListener *)self->_usageResultListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFSiriTaskmaster;
  [(AFSiriTaskmaster *)&v3 dealloc];
}

- (AFSiriTaskmaster)initWithTaskDeliverer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriTaskmaster;
  id v6 = [(AFSiriTaskmaster *)&v15 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("Siri Taskmaster", v7);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_taskDeliverer, a3);
    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    executorForRequest = v6->_executorForRequest;
    v6->_executorForRequest = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F29290] anonymousListener];
    usageResultListener = v6->_usageResultListener;
    v6->_usageResultListener = (NSXPCListener *)v12;

    [(NSXPCListener *)v6->_usageResultListener setDelegate:v6];
    [(NSXPCListener *)v6->_usageResultListener resume];
  }

  return v6;
}

+ (id)taskmasterForUIApplicationWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"AFUIApplicationSiriTaskDeliverer.m", 385, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v6 = [[AFUIApplicationSiriTaskDeliverer alloc] initWithAppBundleIdentifier:v5];
  id v7 = (void *)[objc_alloc((Class)a1) initWithTaskDeliverer:v6];
  [(AFUIApplicationSiriTaskDeliverer *)v6 setTaskmaster:v7];

  return v7;
}

+ (id)taskmasterForMachServiceForAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = +[AFMachServiceSiriTaskDeliverer machServiceSiriTaskDelivererForAppWithBundleIdentifier:v4];

  id v7 = (void *)[v5 initWithTaskDeliverer:v6];
  return v7;
}

+ (id)taskmasterForMachServiceWithName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [[AFMachServiceSiriTaskDeliverer alloc] initWithMachServiceName:v4];

  id v7 = (void *)[v5 initWithTaskDeliverer:v6];
  return v7;
}

@end