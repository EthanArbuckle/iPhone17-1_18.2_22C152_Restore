@interface ACCOOBBTPairingServer
+ (id)sharedServer;
- (ACCOOBBTPairingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableDictionary)registeredAccessoryConnections;
- (_ACCOOBBTPairingProviderInfo)oobBtPairingProviderInfo;
- (void)accessoryOOBBTPairingAttached:(id)a3 accInfoDict:(id)a4;
- (void)accessoryOOBBTPairingBTAccessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6;
- (void)accessoryOOBBTPairingCompletionStatus:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 result:(unsigned __int8)a6;
- (void)accessoryOOBBTPairingDetached:(id)a3;
- (void)dealloc;
- (void)iterateAttachedConnectionsSync:(id)a3;
- (void)legacyConnectionIDForAccessoryUID:(id)a3 connectionID:(unsigned int)a4;
- (void)notifyOfProvider:(id)a3 connection:(id)a4;
- (void)setOobBtPairingProviderInfo:(id)a3;
@end

@implementation ACCOOBBTPairingServer

- (ACCOOBBTPairingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACCOOBBTPairingServer;
  v7 = [(ACCFeatureServer *)&v14 initWithXPCServiceName:v6 andFeatureNotification:a4];
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2080;
    v18 = a4;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initWithXPCServiceName: serviceName='%@' notification='%s' self=%@", buf, 0x20u);
  }

  if (v7)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registeredAccessoryConnections = v7->_registeredAccessoryConnections;
    v7->_registeredAccessoryConnections = v11;
  }
  return v7;
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc: self=%@", buf, 0xCu);
  }

  registeredAccessoryConnections = self->_registeredAccessoryConnections;
  self->_registeredAccessoryConnections = 0;

  v7.receiver = self;
  v7.super_class = (Class)ACCOOBBTPairingServer;
  [(ACCFeatureServer *)&v7 dealloc];
}

- (void)iterateAttachedConnectionsSync:(id)a3
{
  id v4 = (void (**)(id, void *, char *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableDictionary *)self->_registeredAccessoryConnections allValues];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 1;
      v11 = [v10 accessoryUID];
      v4[2](v4, v11, &v12);

      if (!v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)buf = 138412290;
    v29 = (_ACCOOBBTPairingProviderInfo *)xpcServiceName;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  char v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCOOBBTPairingXPCServerProtocol];
  [v7 setExportedInterface:v12];

  long long v13 = [[ACCOOBBTPairingServerRemote alloc] initWithXPCConnection:v7];
  [v7 setExportedObject:v13];
  long long v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCOOBBTPairingXPCClientProtocol];
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __60__ACCOOBBTPairingServer_listener_shouldAcceptNewConnection___block_invoke;
  v23[3] = &unk_100217420;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  [v7 setInvalidationHandler:v23];
  long long v15 = objc_alloc_init(_ACCOOBBTPairingProviderInfo);
  [(_ACCOOBBTPairingProviderInfo *)v15 setConnection:v7];
  [(_ACCOOBBTPairingProviderInfo *)v15 setServerRemote:v13];
  long long v16 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_13];
  [(_ACCOOBBTPairingProviderInfo *)v15 setRemoteObject:v16];

  objc_storeStrong((id *)&self->_oobBtPairingProviderInfo, v15);
  if (gLogObjects && gNumLogObjects >= 5)
  {
    __int16 v17 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
    *(_DWORD *)buf = 138412290;
    v29 = oobBtPairingProviderInfo;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "providerInfo=%@", buf, 0xCu);
  }

  [v7 resume];
  v20 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__ACCOOBBTPairingServer_listener_shouldAcceptNewConnection___block_invoke_137;
  block[3] = &unk_1002158C8;
  block[4] = self;
  dispatch_async(v20, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __60__ACCOOBBTPairingServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [v6 oobBtPairingProviderInfo];
    int v10 = 138412546;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    long long v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated! %@ providerInfo=%@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  [v8 setInvalidationHandler:0];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 setOobBtPairingProviderInfo:0];
}

