@interface ACCExternalAccessoryProvider
+ (id)accessoryDictionaryForLogging:(id)a3;
- (ACCExternalAccessoryProvider)initWithDelegate:(id)a3 capabilities:(int)a4;
- (ACCExternalAccessoryProviderProtocol)delegate;
- (ACCExternalAccessoryXPCServerProtocol)remoteObject;
- (NSDictionary)eaClientRegistrationInfo;
- (NSMutableSet)currentlyConnectedAccessories;
- (NSXPCConnection)serverConnection;
- (id)_findAccessoryForPrimaryUUID:(id)a3;
- (id)currentVehicleInfo:(id)a3;
- (int)clientCapabilities;
- (void)ExternalAccessoryArrived:(id)a3;
- (void)ExternalAccessoryLeft:(id)a3;
- (void)_constructClientRegistrationInfo;
- (void)_removeAccessoryForPrimaryUUID:(id)a3;
- (void)_removeAllAccessories;
- (void)accessoryCloseExternalAccessorySession:(id)a3;
- (void)closeExternalAccessorySession:(id)a3;
- (void)connectToServer:(BOOL)a3;
- (void)createExternalAccessorySessionForProtocol:(id)a3 accessoryUUID:(id)a4 withEASessionReply:(id)a5;
- (void)dealloc;
- (void)destinationInformation:(id)a3 forUUID:(id)a4;
- (void)destinationSharingStatus:(BOOL)a3 forDestinationUUID:(id)a4 supportedParams:(id)a5 forUUID:(id)a6;
- (void)enqueueLocationNMEASentence:(id)a3 forUUID:(id)a4 withTimestamps:(id)a5;
- (void)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5;
- (void)handleIncomingNotification:(id)a3 withPayload:(id)a4 aboutAccessory:(id)a5;
- (void)openSocketForAccessoryToApp:(id)a3;
- (void)openSocketForAppToAccessory:(id)a3;
- (void)requestAccessoryWifiCredentials:(id)a3;
- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5;
- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forAccessoryUUID:(id)a6;
- (void)sendNMEAFilterList:(id)a3 forAccessoryUUID:(id)a4;
- (void)sendOutgoingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7 forUUID:(id)a8;
- (void)setClientCapabilities:(int)a3;
- (void)setCurrentlyConnectedAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEaClientRegistrationInfo:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)startDestinationSharingForUUID:(id)a3 options:(unint64_t)a4;
- (void)startLocationInformationForAccessoryUUID:(id)a3;
- (void)stopDestinationSharingForUUID:(id)a3;
- (void)stopLocationInformationForAccessoryUUID:(id)a3;
- (void)updateAccessoryInfo:(id)a3 forUUID:(id)a4;
- (void)vehicleStatusUpdate:(id)a3 forUUID:(id)a4;
@end

@implementation ACCExternalAccessoryProvider

