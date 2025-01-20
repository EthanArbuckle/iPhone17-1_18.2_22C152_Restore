@interface MediaServiceConfiguration
+ (id)sharedInstance;
- (BOOL)thirdPartyMusicAvailable:(id)a3;
- (MediaServiceConfiguration)initWithQueue:(id)a3;
- (MediaServiceConfigurationMediator)mediator;
- (MediaServiceUpdatedDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)_performBlock:(id)a3;
- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4;
- (void)addMediaService:(id)a3 toHomes:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)getAvailableServices:(id)a3 completion:(id)a4;
- (void)getCachedAvailableServices:(id)a3 completion:(id)a4;
- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 completion:(id)a5;
- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6;
- (void)getDefaultMediaService:(id)a3 completion:(id)a4;
- (void)getDefaultMediaServiceForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4;
- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5;
- (void)getServiceConfigurationInfo:(id)a3 completion:(id)a4;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)getSupportedThirdPartyMediaServices:(id)a3;
- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5;
- (void)removeServiceFromHome:(id)a3 fromHome:(id)a4 completion:(id)a5;
- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6;
- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMediator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVersion:(unint64_t)a3 completion:(id)a4;
- (void)switchUserAccountInfo:(id)a3 home:(id)a4 completion:(id)a5;
- (void)updateDefaultMediaService:(id)a3 forHome:(id)a4 completion:(id)a5;
- (void)updateProperty:(id)a3 forHome:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4;
- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4;
@end

@implementation MediaServiceConfiguration

- (MediaServiceConfiguration)initWithQueue:(id)a3
{
  id v5 = a3;
  v72.receiver = self;
  v72.super_class = (Class)MediaServiceConfiguration;
  v6 = [(MediaServiceConfiguration *)&v72 init];
  if (v6)
  {
    id v66 = v5;
    v7 = [[MediaServiceConfigurationMediator alloc] initWithServiceDelegate:v6];
    mediator = v6->_mediator;
    v6->_mediator = v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.mediasetupd.server" options:4096];
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v9;

    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D99B9A8];
    [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v11];

    v65 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D982598];
    -[NSXPCConnection setExportedInterface:](v6->_connection, "setExportedInterface:");
    [(NSXPCConnection *)v6->_connection setExportedObject:v6->_mediator];
    v12 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    [v12 setClasses:v15 forSelector:sel_addMediaService_usingSetupBundles_completion_ argumentIndex:1 ofReply:0];

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    [v19 setClasses:v18 forSelector:sel_getAvailableServices_userIdentifier_completion_ argumentIndex:0 ofReply:1];

    v20 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    [v20 setClasses:v18 forSelector:sel_getCachedAvailableServices_userIdentifier_completion_ argumentIndex:0 ofReply:1];

    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
    v26 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    [v26 setClasses:v25 forSelector:sel_getMediaServiceChoicesForAllUsers_ argumentIndex:0 ofReply:1];

    v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, objc_opt_class(), 0);
    v33 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    [v33 setClasses:v32 forSelector:sel_getServiceConfigurationInfo_serviceID_completion_ argumentIndex:0 ofReply:1];

    v34 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    [v34 setClasses:v32 forSelector:sel_getDefaultMediaServiceForAllUsers_ argumentIndex:0 ofReply:1];

    v35 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v36 = (void *)MEMORY[0x263EFFA08];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    [v35 setClasses:v38 forSelector:sel_getServiceConfigurationInfo_serviceID_completion_ argumentIndex:0 ofReply:0];

    v39 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v40 = (void *)MEMORY[0x263EFFA08];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    v43 = objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
    [v39 setClasses:v43 forSelector:sel_getPublicInfoForBundleID_completion_ argumentIndex:0 ofReply:1];

    v44 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v45 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v44 setClasses:v45 forSelector:sel_getResolvedServiceInfo_sharedUserID_completion_ argumentIndex:0 ofReply:1];

    v46 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v47 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    [v46 setClasses:v47 forSelector:sel_getResolvedServiceInfo_completion_ argumentIndex:0 ofReply:1];

    v48 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v49 = (void *)MEMORY[0x263EFFA08];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v49, "setWithObjects:", v50, v51, v52, objc_opt_class(), 0);
    [v48 setClasses:v53 forSelector:sel_activeServiceApplicationInformationForSharedUserID_completionHandler_ argumentIndex:0 ofReply:1];

    v54 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v55 = (void *)MEMORY[0x263EFFA08];
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    [v54 setClasses:v57 forSelector:sel_getSupportedThirdPartyMediaServices_ argumentIndex:0 ofReply:1];

    v58 = [(NSXPCConnection *)v6->_connection remoteObjectInterface];
    v59 = (void *)MEMORY[0x263EFFA08];
    uint64_t v60 = objc_opt_class();
    v61 = objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
    [v58 setClasses:v61 forSelector:sel_getMediaServiceChoicesForSharedUser_completion_ argumentIndex:0 ofReply:1];

    objc_initWeak(&location, v6);
    v62 = v6->_connection;
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __43__MediaServiceConfiguration_initWithQueue___block_invoke;
    v69[3] = &unk_264775700;
    objc_copyWeak(&v70, &location);
    [(NSXPCConnection *)v62 setInterruptionHandler:v69];
    v63 = v6->_connection;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __43__MediaServiceConfiguration_initWithQueue___block_invoke_126;
    v67[3] = &unk_264775700;
    objc_copyWeak(&v68, &location);
    [(NSXPCConnection *)v63 setInvalidationHandler:v67];
    [(NSXPCConnection *)v6->_connection resume];
    objc_destroyWeak(&v68);
    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);

    id v5 = v66;
  }

  return v6;
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke(uint64_t a1)
{
  v2 = _MSLogingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __43__MediaServiceConfiguration_initWithQueue___block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained delegate];
  [v4 connectionInterrupted];
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke_126(uint64_t a1)
{
  v2 = _MSLogingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __43__MediaServiceConfiguration_initWithQueue___block_invoke_126_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained delegate];
  [v4 connectionInvalidated];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MediaServiceConfiguration;
  [(MediaServiceConfiguration *)&v3 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MediaServiceConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)_sSharedInstance;

  return v2;
}

