@interface ACCExternalAccessoryServer
+ (id)sharedServer;
- (ACCExternalAccessoryServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)accessoryClosingExternalAccessorySession:(id)a3;
- (BOOL)destinationSharingStatus:(id)a3 success:(BOOL)a4 successfulParams:(id)a5 forAccessoryUUID:(id)a6;
- (BOOL)externalAccessoryArrived:(id)a3;
- (BOOL)externalAccessoryLeft:(id)a3;
- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4;
- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 toExternalAccessoryClient:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)sendNMEASentence:(id)a3 forAccessoryUUID:(id)a4 withTimestamps:(id)a5;
- (BOOL)sendToClientsNotification:(id)a3 withPayload:(id)a4 aboutAccessory:(id)a5;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (BOOL)startDestinationSharing:(id)a3 options:(unint64_t)a4;
- (BOOL)stopDestinationSharing:(id)a3;
- (BOOL)vehicleStatusDidChange:(id)a3 forAccessoryUUID:(id)a4;
- (NSLock)connectedAccessoryLock;
- (NSMutableSet)activeDestinationSharingUUIDs;
- (NSMutableSet)eaAccessoriesMutable;
- (NSMutableSet)eaClientConnectionsMutable;
- (NSSet)eaAccessories;
- (NSSet)eaClientConnections;
- (id)_eaClientsForAccessory:(id)a3;
- (id)_externalAccessoryForUUID:(id)a3;
- (id)externalAccessoryClientConnected:(id)a3;
- (void)_launchUnregisteredClientApps:(id)a3 knownClientApps:(id)a4;
- (void)notifyClientOfConnectedAccessories:(id)a3;
- (void)notifyClientOfConnectedDestinationSharingAccessories:(id)a3;
- (void)notifyClientOfConnectedVehicleStatus:(id)a3;
- (void)setActiveDestinationSharingUUIDs:(id)a3;
- (void)setConnectedAccessoryLock:(id)a3;
- (void)setEaAccessoriesMutable:(id)a3;
- (void)setEaClientConnectionsMutable:(id)a3;
- (void)updateExternalAccessoryInfo:(id)a3;
@end

@implementation ACCExternalAccessoryServer

- (void)notifyClientOfConnectedDestinationSharingAccessories:(id)a3
{
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(ACCExternalAccessoryServer *)self activeDestinationSharingUUIDs];
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v6 = 134218240;
    long long v22 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v11 = -[ACCExternalAccessoryServer _externalAccessoryForUUID:](self, "_externalAccessoryForUUID:", v10, v22);
        if ([v4 canSendConnectionEventForAccessory:v11])
        {
          uint64_t v12 = gLogObjects;
          int v13 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v14 = gNumLogObjects < 10;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v22;
              uint64_t v29 = v12;
              __int16 v30 = 1024;
              LODWORD(v31) = v13;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v15 = &_os_log_default;
            v16 = &_os_log_default;
          }
          else
          {
            v16 = *(id *)(gLogObjects + 72);
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [v4 bundleID];
            v18 = [v11 EAName];
            *(_DWORD *)buf = 138412546;
            uint64_t v29 = (uint64_t)v17;
            __int16 v30 = 2112;
            v31 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notifying Destination Sharing started to client %@ for accessory %@", buf, 0x16u);
          }
          id v19 = [v11 destinationSharingOptions];
          v20 = [v4 XPCConnection];
          v21 = [v20 remoteObjectProxyWithErrorHandler:&__block_literal_global_142];
          [v21 startDestinationSharingForUUID:v10 options:v19];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
}

- (void)notifyClientOfConnectedVehicleStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessoryServer *)self eaAccessories];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __67__ACCExternalAccessoryServer_notifyClientOfConnectedVehicleStatus___block_invoke;
  v36[3] = &unk_100216B08;
  id v6 = v4;
  id v37 = v6;
  id v7 = [v5 objectsPassingTest:v36];

  if ([v7 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v9)
    {
      id v10 = v9;
      __int16 v30 = v7;
      uint64_t v11 = *(void *)v33;
      id obj = v8;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          BOOL v14 = [v13 vehicleStatus];

          uint64_t v15 = gLogObjects;
          int v16 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v17 = gNumLogObjects <= 9;
          }
          else {
            BOOL v17 = 1;
          }
          int v18 = !v17;
          if (v14)
          {
            if (v18)
            {
              id v19 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v40 = v15;
                __int16 v41 = 1024;
                int v42 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v21 = &_os_log_default;
              id v19 = &_os_log_default;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v6 bundleID];
              *(_DWORD *)buf = 138412290;
              uint64_t v40 = (uint64_t)v22;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] eaAccessoryVehicleStatus has valid vehicleStatus, sending to client connected %@", buf, 0xCu);
            }
            v20 = [v6 XPCConnection];
            v23 = [v20 remoteObjectProxyWithErrorHandler:&__block_literal_global_145];
            long long v24 = [v13 vehicleStatus];
            id v25 = [v24 copy];
            long long v26 = [v13 primaryEndpointUUID];
            [v23 vehicleStatusUpdate:v25 forUUID:v26];
          }
          else
          {
            if (v18)
            {
              v20 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v40 = v15;
                __int16 v41 = 1024;
                int v42 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v27 = &_os_log_default;
              v20 = &_os_log_default;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v28 = [v6 bundleID];
              *(_DWORD *)buf = 138412290;
              uint64_t v40 = (uint64_t)v28;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] no vehicleStatus for eaAccessoryVehicleStatus for endpointUUID %@, skip notifying", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = obj;
        id v10 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v10);
      id v7 = v30;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      uint64_t v8 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v8 = &_os_log_default;
      id v29 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] No eaAccessoriesForClient, skip notifying", buf, 2u);
    }
  }
}

- (id)externalAccessoryClientConnected:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
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
    id v7 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 bundleID];
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notified of client %@ connected...", buf, 0xCu);
  }
  id v9 = [(ACCExternalAccessoryServer *)self eaAccessories];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __63__ACCExternalAccessoryServer_externalAccessoryClientConnected___block_invoke;
  v31[3] = &unk_100216B08;
  id v26 = v4;
  id v32 = v26;
  id v10 = [v9 objectsPassingTest:v31];

  uint64_t v11 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = gLogObjects;
        int v19 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v20 = gNumLogObjects < 10;
        }
        else {
          BOOL v20 = 1;
        }
        if (v20)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v34 = v18;
            __int16 v35 = 1024;
            LODWORD(v36) = v19;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v21 = &_os_log_default;
          long long v22 = &_os_log_default;
        }
        else
        {
          long long v22 = *(id *)(gLogObjects + 72);
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [v26 bundleID];
          long long v24 = [v17 EAName];
          *(_DWORD *)buf = 138412546;
          uint64_t v34 = (uint64_t)v23;
          __int16 v35 = 2112;
          v36 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending initial EAAccessoryArrived in array to client %@ for %@", buf, 0x16u);
        }
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v14);
  }

  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (listener_shouldAcceptNewConnection__onceToken != -1) {
    dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global_4);
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 10;
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
    id v10 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = @"com.apple.accessories.externalaccessory-server";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] New XPC connection for: %@", buf, 0xCu);
  }

  [v7 setExportedInterface:listener_shouldAcceptNewConnection__serverInterface];
  uint64_t v11 = [[ACCExternalAccessoryClientInfo alloc] initWithXPCConnection:v7];
  id v12 = [[ACCExternalAccessoryServerRemote alloc] initWithClientInfo:v11];
  [v7 setExportedObject:v12];

  [v7 setRemoteObjectInterface:listener_shouldAcceptNewConnection__clientInterface];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke_110;
  v21[3] = &unk_100215BF8;
  objc_copyWeak(&v22, &from);
  v21[4] = self;
  objc_copyWeak(&v23, &location);
  [v7 setInvalidationHandler:v21];
  id v13 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
  [v13 lock];

  id v14 = [(ACCExternalAccessoryServer *)self eaClientConnectionsMutable];
  [v14 addObject:v11];

  if (gLogObjects && gNumLogObjects >= 10)
  {
    uint64_t v15 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v15 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    CFStringRef v18 = (const __CFString *)[v17 count];
    *(_DWORD *)buf = 134217984;
    CFStringRef v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] There are now %lu client(s).", buf, 0xCu);
  }
  int v19 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
  [v19 unlock];

  [v7 resume];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (NSLock)connectedAccessoryLock
{
  return self->_connectedAccessoryLock;
}

