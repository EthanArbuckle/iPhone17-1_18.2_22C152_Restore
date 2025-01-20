@interface BLTPingSubscriberManager
- (BLTBulletinDistributorSubscriberDeviceDelegate)deviceDelegate;
- (BLTBulletinDistributorSubscriberList)subscribers;
- (BLTPingSubscriberManager)initWithDeviceDelegate:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (void)_loadPingSubscriberBundles:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)setSubscribers:(id)a3;
@end

@implementation BLTPingSubscriberManager

- (BLTPingSubscriberManager)initWithDeviceDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLTPingSubscriberManager;
  v5 = [(BLTPingSubscriberManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceDelegate, v4);
    v7 = objc_alloc_init(BLTBulletinDistributorSubscriberList);
    subscribers = v6->_subscribers;
    v6->_subscribers = v7;

    v9 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/BulletinDistributor/PingSubscribers"];
    [(BLTPingSubscriberManager *)v6 _loadPingSubscriberBundles:v9];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletindistributord.server"];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v10;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
  }
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.bulletindistributord.server"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    v7 = [[BLTSubscriberRemoteClient alloc] initWithConnection:v5];
    v8 = [[BLTBulletinDistributorSubscriber alloc] initWithClient:v7];
    v9 = [(BLTPingSubscriberManager *)self deviceDelegate];
    [(BLTBulletinDistributorSubscriber *)v8 setDeviceDelegate:v9];

    [v5 setExportedObject:v8];
    uint64_t v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D60B888];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    objc_super v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    BOOL v14 = 1;
    [v10 setClasses:v13 forSelector:sel_getWillNanoPresentNotificationForSectionID_subsectionIDs_completion_ argumentIndex:1 ofReply:0];
    [v5 setExportedInterface:v10];
    v15 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D611EB0];
    [v5 setRemoteObjectInterface:v15];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke;
    v21[3] = &unk_264683BB0;
    v21[4] = self;
    v16 = v8;
    v22 = v16;
    [v5 setInvalidationHandler:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke_2;
    v19[3] = &unk_264683BB0;
    v19[4] = self;
    v20 = v16;
    v17 = v16;
    [v5 setInterruptionHandler:v19];
    [v5 resume];
    [(BLTBulletinDistributorSubscriberList *)self->_subscribers addSubscriber:v17];
  }
  else
  {
    blt_general_log();
    v7 = (BLTSubscriberRemoteClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[BLTPingSubscriberManager listener:shouldAcceptNewConnection:](@"com.apple.bulletindistributord.server", &v7->super);
    }
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeSubscriber:*(void *)(a1 + 40)];
}

uint64_t __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeSubscriber:*(void *)(a1 + 40)];
}

- (void)_loadPingSubscriberBundles:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v34 = 0;
  v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v34];
  id v7 = v34;

  if (v7)
  {
    obj = blt_general_log();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[BLTPingSubscriberManager _loadPingSubscriberBundles:]((uint64_t)v7, obj);
    }
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v24 = v6;
      uint64_t v10 = *(void *)v31;
      unint64_t v11 = 0x263F08000uLL;
      uint64_t v12 = &selRef_minimumResponseDelay;
      uint64_t v26 = *(void *)v31;
      v27 = self;
      id v25 = v4;
      do
      {
        uint64_t v13 = 0;
        uint64_t v28 = v9;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v30 + 1) + 8 * v13)];
          v15 = [*(id *)(v11 + 1760) bundleWithPath:v14];
          v16 = (objc_class *)[v15 principalClass];
          if (v16)
          {
            v17 = v16;
            if ([(objc_class *)v16 conformsToProtocol:v12[100]])
            {
              v18 = objc_alloc_init(BLTLocalPingSubscriberService);
              v19 = (void *)[[v17 alloc] initWithService:v18];
              v20 = [[BLTBulletinDistributorSubscriber alloc] initWithClient:v19];
              [(BLTPingSubscriberManager *)v27 deviceDelegate];
              v21 = v12;
              v23 = unint64_t v22 = v11;
              [(BLTBulletinDistributorSubscriber *)v20 setDeviceDelegate:v23];

              unint64_t v11 = v22;
              uint64_t v12 = v21;
              [(BLTLocalPingSubscriberService *)v18 setSubscriber:v20];
              id v4 = v25;
              uint64_t v9 = v28;
              [(BLTBulletinDistributorSubscriberList *)v27->_subscribers addSubscriber:v20];
              [v19 pingSubscriberDidLoad];

              uint64_t v10 = v26;
            }
          }

          ++v13;
        }
        while (v9 != v13);
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
      id v7 = 0;
      v6 = v24;
    }
  }
}

- (BLTBulletinDistributorSubscriberList)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BLTBulletinDistributorSubscriberDeviceDelegate)deviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceDelegate);
  return (BLTBulletinDistributorSubscriberDeviceDelegate *)WeakRetained;
}

- (void)setDeviceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceDelegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "No entitlement %@", (uint8_t *)&v2, 0xCu);
}

- (void)_loadPingSubscriberBundles:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error loading ping subscriber bundles: %@", (uint8_t *)&v2, 0xCu);
}

@end