void __60__ACCOOBBTPairingServer_listener_shouldAcceptNewConnection___block_invoke_135(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v6 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __60__ACCOOBBTPairingServer_listener_shouldAcceptNewConnection___block_invoke_137(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inform provider of attached accessories %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 64) allValues];
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*(void *)(a1 + 32) + 56);
        if (v10)
        {
          id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v10 remoteObject];
          if (v12)
          {
            long long v13 = (void *)v12;
            long long v14 = [*(id *)(*(void *)(a1 + 32) + 56) remoteObject];
            char v15 = objc_opt_respondsToSelector();

            if (v15)
            {
              long long v16 = [*(id *)(*(void *)(a1 + 32) + 56) remoteObject];
              __int16 v17 = [v11 accessoryUID];
              id v18 = [v11 accInfoDict];
              [v16 accessoryOOBBTPairingAttached:v17 accInfoDict:v18];
            }
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
  if (oobBtPairingProviderInfo)
  {
    id v6 = [(_ACCOOBBTPairingProviderInfo *)oobBtPairingProviderInfo connection];
    unsigned int v7 = [v6 isEqual:v4];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    int v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = self->_oobBtPairingProviderInfo;
    v13[0] = 67109634;
    v13[1] = v7;
    __int16 v14 = 2112;
    char v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "OOBBTPairing server, shouldAcceptConnection=%d _oobBtPairingProviderInfo=%@ connection=%@", (uint8_t *)v13, 0x1Cu);
  }

  return v7;
}

- (void)accessoryOOBBTPairingAttached:(id)a3 accInfoDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    int v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    platform_oobBtPairing_accessoryDictionaryForLogging((uint64_t)v7);
    id v11 = (_ACCOOBBTPairingAccessoryInfo *)objc_claimAutoreleasedReturnValue();
    int v24 = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "OOBBTPairing server, accessoryOOBBTPairingAttached: %@, accInfoDict=%@", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v12 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    long long v13 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    long long v13 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
    int v24 = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = oobBtPairingProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, accessoryOOBBTPairingAttached: %@, registeredAccessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v24, 0x20u);
  }

  if (!v12)
  {
    uint64_t v12 = [[_ACCOOBBTPairingAccessoryInfo alloc] initWithUID:v6 accInfoDict:v7];
    [(NSMutableDictionary *)self->_registeredAccessoryConnections setObject:v12 forKey:v6];
  }
  if (gLogObjects && gNumLogObjects >= 5)
  {
    char v15 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    char v15 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    long long v23 = self->_oobBtPairingProviderInfo;
    int v24 = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, accessoryOOBBTPairingAttached: %@, accessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v24, 0x20u);
  }

  if (v12)
  {
    uint64_t v17 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
    if (v17)
    {
      id v18 = (void *)v17;
      __int16 v19 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        long long v21 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
        [v21 accessoryOOBBTPairingAttached:v6 accInfoDict:v7];
      }
    }
  }
}

- (void)accessoryOOBBTPairingDetached:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "OOBBTPairing server, accessoryOOBBTPairingDetached: %@", (uint8_t *)&v17, 0xCu);
  }

  BOOL v8 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v4];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
    int v17 = 138412802;
    id v18 = v4;
    __int16 v19 = 2112;
    char v20 = v8;
    __int16 v21 = 2112;
    long long v22 = oobBtPairingProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, accessoryOOBBTPairingDetached: %@, accessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v17, 0x20u);
  }

  if (v8) {
    [(NSMutableDictionary *)self->_registeredAccessoryConnections removeObjectForKey:v4];
  }
  uint64_t v11 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    long long v13 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      char v15 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
      [v15 accessoryOOBBTPairingDetached:v4];
    }
  }
}

- (void)accessoryOOBBTPairingBTAccessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6
{
  id v10 = (char *)a3;
  uint64_t v11 = (char *)a4;
  v36 = (_ACCOOBBTPairingProviderInfo *)a5;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 5;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    char v14 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  else
  {
    char v14 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v38 = v10;
    __int16 v39 = 2112;
    v40 = v11;
    __int16 v41 = 2112;
    v42 = v36;
    __int16 v43 = 1024;
    unsigned int v44 = a6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "OOBBTPairing server, accessoryOOBBTPairingBTAccessoryInfo: %@, oobBtPairingUID=%@, accessoryMacAddr=%@, deviceClass=%xh", buf, 0x26u);
  }

  char v15 = self;
  uint64_t v16 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v10];
  int v17 = (void *)v16;
  if (gLogObjects) {
    BOOL v18 = gNumLogObjects <= 4;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = !v18;
  if (v16)
  {
    if (v19)
    {
      char v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      char v20 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    long long v23 = self;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "-[ACCOOBBTPairingServer accessoryOOBBTPairingBTAccessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:]";
      __int16 v39 = 2112;
      v40 = v10;
      __int16 v41 = 2112;
      v42 = (_ACCOOBBTPairingProviderInfo *)v11;
      __int16 v43 = 1024;
      unsigned int v44 = a6;
      __int16 v45 = 2112;
      v46 = v36;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "OOBBTPairing server, %s: %@, oobBtPairingUID=%@, deviceClass=%xh, setting accessoryMacAddress to %@", buf, 0x30u);
    }
    int v24 = v11;

    [v17 setAccessoryMacAddress:v36];
    uint64_t v25 = [(_ACCOOBBTPairingProviderInfo *)v15->_oobBtPairingProviderInfo remoteObject];
    if (v25)
    {
      __int16 v26 = (void *)v25;
      v27 = [(_ACCOOBBTPairingProviderInfo *)v15->_oobBtPairingProviderInfo remoteObject];
      char v28 = objc_opt_respondsToSelector();

      long long v23 = v15;
      if (v28)
      {
        if (gLogObjects && gNumLogObjects >= 5)
        {
          v29 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v29 = &_os_log_default;
          id v34 = &_os_log_default;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          oobBtPairingProviderInfo = v15->_oobBtPairingProviderInfo;
          *(_DWORD *)buf = 138412802;
          v38 = v10;
          __int16 v39 = 2112;
          v40 = (char *)v17;
          __int16 v41 = 2112;
          v42 = oobBtPairingProviderInfo;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, accessoryOOBBTPairingBTAccessoryInfo: %@, accessory=%@ _oobBtPairingProviderInfo=%@", buf, 0x20u);
        }

        v31 = [(_ACCOOBBTPairingProviderInfo *)v15->_oobBtPairingProviderInfo remoteObject];
        [v31 accessoryOOBBTPairingBTAccessoryInfo:v10 oobBtPairingUID:v24 accessoryMacAddr:v36 deviceClass:a6];
        goto LABEL_52;
      }
    }
  }
  else
  {
    if (v19)
    {
      __int16 v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v21 = &_os_log_default;
      id v30 = &_os_log_default;
    }
    int v24 = v11;
    long long v23 = v15;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingServer accessoryOOBBTPairingBTAccessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:]((uint64_t)v10, v21);
    }
  }
  if (gLogObjects && gNumLogObjects >= 5)
  {
    v31 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v31 = &_os_log_default;
    id v32 = &_os_log_default;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v33 = v23->_oobBtPairingProviderInfo;
    *(_DWORD *)buf = 138412802;
    v38 = v10;
    __int16 v39 = 2112;
    v40 = (char *)v17;
    __int16 v41 = 2112;
    v42 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "accessoryOOBBTPairingBTAccessoryInfoPairing server, accessoryOOBBTPairingDetached: %@, Invalid accessory=%@ _oobBtPairingProviderInfo=%@", buf, 0x20u);
  }
LABEL_52:
}

- (void)accessoryOOBBTPairingCompletionStatus:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 result:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = (char *)a3;
  id v11 = a4;
  BOOL v12 = (_ACCOOBBTPairingProviderInfo *)a5;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 5;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    char v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    char v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v32 = 138413058;
    v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    v37 = v12;
    __int16 v38 = 1024;
    int v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "OOBBTPairing server, accessoryOOBBTPairingCompletionStatus: %@, oobBtPairingUID=%@, accessoryMacAddr=%@, result=%d", (uint8_t *)&v32, 0x26u);
  }

  uint64_t v16 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v10];
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
  if (!v17) {
    goto LABEL_18;
  }
  BOOL v18 = (void *)v17;
  [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
  v20 = id v19 = v11;
  char v21 = objc_opt_respondsToSelector();

  id v11 = v19;
  if (v21)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v22 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v22 = &_os_log_default;
      id v25 = &_os_log_default;
    }
    id v11 = v19;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
      int v32 = 138412802;
      v33 = v10;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      v37 = oobBtPairingProviderInfo;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, accessoryOOBBTPairingCompletionStatus: %@, accessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v32, 0x20u);
    }

    __int16 v26 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
    [v26 accessoryOOBBTPairingCompletionStatus:v10 oobBtPairingUID:v19 accessoryMacAddr:v12 result:v6];

    if (gLogObjects && gNumLogObjects >= 5)
    {
      v27 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v27 = &_os_log_default;
      id v28 = &_os_log_default;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136315138;
      v33 = "-[ACCOOBBTPairingServer accessoryOOBBTPairingCompletionStatus:oobBtPairingUID:accessoryMacAddr:result:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s Notifying clients about device OOBBT pairing completion_status", (uint8_t *)&v32, 0xCu);
    }

    if (v12)
    {
      platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus(v10, (uint64_t)v12, v6);
    }
    else
    {
      v29 = [v16 accessoryMacAddress];
      platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus(v10, (uint64_t)v29, v6);
    }
  }
  else
  {
LABEL_18:
    if (gLogObjects && gNumLogObjects >= 5)
    {
      long long v23 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      long long v23 = &_os_log_default;
      id v24 = &_os_log_default;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v30 = self->_oobBtPairingProviderInfo;
      int v32 = 138412802;
      v33 = v10;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      v37 = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, accessoryOOBBTPairingCompletionStatus: %@, Invalid accessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v32, 0x20u);
    }
  }
}

