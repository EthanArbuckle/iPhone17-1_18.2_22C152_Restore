@interface AUHelperInstance
+ (AUHelperInstance)sharedInstance;
+ (id)xpcConnectionToHelper;
+ (void)xpcConnectionToHelper;
- (AUHelperInstance)init;
- (AUHelperServiceProtocol)remoteObject;
@end

@implementation AUHelperInstance

- (AUHelperInstance)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUHelperInstance;
  v2 = [(AUHelperInstance *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AUHelperInstance xpcConnectionToHelper];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;
  }
  return v2;
}

+ (AUHelperInstance)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__AUHelperInstance_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_DefaultInstance;
  return (AUHelperInstance *)v2;
}

uint64_t __34__AUHelperInstance_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_DefaultInstance = [objc_allocWithZone(*(Class *)(a1 + 32)) init];
  return MEMORY[0x270F9A758]();
}

- (AUHelperServiceProtocol)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpcConnection = [xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_3];
  }
  return (AUHelperServiceProtocol *)xpcConnection;
}

void __32__AUHelperInstance_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __32__AUHelperInstance_remoteObject__block_invoke_cold_1(a2);
  }
}

+ (id)xpcConnectionToHelper
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.accessoryupdater.launchauhelper" options:4096];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DCF8510];
    [v2 setRemoteObjectInterface:v3];
    v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
    v12 = [v2 remoteObjectInterface];
    [v12 setClasses:v11 forSelector:sel_userPreferenceSetObject_forSuite_withKey_ argumentIndex:0 ofReply:0];

    v13 = [v2 remoteObjectInterface];
    [v13 setClasses:v11 forSelector:sel_userPreferenceObjectForSuite_withKey_withReply_ argumentIndex:0 ofReply:1];

    [v2 resume];
    id v14 = v2;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[AUHelperInstance xpcConnectionToHelper]();
  }

  return v2;
}

- (void).cxx_destruct
{
}

void __32__AUHelperInstance_remoteObject__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[AUHelperInstance remoteObject]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Failed to get remote object: %@", (uint8_t *)&v1, 0x16u);
}

+ (void)xpcConnectionToHelper
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "+[AUHelperInstance xpcConnectionToHelper]";
  _os_log_error_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Failed to get xpc connection", (uint8_t *)&v0, 0xCu);
}

@end