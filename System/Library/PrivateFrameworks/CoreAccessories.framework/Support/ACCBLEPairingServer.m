@interface ACCBLEPairingServer
+ (id)sharedServer;
- (ACCBLEPairingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)accessoryReserved:(id)a3 connHash:(id)a4;
- (BOOL)accessoryReserved:(id)a3 xpcConn:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)releaseAccessory:(id)a3 connHash:(id)a4;
- (BOOL)releaseAccessory:(id)a3 xpcConn:(id)a4;
- (BOOL)reserveAccessory:(id)a3 xpcConn:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableDictionary)blePairingProviderList;
- (NSMutableDictionary)blePairingProviderListByUID;
- (NSMutableDictionary)registeredAccessoryConnections;
- (void)accessoryBLEPairingAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6;
- (void)accessoryBLEPairingDataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6;
- (void)accessoryBLEPairingDetached:(id)a3 blePairingUUID:(id)a4;
- (void)accessoryBLEPairingFinished:(id)a3 blePairingUUID:(id)a4;
- (void)accessoryBLEPairingInfoUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfoList:(id)a6;
- (void)accessoryBLEPairingStateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8;
- (void)dealloc;
- (void)iterateAttachedConnectionsSync:(id)a3;
- (void)iterateBLEPairingProviderListSync:(id)a3;
@end

@implementation ACCBLEPairingServer

- (ACCBLEPairingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACCBLEPairingServer;
  v7 = [(ACCFeatureServer *)&v18 initWithXPCServiceName:v6 andFeatureNotification:a4];
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
    id v20 = v6;
    __int16 v21 = 2080;
    v22 = a4;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initWithXPCServiceName: serviceName='%@' notification='%s' self=%@", buf, 0x20u);
  }

  if (v7)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registeredAccessoryConnections = v7->_registeredAccessoryConnections;
    v7->_registeredAccessoryConnections = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    blePairingProviderList = v7->_blePairingProviderList;
    v7->_blePairingProviderList = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    blePairingProviderListByUID = v7->_blePairingProviderListByUID;
    v7->_blePairingProviderListByUID = v15;
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
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc: self=%@", buf, 0xCu);
  }

  registeredAccessoryConnections = self->_registeredAccessoryConnections;
  self->_registeredAccessoryConnections = 0;

  blePairingProviderList = self->_blePairingProviderList;
  self->_blePairingProviderList = 0;

  blePairingProviderListByUID = self->_blePairingProviderListByUID;
  self->_blePairingProviderListByUID = 0;

  v9.receiver = self;
  v9.super_class = (Class)ACCBLEPairingServer;
  [(ACCFeatureServer *)&v9 dealloc];
}

