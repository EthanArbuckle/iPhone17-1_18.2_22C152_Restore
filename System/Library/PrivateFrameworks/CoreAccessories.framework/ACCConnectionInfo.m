@interface ACCConnectionInfo
+ (id)accessoryDictionaryForLogging:(id)a3;
+ (id)copyLocalizedAccessoryName:(id)a3;
+ (id)sharedInstance;
- (ACCConnectionInfo)init;
- (ACCConnectionInfoConfigStreamDelegateProtocol)configStreamDelegate;
- (ACCConnectionInfoPrivateDelegateProtocol)delegate;
- (ACCConnectionInfoPrivateDelegateProtocol)delegateForIdentifier;
- (ACCConnectionInfoXPCServerProtocol)remoteObject;
- (BOOL)accessoryConnectionFiltered:(id)a3 withFilter:(id)a4;
- (BOOL)accessoryEndpointFiltered:(id)a3 withFilter:(id)a4 forConnection:(id)a5;
- (BOOL)configStreamCategoriesRequest:(id)a3 connection:(id)a4 withReply:(id)a5;
- (BOOL)configStreamPropertyRequest:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 withReply:(id)a7;
- (BOOL)registerDelegate:(id)a3;
- (BOOL)registerDelegate:(id)a3 withFilter:(id)a4;
- (BOOL)registerDelegate:(id)a3 withIdentifier:(id)a4;
- (NSDictionary)accessoryFilterDictionary;
- (NSLock)listLock;
- (NSLock)serverConnectionLock;
- (NSMutableDictionary)connectionList;
- (NSMutableDictionary)endpointList;
- (NSString)identifier;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (id)accessoryInfoForConnectionSync:(id)a3;
- (id)accessoryInfoForEndpointSync:(id)a3 connection:(id)a4;
- (id)accessoryPropertySync:(id)a3 forConnection:(id)a4;
- (id)accessoryPropertySync:(id)a3 forEndpoint:(id)a4 connection:(id)a5;
- (id)configStreamGetResponseHandler;
- (id)copyLocalizedAccessoryNameFromDaemon:(id)a3;
- (int)accessoryConnectionType:(id)a3;
- (int)accessoryEndpointProtocolType:(id)a3 connection:(id)a4;
- (int)accessoryEndpointTransportType:(id)a3 connection:(id)a4;
- (int)getInterceptCountForEndpoint:(id)a3 connection:(id)a4;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5;
- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6;
- (void)accessoryEndpointsForConnection:(id)a3 withReply:(id)a4;
- (void)accessoryInfoForConnection:(id)a3 withReply:(id)a4;
- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5;
- (void)accessoryProperty:(id)a3 forConnection:(id)a4 withReply:(id)a5;
- (void)accessoryProperty:(id)a3 forEndpoint:(id)a4 connection:(id)a5 withReply:(id)a6;
- (void)beginUserKeyErase:(id)a3 withReply:(id)a4;
- (void)beginVendorKeyErase:(id)a3 withReply:(id)a4;
- (void)cancelUserKeyErase:(id)a3 withReply:(id)a4;
- (void)cancelVendorKeyErase:(id)a3 withReply:(id)a4;
- (void)configStreamCategoriesResponse:(id)a3 forEndpoint:(id)a4 connection:(id)a5 success:(BOOL)a6;
- (void)configStreamCategoryListReady:(id)a3 connection:(id)a4;
- (void)configStreamPropertyResponse:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 value:(id)a7 success:(BOOL)a8;
- (void)configStreamPropertySetValue:(id)a3 forProperty:(unsigned __int8)a4 forCategory:(unsigned __int16)a5 forEndpoint:(id)a6 connection:(id)a7;
- (void)connectToServer;
- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7;
- (void)continueVendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7;
- (void)copyUserPrivateKey:(id)a3 withReply:(id)a4;
- (void)dealloc;
- (void)getAccessoryUserName:(id)a3 withReply:(id)a4;
- (void)getPairingStatus:(id)a3 withReply:(id)a4;
- (void)getPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)getPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)handleInterceptData:(id)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)interceptIncomingNTimes:(int)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)notifyDelegateOfServerDisconnectAndCleanup;
- (void)provisionAccessoryForFindMy:(id)a3 withReply:(id)a4;
- (void)resetPairingInformation:(id)a3 withReply:(id)a4;
- (void)sendData:(id)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)setAccessoryUserName:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)setConfigStreamDelegate:(id)a3;
- (void)setConfigStreamGetResponseHandler:(id)a3;
- (void)setConnectionList:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateForIdentifier:(id)a3;
- (void)setEndpointList:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setListLock:(id)a3;
- (void)setPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)setProviderUID:(id)a3;
- (void)setPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setServerConnectionLock:(id)a3;
@end

@implementation ACCConnectionInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __35__ACCConnectionInfo_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(ACCConnectionInfo);

  return MEMORY[0x1F41817F8]();
}

+ (id)copyLocalizedAccessoryName:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ACCConnectionInfo)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  init_logging();
  v23.receiver = self;
  v23.super_class = (Class)ACCConnectionInfo;
  v3 = [(ACCConnectionInfo *)&v23 init];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    providerUID = v3->_providerUID;
    v3->_providerUID = (NSString *)v5;

    objc_storeWeak((id *)&v3->_delegate, 0);
    objc_storeWeak((id *)&v3->_delegateForIdentifier, 0);
    objc_storeWeak((id *)&v3->_configStreamDelegate, 0);
    accessoryFilterDictionary = v3->_accessoryFilterDictionary;
    v3->_accessoryFilterDictionary = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    listLock = v3->_listLock;
    v3->_listLock = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    serverConnectionLock = v3->_serverConnectionLock;
    v3->_serverConnectionLock = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    connectionList = v3->_connectionList;
    v3->_connectionList = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointList = v3->_endpointList;
    v3->_endpointList = v15;

    if (gLogObjects && gNumLogObjects >= 8)
    {
      v17 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v3->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo init, _providerUID=%@", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v3);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __25__ACCConnectionInfo_init__block_invoke;
    v21[3] = &unk_1E6073418;
    objc_copyWeak(&v22, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandlerForServiceEntry("com.apple.accessories.connection-info-server.availability-changed", v21, 1u);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __25__ACCConnectionInfo_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 8;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v20, 8u);
  }

  if (a2)
  {
    v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v7);
    v9 = [WeakRetained serverConnectionLock];
    [v9 lock];

    id v10 = objc_loadWeakRetained(v7);
    v11 = [v10 delegate];

    if (gLogObjects) {
      BOOL v12 = gNumLogObjects <= 7;
    }
    else {
      BOOL v12 = 1;
    }
    int v13 = !v12;
    if (v11)
    {
      if (v13)
      {
        v14 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        v14 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20[0]) = 0;
        _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v20, 2u);
      }

      v15 = objc_loadWeakRetained(v7);
      [v15 connectToServer];
    }
    else
    {
      if (v13)
      {
        v15 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        v15 = MEMORY[0x1E4F14500];
        id v17 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20[0]) = 0;
        _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "No delegate, will not connect to server...", (uint8_t *)v20, 2u);
      }
    }

    id v18 = objc_loadWeakRetained(v7);
    v19 = [v18 serverConnectionLock];
    [v19 unlock];
  }
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C21000, v5, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo dealloc", buf, 2u);
  }

  accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(1);
  v6 = [(ACCConnectionInfo *)self serverConnection];
  [v6 invalidate];

  connectionList = self->_connectionList;
  self->_connectionList = 0;

  endpointList = self->_endpointList;
  self->_endpointList = 0;

  objc_storeWeak((id *)&self->_delegateForIdentifier, 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_configStreamDelegate, 0);
  listLock = self->_listLock;
  self->_listLock = 0;

  accessoryFilterDictionary = self->_accessoryFilterDictionary;
  self->_accessoryFilterDictionary = 0;

  v11.receiver = self;
  v11.super_class = (Class)ACCConnectionInfo;
  [(ACCConnectionInfo *)&v11 dealloc];
}

