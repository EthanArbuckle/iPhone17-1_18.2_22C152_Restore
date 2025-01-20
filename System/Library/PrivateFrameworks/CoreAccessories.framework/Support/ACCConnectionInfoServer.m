@interface ACCConnectionInfoServer
+ (id)sharedServer;
- (ACCConnectionInfoServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)accessoryConnectionFiltered:(id)a3 forClient:(id)a4;
- (BOOL)accessoryEndpointFiltered:(id)a3 forConnection:(id)a4 forClient:(id)a5;
- (BOOL)checkClient:(id)a3 hasEntitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSLock)clientListLock;
- (NSLock)connectedAccessoryLock;
- (NSMutableDictionary)endpoints;
- (NSMutableSet)accessories;
- (NSMutableSet)clientConnections;
- (id)getClientUID:(id)a3;
- (void)_updateFilteredListForClient:(id)a3 forConnection:(id)a4;
- (void)_updateFilteredListForClient:(id)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6 forClient:(id)a7;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryConnectionDetached:(id)a3 forClient:(id)a4;
- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7 forClient:(id)a8;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4 forClient:(id)a5;
- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5;
- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6;
- (void)configStreamCategoriesResponse:(id)a3 forEndpoint:(id)a4 connection:(id)a5 client:(id)a6 success:(BOOL)a7;
- (void)configStreamCategoryListReady:(id)a3 connection:(id)a4 client:(id)a5;
- (void)configStreamPropertyResponse:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 client:(id)a7 value:(id)a8 success:(BOOL)a9;
- (void)handleInterceptData:(id)a3 forEndpoint:(id)a4 connection:(id)a5;
- (void)notifyClientOfConnections:(id)a3;
- (void)notifyOfClient:(id)a3 bundleID:(id)a4 forClient:(id)a5 withFilter:(id)a6;
- (void)notifyOfClient:(id)a3 bundleID:(id)a4 forClient:(id)a5 withFilter:(id)a6 forIdentifier:(id)a7;
- (void)removeConnection:(id)a3 forClientFilter:(id)a4;
- (void)removeEndpoint:(id)a3 connection:(id)a4 forClientFilter:(id)a5;
- (void)setAccessories:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setClientListLock:(id)a3;
- (void)setConnectedAccessoryLock:(id)a3;
- (void)setEndpoints:(id)a3;
- (void)setInterceptState:(BOOL)a3 forEndpoint:(id)a4 connection:(id)a5 clientInfo:(id)a6;
- (void)updateFilteredListForClient:(id)a3;
@end

@implementation ACCConnectionInfoServer

- (ACCConnectionInfoServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 9;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    v9 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfoServer initWithXPCServiceName: %@", buf, 0xCu);
  }

  v22.receiver = self;
  v22.super_class = (Class)ACCConnectionInfoServer;
  v10 = [(ACCFeatureServer *)&v22 initWithXPCServiceName:v6 andFeatureNotification:a4];
  if (v10)
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clientConnections = v10->_clientConnections;
    v10->_clientConnections = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    accessories = v10->_accessories;
    v10->_accessories = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    endpoints = v10->_endpoints;
    v10->_endpoints = v15;

    v17 = (NSLock *)objc_alloc_init((Class)NSLock);
    connectedAccessoryLock = v10->_connectedAccessoryLock;
    v10->_connectedAccessoryLock = v17;

    v19 = (NSLock *)objc_alloc_init((Class)NSLock);
    clientListLock = v10->_clientListLock;
    v10->_clientListLock = v19;
  }
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 9;
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
    v10 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v35 = @"com.apple.accessories.connection-info-server";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCConnectionInfoXPCServerProtocol];
  [v7 setExportedInterface:v11];

  v12 = [[ACCConnectionInfoClientInfo alloc] initWithXPCConnection:v7];
  v13 = [[ACCConnectionInfoServerRemote alloc] initWithClientInfo:v12];
  [v7 setExportedObject:v13];

  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCConnectionInfoXPCClientProtocol];
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __62__ACCConnectionInfoServer_listener_shouldAcceptNewConnection___block_invoke;
  v29[3] = &unk_100215BF8;
  objc_copyWeak(&v30, &from);
  v29[4] = self;
  objc_copyWeak(&v31, &location);
  [v7 setInvalidationHandler:v29];
  v15 = [(ACCConnectionInfoServer *)self clientListLock];
  [v15 lock];

  v16 = [(ACCConnectionInfoServer *)self clientConnections];
  [v16 addObject:v12];

  if (gLogObjects && gNumLogObjects >= 9)
  {
    v17 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(ACCConnectionInfoServer *)self clientConnections];
    CFStringRef v20 = (const __CFString *)[v19 count];
    *(_DWORD *)buf = 134217984;
    CFStringRef v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "There are now %lu client(s).", buf, 0xCu);
  }
  v21 = [(ACCConnectionInfoServer *)self clientListLock];
  [v21 unlock];

  [v7 resume];
  if (![(ACCConnectionInfoClientInfo *)v12 allConnectionsNotificationsEntitlement])
  {
    if (gLogObjects && gNumLogObjects >= 9)
    {
      objc_super v22 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v22 = &_os_log_default;
      id v23 = &_os_log_default;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [(ACCConnectionInfoClientInfo *)v12 clientUID];
      v25 = [(ACCConnectionInfoClientInfo *)v12 clientBundleID];
      unsigned int v26 = [(ACCConnectionInfoClientInfo *)v12 allConnectionsNotificationsEntitlement];
      *(_DWORD *)buf = 138412802;
      CFStringRef v35 = v24;
      __int16 v36 = 2112;
      v37 = v25;
      __int16 v38 = 1024;
      unsigned int v39 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Client %@ (%@) not entitled for showallconnections!!! return %d", buf, 0x1Cu);
    }
  }
  unsigned __int8 v27 = [(ACCConnectionInfoClientInfo *)v12 allConnectionsNotificationsEntitlement];
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v27;
}

void __62__ACCConnectionInfoServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setExportedObject:0];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 9;
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
    id v7 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(v2);
    *(_DWORD *)buf = 138412290;
    id v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated: %@", buf, 0xCu);
  }
  id v9 = [a1[4] clientListLock];
  [v9 lock];

  v10 = [a1[4] clientConnections];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __62__ACCConnectionInfoServer_listener_shouldAcceptNewConnection___block_invoke_199;
  v30[3] = &unk_1002164A0;
  objc_copyWeak(&v31, v2);
  v11 = [v10 objectsPassingTest:v30];

  if (gLogObjects && gNumLogObjects >= 9)
  {
    v12 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __62__ACCConnectionInfoServer_listener_shouldAcceptNewConnection___block_invoke_cold_2(buf, (uint64_t)[v11 count], v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v19 = objc_msgSend(a1[4], "clientConnections", (void)v26);
        [v19 removeObject:v18];
      }
      id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  if (gLogObjects && gNumLogObjects >= 9)
  {
    CFStringRef v20 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    CFStringRef v20 = &_os_log_default;
    id v21 = &_os_log_default;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = objc_loadWeakRetained(a1 + 6);
    id v23 = [v22 clientConnections];
    id v24 = [v23 count];
    *(_DWORD *)v32 = 134217984;
    id v33 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "There are now %lu client(s).", v32, 0xCu);
  }
  v25 = [a1[4] clientListLock];
  [v25 unlock];

  objc_destroyWeak(&v31);
}