void __43__MediaServiceConfiguration_sharedInstance__block_invoke(uint64_t a1)
{
  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mediasetup.serviceconfig", v5);
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithQueue:v2];
  v4 = (void *)_sSharedInstance;
  _sSharedInstance = v3;
}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke;
    v25[3] = &unk_264775778;
    v10 = v7;
    v26 = v10;
    v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
    v12 = [v6 uniqueIdentifier];
    v13 = [v6 currentUser];
    uint64_t v14 = [v13 uniqueIdentifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_2;
    v23[3] = &unk_2647757C8;
    v23[4] = self;
    uint64_t v24 = v10;
    [v11 getAvailableServices:v12 userIdentifier:v14 completion:v23];

    v15 = v26;
  }
  else
  {
    v15 = _MSLogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getAvailableServices:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MSAnalytics sendUserRegisteredNumberOfServices:](MSAnalytics, "sendUserRegisteredNumberOfServices:", [v5 count]);
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_3;
    v9[3] = &unk_2647757A0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    [v8 _performBlock:v9];
  }
}

uint64_t __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCachedAvailableServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke;
    v25[3] = &unk_264775778;
    id v10 = v7;
    v26 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
    id v12 = [v6 uniqueIdentifier];
    v13 = [v6 currentUser];
    uint64_t v14 = [v13 uniqueIdentifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_2;
    v23[3] = &unk_2647757C8;
    v23[4] = self;
    uint64_t v24 = v10;
    [v11 getCachedAvailableServices:v12 userIdentifier:v14 completion:v23];

    v15 = v26;
  }
  else
  {
    v15 = _MSLogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getCachedAvailableServices:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_3;
    v9[3] = &unk_2647757A0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    [v8 _performBlock:v9];
  }
}

uint64_t __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)thirdPartyMusicAvailable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    connection = self->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke;
    v19[3] = &unk_2647757F0;
    v19[4] = &v20;
    id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v19];
    id v7 = [v4 uniqueIdentifier];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_134;
    v18[3] = &unk_264775818;
    v18[4] = &v20;
    [v6 thirdPartyMusicAvailable:v7 completion:v18];

    BOOL v8 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    uint64_t v9 = _MSLogingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration thirdPartyMusicAvailable:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v8 = 0;
  }

  return v8;
}

