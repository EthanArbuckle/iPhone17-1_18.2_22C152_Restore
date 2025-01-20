@interface ASDAppMetricsService
+ (id)defaultService;
+ (id)interface;
- (ASDAppMetricsService)init;
- (id)_initWithServiceBroker:(id)a3;
- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
@end

@implementation ASDAppMetricsService

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BD98];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getMetricsEventsForType_withReplyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

- (ASDAppMetricsService)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  uint64_t v4 = [(ASDAppMetricsService *)self _initWithServiceBroker:v3];

  return v4;
}

+ (id)defaultService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ASDAppMetricsService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6420 != -1) {
    dispatch_once(&qword_1EB4D6420, block);
  }
  v2 = (void *)_MergedGlobals_24;
  return v2;
}

uint64_t __38__ASDAppMetricsService_defaultService__block_invoke(uint64_t a1)
{
  _MergedGlobals_24 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (id)_initWithServiceBroker:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDAppMetricsService;
  v5 = [(ASDAppMetricsService *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_serviceBroker, v4);
  }

  return v6;
}

- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  v7 = +[ASDServiceBroker defaultBroker];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E58B3090;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getAppMetricsServiceWithCompletionHandler:v9];
}

void __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2;
    v13[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2;
    v11[3] = &unk_1E58B2D30;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v7 getMetricsEventsForType:v8 withReplyHandler:v11];
  }
  else
  {
    v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v5;
      id v10 = v16;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get results due to error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get events due to error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2_3;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  int v7 = +[ASDServiceBroker defaultBroker];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E58B3090;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getAppMetricsServiceWithCompletionHandler:v9];
}

void __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2;
    v13[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    int v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_6;
    v11[3] = &unk_1E58B2CE0;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v7 postMetricsEventsForType:v8 withReplyHandler:v11];
  }
  else
  {
    id v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v5;
      id v10 = v16;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post due to error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post due to error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2_7;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[ASDServiceBroker defaultBroker];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E58B3090;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getAppMetricsServiceWithCompletionHandler:v9];
}

void __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2;
    v13[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_9;
    v11[3] = &unk_1E58B2CE0;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v7 recordMetricsEventsForType:v8 withReplyHandler:v11];
  }
  else
  {
    __int16 v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v5;
      id v10 = v16;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to record due to error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to record due to error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2_10;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[ASDServiceBroker defaultBroker];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E58B3090;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getAppMetricsServiceWithCompletionHandler:v9];
}

void __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2;
    v13[3] = &unk_1E58B3040;
    id v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_11;
    v11[3] = &unk_1E58B2CE0;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v7 resetMetricsEventsForType:v8 withReplyHandler:v11];
  }
  else
  {
    __int16 v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v5;
      id v10 = v16;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to reset due to error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to reset due to error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3, v5);
}

void __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_11(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2_12;
  block[3] = &unk_1E58B30B8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end