- (void)connectToServer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  if (accessoryServer_isServerAvailable())
  {
    v5 = [(ACCExternalAccessoryProvider *)v4 serverConnection];

    if (!v5)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v6 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        v6 = MEMORY[0x1E4F14500];
        id v7 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = @"no";
        if (v3) {
          v8 = @"yes";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v8;
        _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Connecting to EA XPC server...onInstantiation connection = %@", buf, 0xCu);
      }

      v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.accessories.externalaccessory-server" options:4096];
      [(ACCExternalAccessoryProvider *)v4 setServerConnection:v9];

      v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C7B0E0];
      v11 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
      [v11 setRemoteObjectInterface:v10];

      v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C78378];
      v13 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
      [v13 setExportedInterface:v12];

      v14 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
      [v14 setExportedObject:v4];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v4);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __48__ACCExternalAccessoryProvider_connectToServer___block_invoke;
      v38[3] = &unk_1E6073488;
      objc_copyWeak(&v39, (id *)buf);
      v15 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
      [v15 setInvalidationHandler:v38];

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_200;
      v36[3] = &unk_1E6073488;
      objc_copyWeak(&v37, (id *)buf);
      v16 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
      [v16 setInterruptionHandler:v36];

      if (gLogObjects && gNumLogObjects >= 3)
      {
        v17 = *(id *)(gLogObjects + 16);
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
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] resuming EA XPC connection", v35, 2u);
      }

      v19 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
      [v19 resume];

      objc_destroyWeak(&v37);
      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)buf);
    }
  }
  if (gLogObjects) {
    BOOL v20 = gNumLogObjects < 3;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v22 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  else
  {
    v22 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [(ACCExternalAccessoryProvider *)v4 remoteObject];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v23;
    _os_log_impl(&dword_1B3C21000, v22, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] self.remoteObject = %@", buf, 0xCu);
  }
  v24 = [(ACCExternalAccessoryProvider *)v4 remoteObject];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v26 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      v26 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C21000, v26, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Getting remote object...", buf, 2u);
    }

    v28 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
    v29 = [v28 remoteObjectProxyWithErrorHandler:&__block_literal_global_2];
    [(ACCExternalAccessoryProvider *)v4 setRemoteObject:v29];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v4);
    v30 = [(ACCExternalAccessoryProvider *)v4 serverConnection];
    v31 = [v30 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_205_0];
    v32 = [(ACCExternalAccessoryProvider *)v4 eaClientRegistrationInfo];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_206;
    v33[3] = &unk_1E60736A8;
    objc_copyWeak(&v34, (id *)buf);
    v33[4] = v4;
    [v31 registerClientInformation:v32 onInstantiation:v3 withReply:v33];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v4);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (ACCExternalAccessoryXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)_constructClientRegistrationInfo
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ((self->_clientCapabilities & 0x200) != 0)
  {
    v4 = [NSString stringWithCString:getprogname() encoding:4];
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v3 bundleIdentifier];
  }
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 objectForInfoDictionaryKey:@"UISupportedExternalAccessoryProtocols"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ACCExternalAccessoryProvider clientCapabilities](self, "clientCapabilities"));
  v12[0] = v4;
  v11[0] = @"ACCExternalAccessoryClientBundleIDKey";
  v11[1] = @"ACCExternalAccessoryClientEAProtocolsKey";
  v8 = v6;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F1C978] array];
  }
  v11[2] = @"ACCExternalAccessoryClientEACapablitiesKey";
  v12[1] = v8;
  v12[2] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  eaClientRegistrationInfo = self->_eaClientRegistrationInfo;
  self->_eaClientRegistrationInfo = v9;

  if (!v6) {
}
  }

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_206(uint64_t a1, int a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    v8 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = a2;
    _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] serverResult: %d", buf, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v27 = [WeakRetained serverConnection];
    [v27 invalidate];
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v9 = [*(id *)(a1 + 32) delegate];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [*(id *)(a1 + 32) delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id WeakRetained = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v28 = v5;
      id obj = v5;
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        v17 = MEMORY[0x1E4F14500];
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(obj);
            }
            v19 = [[_ACCExternalAccessoryInfo alloc] initWithAccessoryInfoDictionary:*(void *)(*((void *)&v30 + 1) + 8 * i)];
            uint64_t v20 = gLogObjects;
            int v21 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v22 = gNumLogObjects < 3;
            }
            else {
              BOOL v22 = 1;
            }
            if (v22)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v36 = v20;
                __int16 v37 = 1024;
                int v38 = v21;
                _os_log_error_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v23 = v17;
              v24 = v17;
            }
            else
            {
              v24 = *(id *)(gLogObjects + 16);
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v25 = [(_ACCExternalAccessoryInfo *)v19 name];
              *(_DWORD *)buf = 138412290;
              uint64_t v36 = (uint64_t)v25;
              _os_log_impl(&dword_1B3C21000, v24, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] adding accessory %@ to currentlyConnectedAccessories", buf, 0xCu);
            }
            [*(id *)(*(void *)(a1 + 32) + 48) addObject:v19];
            v26 = [(_ACCExternalAccessoryInfo *)v19 fullAccessoryInfo];
            [WeakRetained addObject:v26];
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      id v27 = [*(id *)(a1 + 32) delegate];
      [v27 initialEAAccessoriesAttachedAfterClientConnection:WeakRetained];
      id v5 = v28;
      goto LABEL_33;
    }
  }
LABEL_34:
}

- (ACCExternalAccessoryProviderProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACCExternalAccessoryProviderProtocol *)WeakRetained;
}

- (void)setServerConnection:(id)a3
{
}

- (void)setRemoteObject:(id)a3
{
}

