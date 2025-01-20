@interface ASDServiceBroker
+ (id)defaultBroker;
+ (id)interface;
+ (id)newBrokerForMachServiceName:(id)a3;
- (ASDServiceBroker)initWithMachServiceName:(id)a3;
- (id)getCapabilitiesServiceWithError:(id *)a3;
- (id)getClipServiceWithError:(id *)a3;
- (id)getDiagnosticServiceWithError:(id *)a3;
- (id)getFairPlayServiceWithError:(id *)a3;
- (id)getIAPHistoryServiceWithError:(id *)a3;
- (id)getInstallAttributionServiceWithError:(id *)a3;
- (id)getInstallationServiceWithError:(id *)a3;
- (id)getLibraryServiceWithError:(id *)a3;
- (id)getManagedAppServiceWithError:(id *)a3;
- (id)getPurchaseHistoryServiceWithError:(id *)a3;
- (id)getPurchaseServiceWithError:(id *)a3;
- (id)getRepairServiceWithError:(id *)a3;
- (id)getStoreKitExternalNotificationServiceWithError:(id *)a3;
- (id)getTestFlightFeedbackServiceWithError:(id *)a3;
- (id)getUpdatesServiceWithError:(id *)a3;
- (void)_connect;
- (void)_remoteObjectProxyWithErrorHandler:(void *)a1;
- (void)_synchronousRemoteObjectProxyWithErrorHandler:(void *)a1;
- (void)dealloc;
- (void)getAppMetricsServiceWithCompletionHandler:(id)a3;
- (void)getAppStoreServiceWithCompletionHandler:(id)a3;
- (void)getClipServiceWithCompletionHandler:(id)a3;
- (void)getCrossfireServiceWithCompletionHandler:(id)a3;
- (void)getDiagnosticServiceWithCompletionHandler:(id)a3;
- (void)getIAPHistoryServiceWithCompletionHandler:(id)a3;
- (void)getInstallAttributionServiceWithCompletionHandler:(id)a3;
- (void)getInstallWebAttributionServiceWithCompletionHandler:(id)a3;
- (void)getInstallationServiceWithCompletionHandler:(id)a3;
- (void)getLibraryServiceWithCompletionHandler:(id)a3;
- (void)getManagedAppServiceWithCompletionHandler:(id)a3;
- (void)getOcelotServiceWithCompletionHandler:(id)a3;
- (void)getPersonalizationServiceWithCompletionHandler:(id)a3;
- (void)getPurchaseHistoryServiceWithCompletionHandler:(id)a3;
- (void)getPurchaseServiceWithCompletionHandler:(id)a3;
- (void)getRepairServiceWithCompletionHandler:(id)a3;
- (void)getRestoreServiceWithCompletionHandler:(id)a3;
- (void)getSKANInteropServiceWithCompletionHandler:(id)a3;
- (void)getSkannerServiceWithCompletionHandler:(id)a3;
- (void)getTestFlightFeedbackServiceWithCompletionHandler:(id)a3;
- (void)getUpdatesServiceWithCompletionHandler:(id)a3;
- (void)setSupportedNotificationDelivery:(id)a3;
@end

@implementation ASDServiceBroker

- (void)getAppStoreServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ASDServiceBroker_getAppStoreServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getAppStoreServiceWithReplyHandler:v5];
}

- (void)getUpdatesServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getUpdatesServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getUpdatesServiceWithReplyHandler:v5];
}

- (void)getIAPHistoryServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getIAPHistoryServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getIAPHistoryServiceWithReplyHandler:v5];
}

- (void)_remoteObjectProxyWithErrorHandler:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4;
    v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    id v5 = a1[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__ASDServiceBroker__remoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E58B3E98;
    v12 = &v13;
    block[4] = a1;
    id v6 = v3;
    id v11 = v6;
    dispatch_sync(v5, block);
    v7 = (void *)v14[5];
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDServiceBrokerErrorDomain" code:0 userInfo:0];
      (*((void (**)(id, void *))v6 + 2))(v6, v8);

      v7 = (void *)v14[5];
    }
    a1 = v7;

    _Block_object_dispose(&v13, 8);
  }

  return a1;
}