- (id)copyLocalizedAccessoryNameFromDaemon:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  objc_super v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  [(ACCConnectionInfo *)self connectToServer];
  id v5 = [(ACCConnectionInfo *)self serverConnection];
  if (!v5
    || ([(ACCConnectionInfo *)self remoteObject],
        v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = v6 == 0,
        v6,
        v5,
        v7))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v10 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCConnectionInfo copyLocalizedAccessoryNameFromDaemon:]();
    }
  }
  else
  {
    v8 = [(ACCConnectionInfo *)self serverConnection];
    v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_21;
    v17[3] = &unk_1E6073460;
    id v18 = v4;
    v19 = &v20;
    [v9 copyLocalizedAccessoryName:v18 withReply:v17];

    id v10 = v18;
  }

  if (gLogObjects && gNumLogObjects >= 8)
  {
    BOOL v12 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v21[5];
    *(_DWORD *)buf = 138412546;
    id v27 = v4;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "from daemon, localize: name: %@ -> %@", buf, 0x16u);
  }

  id v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 8;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "copyLocalizedAccessoryName got response: %@ -> %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (BOOL)registerDelegate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v23 = 138412546;
    id v24 = WeakRetained;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo registerDelegate %@ -> %@", (uint8_t *)&v23, 0x16u);
  }
  [(NSLock *)self->_serverConnectionLock lock];
  objc_storeWeak((id *)&self->_delegate, v4);
  if (objc_opt_respondsToSelector()) {
    objc_storeWeak((id *)&self->_configStreamDelegate, v4);
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v9)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      int v10 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v10 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Delegate set, trying to connect to server...", (uint8_t *)&v23, 2u);
    }

    uint64_t v14 = [(ACCConnectionInfo *)self serverConnection];
    if (v14
      && (id v15 = (void *)v14,
          [(ACCConnectionInfo *)self remoteObject],
          id v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      id v17 = [MEMORY[0x1E4F28B50] mainBundle];
      id v18 = [v17 bundleIdentifier];

      v19 = [(ACCConnectionInfo *)self serverConnection];
      uint64_t v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];
      [v20 notifyOfClient:self->_providerUID bundleID:v18 withFilter:self->_accessoryFilterDictionary];
    }
    else
    {
      [(ACCConnectionInfo *)self connectToServer];
    }
  }
  else
  {
    uint64_t v11 = [(ACCConnectionInfo *)self serverConnection];

    if (v11)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        __int16 v12 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        __int16 v12 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "Delegate unset...", (uint8_t *)&v23, 2u);
      }
    }
  }
  [(NSLock *)self->_serverConnectionLock unlock];

  return 1;
}

void __38__ACCConnectionInfo_registerDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (BOOL)registerDelegate:(id)a3 withIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    int v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
    int v26 = 138412802;
    id v27 = WeakRetained;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo registerDelegate %@ -> %@ withIdentifier %@", (uint8_t *)&v26, 0x20u);
  }
  if (v7)
  {
    [(NSLock *)self->_serverConnectionLock lock];
    objc_storeWeak((id *)&self->_delegateForIdentifier, v6);
    objc_storeStrong((id *)&self->_identifier, a4);
    id v12 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);

    if (v12)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v13 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        id v13 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "Delegate set, trying to connect to server...", (uint8_t *)&v26, 2u);
      }

      uint64_t v17 = [(ACCConnectionInfo *)self serverConnection];
      if (v17
        && (id v18 = (void *)v17,
            [(ACCConnectionInfo *)self remoteObject],
            v19 = objc_claimAutoreleasedReturnValue(),
            v19,
            v18,
            v19))
      {
        uint64_t v20 = [MEMORY[0x1E4F28B50] mainBundle];
        id v21 = [v20 bundleIdentifier];

        uint64_t v22 = [(ACCConnectionInfo *)self serverConnection];
        int v23 = [v22 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_29];
        [v23 notifyOfClient:self->_providerUID bundleID:v21 withFilter:0 forIdentifier:v7];
      }
      else
      {
        [(ACCConnectionInfo *)self connectToServer];
      }
    }
    else
    {
      uint64_t v14 = [(ACCConnectionInfo *)self serverConnection];

      if (v14)
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          id v15 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportPlugin initWithDelegate:]();
          }
          id v15 = MEMORY[0x1E4F14500];
          id v24 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "Delegate unset...", (uint8_t *)&v26, 2u);
        }
      }
    }
    [(NSLock *)self->_serverConnectionLock unlock];
  }

  return v7 != 0;
}

void __53__ACCConnectionInfo_registerDelegate_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (BOOL)registerDelegate:(id)a3 withFilter:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    int v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    accessoryFilterDictionary = self->_accessoryFilterDictionary;
    int v27 = 138413058;
    id v28 = WeakRetained;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    uint64_t v32 = accessoryFilterDictionary;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo registerDelegate %@ -> %@, withFilter %@ -> %@", (uint8_t *)&v27, 0x2Au);
  }
  [(NSLock *)self->_serverConnectionLock lock];
  objc_storeWeak((id *)&self->_delegate, v6);
  if (objc_opt_respondsToSelector()) {
    objc_storeWeak((id *)&self->_configStreamDelegate, v6);
  }
  objc_storeStrong((id *)&self->_accessoryFilterDictionary, a4);
  id v13 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v13)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      uint64_t v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "Delegate and Filter set, trying to connect to server...", (uint8_t *)&v27, 2u);
    }

    uint64_t v18 = [(ACCConnectionInfo *)self serverConnection];
    if (v18
      && (v19 = (void *)v18,
          [(ACCConnectionInfo *)self remoteObject],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          v20,
          v19,
          v20))
    {
      id v21 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v22 = [v21 bundleIdentifier];

      int v23 = [(ACCConnectionInfo *)self serverConnection];
      id v24 = [v23 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_31];
      [v24 notifyOfClient:self->_providerUID bundleID:v22 withFilter:self->_accessoryFilterDictionary];
    }
    else
    {
      [(ACCConnectionInfo *)self connectToServer];
    }
  }
  else
  {
    id v15 = [(ACCConnectionInfo *)self serverConnection];

    if (v15)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v16 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        id v16 = MEMORY[0x1E4F14500];
        id v25 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1B3C21000, v16, OS_LOG_TYPE_DEFAULT, "Delegate unset...", (uint8_t *)&v27, 2u);
      }
    }
  }
  [(NSLock *)self->_serverConnectionLock unlock];

  return 1;
}

void __49__ACCConnectionInfo_registerDelegate_withFilter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)notifyDelegateOfServerDisconnectAndCleanup
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  OUTLINED_FUNCTION_5();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1B3C21000, a3, OS_LOG_TYPE_DEBUG, "notifyDelegateOfServerDisconnectAndCleanup _delegate=%@ tmpConnectionList=%@", v6, 0x16u);
}

