@interface ASDCrossfireStore
+ (id)interface;
- (ASDCrossfireStore)init;
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppEventsWithCompletionBlock:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetMetricsWithCompletionBlock:(id)a3;
- (void)sendMetricsWithCompletionBlock:(id)a3;
@end

@implementation ASDCrossfireStore

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BF78];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAppEventsWithCompletionBlock_ argumentIndex:0 ofReply:1];

  return v2;
}

- (ASDCrossfireStore)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDCrossfireStore;
    v5 = [(ASDCrossfireStore *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
    }
  }

  return self;
}

- (void)flushMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] flushMetricsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ASDCrossfireStore_flushMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B3988;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v9];
}

void __53__ASDCrossfireStore_flushMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__ASDCrossfireStore_flushMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__ASDCrossfireStore_flushMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 flushMetricsWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __53__ASDCrossfireStore_flushMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__ASDCrossfireStore_flushMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppEventsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] getAppEventsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ASDCrossfireStore_getAppEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B3988;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v9];
}

void __53__ASDCrossfireStore_getAppEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__ASDCrossfireStore_getAppEventsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__ASDCrossfireStore_getAppEventsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2D30;
    id v7 = *(id *)(a1 + 32);
    [v4 getAppEventsWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __53__ASDCrossfireStore_getAppEventsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__ASDCrossfireStore_getAppEventsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recordLaunchesWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordLaunchesWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ASDCrossfireStore_recordLaunchesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B3988;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v9];
}

void __55__ASDCrossfireStore_recordLaunchesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__ASDCrossfireStore_recordLaunchesWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ASDCrossfireStore_recordLaunchesWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 recordLaunchesWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __55__ASDCrossfireStore_recordLaunchesWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__ASDCrossfireStore_recordLaunchesWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recordMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordMetricsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ASDCrossfireStore_recordMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B3988;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v9];
}

void __54__ASDCrossfireStore_recordMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__ASDCrossfireStore_recordMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__ASDCrossfireStore_recordMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 recordMetricsWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __54__ASDCrossfireStore_recordMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__ASDCrossfireStore_recordMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportAppEvent:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] reportAppEvent", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ASDCrossfireStore_reportAppEvent_completionBlock___block_invoke;
  v13[3] = &unk_1E58B39B0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v13];
}

void __52__ASDCrossfireStore_reportAppEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__ASDCrossfireStore_reportAppEvent_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__ASDCrossfireStore_reportAppEvent_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2CE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 reportAppEvent:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __52__ASDCrossfireStore_reportAppEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__ASDCrossfireStore_reportAppEvent_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetMetricsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ASDCrossfireStore_resetMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B3988;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v9];
}

void __53__ASDCrossfireStore_resetMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__ASDCrossfireStore_resetMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__ASDCrossfireStore_resetMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 resetMetricsWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __53__ASDCrossfireStore_resetMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__ASDCrossfireStore_resetMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMetricsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sendMetricsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ASDCrossfireStore_sendMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B3988;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getCrossfireServiceWithCompletionHandler:v9];
}

void __52__ASDCrossfireStore_sendMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__ASDCrossfireStore_sendMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__ASDCrossfireStore_sendMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 sendMetricsWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __52__ASDCrossfireStore_sendMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__ASDCrossfireStore_sendMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end