@interface ACCVoiceOverProvider
- (ACCVoiceOverProvider)initWithDelegate:(id)a3;
- (ACCVoiceOverProviderProtocol)delegate;
- (ACCVoiceOverXPCServerProtocol)remoteObject;
- (BOOL)calculateDesiredState:(id)a3;
- (NSMutableDictionary)accessories;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (void)accessoryVoiceOver:(id)a3 performAction:(int)a4 parameters:(id)a5;
- (void)accessoryVoiceOver:(id)a3 requestConfiguration:(int)a4 param:(id)a5;
- (void)accessoryVoiceOver:(id)a3 setContext:(int)a4;
- (void)accessoryVoiceOver:(id)a3 setEnabled:(BOOL)a4;
- (void)accessoryVoiceOverAttached:(id)a3;
- (void)accessoryVoiceOverDetachAll;
- (void)accessoryVoiceOverDetached:(id)a3;
- (void)accessoryVoiceOverStartCursorInformationUpdate:(id)a3;
- (void)accessoryVoiceOverStartInformationUpdate:(id)a3;
- (void)accessoryVoiceOverStopCursorInformationUpdate:(id)a3;
- (void)accessoryVoiceOverStopInformationUpdate:(id)a3;
- (void)connectToServer;
- (void)dealloc;
- (void)setAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)updateVoiceOverCursorInfo:(id)a3;
- (void)updateVoiceOverInfo:(id)a3;
@end

@implementation ACCVoiceOverProvider

- (ACCVoiceOverProvider)initWithDelegate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  init_logging();
  v19.receiver = self;
  v19.super_class = (Class)ACCVoiceOverProvider;
  v5 = [(ACCVoiceOverProvider *)&v19 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    providerUID = v5->_providerUID;
    v5->_providerUID = (NSString *)v7;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      v9 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v5->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl(&dword_228AB1000, v9, OS_LOG_TYPE_DEFAULT, "ACCVoiceOverProvider init, _providerUID=%@", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v5->_serverConnection;
    v5->_serverConnection = 0;

    remoteObject = v5->_remoteObject;
    v5->_remoteObject = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessories = v5->_accessories;
    v5->_accessories = v14;

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v5);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__ACCVoiceOverProvider_initWithDelegate___block_invoke;
    v17[3] = &unk_26484FA78;
    objc_copyWeak(&v18, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.voiceover.availability-changed", v17);
    [(ACCVoiceOverProvider *)v5 connectToServer];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __41__ACCVoiceOverProvider_initWithDelegate___block_invoke(uint64_t a1, int a2)
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
      -[ACCVoiceOverProvider initWithDelegate:]();
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
    _os_log_impl(&dword_228AB1000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(ACCVoiceOverProvider *)self serverConnection];
  [v3 invalidate];

  [(ACCVoiceOverProvider *)self setServerConnection:0];
  objc_storeWeak((id *)&self->_delegate, 0);
  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACCVoiceOverProvider;
  [(ACCVoiceOverProvider *)&v6 dealloc];
}

- (void)connectToServer
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_228AB1000, log, OS_LOG_TYPE_DEBUG, "Call initConnection to remoteObject=%@", buf, 0xCu);
}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke(uint64_t a1)
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
    objc_super v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_228AB1000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  [v8 accessoryVoiceOverDetachAll];
}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke_97(uint64_t a1)
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
    objc_super v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_228AB1000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke_98(uint64_t a1, void *a2)
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
      -[ACCVoiceOverProvider initWithDelegate:]();
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
    _os_log_impl(&dword_228AB1000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    objc_super v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_228AB1000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke_100(uint64_t a1, int a2)
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
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    objc_super v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_228AB1000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (void)accessoryVoiceOverAttached:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  if (v5)
  {
    objc_super v6 = (ACCVoiceOverAccessory *)v5;
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v10 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    else
    {
      uint64_t v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v6;
      uint64_t v11 = "accessoryVoiceOverAttached: accessory %@ (%@) already exists!";
LABEL_20:
      _os_log_impl(&dword_228AB1000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    objc_super v6 = [[ACCVoiceOverAccessory alloc] initWithAccessoryUID:v4];
    [(NSMutableDictionary *)self->_accessories setObject:v6 forKey:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceOver:self accessoryAttached:v4];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v10 = &_os_log_internal;
      id v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v6;
      uint64_t v11 = "accessoryVoiceOverAttached: accessory %@, accessory=%@";
      goto LABEL_20;
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    v13 = &_os_log_internal;
    id v14 = &_os_log_internal;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ACCVoiceOverProvider accessoryVoiceOverAttached:]();
  }
}

- (void)accessoryVoiceOverDetached:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  objc_super v6 = (void *)v5;
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
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v9 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_228AB1000, v9, OS_LOG_TYPE_INFO, "accessoryVoiceOverDetached: accessory %@, accessory=%@", (uint8_t *)&v16, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceOver:self accessoryDetached:v4];

    [(NSMutableDictionary *)self->_accessories removeObjectForKey:v4];
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v10 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl(&dword_228AB1000, v10, OS_LOG_TYPE_INFO, "accessoryVoiceOverDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v16, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    id v14 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACCVoiceOverProvider accessoryVoiceOverDetached:]();
  }
}