- (void)iterateAttachedConnectionsSync:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NSMutableDictionary *)self->_registeredAccessoryConnections allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 1;
      v4[2](v4, v10, &v11);
      if (!v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)iterateBLEPairingProviderListSync:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NSMutableDictionary *)self->_blePairingProviderList allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 1;
      v4[2](v4, v10, &v11);
      if (!v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)reserveAccessory:(id)a3 xpcConn:(id)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 hash]);
  uint64_t v8 = [(NSMutableDictionary *)self->_blePairingProviderList objectForKey:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  uint64_t v10 = v9;
  if (v9) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      long long v12 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      long long v12 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    int v27 = 138413058;
    id v28 = v6;
    __int16 v29 = 2112;
    v30 = v7;
    __int16 v31 = 2112;
    v32 = v8;
    __int16 v33 = 2112;
    v34 = v10;
    id v20 = "reserveAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Failed to reserve! no provider or accessory";
    goto LABEL_46;
  }
  long long v13 = [v9 activeProvider];

  if (!v13)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      __int16 v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v21 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138413058;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v7;
      __int16 v31 = 2112;
      v32 = v8;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "reserveAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Reserve OK!", (uint8_t *)&v27, 0x2Au);
    }

    long long v12 = [v8 providerUID];
    [v10 setActiveProvider:v12];
    goto LABEL_40;
  }
  long long v14 = [v10 activeProvider];
  long long v15 = [v8 providerUID];
  unsigned int v16 = [v14 isEqualToString:v15];

  if (gLogObjects) {
    BOOL v17 = gNumLogObjects <= 4;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (!v16)
  {
    if (v18)
    {
      long long v12 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      long long v12 = &_os_log_default;
      id v25 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    int v27 = 138413058;
    id v28 = v6;
    __int16 v29 = 2112;
    v30 = v7;
    __int16 v31 = 2112;
    v32 = v8;
    __int16 v33 = 2112;
    v34 = v10;
    id v20 = "reserveAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Failed to reserve! already reserved for another provider";
LABEL_46:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, 0x2Au);
LABEL_47:
    BOOL v24 = 0;
    goto LABEL_48;
  }
  if (v18)
  {
    long long v12 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    long long v12 = &_os_log_default;
    id v23 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138413058;
    id v28 = v6;
    __int16 v29 = 2112;
    v30 = v7;
    __int16 v31 = 2112;
    v32 = v8;
    __int16 v33 = 2112;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "reserveAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Already reserved!", (uint8_t *)&v27, 0x2Au);
  }
LABEL_40:
  BOOL v24 = 1;
LABEL_48:

  return v24;
}

- (BOOL)releaseAccessory:(id)a3 connHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_blePairingProviderList objectForKey:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  uint64_t v10 = v9;
  if (v9) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
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
      id v20 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    else
    {
      id v20 = *(id *)(gLogObjects + 32);
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    int v26 = 138413058;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    __int16 v32 = 2112;
    __int16 v33 = v10;
    __int16 v21 = "releaseAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Failed to release! no provider or accessory";
    goto LABEL_38;
  }
  long long v14 = [v9 activeProvider];
  long long v15 = [v8 providerUID];
  unsigned int v16 = [v14 isEqualToString:v15];

  if (gLogObjects) {
    BOOL v17 = gNumLogObjects <= 4;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (!v16)
  {
    if (v18)
    {
      id v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v20 = &_os_log_default;
      id v24 = &_os_log_default;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    int v26 = 138413058;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    __int16 v32 = 2112;
    __int16 v33 = v10;
    __int16 v21 = "releaseAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Failed to release! not reserved";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, 0x2Au);
LABEL_39:

    BOOL v23 = 0;
    goto LABEL_40;
  }
  if (v18)
  {
    id v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v19 = &_os_log_default;
    id v22 = &_os_log_default;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138413058;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    __int16 v32 = 2112;
    __int16 v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "releaseAccessory: %@, xpcConn hash %@, provider %@, accessory %@: Release OK!", (uint8_t *)&v26, 0x2Au);
  }

  [v10 setActiveProvider:0];
  BOOL v23 = 1;
LABEL_40:

  return v23;
}

- (BOOL)releaseAccessory:(id)a3 xpcConn:(id)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 hash]);
  LOBYTE(self) = [(ACCBLEPairingServer *)self releaseAccessory:v6 connHash:v7];

  return (char)self;
}

- (BOOL)accessoryReserved:(id)a3 connHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_blePairingProviderList objectForKey:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  uint64_t v10 = v9;
  if (v9) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
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
      BOOL v17 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    else
    {
      BOOL v17 = *(id *)(gLogObjects + 32);
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138413058;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "accessoryReserved: %@, xpcConn hash %@, provider %@, accessory %@: No provider or accessory", (uint8_t *)&v20, 0x2Au);
    }
    LOBYTE(v16) = 0;
  }
  else
  {
    long long v14 = [v9 activeProvider];
    long long v15 = [v8 providerUID];
    unsigned int v16 = [v14 isEqualToString:v15];

    if (gLogObjects && gNumLogObjects >= 5)
    {
      BOOL v17 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v17 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138413314;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 1024;
      unsigned int v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "accessoryReserved: %@, xpcConn hash %@, provider %@, accessory %@: success = %d", (uint8_t *)&v20, 0x30u);
    }
  }

  return v16;
}