- (void)connectToServer
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (accessoryServer_isServerAvailableForServiceEntry(1u))
  {
    BOOL v3 = [(ACCConnectionInfo *)v2 serverConnection];

    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v4 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        id v4 = MEMORY[0x1E4F14500];
        id v5 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to ConnectionInfo XPC server...", buf, 2u);
      }

      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.accessories.connection-info-server" options:4096];
      [(ACCConnectionInfo *)v2 setServerConnection:v6];

      __int16 v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C7B020];
      uint64_t v8 = [(ACCConnectionInfo *)v2 serverConnection];
      [v8 setRemoteObjectInterface:v7];

      uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C7B080];
      int v10 = [(ACCConnectionInfo *)v2 serverConnection];
      [v10 setExportedInterface:v9];

      uint64_t v11 = [(ACCConnectionInfo *)v2 serverConnection];
      [v11 setExportedObject:v2];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __36__ACCConnectionInfo_connectToServer__block_invoke;
      v47[3] = &unk_1E6073488;
      objc_copyWeak(&v48, (id *)buf);
      id v12 = [(ACCConnectionInfo *)v2 serverConnection];
      [v12 setInvalidationHandler:v47];

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __36__ACCConnectionInfo_connectToServer__block_invoke_173;
      v45[3] = &unk_1E6073488;
      objc_copyWeak(&v46, (id *)buf);
      id v13 = [(ACCConnectionInfo *)v2 serverConnection];
      [v13 setInterruptionHandler:v45];

      if (gLogObjects && gNumLogObjects >= 8)
      {
        uint64_t v14 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        uint64_t v14 = MEMORY[0x1E4F14500];
        id v15 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "resuming ConnectionInfo XPC connection", v44, 2u);
      }

      id v16 = [(ACCConnectionInfo *)v2 serverConnection];
      [v16 resume];

      objc_destroyWeak(&v46);
      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
    }
  }
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 8;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v19 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  else
  {
    v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [(ACCConnectionInfo *)v2 remoteObject];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v20;
    _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_DEFAULT, "self.remoteObject = %@", buf, 0xCu);
  }
  id v21 = [(ACCConnectionInfo *)v2 remoteObject];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      int v23 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v23 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C21000, v23, OS_LOG_TYPE_DEFAULT, "Getting remote object...", buf, 2u);
    }

    id v25 = [(ACCConnectionInfo *)v2 serverConnection];
    int v26 = [v25 remoteObjectProxyWithErrorHandler:&__block_literal_global_176];
    [(ACCConnectionInfo *)v2 setRemoteObject:v26];

    if (gLogObjects && gNumLogObjects >= 8)
    {
      int v27 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v27 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C21000, v27, OS_LOG_TYPE_DEFAULT, "Registering with remote service...", buf, 2u);
    }

    __int16 v29 = [(ACCConnectionInfo *)v2 serverConnection];
    if (!v29
      || ([(ACCConnectionInfo *)v2 remoteObject],
          id v30 = objc_claimAutoreleasedReturnValue(),
          BOOL v31 = v30 == 0,
          v30,
          v29,
          v31))
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        __int16 v33 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        __int16 v33 = MEMORY[0x1E4F14500];
        id v42 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3C21000, v33, OS_LOG_TYPE_DEFAULT, "Skip registering with remote service... No serverConnection or remoteObject!", buf, 2u);
      }
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F28B50] mainBundle];
      __int16 v33 = [v32 bundleIdentifier];

      id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
      if (WeakRetained)
      {
        uint64_t v35 = [(ACCConnectionInfo *)v2 serverConnection];
        v36 = [v35 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_179];
        [v36 notifyOfClient:v2->_providerUID bundleID:v33 withFilter:v2->_accessoryFilterDictionary];
      }
      id v37 = objc_loadWeakRetained((id *)&v2->_delegateForIdentifier);
      if (v37)
      {
        BOOL v38 = v2->_identifier == 0;

        if (!v38)
        {
          v39 = [(ACCConnectionInfo *)v2 serverConnection];
          v40 = [v39 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_182];
          [v40 notifyOfClient:v2->_providerUID bundleID:v33 withFilter:0 forIdentifier:v2->_identifier];
        }
      }
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v41 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        v41 = MEMORY[0x1E4F14500];
        id v43 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3C21000, v41, OS_LOG_TYPE_DEFAULT, "Registering with remote service... done!", buf, 2u);
      }
    }
  }
  objc_sync_exit(v2);
}

void __36__ACCConnectionInfo_connectToServer__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v4 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "ConnectionInfo XPC begin invalidation handler!", buf, 2u);
  }

  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  __int16 v7 = [WeakRetained serverConnection];
  [v7 setInvalidationHandler:0];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setRemoteObject:0];

  id v9 = objc_loadWeakRetained(v5);
  [v9 setServerConnection:0];

  accessoryServer_serverIsUnreachableForServiceEntry(1);
  if (gLogObjects && gNumLogObjects >= 8)
  {
    int v10 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ConnectionInfo XPC connection invalidated!", v13, 2u);
  }

  id v12 = objc_loadWeakRetained(v5);
  [v12 notifyDelegateOfServerDisconnectAndCleanup];
}

void __36__ACCConnectionInfo_connectToServer__block_invoke_173(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v4 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "ConnectionInfo XPC connection interrupted!", v11, 2u);
  }

  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  __int16 v7 = [WeakRetained serverConnection];
  [v7 invalidate];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setServerConnection:0];

  id v9 = objc_loadWeakRetained(v5);
  [v9 setRemoteObject:0];

  id v10 = objc_loadWeakRetained(v5);
  [v10 notifyDelegateOfServerDisconnectAndCleanup];
}

void __36__ACCConnectionInfo_connectToServer__block_invoke_174(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __36__ACCConnectionInfo_connectToServer__block_invoke_177(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __36__ACCConnectionInfo_connectToServer__block_invoke_180(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (BOOL)accessoryConnectionFiltered:(id)a3 withFilter:(id)a4
{
  uint64_t v6 = ACCConnectionInfoFilterAllowConnectionType;
  id v7 = a3;
  id v8 = [a4 objectForKey:v6];
  unsigned int v9 = [v8 unsignedIntValue];
  char v10 = [(ACCConnectionInfo *)self accessoryConnectionType:v7];

  BOOL v11 = v8 && ((v9 >> v10) & 1) == 0;
  return v11;
}

- (BOOL)accessoryEndpointFiltered:(id)a3 withFilter:(id)a4 forConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = ACCConnectionInfoFilterAllowEndpointTransport;
  id v11 = a4;
  uint64_t v12 = [v11 objectForKey:v10];
  uint64_t v13 = [v11 objectForKey:ACCConnectionInfoFilterAllowEndpointProtocol];

  if (v12 | v13)
  {
    unsigned int v14 = [(id)v12 unsignedIntValue];
    int v15 = [(id)v13 unsignedIntValue];
    char v16 = [(ACCConnectionInfo *)self accessoryEndpointTransportType:v8 connection:v9];
    char v17 = [(ACCConnectionInfo *)self accessoryEndpointProtocolType:v8 connection:v9];
    BOOL v19 = v12 && ((v14 >> v16) & 1) == 0 || ((1 << v17) & v15) == 0 && v13 != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v32 = a3;
  id v30 = a5;
  id v29 = a6;
  [(NSLock *)self->_listLock lock];
  id v10 = [(NSMutableDictionary *)self->_connectionList objectForKey:v32];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_connectionList setObject:v10 forKey:v32];
  }
  id v11 = [NSNumber numberWithInt:v8];
  [v10 setObject:v11 forKey:@"connectionType"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (uint64_t v13 = WeakRetained,
        [v10 objectForKey:@"Legacy"],
        unsigned int v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"Legacy"];
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
  }
  id v16 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
  unsigned int v31 = v8;
  id v27 = v10;
  if (v16
    && (char v17 = v16,
        objc_msgSend(v10, "objectForKey:", self->_identifier, v10),
        id v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKey:self->_identifier];
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  [(NSLock *)self->_listLock unlock];
  char v20 = 1;
  do
  {
    char v21 = v20;
    if (v20)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
      int v24 = v15;
    }
    else
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
      int v24 = v19;
    }
    id v25 = accessoryFilterDictionary;
    if (v22)
    {
      BOOL v26 = [(ACCConnectionInfo *)self accessoryConnectionFiltered:v32 withFilter:v25];
      if (v24)
      {
        if (!v26)
        {
          if (objc_opt_respondsToSelector()) {
            [v22 accessoryConnectionAttached:v32 type:v31];
          }
          if (objc_opt_respondsToSelector()) {
            [v22 accessoryConnectionAttached:v32 type:v31 info:v30 properties:v29];
          }
        }
      }
    }

    char v20 = 0;
  }
  while ((v21 & 1) != 0);
}