id __62__ACCConnectionInfoServer_listener_shouldAcceptNewConnection___block_invoke_199(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  v3 = [a2 XPCConnection];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 isEqual:WeakRetained];

  return v5;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v3 = a3;
  if (([v3 allConnectionsNotificationsEntitlement] & 1) == 0)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 9;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v6 = &_os_log_default;
      id v5 = &_os_log_default;
    }
    else
    {
      id v6 = *(id *)(gLogObjects + 64);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 clientUID];
      id v8 = [v3 clientBundleID];
      int v11 = 138412802;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 1024;
      unsigned int v16 = [v3 allConnectionsNotificationsEntitlement];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldAcceptXPCConnection: client %@ (%@) not entitled for showallconnections!!! return %d", (uint8_t *)&v11, 0x1Cu);
    }
  }
  unsigned __int8 v9 = [v3 allConnectionsNotificationsEntitlement];

  return v9;
}

- (void)notifyOfClient:(id)a3 bundleID:(id)a4 forClient:(id)a5 withFilter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 9;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    unsigned int v16 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [v12 clientUID];
    uint64_t v18 = [v12 clientBundleID];
    v19 = [v12 accessoryFilterDictionary];
    int v21 = 138413570;
    id v22 = v17;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    long long v26 = v18;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v19;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "clientUID received %@ -> %@, clientBundleID %@ -> %@, accessoryFilterDictionary %@ -> %@", (uint8_t *)&v21, 0x3Eu);
  }
  [v12 setClientUID:v10];
  [v12 setClientBundleID:v11];
  if ([v12 hasHIDClient]) {
    id v20 = 0;
  }
  else {
    id v20 = v13;
  }
  [v12 setAccessoryFilterDictionary:v20];
  [(ACCConnectionInfoServer *)self updateFilteredListForClient:v12];
  [(ACCConnectionInfoServer *)self notifyClientOfConnections:v12];
}

- (void)notifyOfClient:(id)a3 bundleID:(id)a4 forClient:(id)a5 withFilter:(id)a6 forIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 9;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v19 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  else
  {
    v19 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v14 clientUID];
    int v21 = [v14 clientBundleID];
    id v22 = [v14 accessoryFilterDictionary];
    int v23 = 138413570;
    id v24 = v20;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v21;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v22;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "clientUID received %@ -> %@, clientBundleID %@ -> %@, accessoryFilterDictionary %@ -> %@", (uint8_t *)&v23, 0x3Eu);
  }
  [v14 setClientUID:v12];
  [v14 setClientBundleID:v13];
  [v14 setHasHIDClient:1];
  [v14 setAccessoryFilterDictionary:0];
  [(ACCConnectionInfoServer *)self updateFilteredListForClient:v14];
  [(ACCConnectionInfoServer *)self notifyClientOfConnections:v14];
}

- (BOOL)checkClient:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a4;
  id v6 = [a3 XPCConnection];
  unsigned __int8 v7 = [v6 hasEntitlement:v5];

  return v7;
}

- (id)getClientUID:(id)a3
{
  return [a3 clientUID];
}

- (void)notifyClientOfConnections:(id)a3
{
  id v54 = a3;
  CFSetRef v3 = platform_connectionInfo_accessoryConnections();
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 9;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v7 = [v54 clientUID];
    id v8 = [v54 clientBundleID];
    id v9 = [(__CFSet *)v3 count];
    id v10 = [v54 accessoryFilterDictionary];
    *(_DWORD *)buf = 138413058;
    uint64_t v66 = (uint64_t)v7;
    __int16 v67 = 2112;
    v68 = v8;
    __int16 v69 = 2048;
    id v70 = v9;
    __int16 v71 = 2112;
    v72 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "clientUID %@ (%@), notify of connections (%lu), accessoryFilterDictionary %@", buf, 0x2Au);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  CFSetRef obj = v3;
  id v48 = [(__CFSet *)obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v60;
    id v11 = &_os_log_default;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v60 != v47) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(const void **)(*((void *)&v59 + 1) + 8 * v12);
        uint64_t v14 = platform_connectionInfo_accessoryConnectionType(v13);
        uint64_t v15 = gLogObjects;
        int v16 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v17 = gNumLogObjects < 9;
        }
        else {
          BOOL v17 = 1;
        }
        uint64_t v51 = v12;
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v66 = v15;
            __int16 v67 = 1024;
            LODWORD(v68) = v16;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v18 = &_os_log_default;
          v19 = &_os_log_default;
        }
        else
        {
          v19 = *(id *)(gLogObjects + 64);
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v44 = [v54 clientUID];
          v45 = [v54 clientBundleID];
          *(_DWORD *)buf = 138412802;
          uint64_t v66 = (uint64_t)v44;
          __int16 v67 = 2112;
          v68 = v45;
          __int16 v69 = 2112;
          id v70 = (id)v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "clientUID received %@ (%@), sending attach of connection %@", buf, 0x20u);
        }
        id v20 = platform_connectionInfo_accessoryInfoForConnection(v13);
        CFDictionaryRef v49 = platform_connectionInfo_accessoryPropertiesForConnection(v13);
        v50 = v20;
        -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:](self, "accessoryConnectionAttached:type:info:properties:forClient:", v13, v14, v20);
        CFSetRef v21 = platform_connectionInfo_accessoryEndpoints(v13);
        uint64_t v22 = gLogObjects;
        int v23 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 9)
        {
          id v11 = *(id *)(gLogObjects + 64);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v66 = v22;
            __int16 v67 = 1024;
            LODWORD(v68) = v23;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v24 = &_os_log_default;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          __int16 v25 = [v54 clientUID];
          id v26 = [v54 clientBundleID];
          id v27 = [(__CFSet *)v21 count];
          *(_DWORD *)buf = 138413058;
          uint64_t v66 = (uint64_t)v25;
          __int16 v67 = 2112;
          v68 = v26;
          __int16 v69 = 2048;
          id v70 = v27;
          __int16 v71 = 2112;
          v72 = (void *)v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "clientUID received %@ (%@), sending notify of existing endpoints (%lu) for connection %@", buf, 0x2Au);
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        CFSetRef v52 = v21;
        id v28 = [(__CFSet *)v52 countByEnumeratingWithState:&v55 objects:v63 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v56;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v56 != v30) {
                objc_enumerationMutation(v52);
              }
              id v32 = *(const void **)(*((void *)&v55 + 1) + 8 * i);
              uint64_t v33 = platform_connectionInfo_endpointTransportType((uint64_t)v13, v32);
              id v34 = platform_connectionInfo_endpointProtocol((uint64_t)v13, v32);
              uint64_t v35 = gLogObjects;
              int v36 = gNumLogObjects;
              if (gLogObjects) {
                BOOL v37 = gNumLogObjects < 9;
              }
              else {
                BOOL v37 = 1;
              }
              if (v37)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  uint64_t v66 = v35;
                  __int16 v67 = 1024;
                  LODWORD(v68) = v36;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v38 = &_os_log_default;
                unsigned int v39 = &_os_log_default;
              }
              else
              {
                unsigned int v39 = *(id *)(gLogObjects + 64);
              }
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                v42 = [v54 clientUID];
                v43 = [v54 clientBundleID];
                *(_DWORD *)buf = 138413058;
                uint64_t v66 = (uint64_t)v42;
                __int16 v67 = 2112;
                v68 = v43;
                __int16 v69 = 2112;
                id v70 = (id)v32;
                __int16 v71 = 2112;
                v72 = (void *)v13;
                _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "clientUID received %@ (%@), sending attach of endpoints %@ for connection %@", buf, 0x2Au);
              }
              v40 = platform_connectionInfo_accessoryPropertiesForEndpoint((uint64_t)v13, v32);
              [(ACCConnectionInfoServer *)self accessoryEndpointAttached:v32 transportType:v33 protocol:v34 properties:v40 forConnection:v13 forClient:v54];
              if (platform_connectionInfo_checkConfigStreamCategoryListReady(v13, (uint64_t)v32))
              {
                v41 = [v54 clientUID];
                [(ACCConnectionInfoServer *)self configStreamCategoryListReady:v32 connection:v13 client:v41];
              }
            }
            id v29 = [(__CFSet *)v52 countByEnumeratingWithState:&v55 objects:v63 count:16];
          }
          while (v29);
        }

        uint64_t v12 = v51 + 1;
        id v11 = &_os_log_default;
      }
      while ((id)(v51 + 1) != v48);
      id v48 = [(__CFSet *)obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v48);
  }
}