- (void)notifyOfProvider:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    char v20 = oobBtPairingProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, notifyOfProvider: %@ connection: %@, _oobBtPairingProviderInfo=%@", (uint8_t *)&v15, 0x20u);
  }

  id v11 = self->_oobBtPairingProviderInfo;
  if (v11)
  {
    BOOL v12 = [(_ACCOOBBTPairingProviderInfo *)v11 connection];
    unsigned int v13 = [v12 isEqual:v7];

    if (v13) {
      [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo setProviderUID:v6];
    }
  }
}

- (void)legacyConnectionIDForAccessoryUID:(id)a3 connectionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412546;
    id v22 = v6;
    __int16 v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "OOBBTPairing server, legacyConnectionIDForAccessoryUID: %@ connectionID: %u", (uint8_t *)&v21, 0x12u);
  }

  id v10 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  if (!v10) {
    goto LABEL_18;
  }
  uint64_t v11 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
  if (!v11) {
    goto LABEL_18;
  }
  BOOL v12 = (void *)v11;
  unsigned int v13 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      int v15 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v15 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      oobBtPairingProviderInfo = self->_oobBtPairingProviderInfo;
      int v21 = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      __int16 v26 = oobBtPairingProviderInfo;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, legacyConnectionIDForAccessoryUID: %@, accessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v21, 0x20u);
    }

    id v16 = [(_ACCOOBBTPairingProviderInfo *)self->_oobBtPairingProviderInfo remoteObject];
    [v16 legacyConnectionIDForAccessoryUID:v6 connectionID:v4];
  }
  else
  {
LABEL_18:
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v16 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v16 = &_os_log_default;
      id v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v18 = self->_oobBtPairingProviderInfo;
      int v21 = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      __int16 v26 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "OOBBTPairing server, legacyConnectionIDForAccessoryUID: %@, Invalid accessory=%@ _oobBtPairingProviderInfo=%@", (uint8_t *)&v21, 0x20u);
    }
  }
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __37__ACCOOBBTPairingServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_4 != -1) {
    dispatch_once(&sharedServer_once_4, block);
  }
  BOOL v2 = (void *)sharedServer_sharedInstance_4;

  return v2;
}

uint64_t __37__ACCOOBBTPairingServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_4 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.oobbtpairing" andFeatureNotification:"com.apple.accessories.oobbtpairing.availability-changed"];

  return _objc_release_x1();
}

- (_ACCOOBBTPairingProviderInfo)oobBtPairingProviderInfo
{
  return self->_oobBtPairingProviderInfo;
}

- (void)setOobBtPairingProviderInfo:(id)a3
{
}

- (NSMutableDictionary)registeredAccessoryConnections
{
  return self->_registeredAccessoryConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAccessoryConnections, 0);

  objc_storeStrong((id *)&self->_oobBtPairingProviderInfo, 0);
}

- (void)accessoryOOBBTPairingBTAccessoryInfo:(uint64_t)a1 oobBtPairingUID:(NSObject *)a2 accessoryMacAddr:deviceClass:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[ACCOOBBTPairingServer accessoryOOBBTPairingBTAccessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s, invalid accessoryUID=%@", (uint8_t *)&v2, 0x16u);
}

@end