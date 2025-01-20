@interface CloudMediaServicesPlayerInterface
- (CloudMediaServicesPlayerInterface)init;
- (void)dealloc;
- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6;
- (void)pauseSample;
- (void)playSample:(id)a3;
- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4;
- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8;
- (void)setOverrideURL:(id)a3;
- (void)setServerEnvironment:(id)a3;
- (void)stopAnalyticsWithIdentifier:(id)a3;
- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7;
@end

@implementation CloudMediaServicesPlayerInterface

- (CloudMediaServicesPlayerInterface)init
{
  v18.receiver = self;
  v18.super_class = (Class)CloudMediaServicesPlayerInterface;
  v2 = [(CloudMediaServicesPlayerInterface *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.agora.server" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DE66818];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v14 = [(NSXPCConnection *)v2->_connection remoteObjectInterface];
    [v14 setClasses:v13 forSelector:sel_getCloudExtensionConfigurationFor_homeUserID_endpointID_withCompletion_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_0];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_74];
    [(NSXPCConnection *)v2->_connection resume];
    uint64_t v15 = [(NSXPCConnection *)v2->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_78];
    AgoraInterfaceProxy = v2->_AgoraInterfaceProxy;
    v2->_AgoraInterfaceProxy = (CloudMediaServicesInterfaceProtocol *)v15;
  }
  return v2;
}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke()
{
  v0 = _CMSILogingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22B0FF000, v0, OS_LOG_TYPE_DEFAULT, "Connection to CloudMediaServices server was interrupted!", v1, 2u);
  }
}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke_72()
{
  v0 = _CMSILogingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22B0FF000, v0, OS_LOG_TYPE_DEFAULT, "Connection to CloudMediaServices server was invalidated!", v1, 2u);
  }
}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke_75(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _CMSILogingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__CloudMediaServicesPlayerInterface_init__block_invoke_75_cold_1((uint64_t)v2, v3);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CloudMediaServicesPlayerInterface;
  [(CloudMediaServicesPlayerInterface *)&v3 dealloc];
}

- (void)playSample:(id)a3
{
}

- (void)pauseSample
{
}

- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4
{
}

- (void)setServerEnvironment:(id)a3
{
}

- (void)setOverrideURL:(id)a3
{
}

- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8
{
}

- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __108__CloudMediaServicesPlayerInterface_getCloudExtensionConfigurationFor_homeUserID_endpointID_withCompletion___block_invoke;
  v17[3] = &unk_264888600;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  [v16 getCloudExtensionConfigurationFor:v15 homeUserID:v14 endpointID:v13 withCompletion:v12];
}

uint64_t __108__CloudMediaServicesPlayerInterface_getCloudExtensionConfigurationFor_homeUserID_endpointID_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7
{
}

- (void)stopAnalyticsWithIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AgoraInterfaceProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke_75_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22B0FF000, a2, OS_LOG_TYPE_ERROR, "Error associating NSXPCConnection to remoteobject proxy %@", (uint8_t *)&v2, 0xCu);
}

@end