- (NSSet)eaClientConnections
{
  return +[NSSet setWithSet:self->_eaClientConnectionsMutable];
}

- (NSMutableSet)eaClientConnectionsMutable
{
  return self->_eaClientConnectionsMutable;
}

- (NSSet)eaAccessories
{
  return +[NSSet setWithSet:self->_eaAccessoriesMutable];
}

- (NSMutableSet)activeDestinationSharingUUIDs
{
  return self->_activeDestinationSharingUUIDs;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__ACCExternalAccessoryServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_2 != -1) {
    dispatch_once(&sharedServer_once_2, block);
  }
  v2 = (void *)sharedServer_sharedInstance_2;

  return v2;
}

- (ACCExternalAccessoryServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)ACCExternalAccessoryServer;
  id v4 = [(ACCFeatureServer *)&v14 initWithXPCServiceName:a3 andFeatureNotification:a4];
  if (v4)
  {
    BOOL v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    eaClientConnectionsMutable = v4->_eaClientConnectionsMutable;
    v4->_eaClientConnectionsMutable = v5;

    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    eaAccessoriesMutable = v4->_eaAccessoriesMutable;
    v4->_eaAccessoriesMutable = v7;

    id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeDestinationSharingUUIDs = v4->_activeDestinationSharingUUIDs;
    v4->_activeDestinationSharingUUIDs = v9;

    uint64_t v11 = (NSLock *)objc_alloc_init((Class)NSLock);
    connectedAccessoryLock = v4->_connectedAccessoryLock;
    v4->_connectedAccessoryLock = v11;

    if (initWithXPCServiceName_andFeatureNotification__onceToken != -1) {
      dispatch_once(&initWithXPCServiceName_andFeatureNotification__onceToken, &__block_literal_global_10);
    }
  }
  platform_system_createFolder((uint64_t)"/var/mobile/Library/ExternalAccessory", 750);
  return v4;
}

void __76__ACCExternalAccessoryServer_initWithXPCServiceName_andFeatureNotification___block_invoke(id a1)
{
}

void __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCExternalAccessoryXPCServerProtocol];
  v2 = (void *)listener_shouldAcceptNewConnection__serverInterface;
  listener_shouldAcceptNewConnection__serverInterface = v1;

  listener_shouldAcceptNewConnection__clientInterface = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCExternalAccessoryXPCClientProtocol];

  _objc_release_x1();
}

void __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke_110(id *a1)
{
  uint64_t v1 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained setInvalidationHandler:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setExportedObject:0];

  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 10;
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
    id v6 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_loadWeakRetained(v1);
    *(_DWORD *)buf = 138412290;
    uint64_t v105 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] XPC connection invalidated: %@", buf, 0xCu);
  }
  BOOL v8 = [a1[4] connectedAccessoryLock];
  [v8 lock];

  id v9 = [a1[4] eaClientConnectionsMutable];
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke_111;
  v99[3] = &unk_1002164A0;
  objc_copyWeak(&v100, v1);
  id v10 = [v9 objectsPassingTest:v99];

  if (gLogObjects && gNumLogObjects >= 10)
  {
    uint64_t v11 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke_110_cold_2(v110, (uint64_t)[v10 count], v11);
  }

  id v13 = [a1[4] connectedAccessoryLock];
  [v13 unlock];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v10;
  id v74 = [obj countByEnumeratingWithState:&v95 objects:v109 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v96;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        if (*(void *)v96 != v73) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        uint64_t v15 = +[NSMutableArray array];
        v78 = +[NSMutableArray array];
        id v16 = [a1[4] connectedAccessoryLock];
        [v16 lock];

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        BOOL v17 = [v14 eaSessionUUIDs];
        id v18 = [v17 countByEnumeratingWithState:&v91 objects:v108 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v92;
          do
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v92 != v19) {
                objc_enumerationMutation(v17);
              }
              id v21 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
              uint64_t v22 = gLogObjects;
              int v23 = gNumLogObjects;
              if (gLogObjects) {
                BOOL v24 = gNumLogObjects < 10;
              }
              else {
                BOOL v24 = 1;
              }
              if (v24)
              {
                id v26 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  uint64_t v105 = v22;
                  __int16 v106 = 1024;
                  LODWORD(v107) = v23;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v25 = &_os_log_default;
              }
              else
              {
                id v26 = *(id *)(gLogObjects + 72);
              }
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v27 = [v14 bundleID];
                *(_DWORD *)buf = 138412546;
                uint64_t v105 = (uint64_t)v21;
                __int16 v106 = 2112;
                v107 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Close EA session for eaSessionUUID %@, client %@ exited", buf, 0x16u);
              }
              [v15 addObject:v21];
            }
            id v18 = [v17 countByEnumeratingWithState:&v91 objects:v108 count:16];
          }
          while (v18);
        }

        long long v28 = [a1[4] connectedAccessoryLock];
        [v28 unlock];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v77 = v15;
        id v29 = [v77 countByEnumeratingWithState:&v87 objects:v103 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v88;
          do
          {
            for (k = 0; k != v29; k = (char *)k + 1)
            {
              if (*(void *)v88 != v30) {
                objc_enumerationMutation(v77);
              }
              id v32 = *(void **)(*((void *)&v87 + 1) + 8 * (void)k);
              long long v33 = +[ACCExternalAccessorySessionManager sharedManager];
              uint64_t v34 = [v33 closeSessionForEASessionUUID:v32];

              if (v34)
              {
                [v78 addObject:v32];
              }
              else
              {
                uint64_t v35 = gLogObjects;
                int v36 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 10)
                {
                  id v37 = *(id *)(gLogObjects + 72);
                }
                else
                {
                  id v37 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    uint64_t v105 = v35;
                    __int16 v106 = 1024;
                    LODWORD(v107) = v36;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  id v38 = &_os_log_default;
                }
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v105 = (uint64_t)v32;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Session could not be closed for eaSessionUUID %@", buf, 0xCu);
                }
              }
            }
            id v29 = [v77 countByEnumeratingWithState:&v87 objects:v103 count:16];
          }
          while (v29);
        }

        v39 = [a1[4] connectedAccessoryLock];
        [v39 lock];

        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v40 = v78;
        id v41 = [v40 countByEnumeratingWithState:&v83 objects:v102 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v84;
          do
          {
            for (m = 0; m != v41; m = (char *)m + 1)
            {
              if (*(void *)v84 != v42) {
                objc_enumerationMutation(v40);
              }
              uint64_t v44 = *(void *)(*((void *)&v83 + 1) + 8 * (void)m);
              v45 = [v14 eaSessionUUIDs];
              [v45 removeObject:v44];
            }
            id v41 = [v40 countByEnumeratingWithState:&v83 objects:v102 count:16];
          }
          while (v41);
        }

        id v46 = objc_loadWeakRetained(a1 + 6);
        v47 = [v46 eaClientConnectionsMutable];
        [v47 removeObject:v14];

        uint64_t v48 = gLogObjects;
        int v49 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 10)
        {
          v50 = *(id *)(gLogObjects + 72);
        }
        else
        {
          v50 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v105 = v48;
            __int16 v106 = 1024;
            LODWORD(v107) = v49;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v51 = &_os_log_default;
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v52 = [v14 bundleID];
          v53 = [v14 activeLocationAccessoryUUIDs];
          *(_DWORD *)buf = 138412546;
          uint64_t v105 = (uint64_t)v52;
          __int16 v106 = 2112;
          v107 = v53;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[#Location] Client %@ went away, StopLocation for active accessories %@", buf, 0x16u);
        }
        v54 = [v14 activeLocationAccessoryUUIDs];
        id v55 = [v54 copy];

        v56 = [a1[4] connectedAccessoryLock];
        [v56 unlock];

        if (v55)
        {
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v57 = v55;
          id v58 = [v57 countByEnumeratingWithState:&v79 objects:v101 count:16];
          if (v58)
          {
            uint64_t v59 = *(void *)v80;
            do
            {
              for (n = 0; n != v58; n = (char *)n + 1)
              {
                if (*(void *)v80 != v59) {
                  objc_enumerationMutation(v57);
                }
                uint64_t v61 = *(void *)(*((void *)&v79 + 1) + 8 * (void)n);
                uint64_t v62 = gLogObjects;
                int v63 = gNumLogObjects;
                if (gLogObjects) {
                  BOOL v64 = gNumLogObjects < 10;
                }
                else {
                  BOOL v64 = 1;
                }
                if (v64)
                {
                  v66 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    uint64_t v105 = v62;
                    __int16 v106 = 1024;
                    LODWORD(v107) = v63;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  id v65 = &_os_log_default;
                }
                else
                {
                  v66 = *(id *)(gLogObjects + 72);
                }
                if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v105 = v61;
                  _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "[#Location] StopLocation accessory %@", buf, 0xCu);
                }

                platform_location_stop(v61);
              }
              id v58 = [v57 countByEnumeratingWithState:&v79 objects:v101 count:16];
            }
            while (v58);
          }
        }
      }
      id v74 = [obj countByEnumeratingWithState:&v95 objects:v109 count:16];
    }
    while (v74);
  }

  if (gLogObjects && gNumLogObjects >= 10)
  {
    v67 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v67 = &_os_log_default;
    id v68 = &_os_log_default;
  }
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    id v69 = objc_loadWeakRetained(a1 + 6);
    v70 = [v69 eaClientConnectionsMutable];
    id v71 = [v70 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v105 = (uint64_t)v71;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] There are now %lu client(s).", buf, 0xCu);
  }
  objc_destroyWeak(&v100);
}

