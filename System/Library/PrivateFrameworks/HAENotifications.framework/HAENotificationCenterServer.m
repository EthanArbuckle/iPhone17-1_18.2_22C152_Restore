@interface HAENotificationCenterServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)verifyInvariants;
- (HAENotificationCenterServer)init;
- (void)addHAENotificationEvent:(id)a3;
@end

@implementation HAENotificationCenterServer

+ (id)sharedInstance
{
  if (sharedInstance_once_4 != -1) {
    dispatch_once(&sharedInstance_once_4, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_instance_4;
  return v2;
}

uint64_t __45__HAENotificationCenterServer_sharedInstance__block_invoke()
{
  sharedInstance_instance_4 = objc_alloc_init(HAENotificationCenterServer);
  return MEMORY[0x270F9A758]();
}

- (HAENotificationCenterServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HAENotificationCenterServer;
  v2 = [(HAENotificationCenterServer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.coreaudio.adam.hae.notification"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcListener resume];
  }
  return v2;
}

- (void)addHAENotificationEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "Received HAE notificaton event: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = +[HAENDefaults sharedInstance];
  char v6 = [v5 isHAENFeatureEnabled];

  if (v6)
  {
    v7 = +[HAENotificationCenterManager sharedInstance];
    id v8 = (id)[v7 addHAENotificationEvent:v3];
  }
  else
  {
    v7 = HAENotificationsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "HAE Notification disabled...", (uint8_t *)&v9, 2u);
    }
  }
}

- (BOOL)verifyInvariants
{
  return self->_xpcListener != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  char v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1541D8];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  v7 = HAENotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    int v11 = 138412802;
    v12 = v8;
    __int16 v13 = 1024;
    int v14 = [v5 processIdentifier];
    __int16 v15 = 2080;
    v16 = "Success";
    _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "New XPC Connection to %@ from pid: %d [%s]", (uint8_t *)&v11, 0x1Cu);
  }
  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end