@interface ACCVoiceOverServer
+ (id)sharedServer;
- (ACCVoiceOverServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableDictionary)registeredAccessoryConnections;
- (_ACCVoiceOverProviderInfo)voiceOverProviderInfo;
- (void)accessoryVoiceOver:(id)a3 performAction:(int)a4 parameters:(id)a5;
- (void)accessoryVoiceOver:(id)a3 requestConfiguration:(int)a4 param:(id)a5;
- (void)accessoryVoiceOver:(id)a3 setContext:(int)a4;
- (void)accessoryVoiceOver:(id)a3 setEnabled:(BOOL)a4;
- (void)accessoryVoiceOverAttached:(id)a3;
- (void)accessoryVoiceOverDetached:(id)a3;
- (void)accessoryVoiceOverStartCursorInformationUpdate:(id)a3;
- (void)accessoryVoiceOverStartInformationUpdate:(id)a3;
- (void)accessoryVoiceOverStopCursorInformationUpdate:(id)a3;
- (void)accessoryVoiceOverStopInformationUpdate:(id)a3;
- (void)dealloc;
- (void)iterateAttachedConnectionsSync:(id)a3;
- (void)setVoiceOverProviderInfo:(id)a3;
@end

@implementation ACCVoiceOverServer

- (ACCVoiceOverServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACCVoiceOverServer;
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
  v7.super_class = (Class)ACCVoiceOverServer;
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
    v29 = (_ACCVoiceOverProviderInfo *)xpcServiceName;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  char v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCVoiceOverXPCServerProtocol];
  [v7 setExportedInterface:v12];

  long long v13 = [[ACCVoiceOverServerRemote alloc] initWithXPCConnection:v7];
  [v7 setExportedObject:v13];
  long long v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCVoiceOverXPCClientProtocol];
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __57__ACCVoiceOverServer_listener_shouldAcceptNewConnection___block_invoke;
  v23[3] = &unk_100217420;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  [v7 setInvalidationHandler:v23];
  long long v15 = objc_alloc_init(_ACCVoiceOverProviderInfo);
  [(_ACCVoiceOverProviderInfo *)v15 setConnection:v7];
  [(_ACCVoiceOverProviderInfo *)v15 setServerRemote:v13];
  long long v16 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_22];
  [(_ACCVoiceOverProviderInfo *)v15 setRemoteObject:v16];

  objc_storeStrong((id *)&self->_voiceOverProviderInfo, v15);
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    *(_DWORD *)buf = 138412290;
    v29 = voiceOverProviderInfo;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "providerInfo=%@", buf, 0xCu);
  }

  [v7 resume];
  v20 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__ACCVoiceOverServer_listener_shouldAcceptNewConnection___block_invoke_125;
  block[3] = &unk_1002158C8;
  block[4] = self;
  dispatch_async(v20, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __57__ACCVoiceOverServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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
    id v7 = [v6 voiceOverProviderInfo];
    int v10 = 138412546;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    long long v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated! %@ providerInfo=%@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  [v8 setInvalidationHandler:0];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 setVoiceOverProviderInfo:0];
}

void __57__ACCVoiceOverServer_listener_shouldAcceptNewConnection___block_invoke_123(id a1, NSError *a2)
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

void __57__ACCVoiceOverServer_listener_shouldAcceptNewConnection___block_invoke_125(uint64_t a1)
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
    uint64_t v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inform provider of attached accessories %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "allValues", 0);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*(void *)(a1 + 32) + 56);
        if (v11)
        {
          __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          long long v13 = [v11 remoteObject];
          long long v14 = [v12 accessoryUID];
          [v13 accessoryVoiceOverAttached:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  voiceOverProviderInfo = self->_voiceOverProviderInfo;
  if (voiceOverProviderInfo)
  {
    id v6 = [(_ACCVoiceOverProviderInfo *)voiceOverProviderInfo connection];
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
    id v11 = self->_voiceOverProviderInfo;
    v13[0] = 67109634;
    v13[1] = v7;
    __int16 v14 = 2112;
    long long v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "VoiceOver server, shouldAcceptConnection=%d _voiceOverProviderInfo=%@ connection=%@", (uint8_t *)v13, 0x1Cu);
  }

  return v7;
}

- (void)accessoryVoiceOverAttached:(id)a3
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
    unsigned int v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    unsigned int v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOver server, accessoryVoiceOverAttached: %@", (uint8_t *)&v13, 0xCu);
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    long long v18 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "VoiceOver server, accessoryVoiceOverAttached: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v13, 0x20u);
  }

  if (!v8)
  {
    BOOL v8 = [[_ACCVoiceOverAccessoryInfo alloc] initWithUID:v4];
    [(NSMutableDictionary *)self->_registeredAccessoryConnections setObject:v8 forKey:v4];
  }
  id v11 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
  [v11 accessoryVoiceOverAttached:v4];
}

- (void)accessoryVoiceOverDetached:(id)a3
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
    unsigned int v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    unsigned int v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOver server, accessoryVoiceOverDetached: %@", (uint8_t *)&v13, 0xCu);
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    long long v18 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "VoiceOver server, accessoryVoiceOverDetached: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v8) {
    [(NSMutableDictionary *)self->_registeredAccessoryConnections removeObjectForKey:v4];
  }
  id v11 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
  [v11 accessoryVoiceOverDetached:v4];
}