+ (id)defaultBroker
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ASDServiceBroker_defaultBroker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D64B8 != -1) {
    dispatch_once(&qword_1EB4D64B8, block);
  }
  v2 = (void *)_MergedGlobals_32;
  return v2;
}

uint64_t __33__ASDServiceBroker_defaultBroker__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  self;
  _MergedGlobals_32 = [v1 newBrokerForMachServiceName:@"com.apple.appstored.xpc"];
  return MEMORY[0x1F41817F8]();
}

+ (id)newBrokerForMachServiceName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:v4];

  return v5;
}

- (ASDServiceBroker)initWithMachServiceName:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDServiceBroker;
  id v6 = [(ASDServiceBroker *)&v14 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDServiceBroker", v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_machServiceName, a3);
    -[ASDServiceBroker _connect]((uint64_t)v6);
    v10 = v6->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__ASDServiceBroker_initWithMachServiceName___block_invoke;
    handler[3] = &unk_1E58B3C10;
    uint64_t v13 = v6;
    notify_register_dispatch("com.apple.appstored.serviceBrokerAvailable", &v6->_token, v10, handler);
  }
  return v6;
}

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C098];
  id v3 = +[ASDPersonalizationStore interface];
  [v2 setInterface:v3 forSelector:sel_getPersonalizationServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v4 = +[ASDAppStoreService interface];
  [v2 setInterface:v4 forSelector:sel_getAppStoreServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v5 = +[ASDIAPHistory interface];
  [v2 setInterface:v5 forSelector:sel_getIAPHistoryServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v6 = +[ASDAppCapabilities interface];
  [v2 setInterface:v6 forSelector:sel_getAppCapabilitiesServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v7 = +[ASDAppLibrary interface];
  [v2 setInterface:v7 forSelector:sel_getLibraryServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  dispatch_queue_t v8 = +[ASDUpdatesService interface];
  [v2 setInterface:v8 forSelector:sel_getUpdatesServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v9 = +[ASDClipService interface];
  [v2 setInterface:v9 forSelector:sel_getClipServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v10 = +[ASDCrossfireStore interface];
  [v2 setInterface:v10 forSelector:sel_getCrossfireServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v11 = +[ASDTestFlightFeedback interface];
  [v2 setInterface:v11 forSelector:sel_getTestFlightFeedbackServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v12 = +[ASDManagedAppService interface];
  [v2 setInterface:v12 forSelector:sel_getManagedAppServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  uint64_t v13 = +[ASDOcelotStore interface];
  [v2 setInterface:v13 forSelector:sel_getOcelotServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  objc_super v14 = +[ASDDiagnosticService interface];
  [v2 setInterface:v14 forSelector:sel_getDiagnosticServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  uint64_t v15 = +[ASDFairPlayService interface];
  [v2 setInterface:v15 forSelector:sel_getFairPlayServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v16 = +[ASDInstallApps interface];
  [v2 setInterface:v16 forSelector:sel_getInstallationServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v17 = +[ASDInstallAttribution interface];
  [v2 setInterface:v17 forSelector:sel_getInstallAttributionServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v18 = +[ASDInstallWebAttributionService interface];
  [v2 setInterface:v18 forSelector:sel_getInstallWebAttributionServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v19 = +[SKANInteropService interface];
  [v2 setInterface:v19 forSelector:sel_getSKANInteropServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v20 = +[ASDAppMetricsService interface];
  [v2 setInterface:v20 forSelector:sel_getMetricsServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v21 = +[ASDPurchaseHistory interface];
  [v2 setInterface:v21 forSelector:sel_getPurchaseHistoryServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v22 = +[ASDPurchaseManager interface];
  [v2 setInterface:v22 forSelector:sel_getPurchaseServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v23 = +[ASDRepairService interface];
  [v2 setInterface:v23 forSelector:sel_getRepairServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v24 = +[ASDRestoreService interface];
  [v2 setInterface:v24 forSelector:sel_getRestoreServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v25 = +[ASDSkannerService interface];
  [v2 setInterface:v25 forSelector:sel_getSkannerServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  v26 = +[ASDStoreKitExternalNotificationSheet interface];
  [v2 setInterface:v26 forSelector:sel_getStoreKitExternalNotificationServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)_connect
{
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:*(void *)(a1 + 24) options:0];
      id v3 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v2;

      [*(id *)(a1 + 8) _setQueue:*(void *)(a1 + 16)];
      id v4 = *(void **)(a1 + 8);
      id v5 = [(id)objc_opt_class() interface];
      [v4 setRemoteObjectInterface:v5];

      id v6 = *(void **)(a1 + 8);
      v7 = +[ASDNotificationCenter defaultCenter];
      [v6 setExportedObject:v7];

      dispatch_queue_t v8 = *(void **)(a1 + 8);
      v9 = +[ASDNotificationCenter interface];
      [v8 setExportedInterface:v9];

      [*(id *)(a1 + 8) setInterruptionHandler:&__block_literal_global_9];
      v10 = *(void **)(a1 + 8);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __28__ASDServiceBroker__connect__block_invoke_5;
      v12[3] = &unk_1E58B2EB8;
      v12[4] = a1;
      [v10 setInvalidationHandler:v12];
      [*(id *)(a1 + 8) resume];
    }
    else
    {
      id v11 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Connection failed: No mach service name provided", buf, 2u);
      }
    }
  }
}

uint64_t __55__ASDServiceBroker__remoteObjectProxyWithErrorHandler___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) remoteObjectProxyWithErrorHandler:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)getLibraryServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getLibraryServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  id v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getLibraryServiceWithReplyHandler:v5];
}

uint64_t __66__ASDServiceBroker__synchronousRemoteObjectProxyWithErrorHandler___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) synchronousRemoteObjectProxyWithErrorHandler:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)getPurchaseHistoryServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ASDServiceBroker_getPurchaseHistoryServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  id v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getPurchaseHistoryServiceWithReplyHandler:v5];
}

- (void)setSupportedNotificationDelivery:(id)a3
{
  id v4 = a3;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, &__block_literal_global_170);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setSupportedNotificationDelivery:v4];
}

- (void)_synchronousRemoteObjectProxyWithErrorHandler:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v13 = 0;
    objc_super v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4;
    v17 = __Block_byref_object_dispose__4;
    id v18 = 0;
    id v5 = a1[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__ASDServiceBroker__synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E58B3E98;
    v12 = &v13;
    block[4] = a1;
    id v6 = v3;
    id v11 = v6;
    dispatch_sync(v5, block);
    v7 = (void *)v14[5];
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDServiceBrokerErrorDomain" code:0 userInfo:0];
      (*((void (**)(id, void *))v6 + 2))(v6, v8);

      v7 = (void *)v14[5];
    }
    a1 = v7;

    _Block_object_dispose(&v13, 8);
  }

  return a1;
}

void __44__ASDServiceBroker_initWithMachServiceName___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Reconnecting after receiving notification", v4, 2u);
    }

    -[ASDServiceBroker _connect](*(void *)(a1 + 32));
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:ASDServiceBrokerConnectedNotification object:*(void *)(a1 + 32)];
}

void __28__ASDServiceBroker__connect__block_invoke()
{
  v0 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_19BF6A000, v0, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Connection interrupted", v1, 2u);
  }
}

void __28__ASDServiceBroker__connect__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Connection invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)ASDServiceBroker;
  [(ASDServiceBroker *)&v3 dealloc];
}

- (id)getCapabilitiesServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3C40;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getAppCapabilitiesServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getCrossfireServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ASDServiceBroker_getCrossfireServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getCrossfireServiceWithReplyHandler:v5];
}