id __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke_111(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  id v3 = [a2 XPCConnection];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 isEqual:WeakRetained];

  return v5;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (BOOL)externalAccessoryArrived:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v5 lock];

    id v6 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = __55__ACCExternalAccessoryServer_externalAccessoryArrived___block_invoke;
    v50[3] = &unk_100216B08;
    id v7 = v4;
    id v51 = v7;
    BOOL v8 = [v6 objectsPassingTest:v50];

    id v9 = [(ACCExternalAccessoryServer *)self eaAccessoriesMutable];
    [v9 addObject:v7];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v10)
    {
      id v11 = v10;
      id v38 = self;
      id v39 = v4;
      id v12 = 0;
      uint64_t v13 = *(void *)v47;
      uint64_t v40 = kACCExternalAccessoryNameKey;
      objc_super v14 = &unk_100239000;
      uint64_t v15 = &unk_100239000;
      do
      {
        id v16 = 0;
        BOOL v17 = v12;
        do
        {
          if (*(void *)v47 != v13) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v16);
          uint64_t v42 = objc_msgSend(v7, "EAAccessoryDictionary", v38, v39);

          uint64_t v19 = (id *)v14[49];
          int v20 = v15[100];
          if (v19) {
            BOOL v21 = v20 < 10;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v53 = v19;
              __int16 v54 = 1024;
              LODWORD(v55) = v20;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v22 = &_os_log_default;
            int v23 = &_os_log_default;
          }
          else
          {
            int v23 = v19[9];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            [v18 bundleID];
            id v24 = v11;
            uint64_t v25 = v13;
            id v26 = v15;
            id v27 = v7;
            long long v28 = v14;
            id v29 = (id *)objc_claimAutoreleasedReturnValue();
            uint64_t v30 = [v42 objectForKey:v40];
            *(_DWORD *)buf = 138412546;
            v53 = v29;
            __int16 v54 = 2112;
            id v55 = v30;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Notified of externalAccessoryArrived...sending EAAccessoryArrived to client %@ for accessory name %@", buf, 0x16u);

            objc_super v14 = v28;
            id v7 = v27;
            uint64_t v15 = v26;
            uint64_t v13 = v25;
            id v11 = v24;
          }
          v31 = [v18 XPCConnection];
          id v32 = [v31 remoteObjectProxyWithErrorHandler:&__block_literal_global_117];
          [v32 ExternalAccessoryArrived:v42];

          if ([v18 canSendLaunchEvent])
          {
            long long v33 = [v18 bundleID];
            platform_system_launchApplicationToBackground(v33);
          }
          id v16 = (char *)v16 + 1;
          id v12 = v42;
          BOOL v17 = v42;
        }
        while (v11 != v16);
        id v11 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v11);

      self = v38;
      id v4 = v39;
    }

    uint64_t v34 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __55__ACCExternalAccessoryServer_externalAccessoryArrived___block_invoke_118;
    block[3] = &unk_100216B50;
    block[4] = self;
    id v44 = v7;
    id v45 = obj;
    id v35 = obj;
    dispatch_async(v34, block);

    int v36 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v36 unlock];
  }
  return v4 != 0;
}

id __55__ACCExternalAccessoryServer_externalAccessoryArrived___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 canSendConnectionEventForAccessory:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

void __55__ACCExternalAccessoryServer_externalAccessoryArrived___block_invoke_114(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

id __55__ACCExternalAccessoryServer_externalAccessoryArrived___block_invoke_118(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchUnregisteredClientApps:*(void *)(a1 + 40) knownClientApps:*(void *)(a1 + 48)];
}