- (void)setInterceptState:(BOOL)a3 forEndpoint:(id)a4 connection:(id)a5 clientInfo:(id)a6
{
  if (a3)
  {
    id v7 = a4;
    id v8 = [a6 interceptEnabled];
    [v8 addObject:v7];
  }
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  id v35 = a3;
  id v9 = a5;
  id v10 = a6;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412546;
    uint64_t v42 = (uint64_t)v35;
    __int16 v43 = 2048;
    id v44 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "sending accessoryConnectionAttached for connectionUUID %@, to %lu clients", buf, 0x16u);
  }

  uint64_t v15 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v15 lock];

  if (([(NSMutableSet *)self->_accessories containsObject:v35] & 1) == 0) {
    [(NSMutableSet *)self->_accessories addObject:v35];
  }
  int v16 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v16 unlock];

  BOOL v17 = [(ACCConnectionInfoServer *)self clientListLock];
  [v17 lock];

  id v18 = [(NSMutableSet *)self->_clientConnections copy];
  v19 = [(ACCConnectionInfoServer *)self clientListLock];
  [v19 unlock];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v18;
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    id v23 = v21;
    uint64_t v24 = *(void *)v37;
    *(void *)&long long v22 = 134218240;
    long long v33 = v22;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v20);
        }
        id v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v27 = objc_msgSend(v26, "clientUID", v33);

        if (v27)
        {
          [(ACCConnectionInfoServer *)self updateFilteredListForClient:v26];
          [(ACCConnectionInfoServer *)self accessoryConnectionAttached:v35 type:a4 info:v9 properties:v10 forClient:v26];
        }
        else
        {
          uint64_t v28 = gLogObjects;
          int v29 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v30 = gNumLogObjects < 9;
          }
          else {
            BOOL v30 = 1;
          }
          if (v30)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v33;
              uint64_t v42 = v28;
              __int16 v43 = 1024;
              LODWORD(v44) = v29;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v31 = &_os_log_default;
            id v32 = &_os_log_default;
          }
          else
          {
            id v32 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
      }
      id v23 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v23);
  }
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6 forClient:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unsigned int v16 = [(ACCConnectionInfoServer *)self accessoryConnectionFiltered:v12 forClient:v15];
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects <= 8;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (v16)
  {
    if (v18)
    {
      v19 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v19 = &_os_log_default;
      id v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:]();
    }
  }
  else
  {
    if (v18)
    {
      id v20 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v20 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:].cold.5();
    }

    id v23 = [v15 clientUID];

    if (v23)
    {
      v19 = [v15 XPCConnection];
      uint64_t v24 = [v19 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
      [v24 accessoryConnectionAttached:v12 type:v10 info:v13 properties:v14];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 9)
      {
        v19 = *(id *)(gLogObjects + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v19 = &_os_log_default;
        id v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:]();
      }
    }
  }
}

void __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 9;
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
    id v7 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = (uint64_t)v4;
    __int16 v35 = 2048;
    id v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "sending accessoryConnectionDetached for connectionUUID %@, to %lu clients", buf, 0x16u);
  }

  id v9 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v9 lock];

  [(NSMutableSet *)self->_accessories removeObject:v4];
  uint64_t v10 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v10 unlock];

  BOOL v11 = [(ACCConnectionInfoServer *)self clientListLock];
  [v11 lock];

  id v12 = [(NSMutableSet *)self->_clientConnections copy];
  id v13 = [(ACCConnectionInfoServer *)self clientListLock];
  [v13 unlock];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v29;
    *(void *)&long long v16 = 134218240;
    long long v27 = v16;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v21 = objc_msgSend(v20, "clientUID", v27, (void)v28);

        if (v21)
        {
          [(ACCConnectionInfoServer *)self accessoryConnectionDetached:v4 forClient:v20];
          [(ACCConnectionInfoServer *)self removeConnection:v4 forClientFilter:v20];
        }
        else
        {
          uint64_t v22 = gLogObjects;
          int v23 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v24 = gNumLogObjects < 9;
          }
          else {
            BOOL v24 = 1;
          }
          if (v24)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              uint64_t v34 = v22;
              __int16 v35 = 1024;
              LODWORD(v36) = v23;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v25 = &_os_log_default;
            id v26 = &_os_log_default;
          }
          else
          {
            id v26 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
      }
      id v17 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)accessoryConnectionDetached:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(ACCConnectionInfoServer *)self accessoryConnectionFiltered:v6 forClient:v7];
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 8;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v8)
  {
    if (v10)
    {
      BOOL v11 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v11 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionDetached:forClient:]();
    }
  }
  else
  {
    if (v10)
    {
      id v12 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v12 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionDetached:forClient:].cold.5();
    }

    id v15 = [v7 clientUID];

    if (v15)
    {
      BOOL v11 = [v7 XPCConnection];
      long long v16 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_204];
      [v16 accessoryConnectionDetached:v6];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 9)
      {
        BOOL v11 = *(id *)(gLogObjects + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        BOOL v11 = &_os_log_default;
        id v17 = &_os_log_default;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:]();
      }
    }
  }
}

