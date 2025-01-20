@interface ACCCommunicationsServer
+ (id)sharedServer;
- (ACCCommunicationsServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (ACCCommunicationsXPCClientProtocol)remoteObject;
- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4;
- (BOOL)endAllCalls;
- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4;
- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5;
- (BOOL)initiateCallToVoicemail;
- (BOOL)initiateRedial;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)mergeCalls;
- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (BOOL)swapCalls;
- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4;
- (BOOL)updateMuteStatus:(BOOL)a3;
- (NSMutableArray)clientConnections;
- (NSXPCConnection)activeConnection;
- (unint64_t)invokeBlockOnClients:(id)a3 synchronous:(BOOL)a4;
- (void)refreshClientData;
- (void)sendUpdatedSubscriberList;
- (void)setActiveConnection:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)triggerCallStateUpdates;
- (void)triggerCommunicationsUpdate;
- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4;
@end

@implementation ACCCommunicationsServer

- (ACCCommunicationsServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ACCCommunicationsServer;
  v4 = [(ACCFeatureServer *)&v10 initWithXPCServiceName:a3 andFeatureNotification:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v5;

    activeConnection = v4->_activeConnection;
    v4->_activeConnection = 0;

    remoteObject = v4->_remoteObject;
    v4->_remoteObject = 0;
  }
  return v4;
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
    objc_super v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    objc_super v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)buf = 138412290;
    v34 = xpcServiceName;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#Communications] New XPC connection for: %@", buf, 0xCu);
  }

  v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCCommunicationsXPCServerProtocol];
  [v7 setExportedInterface:v12];

  v13 = [[ACCCommunicationsServerRemote alloc] initWithXPCConnection:v7];
  [v7 setExportedObject:v13];

  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCCommunicationsXPCClientProtocol];
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_100215BF8;
  objc_copyWeak(&v29, &from);
  v28[4] = self;
  objc_copyWeak(&v30, &location);
  [v7 setInvalidationHandler:v28];
  v15 = [(ACCCommunicationsServer *)self clientConnections];
  [v15 addObject:v7];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v16 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v16 = &_os_log_default;
    id v17 = &_os_log_default;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(ACCCommunicationsServer *)self clientConnections];
    v19 = (NSString *)[v18 count];
    *(_DWORD *)buf = 134217984;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[#Communications] There are now %lu client(s).", buf, 0xCu);
  }
  [v7 resume];
  v20 = [(ACCCommunicationsServer *)self clientConnections];
  BOOL v21 = [v20 count] == (id)1;

  if (v21)
  {
    [(ACCCommunicationsServer *)self setActiveConnection:v7];
    v22 = [(ACCCommunicationsServer *)self activeConnection];
    v23 = [v22 remoteObjectProxyWithErrorHandler:&__block_literal_global_42];
    [(ACCCommunicationsServer *)self setRemoteObject:v23];

    if (gLogObjects && gNumLogObjects >= 5)
    {
      v24 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v24 = &_os_log_default;
      id v25 = &_os_log_default;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v26 = [(ACCCommunicationsServer *)self remoteObject];
      -[ACCCommunicationsServer listener:shouldAcceptNewConnection:](v26, buf, v24);
    }
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

id __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
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
    v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    int v21 = 138412290;
    id v22 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#Communications] XPC connection invalidated: %@", (uint8_t *)&v21, 0xCu);
  }
  id v6 = objc_loadWeakRetained(a1 + 5);
  [v6 setInvalidationHandler:0];

  id v7 = objc_loadWeakRetained(a1 + 5);
  BOOL v8 = [a1[4] activeConnection];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = objc_loadWeakRetained(a1 + 6);
    [v10 setActiveConnection:0];

    id v11 = objc_loadWeakRetained(a1 + 6);
    [v11 setRemoteObject:0];
  }
  id v12 = objc_loadWeakRetained(a1 + 6);
  v13 = [v12 clientConnections];
  id v14 = objc_loadWeakRetained(a1 + 5);
  [v13 removeObject:v14];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v15 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v15 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_loadWeakRetained(a1 + 6);
    v18 = [v17 clientConnections];
    id v19 = [v18 count];
    int v21 = 134217984;
    id v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[#Communications] There are now %lu client(s).", (uint8_t *)&v21, 0xCu);
  }
  return [a1[4] refreshClientData];
}

void __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1();
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (unint64_t)invokeBlockOnClients:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void *))a3;
  id v7 = [(ACCCommunicationsServer *)self clientConnections];
  id v8 = [v7 copy];

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 5;
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
    id v11 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v27 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[#Communications] Invoking block on %lu client(s)...", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v4) {
          [v18 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_85];
        }
        else {
        id v19 = objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_88, (void)v21);
        }
        if (v6)
        {
          v6[2](v6, v19);
          ++v15;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

void __60__ACCCommunicationsServer_invokeBlockOnClients_synchronous___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1();
  }
}