- (BOOL)externalAccessoryLeft:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v5 lock];

    id v6 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = __52__ACCExternalAccessoryServer_externalAccessoryLeft___block_invoke;
    v57[3] = &unk_100216B08;
    id v49 = v4;
    id v7 = v4;
    id v58 = v7;
    BOOL v8 = [v6 objectsPassingTest:v57];

    id v9 = [v7 EAAccessoryDictionary];
    id v10 = [v9 copy];

    id v11 = [(ACCExternalAccessoryServer *)self eaAccessoriesMutable];
    [v11 removeObject:v7];

    id v12 = [(ACCExternalAccessoryServer *)self activeDestinationSharingUUIDs];
    id v50 = v7;
    uint64_t v13 = [v7 primaryEndpointUUID];
    unsigned int v14 = [v12 containsObject:v13];

    if (v14)
    {
      uint64_t v15 = [(ACCExternalAccessoryServer *)self activeDestinationSharingUUIDs];
      id v16 = [v7 primaryEndpointUUID];
      [v15 removeObject:v16];
    }
    long long v48 = self;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v8;
    BOOL v17 = v7;
    id v52 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v52)
    {
      uint64_t v18 = *(void *)v54;
      uint64_t v19 = &unk_100239000;
      int v20 = &_os_log_default;
      do
      {
        BOOL v21 = 0;
        do
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v21);
          int v23 = (id *)v19[49];
          int v24 = gNumLogObjects;
          if (v23) {
            BOOL v25 = gNumLogObjects < 10;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v60 = v23;
              __int16 v61 = 1024;
              LODWORD(v62) = v24;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v26 = &_os_log_default;
          }
          else
          {
            int v20 = v23[9];
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v22 bundleID];
            [v22 activeLocationAccessoryUUIDs];
            long long v28 = v19;
            v30 = uint64_t v29 = v18;
            id v31 = [v30 count];
            [v17 primaryEndpointUUID];
            v33 = id v32 = v10;
            *(_DWORD *)buf = 138412802;
            v60 = v27;
            __int16 v61 = 2048;
            id v62 = v31;
            __int16 v63 = 2112;
            BOOL v64 = v33;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[#Location] Remove from client(%@) activeLocationAccessoryUUIDs(%lu): %@", buf, 0x20u);

            id v10 = v32;
            BOOL v17 = v50;

            uint64_t v18 = v29;
            uint64_t v19 = v28;
          }
          uint64_t v34 = [v17 primaryEndpointUUID];
          [v22 removeLocationAccessoryUUID:v34];

          id v35 = (id *)v19[49];
          int v36 = gNumLogObjects;
          if (v35 && gNumLogObjects >= 10)
          {
            id v37 = v35[9];
          }
          else
          {
            id v37 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v60 = v35;
              __int16 v61 = 1024;
              LODWORD(v62) = v36;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v38 = &_os_log_default;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            id v39 = [v22 bundleID];
            uint64_t v40 = +[ACCExternalAccessory accessoryDictionaryForLogging:v10];
            *(_DWORD *)buf = 138412546;
            v60 = v39;
            __int16 v61 = 2112;
            id v62 = v40;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Sending EAAccessoryLeft to client %@ for %@", buf, 0x16u);
          }
          id v41 = [v22 XPCConnection];
          uint64_t v42 = [v41 remoteObjectProxyWithErrorHandler:&__block_literal_global_122];
          [v42 ExternalAccessoryLeft:v10];

          if ([v22 canSendLaunchEvent])
          {
            v43 = [v22 bundleID];
            platform_system_launchApplicationToBackground(v43);
          }
          BOOL v21 = (char *)v21 + 1;
          int v20 = &_os_log_default;
        }
        while (v52 != v21);
        id v52 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v52);
    }

    id v44 = [(ACCExternalAccessoryServer *)v48 connectedAccessoryLock];
    [v44 unlock];

    id v45 = +[ACCExternalAccessorySessionManager sharedManager];
    long long v46 = [v10 objectForKey:kACCExternalAccessoryPrimaryUUID];
    [v45 closeSessionsForPrimaryAccessoryUUID:v46];

    id v4 = v49;
  }

  return v4 != 0;
}

id __52__ACCExternalAccessoryServer_externalAccessoryLeft___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 canSendConnectionEventForAccessory:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

void __52__ACCExternalAccessoryServer_externalAccessoryLeft___block_invoke_120(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (BOOL)sendToClientsNotification:(id)a3 withPayload:(id)a4 aboutAccessory:(id)a5
{
  id v8 = a3;
  id v40 = a4;
  id v9 = a5;
  id v10 = v9;
  id v41 = v8;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  if (v11)
  {
    if (gLogObjects) {
      BOOL v34 = gNumLogObjects < 10;
    }
    else {
      BOOL v34 = 1;
    }
    if (v34)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      long long v33 = &_os_log_default;
      id v35 = &_os_log_default;
    }
    else
    {
      long long v33 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[ACCExternalAccessoryServer sendToClientsNotification:withPayload:aboutAccessory:]((uint64_t)v10, (uint64_t)v41, v33);
    }
  }
  else
  {
    uint64_t v13 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v13 lock];

    id v37 = self;
    unsigned int v14 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = __83__ACCExternalAccessoryServer_sendToClientsNotification_withPayload_aboutAccessory___block_invoke;
    v46[3] = &unk_100216B08;
    id v38 = v10;
    uint64_t v15 = v10;
    long long v47 = v15;
    id v16 = [v14 objectsPassingTest:v46];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v16;
    id v17 = [obj countByEnumeratingWithState:&v42 objects:v60 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v43;
      int v20 = &_os_log_default;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          int v23 = [v15 EAAccessoryDictionary];
          uint64_t v24 = gLogObjects;
          int v25 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v26 = gNumLogObjects < 10;
          }
          else {
            BOOL v26 = 1;
          }
          if (v26)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              id v49 = (const char *)v24;
              __int16 v50 = 1024;
              LODWORD(v51) = v25;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v27 = &_os_log_default;
          }
          else
          {
            int v20 = *(id *)(gLogObjects + 72);
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            long long v28 = [v22 bundleID];
            uint64_t v29 = +[ACCExternalAccessory accessoryDictionaryForLogging:v23];
            *(_DWORD *)buf = 136316418;
            id v49 = "-[ACCExternalAccessoryServer sendToClientsNotification:withPayload:aboutAccessory:]";
            __int16 v50 = 2112;
            id v51 = v15;
            __int16 v52 = 2112;
            long long v53 = v41;
            __int16 v54 = 2112;
            id v55 = v40;
            __int16 v56 = 2112;
            id v57 = v28;
            __int16 v58 = 2112;
            uint64_t v59 = v29;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s %@ sending notification %@ with payload %@ to client %@ for %@", buf, 0x3Eu);
          }
          uint64_t v30 = [v22 XPCConnection];
          id v31 = [v30 remoteObjectProxyWithErrorHandler:&__block_literal_global_125];
          [v31 handleIncomingNotification:v41 withPayload:v40 aboutAccessory:v23];

          int v20 = &_os_log_default;
        }
        id v18 = [obj countByEnumeratingWithState:&v42 objects:v60 count:16];
      }
      while (v18);
    }

    id v32 = [(ACCExternalAccessoryServer *)v37 connectedAccessoryLock];
    [v32 unlock];

    long long v33 = v47;
    id v10 = v38;
  }

  return v12;
}

id __83__ACCExternalAccessoryServer_sendToClientsNotification_withPayload_aboutAccessory___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 canSendConnectionEventForAccessory:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