- (void)accessoryConnectionDetached:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_accessoryFilterDictionary) {
    BOOL v5 = -[ACCConnectionInfo accessoryConnectionFiltered:withFilter:](self, "accessoryConnectionFiltered:withFilter:", v4);
  }
  else {
    BOOL v5 = 0;
  }
  [(NSLock *)self->_listLock lock];
  uint64_t v6 = [(NSMutableDictionary *)self->_connectionList objectForKey:v4];
  id v22 = v6;
  if (v6)
  {
    [v6 objectForKey:@"endpointList"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          [(NSMutableDictionary *)self->_endpointList removeObjectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = 0;
  }
  [(NSMutableDictionary *)self->_connectionList removeObjectForKey:v4];
  [(NSLock *)self->_listLock unlock];
  int v12 = 1;
  do
  {
    int v13 = v12;
    if (v12) {
      uint64_t v14 = 24;
    }
    else {
      uint64_t v14 = 32;
    }
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v14));
    if (WeakRetained && !(v13 & v5))
    {
      if (objc_opt_respondsToSelector())
      {
        BOOL v16 = v5;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v17 = v7;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v24 != v20) {
                objc_enumerationMutation(v17);
              }
              [WeakRetained accessoryEndpointDetached:*(void *)(*((void *)&v23 + 1) + 8 * j) forConnection:v4];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v19);
        }

        BOOL v5 = v16;
      }
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryConnectionDetached:v4];
      }
    }

    int v12 = 0;
  }
  while ((v13 & 1) != 0);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v38 = a3;
  id v35 = a6;
  id v10 = a7;
  [(NSLock *)self->_listLock lock];
  id v11 = [(NSMutableDictionary *)self->_connectionList objectForKey:v10];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_connectionList setObject:v11 forKey:v10];
  }
  id v12 = [v11 objectForKey:@"endpointList"];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v11 setObject:v12 forKey:@"endpointList"];
  }
  [v12 addObject:v38];
  id v13 = [(NSMutableDictionary *)self->_endpointList objectForKey:v38];
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_endpointList setObject:v13 forKey:v38];
  }
  uint64_t v14 = [NSNumber numberWithInt:a4];
  [v13 setObject:v14 forKey:@"transportType"];

  int v15 = [NSNumber numberWithInt:a5];
  [v13 setObject:v15 forKey:@"protocolType"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v33 = v12;
  if (WeakRetained
    && (id v17 = WeakRetained,
        [v13 objectForKey:@"Legacy"],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:@"Legacy"];
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  id v20 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
  id v34 = v11;
  id v31 = v13;
  if (v20
    && (char v21 = v20,
        objc_msgSend(v13, "objectForKey:", self->_identifier, v13, v33, v11),
        id v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        !v22))
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:self->_identifier];
    int v23 = 1;
  }
  else
  {
    int v23 = 0;
  }
  [(NSLock *)self->_listLock unlock];
  char v24 = 1;
  do
  {
    char v25 = v24;
    if (v24)
    {
      id v26 = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
      int v28 = v19;
    }
    else
    {
      id v26 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
      int v28 = v23;
    }
    long long v29 = accessoryFilterDictionary;
    if (v26)
    {
      BOOL v30 = [(ACCConnectionInfo *)self accessoryEndpointFiltered:v38 withFilter:v29 forConnection:v10];
      if (v28)
      {
        if (!v30)
        {
          if (objc_opt_respondsToSelector()) {
            [v26 accessoryEndpointAttached:v38 transportType:a4 protocol:a5 forConnection:v10];
          }
          if (objc_opt_respondsToSelector()) {
            [v26 accessoryEndpointAttached:v38 transportType:a4 protocol:a5 properties:v35 forConnection:v10];
          }
        }
      }
    }

    char v24 = 0;
  }
  while ((v25 & 1) != 0);
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = v6;
  accessoryFilterDictionary = self->_accessoryFilterDictionary;
  if (accessoryFilterDictionary) {
    BOOL v9 = [(ACCConnectionInfo *)self accessoryEndpointFiltered:v18 withFilter:accessoryFilterDictionary forConnection:v6];
  }
  else {
    BOOL v9 = 0;
  }
  [(NSLock *)self->_listLock lock];
  id v10 = [(NSMutableDictionary *)self->_connectionList objectForKey:v7];
  id v11 = v10;
  id v12 = v18;
  if (v10)
  {
    id v13 = [v10 objectForKey:@"endpointList"];
    [v13 removeObject:v18];

    id v12 = v18;
  }
  [(NSMutableDictionary *)self->_endpointList removeObjectForKey:v12];
  [(NSLock *)self->_listLock unlock];
  int v14 = 1;
  do
  {
    int v15 = v14;
    if (v14) {
      uint64_t v16 = 24;
    }
    else {
      uint64_t v16 = 32;
    }
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v16));
    if (WeakRetained && (v15 ^ 1) & 1 | !v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained accessoryEndpointDetached:v18 forConnection:v7];
    }

    int v14 = 0;
  }
  while ((v15 & 1) != 0);
}

- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v25 = a3;
  id v24 = a5;
  id v10 = a6;
  [(NSLock *)self->_listLock lock];
  id v11 = [(NSMutableDictionary *)self->_connectionList objectForKey:v10];
  int v23 = v11;
  if (v11
    && ([v11 objectForKey:@"endpointList"],
        (id v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v21 = v12;
    if ([v12 containsObject:v25])
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_endpointList objectForKey:v25];
      if (v13)
      {
        int v14 = (void *)v13;
        int v15 = [NSNumber numberWithInt:v8];
        [v14 setObject:v15 forKey:@"protocolType"];
      }
    }
  }
  else
  {
    char v21 = 0;
  }
  [(NSLock *)self->_listLock unlock];
  char v16 = 1;
  do
  {
    char v17 = v16;
    if (v16)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
    }
    id v20 = accessoryFilterDictionary;
    if (WeakRetained
      && ![(ACCConnectionInfo *)self accessoryEndpointFiltered:v25 withFilter:v20 forConnection:v10])
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryEndpointUpdate:v25 protocol:v8 forConnection:v10];
      }
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryEndpointUpdate:v25 protocol:v8 properties:v24 forConnection:v10];
      }
    }

    char v16 = 0;
  }
  while ((v17 & 1) != 0);
}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  char v7 = 1;
  do
  {
    char v8 = v7;
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
    }
    id v11 = accessoryFilterDictionary;
    if (WeakRetained
      && ![(ACCConnectionInfo *)self accessoryConnectionFiltered:v12 withFilter:v11])
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryConnectionInfoPropertyChanged:v12];
      }
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryConnectionInfoPropertyChanged:v12 properties:v6];
      }
    }

    char v7 = 0;
  }
  while ((v8 & 1) != 0);
}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = 1;
  do
  {
    char v11 = v10;
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
    }
    int v14 = accessoryFilterDictionary;
    if (WeakRetained
      && ![(ACCConnectionInfo *)self accessoryEndpointFiltered:v15 withFilter:v14 forConnection:v9])
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryEndpointInfoPropertyChanged:v15 forConnection:v9];
      }
      if (objc_opt_respondsToSelector()) {
        [WeakRetained accessoryEndpointInfoPropertyChanged:v15 properties:v8 forConnection:v9];
      }
    }

    char v10 = 0;
  }
  while ((v11 & 1) != 0);
}

- (void)handleInterceptData:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = 1;
  do
  {
    char v11 = v10;
    if (v10) {
      uint64_t v12 = 24;
    }
    else {
      uint64_t v12 = 32;
    }
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v12));
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained handleInterceptData:v14 forEndpoint:v8 connection:v9];
    }

    char v10 = 0;
  }
  while ((v11 & 1) != 0);
}