void __60__ACCCommunicationsServer_invokeBlockOnClients_synchronous___block_invoke_86(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
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
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1();
  }
}

- (void)refreshClientData
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
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[#Communications] Refreshing client data...", v16, 2u);
  }

  id v6 = [(ACCFeatureServer *)self subFeatureSubscribers];
  unsigned int v7 = [v6 containsObject:@"CallStateUpdates"];

  if (v7) {
    [(ACCCommunicationsServer *)self triggerCallStateUpdates];
  }
  id v8 = [(ACCFeatureServer *)self subFeatureSubscribers];
  unsigned int v9 = [v8 containsObject:@"CommunicationsUpdates"];

  if (v9) {
    [(ACCCommunicationsServer *)self triggerCommunicationsUpdate];
  }
  id v10 = [(ACCFeatureServer *)self subFeatureSubscribers];
  unsigned int v11 = [v10 containsObject:@"ListUpdates_Recents"];

  if (v11) {
    [(ACCCommunicationsServer *)self triggerUpdateForListType:0 coalesce:0];
  }
  id v12 = [(ACCFeatureServer *)self subFeatureSubscribers];
  unsigned int v13 = [v12 containsObject:@"ListUpdates_Recents_Coalesced"];

  if (v13) {
    [(ACCCommunicationsServer *)self triggerUpdateForListType:0 coalesce:1];
  }
  id v14 = [(ACCFeatureServer *)self subFeatureSubscribers];
  unsigned int v15 = [v14 containsObject:@"ListUpdates_Favorites"];

  if (v15) {
    [(ACCCommunicationsServer *)self triggerUpdateForListType:1 coalesce:0];
  }
}

- (void)sendUpdatedSubscriberList
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[#Communications] Sent updated subscriber list to %lu client(s)!", v1, 0xCu);
}

void __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 subFeatureSubscribers];
  id v4 = [v5 allObjects];
  [v3 updateSubscriberList:v4 withReply:&__block_literal_global_91];
}

void __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke_2(id a1, BOOL a2)
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
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke_2_cold_1(a2, v5);
  }
}

- (void)triggerCallStateUpdates
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke;
  v3[3] = &unk_10021A6A8;
  v3[4] = &v4;
  [(ACCCommunicationsServer *)self invokeBlockOnClients:v3 synchronous:1];
  if (!*((unsigned char *)v5 + 24))
  {
    BOOL v2 = dispatch_get_global_queue(0, 0);
    dispatch_async(v2, &__block_literal_global_94_0);
  }
  _Block_object_dispose(&v4, 8);
}

id __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke_2;
  v3[3] = &unk_10021A680;
  v3[4] = *(void *)(a1 + 32);
  return [a2 triggerCallStateUpdatesWithReply:v3];
}

uint64_t __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke_3(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    BOOL v3 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#Communications] No clients handle call state updates, sending default call state...", v5, 2u);
  }

  uint64_t v4 = (const void *)platform_communications_copyDefaultCallState();
  platform_communications_callStateUpdate((uint64_t)v4);
  if (v4) {
    CFRelease(v4);
  }
}

- (void)triggerCommunicationsUpdate
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke;
  v3[3] = &unk_10021A6A8;
  v3[4] = &v4;
  [(ACCCommunicationsServer *)self invokeBlockOnClients:v3 synchronous:1];
  if (!*((unsigned char *)v5 + 24))
  {
    id v2 = dispatch_get_global_queue(0, 0);
    dispatch_async(v2, &__block_literal_global_96_0);
  }
  _Block_object_dispose(&v4, 8);
}

id __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke_2;
  v3[3] = &unk_10021A680;
  v3[4] = *(void *)(a1 + 32);
  return [a2 triggerCommunicationsUpdateWithReply:v3];
}

uint64_t __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke_3(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    BOOL v3 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#Communications] No clients handle communications updates, sending default communications state...", v5, 2u);
  }

  uint64_t v4 = (const void *)platform_communications_copyDefaultCommunicationsState();
  platform_communications_communicationsUpdate((uint64_t)v4);
  if (v4) {
    CFRelease(v4);
  }
}

- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke;
  v10[3] = &unk_10021A710;
  int v11 = a3;
  BOOL v12 = a4;
  v10[4] = &v13;
  [(ACCCommunicationsServer *)self invokeBlockOnClients:v10 synchronous:1];
  if (!*((unsigned char *)v14 + 24))
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_3;
    block[3] = &__block_descriptor_37_e5_v8__0l;
    int v8 = a3;
    BOOL v9 = a4;
    dispatch_async(v6, block);
  }
  _Block_object_dispose(&v13, 8);
}