void __65__ACCConnectionInfoServer_accessoryConnectionDetached_forClient___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v42 = a3;
  id v41 = a6;
  id v11 = a7;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 9;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v14 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  else
  {
    id v14 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (NSMutableDictionary *)[(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412802;
    uint64_t v49 = (uint64_t)v42;
    __int16 v50 = 2112;
    id v51 = v11;
    __int16 v52 = 2048;
    v53 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending accessoryEndpointAttached for endpointUUID %@, connectionUUID %@, to %lu clients", buf, 0x20u);
  }

  long long v16 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v16 lock];

  id v17 = [(NSMutableDictionary *)self->_endpoints objectForKey:v11];
  if (!v17)
  {
    id v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableSet);
    [(NSMutableDictionary *)self->_endpoints setObject:v17 forKey:v11];
  }
  if (([(NSMutableDictionary *)v17 containsObject:v42] & 1) == 0)
  {
    [(NSMutableDictionary *)v17 addObject:v42];
    if (gLogObjects && gNumLogObjects >= 9)
    {
      uint64_t v18 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v18 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = (uint64_t)v42;
      __int16 v50 = 2112;
      id v51 = v11;
      __int16 v52 = 2112;
      v53 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "accessoryEndpointAttached:%@, connectionUUID %@, added to endpointSet %@ ", buf, 0x20u);
    }
  }
  long long v39 = v17;
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v20 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v20 = &_os_log_default;
    id v21 = &_os_log_default;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    endpoints = self->_endpoints;
    *(_DWORD *)buf = 138412802;
    uint64_t v49 = (uint64_t)v42;
    __int16 v50 = 2112;
    id v51 = v11;
    __int16 v52 = 2112;
    v53 = endpoints;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "accessoryEndpointAttached:%@, connectionUUID %@, endpoints %@ ", buf, 0x20u);
  }

  uint64_t v22 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v22 unlock];

  int v23 = [(ACCConnectionInfoServer *)self clientListLock];
  [v23 lock];

  id v24 = [(NSMutableSet *)self->_clientConnections copy];
  id v25 = [(ACCConnectionInfoServer *)self clientListLock];
  [v25 unlock];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = v24;
  id v27 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v32 = [v31 clientUID];

        if (v32)
        {
          [(ACCConnectionInfoServer *)self updateFilteredListForClient:v31];
          [(ACCConnectionInfoServer *)self accessoryEndpointAttached:v42 transportType:v9 protocol:a5 properties:v41 forConnection:v11 forClient:v31];
        }
        else
        {
          uint64_t v33 = gLogObjects;
          int v34 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v35 = gNumLogObjects < 9;
          }
          else {
            BOOL v35 = 1;
          }
          if (v35)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v49 = v33;
              __int16 v50 = 1024;
              LODWORD(v51) = v34;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v36 = &_os_log_default;
            long long v37 = &_os_log_default;
          }
          else
          {
            long long v37 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v28);
  }
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7 forClient:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  unsigned int v18 = [(ACCConnectionInfoServer *)self accessoryEndpointFiltered:v14 forConnection:v16 forClient:v17];
  if (gLogObjects) {
    BOOL v19 = gNumLogObjects <= 8;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  if (v18)
  {
    if (v20)
    {
      id v21 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = &_os_log_default;
      id v23 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v24 = [v17 clientUID];
      id v25 = [v17 clientBundleID];
      *(_DWORD *)buf = 138413058;
      id v33 = v14;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      long long v37 = v24;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v25;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Skip sending filtered accessoryEndpointAttached for endpointUUID %@, connectionUUID %@, to client %@ (%@)", buf, 0x2Au);
    }
  }
  else
  {
    if (v20)
    {
      uint64_t v22 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v22 = &_os_log_default;
      id v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      long long v31 = [v17 clientUID];
      [v17 clientBundleID];
      *(_DWORD *)buf = 138413058;
      id v33 = v14;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      long long v37 = v31;
      v39 = __int16 v38 = 2112;
      long long v30 = (void *)v39;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "sending accessoryEndpointAttached for endpointUUID %@, connectionUUID %@, to client %@ (%@)", buf, 0x2Au);
    }
    id v27 = [v17 clientUID];

    if (v27)
    {
      id v21 = [v17 XPCConnection];
      id v28 = [v21 remoteObjectProxyWithErrorHandler:&__block_literal_global_206];
      [v28 accessoryEndpointAttached:v14 transportType:v12 protocol:v11 properties:v15 forConnection:v16];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 9)
      {
        id v21 = *(id *)(gLogObjects + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v21 = &_os_log_default;
        id v29 = &_os_log_default;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:]();
      }
    }
  }
}

void __111__ACCConnectionInfoServer_accessoryEndpointAttached_transportType_protocol_properties_forConnection_forClient___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 9;
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
    int v10 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412802;
    uint64_t v38 = (uint64_t)v6;
    __int16 v39 = 2112;
    id v40 = v7;
    __int16 v41 = 2048;
    id v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "sending accessoryEndpointDetached for endpointUUID %@, connectionUUID %@, to %lu clients", buf, 0x20u);
  }

  uint64_t v12 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v12 lock];

  id v13 = [(NSMutableDictionary *)self->_endpoints objectForKey:v7];
  id v14 = v13;
  if (v13) {
    [v13 removeObject:v6];
  }
  long long v31 = v14;
  id v15 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v15 unlock];

  id v16 = [(ACCConnectionInfoServer *)self clientListLock];
  [v16 lock];

  id v17 = [(NSMutableSet *)self->_clientConnections copy];
  unsigned int v18 = [(ACCConnectionInfoServer *)self clientListLock];
  [v18 unlock];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v25 = [v24 clientUID];

        if (v25)
        {
          [(ACCConnectionInfoServer *)self accessoryEndpointDetached:v6 forConnection:v7 forClient:v24];
          [(ACCConnectionInfoServer *)self removeEndpoint:v6 connection:v7 forClientFilter:v24];
        }
        else
        {
          uint64_t v26 = gLogObjects;
          int v27 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v28 = gNumLogObjects < 9;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v38 = v26;
              __int16 v39 = 1024;
              LODWORD(v40) = v27;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v29 = &_os_log_default;
            long long v30 = &_os_log_default;
          }
          else
          {
            long long v30 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(ACCConnectionInfoServer *)self accessoryEndpointFiltered:v8 forConnection:v9 forClient:v10];
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 8;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v11)
  {
    if (v13)
    {
      id v14 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v14 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [v10 clientUID];
      unsigned int v18 = [v10 clientBundleID];
      int v24 = 138413058;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      long long v31 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Skip sending filtered accessoryEndpointDetached for endpointUUID %@, connectionUUID %@, to client %@ (%@)", (uint8_t *)&v24, 0x2Au);

LABEL_24:
    }
  }
  else
  {
    if (v13)
    {
      id v15 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v15 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = [v10 clientUID];
      id v23 = [v10 clientBundleID];
      int v24 = 138413058;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v22;
      __int16 v30 = 2112;
      long long v31 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "sending accessoryEndpointDetached for endpointUUID %@, connectionUUID %@, to client %@ (%@)", (uint8_t *)&v24, 0x2Au);
    }
    id v20 = [v10 clientUID];

    if (v20)
    {
      id v14 = [v10 XPCConnection];
      id v17 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_208];
      [v17 accessoryEndpointDetached:v8 forConnection:v9];
      goto LABEL_24;
    }
    if (gLogObjects && gNumLogObjects >= 9)
    {
      id v14 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v14 = &_os_log_default;
      id v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionAttached:type:info:properties:forClient:]();
    }
  }
}

void __77__ACCConnectionInfoServer_accessoryEndpointDetached_forConnection_forClient___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (BOOL)accessoryConnectionFiltered:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5
    && v6
    && ([v6 filteredAccessories],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 containsObject:v5],
        v8,
        v9))
  {
    if (gLogObjects && gNumLogObjects >= 9)
    {
      id v10 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionFiltered:forClient:]();
    }
    BOOL v13 = 1;
  }
  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 9;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    else
    {
      id v10 = *(id *)(gLogObjects + 64);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCConnectionInfoServer accessoryConnectionFiltered:forClient:]();
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)accessoryEndpointFiltered:(id)a3 forConnection:(id)a4 forClient:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7 && v8 && v9)
  {
    BOOL v11 = [v9 filteredAccessories];
    if ([v11 containsObject:v8])
    {

      goto LABEL_7;
    }
    id v12 = [v10 filteredEndpoints];
    unsigned int v13 = [v12 containsObject:v7];

    if (v13)
    {
LABEL_7:
      if (gLogObjects && gNumLogObjects >= 9)
      {
        id v14 = *(id *)(gLogObjects + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v14 = &_os_log_default;
        id v18 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v10 clientUID];
        id v23 = [v10 clientBundleID];
        int v24 = 138413058;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v22;
        __int16 v30 = 2112;
        long long v31 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "endpoint %@ - %@ filtered for client %@ (%@)", (uint8_t *)&v24, 0x2Au);
      }
      BOOL v17 = 1;
      goto LABEL_27;
    }
  }
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 9;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v14 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  else
  {
    id v14 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [v10 clientUID];
    id v21 = [v10 clientBundleID];
    int v24 = 138413058;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v20;
    __int16 v30 = 2112;
    long long v31 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "endpoint %@ - %@ NOT filtered for client %@ (%@)", (uint8_t *)&v24, 0x2Au);
  }
  BOOL v17 = 0;
LABEL_27:

  return v17;
}

- (void)updateFilteredListForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v5 lock];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_accessories;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        -[ACCConnectionInfoServer _updateFilteredListForClient:forConnection:](self, "_updateFilteredListForClient:forConnection:", v4, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  BOOL v11 = [(ACCConnectionInfoServer *)self connectedAccessoryLock];
  [v11 unlock];

  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v12 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCConnectionInfoServer updateFilteredListForClient:](v4, v12);
  }
}