- (void)configStreamCategoryListReady:(id)a3 connection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    char v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    char v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configStreamDelegate);
    int v18 = 138412802;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = WeakRetained;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamCategoryListReady: %@ - %@, _configStreamDelegate %@", (uint8_t *)&v18, 0x20u);
  }
  p_configStreamDelegate = &self->_configStreamDelegate;
  id v13 = objc_loadWeakRetained((id *)p_configStreamDelegate);
  if (v13)
  {
    id v14 = v13;
    id v15 = objc_loadWeakRetained((id *)p_configStreamDelegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)p_configStreamDelegate);
      [v17 configStreamCategoryListReady:v6 connection:v7];
    }
  }
}

- (void)configStreamCategoriesResponse:(id)a3 forEndpoint:(id)a4 connection:(id)a5 success:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 8;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v15 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v18 = 138413058;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamCategoriesResponse: %@ - %@, success %d, categories %@", (uint8_t *)&v18, 0x26u);
  }

  char v16 = _Block_copy(self->_configStreamGetResponseHandler);
  id configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
  self->_id configStreamGetResponseHandler = 0;

  if (v16) {
    (*((void (**)(void *, id, id, void, void, void, id, BOOL))v16 + 2))(v16, v11, v12, 0, 0, 0, v10, v6);
  }
}

- (void)configStreamPropertyResponse:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 value:(id)a7 success:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 8;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v19 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v22 = 138413570;
    id v23 = v15;
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 1024;
    int v29 = v12;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    __int16 v32 = 2112;
    id v33 = v16;
    _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamPropertyResponse: %@ - %@, cat 0x%x, prop %d, success %d, val %@", (uint8_t *)&v22, 0x32u);
  }

  __int16 v20 = (void (**)(void *, id, id, uint64_t, uint64_t, id, void, BOOL))_Block_copy(self->_configStreamGetResponseHandler);
  id configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
  self->_id configStreamGetResponseHandler = 0;

  if (v20) {
    v20[2](v20, v14, v15, v11, v12, v16, 0, v8);
  }
}

- (void)accessoryEndpointsForConnection:(id)a3 withReply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = [(ACCConnectionInfo *)self serverConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_205];
    [v9 accessoryEndpointsForConnection:v6 withReply:v7];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 8;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v8 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    else
    {
      BOOL v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryEndpointsForConnection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __63__ACCConnectionInfo_accessoryEndpointsForConnection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)accessoryInfoForConnection:(id)a3 withReply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = [(ACCConnectionInfo *)self serverConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_207];
    [v9 accessoryInfoForConnection:v6 withReply:v7];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 8;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v8 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    else
    {
      BOOL v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryInfoForConnection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __58__ACCConnectionInfo_accessoryInfoForConnection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(ACCConnectionInfo *)self serverConnection];
    int v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_209];
    [v12 accessoryInfoForEndpoint:v8 connection:v9 withReply:v10];
  }
  else
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 8;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v11 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    else
    {
      id v11 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryInfoForEndpoint: %@ connection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v15, 0x16u);
    }
  }
}

void __67__ACCConnectionInfo_accessoryInfoForEndpoint_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (id)accessoryInfoForConnectionSync:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  BOOL v5 = [(ACCConnectionInfo *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_211];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ACCConnectionInfo_accessoryInfoForConnectionSync___block_invoke_212;
  v9[3] = &unk_1E60734B0;
  v9[4] = &v10;
  [v6 accessoryInfoForConnection:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__ACCConnectionInfo_accessoryInfoForConnectionSync___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __52__ACCConnectionInfo_accessoryInfoForConnectionSync___block_invoke_212(uint64_t a1, int a2, id obj)
{
}

- (id)accessoryInfoForEndpointSync:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  __int16 v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v8 = [(ACCConnectionInfo *)self serverConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_215];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__ACCConnectionInfo_accessoryInfoForEndpointSync_connection___block_invoke_216;
  v12[3] = &unk_1E60734D8;
  v12[4] = &v13;
  [v9 accessoryInfoForEndpoint:v6 connection:v7 withReply:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __61__ACCConnectionInfo_accessoryInfoForEndpointSync_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __61__ACCConnectionInfo_accessoryInfoForEndpointSync_connection___block_invoke_216(uint64_t a1, int a2, int a3, id obj)
{
}

- (void)accessoryProperty:(id)a3 forConnection:(id)a4 withReply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(ACCConnectionInfo *)self serverConnection];
    uint64_t v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_219];
    [v12 accessoryProperty:v8 forConnection:v9 withReply:v10];
  }
  else
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 8;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v11 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    else
    {
      id v11 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryProperty: %@ forConnection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v15, 0x16u);
    }
  }
}

void __63__ACCConnectionInfo_accessoryProperty_forConnection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)accessoryProperty:(id)a3 forEndpoint:(id)a4 connection:(id)a5 withReply:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = [(ACCConnectionInfo *)self serverConnection];
    int v15 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_221];
    [v15 accessoryProperty:v10 forEndpoint:v11 connection:v12 withReply:v13];
  }
  else
  {
    if (gLogObjects) {
      BOOL v16 = gNumLogObjects < 8;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    else
    {
      id v14 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412802;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryPropery: %@ forEndpoint: %@ connection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0x20u);
    }
  }
}

void __72__ACCConnectionInfo_accessoryProperty_forEndpoint_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (BOOL)configStreamCategoriesRequest:(id)a3 connection:(id)a4 withReply:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 8;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v13 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    __int16 v30 = _Block_copy(v10);
    BOOL v31 = _Block_copy(self->_configStreamGetResponseHandler);
    *(_DWORD *)buf = 138413058;
    id v38 = v9;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 2048;
    *(void *)id v42 = v30;
    *(_WORD *)&v42[8] = 2048;
    id v43 = v31;
    _os_log_debug_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEBUG, "ACCConnectionInfo configStreamCategoriesRequest: [%@ : %@], responseHandler %p, _configStreamGetResponseHandler %p", buf, 0x2Au);
  }
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  if (v8 && v9 && v10 && !self->_configStreamGetResponseHandler)
  {
    __int16 v26 = _Block_copy(v10);
    id configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
    self->_id configStreamGetResponseHandler = v26;

    *((unsigned char *)v34 + 24) = 1;
    __int16 v28 = [(ACCConnectionInfo *)self serverConnection];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __72__ACCConnectionInfo_configStreamCategoriesRequest_connection_withReply___block_invoke;
    v32[3] = &unk_1E6073500;
    v32[4] = self;
    v32[5] = &v33;
    int v29 = [v28 remoteObjectProxyWithErrorHandler:v32];
    [v29 configStreamCategoriesRequest:v8 connection:v9];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_configStreamGetResponseHandler != 0;
      *(_DWORD *)buf = 138413058;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v9;
      __int16 v41 = 1024;
      *(_DWORD *)id v42 = v10 != 0;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v16;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo configStreamCategoriesRequest: %@ connection: %@, ERROR: called with no endpoint/connectionUUID/responseHandler(%d) or pending requestReply(%d)!!!", buf, 0x22u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    id v17 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    BOOL v19 = self->_configStreamGetResponseHandler != 0;
    int v20 = *((unsigned __int8 *)v34 + 24);
    *(_DWORD *)buf = 138413314;
    id v38 = v9;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 1024;
    *(_DWORD *)id v42 = v10 != 0;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v19;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v20;
    _os_log_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamCategoriesRequest: [%@ : %@], responseHandler(%d), _configStreamGetResponseHandler(%d), sendSuccess %d", buf, 0x28u);
  }

  int v21 = *((unsigned __int8 *)v34 + 24);
  BOOL v22 = v10 == 0;
  if (*((unsigned char *)v34 + 24)) {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    id v23 = self->_configStreamGetResponseHandler;
    self->_id configStreamGetResponseHandler = 0;

    (*((void (**)(id, id, id, void, void, void, void, void))v10 + 2))(v10, v8, v9, 0, 0, 0, 0, 0);
    int v21 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v24 = v21 != 0;
  _Block_object_dispose(&v33, 8);

  return v24;
}