- (void)accessoryVoiceOverDetachAll
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_228AB1000, a2, OS_LOG_TYPE_DEBUG, "accessoryVoiceOverDetachAll: notify detach of %lu accessories!", (uint8_t *)&v3, 0xCu);
}

- (void)accessoryVoiceOver:(id)a3 setEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  int v8 = (NSMutableDictionary *)v7;
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
      id v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412802;
      id v26 = v6;
      __int16 v27 = 1024;
      BOOL v28 = v4;
      __int16 v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_228AB1000, v11, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setEnabled: %d, accessory=%@", (uint8_t *)&v25, 0x1Cu);
    }

    [(NSMutableDictionary *)v8 setDesiredVoiceOverState:v4];
    BOOL v14 = [(ACCVoiceOverProvider *)self calculateDesiredState:v6];
    uint64_t v15 = [(ACCVoiceOverProvider *)self delegate];
    if (v15
      && (int v16 = (void *)v15,
          [(ACCVoiceOverProvider *)self delegate],
          id v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      uint64_t v19 = [(ACCVoiceOverProvider *)self delegate];
      [v19 voiceOver:self setEnabled:v14 accessory:v6];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        uint64_t v19 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(ACCVoiceOverProvider *)self delegate];
        int v25 = 138412802;
        id v26 = v6;
        __int16 v27 = 1024;
        BOOL v28 = v4;
        __int16 v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_228AB1000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setEnabled: %d, delegate does not respond to selector %@", (uint8_t *)&v25, 0x1Cu);
      }
    }
  }
  else
  {
    if (v10)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v12 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412546;
      id v26 = v6;
      __int16 v27 = 1024;
      BOOL v28 = v4;
      _os_log_impl(&dword_228AB1000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setEnabled: %d, accessory does not exist!", (uint8_t *)&v25, 0x12u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v19 = &_os_log_internal;
      id v23 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      int v25 = 138412802;
      id v26 = v6;
      __int16 v27 = 1024;
      BOOL v28 = v4;
      __int16 v29 = 2112;
      v30 = accessories;
      _os_log_debug_impl(&dword_228AB1000, v19, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ setEnabled: %d, accessory does not exist! _accessories=%@", (uint8_t *)&v25, 0x1Cu);
    }
  }
}