- (void)_updateFilteredListForClient:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accessoryFilterDictionary];
  uint64_t v9 = [v8 objectForKey:ACCConnectionInfoFilterAllowConnectionType];
  unsigned int v10 = [v9 unsignedIntValue];
  if ([(NSMutableSet *)self->_accessories containsObject:v7])
  {
    char v11 = platform_connectionInfo_accessoryConnectionType(v7);
    if (gLogObjects && gNumLogObjects >= 9)
    {
      id v12 = *(id *)(gLogObjects + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v12 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    int v14 = 1 << v11;
    long long v15 = &unk_100239000;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      long long v37 = [v6 clientUID];
      [v6 clientBundleID];
      *(_DWORD *)buf = 138413570;
      long long v44 = v37;
      v46 = __int16 v45 = 2112;
      long long v34 = (void *)v46;
      __int16 v47 = 2112;
      id v48 = v7;
      __int16 v49 = 1024;
      *(_DWORD *)__int16 v50 = v14;
      *(_WORD *)&v50[4] = 2112;
      *(void *)&v50[6] = v9;
      __int16 v51 = 1024;
      unsigned int v52 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "updateFilteredListForClient:%@, clientInfo.clientBundleID %@, %@ connTypeMask %xh, connTypeFilterValue %@ (%xh)", buf, 0x36u);

      long long v15 = (void *)&unk_100239000;
    }

    long long v16 = [v6 filteredAccessories];
    long long v17 = v16;
    if (!v9 || (v14 & v10) != 0)
    {
      [v16 removeObject:v7];

      uint64_t v20 = v15[49];
      if (v20 && gNumLogObjects >= 9)
      {
        id v19 = *(id *)(v20 + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v19 = &_os_log_default;
        id v22 = &_os_log_default;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ACCConnectionInfoServer _updateFilteredListForClient:forConnection:].cold.6(v6, v7, v19);
      }
    }
    else
    {
      [v16 addObject:v7];

      uint64_t v18 = v15[49];
      if (v18 && gNumLogObjects >= 9)
      {
        id v19 = *(id *)(v18 + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v19 = &_os_log_default;
        id v21 = &_os_log_default;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ACCConnectionInfoServer _updateFilteredListForClient:forConnection:].cold.4(v6, v7, v19);
      }
    }

    id v23 = [(NSMutableDictionary *)self->_endpoints objectForKey:v7];
    uint64_t v24 = v15[49];
    if (v24 && gNumLogObjects >= 9)
    {
      id v25 = *(id *)(v24 + 64);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v25 = &_os_log_default;
      id v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      long long v35 = [v6 clientUID];
      __int16 v36 = [v6 clientBundleID];
      *(_DWORD *)buf = 138413058;
      long long v44 = v35;
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v36;
      __int16 v47 = 2112;
      id v48 = v7;
      __int16 v49 = 2112;
      *(void *)__int16 v50 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "updateFilteredListForClient:%@ (%@), connection %@, process endpointSet %@ ", buf, 0x2Au);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v27 = v23;
    id v28 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v39;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(v27);
          }
          [(ACCConnectionInfoServer *)self _updateFilteredListForClient:v6 forEndpoint:*(void *)(*((void *)&v38 + 1) + 8 * i) connection:v7];
        }
        id v29 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v29);
    }
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    long long v32 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    long long v32 = &_os_log_default;
    id v33 = &_os_log_default;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[ACCConnectionInfoServer _updateFilteredListForClient:forConnection:](v6, v32);
  }
}

- (void)_updateFilteredListForClient:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 accessoryFilterDictionary];
  uint64_t v12 = [v11 objectForKey:ACCConnectionInfoFilterAllowEndpointTransport];
  uint64_t v13 = [v11 objectForKey:ACCConnectionInfoFilterAllowEndpointProtocol];
  if (v12 | v13)
  {
    unsigned int v35 = [(id)v12 unsignedIntValue];
    unsigned int v14 = [(id)v13 unsignedIntValue];
    long long v15 = [(NSMutableDictionary *)self->_endpoints objectForKey:v10];
    if ([v15 containsObject:v9])
    {
      unsigned int v32 = v14;
      char v16 = platform_connectionInfo_endpointTransportType((uint64_t)v10, v9);
      unsigned __int8 v33 = platform_connectionInfo_endpointProtocol((uint64_t)v10, v9);
      if (gLogObjects && gNumLogObjects >= 9)
      {
        long long v17 = *(id *)(gLogObjects + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        long long v17 = &_os_log_default;
        id v18 = &_os_log_default;
      }
      int v19 = 1 << v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        long long v31 = [v8 clientUID];
        [v8 clientBundleID];
        *(_DWORD *)buf = 138413826;
        long long v37 = v31;
        v39 = __int16 v38 = 2112;
        uint64_t v30 = (void *)v39;
        __int16 v40 = 2112;
        id v41 = v10;
        __int16 v42 = 2112;
        id v43 = v9;
        __int16 v44 = 1024;
        int v45 = v19;
        __int16 v46 = 2112;
        uint64_t v47 = v12;
        __int16 v48 = 1024;
        unsigned int v49 = v35;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "updateFilteredListForClient:%@ (%@), %@ - %@ endpTransportMask %xh, endpTransportFilterValue %@ (%xh)", buf, 0x40u);
      }
      if (gLogObjects && gNumLogObjects >= 9)
      {
        uint64_t v20 = *(id *)(gLogObjects + 64);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v20 = &_os_log_default;
        id v21 = &_os_log_default;
      }
      int v22 = 1 << v33;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        long long v34 = [v8 clientUID];
        long long v31 = [v8 clientBundleID];
        *(_DWORD *)buf = 138413826;
        long long v37 = v34;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v31;
        __int16 v40 = 2112;
        id v41 = v10;
        __int16 v42 = 2112;
        id v43 = v9;
        __int16 v44 = 1024;
        int v45 = v22;
        __int16 v46 = 2112;
        uint64_t v47 = v13;
        __int16 v48 = 1024;
        unsigned int v49 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "updateFilteredListForClient:%@ (%@), %@ - %@ endpProtocolMask %xh, endpProtocolFilterValue %@ (%xh)", buf, 0x40u);
      }
      if ((!v12 || (v19 & v35) != 0) && (!v13 || (v22 & v32) != 0))
      {
        id v26 = objc_msgSend(v8, "filteredEndpoints", v31);
        [v26 removeObject:v9];

        if (gLogObjects && gNumLogObjects >= 9)
        {
          uint64_t v24 = *(id *)(gLogObjects + 64);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          uint64_t v24 = &_os_log_default;
          id v27 = &_os_log_default;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[ACCConnectionInfoServer _updateFilteredListForClient:forEndpoint:connection:].cold.5(v8, v9, v24);
        }
      }
      else
      {
        id v23 = objc_msgSend(v8, "filteredEndpoints", v31);
        [v23 addObject:v9];

        if (gLogObjects && gNumLogObjects >= 9)
        {
          uint64_t v24 = *(id *)(gLogObjects + 64);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          uint64_t v24 = &_os_log_default;
          id v25 = &_os_log_default;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[ACCConnectionInfoServer _updateFilteredListForClient:forEndpoint:connection:](v8, v9, v24);
        }
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v28 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v28 = &_os_log_default;
    id v29 = &_os_log_default;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[ACCConnectionInfoServer _updateFilteredListForClient:forEndpoint:connection:](v8, v28);
  }
}