void __83__ACCExternalAccessoryServer_sendToClientsNotification_withPayload_aboutAccessory___block_invoke_123(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)updateExternalAccessoryInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v5 lock];

    long long v28 = self;
    id v6 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __58__ACCExternalAccessoryServer_updateExternalAccessoryInfo___block_invoke;
    v38[3] = &unk_100216B08;
    id v29 = v4;
    id v7 = v4;
    id v39 = v7;
    id v8 = [v6 objectsPassingTest:v38];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v32 = *(void *)v35;
      BOOL v11 = &unk_100239000;
      BOOL v12 = &unk_100239000;
      do
      {
        uint64_t v13 = 0;
        id v30 = v10;
        do
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          unsigned int v14 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v13);
          long long v33 = [v7 EAAccessoryDictionary];
          uint64_t v15 = (id *)v11[49];
          int v16 = v12[100];
          if (v15) {
            BOOL v17 = v16 < 10;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              id v41 = v15;
              __int16 v42 = 1024;
              LODWORD(v43) = v16;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v18 = &_os_log_default;
            uint64_t v19 = &_os_log_default;
          }
          else
          {
            uint64_t v19 = v15[9];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            [v14 bundleID];
            int v20 = v12;
            BOOL v21 = v11;
            id v22 = (id *)objc_claimAutoreleasedReturnValue();
            int v23 = [v7 EAName];
            *(_DWORD *)buf = 138412546;
            id v41 = v22;
            __int16 v42 = 2112;
            long long v43 = v23;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending updateExternalAccessoryInfo to client %@ for %@", buf, 0x16u);

            BOOL v11 = v21;
            BOOL v12 = v20;
            id v10 = v30;
          }

          uint64_t v24 = [v14 XPCConnection];
          int v25 = [v24 remoteObjectProxyWithErrorHandler:&__block_literal_global_128];
          BOOL v26 = [v7 primaryEndpointUUID];
          [v25 updateAccessoryInfo:v33 forUUID:v26];

          uint64_t v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        id v10 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v10);
    }

    id v27 = [(ACCExternalAccessoryServer *)v28 connectedAccessoryLock];
    [v27 unlock];

    id v4 = v29;
  }
}

id __58__ACCExternalAccessoryServer_updateExternalAccessoryInfo___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 canSendConnectionEventForAccessory:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

void __58__ACCExternalAccessoryServer_updateExternalAccessoryInfo___block_invoke_126(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

id __63__ACCExternalAccessoryServer_externalAccessoryClientConnected___block_invoke(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a1 + 32);
  if (result) {
    return [result canSendConnectionEventForAccessory:a2];
  }
  return result;
}

- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __89__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier___block_invoke;
    v14[3] = &unk_100216B08;
    id v9 = v6;
    id v15 = v9;
    id v10 = [v8 objectsPassingTest:v14];

    BOOL v11 = [v10 anyObject];
    BOOL v12 = [(ACCExternalAccessoryServer *)self handleIncomingExternalAccessoryData:v7 forEASessionIdentifier:v9 toExternalAccessoryClient:v11];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __89__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 eaSessionUUIDs];
    uint64_t v8 = (uint64_t)[v7 containsObject:*(void *)(a1 + 32)];

    if (v8)
    {
      uint64_t v8 = 1;
      *a3 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)accessoryClosingExternalAccessorySession:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __71__ACCExternalAccessoryServer_accessoryClosingExternalAccessorySession___block_invoke;
    v19[3] = &unk_100216B08;
    id v6 = v4;
    id v20 = v6;
    id v7 = [v5 objectsPassingTest:v19];

    uint64_t v8 = [v7 anyObject];
    id v9 = v8;
    BOOL v10 = v8 != 0;
    if (v8)
    {
      BOOL v11 = [v8 XPCConnection];
      BOOL v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_130];
      [v12 accessoryCloseExternalAccessorySession:v6];

      uint64_t v13 = [v9 eaSessionUUIDs];
      [v13 removeObject:v6];

      if (gLogObjects && gNumLogObjects >= 10)
      {
        unsigned int v14 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned int v14 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v9 bundleID];
        *(_DWORD *)buf = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accessory closing eaSessionUUID %@ for client %@", buf, 0x16u);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        unsigned int v14 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned int v14 = &_os_log_default;
        id v17 = &_os_log_default;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ACCExternalAccessoryServer accessoryClosingExternalAccessorySession:]();
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __71__ACCExternalAccessoryServer_accessoryClosingExternalAccessorySession___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 eaSessionUUIDs];
    uint64_t v8 = (uint64_t)[v7 containsObject:*(void *)(a1 + 32)];

    if (v8)
    {
      uint64_t v8 = 1;
      *a3 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __71__ACCExternalAccessoryServer_accessoryClosingExternalAccessorySession___block_invoke_2(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 toExternalAccessoryClient:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (a3) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || v8 == 0;
  BOOL v12 = !v11;
  if (!v11)
  {
    id v13 = a3;
    unsigned int v14 = [v9 XPCConnection];
    id v15 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_132];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __115__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier_toExternalAccessoryClient___block_invoke_133;
    v17[3] = &unk_100216C18;
    id v18 = v7;
    id v19 = v9;
    char v20 = 0;
    [v15 handleIncomingExternalAccessoryData:v13 forEASessionIdentifier:v18 withReply:v17];
  }
  return v12;
}

void __115__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier_toExternalAccessoryClient___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

void __115__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier_toExternalAccessoryClient___block_invoke_133(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 10;
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
    id v4 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __115__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier_toExternalAccessoryClient___block_invoke_133_cold_1(a1, v4);
  }
}

- (BOOL)sendNMEASentence:(id)a3 forAccessoryUUID:(id)a4 withTimestamps:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v37 = a5;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 10;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v11 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  else
  {
    BOOL v11 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v47 = (uint64_t)v38;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[#Location] nmeaSentence: %@ from %@", buf, 0x16u);
  }

  BOOL v12 = 0;
  if (v38 && v8)
  {
    id v13 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v13 lock];

    unsigned int v14 = [(ACCExternalAccessoryServer *)self eaClientConnections];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __79__ACCExternalAccessoryServer_sendNMEASentence_forAccessoryUUID_withTimestamps___block_invoke;
    v43[3] = &unk_100216B08;
    id v35 = v8;
    id v15 = v8;
    id v44 = v15;
    int v16 = [v14 objectsPassingTest:v43];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v16;
    id v17 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    BOOL v34 = v17 != 0;
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(obj);
          }
          BOOL v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v22 = gLogObjects;
          int v23 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v24 = gNumLogObjects < 10;
          }
          else {
            BOOL v24 = 1;
          }
          if (v24)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v47 = v22;
              __int16 v48 = 1024;
              LODWORD(v49) = v23;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v25 = &_os_log_default;
            BOOL v26 = &_os_log_default;
          }
          else
          {
            BOOL v26 = *(id *)(gLogObjects + 72);
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            id v31 = [v21 bundleID];
            *(_DWORD *)buf = 138412546;
            uint64_t v47 = (uint64_t)v31;
            __int16 v48 = 2112;
            id v49 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[#Location] sending nmea sentence to location client %@ for endpoint UUID %@", buf, 0x16u);
          }
          id v27 = [v38 copy];
          id v28 = [v37 copy];
          id v29 = [v21 XPCConnection];
          id v30 = [v29 remoteObjectProxyWithErrorHandler:&__block_literal_global_137];
          [v30 enqueueLocationNMEASentence:v27 forUUID:v15 withTimestamps:v28];
        }
        id v18 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v18);
    }

    uint64_t v32 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
    [v32 unlock];

    id v8 = v35;
    BOOL v12 = v34;
  }

  return v12;
}