- (BOOL)accessoryReserved:(id)a3 xpcConn:(id)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 hash]);
  LOBYTE(self) = [(ACCBLEPairingServer *)self accessoryReserved:v6 connHash:v7];

  return (char)self;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v25 = a3;
  id v6 = a4;
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
    uint64_t v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    uint64_t v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)buf = 138412290;
    v34 = xpcServiceName;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  BOOL v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCBLEPairingXPCServerProtocol];
  [v6 setExportedInterface:v11];

  BOOL v12 = [[ACCBLEPairingServerRemote alloc] initWithXPCConnection:v6];
  [v6 setExportedObject:v12];
  id v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCBLEPairingXPCClientProtocol];
  [v6 setRemoteObjectInterface:v13];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_100216F30;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &location);
  v28[4] = self;
  [v6 setInvalidationHandler:v28];
  long long v14 = objc_alloc_init(_ACCBLEPairingProviderInfo);
  [(_ACCBLEPairingProviderInfo *)v14 setConnection:v6];
  [(_ACCBLEPairingProviderInfo *)v14 setServerRemote:v12];
  long long v15 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_11];
  [(_ACCBLEPairingProviderInfo *)v14 setRemoteObject:v15];

  unsigned int v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 hash]);
  [(NSMutableDictionary *)self->_blePairingProviderList setObject:v14 forKey:v16];
  blePairingProviderListByUID = self->_blePairingProviderListByUID;
  id v18 = [(_ACCBLEPairingProviderInfo *)v14 providerUID];
  [(NSMutableDictionary *)blePairingProviderListByUID setObject:v14 forKey:v18];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v19 = &_os_log_default;
    id v20 = &_os_log_default;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (NSString *)[(NSMutableDictionary *)self->_blePairingProviderList count];
    *(_DWORD *)buf = 134217984;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "There are now %lu BLEPairingProvider(s).", buf, 0xCu);
  }

  [v6 resume];
  __int16 v22 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_171;
  block[3] = &unk_100215968;
  block[4] = self;
  id v27 = v14;
  id v23 = v14;
  dispatch_async(v22, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    id v31 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated! %@", buf, 0xCu);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 setInvalidationHandler:0];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 hash]);

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = [v9 blePairingProviderList];
  BOOL v11 = [v10 objectForKey:v8];

  BOOL v12 = *(void **)(a1 + 32);
  __int16 v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  __int16 v26 = __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_165;
  id v27 = &unk_100216F08;
  objc_copyWeak(&v29, (id *)(a1 + 48));
  id v13 = v8;
  id v28 = v13;
  [v12 iterateAttachedConnectionsSync:&v24];
  id v14 = objc_loadWeakRetained((id *)(a1 + 48));
  long long v15 = objc_msgSend(v14, "blePairingProviderListByUID", v24, v25, v26, v27);
  unsigned int v16 = [v11 providerUID];
  [v15 removeObjectForKey:v16];

  id v17 = objc_loadWeakRetained((id *)(a1 + 48));
  id v18 = [v17 blePairingProviderList];
  [v18 removeObjectForKey:v13];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v19 = &_os_log_default;
    id v20 = &_os_log_default;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_loadWeakRetained((id *)(a1 + 48));
    __int16 v22 = [v21 blePairingProviderList];
    id v23 = [v22 count];
    *(_DWORD *)buf = 134217984;
    id v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "There are now %lu BLEPairingProvider(s).", buf, 0xCu);
  }
  objc_destroyWeak(&v29);
}

void __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_165(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v8 accessoryUID];
  unsigned int v5 = [WeakRetained accessoryReserved:v4 connHash:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [v8 accessoryUID];
    [v6 releaseAccessory:v7 connHash:*(void *)(a1 + 32)];
  }
}