void __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MSLogingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_cold_1((uint64_t)v3, v4);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_134(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke;
    v28[3] = &unk_264775778;
    uint64_t v16 = v13;
    uint64_t v29 = v16;
    uint64_t v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_2;
    v26[3] = &unk_264775868;
    v26[4] = self;
    v27 = v16;
    [v17 getCachedServiceInfo:v10 homeUserID:v11 endpointID:v12 completion:v26];

    uint64_t v18 = v29;
  }
  else
  {
    uint64_t v18 = _MSLogingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getCachedServiceInfo:homeUserID:endpointID:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

uint64_t __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_3;
    v12[3] = &unk_264775840;
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    [v11 _performBlock:v12];
  }
}

uint64_t __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke;
    v28[3] = &unk_264775778;
    id v16 = v13;
    uint64_t v29 = v16;
    uint64_t v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_2;
    v26[3] = &unk_264775890;
    v26[4] = self;
    v27 = v16;
    [v17 requestAuthRenewalForMediaService:v10 homeUserID:v11 parentNetworkActivity:v12 completion:v26];

    uint64_t v18 = v29;
  }
  else
  {
    uint64_t v18 = _MSLogingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

uint64_t __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_3;
    v9[3] = &unk_2647757A0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    [v8 _performBlock:v9];
  }
}

uint64_t __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateDefaultMediaService:(id)a3 forHome:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke;
    v29[3] = &unk_264775778;
    id v13 = v10;
    uint64_t v30 = v13;
    id v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v29];
    id v15 = [v9 uniqueIdentifier];
    id v16 = [v9 currentUser];
    uint64_t v17 = [v16 uniqueIdentifier];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_2;
    v26[3] = &unk_2647758E0;
    uint64_t v28 = v13;
    v26[4] = self;
    id v27 = v8;
    [v14 updateDefaultMediaService:v27 homeID:v15 homeUserID:v17 completion:v26];

    uint64_t v18 = v30;
  }
  else
  {
    uint64_t v18 = _MSLogingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration updateDefaultMediaService:forHome:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

uint64_t __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_3;
    v12[3] = &unk_2647758B8;
    id v14 = v6;
    char v15 = a2;
    id v13 = v5;
    [v7 _performBlock:v12];
  }
  if (a2)
  {
    id v8 = [MSConfigurationEvent alloc];
    id v9 = [*(id *)(a1 + 40) serviceID];
    id v10 = [v9 UUIDString];
    id v11 = [(MSConfigurationEvent *)v8 initWithServiceId:v10];

    +[MSAnalytics sendConfigEvent:v11];
  }
}

uint64_t __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke;
    v25[3] = &unk_264775778;
    id v10 = v7;
    v26 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
    id v12 = [v6 uniqueIdentifier];
    id v13 = [v6 currentUser];
    id v14 = [v13 uniqueIdentifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_2;
    v23[3] = &unk_264775890;
    v23[4] = self;
    uint64_t v24 = v10;
    [v11 getDefaultMediaService:v12 homeUserID:v14 completion:v23];

    char v15 = v26;
  }
  else
  {
    char v15 = _MSLogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getDefaultMediaService:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_3;
    v9[3] = &unk_2647757A0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    [v8 _performBlock:v9];
  }
}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeServiceFromHome:(id)a3 fromHome:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke;
    v28[3] = &unk_264775778;
    id v13 = v10;
    uint64_t v29 = v13;
    id v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
    char v15 = [v9 uniqueIdentifier];
    uint64_t v16 = [v9 currentUser];
    uint64_t v17 = [v16 uniqueIdentifier];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_2;
    v26[3] = &unk_264775908;
    v26[4] = self;
    id v27 = v13;
    [v14 removeMediaService:v8 homeID:v15 homeUserID:v17 completion:v26];

    uint64_t v18 = v29;
  }
  else
  {
    uint64_t v18 = _MSLogingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration removeServiceFromHome:fromHome:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

uint64_t __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_3;
    v8[3] = &unk_2647758B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    [v7 _performBlock:v8];
  }
}