void __72__ACCConnectionInfo_configStreamCategoriesRequest_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 8;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = 0;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

- (BOOL)configStreamPropertyRequest:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 withReply:(id)a7
{
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 8;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v17 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v17 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = _Block_copy(v14);
    uint64_t v34 = _Block_copy(self->_configStreamGetResponseHandler);
    *(_DWORD *)buf = 138413570;
    *(void *)id v42 = v13;
    *(_WORD *)&v42[8] = 2112;
    *(void *)id v43 = v12;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)uint64_t v44 = v9;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v10;
    __int16 v45 = 2048;
    *(void *)id v46 = v35;
    *(_WORD *)&v46[8] = 2048;
    v47 = v34;
    _os_log_debug_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_DEBUG, "ACCConnectionInfo configStreamPropertyRequest: [%@ : %@], categoryID 0x%x, propertyID %u, responseHandler %p, _configStreamGetResponseHandler %p", buf, 0x36u);
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if (v12 && v13 && v14 && !self->_configStreamGetResponseHandler)
  {
    __int16 v30 = _Block_copy(v14);
    id configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
    self->_id configStreamGetResponseHandler = v30;

    *((unsigned char *)v38 + 24) = 1;
    __int16 v32 = [(ACCConnectionInfo *)self serverConnection];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __94__ACCConnectionInfo_configStreamPropertyRequest_forCategory_forEndpoint_connection_withReply___block_invoke;
    v36[3] = &unk_1E6073500;
    v36[4] = self;
    v36[5] = &v37;
    uint64_t v33 = [v32 remoteObjectProxyWithErrorHandler:v36];
    [v33 configStreamPropertyRequest:v10 forCategory:v9 forEndpoint:v12 connection:v13];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v18 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v18 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = self->_configStreamGetResponseHandler != 0;
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)id v42 = v10;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v9;
      *(_WORD *)id v43 = 2112;
      *(void *)&v43[2] = v12;
      *(_WORD *)uint64_t v44 = 2112;
      *(void *)&v44[2] = v13;
      __int16 v45 = 1024;
      *(_DWORD *)id v46 = v14 != 0;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v20;
      _os_log_impl(&dword_1B3C21000, v18, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo requestConfigStreamProperty: %u forCateogry: %u forEndpoint: %@ connection: %@, ERROR: called with no endpoint/connectionUUID/responseHandler(%d) or pending requestReply(%d)!!!", buf, 0x2Eu);
    }
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    int v21 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    BOOL v23 = self->_configStreamGetResponseHandler != 0;
    int v24 = *((unsigned __int8 *)v38 + 24);
    *(_DWORD *)buf = 138413826;
    *(void *)id v42 = v13;
    *(_WORD *)&v42[8] = 2112;
    *(void *)id v43 = v12;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)uint64_t v44 = v9;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v10;
    __int16 v45 = 1024;
    *(_DWORD *)id v46 = v14 != 0;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v23;
    LOWORD(v47) = 1024;
    *(_DWORD *)((char *)&v47 + 2) = v24;
    _os_log_impl(&dword_1B3C21000, v21, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamPropertyRequest: [%@ : %@], categoryID 0x%x, propertyID %u, responseHandler(%d), _configStreamGetResponseHandler(%d), sendSuccess %d", buf, 0x34u);
  }

  int v25 = *((unsigned __int8 *)v38 + 24);
  BOOL v26 = v14 == 0;
  if (*((unsigned char *)v38 + 24)) {
    BOOL v26 = 1;
  }
  if (!v26)
  {
    id v27 = self->_configStreamGetResponseHandler;
    self->_id configStreamGetResponseHandler = 0;

    (*((void (**)(id, id, id, uint64_t, uint64_t, void, void, void))v14 + 2))(v14, v12, v13, v9, v10, 0, 0, 0);
    int v25 = *((unsigned __int8 *)v38 + 24);
  }
  BOOL v28 = v25 != 0;
  _Block_object_dispose(&v37, 8);

  return v28;
}

void __94__ACCConnectionInfo_configStreamPropertyRequest_forCategory_forEndpoint_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 8;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = 0;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

- (void)configStreamPropertySetValue:(id)a3 forProperty:(unsigned __int8)a4 forCategory:(unsigned __int16)a5 forEndpoint:(id)a6 connection:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v10 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  BOOL v15 = v14;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects <= 7;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  if (v13 && v14)
  {
    if (v17)
    {
      id v18 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v18 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v23 = 138413314;
      *(void *)int v24 = v15;
      *(_WORD *)&v24[8] = 2112;
      *(void *)int v25 = v13;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)BOOL v26 = v9;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v10;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl(&dword_1B3C21000, v18, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamPropertySetValue: [%@ : %@], categoryID 0x%x, propertyID %u, value %@", (uint8_t *)&v23, 0x2Cu);
    }

    id v19 = [(ACCConnectionInfo *)self serverConnection];
    id v22 = [v19 remoteObjectProxyWithErrorHandler:&__block_literal_global_223];
    [v22 configStreamPropertySetValue:v12 forProperty:v10 forCategory:v9 forEndpoint:v13 connection:v15];
  }
  else
  {
    if (v17)
    {
      id v19 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v19 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 67109890;
      *(_DWORD *)int v24 = v10;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v9;
      *(_WORD *)int v25 = 2112;
      *(void *)&v25[2] = v13;
      *(_WORD *)BOOL v26 = 2112;
      *(void *)&v26[2] = v15;
      _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo requestConfigStreamProperty: %u forCateogry: %u forEndpoint: %@ connection: %@, ERROR: called with no endpoint/connectionUUID!!!", (uint8_t *)&v23, 0x22u);
    }
  }
}

void __97__ACCConnectionInfo_configStreamPropertySetValue_forProperty_forCategory_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (id)accessoryPropertySync:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy_;
  int v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v8 = [(ACCConnectionInfo *)self serverConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_225];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ACCConnectionInfo_accessoryPropertySync_forConnection___block_invoke_226;
  v12[3] = &unk_1E6073528;
  v12[4] = &v13;
  [v9 accessoryProperty:v6 forConnection:v7 withReply:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __57__ACCConnectionInfo_accessoryPropertySync_forConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __57__ACCConnectionInfo_accessoryPropertySync_forConnection___block_invoke_226(uint64_t a1, int a2, int a3, id obj)
{
}

- (id)accessoryPropertySync:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  BOOL v11 = [(ACCConnectionInfo *)self serverConnection];
  id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_229];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__ACCConnectionInfo_accessoryPropertySync_forEndpoint_connection___block_invoke_230;
  v15[3] = &unk_1E6073550;
  v15[4] = &v16;
  [v12 accessoryProperty:v8 forEndpoint:v9 connection:v10 withReply:v15];

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __66__ACCConnectionInfo_accessoryPropertySync_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __66__ACCConnectionInfo_accessoryPropertySync_forEndpoint_connection___block_invoke_230(uint64_t a1, int a2, int a3, int a4, id obj)
{
}

- (int)accessoryConnectionType:(id)a3
{
  listLock = self->_listLock;
  id v5 = a3;
  [(NSLock *)listLock lock];
  id v6 = [(NSMutableDictionary *)self->_connectionList objectForKey:v5];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"connectionType"];
    int v8 = [v7 intValue];
  }
  else
  {
    int v8 = 11;
  }
  [(NSLock *)self->_listLock unlock];

  return v8;
}

- (int)accessoryEndpointTransportType:(id)a3 connection:(id)a4
{
  listLock = self->_listLock;
  id v6 = a3;
  [(NSLock *)listLock lock];
  id v7 = [(NSMutableDictionary *)self->_endpointList objectForKey:v6];

  if (v7)
  {
    int v8 = [v7 objectForKey:@"transportType"];
    int v9 = [v8 intValue];
  }
  else
  {
    int v9 = 17;
  }
  [(NSLock *)self->_listLock unlock];

  return v9;
}