void __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_169(id a1, NSError *a2)
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
    unsigned int v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    unsigned int v5 = *(id *)(gLogObjects + 32);
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

void __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_171(uint64_t a1)
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
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 72);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inform provider of attached accessories %@", buf, 0xCu);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          BOOL v12 = *(void **)(a1 + 32);
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_172;
          v13[3] = &unk_100216F78;
          v13[4] = v11;
          [v12 iterateBLEPairingProviderListSync:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) remoteObject];
    [v6 accessoryBLEPairingNoAccessories];
  }
}

void __58__ACCBLEPairingServer_listener_shouldAcceptNewConnection___block_invoke_172(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  uint64_t v5 = [v14 remoteObject];

  if (v5)
  {
    id v6 = [v14 remoteObject];
    id v7 = [*(id *)(a1 + 32) accessoryUID];
    id v8 = [*(id *)(a1 + 32) blePairingUUID];
    uint64_t v9 = [*(id *)(a1 + 32) accInfoDict];
    uint64_t v10 = [*(id *)(a1 + 32) supportedPairTypes];
    [v6 accessoryBLEPairingAttached:v7 blePairingUUID:v8 accInfoDict:v9 supportedPairTypes:v10];

    if ([*(id *)(a1 + 32) pairingFinished])
    {
      uint64_t v11 = [v14 remoteObject];
      BOOL v12 = [*(id *)(a1 + 32) accessoryUID];
      id v13 = [*(id *)(a1 + 32) blePairingUUID];
      [v11 accessoryBLEPairingFinished:v12 blePairingUUID:v13];
    }
  }
  *a3 = 1;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (void)accessoryBLEPairingAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (_ACCBLEPairingAccessoryInfo *)a4;
  BOOL v12 = (NSMutableDictionary *)a5;
  id v13 = a6;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 5;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    long long v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    long long v16 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v35 = v10;
    __int16 v36 = 2112;
    v37 = v11;
    __int16 v38 = 2112;
    v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingAttached: %@, blePairingUUID==%@, accInfoDict=%@, supportedPairTypes=%@", buf, 0x2Au);
  }

  long long v17 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v10];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v18 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v18 = &_os_log_default;
    id v19 = &_os_log_default;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    blePairingProviderList = self->_blePairingProviderList;
    *(_DWORD *)buf = 138412802;
    id v35 = v10;
    __int16 v36 = 2112;
    v37 = v17;
    __int16 v38 = 2112;
    v39 = blePairingProviderList;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "BLEPairing server, accessoryBLEPairingAttached: %@, accessory=%@ _blePairingProviderList=%@", buf, 0x20u);
  }

  id v21 = _convertAccInfoToBLEAccInfo((uint64_t)v12, v20, v11, v13);
  if (!v17)
  {
    long long v17 = [[_ACCBLEPairingAccessoryInfo alloc] initWithUID:v10 blePairingUUID:v11 accInfoDict:v21 supportedPairTypes:v13];
    [(NSMutableDictionary *)self->_registeredAccessoryConnections setObject:v17 forKey:v10];
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __97__ACCBLEPairingServer_accessoryBLEPairingAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke;
  v28[3] = &unk_100216FA0;
  id v29 = v17;
  id v30 = v10;
  id v31 = v11;
  id v32 = v21;
  id v33 = v13;
  id v22 = v13;
  id v23 = v21;
  __int16 v24 = v11;
  id v25 = v10;
  __int16 v26 = v17;
  [(ACCBLEPairingServer *)self iterateBLEPairingProviderListSync:v28];
}