- (void)accessoryVoiceOver:(id)a3 setContext:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  int v8 = (NSMutableDictionary *)v7;
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
      id v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412802;
      id v25 = v6;
      __int16 v26 = 1024;
      int v27 = v4;
      __int16 v28 = 2112;
      __int16 v29 = v8;
      _os_log_impl(&dword_228AB1000, v11, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setContext %d, accessory=%@", (uint8_t *)&v24, 0x1Cu);
    }

    uint64_t v14 = [(ACCVoiceOverProvider *)self delegate];
    if (v14
      && (uint64_t v15 = (void *)v14,
          [(ACCVoiceOverProvider *)self delegate],
          int v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      char v18 = [(ACCVoiceOverProvider *)self delegate];
      [v18 voiceOver:self setContext:v4 accessory:v6];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        char v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        char v18 = &_os_log_internal;
        id v19 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v20 = [(ACCVoiceOverProvider *)self delegate];
        int v24 = 138412802;
        id v25 = v6;
        __int16 v26 = 1024;
        int v27 = v4;
        __int16 v28 = 2112;
        __int16 v29 = v20;
        _os_log_impl(&dword_228AB1000, v18, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setContext: %d, delegate does not respond to selector %@", (uint8_t *)&v24, 0x1Cu);
      }
    }
  }
  else
  {
    if (v10)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v12 = &_os_log_internal;
      id v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v6;
      __int16 v26 = 1024;
      int v27 = v4;
      _os_log_impl(&dword_228AB1000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setContext: %d, accessory does not exist!", (uint8_t *)&v24, 0x12u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      char v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      char v18 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      int v24 = 138412802;
      id v25 = v6;
      __int16 v26 = 1024;
      int v27 = v4;
      __int16 v28 = 2112;
      __int16 v29 = accessories;
      _os_log_debug_impl(&dword_228AB1000, v18, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ setContext: %d, accessory does not exist! _accessories=%@", (uint8_t *)&v24, 0x1Cu);
    }
  }
}

- (void)accessoryVoiceOver:(id)a3 performAction:(int)a4 parameters:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_accessories objectForKey:v8];
  id v11 = (NSMutableDictionary *)v10;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v14 = &_os_log_internal;
      id v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v27 = 138413058;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_228AB1000, v14, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ performAction: %d parameters: %@, accessory=%@", (uint8_t *)&v27, 0x26u);
    }

    uint64_t v17 = [(ACCVoiceOverProvider *)self delegate];
    if (v17
      && (char v18 = (void *)v17,
          [(ACCVoiceOverProvider *)self delegate],
          id v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = objc_opt_respondsToSelector(),
          v19,
          v18,
          (v20 & 1) != 0))
    {
      id v21 = [(ACCVoiceOverProvider *)self delegate];
      [v21 voiceOver:self performAction:v6 parameters:v9 accessory:v8];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        id v21 = &_os_log_internal;
        id v22 = &_os_log_internal;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v23 = [(ACCVoiceOverProvider *)self delegate];
        int v27 = 138413058;
        id v28 = v8;
        __int16 v29 = 1024;
        int v30 = v6;
        __int16 v31 = 2112;
        id v32 = v9;
        __int16 v33 = 2112;
        v34 = v23;
        _os_log_impl(&dword_228AB1000, v21, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ performAction: %d parameters: %@, delegate does not respond to selector %@", (uint8_t *)&v27, 0x26u);
      }
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v15 = &_os_log_internal;
      id v24 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412802;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_228AB1000, v15, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ performAction: %d parameters: %@, accessory does not exist!", (uint8_t *)&v27, 0x1Cu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v21 = &_os_log_internal;
      id v25 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      int v27 = 138413058;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      v34 = accessories;
      _os_log_debug_impl(&dword_228AB1000, v21, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ performAction: %d parameters: %@, accessory does not exist! _accessories=%@", (uint8_t *)&v27, 0x26u);
    }
  }
}