uint64_t __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)addMediaService:(id)a3 toHomes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = objc_msgSend(a4, "na_map:", &__block_literal_global_1);
    connection = self->_connection;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_2;
    v23[3] = &unk_264775778;
    id v12 = v9;
    id v24 = v12;
    id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v23];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_3;
    v21[3] = &unk_264775908;
    v21[4] = self;
    id v22 = v12;
    [v13 addMediaService:v8 usingSetupBundles:v10 completion:v21];
  }
  else
  {
    id v10 = _MSLogingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration addMediaService:toHomes:completion:](v10, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

MSSetupBundle *__64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MSSetupBundle alloc];
  id v4 = [v2 uniqueIdentifier];
  id v5 = [v2 currentUser];

  id v6 = [v5 uniqueIdentifier];
  id v7 = [(MSSetupBundle *)v3 initWithHomeID:v4 homeUserID:v6];

  return v7;
}

uint64_t __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_4;
    v8[3] = &unk_2647758B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    [v7 _performBlock:v8];
  }
}

uint64_t __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke;
    v22[3] = &unk_264775778;
    id v10 = v7;
    uint64_t v23 = v10;
    char v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_2;
    v20[3] = &unk_264775978;
    v20[4] = self;
    uint64_t v21 = v10;
    [v11 getPublicInfoForBundleID:v6 completion:v20];

    id v12 = v23;
  }
  else
  {
    id v12 = _MSLogingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getPublicInfoForBundleID:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_3;
    v6[3] = &unk_264775950;
    id v8 = v4;
    id v7 = v3;
    [v5 _performBlock:v6];
  }
}

uint64_t __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getServiceConfigurationInfo:(id)a3 completion:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"Please use updated API, getServiceConfigurationInfo:serviceID:completion";
    id v6 = NSDictionary;
    id v7 = a4;
    id v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [v5 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:1 userInfo:v8];
    (*((void (**)(id, void, void *))a4 + 2))(v7, 0, v9);
  }
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke;
    v25[3] = &unk_264775778;
    uint64_t v13 = v10;
    v26 = v13;
    uint64_t v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_2;
    v23[3] = &unk_2647759A0;
    void v23[4] = self;
    id v24 = v13;
    [v14 getServiceConfigurationInfo:v8 serviceID:v9 completion:v23];

    uint64_t v15 = v26;
  }
  else
  {
    uint64_t v15 = _MSLogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getServiceConfigurationInfo:serviceID:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_3;
  v11[3] = &unk_2647757A0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setVersion:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    connection = self->_connection;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __51__MediaServiceConfiguration_setVersion_completion___block_invoke;
    v21[3] = &unk_264775778;
    id v9 = v6;
    uint64_t v22 = v9;
    id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__MediaServiceConfiguration_setVersion_completion___block_invoke_2;
    v19[3] = &unk_264775778;
    uint64_t v20 = v9;
    [v10 setVersion:a3 completion:v19];

    char v11 = v22;
  }
  else
  {
    char v11 = _MSLogingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration setVersion:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t __51__MediaServiceConfiguration_setVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__MediaServiceConfiguration_setVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  connection = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke;
  v16[3] = &unk_264775778;
  id v10 = v8;
  id v17 = v10;
  id v11 = a4;
  uint64_t v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke_2;
  v14[3] = &unk_264775778;
  id v15 = v10;
  id v13 = v10;
  [v12 overrideAppleMusicSubscriptionStatus:v6 homeUserIDS:v11 completion:v14];
}

