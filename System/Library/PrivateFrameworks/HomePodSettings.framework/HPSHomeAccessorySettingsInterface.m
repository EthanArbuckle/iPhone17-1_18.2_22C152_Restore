@interface HPSHomeAccessorySettingsInterface
- (BOOL)isValidConnection;
- (HPSHomeAccessoryInterfaceMediator)mediator;
- (HPSHomeAccessorySettingsConnectionInterfaceDelegate)delegate;
- (HPSHomeAccessorySettingsInterface)initWithDelegate:(id)a3;
- (NSXPCConnection)xpcConnection;
- (void)accessoryDidUpdateValueForEndpointIdentifier:(id)a3 keyPath:(id)a4 value:(id)a5;
- (void)dealloc;
- (void)fetchSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5;
- (void)handleConnectionInterrupted;
- (void)handleConnectionInvalidated;
- (void)setDelegate:(id)a3;
- (void)setIsValidConnection:(BOOL)a3;
- (void)setMediator:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)subscribeToSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5;
- (void)unsubscribeToSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5;
@end

@implementation HPSHomeAccessorySettingsInterface

- (HPSHomeAccessorySettingsInterface)initWithDelegate:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HPSHomeAccessorySettingsInterface;
  v5 = [(HPSHomeAccessorySettingsInterface *)&v32 init];
  v6 = v5;
  if (v5)
  {
    id v23 = v4;
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.homeaccessorysettings.server" options:4096];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    v26 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F107B80];
    v24 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0F99D8];
    v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v25, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    [v26 setClasses:v18 forSelector:sel_sendFetchSettingForEndpointIdentifier_keyPath_completionHandler_ argumentIndex:0 ofReply:1];
    [v26 setClasses:v18 forSelector:sel_sendSubscribeRequestToSettingForEndpointIdentifier_keypath_completionHandler_ argumentIndex:0 ofReply:1];
    [v26 setClasses:v18 forSelector:sel_sendUnsubscribeRequestToSettingForEndpointIdentifier_keypath_completionHandler_ argumentIndex:0 ofReply:1];
    [v24 setClasses:v18 forSelector:sel_homekitaccessoryDidUpdateValueForEndpointIdentifier_keyPath_value_ argumentIndex:0 ofReply:0];
    objc_initWeak(&location, v6);
    v19 = v6->_xpcConnection;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke;
    v29[3] = &unk_264E898F8;
    objc_copyWeak(&v30, &location);
    [(NSXPCConnection *)v19 setInterruptionHandler:v29];
    v20 = v6->_xpcConnection;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_333;
    v27[3] = &unk_264E898F8;
    objc_copyWeak(&v28, &location);
    [(NSXPCConnection *)v20 setInvalidationHandler:v27];
    v6->_isValidConnection = v6->_xpcConnection != 0;
    v21 = [[HPSHomeAccessoryInterfaceMediator alloc] initWithInterface:v6];
    [(NSXPCConnection *)v6->_xpcConnection setExportedObject:v21];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v26];
    [(NSXPCConnection *)v6->_xpcConnection setExportedInterface:v24];
    [(NSXPCConnection *)v6->_xpcConnection resume];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    id v4 = v23;
  }

  return v6;
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke(uint64_t a1)
{
  v2 = _HPSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInterrupted];
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_333(uint64_t a1)
{
  v2 = _HPSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_333_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInvalidated];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = [(HPSHomeAccessorySettingsInterface *)self xpcConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HPSHomeAccessorySettingsInterface;
  [(HPSHomeAccessorySettingsInterface *)&v4 dealloc];
}

- (void)fetchSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint64_t v14 = "-[HPSHomeAccessorySettingsInterface fetchSettingForEndpointIdentifier:keyPath:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v12 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_1];
  [v12 sendFetchSettingForEndpointIdentifier:v8 keyPath:v9 completionHandler:v10];
}

void __97__HPSHomeAccessorySettingsInterface_fetchSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __97__HPSHomeAccessorySettingsInterface_fetchSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)subscribeToSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint64_t v14 = "-[HPSHomeAccessorySettingsInterface subscribeToSettingForEndpointIdentifier:keyPath:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v12 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_339];
  [v12 sendSubscribeRequestToSettingForEndpointIdentifier:v8 keypath:v9 completionHandler:v10];
}

void __103__HPSHomeAccessorySettingsInterface_subscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __103__HPSHomeAccessorySettingsInterface_subscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)unsubscribeToSettingForEndpointIdentifier:(id)a3 keyPath:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint64_t v14 = "-[HPSHomeAccessorySettingsInterface unsubscribeToSettingForEndpointIdentifier:keyPath:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v12 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_341];
  [v12 sendUnsubscribeRequestToSettingForEndpointIdentifier:v8 keypath:v9 completionHandler:v10];
}

void __105__HPSHomeAccessorySettingsInterface_unsubscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __105__HPSHomeAccessorySettingsInterface_unsubscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)handleConnectionInvalidated
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D144000, log, OS_LOG_TYPE_ERROR, "Connection delegate is nil", v1, 2u);
}

- (void)handleConnectionInterrupted
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained settingsConnectionInterrupted];
  }
  else
  {
    v3 = _HPSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeAccessorySettingsInterface handleConnectionInvalidated](v3);
    }
  }
}

- (void)accessoryDidUpdateValueForEndpointIdentifier:(id)a3 keyPath:(id)a4 value:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    uint64_t v14 = "-[HPSHomeAccessorySettingsInterface accessoryDidUpdateValueForEndpointIdentifier:keyPath:value:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_DEFAULT, "%s Notify Client endpointID %@ keyPath %@ settingValue %@", (uint8_t *)&v13, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained didUpdateSettingForEndpointIdentifier:v8 keyPath:v9 value:v10];
  }
}

- (HPSHomeAccessorySettingsConnectionInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HPSHomeAccessorySettingsConnectionInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HPSHomeAccessoryInterfaceMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)isValidConnection
{
  return self->_isValidConnection;
}

- (void)setIsValidConnection:(BOOL)a3
{
  self->_isValidConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[HPSHomeAccessorySettingsInterface initWithDelegate:]_block_invoke";
  _os_log_error_impl(&dword_23D144000, log, OS_LOG_TYPE_ERROR, "%s Connection to HomePodSettings server was interrupted!", (uint8_t *)&v1, 0xCu);
}

void __54__HPSHomeAccessorySettingsInterface_initWithDelegate___block_invoke_333_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[HPSHomeAccessorySettingsInterface initWithDelegate:]_block_invoke";
  _os_log_error_impl(&dword_23D144000, log, OS_LOG_TYPE_ERROR, "%s Connection to HomePodSettings server was invalidated!", (uint8_t *)&v1, 0xCu);
}

void __97__HPSHomeAccessorySettingsInterface_fetchSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

void __103__HPSHomeAccessorySettingsInterface_subscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

void __105__HPSHomeAccessorySettingsInterface_unsubscribeToSettingForEndpointIdentifier_keyPath_completionHandler___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

@end