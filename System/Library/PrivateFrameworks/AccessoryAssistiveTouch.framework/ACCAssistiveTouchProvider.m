@interface ACCAssistiveTouchProvider
- (ACCAssistiveTouchProvider)initWithDelegate:(id)a3 initialState:(BOOL)a4;
- (ACCAssistiveTouchProviderProtocol)delegate;
- (ACCAssistiveTouchXPCServerProtocol)remoteObject;
- (BOOL)cachedState;
- (BOOL)calculateDesiredState:(id)a3;
- (NSMutableDictionary)accessories;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (void)accessoryAssistiveTouchAttached:(id)a3;
- (void)accessoryAssistiveTouchDetachAll;
- (void)accessoryAssistiveTouchDetached:(id)a3;
- (void)connectToServer;
- (void)dealloc;
- (void)notifyAssistiveTouchEnabledState:(BOOL)a3;
- (void)requestState:(id)a3;
- (void)setAccessories:(id)a3;
- (void)setCachedState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(id)a3 flag:(BOOL)a4;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
@end

@implementation ACCAssistiveTouchProvider

- (ACCAssistiveTouchProvider)initWithDelegate:(id)a3 initialState:(BOOL)a4
{
  id v7 = a3;
  init_logging();
  v23.receiver = self;
  v23.super_class = (Class)ACCAssistiveTouchProvider;
  v8 = [(ACCAssistiveTouchProvider *)&v23 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    providerUID = v8->_providerUID;
    v8->_providerUID = (NSString *)v10;

    objc_storeStrong((id *)&v8->_delegate, a3);
    serverConnection = v8->_serverConnection;
    v8->_serverConnection = 0;

    remoteObject = v8->_remoteObject;
    v8->_remoteObject = 0;

    v8->_cachedState = a4;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessories = v8->_accessories;
    v8->_accessories = v14;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke;
    v20 = &unk_2647E8748;
    objc_copyWeak(&v21, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.assistivetouch.availability-changed", &v17);
    [(ACCAssistiveTouchProvider *)v8 connectToServer];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_226E0E000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      id v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_226E0E000, v7, OS_LOG_TYPE_DEFAULT, "assistiveTouch Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(ACCAssistiveTouchProvider *)self serverConnection];
  [v3 invalidate];

  accessories = self->_accessories;
  self->_accessories = 0;

  v5.receiver = self;
  v5.super_class = (Class)ACCAssistiveTouchProvider;
  [(ACCAssistiveTouchProvider *)&v5 dealloc];
}

- (void)connectToServer
{
  v2 = self;
  objc_sync_enter(v2);
  if (accessoryServer_isServerAvailable())
  {
    v3 = [(ACCAssistiveTouchProvider *)v2 serverConnection];

    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
        }
        BOOL v4 = &_os_log_internal;
        id v5 = &_os_log_internal;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226E0E000, v4, OS_LOG_TYPE_DEFAULT, "assistiveTouch Connecting to XPC server...", buf, 2u);
      }

      v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.accessories.assistivetouch" options:4096];
      [(ACCAssistiveTouchProvider *)v2 setServerConnection:v6];

      id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAF5B78];
      id v8 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      [v8 setRemoteObjectInterface:v7];

      v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAF5BD8];
      uint64_t v10 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      [v10 setExportedInterface:v9];

      uint64_t v11 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      [v11 setExportedObject:v2];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __44__ACCAssistiveTouchProvider_connectToServer__block_invoke;
      v25[3] = &unk_2647E8770;
      objc_copyWeak(&v26, (id *)buf);
      v12 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      [v12 setInvalidationHandler:v25];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_86;
      v23[3] = &unk_2647E8770;
      objc_copyWeak(&v24, (id *)buf);
      v13 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      [v13 setInterruptionHandler:v23];

      v14 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      [v14 resume];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    v15 = [(ACCAssistiveTouchProvider *)v2 remoteObject];

    if (!v15)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
        }
        v16 = &_os_log_internal;
        id v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226E0E000, v16, OS_LOG_TYPE_DEFAULT, "assistiveTouch Getting remote object...", buf, 2u);
      }

      uint64_t v18 = [(ACCAssistiveTouchProvider *)v2 serverConnection];
      v19 = [v18 remoteObjectProxyWithErrorHandler:&__block_literal_global];
      [(ACCAssistiveTouchProvider *)v2 setRemoteObject:v19];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v20 = [(ACCAssistiveTouchProvider *)v2 remoteObject];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_89;
      v21[3] = &unk_2647E8748;
      objc_copyWeak(&v22, (id *)buf);
      [v20 initConnection:v21];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
  objc_sync_exit(v2);
}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_226E0E000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch XPC connection invalidated!", v9, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  [v8 accessoryAssistiveTouchDetachAll];
}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_86(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226E0E000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch XPC connection interrupted!", v8, 2u);
  }
}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_226E0E000, v5, OS_LOG_TYPE_DEFAULT, "assistiveTouch XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_226E0E000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_89(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_226E0E000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (void)accessoryAssistiveTouchAttached:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  uint64_t v7 = [(NSMutableDictionary *)accessories objectForKey:v4];
  if (v7)
  {
    int v8 = (ACCAssistiveTouchAccessory *)v7;
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      uint64_t v11 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    else
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v8;
      v12 = "accessoryAssistiveTouchAttached: accessory %@ (%@) already exists!";
LABEL_20:
      _os_log_impl(&dword_226E0E000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    int v8 = [[ACCAssistiveTouchAccessory alloc] initWithAccessoryUID:v4];
    [(NSMutableDictionary *)*p_accessories setObject:v8 forKey:v4];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      uint64_t v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v8;
      v12 = "accessoryAssistiveTouchAttached: accessory %@, accessory=%@";
      goto LABEL_20;
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    v14 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACCAssistiveTouchProvider accessoryAssistiveTouchAttached:]();
  }
}