id __79__ACCExternalAccessoryServer_sendNMEASentence_forAccessoryUUID_withTimestamps___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 containsLocationAccessoryUUID:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

void __79__ACCExternalAccessoryServer_sendNMEASentence_forAccessoryUUID_withTimestamps___block_invoke_135(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __79__ACCExternalAccessoryServer_sendNMEASentence_forAccessoryUUID_withTimestamps___block_invoke_135_cold_1();
  }
}

- (void)notifyClientOfConnectedAccessories:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessoryServer *)self eaAccessories];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __65__ACCExternalAccessoryServer_notifyClientOfConnectedAccessories___block_invoke;
  v35[3] = &unk_100216B08;
  id v6 = v4;
  id v36 = v6;
  id v7 = [v5 objectsPassingTest:v35];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v32;
    BOOL v12 = &unk_100239000;
    id v13 = &_os_log_default;
    id v29 = v6;
    do
    {
      unsigned int v14 = 0;
      id v15 = v10;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v14);
        id v17 = (id *)v12[49];
        int v18 = gNumLogObjects;
        if (v17) {
          BOOL v19 = gNumLogObjects < 10;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            id v38 = v17;
            __int16 v39 = 1024;
            LODWORD(v40) = v18;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v20 = &_os_log_default;
        }
        else
        {
          id v13 = v17[9];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v21 = [v6 bundleID];
          id v22 = v9;
          uint64_t v23 = v11;
          BOOL v24 = v12;
          id v25 = [v16 EAAccessoryDictionary];
          BOOL v26 = +[ACCExternalAccessory accessoryDictionaryForLogging:v25];
          *(_DWORD *)buf = 138412546;
          id v38 = v21;
          __int16 v39 = 2112;
          long long v40 = v26;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Sending EAAccessoryArrived to client connected %@ for %@", buf, 0x16u);

          BOOL v12 = v24;
          uint64_t v11 = v23;
          id v9 = v22;
          id v6 = v29;
        }

        id v10 = [v16 EAAccessoryDictionary];

        id v27 = [v6 XPCConnection];
        id v28 = [v27 remoteObjectProxyWithErrorHandler:&__block_literal_global_140];
        [v28 ExternalAccessoryArrived:v10];

        unsigned int v14 = (char *)v14 + 1;
        id v15 = v10;
        id v13 = &_os_log_default;
      }
      while (v9 != v14);
      id v9 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v9);
  }
}

id __65__ACCExternalAccessoryServer_notifyClientOfConnectedAccessories___block_invoke(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a1 + 32);
  if (result) {
    return [result canSendConnectionEventForAccessory:a2];
  }
  return result;
}

void __65__ACCExternalAccessoryServer_notifyClientOfConnectedAccessories___block_invoke_138(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __65__ACCExternalAccessoryServer_notifyClientOfConnectedAccessories___block_invoke_138_cold_1();
  }
}

void __83__ACCExternalAccessoryServer_notifyClientOfConnectedDestinationSharingAccessories___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

id __67__ACCExternalAccessoryServer_notifyClientOfConnectedVehicleStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a1 + 32);
  if (result) {
    return [result canSendConnectionEventForAccessory:a2];
  }
  return result;
}

void __67__ACCExternalAccessoryServer_notifyClientOfConnectedVehicleStatus___block_invoke_143(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __67__ACCExternalAccessoryServer_notifyClientOfConnectedVehicleStatus___block_invoke_143_cold_1();
  }
}

- (BOOL)startDestinationSharing:(id)a3 options:(unint64_t)a4
{
  id v30 = a3;
  id v6 = -[ACCExternalAccessoryServer _externalAccessoryForUUID:](self, "_externalAccessoryForUUID:");
  if (v6)
  {
    id v7 = [(ACCExternalAccessoryServer *)self activeDestinationSharingUUIDs];
    [v7 addObject:v30];

    [v6 setDestinationSharingOptions:a4];
    id v27 = v6;
    [(ACCExternalAccessoryServer *)self _eaClientsForAccessory:v6];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    BOOL v26 = v8 != 0;
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v11 = &unk_100239000;
      do
      {
        BOOL v12 = 0;
        id v28 = v9;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v12);
          unsigned int v14 = (id *)v11[49];
          int v15 = gNumLogObjects;
          if (v14) {
            BOOL v16 = gNumLogObjects < 10;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              id v36 = v14;
              __int16 v37 = 1024;
              LODWORD(v38) = v15;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v17 = &_os_log_default;
            int v18 = &_os_log_default;
          }
          else
          {
            int v18 = v14[9];
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            [v13 bundleID];
            BOOL v19 = v11;
            id v20 = (id *)objc_claimAutoreleasedReturnValue();
            BOOL v21 = [v27 EAName];
            *(_DWORD *)buf = 138412802;
            id v36 = v20;
            __int16 v37 = 2112;
            id v38 = v21;
            __int16 v39 = 2048;
            unint64_t v40 = a4;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending Start Destination Sharing to client %@ for accessory %@, options %llxh", buf, 0x20u);

            uint64_t v11 = v19;
            id v9 = v28;
          }

          id v22 = [v13 XPCConnection];
          uint64_t v23 = [v22 remoteObjectProxyWithErrorHandler:&__block_literal_global_147];
          [v23 startDestinationSharingForUUID:v30 options:a4];

          BOOL v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v9);
    }

    id v6 = v27;
    BOOL v24 = v26;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

void __62__ACCExternalAccessoryServer_startDestinationSharing_options___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (BOOL)stopDestinationSharing:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessoryServer *)self _externalAccessoryForUUID:v4];
  if (v5)
  {
    id v6 = [(ACCExternalAccessoryServer *)self activeDestinationSharingUUIDs];
    [v6 removeObject:v4];

    long long v32 = v5;
    [(ACCExternalAccessoryServer *)self _eaClientsForAccessory:v5];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    BOOL v31 = v7 != 0;
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      uint64_t v10 = &unk_100239000;
      uint64_t v11 = &unk_100239000;
      BOOL v12 = &_os_log_default;
      do
      {
        id v13 = 0;
        id v33 = v8;
        do
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(obj);
          }
          unsigned int v14 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v13);
          int v15 = (id *)v10[49];
          int v16 = v11[100];
          if (v15) {
            BOOL v17 = v16 < 10;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              unint64_t v40 = v15;
              __int16 v41 = 1024;
              LODWORD(v42) = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            int v18 = v12;
            BOOL v19 = v12;
          }
          else
          {
            BOOL v19 = v15[9];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            [v14 bundleID];
            uint64_t v20 = v9;
            BOOL v21 = v12;
            id v22 = v4;
            uint64_t v23 = v11;
            BOOL v24 = v10;
            id v25 = (id *)objc_claimAutoreleasedReturnValue();
            BOOL v26 = [v32 EAName];
            *(_DWORD *)buf = 138412546;
            unint64_t v40 = v25;
            __int16 v41 = 2112;
            long long v42 = v26;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending Stop Destination Sharing to client %@ for accessory %@", buf, 0x16u);

            uint64_t v10 = v24;
            uint64_t v11 = v23;
            id v4 = v22;
            BOOL v12 = v21;
            uint64_t v9 = v20;
            id v8 = v33;
          }

          id v27 = [v14 XPCConnection];
          id v28 = [v27 remoteObjectProxyWithErrorHandler:&__block_literal_global_149];
          [v28 stopDestinationSharingForUUID:v4];

          id v13 = (char *)v13 + 1;
        }
        while (v8 != v13);
        id v8 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v8);
    }

    id v5 = v32;
    BOOL v29 = v31;
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