- (ACCExternalAccessoryProvider)initWithDelegate:(id)a3 capabilities:(int)a4
{
  id v6 = a3;
  init_logging();
  v20.receiver = self;
  v20.super_class = (Class)ACCExternalAccessoryProvider;
  id v7 = [(ACCExternalAccessoryProvider *)&v20 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    serverConnection = v8->_serverConnection;
    v8->_serverConnection = 0;

    remoteObject = v8->_remoteObject;
    v8->_remoteObject = 0;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    currentlyConnectedAccessories = v8->_currentlyConnectedAccessories;
    v8->_currentlyConnectedAccessories = (NSMutableSet *)v11;

    v8->_clientCapabilities = a4;
    [(ACCExternalAccessoryProvider *)v8 _constructClientRegistrationInfo];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __62__ACCExternalAccessoryProvider_initWithDelegate_capabilities___block_invoke;
    v17 = &unk_1E6073418;
    objc_copyWeak(&v18, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.externalaccessory-server.availability-changed", &v14);
    -[ACCExternalAccessoryProvider connectToServer:](v8, "connectToServer:", 1, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (NSDictionary)eaClientRegistrationInfo
{
  return self->_eaClientRegistrationInfo;
}

- (int)clientCapabilities
{
  return self->_clientCapabilities;
}

void __62__ACCExternalAccessoryProvider_initWithDelegate_capabilities___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer:0];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  BOOL v3 = [(ACCExternalAccessoryProvider *)self serverConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ACCExternalAccessoryProvider;
  [(ACCExternalAccessoryProvider *)&v4 dealloc];
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    objc_super v4 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  else
  {
    objc_super v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] EA XPC begin invalidation handler!", buf, 2u);
  }

  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained serverConnection];
  [v7 setInvalidationHandler:0];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setRemoteObject:0];

  id v9 = objc_loadWeakRetained(v5);
  [v9 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  id v10 = objc_loadWeakRetained(v5);
  [v10 _removeAllAccessories];

  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v11 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] EA XPC connection invalidated!", v13, 2u);
  }
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_200(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    objc_super v4 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  else
  {
    objc_super v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] EA XPC connection interrupted!", v11, 2u);
  }

  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained serverConnection];
  [v7 invalidate];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setServerConnection:0];

  id v9 = objc_loadWeakRetained(v5);
  [v9 setRemoteObject:0];

  id v10 = objc_loadWeakRetained(v5);
  [v10 _removeAllAccessories];
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_201(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    id v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_201_cold_1();
  }
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_203(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    id v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_201_cold_1();
  }
}

- (void)requestAccessoryWifiCredentials:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "[#CarPlay] requestAccessoryWiFiCredentials: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (v8)
  {
    id v9 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v9 requestAccessoryWiFiCredentials:v4];
  }
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (v10)
  {
    id v11 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v11 sendDeviceIdentifierNotification:v12 usbIdentifier:v8 forUUID:v9];
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 3;
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
    v19 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138413314;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_DEFAULT, "[#CarPlay] sendWiredCarPlayAvailable: %@, wiredAvailable %@, usbIdentifier %@, wirelessAvailable %@, bluetoothIdentifier %@", (uint8_t *)&v22, 0x34u);
  }

  objc_super v20 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (v20)
  {
    int v21 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v21 sendWiredCarPlayAvailable:v12 usbIdentifier:v13 wirelessAvailable:v14 bluetoothIdentifier:v15 forUUID:v16];
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7 forUUID:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (gLogObjects) {
    BOOL v20 = gNumLogObjects < 3;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v22 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  else
  {
    int v22 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138413570;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    id v34 = v17;
    __int16 v35 = 2112;
    id v36 = v18;
    _os_log_impl(&dword_1B3C21000, v22, OS_LOG_TYPE_DEFAULT, "[#CarPlay] sendWiredCarPlayAvailable: %@, wiredAvailable %@, usbIdentifier %@, wirelessAvailable %@, bluetoothIdentifier %@ assetsAvailable %@", (uint8_t *)&v25, 0x3Eu);
  }

  id v23 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (v23)
  {
    __int16 v24 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v24 sendWiredCarPlayAvailable:v14 usbIdentifier:v15 wirelessAvailable:v16 bluetoothIdentifier:v17 themeAssetsAvailable:v18 forUUID:v19];
  }
}

- (void)destinationInformation:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 3;
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
    int v10 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessoryProvider destinationInformation:forUUID:]();
  }

  id v11 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (v11)
  {
    id v12 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v12 destinationInformation:v6 forUUID:v7];
  }
}

- (void)startLocationInformationForAccessoryUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects <= 2;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v5)
  {
    if (v7)
    {
      BOOL v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v8 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "[#Location] sending activateLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v9 activateLocationForUUID:v4];
  }
  else
  {
    if (v7)
    {
      id v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send activateLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)sendNMEAFilterList:(id)a3 forAccessoryUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 2;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v8)
  {
    if (v10)
    {
      id v11 = *(id *)(gLogObjects + 16);
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
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "[#Location] sending sendNMEAFilterList %@ for UUID: %@", (uint8_t *)&v15, 0x16u);
    }

    int v12 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v12 sendNMEAFilterList:v6 forUUID:v7];
  }
  else
  {
    if (v10)
    {
      int v12 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v12 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send sendNMEAFilterList %@ for UUID: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forAccessoryUUID:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 2;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v11)
  {
    if (v13)
    {
      id v14 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v14 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109890;
      BOOL v19 = v8;
      __int16 v20 = 1024;
      BOOL v21 = v7;
      __int16 v22 = 1024;
      BOOL v23 = v6;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "[#Location] sending sendGPRMCDataStatus: %d ValueV: %d ValueX: %d forUUID: %@", (uint8_t *)&v18, 0x1Eu);
    }

    int v15 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v15 sendGPRMCDataStatus:v8 ValueV:v7 ValueX:v6 forUUID:v10];
  }
  else
  {
    if (v13)
    {
      int v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v15 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109890;
      BOOL v19 = v8;
      __int16 v20 = 1024;
      BOOL v21 = v7;
      __int16 v22 = 1024;
      BOOL v23 = v6;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send sendGPRMCDataStatus: %d ValueV: %d ValueX: %d forUUID: %@", (uint8_t *)&v18, 0x1Eu);
    }
  }
}

- (void)stopLocationInformationForAccessoryUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ACCExternalAccessoryProvider *)self remoteObject];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects <= 2;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v5)
  {
    if (v7)
    {
      BOOL v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v8 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "[#Location] sending stopLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }

    BOOL v9 = [(ACCExternalAccessoryProvider *)self remoteObject];
    [v9 stopLocationForUUID:v4];
  }
  else
  {
    if (v7)
    {
      BOOL v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send stopLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)_findAccessoryForPrimaryUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ACCExternalAccessoryProvider *)self currentlyConnectedAccessories];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__ACCExternalAccessoryProvider__findAccessoryForPrimaryUUID___block_invoke;
  v14[3] = &unk_1E60736D0;
  id v6 = v4;
  id v15 = v6;
  int v7 = [v5 objectsPassingTest:v14];

  if (v7 && [v7 count])
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      BOOL v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v8 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(ACCExternalAccessoryProvider *)(uint64_t)v7 _findAccessoryForPrimaryUUID:v8];
    }

    id v11 = [v7 anyObject];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      BOOL v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "Can't find accessory for primaryUUID %@", buf, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

uint64_t __61__ACCExternalAccessoryProvider__findAccessoryForPrimaryUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 primaryUUID];
  uint64_t v6 = [*(id *)(a1 + 32) isEqualToString:v5];
  if (v6) {
    *a3 = 1;
  }

  return v6;
}

- (void)_removeAccessoryForPrimaryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ACCExternalAccessoryProvider *)self currentlyConnectedAccessories];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__ACCExternalAccessoryProvider__removeAccessoryForPrimaryUUID___block_invoke;
  v13[3] = &unk_1E60736D0;
  id v6 = v4;
  id v14 = v6;
  int v7 = [v5 objectsPassingTest:v13];

  if (v7 && [v7 count])
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      BOOL v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v8 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(ACCExternalAccessoryProvider *)(uint64_t)v7 _findAccessoryForPrimaryUUID:v8];
    }

    BOOL v9 = [v7 anyObject];
    id v12 = [(ACCExternalAccessoryProvider *)self currentlyConnectedAccessories];
    [v12 removeObject:v9];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      BOOL v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "Can't find primaryUUID %@ to remove", buf, 0xCu);
    }
  }
}

uint64_t __63__ACCExternalAccessoryProvider__removeAccessoryForPrimaryUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 primaryUUID];
  uint64_t v6 = [*(id *)(a1 + 32) isEqualToString:v5];
  if (v6) {
    *a3 = 1;
  }

  return v6;
}