- (void)accessoryVoiceOver:(id)a3 requestConfiguration:(int)a4 param:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_accessories objectForKey:v8];
  id v11 = (NSMutableDictionary *)v10;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v14 = &_os_log_internal;
      id v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v27 = 138413058;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_228AB1000, v14, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, accessory=%@", (uint8_t *)&v27, 0x26u);
    }

    uint64_t v17 = [(ACCVoiceOverProvider *)self delegate];
    if (v17
      && (char v18 = (void *)v17,
          [(ACCVoiceOverProvider *)self delegate],
          id v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = objc_opt_respondsToSelector(),
          v19,
          v18,
          (v20 & 1) != 0))
    {
      id v21 = [(ACCVoiceOverProvider *)self delegate];
      [v21 voiceOver:self requestConfigure:v6 value:v9 accessory:v8];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        id v21 = &_os_log_internal;
        id v22 = &_os_log_internal;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v23 = [(ACCVoiceOverProvider *)self delegate];
        int v27 = 138413058;
        id v28 = v8;
        __int16 v29 = 1024;
        int v30 = v6;
        __int16 v31 = 2112;
        id v32 = v9;
        __int16 v33 = 2112;
        v34 = v23;
        _os_log_impl(&dword_228AB1000, v21, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, delegate does not respond to selector %@", (uint8_t *)&v27, 0x26u);
      }
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      uint64_t v15 = &_os_log_internal;
      id v24 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412802;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_228AB1000, v15, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, accessory does not exist!", (uint8_t *)&v27, 0x1Cu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v21 = &_os_log_internal;
      id v25 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      int v27 = 138413058;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      v34 = accessories;
      _os_log_debug_impl(&dword_228AB1000, v21, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, accessory does not exist! _accessories=%@", (uint8_t *)&v27, 0x26u);
    }
  }
}

- (void)accessoryVoiceOverStartInformationUpdate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  id v9 = (void *)v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      BOOL v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      BOOL v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v4;
      __int16 v26 = 2112;
      int v27 = v9;
      _os_log_impl(&dword_228AB1000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v15 = [(ACCVoiceOverProvider *)self delegate];
    if (v15
      && (id v16 = (void *)v15,
          [(ACCVoiceOverProvider *)self delegate],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      id v19 = [(ACCVoiceOverProvider *)self delegate];
      [v19 voiceOverStartInformationUpdate:self accessory:v4];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        id v19 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = [(ACCVoiceOverProvider *)self delegate];
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        int v27 = v21;
        _os_log_impl(&dword_228AB1000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    if (v11)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      int v13 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_228AB1000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v19 = &_os_log_internal;
      id v23 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACCVoiceOverProvider accessoryVoiceOverStartInformationUpdate:]();
    }
  }
}

- (void)accessoryVoiceOverStopInformationUpdate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  id v9 = (void *)v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      BOOL v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      BOOL v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v4;
      __int16 v26 = 2112;
      int v27 = v9;
      _os_log_impl(&dword_228AB1000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v15 = [(ACCVoiceOverProvider *)self delegate];
    if (v15
      && (id v16 = (void *)v15,
          [(ACCVoiceOverProvider *)self delegate],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      id v19 = [(ACCVoiceOverProvider *)self delegate];
      [v19 voiceOverStopInformationUpdate:self accessory:v4];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        id v19 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = [(ACCVoiceOverProvider *)self delegate];
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        int v27 = v21;
        _os_log_impl(&dword_228AB1000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    if (v11)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      int v13 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_228AB1000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v19 = &_os_log_internal;
      id v23 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACCVoiceOverProvider accessoryVoiceOverStopInformationUpdate:]();
    }
  }
}

- (void)accessoryVoiceOverStartCursorInformationUpdate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  id v9 = (void *)v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      BOOL v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      BOOL v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v4;
      __int16 v26 = 2112;
      int v27 = v9;
      _os_log_impl(&dword_228AB1000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v15 = [(ACCVoiceOverProvider *)self delegate];
    if (v15
      && (id v16 = (void *)v15,
          [(ACCVoiceOverProvider *)self delegate],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      id v19 = [(ACCVoiceOverProvider *)self delegate];
      [v19 voiceOverStartCursorInformationUpdate:self accessory:v4];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        id v19 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = [(ACCVoiceOverProvider *)self delegate];
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        int v27 = v21;
        _os_log_impl(&dword_228AB1000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    if (v11)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      int v13 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_228AB1000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v19 = &_os_log_internal;
      id v23 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACCVoiceOverProvider accessoryVoiceOverStartCursorInformationUpdate:]();
    }
  }
}