uint64_t __61__ASDServiceBroker_getCrossfireServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getClipServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ASDServiceBroker_getClipServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getClipServiceWithReplyHandler:v5];
}

uint64_t __56__ASDServiceBroker_getClipServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getClipServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ASDServiceBroker_getClipServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ASDServiceBroker_getClipServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3C68;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getClipServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __44__ASDServiceBroker_getClipServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __44__ASDServiceBroker_getClipServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getDiagnosticServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3C90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getDiagnosticServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getDiagnosticServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getDiagnosticServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getDiagnosticServiceWithReplyHandler:v5];
}

uint64_t __62__ASDServiceBroker_getDiagnosticServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getFairPlayServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3CB8;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getFairPlayServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getIAPHistoryServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3CE0;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getIAPHistoryServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __62__ASDServiceBroker_getIAPHistoryServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getInstallationServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3D08;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getInstallationServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getInstallationServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ASDServiceBroker_getInstallationServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getInstallationServiceWithReplyHandler:v5];
}

uint64_t __64__ASDServiceBroker_getInstallationServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getInstallAttributionServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3D30;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getInstallAttributionServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getInstallAttributionServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ASDServiceBroker_getInstallAttributionServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getInstallAttributionServiceWithReplyHandler:v5];
}

