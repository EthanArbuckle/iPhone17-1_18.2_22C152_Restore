@interface ACCOOBBTPairingProvider
- (ACCOOBBTPairingProvider)initWithDelegate:(id)a3;
- (ACCOOBBTPairingProviderProtocol)delegate;
- (ACCOOBBTPairingXPCServerProtocol)remoteObject;
- (NSMutableDictionary)accessories;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (id)accessoryInfoDictionaryForLogging:(id)a3;
- (void)accessoryOOBBTPairingAttached:(id)a3 accInfoDict:(id)a4;
- (void)accessoryOOBBTPairingBTAccessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6;
- (void)accessoryOOBBTPairingCompletionStatus:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 result:(unsigned __int8)a6;
- (void)accessoryOOBBTPairingDetachAll;
- (void)accessoryOOBBTPairingDetached:(id)a3;
- (void)connectToServer;
- (void)dealloc;
- (void)legacyConnectionIDForAccessoryUID:(id)a3 connectionID:(unsigned int)a4;
- (void)linkKeyInfo:(id)a3 oobBtPairingUID:(id)a4 linkKey:(id)a5 deviceMacAddr:(id)a6;
- (void)requestLegacyConnectionIDForAccessoryUID:(id)a3;
- (void)setAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)startOOBBTPairing:(id)a3;
- (void)stopOOBBTPairing:(id)a3;
@end

@implementation ACCOOBBTPairingProvider

- (ACCOOBBTPairingProvider)initWithDelegate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  init_logging();
  v19.receiver = self;
  v19.super_class = (Class)ACCOOBBTPairingProvider;
  v5 = [(ACCOOBBTPairingProvider *)&v19 init];
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
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      v9 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v5->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl(&dword_226F94000, v9, OS_LOG_TYPE_DEFAULT, "ACCOOBBTPairingProvider init, _providerUID=%@", buf, 0xCu);
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
    v17[2] = __44__ACCOOBBTPairingProvider_initWithDelegate___block_invoke;
    v17[3] = &unk_2647F69F8;
    objc_copyWeak(&v18, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.oobbtpairing.availability-changed", v17);
    [(ACCOOBBTPairingProvider *)v5 connectToServer];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __44__ACCOOBBTPairingProvider_initWithDelegate___block_invoke(uint64_t a1, int a2)
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
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
    _os_log_impl(&dword_226F94000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
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
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      uint64_t v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_226F94000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(ACCOOBBTPairingProvider *)self serverConnection];
  [v3 invalidate];

  [(ACCOOBBTPairingProvider *)self setServerConnection:0];
  objc_storeWeak((id *)&self->_delegate, 0);
  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACCOOBBTPairingProvider;
  [(ACCOOBBTPairingProvider *)&v6 dealloc];
}

- (void)connectToServer
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_226F94000, log, OS_LOG_TYPE_DEBUG, "Call initConnection to remoteObject=%@", buf, 0xCu);
}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke(uint64_t a1)
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_226F94000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  [v8 accessoryOOBBTPairingDetachAll];
}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke_94(uint64_t a1)
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226F94000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke_95(uint64_t a1, void *a2)
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
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
    _os_log_impl(&dword_226F94000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    objc_super v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    objc_super v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_226F94000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke_97(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingProvider initWithDelegate:]();
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
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_226F94000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v13, 8u);
  }

  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (a2)
  {
    uint64_t v10 = [WeakRetained remoteObject];
    id v11 = objc_loadWeakRetained(v7);
    v12 = [v11 providerUID];
    [v10 notifyOfProvider:v12];
  }
  else
  {
    uint64_t v10 = [WeakRetained serverConnection];
    [v10 invalidate];
  }
}

