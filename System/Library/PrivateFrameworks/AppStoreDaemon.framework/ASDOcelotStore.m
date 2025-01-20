@interface ASDOcelotStore
+ (id)interface;
- (ASDOcelotStore)init;
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppPayoutEventsWithCompletionBlock:(id)a3;
- (void)getAppSummaryEventsWithCompletionBlock:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetPayoutWithCompletionBlock:(id)a3;
- (void)resetSummaryWithCompletionBlock:(id)a3;
- (void)sbsyncIfSubscribedWithAccount:(id)a3 completionBlock:(id)a4;
- (void)sbsyncWithCompletionBlock:(id)a3;
- (void)sbsyncWithDuration:(id)a3 completionBlock:(id)a4;
- (void)sendPayoutWithCompletionBlock:(id)a3;
- (void)sendSummaryWithCompletionBlock:(id)a3;
- (void)showUpsellForItemID:(id)a3 completionBlock:(id)a4;
- (void)subscriptionDetailsWithCompletionBlock:(id)a3;
- (void)subscriptionStateWithCompletionBlock:(id)a3;
- (void)topAppsForAccount:(id)a3 completionBlock:(id)a4;
@end

@implementation ASDOcelotStore

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BD38];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAppPayoutEventsWithCompletionBlock_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getAppSummaryEventsWithCompletionBlock_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_subscriptionDetailsWithCompletionBlock_ argumentIndex:0 ofReply:1];

  return v2;
}

- (ASDOcelotStore)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDOcelotStore;
    v5 = [(ASDOcelotStore *)&v7 init];
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
  v9[2] = __50__ASDOcelotStore_flushMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __50__ASDOcelotStore_flushMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__ASDOcelotStore_flushMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__ASDOcelotStore_flushMetricsWithCompletionBlock___block_invoke_3;
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

uint64_t __50__ASDOcelotStore_flushMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__ASDOcelotStore_flushMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppPayoutEventsWithCompletionBlock:(id)a3
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
  v9[2] = __56__ASDOcelotStore_getAppPayoutEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __56__ASDOcelotStore_getAppPayoutEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__ASDOcelotStore_getAppPayoutEventsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__ASDOcelotStore_getAppPayoutEventsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2D30;
    id v7 = *(id *)(a1 + 32);
    [v4 getAppPayoutEventsWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __56__ASDOcelotStore_getAppPayoutEventsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__ASDOcelotStore_getAppPayoutEventsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppSummaryEventsWithCompletionBlock:(id)a3
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
  v9[2] = __57__ASDOcelotStore_getAppSummaryEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __57__ASDOcelotStore_getAppSummaryEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__ASDOcelotStore_getAppSummaryEventsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__ASDOcelotStore_getAppSummaryEventsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2D30;
    id v7 = *(id *)(a1 + 32);
    [v4 getAppSummaryEventsWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __57__ASDOcelotStore_getAppSummaryEventsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__ASDOcelotStore_getAppSummaryEventsWithCompletionBlock___block_invoke_3(uint64_t a1)
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
  v9[2] = __52__ASDOcelotStore_recordLaunchesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __52__ASDOcelotStore_recordLaunchesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__ASDOcelotStore_recordLaunchesWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__ASDOcelotStore_recordLaunchesWithCompletionBlock___block_invoke_3;
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

uint64_t __52__ASDOcelotStore_recordLaunchesWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__ASDOcelotStore_recordLaunchesWithCompletionBlock___block_invoke_3(uint64_t a1)
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
  v9[2] = __51__ASDOcelotStore_recordMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __51__ASDOcelotStore_recordMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__ASDOcelotStore_recordMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__ASDOcelotStore_recordMetricsWithCompletionBlock___block_invoke_3;
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

uint64_t __51__ASDOcelotStore_recordMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__ASDOcelotStore_recordMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
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
  v13[2] = __49__ASDOcelotStore_reportAppEvent_completionBlock___block_invoke;
  v13[3] = &unk_1E58B2D58;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v13];
}

void __49__ASDOcelotStore_reportAppEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__ASDOcelotStore_reportAppEvent_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__ASDOcelotStore_reportAppEvent_completionBlock___block_invoke_3;
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

uint64_t __49__ASDOcelotStore_reportAppEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__ASDOcelotStore_reportAppEvent_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetSummaryWithCompletionBlock:(id)a3
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
  v9[2] = __50__ASDOcelotStore_resetSummaryWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __50__ASDOcelotStore_resetSummaryWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__ASDOcelotStore_resetSummaryWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__ASDOcelotStore_resetSummaryWithCompletionBlock___block_invoke_3;
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