- (void)_removeAllAccessories
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(ACCExternalAccessoryProvider *)self currentlyConnectedAccessories];
  BOOL v5 = [v3 setWithSet:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "copyAccessoryInfo", (void)v12);
        [(ACCExternalAccessoryProvider *)self ExternalAccessoryLeft:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)ExternalAccessoryArrived:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    uint64_t v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:v4];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] accessoryd received EAAccessoryArrived %@, verifyAccessoryConnectionStatus", buf, 0xCu);
  }
  uint64_t v9 = [(ACCExternalAccessoryProvider *)self serverConnection];
  uint64_t v10 = [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_221_0];
  id v11 = [v4 objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
  long long v12 = [v4 objectForKey:@"IAPAppConnectionIDKey"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_222;
  v14[3] = &unk_1E6073720;
  id v15 = v4;
  id v16 = self;
  id v13 = v4;
  [v10 verifyAccessoryConnectionStatus:v11 legacyConnectionID:v12 withReply:v14];
}

void __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_222(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:@"IAPAppConnectionIDKey"];
    *(_DWORD *)buf = 138412802;
    BOOL v21 = v7;
    __int16 v22 = 2112;
    BOOL v23 = v8;
    __int16 v24 = 1024;
    int v25 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] accessoryd with primaryUUID %@, legacyConnectionID %@ connected = %d", buf, 0x1Cu);
  }
  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) objectForKey:@"IAPAppAccessoryNameKey"];
      *(_DWORD *)buf = 138412290;
      BOOL v21 = v11;
      _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "adding accessory %@ to currentlyConnectedAccessories", buf, 0xCu);
    }
    long long v12 = [[_ACCExternalAccessoryInfo alloc] initWithAccessoryInfoDictionary:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 48) addObject:v12];
    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v13 = *(id *)(gLogObjects + 16);
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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Dispatching async to main thread...", buf, 2u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_223;
    v17[3] = &unk_1E60736F8;
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v18 = v12;
    uint64_t v19 = v15;
    id v16 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
}

void __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_223(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v4 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) fullAccessoryInfo];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] In async to main thread: accessoryd received EAAccessoryArrived: %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) delegate];
  uint64_t v7 = [*(id *)(a1 + 32) fullAccessoryInfo];
  [v6 EAAccessoryArrived:v7];
}

- (void)ExternalAccessoryLeft:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    uint64_t v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v4 objectForKey:@"IAPAppAccessoryNameKey"];
    uint64_t v9 = [v4 objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
    *(_DWORD *)buf = 138412546;
    BOOL v23 = v8;
    __int16 v24 = 2112;
    int v25 = v9;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] accessoryd received EAAccessoryLeft %@, UUID %@", buf, 0x16u);
  }
  uint64_t v10 = [(ACCExternalAccessoryProvider *)self delegate];

  if (v10)
  {
    id v11 = [v4 objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
    long long v12 = [(ACCExternalAccessoryProvider *)self _findAccessoryForPrimaryUUID:v11];

    if (v12) {
      id v13 = (void *)[v12 copyAccessoryInfo];
    }
    else {
      id v13 = 0;
    }
    id v14 = [v4 objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
    [(ACCExternalAccessoryProvider *)self _removeAccessoryForPrimaryUUID:v14];

    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v15 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Dispatching async to main thread...", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ACCExternalAccessoryProvider_ExternalAccessoryLeft___block_invoke;
    block[3] = &unk_1E6073748;
    id v19 = v13;
    __int16 v20 = self;
    id v21 = v4;
    id v17 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __54__ACCExternalAccessoryProvider_ExternalAccessoryLeft___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects <= 2;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      id v4 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v4 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:*(void *)(a1 + 32)];
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] removing accessory accInfo %@", (uint8_t *)&v16, 0xCu);
    }
    if (gLogObjects && gNumLogObjects >= 3)
    {
      int v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) objectForKey:@"IAPAppAccessoryNameKey"];
      id v11 = [*(id *)(a1 + 32) objectForKey:@"IAPAppConnectionIDKey"];
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] removing accessory %@ with connectionID %@", (uint8_t *)&v16, 0x16u);
    }
    long long v12 = [*(id *)(a1 + 40) delegate];
    [v12 EAAccessoryLeft:*(void *)(a1 + 32)];
  }
  else
  {
    if (v3)
    {
      BOOL v5 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      BOOL v5 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:*(void *)(a1 + 48)];
      int v16 = 138412290;
      id v17 = v14;
      _os_log_impl(&dword_1B3C21000, v5, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] removing accessory accessoryInfo %@", (uint8_t *)&v16, 0xCu);
    }
    long long v12 = [*(id *)(a1 + 40) delegate];
    uint64_t v15 = +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:*(void *)(a1 + 48)];
    [v12 EAAccessoryLeft:v15];
  }
}

- (void)handleIncomingNotification:(id)a3 withPayload:(id)a4 aboutAccessory:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 3;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    long long v12 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  else
  {
    long long v12 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v9 objectForKey:@"IAPAppAccessoryNameKey"];
    id v14 = [v9 objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
    int v16 = 136316162;
    id v17 = "-[ACCExternalAccessoryProvider handleIncomingNotification:withPayload:aboutAccessory:]";
    __int16 v18 = 2112;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] received %s accessory %@, UUID %@ notificationName %@ notificationPayload %@", (uint8_t *)&v16, 0x34u);
  }
  uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:v7 object:0 userInfo:v8];
}