- (void)removeConnection:(id)a3 forClientFilter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 filteredAccessories];
  unsigned int v8 = [v7 containsObject:v5];

  if (v8)
  {
    id v9 = [v6 filteredAccessories];
    [v9 removeObject:v5];
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v10 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = &_os_log_default;
    id v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCConnectionInfoServer removeConnection:forClientFilter:](v6, v5, v10);
  }
}

- (void)removeEndpoint:(id)a3 connection:(id)a4 forClientFilter:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 filteredEndpoints];
  unsigned int v11 = [v10 containsObject:v7];

  if (v11)
  {
    uint64_t v12 = [v9 filteredEndpoints];
    [v12 removeObject:v7];
  }
  if (gLogObjects && gNumLogObjects >= 9)
  {
    uint64_t v13 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    long long v15 = [v9 clientUID];
    char v16 = [v9 clientBundleID];
    long long v17 = [v9 filteredEndpoints];
    int v18 = 138413314;
    int v19 = v15;
    __int16 v20 = 2112;
    id v21 = v16;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "client %@ (%@), connectionUUID %@, endpointUUID %@, remove from filteredEndpoints %@", (uint8_t *)&v18, 0x34u);
  }
}

- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6
{
  id v9 = a3;
  id v37 = a5;
  id v10 = a6;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    uint64_t v13 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)__int16 v44 = a4;
    *(_WORD *)&v44[4] = 2112;
    *(void *)&v44[6] = v9;
    *(_WORD *)&v44[14] = 2112;
    *(void *)&v44[16] = v10;
    *(_WORD *)&v44[24] = 2048;
    *(void *)&v44[26] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "sending accessoryEndpointUpdate:protocol %d for endpointUUID %@, connectionUUID %@, to %lu clients", buf, 0x26u);
  }

  long long v15 = [(ACCConnectionInfoServer *)self clientListLock];
  [v15 lock];

  id v16 = [(NSMutableSet *)self->_clientConnections copy];
  long long v17 = [(ACCConnectionInfoServer *)self clientListLock];
  [v17 unlock];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v16;
  id v18 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v40;
    *(void *)&long long v19 = 134218240;
    long long v35 = v19;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        __int16 v24 = objc_msgSend(v23, "clientUID", v35);

        if (v24)
        {
          [(ACCConnectionInfoServer *)self updateFilteredListForClient:v23];
          if (![(ACCConnectionInfoServer *)self accessoryEndpointFiltered:v9 forConnection:v10 forClient:v23])
          {
            id v27 = [v23 XPCConnection];
            unsigned int v32 = [v27 remoteObjectProxyWithErrorHandler:&__block_literal_global_210];
            [v32 accessoryEndpointUpdate:v9 protocol:a4 properties:v37 forConnection:v10];
LABEL_37:

            goto LABEL_38;
          }
          uint64_t v25 = gLogObjects;
          int v26 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 9)
          {
            id v27 = *(id *)(gLogObjects + 64);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v35;
              *(void *)__int16 v44 = v25;
              *(_WORD *)&v44[8] = 1024;
              *(_DWORD *)&v44[10] = v26;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v33 = &_os_log_default;
            id v27 = &_os_log_default;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            unsigned int v32 = [v23 clientUID];
            long long v34 = [v23 clientBundleID];
            *(_DWORD *)buf = 138413058;
            *(void *)__int16 v44 = v9;
            *(_WORD *)&v44[8] = 2112;
            *(void *)&v44[10] = v10;
            *(_WORD *)&v44[18] = 2112;
            *(void *)&v44[20] = v32;
            *(_WORD *)&v44[28] = 2112;
            *(void *)&v44[30] = v34;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Skip sending filtered accessoryEndpointUpdate for endpointUUID %@, connectionUUID %@, to client %@ (%@)", buf, 0x2Au);

            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v28 = gLogObjects;
          int v29 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v30 = gNumLogObjects < 9;
          }
          else {
            BOOL v30 = 1;
          }
          if (v30)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v35;
              *(void *)__int16 v44 = v28;
              *(_WORD *)&v44[8] = 1024;
              *(_DWORD *)&v44[10] = v29;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v31 = &_os_log_default;
            id v27 = &_os_log_default;
          }
          else
          {
            id v27 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
LABEL_38:
      }
      id v20 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v20);
  }
}

void __85__ACCConnectionInfoServer_accessoryEndpointUpdate_protocol_properties_forConnection___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 9;
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
    id v9 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412546;
    uint64_t v39 = (uint64_t)v6;
    __int16 v40 = 2048;
    id v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "sending accessoryConnectionInfoPropertyChanged for connectionUUID %@, to %lu clients", buf, 0x16u);
  }

  BOOL v11 = [(ACCConnectionInfoServer *)self clientListLock];
  [v11 lock];

  id v12 = [(NSMutableSet *)self->_clientConnections copy];
  uint64_t v13 = [(ACCConnectionInfoServer *)self clientListLock];
  [v13 unlock];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v35;
    *(void *)&long long v16 = 134218240;
    long long v32 = v16;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "clientUID", v32);

        if (v21)
        {
          [(ACCConnectionInfoServer *)self updateFilteredListForClient:v20];
          if (![(ACCConnectionInfoServer *)self accessoryConnectionFiltered:v6 forClient:v20])
          {
            __int16 v24 = [v20 XPCConnection];
            int v29 = [v24 remoteObjectProxyWithErrorHandler:&__block_literal_global_212];
            [v29 accessoryConnectionInfoPropertyChanged:v6 properties:v33];
LABEL_37:

            goto LABEL_38;
          }
          uint64_t v22 = gLogObjects;
          int v23 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 9)
          {
            __int16 v24 = *(id *)(gLogObjects + 64);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              uint64_t v39 = v22;
              __int16 v40 = 1024;
              LODWORD(v41) = v23;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v30 = &_os_log_default;
            __int16 v24 = &_os_log_default;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v29 = [v20 clientUID];
            id v31 = [v20 clientBundleID];
            *(_DWORD *)buf = 138412802;
            uint64_t v39 = (uint64_t)v6;
            __int16 v40 = 2112;
            id v41 = v29;
            __int16 v42 = 2112;
            id v43 = v31;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Skip sending filtered accessoryConnectionInfoPropertyChanged for connectionUUID %@, to client %@ (%@)", buf, 0x20u);

            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v25 = gLogObjects;
          int v26 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v27 = gNumLogObjects < 9;
          }
          else {
            BOOL v27 = 1;
          }
          if (v27)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              uint64_t v39 = v25;
              __int16 v40 = 1024;
              LODWORD(v41) = v26;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v28 = &_os_log_default;
            __int16 v24 = &_os_log_default;
          }
          else
          {
            __int16 v24 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
LABEL_38:
      }
      id v17 = [v14 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v17);
  }
}