void __97__ACCBLEPairingServer_accessoryBLEPairingAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (a1[4])
  {
    id v8 = v5;
    id v6 = [v5 remoteObject];

    id v5 = v8;
    if (v6)
    {
      id v7 = [v8 remoteObject];
      [v7 accessoryBLEPairingAttached:a1[5] blePairingUUID:a1[6] accInfoDict:a1[7] supportedPairTypes:a1[8]];

      id v5 = v8;
      *a3 = 1;
    }
  }
}

- (void)accessoryBLEPairingDetached:(id)a3 blePairingUUID:(id)a4
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingDetached: %@, blePairingUUID=%@", buf, 0x16u);
  }

  uint64_t v11 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    BOOL v12 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    blePairingProviderList = self->_blePairingProviderList;
    *(_DWORD *)buf = 138412802;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = blePairingProviderList;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "BLEPairing server, accessoryBLEPairingDetached: %@, accessory=%@ _blePairingProviderList=%@", buf, 0x20u);
  }

  if (v11) {
    [(NSMutableDictionary *)self->_registeredAccessoryConnections removeObjectForKey:v6];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __66__ACCBLEPairingServer_accessoryBLEPairingDetached_blePairingUUID___block_invoke;
  v17[3] = &unk_100216FC8;
  id v18 = v6;
  id v19 = v7;
  id v14 = v7;
  id v15 = v6;
  [(ACCBLEPairingServer *)self iterateBLEPairingProviderListSync:v17];
}

void __66__ACCBLEPairingServer_accessoryBLEPairingDetached_blePairingUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v5 = [v7 remoteObject];

  if (v5)
  {
    id v6 = [v7 remoteObject];
    [v6 accessoryBLEPairingDetached:*(void *)(a1 + 32) blePairingUUID:*(void *)(a1 + 40)];
  }
  *a3 = 1;
}

- (void)accessoryBLEPairingStateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v37 = a6;
  uint64_t v10 = *(void *)&a5;
  id v13 = a3;
  id v14 = a4;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 5;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    long long v17 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  else
  {
    long long v17 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    id v39 = v13;
    __int16 v40 = 2112;
    id v41 = v14;
    __int16 v42 = 1024;
    *(_DWORD *)v43 = v10;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v37;
    __int16 v44 = 1024;
    int v45 = a7;
    __int16 v46 = 1024;
    BOOL v47 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingStateUpdate: %@, blePairingUUID=%@, validMask=%xh btRadioOn=%d pairingState=%d pairingModeOn=%d", buf, 0x2Eu);
  }

  id v18 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v13];
  blePairingProviderListByUID = self->_blePairingProviderListByUID;
  uint64_t v20 = [v18 activeProvider];
  id v21 = [(NSMutableDictionary *)blePairingProviderListByUID objectForKey:v20];

  if (v18) {
    BOOL v22 = v21 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v23 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v23 = &_os_log_default;
      id v30 = &_os_log_default;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v39 = v13;
      __int16 v40 = 2112;
      id v41 = v18;
      __int16 v42 = 2112;
      *(void *)v43 = v21;
      id v31 = "BLEPairing server, accessoryBLEPairingStateUpdate: %@, Invalid accessory=%@ or no active providerInfo=%@";
      id v32 = v23;
      uint32_t v33 = 32;
LABEL_46:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
    }
  }
  else
  {
    unsigned int v36 = a7;
    BOOL v24 = v8;
    id v25 = v14;
    __int16 v26 = [v21 remoteObject];

    if (gLogObjects) {
      BOOL v27 = gNumLogObjects <= 4;
    }
    else {
      BOOL v27 = 1;
    }
    int v28 = !v27;
    if (v26)
    {
      if (v28)
      {
        id v29 = *(id *)(gLogObjects + 32);
        id v14 = v25;
      }
      else
      {
        id v14 = v25;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v29 = &_os_log_default;
        id v34 = &_os_log_default;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v39 = v13;
        __int16 v40 = 2112;
        id v41 = v18;
        __int16 v42 = 2112;
        *(void *)v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingStateUpdate: %@, accessory=%@ providerInfo=%@", buf, 0x20u);
      }

      id v23 = [v21 remoteObject];
      [v23 accessoryBLEPairingStateUpdate:v13 blePairingUUID:v14 validMask:v10 btRadioOn:v37 pairingState:v36 pairingModeOn:v24];
      goto LABEL_47;
    }
    if (v28)
    {
      id v23 = *(id *)(gLogObjects + 32);
      id v14 = v25;
    }
    else
    {
      id v14 = v25;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v23 = &_os_log_default;
      id v35 = &_os_log_default;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v13;
      __int16 v40 = 2112;
      id v41 = v21;
      id v31 = "BLEPairing server, accessoryBLEPairingStateUpdate: %@, Provider doesn't respond to selector, providerInfo=%@";
      id v32 = v23;
      uint32_t v33 = 22;
      goto LABEL_46;
    }
  }