uint64_t __50__ASDOcelotStore_resetSummaryWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__ASDOcelotStore_resetSummaryWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetPayoutWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetPayoutWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__ASDOcelotStore_resetPayoutWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __49__ASDOcelotStore_resetPayoutWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__ASDOcelotStore_resetPayoutWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__ASDOcelotStore_resetPayoutWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 resetPayoutWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __49__ASDOcelotStore_resetPayoutWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__ASDOcelotStore_resetPayoutWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sbsyncIfSubscribedWithAccount:(id)a3 completionBlock:(id)a4
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sbsyncIfSubscribedWithAccount", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ASDOcelotStore_sbsyncIfSubscribedWithAccount_completionBlock___block_invoke;
  v13[3] = &unk_1E58B2D58;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v13];
}

void __64__ASDOcelotStore_sbsyncIfSubscribedWithAccount_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__ASDOcelotStore_sbsyncIfSubscribedWithAccount_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__ASDOcelotStore_sbsyncIfSubscribedWithAccount_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2CE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 sbsyncIfSubscribedWithAccount:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __64__ASDOcelotStore_sbsyncIfSubscribedWithAccount_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__ASDOcelotStore_sbsyncIfSubscribedWithAccount_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sbsyncWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sbsyncWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ASDOcelotStore_sbsyncWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __44__ASDOcelotStore_sbsyncWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__ASDOcelotStore_sbsyncWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__ASDOcelotStore_sbsyncWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 sbsyncWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __44__ASDOcelotStore_sbsyncWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__ASDOcelotStore_sbsyncWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sbsyncWithDuration:(id)a3 completionBlock:(id)a4
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sbsyncWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ASDOcelotStore_sbsyncWithDuration_completionBlock___block_invoke;
  v13[3] = &unk_1E58B2D58;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v13];
}

void __53__ASDOcelotStore_sbsyncWithDuration_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__ASDOcelotStore_sbsyncWithDuration_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__ASDOcelotStore_sbsyncWithDuration_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2CE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 sbsyncWithDuration:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __53__ASDOcelotStore_sbsyncWithDuration_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__ASDOcelotStore_sbsyncWithDuration_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendSummaryWithCompletionBlock:(id)a3
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
  v9[2] = __49__ASDOcelotStore_sendSummaryWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __49__ASDOcelotStore_sendSummaryWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__ASDOcelotStore_sendSummaryWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__ASDOcelotStore_sendSummaryWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 sendSummaryMetricsWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __49__ASDOcelotStore_sendSummaryWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__ASDOcelotStore_sendSummaryWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendPayoutWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sendPayoutWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ASDOcelotStore_sendPayoutWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __48__ASDOcelotStore_sendPayoutWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__ASDOcelotStore_sendPayoutWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__ASDOcelotStore_sendPayoutWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 sendPayoutMetricsWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __48__ASDOcelotStore_sendPayoutWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__ASDOcelotStore_sendPayoutWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showUpsellForItemID:(id)a3 completionBlock:(id)a4
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] showUpsellForItemID", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__ASDOcelotStore_showUpsellForItemID_completionBlock___block_invoke;
  v13[3] = &unk_1E58B2D58;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v13];
}

void __54__ASDOcelotStore_showUpsellForItemID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__ASDOcelotStore_showUpsellForItemID_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__ASDOcelotStore_showUpsellForItemID_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2CE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 showUpsellForItemID:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __54__ASDOcelotStore_showUpsellForItemID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__ASDOcelotStore_showUpsellForItemID_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionDetailsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] subscriptionDetailsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ASDOcelotStore_subscriptionDetailsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __57__ASDOcelotStore_subscriptionDetailsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__ASDOcelotStore_subscriptionDetailsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__ASDOcelotStore_subscriptionDetailsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2D80;
    id v7 = *(id *)(a1 + 32);
    [v4 subscriptionDetailsWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __57__ASDOcelotStore_subscriptionDetailsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__ASDOcelotStore_subscriptionDetailsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionStateWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] subscriptionStateWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ASDOcelotStore_subscriptionStateWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B2D08;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v9];
}

void __55__ASDOcelotStore_subscriptionStateWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__ASDOcelotStore_subscriptionStateWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ASDOcelotStore_subscriptionStateWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 subscriptionStateWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __55__ASDOcelotStore_subscriptionStateWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__ASDOcelotStore_subscriptionStateWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)topAppsForAccount:(id)a3 completionBlock:(id)a4
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] topAppsForAccount", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ASDOcelotStore_topAppsForAccount_completionBlock___block_invoke;
  v13[3] = &unk_1E58B2D58;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getOcelotServiceWithCompletionHandler:v13];
}

void __52__ASDOcelotStore_topAppsForAccount_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__ASDOcelotStore_topAppsForAccount_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__ASDOcelotStore_topAppsForAccount_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2D30;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 topAppsForAccount:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __52__ASDOcelotStore_topAppsForAccount_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__ASDOcelotStore_topAppsForAccount_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end