- (void)accessoryAssistiveTouchDetached:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  uint64_t v7 = [(NSMutableDictionary *)accessories objectForKey:v4];
  int v8 = (void *)v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      uint64_t v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_226E0E000, v11, OS_LOG_TYPE_INFO, "accessoryAssistiveTouchDetached: accessory %@, accessory=%@", (uint8_t *)&v17, 0x16u);
    }

    [(NSMutableDictionary *)*p_accessories removeObjectForKey:v4];
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_226E0E000, v12, OS_LOG_TYPE_INFO, "accessoryAssistiveTouchDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v17, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    id v15 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACCAssistiveTouchProvider accessoryAssistiveTouchDetached:]();
  }
}

- (void)accessoryAssistiveTouchDetachAll
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_accessories count];
    int v9 = 134217984;
    uint64_t v10 = v6;
    _os_log_impl(&dword_226E0E000, v5, OS_LOG_TYPE_INFO, "accessoryAssistiveTouchDetachAll: detach %lu accessories!", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  accessories = self->_accessories;
  self->_accessories = v7;
}

- (void)setEnabled:(id)a3 flag:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  int v8 = (void *)v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      uint64_t v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412802;
      id v25 = v6;
      __int16 v26 = 2112;
      v27 = v8;
      __int16 v28 = 1024;
      LODWORD(v29) = v4;
      _os_log_impl(&dword_226E0E000, v11, OS_LOG_TYPE_INFO, "assistiveTouch setEnabled: accessory %@, accessory=%@, flag=%d", (uint8_t *)&v24, 0x1Cu);
    }

    [v8 setDesiredAssistiveTouchState:v4];
    BOOL v14 = [(ACCAssistiveTouchProvider *)self calculateDesiredState:v6];
    uint64_t v15 = [(ACCAssistiveTouchProvider *)self delegate];
    if (v15
      && (id v16 = (void *)v15,
          [(ACCAssistiveTouchProvider *)self delegate],
          int v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      __int16 v19 = [(ACCAssistiveTouchProvider *)self delegate];
      [v19 assistiveTouch:self setEnabled:v14];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        __int16 v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
        }
        __int16 v19 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(ACCAssistiveTouchProvider *)self delegate];
        int v24 = 138412802;
        id v25 = v6;
        __int16 v26 = 2112;
        v27 = v8;
        __int16 v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_226E0E000, v19, OS_LOG_TYPE_INFO, "assistiveTouch setEnabled: accessory %@ (%@) delegate does not respond to selector %@", (uint8_t *)&v24, 0x20u);
      }
    }
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      v12 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      v27 = 0;
      _os_log_impl(&dword_226E0E000, v12, OS_LOG_TYPE_INFO, "assistiveTouch setEnabled: accessory %@ (%@) does not exist!", (uint8_t *)&v24, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      __int16 v19 = &_os_log_internal;
      id v23 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACCAssistiveTouchProvider setEnabled:flag:]();
    }
  }
}

- (void)requestState:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  id v6 = (void *)v5;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects <= 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (v5)
  {
    if (v8)
    {
      BOOL v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      BOOL v9 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      char v18 = v6;
      _os_log_impl(&dword_226E0E000, v9, OS_LOG_TYPE_INFO, "assistiveTouch requestState: accessory %@, accessory=%@", (uint8_t *)&v15, 0x16u);
    }

    [(ACCAssistiveTouchProvider *)self notifyAssistiveTouchEnabledState:self->_cachedState];
  }
  else
  {
    if (v8)
    {
      int v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      int v10 = &_os_log_internal;
      id v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      char v18 = 0;
      _os_log_impl(&dword_226E0E000, v10, OS_LOG_TYPE_INFO, "assistiveTouch requestState: accessory %@ (%@) does not exist!", (uint8_t *)&v15, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      }
      id v13 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ACCAssistiveTouchProvider requestState:]();
    }
  }
}

- (void)notifyAssistiveTouchEnabledState:(BOOL)a3
{
  self->_cachedState = a3;
  if (self->_remoteObject) {
    -[ACCAssistiveTouchXPCServerProtocol notifyEnabledState:provider:](self->_remoteObject, "notifyEnabledState:provider:");
  }
}

- (BOOL)calculateDesiredState:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_accessories objectForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 desiredAssistiveTouchState];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (ACCAssistiveTouchProviderProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (ACCAssistiveTouchXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (BOOL)cachedState
{
  return self->_cachedState;
}

- (void)setCachedState:(BOOL)a3
{
  self->_cachedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
}

void __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226E0E000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)accessoryAssistiveTouchAttached:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_226E0E000, v0, v1, "accessoryAssistiveTouchAttached: accessory %@ _accessories=%@");
}

- (void)accessoryAssistiveTouchDetached:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_226E0E000, v0, v1, "accessoryAssistiveTouchDetached: accessory %@ _accessories=%@");
}

- (void)setEnabled:flag:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_226E0E000, v0, v1, "assistiveTouch setEnabled: accessory %@ (%@) does not exist! _accessories=%@");
}

- (void)requestState:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_226E0E000, v0, v1, "assistiveTouch requestState: accessory %@ (%@) does not exist! _accessories=%@");
}

@end