void __77__ACCConnectionInfoServer_accessoryConnectionInfoPropertyChanged_properties___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 9;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = &_os_log_default;
    id v11 = &_os_log_default;
  }
  else
  {
    id v12 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412802;
    uint64_t v42 = (uint64_t)v8;
    __int16 v43 = 2112;
    id v44 = v9;
    __int16 v45 = 2048;
    id v46 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "sending accessoryEndpointInfoPropertyChanged for endpointUUID %@, connectionUUID %@, to %lu clients", buf, 0x20u);
  }

  id v14 = [(ACCConnectionInfoServer *)self clientListLock];
  [v14 lock];

  id v15 = [(NSMutableSet *)self->_clientConnections copy];
  long long v16 = [(ACCConnectionInfoServer *)self clientListLock];
  [v16 unlock];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v38;
    *(void *)&long long v18 = 134218240;
    long long v34 = v18;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v23 = objc_msgSend(v22, "clientUID", v34);

        if (v23)
        {
          [(ACCConnectionInfoServer *)self updateFilteredListForClient:v22];
          if (![(ACCConnectionInfoServer *)self accessoryEndpointFiltered:v8 forConnection:v9 forClient:v22])
          {
            int v26 = [v22 XPCConnection];
            id v31 = [v26 remoteObjectProxyWithErrorHandler:&__block_literal_global_214];
            [v31 accessoryEndpointInfoPropertyChanged:v8 properties:v35 forConnection:v9];
LABEL_37:

            goto LABEL_38;
          }
          uint64_t v24 = gLogObjects;
          int v25 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 9)
          {
            int v26 = *(id *)(gLogObjects + 64);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              uint64_t v42 = v24;
              __int16 v43 = 1024;
              LODWORD(v44) = v25;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v32 = &_os_log_default;
            int v26 = &_os_log_default;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            id v31 = [v22 clientUID];
            id v33 = [v22 clientBundleID];
            *(_DWORD *)buf = 138413058;
            uint64_t v42 = (uint64_t)v8;
            __int16 v43 = 2112;
            id v44 = v9;
            __int16 v45 = 2112;
            id v46 = v31;
            __int16 v47 = 2112;
            __int16 v48 = v33;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Skip sending filtered accessoryEndpointInfoPropertyChanged for endpointUUID %@, connectionUUID %@, to client %@ (%@)", buf, 0x2Au);

            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v27 = gLogObjects;
          int v28 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v29 = gNumLogObjects < 9;
          }
          else {
            BOOL v29 = 1;
          }
          if (v29)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              uint64_t v42 = v27;
              __int16 v43 = 1024;
              LODWORD(v44) = v28;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v30 = &_os_log_default;
            int v26 = &_os_log_default;
          }
          else
          {
            int v26 = *(id *)(gLogObjects + 64);
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
          }
        }
LABEL_38:
      }
      id v19 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v19);
  }
}

void __89__ACCConnectionInfoServer_accessoryEndpointInfoPropertyChanged_properties_forConnection___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)configStreamCategoryListReady:(id)a3 connection:(id)a4 client:(id)a5
{
  id v33 = a3;
  id v32 = a4;
  id v8 = a5;
  id v9 = [(ACCConnectionInfoServer *)self clientListLock];
  [v9 lock];

  id v10 = [(NSMutableSet *)self->_clientConnections copy];
  id v11 = [(ACCConnectionInfoServer *)self clientListLock];
  [v11 unlock];

  id v12 = &unk_100239000;
  id v13 = (int *)&unk_100239000;
  if (gLogObjects && gNumLogObjects >= 9)
  {
    id v14 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v14 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v40 = v33;
    __int16 v41 = 2112;
    id v42 = v32;
    __int16 v43 = 2112;
    id v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending configStreamCategoryListReady for endpointUUID %@, connectionUUID %@, clientUUID %@", buf, 0x20u);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    char v19 = 0;
    uint64_t v20 = *(void *)v35;
LABEL_11:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v35 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * v21);
      int v23 = objc_msgSend(v22, "clientUID", v32);
      if (v23)
      {
        uint64_t v24 = v23;
        if (!v8)
        {

LABEL_19:
          uint64_t v27 = [v22 XPCConnection];
          int v28 = [v27 remoteObjectProxyWithErrorHandler:&__block_literal_global_216];
          [v28 configStreamCategoryListReady:v33 connection:v32];

          if (v8)
          {
            BOOL v29 = v16;
            goto LABEL_35;
          }
          char v19 = 1;
          goto LABEL_21;
        }
        int v25 = [v22 clientUID];
        unsigned int v26 = [v25 isEqualToString:v8];

        if (v26) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if (v18 == (id)++v21)
      {
        id v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v18) {
          goto LABEL_11;
        }

        id v12 = (void *)&unk_100239000;
        id v13 = (_DWORD *)&unk_100239000;
        if (v19) {
          goto LABEL_36;
        }
        goto LABEL_27;
      }
    }
  }

LABEL_27:
  uint64_t v30 = v12[49];
  if (v30 && v13[100] >= 9)
  {
    BOOL v29 = *(id *)(v30 + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v29 = &_os_log_default;
    id v31 = &_os_log_default;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v40 = v33;
    __int16 v41 = 2112;
    id v42 = v32;
    __int16 v43 = 2112;
    id v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Could not find client to send configStreamCategoryListReady for endpointUUID %@, connectionUUID %@, clientUUID %@", buf, 0x20u);
  }
LABEL_35:

LABEL_36:
}

void __75__ACCConnectionInfoServer_configStreamCategoryListReady_connection_client___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)configStreamCategoriesResponse:(id)a3 forEndpoint:(id)a4 connection:(id)a5 client:(id)a6 success:(BOOL)a7
{
  BOOL v37 = a7;
  id v36 = a3;
  id v35 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(ACCConnectionInfoServer *)self clientListLock];
  [v13 lock];

  id v14 = [(NSMutableSet *)self->_clientConnections copy];
  id v15 = [(ACCConnectionInfoServer *)self clientListLock];
  [v15 unlock];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v22 = [v21 clientUID];
        if (v22)
        {
          int v23 = (void *)v22;
          uint64_t v24 = [v21 clientUID];
          unsigned int v25 = [v24 isEqualToString:v12];

          if (v25)
          {
            if (gLogObjects && gNumLogObjects >= 9)
            {
              uint64_t v30 = *(id *)(gLogObjects + 64);
              int v28 = v35;
              uint64_t v27 = v36;
            }
            else
            {
              int v28 = v35;
              uint64_t v27 = v36;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
              uint64_t v30 = &_os_log_default;
              id v31 = &_os_log_default;
            }
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413314;
              __int16 v43 = v28;
              __int16 v44 = 2112;
              id v45 = v11;
              __int16 v46 = 2112;
              id v47 = v12;
              __int16 v48 = 1024;
              BOOL v49 = v37;
              __int16 v50 = 2112;
              __int16 v51 = v27;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "sending configStreamCategoriesResponse for endpointUUID %@, connectionUUID %@, clientUUID %@, success %d, categories %@", buf, 0x30u);
            }

            id v32 = [v21 XPCConnection];
            id v33 = [v32 remoteObjectProxyWithErrorHandler:&__block_literal_global_218];
            [v33 configStreamCategoriesResponse:v27 forEndpoint:v28 connection:v11 success:v37];

            unsigned int v26 = v16;
            goto LABEL_27;
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  if (gLogObjects && gNumLogObjects >= 9)
  {
    unsigned int v26 = *(id *)(gLogObjects + 64);
    int v28 = v35;
    uint64_t v27 = v36;
    BOOL v29 = v37;
  }
  else
  {
    BOOL v29 = v37;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v26 = &_os_log_default;
    id v34 = &_os_log_default;
    int v28 = v35;
    uint64_t v27 = v36;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    __int16 v43 = v28;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 1024;
    BOOL v49 = v29;
    __int16 v50 = 2112;
    __int16 v51 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Could not find client to send configStreamCategoriesResponse for endpointUUID %@, connectionUUID %@, clientUUID %@, success %d, categories %@", buf, 0x30u);
  }
LABEL_27:
}

