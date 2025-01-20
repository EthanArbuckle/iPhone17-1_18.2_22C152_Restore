@interface DDSServer
+ (id)interface;
+ (id)setUpAssertionStorageDirectory;
+ (id)sharedInstance;
+ (id)sharedInstanceWithConfiguration:(id)a3;
+ (void)setUpAssertionStorageDirectory;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DDSAssetProviding)provider;
- (DDSManaging)manager;
- (DDSServer)initWithXPCServiceName:(id)a3 assertionStorageFileURL:(id)a4;
- (NSMutableSet)clientConnections;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)handleEndedConnection:(id)a3;
- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4;
- (void)start;
@end

@implementation DDSServer

+ (id)setUpAssertionStorageDirectory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/Library/DataDeliveryServices"];

  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  char v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v7 = v11;

  v8 = DefaultLog();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Verified the DDS folder is present at %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    +[DDSServer setUpAssertionStorageDirectory];
  }

  return v4;
}

+ (id)sharedInstance
{
  v2 = [DDSServerConfiguration alloc];
  v3 = +[DDSServer setUpAssertionStorageDirectory];
  v4 = [(DDSServerConfiguration *)v2 initWithXPCServiceName:@"com.apple.DataDeliveryServices.AssetService" assertionStorageDirectoryURL:v3];

  v5 = +[DDSServer sharedInstanceWithConfiguration:v4];

  return v5;
}

+ (id)sharedInstanceWithConfiguration:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DDSServer_sharedInstanceWithConfiguration___block_invoke;
  block[3] = &unk_1E6E39DE0;
  id v9 = v3;
  uint64_t v4 = sharedInstanceWithConfiguration__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceWithConfiguration__onceToken, block);
  }
  id v6 = (id)sharedInstanceWithConfiguration__sharedInstance;

  return v6;
}

void __45__DDSServer_sharedInstanceWithConfiguration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcServiceName];
  id v11 = [v2 stringByAppendingPathExtension:@"plist"];

  id v3 = [*(id *)(a1 + 32) xpcServiceName];
  int v4 = [v3 isEqualToString:@"com.apple.DataDeliveryServices.AssetService"];

  if (v4)
  {

    id v11 = @"ddsassertiondata.plist";
  }
  id v5 = [*(id *)(a1 + 32) assertionStorageDirectoryURL];
  id v6 = [v5 URLByAppendingPathComponent:v11];

  id v7 = [DDSServer alloc];
  v8 = [*(id *)(a1 + 32) xpcServiceName];
  uint64_t v9 = [(DDSServer *)v7 initWithXPCServiceName:v8 assertionStorageFileURL:v6];
  v10 = (void *)sharedInstanceWithConfiguration__sharedInstance;
  sharedInstanceWithConfiguration__sharedInstance = v9;

  [(id)sharedInstanceWithConfiguration__sharedInstance start];
}

- (DDSServer)initWithXPCServiceName:(id)a3 assertionStorageFileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DDSServer;
  v8 = [(DDSServer *)&v23 init];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(DDSMobileAssetv2Provider);
    provider = v8->_provider;
    v8->_provider = (DDSAssetProviding *)v9;

    id v11 = [[DDSAssertionDataHandler alloc] initWithAssertionStorageFileURL:v7];
    v12 = [[DDSAssertionTracker alloc] initWithDataHandler:v11];
    v13 = [[DDSManager alloc] initWithProvider:v8->_provider tracker:v12];
    manager = v8->_manager;
    v8->_manager = (DDSManaging *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clientConnections = v8->_clientConnections;
    v8->_clientConnections = v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[@"com.apple.DataDeliveryServices.ddsserver.queue" cStringUsingEncoding:4], v17);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v6];
    listener = v8->_listener;
    v8->_listener = (NSXPCListener *)v20;

    [(NSXPCListener *)v8->_listener _setQueue:v8->_queue];
  }

  return v8;
}

- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4
{
  id v6 = a4;
  id v7 = [(DDSServer *)self provider];
  [v7 setCompatabilityVersion:a3 forAssetType:v6];
}

- (void)start
{
  [(DDSManaging *)self->_manager setDelegate:self];
  [(NSXPCListener *)self->_listener setDelegate:self];
  listener = self->_listener;
  [(NSXPCListener *)listener resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = DefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v7;
    _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Server shouldAcceptNewConnection: (%{public}@)", buf, 0xCu);
  }

  uint64_t v9 = [(DDSServer *)self manager];
  [v7 setExportedObject:v9];

  v10 = [(id)objc_opt_class() interface];
  [v7 setExportedInterface:v10];

  id v11 = +[DDSInterface interface];
  [v7 setRemoteObjectInterface:v11];

  v12 = [(DDSServer *)self queue];
  [v7 _setQueue:v12];

  objc_initWeak((id *)buf, v7);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke;
  v21[3] = &unk_1E6E39E08;
  objc_copyWeak(&v22, (id *)buf);
  v21[4] = self;
  [v7 setInvalidationHandler:v21];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_294;
  dispatch_queue_t v18 = &unk_1E6E39E08;
  objc_copyWeak(&v20, (id *)buf);
  v19 = self;
  [v7 setInterruptionHandler:&v15];
  v13 = [(DDSServer *)self clientConnections];
  [v13 addObject:v7];

  [v7 resume];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = DefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = WeakRetained;
      _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Client connection invalidated: %{public}@", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(a1 + 32) handleEndedConnection:WeakRetained];
  }
}

void __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_294(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = DefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_294_cold_1((uint64_t)WeakRetained, v3);
    }

    [*(id *)(a1 + 32) handleEndedConnection:WeakRetained];
  }
}

- (void)handleEndedConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSServer *)self clientConnections];
  [v5 removeObject:v4];
}

+ (id)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global);
  }
  v2 = (void *)interface_xpcClientInterface;
  return v2;
}

uint64_t __22__DDSServer_interface__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3FB5CD8];
  v1 = (void *)interface_xpcClientInterface;
  interface_xpcClientInterface = v0;

  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_addAssertionForQuery_policy_assertionID_clientID_ argumentIndex:0 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_addAssertionForQuery_policy_assertionID_clientID_ argumentIndex:1 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_addAssertionForQuery_policy_assertionID_clientID_ argumentIndex:2 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_addAssertionForQuery_policy_assertionID_clientID_ argumentIndex:3 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_removeAssertionWithID_ argumentIndex:0 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_assertionIDsForClientID_reply_ argumentIndex:0 ofReply:0];
  v2 = (void *)interface_xpcClientInterface;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_assertionIDsForClientID_reply_ argumentIndex:0 ofReply:1];

  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_fetchAssetUpdateStatusForQuery_callback_ argumentIndex:0 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_fetchAssetUpdateStatusForQuery_callback_ argumentIndex:0 ofReply:1];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_fetchAssetUpdateStatusForQuery_callback_ argumentIndex:1 ofReply:1];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_updateAssetForQuery_callback_ argumentIndex:0 ofReply:0];
  [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_updateAssetForQuery_callback_ argumentIndex:0 ofReply:1];
  return [(id)interface_xpcClientInterface setClass:objc_opt_class() forSelector:sel_updateAssetForQuery_callback_ argumentIndex:1 ofReply:1];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DDSServer;
  [(DDSServer *)&v3 dealloc];
}

- (DDSManaging)manager
{
  return self->_manager;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (DDSAssetProviding)provider
{
  return (DDSAssetProviding *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

+ (void)setUpAssertionStorageDirectory
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E41D6000, log, OS_LOG_TYPE_ERROR, "Failed to create directory at url %{public}@:(%{public}@)", (uint8_t *)&v3, 0x16u);
}

void __48__DDSServer_listener_shouldAcceptNewConnection___block_invoke_294_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Client connection interrupted: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end