uint64_t __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke;
    v19[3] = &unk_264775778;
    id v7 = v4;
    uint64_t v20 = v7;
    id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_2;
    v17[3] = &unk_2647759C8;
    v17[4] = self;
    uint64_t v18 = v7;
    [v8 getDefaultMediaServiceForAllUsers:v17];

    id v9 = v20;
  }
  else
  {
    id v9 = _MSLogingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getDefaultMediaServiceForAllUsers:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_3;
    v9[3] = &unk_2647757A0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    [v8 _performBlock:v9];
  }
}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke;
    v25[3] = &unk_264775778;
    uint64_t v13 = v10;
    v26 = v13;
    uint64_t v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_2;
    v23[3] = &unk_2647759F0;
    void v23[4] = self;
    id v24 = v13;
    [v14 getResolvedServiceInfo:v8 sharedUserID:v9 completion:v23];

    uint64_t v15 = v26;
  }
  else
  {
    uint64_t v15 = _MSLogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getResolvedServiceInfo:sharedUserID:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_3;
  v11[3] = &unk_2647757A0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke;
    v22[3] = &unk_264775778;
    id v10 = v7;
    uint64_t v23 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_2;
    v20[3] = &unk_2647759F0;
    v20[4] = self;
    uint64_t v21 = v10;
    [v11 getResolvedServiceInfo:v6 completion:v20];

    id v12 = v23;
  }
  else
  {
    id v12 = _MSLogingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration getResolvedServiceInfo:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_3;
  v11[3] = &unk_2647757A0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)switchUserAccountInfo:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke;
    v28[3] = &unk_264775778;
    id v13 = v10;
    uint64_t v29 = v13;
    id v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
    uint64_t v15 = [v9 uniqueIdentifier];
    uint64_t v16 = [v9 currentUser];
    uint64_t v17 = [v16 uniqueIdentifier];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_2;
    v26[3] = &unk_264775A18;
    v26[4] = self;
    id v27 = v13;
    [v14 switchUserAccountInfo:v8 homeID:v15 homeUserID:v17 completion:v26];

    uint64_t v18 = v29;
  }
  else
  {
    uint64_t v18 = _MSLogingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration switchUserAccountInfo:home:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

uint64_t __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_3;
  v7[3] = &unk_264775950;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 _performBlock:v7];
}

uint64_t __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setDelegate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _MSLogingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_225D52000, v5, OS_LOG_TYPE_INFO, "Setting MediaServiceUpdatedDelegate %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_147];
  [v6 openConnection];

  objc_storeWeak((id *)&self->_delegate, v4);
}

void __41__MediaServiceConfiguration_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _MSLogingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__MediaServiceConfiguration_setDelegate___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(MediaServiceConfiguration *)self delegate];
  if ([v7 conformsToProtocol:&unk_26D99BA08])
  {
    uint64_t v8 = [(MediaServiceConfiguration *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
    uint64_t v7 = [(MediaServiceConfiguration *)self delegate];
    [v7 serviceSettingDidUpdate:v10 homeUserID:v6];
  }

LABEL_5:
}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [MSRemovalEvent alloc];
  uint64_t v8 = [v14 serviceID];
  char v9 = [v8 UUIDString];
  id v10 = [(MSRemovalEvent *)v7 initWithServiceId:v9];

  +[MSAnalytics sendRemovalEvent:v10];
  id v11 = [(MediaServiceConfiguration *)self delegate];
  if ([v11 conformsToProtocol:&unk_26D99BA08])
  {
    id v12 = [(MediaServiceConfiguration *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_5;
    }
    id v11 = [(MediaServiceConfiguration *)self delegate];
    [v11 userDidRemoveService:v14 homeUserID:v6];
  }

LABEL_5:
}

- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(MediaServiceConfiguration *)self delegate];
  if ([v7 conformsToProtocol:&unk_26D99BA08])
  {
    uint64_t v8 = [(MediaServiceConfiguration *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
    uint64_t v7 = [(MediaServiceConfiguration *)self delegate];
    [v7 userDidUpdateDefaultService:v10 homeUserID:v6];
  }

LABEL_5:
}

- (void)_performBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MediaServiceUpdatedDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaServiceUpdatedDelegate *)WeakRetained;
}