LABEL_47:
}

- (void)accessoryBLEPairingInfoUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfoList:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
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
    BOOL v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    BOOL v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138413058;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 1024;
    LODWORD(v37[0]) = v7;
    WORD2(v37[0]) = 2112;
    *(void *)((char *)v37 + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingInfoUpdate: %@, blePairingUUID=%@, pairType=%d pairingInfoList=%@", (uint8_t *)&v32, 0x26u);
  }

  id v16 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v10];
  blePairingProviderListByUID = self->_blePairingProviderListByUID;
  id v18 = [v16 activeProvider];
  id v19 = [(NSMutableDictionary *)blePairingProviderListByUID objectForKey:v18];

  if (v16) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = &_os_log_default;
      id v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412802;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      v37[0] = v19;
      BOOL v27 = "BLEPairing server, accessoryBLEPairingInfoUpdate: %@, Invalid accessory=%@ or no active providerInfo=%@";
      int v28 = v21;
      uint32_t v29 = 32;
LABEL_46:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v32, v29);
    }
  }
  else
  {
    BOOL v22 = [v19 remoteObject];

    if (gLogObjects) {
      BOOL v23 = gNumLogObjects <= 4;
    }
    else {
      BOOL v23 = 1;
    }
    int v24 = !v23;
    if (v22)
    {
      if (v24)
      {
        id v25 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v25 = &_os_log_default;
        id v30 = &_os_log_default;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412802;
        id v33 = v10;
        __int16 v34 = 2112;
        id v35 = v16;
        __int16 v36 = 2112;
        v37[0] = v19;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingInfoUpdate: %@, accessory=%@ providerInfo=%@", (uint8_t *)&v32, 0x20u);
      }

      id v21 = [v19 remoteObject];
      [v21 accessoryBLEPairingInfoUpdate:v10 blePairingUUID:v11 pairType:v7 pairInfoList:v12];
      goto LABEL_47;
    }
    if (v24)
    {
      id v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = &_os_log_default;
      id v31 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412546;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v11;
      BOOL v27 = "BLEPairing server, accessoryBLEPairingInfoUpdate: %@, blePairingUUID=%@, invalid provider.remoteObject = nil";
      int v28 = v21;
      uint32_t v29 = 22;
      goto LABEL_46;
    }
  }
LABEL_47:
}

- (void)accessoryBLEPairingDataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
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
    BOOL v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    BOOL v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138413058;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 1024;
    LODWORD(v37[0]) = v7;
    WORD2(v37[0]) = 2112;
    *(void *)((char *)v37 + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingDataUpdate: %@, blePairingUUID=%@, pairType=%d pairData=%@", (uint8_t *)&v32, 0x26u);
  }

  id v16 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v10];
  blePairingProviderListByUID = self->_blePairingProviderListByUID;
  id v18 = [v16 activeProvider];
  id v19 = [(NSMutableDictionary *)blePairingProviderListByUID objectForKey:v18];

  if (v16) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = &_os_log_default;
      id v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412802;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      v37[0] = v19;
      BOOL v27 = "BLEPairing server, accessoryBLEPairingDataUpdate: %@, Invalid accessory=%@ or no active providerInfo=%@";
      int v28 = v21;
      uint32_t v29 = 32;