- (void)accessoryVoiceOver:(id)a3 setEnabled:(BOOL)a4
{
  BOOL v4 = a4;
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
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VoiceOver server, accessoryVoiceOver: %@ setEnabled: %d", (uint8_t *)&v15, 0x12u);
  }

  id v10 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v15 = 138413058;
    id v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "VoiceOver server, accessoryVoiceOver: %@ setEnabled: %d, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v15, 0x26u);
  }

  if (v10)
  {
    int v13 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v13 accessoryVoiceOver:v6 setEnabled:v4];
  }
}

- (void)accessoryVoiceOver:(id)a3 setContext:(int)a4
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
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "voiceOver serve, accessoryVoiceOver: %@  setContext: %d", (uint8_t *)&v15, 0x12u);
  }

  id v10 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v15 = 138413058;
    id v16 = v6;
    __int16 v17 = 1024;
    int v18 = v4;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = voiceOverProviderInfo;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "voiceOver serve, accessoryVoiceOver: %@  setContext: %d, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v15, 0x26u);
  }

  if (v10)
  {
    id v14 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v14 accessoryVoiceOver:v6 setContext:v4];
  }
}

- (void)accessoryVoiceOver:(id)a3 performAction:(int)a4 parameters:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 5;
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
    id v12 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "voiceOver serve, accessoryVoiceOver: %@  performAction: %d parameters: %@", (uint8_t *)&v18, 0x1Cu);
  }

  int v13 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v8];
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
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v18 = 138413314;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    v27 = voiceOverProviderInfo;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "voiceOver serve, accessoryVoiceOver: %@  performAction: %d parameters: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v18, 0x30u);
  }

  if (v13)
  {
    __int16 v17 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v17 accessoryVoiceOver:v8 performAction:v6 parameters:v9];
  }
}

- (void)accessoryVoiceOver:(id)a3 requestConfiguration:(int)a4 param:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 5;
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
    id v12 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "VoiceOver server, requestSetConfiguration: %@ type: %d param: %@", (uint8_t *)&v18, 0x1Cu);
  }

  int v13 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v8];
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
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v18 = 138413314;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    v27 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "VoiceOver server, requestInformationUpdate: %@ type: %d param: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v18, 0x30u);
  }

  if (v13)
  {
    id v16 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v16 accessoryVoiceOver:v8 requestConfiguration:v6 param:v9];
  }
}

- (void)accessoryVoiceOverStartInformationUpdate:(id)a3
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
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOver server, startInformationUpdate: %@", (uint8_t *)&v13, 0xCu);
  }

  id v8 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v4];
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    int v18 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "VoiceOver server, startInformationUpdate: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v8)
  {
    id v11 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v11 accessoryVoiceOverStartInformationUpdate:v4];
  }
}

- (void)accessoryVoiceOverStopInformationUpdate:(id)a3
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
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOver server, stopInformationUpdate: %@", (uint8_t *)&v13, 0xCu);
  }

  id v8 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v4];
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    int v18 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "VoiceOver server, stopInformationUpdate: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v8)
  {
    id v11 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v11 accessoryVoiceOverStopInformationUpdate:v4];
  }
}

- (void)accessoryVoiceOverStartCursorInformationUpdate:(id)a3
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
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOver server, startCursorInformationUpdate: %@", (uint8_t *)&v13, 0xCu);
  }

  id v8 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v4];
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    int v18 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "VoiceOver server, startCursorInformationUpdate: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v8)
  {
    id v11 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v11 accessoryVoiceOverStartCursorInformationUpdate:v4];
  }
}

- (void)accessoryVoiceOverStopCursorInformationUpdate:(id)a3
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
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "VoiceOver server, stopCursorInformationUpdate: %@", (uint8_t *)&v13, 0xCu);
  }

  id v8 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v4];
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
    voiceOverProviderInfo = self->_voiceOverProviderInfo;
    int v13 = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    int v18 = voiceOverProviderInfo;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "VoiceOver server, stopCursorInformationUpdate: %@, accessory=%@ _voiceOverProviderInfo=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v8)
  {
    id v11 = [(_ACCVoiceOverProviderInfo *)self->_voiceOverProviderInfo remoteObject];
    [v11 accessoryVoiceOverStopCursorInformationUpdate:v4];
  }
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__ACCVoiceOverServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_6 != -1) {
    dispatch_once(&sharedServer_once_6, block);
  }
  BOOL v2 = (void *)sharedServer_sharedInstance_6;

  return v2;
}

uint64_t __34__ACCVoiceOverServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_6 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.voiceover" andFeatureNotification:"com.apple.accessories.voiceover.availability-changed"];

  return _objc_release_x1();
}

- (_ACCVoiceOverProviderInfo)voiceOverProviderInfo
{
  return self->_voiceOverProviderInfo;
}

- (void)setVoiceOverProviderInfo:(id)a3
{
}

- (NSMutableDictionary)registeredAccessoryConnections
{
  return self->_registeredAccessoryConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAccessoryConnections, 0);

  objc_storeStrong((id *)&self->_voiceOverProviderInfo, 0);
}

@end