- (void)accessoryOOBBTPairingAttached:(id)a3 accInfoDict:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_accessories objectForKey:v6];
  if (v8)
  {
    id v9 = (ACCOOBBTPairingAccessory *)v8;
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      v13 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    else
    {
      v13 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_226F94000, v13, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingAttached: accessory %@ (%@) already exists!", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v9 = [[ACCOOBBTPairingAccessory alloc] initWithAccessoryUID:v6];
    [(NSMutableDictionary *)self->_accessories setObject:v9 forKey:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained oobBtPairing:self accessoryAttached:v6 accInfoDict:v7];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      v13 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = [(ACCOOBBTPairingProvider *)self accessoryInfoDictionaryForLogging:v7];
      int v18 = 138412802;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_226F94000, v13, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingAttached: accessory %@, accessory=%@ accInfoDict=%@", (uint8_t *)&v18, 0x20u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    v16 = &_os_log_internal;
    id v17 = &_os_log_internal;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ACCOOBBTPairingProvider accessoryOOBBTPairingAttached:accInfoDict:]();
  }
}

- (void)accessoryOOBBTPairingDetached:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v9 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_226F94000, v9, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingDetached: accessory %@, accessory=%@", (uint8_t *)&v16, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained oobBtPairing:self accessoryDetached:v4];

    [(NSMutableDictionary *)self->_accessories removeObjectForKey:v4];
  }
  else
  {
    if (v8)
    {
      BOOL v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      BOOL v10 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = 0;
      _os_log_impl(&dword_226F94000, v10, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v16, 0x16u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    id v14 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACCOOBBTPairingProvider accessoryOOBBTPairingDetached:]();
  }
}

- (void)accessoryOOBBTPairingDetachAll
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_226F94000, a2, OS_LOG_TYPE_DEBUG, "accessoryOOBBTPairingDetachAll: notify detach of %lu accessories!", (uint8_t *)&v3, 0xCu);
}

- (void)accessoryOOBBTPairingBTAccessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(NSMutableDictionary *)self->_accessories objectForKey:v10];
  id v14 = (void *)v13;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects <= 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  if (v13)
  {
    if (v16)
    {
      id v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v17 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 138413314;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 1024;
      int v28 = v6;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_226F94000, v17, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingBTAccessoryInfo: accessory %@, oobBtPairingUID %@ accessoryMacAddr %@ deviceClass=%d, accessory=%@", (uint8_t *)&v21, 0x30u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained oobBtPairing:self accessoryInfo:v10 oobBtPairingUID:v11 accessoryMacAddr:v12 deviceClass:v6];
  }
  else
  {
    if (v16)
    {
      id WeakRetained = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id WeakRetained = &_os_log_internal;
      id v20 = &_os_log_internal;
    }
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = 0;
      _os_log_impl(&dword_226F94000, WeakRetained, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingBTAccessoryInfo: accessory %@ (%@) does not exist!", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)accessoryOOBBTPairingCompletionStatus:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 result:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(NSMutableDictionary *)self->_accessories objectForKey:v10];
  id v14 = (void *)v13;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects <= 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  if (v13)
  {
    if (v16)
    {
      id v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v17 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 138413314;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 1024;
      int v28 = v6;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_226F94000, v17, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingCompletionStatus: accessory %@, oobBtPairingUID %@, accessoryMacAddr %@, result=%d, accessory=%@", (uint8_t *)&v21, 0x30u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained oobBtPairing:self completion:v10 oobBtPairingUID:v11 accessoryMacAddr:v12 result:v6];
  }
  else
  {
    if (v16)
    {
      id WeakRetained = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id WeakRetained = &_os_log_internal;
      id v20 = &_os_log_internal;
    }
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = 0;
      _os_log_impl(&dword_226F94000, WeakRetained, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingCompletionStatus: accessory %@ (%@) does not exist!", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)startOOBBTPairing:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    BOOL v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_226F94000, v7, OS_LOG_TYPE_INFO, "startOOBBTPairing: %@", (uint8_t *)&v12, 0xCu);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCOOBBTPairingXPCServerProtocol *)remoteObject startOOBBTPairing:v4];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v9 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      BOOL v15 = providerUID;
      _os_log_impl(&dword_226F94000, v9, OS_LOG_TYPE_DEFAULT, "startOOBBTPairing: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)stopOOBBTPairing:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    BOOL v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_226F94000, v7, OS_LOG_TYPE_INFO, "stopOOBBTPairing: %@", (uint8_t *)&v12, 0xCu);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCOOBBTPairingXPCServerProtocol *)remoteObject stopOOBBTPairing:v4];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v9 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      BOOL v15 = providerUID;
      _os_log_impl(&dword_226F94000, v9, OS_LOG_TYPE_DEFAULT, "stopOOBBTPairing: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)linkKeyInfo:(id)a3 oobBtPairingUID:(id)a4 linkKey:(id)a5 deviceMacAddr:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (NSString *)a4;
  id v12 = a5;
  id v13 = a6;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    uint64_t v16 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  else
  {
    uint64_t v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v21 = 138413058;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = [v12 length];
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl(&dword_226F94000, v16, OS_LOG_TYPE_INFO, "linkKeyInfo: %@ oobBtPairingUID: %@ linkKey:len=%lu deviceMacAddr: %@", (uint8_t *)&v21, 0x2Au);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCOOBBTPairingXPCServerProtocol *)remoteObject linkKeyInfo:v10 oobBtPairingUID:v11 linkKey:v12 deviceMacAddr:v13];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      __int16 v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = providerUID;
      _os_log_impl(&dword_226F94000, v18, OS_LOG_TYPE_DEFAULT, "linkKeyInfo: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)requestLegacyConnectionIDForAccessoryUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
      -[ACCOOBBTPairingProvider initWithDelegate:]();
    }
    BOOL v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_226F94000, v7, OS_LOG_TYPE_INFO, "requestLegacyConnectionIDForAccessoryUID: %@", (uint8_t *)&v12, 0xCu);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    [(ACCOOBBTPairingXPCServerProtocol *)remoteObject requestLegacyConnectionIDForAccessoryUID:v4];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v9 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = providerUID;
      _os_log_impl(&dword_226F94000, v9, OS_LOG_TYPE_DEFAULT, "requestLegacyConnectionIDForAccessoryUID: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)legacyConnectionIDForAccessoryUID:(id)a3 connectionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  *(void *)&v18[13] = *MEMORY[0x263EF8340];
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
      id v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412802;
      id v16 = v6;
      __int16 v17 = 1024;
      *(_DWORD *)__int16 v18 = v4;
      v18[2] = 2112;
      *(void *)&v18[3] = v8;
      _os_log_impl(&dword_226F94000, v11, OS_LOG_TYPE_INFO, "legacyConnectionIDForAccessoryUID: accessory %@, connectionID=%u, accessory=%@", (uint8_t *)&v15, 0x1Cu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained oobBtPairing:self legacyConnectionIDForAccessoryUID:v6 connectionID:v4];
  }
  else
  {
    if (v10)
    {
      id WeakRetained = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingProvider initWithDelegate:]();
      }
      id WeakRetained = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      *(void *)__int16 v18 = 0;
      _os_log_impl(&dword_226F94000, WeakRetained, OS_LOG_TYPE_INFO, "legacyConnectionIDForAccessoryUID: accessory %@ (%@) does not exist!", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)accessoryInfoDictionaryForLogging:(id)a3
{
  int v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  uint64_t v4 = [v3 objectForKey:@"ACCOOBBTPairingCertData"];

  if (v4)
  {
    BOOL v5 = [v3 objectForKey:@"ACCOOBBTPairingCertData"];
    uint64_t v6 = [v5 length];

    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu bytes", v6);
    [v3 setObject:v7 forKey:@"ACCOOBBTPairingCertData"];
  }
  int v8 = [v3 objectForKey:@"ACCOOBBTPairingCertSerial"];

  if (v8)
  {
    BOOL v9 = [v3 objectForKey:@"ACCOOBBTPairingCertSerial"];
    uint64_t v10 = [v9 length];

    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu bytes", v10);
    [v3 setObject:v11 forKey:@"ACCOOBBTPairingCertSerial"];
  }
  return v3;
}

- (ACCOOBBTPairingProviderProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCOOBBTPairingProviderProtocol *)WeakRetained;
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

- (ACCOOBBTPairingXPCServerProtocol)remoteObject
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
  OUTLINED_FUNCTION_1(&dword_226F94000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)accessoryOOBBTPairingAttached:accInfoDict:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_226F94000, v0, v1, "accessoryOOBBTPairingAttached: accessory %@, _accessories=%@");
}

- (void)accessoryOOBBTPairingDetached:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_226F94000, v0, v1, "accessoryOOBBTPairingDetached: accessory %@, _accessories=%@");
}

@end