void __53__ACCExternalAccessoryServer_stopDestinationSharing___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (BOOL)destinationSharingStatus:(id)a3 success:(BOOL)a4 successfulParams:(id)a5 forAccessoryUUID:(id)a6
{
  BOOL v8 = a4;
  id v33 = a3;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = [(ACCExternalAccessoryServer *)self _externalAccessoryForUUID:v11];
  if (v12)
  {
    id v30 = v12;
    [(ACCExternalAccessoryServer *)self _eaClientsForAccessory:v12];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
    BOOL v29 = v13 != 0;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v35;
      CFStringRef v16 = @"no";
      if (v8) {
        CFStringRef v16 = @"yes";
      }
      CFStringRef v31 = v16;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(obj);
          }
          int v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v19 = gLogObjects;
          int v20 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v21 = gNumLogObjects < 10;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v39 = v19;
              __int16 v40 = 1024;
              LODWORD(v41) = v20;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v22 = &_os_log_default;
            uint64_t v23 = &_os_log_default;
          }
          else
          {
            uint64_t v23 = *(id *)(gLogObjects + 72);
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            BOOL v26 = [v18 bundleID];
            *(_DWORD *)buf = 138413314;
            uint64_t v39 = (uint64_t)v31;
            __int16 v40 = 2112;
            id v41 = v10;
            __int16 v42 = 2112;
            id v43 = v33;
            __int16 v44 = 2112;
            id v45 = v11;
            __int16 v46 = 2112;
            uint64_t v47 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "sending destination status success %@, successful params %@, destination sharing UUID %@, for endpoint UUID %@ to client %@", buf, 0x34u);
          }
          BOOL v24 = [v18 XPCConnection];
          id v25 = [v24 remoteObjectProxyWithErrorHandler:&__block_literal_global_157];
          [v25 destinationSharingStatus:v8 forDestinationUUID:v33 supportedParams:v10 forUUID:v11];
        }
        id v14 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v14);
    }

    BOOL v12 = v30;
    BOOL v27 = v29;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

void __97__ACCExternalAccessoryServer_destinationSharingStatus_success_successfulParams_forAccessoryUUID___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (BOOL)vehicleStatusDidChange:(id)a3 forAccessoryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ACCExternalAccessoryServer *)self _externalAccessoryForUUID:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setVehicleStatus:v6];
    id v10 = [(ACCExternalAccessoryServer *)self _eaClientsForAccessory:v9];
    if ([v10 count])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
      BOOL v13 = v12 != 0;
      if (v12)
      {
        id v14 = v12;
        id obj = v11;
        CFStringRef v31 = v10;
        long long v32 = v9;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(obj);
            }
            BOOL v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v18 = gLogObjects;
            int v19 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v20 = gNumLogObjects < 10;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v39 = v18;
                __int16 v40 = 1024;
                LODWORD(v41) = v19;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v21 = &_os_log_default;
              id v22 = &_os_log_default;
            }
            else
            {
              id v22 = *(id *)(gLogObjects + 72);
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = [v17 bundleID];
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = (uint64_t)v7;
              __int16 v40 = 2112;
              id v41 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[#VehicleInfoStatus] sending vehicle status for endpoint UUID %@ to client %@", buf, 0x16u);
            }
            BOOL v24 = [v17 XPCConnection];
            id v25 = [v24 remoteObjectProxyWithErrorHandler:&__block_literal_global_159];
            id v26 = [v6 copy];
            [v25 vehicleStatusUpdate:v26 forUUID:v7];
          }
          id v14 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v14);
        BOOL v13 = 1;
        id v10 = v31;
        uint64_t v9 = v32;
        id v11 = obj;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v11 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v11 = &_os_log_default;
        id v29 = &_os_log_default;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] No eaClientsForAccessory, skip notifying", buf, 2u);
      }
      BOOL v13 = 0;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v27 = gNumLogObjects < 10;
    }
    else {
      BOOL v27 = 1;
    }
    if (v27)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v28 = &_os_log_default;
    }
    else
    {
      id v10 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] no vehicleStatusAccessory found for endpoint UUID %@", buf, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

void __70__ACCExternalAccessoryServer_vehicleStatusDidChange_forAccessoryUUID___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __67__ACCExternalAccessoryServer_notifyClientOfConnectedVehicleStatus___block_invoke_143_cold_1();
  }
}

- (id)_externalAccessoryForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessoryServer *)self eaAccessories];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __56__ACCExternalAccessoryServer__externalAccessoryForUUID___block_invoke;
  v10[3] = &unk_100216B08;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 objectsPassingTest:v10];

  if ([v7 count])
  {
    BOOL v8 = [v7 anyObject];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __56__ACCExternalAccessoryServer__externalAccessoryForUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 primaryEndpointUUID];
  id v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    *a3 = 1;
  }
  return v6;
}

- (void)_launchUnregisteredClientApps:(id)a3 knownClientApps:(id)a4
{
  id v5 = a3;
  id v56 = a4;
  if (platform_system_unlockedSinceBoot())
  {
    id v49 = v5;
    id v6 = [v5 copyExternalAccessoryProtocols];
    __int16 v54 = +[NSMutableSet set];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v6;
    id v52 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v52)
    {
      uint64_t v51 = *(void *)v73;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v73 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v72 + 1) + 8 * v7);
          uint64_t v9 = gLogObjects;
          int v10 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v11 = gNumLogObjects < 10;
          }
          else {
            BOOL v11 = 1;
          }
          if (v11)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v81 = v9;
              __int16 v82 = 1024;
              int v83 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v12 = &_os_log_default;
            BOOL v13 = &_os_log_default;
          }
          else
          {
            BOOL v13 = *(id *)(gLogObjects + 72);
          }
          uint64_t v53 = v7;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v81 = v8;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking for unregistered EA clients for protocol %@", buf, 0xCu);
          }

          id v14 = (void *)platform_system_copyInstalledApplicationsForExternalAccessoryProtocol(v8);
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v55 = v14;
          id v58 = [v55 countByEnumeratingWithState:&v68 objects:v78 count:16];
          if (v58)
          {
            uint64_t v57 = *(void *)v69;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v69 != v57) {
                  objc_enumerationMutation(v55);
                }
                CFStringRef v16 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v15);
                long long v64 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v67 = 0u;
                id v17 = v56;
                id v18 = [v17 countByEnumeratingWithState:&v64 objects:v77 count:16];
                if (!v18)
                {

LABEL_42:
                  if (platform_system_applicationSupportsExternalAccessoryBackgroundMode((uint64_t)v16))
                  {
                    [v54 addObject:v16];
                    uint64_t v29 = gLogObjects;
                    int v30 = gNumLogObjects;
                    if (gLogObjects && gNumLogObjects >= 10)
                    {
                      CFStringRef v31 = *(id *)(gLogObjects + 72);
                    }
                    else
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 134218240;
                        uint64_t v81 = v29;
                        __int16 v82 = 1024;
                        int v83 = v30;
                        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                      }
                      id v34 = &_os_log_default;
                      CFStringRef v31 = &_os_log_default;
                    }
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v81 = (uint64_t)v16;
                      long long v35 = v31;
                      long long v36 = "unregistered app %@ supports EA in the background";
                      goto LABEL_62;
                    }
                  }
                  else
                  {
                    uint64_t v32 = gLogObjects;
                    int v33 = gNumLogObjects;
                    if (gLogObjects && gNumLogObjects >= 10)
                    {
                      CFStringRef v31 = *(id *)(gLogObjects + 72);
                    }
                    else
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 134218240;
                        uint64_t v81 = v32;
                        __int16 v82 = 1024;
                        int v83 = v33;
                        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                      }
                      id v37 = &_os_log_default;
                      CFStringRef v31 = &_os_log_default;
                    }
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v81 = (uint64_t)v16;
                      long long v35 = v31;
                      long long v36 = "unregistered app %@ Does Not support EA in the background, don't count as an unregistered app";