- (void)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
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
    id v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessoryProvider handleIncomingExternalAccessoryData:forEASessionIdentifier:withReply:]();
  }

  id v14 = [(ACCExternalAccessoryProvider *)self delegate];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__ACCExternalAccessoryProvider_handleIncomingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke;
  v17[3] = &unk_1E6073770;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [v14 handleIncomingExternalAccessoryData:v8 forEASessionIdentifier:v16 withReply:v17];
}

uint64_t __101__ACCExternalAccessoryProvider_handleIncomingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 3;
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
      id v6 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "client DID NOT handle incoming EA data for eaSessionUUID %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)accessoryCloseExternalAccessorySession:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    uint64_t v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "Accessory closed EA session for eaSessionUUID %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(ACCExternalAccessoryProvider *)self delegate];

  if (v8)
  {
    int v9 = [(ACCExternalAccessoryProvider *)self delegate];
    [v9 accessoryClosedEASession:v4];
  }
}

- (void)enqueueLocationNMEASentence:(id)a3 forUUID:(id)a4 withTimestamps:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
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
    id v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 138412802;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_debug_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEBUG, "[#Location] enqueue Location nmea sentence: %@ for UUID %@ timestamps %@", (uint8_t *)&v22, 0x20u);
  }

  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [v14 timeIntervalSince1970];
  double v16 = v15;

  id v17 = (void *)[v10 mutableCopy];
  id v18 = [NSNumber numberWithDouble:v16];
  [v17 addObject:v18];

  id v19 = [(ACCExternalAccessoryProvider *)self delegate];

  if (v19)
  {
    __int16 v20 = [(ACCExternalAccessoryProvider *)self delegate];
    [v20 nmeaSentenceArrived:v8 forAccessoryUUID:v9 withTimestamps:v17];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      __int16 v20 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      __int16 v20 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412802;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_1B3C21000, v20, OS_LOG_TYPE_DEFAULT, "[#Location] No delegate to process nmea sentence: %@ for UUID %@, timestamps %@", (uint8_t *)&v22, 0x20u);
    }
  }
}

- (void)createExternalAccessorySessionForProtocol:(id)a3 accessoryUUID:(id)a4 withEASessionReply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
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
    id v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "!!!!! createExternalAccessorySessionForProtocol for protocol %@", buf, 0xCu);
  }

  id v14 = [(ACCExternalAccessoryProvider *)self serverConnection];
  double v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_227];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __107__ACCExternalAccessoryProvider_createExternalAccessorySessionForProtocol_accessoryUUID_withEASessionReply___block_invoke_228;
  v17[3] = &unk_1E6073798;
  id v18 = v10;
  id v16 = v10;
  [v15 createExternalAccessorySessionForProtocol:v8 accessoryUUID:v9 withReply:v17];
}

void __107__ACCExternalAccessoryProvider_createExternalAccessorySessionForProtocol_accessoryUUID_withEASessionReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __107__ACCExternalAccessoryProvider_createExternalAccessorySessionForProtocol_accessoryUUID_withEASessionReply___block_invoke_228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 3;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v12 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v12 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109890;
    v14[1] = a2;
    __int16 v15 = 1024;
    int v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = a4;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "createdExternalAccessorySession result %d, useSocketInterface = %d, sessionID %llu, eaSessionUUID %@", (uint8_t *)v14, 0x22u);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v13 + 16))(v13, a2, a3, a4, v9);
  }
}

- (void)openSocketForAccessoryToApp:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    uint64_t v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "!!!!! EA provider app is openSocketForAccessoryToApp...", v10, 2u);
  }

  id v8 = [(ACCExternalAccessoryProvider *)self serverConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_231];
  [v9 openSocketFromAccessoryToApp:v4];
}

void __60__ACCExternalAccessoryProvider_openSocketForAccessoryToApp___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)openSocketForAppToAccessory:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    uint64_t v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "!!!!! EA provider app is openSocketForAppToAccessory...", v10, 2u);
  }

  id v8 = [(ACCExternalAccessoryProvider *)self serverConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_233_0];
  [v9 openSocketFromAppToAccessory:v4];
}

void __60__ACCExternalAccessoryProvider_openSocketForAppToAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)closeExternalAccessorySession:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
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
    uint64_t v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "!!!!! EA provider app is closeExternalAccessorySession...", v10, 2u);
  }

  id v8 = [(ACCExternalAccessoryProvider *)self serverConnection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_235_0];
  [v9 clientCloseExternalAccessorySession:v4];
}