LABEL_46:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v32, v29);
    }
  }
  else
  {
    BOOL v22 = [v19 remoteObject];

    if (gLogObjects) {
      BOOL v23 = gNumLogObjects <= 4;
    }
    else {
      BOOL v23 = 1;
    }
    int v24 = !v23;
    if (v22)
    {
      if (v24)
      {
        id v25 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v25 = &_os_log_default;
        id v30 = &_os_log_default;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412802;
        id v33 = v10;
        __int16 v34 = 2112;
        id v35 = v16;
        __int16 v36 = 2112;
        v37[0] = v19;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingDataUpdate: %@, accessory=%@ providerInfo=%@", (uint8_t *)&v32, 0x20u);
      }

      id v21 = [v19 remoteObject];
      [v21 accessoryBLEPairingDataUpdate:v10 blePairingUUID:v11 pairType:v7 pairData:v12];
      goto LABEL_47;
    }
    if (v24)
    {
      id v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = &_os_log_default;
      id v31 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412546;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v11;
      BOOL v27 = "BLEPairing server, accessoryBLEPairingDataUpdate: %@, blePairingUUID=%@, invalid provider.remoteObject = nil";
      int v28 = v21;
      uint32_t v29 = 22;
      goto LABEL_46;
    }
  }
LABEL_47:
}

- (void)accessoryBLEPairingFinished:(id)a3 blePairingUUID:(id)a4
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingFinished: %@, blePairingUUID=%@", buf, 0x16u);
  }

  id v11 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v12 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    blePairingProviderList = self->_blePairingProviderList;
    *(_DWORD *)buf = 138413058;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    BOOL v27 = blePairingProviderList;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "BLEPairing server, accessoryBLEPairingFinished: %@, blePairingUUID=%@, accessory=%@ _blePairingProviderList=%@", buf, 0x2Au);
  }

  if (v11)
  {
    [v11 setPairingFinished:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __66__ACCBLEPairingServer_accessoryBLEPairingFinished_blePairingUUID___block_invoke;
    v17[3] = &unk_100216FC8;
    id v18 = v6;
    id v19 = v7;
    [(ACCBLEPairingServer *)self iterateBLEPairingProviderListSync:v17];

    id v14 = v18;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v14 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v14 = &_os_log_default;
      id v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BLEPairing server, accessoryBLEPairingFinished: %@, Invalid accessory=%@", buf, 0x16u);
    }
  }
}

void __66__ACCBLEPairingServer_accessoryBLEPairingFinished_blePairingUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v5 = [v7 remoteObject];

  if (v5)
  {
    id v6 = [v7 remoteObject];
    [v6 accessoryBLEPairingFinished:*(void *)(a1 + 32) blePairingUUID:*(void *)(a1 + 40)];
  }
  *a3 = 1;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __35__ACCBLEPairingServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_3 != -1) {
    dispatch_once(&sharedServer_once_3, block);
  }
  BOOL v2 = (void *)sharedServer_sharedInstance_3;

  return v2;
}

uint64_t __35__ACCBLEPairingServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_3 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.blepairing" andFeatureNotification:"com.apple.accessories.blepairing.availability-changed"];

  return _objc_release_x1();
}

- (NSMutableDictionary)blePairingProviderList
{
  return self->_blePairingProviderList;
}

- (NSMutableDictionary)blePairingProviderListByUID
{
  return self->_blePairingProviderListByUID;
}

- (NSMutableDictionary)registeredAccessoryConnections
{
  return self->_registeredAccessoryConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAccessoryConnections, 0);
  objc_storeStrong((id *)&self->_blePairingProviderListByUID, 0);

  objc_storeStrong((id *)&self->_blePairingProviderList, 0);
}

@end