id __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 44);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_2;
  v5[3] = &unk_10021A680;
  v5[4] = *(void *)(a1 + 32);
  return [a2 triggerUpdateForListType:v2 coalesce:v3 withReply:v5];
}

uint64_t __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_3(uint64_t a1)
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
    uint64_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    uint64_t v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#Communications] No clients handle %{coreacc:ACCCommunications_ListUpdate_Type_t}d list updates, sending list not available...", (uint8_t *)v7, 8u);
  }

  return platform_communications_listUpdate(*(_DWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 36));
}

- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ACCCommunicationsServer *)self remoteObject];

  if (v10)
  {
    int v11 = [(ACCCommunicationsServer *)self remoteObject];
    [v11 initiateCallToDestination:v8 withService:v6 addressBookID:v9];
  }
  return 1;
}

- (BOOL)initiateCallToVoicemail
{
  id v3 = [(ACCCommunicationsServer *)self remoteObject];

  if (v3)
  {
    uint64_t v4 = [(ACCCommunicationsServer *)self remoteObject];
    [v4 initiateCallToVoicemail];
  }
  return 1;
}

- (BOOL)initiateRedial
{
  id v3 = [(ACCCommunicationsServer *)self remoteObject];

  if (v3)
  {
    uint64_t v4 = [(ACCCommunicationsServer *)self remoteObject];
    [v4 initiateRedial];
  }
  return 1;
}

- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = [(ACCCommunicationsServer *)self remoteObject];

  if (v7)
  {
    id v8 = [(ACCCommunicationsServer *)self remoteObject];
    [v8 acceptCallWithAction:v4 callUUID:v6];
  }
  return 1;
}

- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = [(ACCCommunicationsServer *)self remoteObject];

  if (v7)
  {
    id v8 = [(ACCCommunicationsServer *)self remoteObject];
    [v8 endCallWithAction:v4 callUUID:v6];
  }
  return 1;
}

- (BOOL)endAllCalls
{
  id v3 = [(ACCCommunicationsServer *)self remoteObject];

  if (v3)
  {
    uint64_t v4 = [(ACCCommunicationsServer *)self remoteObject];
    [v4 endAllCalls];
  }
  return 1;
}

- (BOOL)swapCalls
{
  id v3 = [(ACCCommunicationsServer *)self remoteObject];

  if (v3)
  {
    uint64_t v4 = [(ACCCommunicationsServer *)self remoteObject];
    [v4 swapCalls];
  }
  return 1;
}

- (BOOL)mergeCalls
{
  id v3 = [(ACCCommunicationsServer *)self remoteObject];

  if (v3)
  {
    uint64_t v4 = [(ACCCommunicationsServer *)self remoteObject];
    [v4 mergeCalls];
  }
  return 1;
}

- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [(ACCCommunicationsServer *)self remoteObject];

  if (v7)
  {
    id v8 = [(ACCCommunicationsServer *)self remoteObject];
    [v8 updateHoldStatus:v4 forCallWithUUID:v6];
  }
  return 1;
}

- (BOOL)updateMuteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(ACCCommunicationsServer *)self remoteObject];

  if (v5)
  {
    id v6 = [(ACCCommunicationsServer *)self remoteObject];
    [v6 updateMuteStatus:v3];
  }
  return 1;
}

- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = [(ACCCommunicationsServer *)self remoteObject];

  if (v7)
  {
    id v8 = [(ACCCommunicationsServer *)self remoteObject];
    [v8 sendDTMF:v4 forCallWithUUID:v6];
  }
  return 1;
}

- (NSXPCConnection)activeConnection
{
  BOOL v3 = [(ACCCommunicationsServer *)self clientConnections];
  id v4 = [v3 count];

  if (v4)
  {
    int v5 = [(ACCCommunicationsServer *)self clientConnections];
    id v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = 0;
  }

  return (NSXPCConnection *)v6;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__ACCCommunicationsServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedServer_once_12 != -1) {
    dispatch_once(&sharedServer_once_12, block);
  }
  BOOL v2 = (void *)sharedServer_sharedInstance_12;

  return v2;
}

uint64_t __39__ACCCommunicationsServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_12 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.communications" andFeatureNotification:"com.apple.accessories.communications.availability-changed"];

  return _objc_release_x1();
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (void)setActiveConnection:(id)a3
{
}

- (ACCCommunicationsXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[#Communications] Get remote object: %@", buf, 0xCu);
}

void __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#Communications] XPC connection error: %@", v2, v3, v4, v5, v6);
}

void __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke_2_cold_1(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#Communications] Update subscriber list result: %d", (uint8_t *)v2, 8u);
}

@end