- (int)accessoryEndpointProtocolType:(id)a3 connection:(id)a4
{
  listLock = self->_listLock;
  id v6 = a3;
  [(NSLock *)listLock lock];
  id v7 = [(NSMutableDictionary *)self->_endpointList objectForKey:v6];

  if (v7)
  {
    int v8 = [v7 objectForKey:@"protocolType"];
    int v9 = [v8 intValue];
  }
  else
  {
    int v9 = 0;
  }
  [(NSLock *)self->_listLock unlock];

  return v9;
}

- (void)interceptIncomingNTimes:(int)a3 forEndpoint:(id)a4 connection:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v12 = a4;
  id v8 = a5;
  int v9 = [(NSMutableDictionary *)self->_endpointList objectForKey:v12];
  if (v9)
  {
    id v10 = [(ACCConnectionInfo *)self serverConnection];
    BOOL v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_233];
    [v11 interceptIncomingNTimes:v6 forEndpoint:v12 connection:v8];
  }
}

void __68__ACCConnectionInfo_interceptIncomingNTimes_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (int)getInterceptCountForEndpoint:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  id v8 = [(NSMutableDictionary *)self->_endpointList objectForKey:v6];
  if (v8)
  {
    int v9 = [(ACCConnectionInfo *)self serverConnection];
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_235];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__ACCConnectionInfo_getInterceptCountForEndpoint_connection___block_invoke_236;
    v13[3] = &unk_1E6073578;
    v13[4] = &v14;
    [v10 getInterceptCountForEndpoint:v6 connection:v7 withReply:v13];
  }
  int v11 = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __61__ACCConnectionInfo_getInterceptCountForEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

uint64_t __61__ACCConnectionInfo_getInterceptCountForEndpoint_connection___block_invoke_236(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
  return result;
}

- (void)sendData:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  [(NSLock *)self->_listLock lock];
  id v10 = [(NSMutableDictionary *)self->_endpointList objectForKey:v8];
  if (v10)
  {
    int v11 = [(ACCConnectionInfo *)self serverConnection];
    id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_239];
    [v12 sendData:v13 forEndpoint:v8 connection:v9];
  }
  [(NSLock *)self->_listLock unlock];
}

void __53__ACCConnectionInfo_sendData_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  return +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:a3];
}

- (void)getAccessoryUserName:(id)a3 withReply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(ACCConnectionInfo *)self serverConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_242];
    [v9 getAccessoryUserName:v6 withReply:v7];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 8;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v8 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    else
    {
      id v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getAccessoryUserName: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __52__ACCConnectionInfo_getAccessoryUserName_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)setAccessoryUserName:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 7;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setAccessoryUserName:%@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v15 = [(ACCConnectionInfo *)self serverConnection];
    int v17 = [v15 remoteObjectProxyWithErrorHandler:&__block_literal_global_244];
    [v17 setAccessoryUserName:v8 forEndpoint:v9 withReply:v11];
  }
  else
  {
    if (v13)
    {
      uint64_t v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v15 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setAccessoryUserName:%@ %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v19, 0x16u);
    }
  }
}

void __64__ACCConnectionInfo_setAccessoryUserName_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)provisionAccessoryForFindMy:(id)a3 withReply:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 7;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo provisionAccessoryForFindMy:withReply:", (uint8_t *)&v21, 2u);
    }

    uint64_t v14 = [(ACCConnectionInfo *)self serverConnection];

    if (v14)
    {
      BOOL v12 = [(ACCConnectionInfo *)self serverConnection];
      uint64_t v15 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_246];
      [v15 provisionAccessoryForFindMy:v6 withReply:v8];

      goto LABEL_33;
    }
    if (gLogObjects && gNumLogObjects >= 8)
    {
      BOOL v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v12 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      int v17 = "ACCConnectionInfo provisionAccessoryForFindMy:withReply: !self.serverConnection";
      id v18 = v12;
      uint32_t v19 = 2;
      goto LABEL_32;
    }
  }
  else
  {
    if (v10)
    {
      BOOL v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v12 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v6;
      int v17 = "ACCConnectionInfo provisionAccessoryForFindMy: %@ endpoint, ERROR: called with no reply block!!!";
      id v18 = v12;
      uint32_t v19 = 12;
LABEL_32:
      _os_log_impl(&dword_1B3C21000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
    }
  }
LABEL_33:
}

void __59__ACCConnectionInfo_provisionAccessoryForFindMy_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __59__ACCConnectionInfo_provisionAccessoryForFindMy_withReply___block_invoke_cold_1();
  }
}

- (void)getPairingStatus:(id)a3 withReply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 7;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPairingStatus: %@ endpoint", buf, 0xCu);
    }

    uint64_t v14 = [(ACCConnectionInfo *)self serverConnection];
    uint64_t v15 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_248];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__ACCConnectionInfo_getPairingStatus_withReply___block_invoke_249;
    v17[3] = &unk_1E60735A0;
    id v18 = v8;
    [v15 getPairingStatus:v6 withReply:v17];

    BOOL v12 = v18;
  }
  else
  {
    if (v10)
    {
      BOOL v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v12 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPairingStatus: %@ endpoint, ERROR: called with no reply block!!!", buf, 0xCu);
    }
  }
}

void __48__ACCConnectionInfo_getPairingStatus_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __48__ACCConnectionInfo_getPairingStatus_withReply___block_invoke_249(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 8;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v8 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPairingStatus: reply %d", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetPairingInformation:(id)a3 withReply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 7;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo resetPairingInformation: %@ endpoint", (uint8_t *)&v16, 0xCu);
    }

    BOOL v12 = [(ACCConnectionInfo *)self serverConnection];
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_252];
    [v14 resetPairingInformation:v6 withReply:v8];
  }
  else
  {
    if (v10)
    {
      BOOL v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v12 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo resetPairingInformation: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v16, 0xCu);
    }
  }
}

void __55__ACCConnectionInfo_resetPairingInformation_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)getPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 7;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPrivateNVMKeyValues: %@", (uint8_t *)&v19, 0xCu);
    }

    id v15 = [(ACCConnectionInfo *)self serverConnection];
    id v17 = [v15 remoteObjectProxyWithErrorHandler:&__block_literal_global_254];
    [v17 getPrivateNVMKeyValues:v8 forEndpoint:v9 withReply:v11];
  }
  else
  {
    if (v13)
    {
      id v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v15 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPrivateNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v19, 0xCu);
    }
  }
}

void __66__ACCConnectionInfo_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)setPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 7;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPrivateNVMKeyValues: %@", (uint8_t *)&v19, 0xCu);
    }

    id v15 = [(ACCConnectionInfo *)self serverConnection];
    id v17 = [v15 remoteObjectProxyWithErrorHandler:&__block_literal_global_256];
    [v17 setPrivateNVMKeyValues:v8 forEndpoint:v9 withReply:v11];
  }
  else
  {
    if (v13)
    {
      id v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v15 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPrivateNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v19, 0xCu);
    }
  }
}

void __66__ACCConnectionInfo_setPrivateNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)getPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 7;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPublicNVMKeyValues: %@", buf, 0xCu);
    }

    id v17 = [(ACCConnectionInfo *)self serverConnection];
    id v18 = [v17 remoteObjectProxyWithErrorHandler:&__block_literal_global_258];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _DWORD v20[2] = __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_259;
    v20[3] = &unk_1E60735C8;
    uint64_t v21 = v11;
    [v18 getPublicNVMKeyValues:v8 forEndpoint:v9 withReply:v20];

    id v15 = v21;
  }
  else
  {
    if (v13)
    {
      id v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v15 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPublicNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", buf, 0xCu);
    }
  }
}