- (void)accessoryVoiceOverStopCursorInformationUpdate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v4];
  id v9 = (void *)v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      BOOL v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      BOOL v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v4;
      __int16 v26 = 2112;
      int v27 = v9;
      _os_log_impl(&dword_228AB1000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v15 = [(ACCVoiceOverProvider *)self delegate];
    if (v15
      && (id v16 = (void *)v15,
          [(ACCVoiceOverProvider *)self delegate],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      id v19 = [(ACCVoiceOverProvider *)self delegate];
      [v19 voiceOverStopCursorInformationUpdate:self accessory:v4];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCVoiceOverProvider initWithDelegate:]();
        }
        id v19 = &_os_log_internal;
        id v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = [(ACCVoiceOverProvider *)self delegate];
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        int v27 = v21;
        _os_log_impl(&dword_228AB1000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    if (v11)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      int v13 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_228AB1000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      id v19 = &_os_log_internal;
      id v23 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACCVoiceOverProvider accessoryVoiceOverStopCursorInformationUpdate:]();
    }
  }
}

- (void)updateVoiceOverInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    providerUID = self->_providerUID;
    remoteObject = self->_remoteObject;
    int v14 = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = providerUID;
    __int16 v18 = 2112;
    id v19 = remoteObject;
    _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_INFO, "updateVoiceOverInfo: %@, _providerUID=%@ _remoteObject=%@", (uint8_t *)&v14, 0x20u);
  }

  BOOL v10 = self->_remoteObject;
  if (v10)
  {
    [(ACCVoiceOverXPCServerProtocol *)v10 update:self->_providerUID info:v4];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      int v11 = &_os_log_internal;
      id v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = self->_providerUID;
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_228AB1000, v11, OS_LOG_TYPE_DEFAULT, "updateVoiceOverInfo: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)updateVoiceOverCursorInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCVoiceOverProvider initWithDelegate:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    providerUID = self->_providerUID;
    remoteObject = self->_remoteObject;
    int v14 = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = providerUID;
    __int16 v18 = 2112;
    id v19 = remoteObject;
    _os_log_impl(&dword_228AB1000, v7, OS_LOG_TYPE_INFO, "updateVoiceOverCursorInfo: %@, _providerUID=%@ _remoteObject=%@", (uint8_t *)&v14, 0x20u);
  }

  BOOL v10 = self->_remoteObject;
  if (v10)
  {
    [(ACCVoiceOverXPCServerProtocol *)v10 update:self->_providerUID cursorInfo:v4];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCVoiceOverProvider initWithDelegate:]();
      }
      int v11 = &_os_log_internal;
      id v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = self->_providerUID;
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_228AB1000, v11, OS_LOG_TYPE_DEFAULT, "updateVoiceOverCursorInfo: %@, _remoteObject nil _providerUID=%@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (BOOL)calculateDesiredState:(id)a3
{
  int v3 = [(NSMutableDictionary *)self->_accessories objectForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 desiredVoiceOverState];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (ACCVoiceOverProviderProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCVoiceOverProviderProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (ACCVoiceOverXPCServerProtocol)remoteObject
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_228AB1000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)accessoryVoiceOverAttached:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_228AB1000, v0, v1, "accessoryVoiceOverAttached: accessory %@ _accessories=%@");
}

- (void)accessoryVoiceOverDetached:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_228AB1000, v0, v1, "accessoryVoiceOverDetached: accessory %@ _accessories=%@");
}

- (void)accessoryVoiceOverStartInformationUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_228AB1000, v0, v1, "accessoryVoiceOverStartInformationUpdate: %@, accessory does not exist! _accessories=%@");
}

- (void)accessoryVoiceOverStopInformationUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_228AB1000, v0, v1, "accessoryVoiceOverStopInformationUpdate: %@, accessory does not exist! _accessories=%@");
}

- (void)accessoryVoiceOverStartCursorInformationUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_228AB1000, v0, v1, "accessoryVoiceOverStartCursorInformationUpdate: %@, accessory does not exist! _accessories=%@");
}

- (void)accessoryVoiceOverStopCursorInformationUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_228AB1000, v0, v1, "accessoryVoiceOverStopCursorInformationUpdate: %@, accessory does not exist! _accessories=%@");
}

@end