void __96__ACCConnectionInfoServer_configStreamCategoriesResponse_forEndpoint_connection_client_success___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)configStreamPropertyResponse:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 client:(id)a7 value:(id)a8 success:(BOOL)a9
{
  LODWORD(v36) = a3;
  HIDWORD(v36) = a4;
  id v38 = a5;
  id v37 = a6;
  id v13 = a7;
  id v14 = a8;
  id v15 = [(ACCConnectionInfoServer *)self clientListLock];
  [v15 lock];

  id v16 = [(NSMutableSet *)self->_clientConnections copy];
  id v17 = [(ACCConnectionInfoServer *)self clientListLock];
  [v17 unlock];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        int v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend(v23, "clientUID", v36);
        if (v24)
        {
          unsigned int v25 = (void *)v24;
          unsigned int v26 = [v23 clientUID];
          unsigned int v27 = [v26 isEqualToString:v13];

          if (v27)
          {
            if (gLogObjects && gNumLogObjects >= 9)
            {
              BOOL v29 = *(id *)(gLogObjects + 64);
              id v31 = v37;
              uint64_t v30 = v38;
            }
            else
            {
              id v31 = v37;
              uint64_t v30 = v38;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
              BOOL v29 = &_os_log_default;
              id v32 = &_os_log_default;
            }
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413314;
              id v44 = v30;
              __int16 v45 = 2112;
              id v46 = v31;
              __int16 v47 = 2112;
              id v48 = v13;
              __int16 v49 = 1024;
              BOOL v50 = a9;
              __int16 v51 = 2112;
              id v52 = v14;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "sending configStreamPropertyResponse for endpointUUID %@, connectionUUID %@, clientUUID %@, success %d, value %@", buf, 0x30u);
            }

            id v33 = [v23 XPCConnection];
            id v34 = [v33 remoteObjectProxyWithErrorHandler:&__block_literal_global_220];
            [v34 configStreamPropertyResponse:v36 forCategory:HIDWORD(v36) forEndpoint:v30 connection:v31 value:v14 success:a9];

            int v28 = v18;
            goto LABEL_27;
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  if (gLogObjects && gNumLogObjects >= 9)
  {
    int v28 = *(id *)(gLogObjects + 64);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v28 = &_os_log_default;
    id v35 = &_os_log_default;
  }
  id v31 = v37;
  uint64_t v30 = v38;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v44 = v38;
    __int16 v45 = 2112;
    id v46 = v37;
    __int16 v47 = 2112;
    id v48 = v13;
    __int16 v49 = 1024;
    BOOL v50 = a9;
    __int16 v51 = 2112;
    id v52 = v14;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Could not find client to send configStreamPropertyResponse for endpointUUID %@, connectionUUID %@, clientUUID %@, success %d, value %@", buf, 0x30u);
  }
LABEL_27:
}

void __112__ACCConnectionInfoServer_configStreamPropertyResponse_forCategory_forEndpoint_connection_client_value_success___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)handleInterceptData:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  id v36 = a5;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 9;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v11 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  else
  {
    id v11 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [(NSMutableSet *)self->_clientConnections count];
    *(_DWORD *)buf = 138412802;
    uint64_t v43 = (uint64_t)v8;
    __int16 v44 = 2112;
    id v45 = v36;
    __int16 v46 = 2048;
    id v47 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "sending handleInterceptData for endpointUUID %@, connectionUUID %@, to %lu clients", buf, 0x20u);
  }

  id v13 = [(ACCConnectionInfoServer *)self clientListLock];
  [v13 lock];

  id v14 = [(NSMutableSet *)self->_clientConnections copy];
  id v15 = [(ACCConnectionInfoServer *)self clientListLock];
  [v15 unlock];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v38;
    *(void *)&long long v18 = 134218240;
    long long v34 = v18;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v23 = objc_msgSend(v22, "interceptEnabled", v34);
        unsigned __int8 v24 = [v23 containsObject:v8];

        unsigned int v25 = [v22 clientUID];
        unsigned int v26 = v25;
        if (v25 && (v24 & 1) != 0)
        {
          unsigned int v27 = [v22 XPCConnection];
          unsigned int v28 = [v27 hasEntitlement:@"com.apple.accessory.testing"];

          if (v28)
          {
            BOOL v29 = [v22 XPCConnection];
            uint64_t v30 = [v29 remoteObjectProxyWithErrorHandler:&__block_literal_global_225];
            [v30 handleInterceptData:v35 forEndpoint:v8 connection:v36];

            goto LABEL_29;
          }
        }
        else
        {
        }
        uint64_t v31 = gLogObjects;
        int v32 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 9)
        {
          BOOL v29 = *(id *)(gLogObjects + 64);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v34;
            uint64_t v43 = v31;
            __int16 v44 = 1024;
            LODWORD(v45) = v32;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v33 = &_os_log_default;
          BOOL v29 = &_os_log_default;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "skip processing unregistered client", buf, 2u);
        }
LABEL_29:
      }
      id v19 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v19);
  }
}

void __70__ACCConnectionInfoServer_handleInterceptData_forEndpoint_connection___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 9;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 64);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__ACCConnectionInfoServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_0 != -1) {
    dispatch_once(&sharedServer_once_0, block);
  }
  v2 = (void *)sharedServer_sharedInstance_0;

  return v2;
}

uint64_t __39__ACCConnectionInfoServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_0 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.connection-info-server" andFeatureNotification:"com.apple.accessories.connection-info-server.availability-changed"];

  return _objc_release_x1();
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (NSMutableDictionary)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (NSLock)connectedAccessoryLock
{
  return self->_connectedAccessoryLock;
}

- (void)setConnectedAccessoryLock:(id)a3
{
}

- (NSLock)clientListLock
{
  return self->_clientListLock;
}

- (void)setClientListLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientListLock, 0);
  objc_storeStrong((id *)&self->_connectedAccessoryLock, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_accessories, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __62__ACCConnectionInfoServer_listener_shouldAcceptNewConnection___block_invoke_cold_2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found %lu clients in invalidation handler, should be 1", buf, 0xCu);
}

- (void)accessoryConnectionAttached:type:info:properties:forClient:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_13(v1, v2), "clientUID");
  objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(id)OUTLINED_FUNCTION_12() clientBundleID];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_1((void *)&_mh_execute_header, v4, v5, "Skip sending filtered accessoryConnectionAttached for connectionUUID %@, to client %@ (%@)", v6, v7, v8, v9, v10);
}

- (void)accessoryConnectionAttached:type:info:properties:forClient:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "skip processing unregistered client", v2, v3, v4, v5, v6);
}

- (void)accessoryConnectionAttached:type:info:properties:forClient:.cold.5()
{
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_13(v1, v2), "clientUID");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() clientBundleID];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_1((void *)&_mh_execute_header, v4, v5, "sending accessoryConnectionAttached for connectionUUID %@, to client %@ (%@)", v6, v7, v8, v9, v10);
}

void __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "XPC connection error: %@", v2, v3, v4, v5, v6);
}

- (void)accessoryConnectionDetached:forClient:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_13(v1, v2), "clientUID");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() clientBundleID];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_1((void *)&_mh_execute_header, v4, v5, "Skip sending filtered accessoryConnectionDetached for connectionUUID %@, to client %@ (%@)", v6, v7, v8, v9, v10);
}

- (void)accessoryConnectionDetached:forClient:.cold.5()
{
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_13(v1, v2), "clientUID");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() clientBundleID];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_1((void *)&_mh_execute_header, v4, v5, "sending accessoryConnectionDetached for connectionUUID %@, to client %@ (%@)", v6, v7, v8, v9, v10);
}

- (void)accessoryConnectionFiltered:forClient:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_13(v1, v2), "clientUID");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() clientBundleID];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_1((void *)&_mh_execute_header, v4, v5, "connection %@ filtered for client %@ (%@)", v6, v7, v8, v9, v10);
}

- (void)accessoryConnectionFiltered:forClient:.cold.3()
{
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_13(v1, v2), "clientUID");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() clientBundleID];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_1((void *)&_mh_execute_header, v4, v5, "connection %@ NOT filtered for client %@ (%@)", v6, v7, v8, v9, v10);
}

@end