void __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_259(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 8;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v9 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109120;
    LODWORD(v16) = v5 != 0;
    _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPublicNVMKeyValues: hasDict:%d", (uint8_t *)&v15, 8u);
  }

  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 7;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v5)
  {
    if (v11)
    {
      BOOL v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPublicNVMKeyValues: dict:%@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      BOOL v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v12 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_259_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 8;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v13 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPublicNVMKeyValues: %@", (uint8_t *)&v21, 0xCu);
  }

  if (gLogObjects) {
    BOOL v14 = gNumLogObjects <= 7;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = !v14;
  if (v10)
  {
    if (v15)
    {
      id v16 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v16 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1B3C21000, v16, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPublicNVMKeyValues: reply", (uint8_t *)&v21, 2u);
    }

    uint64_t v17 = [(ACCConnectionInfo *)self serverConnection];
    id v19 = [v17 remoteObjectProxyWithErrorHandler:&__block_literal_global_262];
    [v19 setPublicNVMKeyValues:v8 forEndpoint:v9 withReply:v10];
  }
  else
  {
    if (v15)
    {
      uint64_t v17 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPublicNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v21, 0xCu);
    }
  }
}

void __65__ACCConnectionInfo_setPublicNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)beginVendorKeyErase:(id)a3 withReply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginVendorKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 7;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      id v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginVendorKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    BOOL v14 = [(ACCConnectionInfo *)self serverConnection];
    id v16 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_264];
    [v16 beginVendorKeyErase:v6 withReply:v7];
  }
  else
  {
    if (v12)
    {
      BOOL v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginVendorKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }
}

void __51__ACCConnectionInfo_beginVendorKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)continueVendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 8;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v19 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueVendorKeyErase", (uint8_t *)&v27, 2u);
  }

  if (gLogObjects) {
    BOOL v20 = gNumLogObjects <= 7;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = !v20;
  if (v16)
  {
    if (v21)
    {
      id v22 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v22 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1B3C21000, v22, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueVendorKeyErase: reply", (uint8_t *)&v27, 2u);
    }

    uint64_t v23 = [(ACCConnectionInfo *)self serverConnection];
    int v25 = [v23 remoteObjectProxyWithErrorHandler:&__block_literal_global_266];
    [v25 continueVendorKeyErase:v12 withSignature:v13 andAccessoryNonce:v14 forEndpoint:v15 withReply:v16];
  }
  else
  {
    if (v21)
    {
      uint64_t v23 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v23 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v15;
      _os_log_impl(&dword_1B3C21000, v23, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueVendorKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v27, 0xCu);
    }
  }
}

void __98__ACCConnectionInfo_continueVendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)cancelVendorKeyErase:(id)a3 withReply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelVendorKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 7;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      id v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelVendorKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    id v14 = [(ACCConnectionInfo *)self serverConnection];
    id v16 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_268];
    [v16 cancelVendorKeyErase:v6 withReply:v7];
  }
  else
  {
    if (v12)
    {
      id v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelVendorKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }
}

void __52__ACCConnectionInfo_cancelVendorKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)beginUserKeyErase:(id)a3 withReply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginUserKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 7;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      id v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginUserKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    id v14 = [(ACCConnectionInfo *)self serverConnection];
    id v16 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_270];
    [v16 beginUserKeyErase:v6 withReply:v7];
  }
  else
  {
    if (v12)
    {
      id v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginUserKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }
}

void __49__ACCConnectionInfo_beginUserKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 8;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v19 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueUserKeyErase", (uint8_t *)&v27, 2u);
  }

  if (gLogObjects) {
    BOOL v20 = gNumLogObjects <= 7;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = !v20;
  if (v16)
  {
    if (v21)
    {
      id v22 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v22 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1B3C21000, v22, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueUserKeyErase: reply", (uint8_t *)&v27, 2u);
    }

    uint64_t v23 = [(ACCConnectionInfo *)self serverConnection];
    int v25 = [v23 remoteObjectProxyWithErrorHandler:&__block_literal_global_272];
    [v25 continueUserKeyErase:v12 withSignature:v13 andAccessoryNonce:v14 forEndpoint:v15 withReply:v16];
  }
  else
  {
    if (v21)
    {
      uint64_t v23 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v23 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v15;
      _os_log_impl(&dword_1B3C21000, v23, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueUserKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v27, 0xCu);
    }
  }
}

void __96__ACCConnectionInfo_continueUserKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)cancelUserKeyErase:(id)a3 withReply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelUserKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 7;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      id v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelUserKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    id v14 = [(ACCConnectionInfo *)self serverConnection];
    id v16 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_274];
    [v16 cancelUserKeyErase:v6 withReply:v7];
  }
  else
  {
    if (v12)
    {
      id v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelUserKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }
}

void __50__ACCConnectionInfo_cancelUserKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)copyUserPrivateKey:(id)a3 withReply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo copyUserPrivateKey", buf, 2u);
  }

  if (v7)
  {
    BOOL v11 = [(ACCConnectionInfo *)self serverConnection];
    int v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_276];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__ACCConnectionInfo_copyUserPrivateKey_withReply___block_invoke_277;
    v15[3] = &unk_1E60735F0;
    id v16 = v7;
    [v12 copyUserPrivateKey:v6 withReply:v15];

    id v13 = v16;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo copyUserPrivateKey: %@ endpoint, ERROR: called with no reply block!!!", buf, 0xCu);
    }
  }
}

void __50__ACCConnectionInfo_copyUserPrivateKey_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __50__ACCConnectionInfo_copyUserPrivateKey_withReply___block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 8;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v9 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo copyUserPrivateKey: reply", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDictionary)accessoryFilterDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (ACCConnectionInfoPrivateDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACCConnectionInfoPrivateDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACCConnectionInfoPrivateDelegateProtocol)delegateForIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);

  return (ACCConnectionInfoPrivateDelegateProtocol *)WeakRetained;
}

- (void)setDelegateForIdentifier:(id)a3
{
}

- (ACCConnectionInfoConfigStreamDelegateProtocol)configStreamDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configStreamDelegate);

  return (ACCConnectionInfoConfigStreamDelegateProtocol *)WeakRetained;
}

- (void)setConfigStreamDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (NSLock)serverConnectionLock
{
  return self->_serverConnectionLock;
}

- (void)setServerConnectionLock:(id)a3
{
}

- (ACCConnectionInfoXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSLock)listLock
{
  return self->_listLock;
}

- (void)setListLock:(id)a3
{
}

- (NSMutableDictionary)connectionList
{
  return self->_connectionList;
}

- (void)setConnectionList:(id)a3
{
}

- (NSMutableDictionary)endpointList
{
  return self->_endpointList;
}

- (void)setEndpointList:(id)a3
{
}

- (id)configStreamGetResponseHandler
{
  return self->_configStreamGetResponseHandler;
}

- (void)setConfigStreamGetResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configStreamGetResponseHandler, 0);
  objc_storeStrong((id *)&self->_endpointList, 0);
  objc_storeStrong((id *)&self->_connectionList, 0);
  objc_storeStrong((id *)&self->_listLock, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnectionLock, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_configStreamDelegate);
  objc_destroyWeak((id *)&self->_delegateForIdentifier);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerUID, 0);

  objc_storeStrong((id *)&self->_accessoryFilterDictionary, 0);
}

- (void)copyLocalizedAccessoryNameFromDaemon:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B3C21000, v1, OS_LOG_TYPE_ERROR, "No serverConnection, cannot localize: name: %@ -> %@", v2, 0x16u);
}

void __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1B3C21000, v0, v1, "XPC connection error: %@", v2, v3, v4, v5, v6);
}

void __59__ACCConnectionInfo_provisionAccessoryForFindMy_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1B3C21000, v0, v1, "ACCConnectionInfo provisionAccessoryForFindMy: XPC connection error: %@", v2, v3, v4, v5, v6);
}

void __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_259_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1B3C21000, v0, v1, "AccConnectionInfo: getPublicNVMKeyValues: error:%@", v2, v3, v4, v5, v6);
}

@end