- (MediaServiceConfigurationMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)updateProperty:(id)a3 forHome:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke;
    v31[3] = &unk_264775778;
    uint64_t v16 = v13;
    v32 = v16;
    uint64_t v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v31];
    uint64_t v18 = [v11 uniqueIdentifier];
    uint64_t v19 = [v11 currentUser];
    uint64_t v20 = [v19 uniqueIdentifier];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_2;
    v29[3] = &unk_264775908;
    void v29[4] = self;
    uint64_t v30 = v16;
    [v17 updateProperty:v10 homeID:v18 homeUserID:v20 withOptions:v12 completion:v29];

    uint64_t v21 = v32;
  }
  else
  {
    uint64_t v21 = _MSLogingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration(MediaService) updateProperty:forHome:withOptions:completion:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

uint64_t __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_3;
    v8[3] = &unk_2647758B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    [v7 _performBlock:v8];
  }
}

uint64_t __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke;
    v22[3] = &unk_264775778;
    id v10 = v7;
    uint64_t v23 = v10;
    char v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_2;
    v20[3] = &unk_264775A60;
    v20[4] = self;
    uint64_t v21 = v10;
    [v11 activeServiceApplicationInformationForSharedUserID:v6 completionHandler:v20];

    id v12 = v23;
  }
  else
  {
    id v12 = _MSLogingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration(AppSelection) activeServiceApplicationInformationForSharedUserID:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_3;
  v11[3] = &unk_2647757A0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke;
    v22[3] = &unk_264775778;
    id v10 = v7;
    uint64_t v23 = v10;
    char v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_2;
    v20[3] = &unk_264775A88;
    v20[4] = self;
    uint64_t v21 = v10;
    [v11 getMediaServiceChoicesForSharedUser:v6 completion:v20];

    id v12 = v23;
  }
  else
  {
    id v12 = _MSLogingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration(AppSelection) getMediaServiceChoicesForSharedUser:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_3;
  v11[3] = &unk_2647757A0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getMediaServiceChoicesForAllUsers:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke;
    v19[3] = &unk_264775778;
    id v7 = v4;
    uint64_t v20 = v7;
    id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_2;
    v17[3] = &unk_2647759A0;
    v17[4] = self;
    uint64_t v18 = v7;
    [v8 getMediaServiceChoicesForAllUsers:v17];

    id v9 = v20;
  }
  else
  {
    id v9 = _MSLogingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration(AppSelection) getMediaServiceChoicesForAllUsers:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_3;
  v11[3] = &unk_2647757A0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke;
    v19[3] = &unk_264775778;
    id v7 = v4;
    uint64_t v20 = v7;
    id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_199;
    v17[3] = &unk_264775A88;
    v17[4] = self;
    uint64_t v18 = v7;
    [v8 getSupportedThirdPartyMediaServices:v17];

    id v9 = v20;
  }
  else
  {
    id v9 = _MSLogingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MediaServiceConfiguration(AppSelection) getSupportedThirdPartyMediaServices:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MSLogingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_199(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_2;
  v11[3] = &unk_2647757A0;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _performBlock:v11];
}

uint64_t __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225D52000, log, OS_LOG_TYPE_ERROR, "Connection to mediasetupd server is interrupted", v1, 2u);
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke_126_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225D52000, log, OS_LOG_TYPE_ERROR, "Connection to mediasetupd server is invalidated", v1, 2u);
}

- (void)getAvailableServices:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getCachedAvailableServices:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)thirdPartyMusicAvailable:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[MediaServiceConfiguration thirdPartyMusicAvailable:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225D52000, a2, OS_LOG_TYPE_ERROR, "%s Error %@", (uint8_t *)&v2, 0x16u);
}

- (void)getCachedServiceInfo:(uint64_t)a3 homeUserID:(uint64_t)a4 endpointID:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestAuthRenewalForMediaService:(uint64_t)a3 homeUserID:(uint64_t)a4 parentNetworkActivity:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateDefaultMediaService:(uint64_t)a3 forHome:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getDefaultMediaService:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeServiceFromHome:(uint64_t)a3 fromHome:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addMediaService:(uint64_t)a3 toHomes:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getPublicInfoForBundleID:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getServiceConfigurationInfo:(uint64_t)a3 serviceID:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setVersion:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getDefaultMediaServiceForAllUsers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getResolvedServiceInfo:(uint64_t)a3 sharedUserID:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getResolvedServiceInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)switchUserAccountInfo:(uint64_t)a3 home:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__MediaServiceConfiguration_setDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end