LABEL_62:
                      _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);
                    }
                  }

                  goto LABEL_59;
                }
                id v19 = v18;
                uint64_t v59 = v15;
                char v20 = 0;
                uint64_t v21 = *(void *)v65;
                do
                {
                  for (i = 0; i != v19; i = (char *)i + 1)
                  {
                    if (*(void *)v65 != v21) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v23 = [*(id *)(*((void *)&v64 + 1) + 8 * i) bundleID];
                    id v24 = [v16 caseInsensitiveCompare:v23];

                    if (!v24)
                    {
                      uint64_t v25 = gLogObjects;
                      int v26 = gNumLogObjects;
                      if (gLogObjects && gNumLogObjects >= 10)
                      {
                        BOOL v27 = *(id *)(gLogObjects + 72);
                      }
                      else
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 134218240;
                          uint64_t v81 = v25;
                          __int16 v82 = 1024;
                          int v83 = v26;
                          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                        }
                        id v28 = &_os_log_default;
                        BOOL v27 = &_os_log_default;
                      }
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v81 = (uint64_t)v16;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "app %@ already found in client list", buf, 0xCu);
                      }

                      char v20 = 1;
                    }
                  }
                  id v19 = [v17 countByEnumeratingWithState:&v64 objects:v77 count:16];
                }
                while (v19);

                uint64_t v15 = v59;
                if ((v20 & 1) == 0) {
                  goto LABEL_42;
                }
LABEL_59:
                uint64_t v15 = (char *)v15 + 1;
              }
              while (v15 != v58);
              id v38 = [v55 countByEnumeratingWithState:&v68 objects:v78 count:16];
              id v58 = v38;
            }
            while (v38);
          }

          uint64_t v7 = v53 + 1;
        }
        while ((id)(v53 + 1) != v52);
        id v52 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v52);
    }
    uint64_t v39 = obj;

    if (gLogObjects && gNumLogObjects >= 10)
    {
      __int16 v40 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v40 = &_os_log_default;
      id v43 = &_os_log_default;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessoryServer _launchUnregisteredClientApps:knownClientApps:]();
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v44 = v54;
    id v45 = [v44 countByEnumeratingWithState:&v60 objects:v76 count:16];
    id v5 = v49;
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v61;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(void *)v61 != v47) {
            objc_enumerationMutation(v44);
          }
          platform_system_launchApplicationToBackground(*(void **)(*((void *)&v60 + 1) + 8 * (void)j));
        }
        id v46 = [v44 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v46);
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v41 = gNumLogObjects < 10;
    }
    else {
      BOOL v41 = 1;
    }
    if (v41)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v39 = &_os_log_default;
      id v42 = &_os_log_default;
    }
    else
    {
      uint64_t v39 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "system not unlocked", buf, 2u);
    }
  }
}

- (id)_eaClientsForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
  [v5 lock];

  id v6 = [(ACCExternalAccessoryServer *)self eaClientConnections];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __53__ACCExternalAccessoryServer__eaClientsForAccessory___block_invoke;
  v11[3] = &unk_100216B08;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 objectsPassingTest:v11];

  uint64_t v9 = [(ACCExternalAccessoryServer *)self connectedAccessoryLock];
  [v9 unlock];

  return v8;
}

id __53__ACCExternalAccessoryServer__eaClientsForAccessory___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 canSendConnectionEventForAccessory:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

uint64_t __42__ACCExternalAccessoryServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_2 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.externalaccessory-server" andFeatureNotification:"com.apple.accessories.externalaccessory-server.availability-changed"];

  return _objc_release_x1();
}

- (void)setEaClientConnectionsMutable:(id)a3
{
}

- (NSMutableSet)eaAccessoriesMutable
{
  return self->_eaAccessoriesMutable;
}

- (void)setEaAccessoriesMutable:(id)a3
{
}

- (void)setActiveDestinationSharingUUIDs:(id)a3
{
}

- (void)setConnectedAccessoryLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedAccessoryLock, 0);
  objc_storeStrong((id *)&self->_activeDestinationSharingUUIDs, 0);
  objc_storeStrong((id *)&self->_eaAccessoriesMutable, 0);

  objc_storeStrong((id *)&self->_eaClientConnectionsMutable, 0);
}

void __65__ACCExternalAccessoryServer_listener_shouldAcceptNewConnection___block_invoke_110_cold_2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[#ExternalAccessory] Found %lu clients in invalidation handler, should be 1", buf, 0xCu);
}

- (void)sendToClientsNotification:(uint64_t)a1 withPayload:(uint64_t)a2 aboutAccessory:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  id v4 = "-[ACCExternalAccessoryServer sendToClientsNotification:withPayload:aboutAccessory:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Received nil param. eaAccessory %@ notificationName %@", (uint8_t *)&v3, 0x20u);
}

- (void)accessoryClosingExternalAccessorySession:.cold.2()
{
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2112;
  uint64_t v3 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "ERROR - accessoryClosingExternalAccessorySession: eaSessionUUID %@, eaClientInfo %@", v1, 0x16u);
}

void __115__ACCExternalAccessoryServer_handleIncomingExternalAccessoryData_forEASessionIdentifier_toExternalAccessoryClient___block_invoke_133_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 48);
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Handle incoming data for eaSessionUUID: %@, EA client: %@, result: %d", (uint8_t *)&v5, 0x1Cu);
}

void __79__ACCExternalAccessoryServer_sendNMEASentence_forAccessoryUUID_withTimestamps___block_invoke_135_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#Location] XPC connection error: %@", v2, v3, v4, v5, v6);
}

void __65__ACCExternalAccessoryServer_notifyClientOfConnectedAccessories___block_invoke_138_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#ExternalAccessory] XPC connection error: %@", v2, v3, v4, v5, v6);
}

void __67__ACCExternalAccessoryServer_notifyClientOfConnectedVehicleStatus___block_invoke_143_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#VehicleInfoStatus] XPC connection error: %@", v2, v3, v4, v5, v6);
}

- (void)_launchUnregisteredClientApps:knownClientApps:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Final unregistered EA client app set = %@", v1, 0xCu);
}

@end