void __62__ACCExternalAccessoryProvider_closeExternalAccessorySession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (void)sendOutgoingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 3;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v13 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_DEFAULT, "sendOutgoingExternalAccessoryData...", buf, 2u);
  }

  id v14 = [(ACCExternalAccessoryProvider *)self serverConnection];
  __int16 v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_237];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__ACCExternalAccessoryProvider_sendOutgoingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke_238;
  v18[3] = &unk_1E6073770;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  [v15 processOutgoingExternalAccessoryData:v8 forEASessionIdentifier:v17 withReply:v18];
}

void __99__ACCExternalAccessoryProvider_sendOutgoingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

uint64_t __99__ACCExternalAccessoryProvider_sendOutgoingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke_238(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 3;
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
      id v6 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "error sending outgoing EA data for eaSessionUUID %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)startDestinationSharingForUUID:(id)a3 options:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 3;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v9 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  else
  {
    int v9 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    id v25 = v6;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "from accessoryd: received startDestinationSharingForUUID, UUID %@, options %llxh", (uint8_t *)&v24, 0x16u);
  }

  uint64_t v10 = [(ACCExternalAccessoryProvider *)self _findAccessoryForPrimaryUUID:v6];
  uint64_t v11 = [v10 destinationSharingOptions];
  [v10 setDestinationSharingOptions:a4];
  id v12 = [(ACCExternalAccessoryProvider *)self delegate];

  if (v12)
  {
    if (v11 != a4)
    {
      uint64_t v13 = [(ACCExternalAccessoryProvider *)self delegate];
      if (v13)
      {
        id v14 = (void *)v13;
        __int16 v15 = [(ACCExternalAccessoryProvider *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          id v17 = [(ACCExternalAccessoryProvider *)self delegate];
          uint64_t v18 = (void *)[v10 copyAccessoryInfo];
          [v17 updateAccessoryInfo:v18];
        }
      }
    }
    id v19 = [(ACCExternalAccessoryProvider *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    uint64_t v21 = [(ACCExternalAccessoryProvider *)self delegate];
    int v22 = v21;
    if (v20)
    {
      [v21 startDestinationSharingForUUID:v6 options:a4];
LABEL_20:

      goto LABEL_21;
    }
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      int v22 = [(ACCExternalAccessoryProvider *)self delegate];
      [v22 startDestinationSharingForUUID:v6];
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)stopDestinationSharingForUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "from accessoryd: received stopDestinationSharingForUUID, UUID %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v8 = [(ACCExternalAccessoryProvider *)self delegate];
  if (v8)
  {
    int v9 = (void *)v8;
    uint64_t v10 = [(ACCExternalAccessoryProvider *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(ACCExternalAccessoryProvider *)self delegate];
      [v12 stopDestinationSharingForUUID:v4];
    }
  }
}

- (void)destinationSharingStatus:(BOOL)a3 forDestinationUUID:(id)a4 supportedParams:(id)a5 forUUID:(id)a6
{
  BOOL v8 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 3;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v15 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v15 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    char v16 = @"no";
    if (v8) {
      char v16 = @"yes";
    }
    int v24 = 138412546;
    id v25 = v16;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "from accessoryd: received destinationSharingStatus %@ for UUID %@", (uint8_t *)&v24, 0x16u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v17 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessoryProvider destinationSharingStatus:forDestinationUUID:supportedParams:forUUID:]();
  }

  uint64_t v19 = [(ACCExternalAccessoryProvider *)self delegate];
  if (v19)
  {
    char v20 = (void *)v19;
    uint64_t v21 = [(ACCExternalAccessoryProvider *)self delegate];
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      char v23 = [(ACCExternalAccessoryProvider *)self delegate];
      [v23 destinationSharingStatus:v8 forDestinationUUID:v10 supportedParams:v11 forUUID:v12];
    }
  }
}

- (id)currentVehicleInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] a process is asking for currentVehicleInfo for %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  BOOL v8 = [(ACCExternalAccessoryProvider *)self serverConnection];
  int v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_247];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_248;
  v13[3] = &unk_1E60737C0;
  id v10 = v4;
  id v14 = v10;
  p_long long buf = &buf;
  [v9 vehicleInformationForUUID:v10 withReply:v13];

  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_cold_1();
  }
}

