@interface BBServerConduit
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)sharedConduit;
- (BBServerConduit)init;
- (void)dealloc;
- (void)invalidate;
- (void)sendMessageToDataProviderSectionID:(id)a3 name:(id)a4 userInfo:(id)a5;
- (void)weeAppWithBundleID:(id)a3 getHiddenFromUser:(id)a4;
- (void)weeAppWithBundleID:(id)a3 setHiddenFromUser:(BOOL)a4;
@end

@implementation BBServerConduit

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1) {
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_20);
  }
  v2 = (void *)serverInterface___interface_0;
  return v2;
}

void __34__BBServerConduit_serverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7B1118];
  v1 = (void *)serverInterface___interface_0;
  serverInterface___interface_0 = v0;

  v2 = (void *)serverInterface___interface_0;
  BBAllowedClasses();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v3 forSelector:sel_sendMessageToDataProviderSectionID_name_userInfo_ argumentIndex:2 ofReply:0];
}

+ (id)clientInterface
{
  if (clientInterface_onceToken_1 != -1) {
    dispatch_once(&clientInterface_onceToken_1, &__block_literal_global_52);
  }
  v2 = (void *)clientInterface___interface_1;
  return v2;
}

uint64_t __34__BBServerConduit_clientInterface__block_invoke()
{
  clientInterface___interface_1 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7BC978];
  return MEMORY[0x270F9A758]();
}

+ (id)sharedConduit
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__BBServerConduit_sharedConduit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConduit_onceToken != -1) {
    dispatch_once(&sharedConduit_onceToken, block);
  }
  v2 = (void *)sharedConduit___SharedConduit;
  return v2;
}

uint64_t __32__BBServerConduit_sharedConduit__block_invoke(uint64_t a1)
{
  sharedConduit___SharedConduit = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BBServerConduit)init
{
  v10.receiver = self;
  v10.super_class = (Class)BBServerConduit;
  v2 = [(BBServerConduit *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.bulletinboard.serverconduitconnection" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    v6 = [(id)objc_opt_class() clientInterface];
    [(NSXPCConnection *)v5 setExportedInterface:v6];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    v7 = v2->_connection;
    v8 = [(id)objc_opt_class() serverInterface];
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_59];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_62];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

void __23__BBServerConduit_init__block_invoke()
{
  uint64_t v0 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "BBServerConduit connection interrupted.", v1, 2u);
  }
}

void __23__BBServerConduit_init__block_invoke_60()
{
  uint64_t v0 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "BBServerConduit connection invalidated.", v1, 2u);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBServerConduit;
  [(BBServerConduit *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)sendMessageToDataProviderSectionID:(id)a3 name:(id)a4 userInfo:(id)a5
{
  connection = self->_connection;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v11 sendMessageToDataProviderSectionID:v10 name:v9 userInfo:v8];
}

- (void)weeAppWithBundleID:(id)a3 setHiddenFromUser:(BOOL)a4
{
  BOOL v4 = a4;
  connection = self->_connection;
  id v6 = a3;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v7 weeAppWithBundleID:v6 setHiddenFromUser:v4];
}

- (void)weeAppWithBundleID:(id)a3 getHiddenFromUser:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  id v8 = a3;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__BBServerConduit_weeAppWithBundleID_getHiddenFromUser___block_invoke;
  v11[3] = &unk_264297540;
  id v12 = v6;
  id v10 = v6;
  [v9 weeAppWithBundleID:v8 getHiddenFromUser:v11];
}

void __56__BBServerConduit_weeAppWithBundleID_getHiddenFromUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 BOOLValue]);
  }
  else {
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
}

- (void).cxx_destruct
{
}

@end