uint64_t __70__ASDServiceBroker_getInstallAttributionServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getInstallWebAttributionServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ASDServiceBroker_getInstallWebAttributionServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getInstallWebAttributionServiceWithReplyHandler:v5];
}

uint64_t __73__ASDServiceBroker_getInstallWebAttributionServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSKANInteropServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ASDServiceBroker_getSKANInteropServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getSKANInteropServiceWithReplyHandler:v5];
}

uint64_t __63__ASDServiceBroker_getSKANInteropServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getLibraryServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3D58;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getLibraryServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __59__ASDServiceBroker_getLibraryServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getManagedAppServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3D80;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getManagedAppServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getManagedAppServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getManagedAppServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getManagedAppServiceWithReplyHandler:v5];
}

uint64_t __62__ASDServiceBroker_getManagedAppServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOcelotServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ASDServiceBroker_getOcelotServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getOcelotServiceWithReplyHandler:v5];
}

uint64_t __58__ASDServiceBroker_getOcelotServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPersonalizationServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ASDServiceBroker_getPersonalizationServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getPersonalizationServiceWithReplyHandler:v5];
}

uint64_t __67__ASDServiceBroker_getPersonalizationServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPurchaseHistoryServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3DA8;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getPurchaseHistoryServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __67__ASDServiceBroker_getPurchaseHistoryServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPurchaseServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3DD0;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getPurchaseServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getAppMetricsServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getAppMetricsServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getMetricsServiceWithReplyHandler:v5];
}

uint64_t __62__ASDServiceBroker_getAppMetricsServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__ASDServiceBroker_getAppStoreServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPurchaseServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ASDServiceBroker_getPurchaseServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getPurchaseServiceWithReplyHandler:v5];
}

uint64_t __60__ASDServiceBroker_getPurchaseServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSkannerServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getSkannerServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getSkannerServiceWithReplyHandler:v5];
}

uint64_t __59__ASDServiceBroker_getSkannerServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getStoreKitExternalNotificationServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3DF8;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getStoreKitExternalNotificationServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getTestFlightFeedbackServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ASDServiceBroker_getTestFlightFeedbackServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getTestFlightFeedbackServiceWithReplyHandler:v5];
}

uint64_t __70__ASDServiceBroker_getTestFlightFeedbackServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getTestFlightFeedbackServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3E20;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getTestFlightFeedbackServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getUpdatesServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3E48;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getUpdatesServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getRepairServiceWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  objc_super v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ASDServiceBroker_getRepairServiceWithError___block_invoke;
  v9[3] = &unk_1E58B3108;
  v9[4] = &v16;
  id v4 = -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__ASDServiceBroker_getRepairServiceWithError___block_invoke_2;
  v8[3] = &unk_1E58B3E70;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 getRepairServiceWithReplyHandler:v8];

  id v5 = (void *)v11[5];
  if (a3 && !v5)
  {
    *a3 = (id) v17[5];
    id v5 = (void *)v11[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __46__ASDServiceBroker_getRepairServiceWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __46__ASDServiceBroker_getRepairServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getRepairServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ASDServiceBroker_getRepairServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getRepairServiceWithReplyHandler:v5];
}

uint64_t __58__ASDServiceBroker_getRepairServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRestoreServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getRestoreServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58B2CB8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  [v6 getRestoreServiceWithReplyHandler:v5];
}

uint64_t __59__ASDServiceBroker_getRestoreServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__ASDServiceBroker_getUpdatesServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__ASDServiceBroker_setSupportedNotificationDelivery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Sending supported notification delivery failed with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end