void __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_248(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
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
    id v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] currentVehicleInfo for %@ currentVehicleInfoDictionary %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (void)vehicleStatusUpdate:(id)a3 forUUID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 3;
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
    int v10 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] from accessoryd: received vehicleStatusUpdate %@ for UUID %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v11 = [(ACCExternalAccessoryProvider *)self delegate];
  if (v11
    && (__int16 v12 = (void *)v11,
        [(ACCExternalAccessoryProvider *)self delegate],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = objc_opt_respondsToSelector(),
        v13,
        v12,
        (v14 & 1) != 0))
  {
    uint64_t v15 = [(ACCExternalAccessoryProvider *)self delegate];
    [v15 vehicleStatusUpdate:v6 forAccessoryUUID:v7];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v15 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(ACCExternalAccessoryProvider *)self delegate];
      int v18 = 138412802;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      char v23 = v17;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] from accessoryd: received vehicleStatusUpdate %@ for UUID %@, but no delegate(%@) or not able to respond to message", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)updateAccessoryInfo:(id)a3 forUUID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 3;
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
    int v10 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 objectForKey:@"IAPAppConnectionIDKey"];
    __int16 v12 = +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:v6];
    int v22 = 138412802;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "from accessoryd: received updateAccessoryInfo for UUID %@ (connection ID: %@), %@", (uint8_t *)&v22, 0x20u);
  }
  uint64_t v13 = [(ACCExternalAccessoryProvider *)self delegate];
  if (v13
    && (char v14 = (void *)v13,
        [(ACCExternalAccessoryProvider *)self delegate],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = objc_opt_respondsToSelector(),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    uint64_t v17 = [(ACCExternalAccessoryProvider *)self delegate];
    [v17 updateAccessoryInfo:v6];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      uint64_t v17 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v6 objectForKey:@"IAPAppConnectionIDKey"];
      __int16 v20 = [(ACCExternalAccessoryProvider *)self delegate];
      id v21 = +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:v6];
      int v22 = 138413058;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = v20;
      __int16 v28 = 2112;
      __int16 v29 = v21;
      _os_log_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] from accessoryd: received updateAccessoryInfo for UUID %@ (connection ID: %@), but no delegate(%@) or not able to respond to message, %@", (uint8_t *)&v22, 0x2Au);
    }
  }
}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  BOOL v4 = [v3 objectForKey:@"IAPAppAccessoryCertDataKey"];

  if (v4)
  {
    id v5 = [v3 objectForKey:@"IAPAppAccessoryCertDataKey"];
    uint64_t v6 = [v5 length];

    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu bytes", v6);
    [v3 setObject:v7 forKey:@"IAPAppAccessoryCertDataKey"];
  }
  BOOL v8 = [v3 objectForKey:@"IAPAppAccessoryCertSerialNumberKey"];

  if (v8)
  {
    id v9 = [v3 objectForKey:@"IAPAppAccessoryCertSerialNumberKey"];
    uint64_t v10 = [v9 length];

    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu bytes", v10);
    [v3 setObject:v11 forKey:@"IAPAppAccessoryCertSerialNumberKey"];
  }

  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setClientCapabilities:(int)a3
{
  self->_clientCapabilities = a3;
}

- (void)setEaClientRegistrationInfo:(id)a3
{
}

- (NSMutableSet)currentlyConnectedAccessories
{
  return self->_currentlyConnectedAccessories;
}

- (void)setCurrentlyConnectedAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyConnectedAccessories, 0);
  objc_storeStrong((id *)&self->_eaClientRegistrationInfo, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_201_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1B3C21000, v0, v1, "[#ExternalAccessory] XPC connection error: %@", v2, v3, v4, v5, v6);
}

- (void)destinationInformation:forUUID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(&dword_1B3C21000, v0, (uint64_t)v0, "sending destinationInformation %@ for UUID %@", v1);
}

- (void)_findAccessoryForPrimaryUUID:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 currentlyConnectedAccessories];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_1B3C21000, a3, v5, "eaAccessoryToRemove %@, currentlyConnectedAccessories %@", v6);
}

- (void)handleIncomingExternalAccessoryData:forEASessionIdentifier:withReply:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1B3C21000, v0, OS_LOG_TYPE_DEBUG, "Got EA data for eaSessionUUID %@", v1, 0xCu);
}

- (void)destinationSharingStatus:forDestinationUUID:supportedParams:forUUID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(&dword_1B3C21000, v0, (uint64_t)v0, "destination sharing UUID %@, supportedParams %@", v1);
}

void __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1B3C21000, v0, v1, "[#VehicleInfoStatus] XPC connection error: %@", v2, v3, v4, v5, v6);
}

@end