@interface ASDPersonalizationStore
+ (id)interface;
+ (id)sharedInstance;
- (ASDPersonalizationStore)init;
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppEventsWithCompletionBlock:(id)a3;
- (void)getClusterMappingsWithCompletionBlock:(id)a3;
- (void)getGroupingToken:(id)a3;
- (void)getTasteProfileToken:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reloadClusterMappingsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetActorIDWithCompletionBlock:(id)a3;
- (void)resetMetricsWithCompletionBlock:(id)a3;
- (void)sendMetricsWithCompletionBlock:(id)a3;
- (void)setClusterMapping:(id)a3 completionBlock:(id)a4;
- (void)setClusterMappings:(id)a3 completionBlock:(id)a4;
- (void)tasteProfileFeatureEnabled:(id)a3;
@end

@implementation ASDPersonalizationStore

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C638];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getClusterMappingsWithCompletionBlock_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getAppEventsWithCompletionBlock_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_setClusterMappings_completionBlock_ argumentIndex:0 ofReply:0];

  return v2;
}

- (ASDPersonalizationStore)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDPersonalizationStore;
    v5 = [(ASDPersonalizationStore *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
    }
  }

  return self;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ASDPersonalizationStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6608 != -1) {
    dispatch_once(&qword_1EB4D6608, block);
  }
  v2 = (void *)_MergedGlobals_52;
  return v2;
}

uint64_t __41__ASDPersonalizationStore_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_52 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
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
  v9[2] = __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_3;
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

uint64_t __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getClusterMappingsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getClusterMappingsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2D30;
    id v7 = *(id *)(a1 + 32);
    [v4 getClusterMappingsWithCompletionBlock:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTasteProfileToken:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getTasteProfileToken", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_3;
    v6[3] = &unk_1E58B4B40;
    id v7 = *(id *)(a1 + 32);
    [v4 getGroupingToken:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getGroupingToken:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getGroupingToken", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ASDPersonalizationStore_getGroupingToken___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __44__ASDPersonalizationStore_getGroupingToken___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__ASDPersonalizationStore_getGroupingToken___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__ASDPersonalizationStore_getGroupingToken___block_invoke_3;
    v6[3] = &unk_1E58B4B40;
    id v7 = *(id *)(a1 + 32);
    [v4 getGroupingToken:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __44__ASDPersonalizationStore_getGroupingToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__ASDPersonalizationStore_getGroupingToken___block_invoke_3(uint64_t a1)
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
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] getPersonalizationEventsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_3;
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

uint64_t __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_3(uint64_t a1)
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
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordLaunchesCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_3;
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

uint64_t __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_3(uint64_t a1)
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
  v9[2] = __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_3;
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

uint64_t __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reportAppEvent", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke;
  v13[3] = &unk_1E58B4B68;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v13];
}

void __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_3;
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

uint64_t __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetActorIDWithCompletionBlock:(id)a3
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
  v9[2] = __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 resetActorIDWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadClusterMappingsWithCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: resetMetricsWithCompletionBlock", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 reloadClusterMappingsWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_3(uint64_t a1)
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
  v9[2] = __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_3;
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

uint64_t __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
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
  v9[2] = __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_3;
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

uint64_t __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setClusterMapping:(id)a3 completionBlock:(id)a4
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: setClusterMapping", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke;
  v13[3] = &unk_1E58B4B68;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v13];
}

void __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2CE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 setClusterMapping:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setClusterMappings:(id)a3 completionBlock:(id)a4
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
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: setClusterMappings", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke;
  v13[3] = &unk_1E58B4B68;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v13];
}

void __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_3;
    v7[3] = &unk_1E58B2CE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 setClusterMappings:v5 completionBlock:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tasteProfileFeatureEnabled:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Taste profile enabled", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke;
  v9[3] = &unk_1E58B4B18;
  id v10 = v4;
  id v8 = v4;
  [(ASDServiceBroker *)serviceBroker getPersonalizationServiceWithCompletionHandler:v9];
}

void __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_3;
    v6[3] = &unk_1E58B2CE0;
    id v7 = *(id *)(a1 + 32);
    [v4 tasteProfileFeatureEnabledWithCompletionBlock:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

uint64_t __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end