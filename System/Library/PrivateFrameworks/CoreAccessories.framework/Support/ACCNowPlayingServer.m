@interface ACCNowPlayingServer
+ (id)sharedServer;
- (ACCNowPlayingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (AccessoryNowPlayingXPCClientProtocol)remoteObject;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableArray)clientConnections;
- (NSXPCConnection)activeConnection;
- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4;
- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7;
- (void)sendUpdatedSubscriberList;
- (void)setActiveConnection:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setPlaybackElapsedTime:(id)a3;
- (void)setPlaybackQueueIndex:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)triggerMediaItemArtworkUpdate;
- (void)triggerMediaItemAttributesUpdate;
- (void)triggerPlaybackAttributesUpdate;
@end

@implementation ACCNowPlayingServer

- (ACCNowPlayingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ACCNowPlayingServer;
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#Now Playing] New XPC connection for: %@", buf, 0xCu);
  }

  v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AccessoryNowPlayingXPCServerProtocol];
  [v7 setExportedInterface:v12];

  v13 = [[ACCNowPlayingServerRemote alloc] initWithXPCConnection:v7];
  [v7 setExportedObject:v13];

  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AccessoryNowPlayingXPCClientProtocol];
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_100215BF8;
  objc_copyWeak(&v29, &from);
  v28[4] = self;
  objc_copyWeak(&v30, &location);
  [v7 setInvalidationHandler:v28];
  v15 = [(ACCNowPlayingServer *)self clientConnections];
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
    v18 = [(ACCNowPlayingServer *)self clientConnections];
    v19 = (NSString *)[v18 count];
    *(_DWORD *)buf = 134217984;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[#Now Playing] There are now %lu client(s).", buf, 0xCu);
  }
  [v7 resume];
  v20 = [(ACCNowPlayingServer *)self clientConnections];
  BOOL v21 = [v20 count] == (id)1;

  if (v21)
  {
    [(ACCNowPlayingServer *)self setActiveConnection:v7];
    v22 = [(ACCNowPlayingServer *)self activeConnection];
    v23 = [v22 remoteObjectProxyWithErrorHandler:&__block_literal_global_1];
    [(ACCNowPlayingServer *)self setRemoteObject:v23];

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
      v26 = [(ACCNowPlayingServer *)self remoteObject];
      -[ACCNowPlayingServer listener:shouldAcceptNewConnection:](v26, buf, v24);
    }
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
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
    int v22 = 138412290;
    id v23 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#Now Playing] XPC connection invalidated: %@", (uint8_t *)&v22, 0xCu);
  }
  id v6 = a1 + 5;
  id v7 = objc_loadWeakRetained(a1 + 5);
  [v7 setInvalidationHandler:0];

  id v8 = objc_loadWeakRetained(a1 + 5);
  id v9 = [a1[4] activeConnection];
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained(a1 + 6);
    [v11 setActiveConnection:0];

    id v12 = objc_loadWeakRetained(a1 + 6);
    [v12 setRemoteObject:0];
  }
  v13 = a1 + 6;
  id v14 = objc_loadWeakRetained(v13);
  v15 = [v14 clientConnections];
  id v16 = objc_loadWeakRetained(v6);
  [v15 removeObject:v16];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v17 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = objc_loadWeakRetained(v13);
    v20 = [v19 clientConnections];
    id v21 = [v20 count];
    int v22 = 134217984;
    id v23 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[#Now Playing] There are now %lu client(s).", (uint8_t *)&v22, 0xCu);
  }
}

void __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke_73(id a1, NSError *a2)
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
    __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke_73_cold_1((uint64_t)v2, v5);
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = [(ACCNowPlayingServer *)self clientConnections];
  if ([v5 count])
  {
    id v6 = [(ACCNowPlayingServer *)self clientConnections];
    id v7 = [v6 objectAtIndexedSubscript:0];
    unsigned __int8 v8 = [v7 isEqual:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)sendUpdatedSubscriberList
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
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[#Now Playing] sendUpdatedSubscriberList...", v9, 2u);
  }

  id v6 = [(ACCNowPlayingServer *)self remoteObject];
  id v7 = [(ACCFeatureServer *)self subFeatureSubscribers];
  unsigned __int8 v8 = [v7 allObjects];
  [v6 updateSubscriberList:v8 WithReply:&__block_literal_global_77];
}

void __48__ACCNowPlayingServer_sendUpdatedSubscriberList__block_invoke(id a1, BOOL a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __48__ACCNowPlayingServer_sendUpdatedSubscriberList__block_invoke_cold_1();
  }
}

- (void)triggerMediaItemAttributesUpdate
{
  id v3 = [(ACCNowPlayingServer *)self remoteObject];

  if (v3)
  {
    id v4 = [(ACCNowPlayingServer *)self remoteObject];
    [v4 triggerMediaItemAttributesUpdateWithReply:&__block_literal_global_79];
  }
  else
  {
    id v4 = dispatch_get_global_queue(0, 0);
    dispatch_async(v4, &__block_literal_global_82);
  }
}

void __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke(id a1, BOOL a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke_cold_1();
  }
}

void __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke_80(id a1)
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
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    id v3 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#Now Playing] No clients connected, sending default media item attributes...", v5, 2u);
  }

  id v4 = (void *)platform_nowPlaying_copyDefaultMediaItemAttributes();
  platform_nowPlaying_mediaItemAttributesUpdate((uint64_t)v4);
}

- (void)triggerMediaItemArtworkUpdate
{
  id v3 = [(ACCNowPlayingServer *)self remoteObject];

  if (v3)
  {
    id v4 = [(ACCNowPlayingServer *)self remoteObject];
    [v4 triggerMediaItemArtworkUpdateWithReply:&__block_literal_global_84];
  }
  else
  {
    id v4 = dispatch_get_global_queue(0, 0);
    dispatch_async(v4, &__block_literal_global_87);
  }
}

void __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke(id a1, BOOL a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke_cold_1();
  }
}

void __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke_85(id a1)
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
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    id v3 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#Now Playing] #Artwork No clients connected, sending default media item artwork...", v5, 2u);
  }

  id v4 = (void *)platform_nowPlaying_copyDefaultMediaItemArtwork();
  platform_nowPlaying_mediaItemArtworkUpdate((uint64_t)v4);
}

- (void)triggerPlaybackAttributesUpdate
{
  id v3 = [(ACCNowPlayingServer *)self remoteObject];

  if (v3)
  {
    id v4 = [(ACCNowPlayingServer *)self remoteObject];
    [v4 triggerPlaybackAttributesUpdateWithReply:&__block_literal_global_89];
  }
  else
  {
    id v4 = dispatch_get_global_queue(0, 0);
    dispatch_async(v4, &__block_literal_global_92);
  }
}

void __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke(id a1, BOOL a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke_cold_1();
  }
}

void __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke_90(id a1)
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
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    id v3 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#Now Playing] No clients connected, sending default playback attributes...", v5, 2u);
  }

  id v4 = (void *)platform_nowPlaying_copyDefaultPlaybackAttributes();
  platform_nowPlaying_playbackAttributesUpdate(v4);
}

- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v15 = a3;
  id v12 = a4;
  v13 = [(ACCNowPlayingServer *)self remoteObject];

  if (v13)
  {
    id v14 = [(ACCNowPlayingServer *)self remoteObject];
    [v14 requestPlaybackQueueListInfo:v15 requestID:v12 startIndex:v9 upToCount:v8 infoMask:v7];
  }
  else
  {
    id v14 = dispatch_get_global_queue(0, 0);
    dispatch_async(v14, &__block_literal_global_94);
  }
}

void __92__ACCNowPlayingServer_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke(id a1)
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
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    id v3 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#Now Playing] No clients connected, sending playback queue list not available...", v4, 2u);
  }

  platform_nowPlaying_playbackQueueListChanged(0);
}

- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACCNowPlayingServer *)self remoteObject];

  if (v8)
  {
    uint64_t v9 = [(ACCNowPlayingServer *)self remoteObject];
    [v9 cancelRequestPlaybackQueueListInfo:v6 requestID:v7];
  }
  else
  {
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
      uint64_t v9 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    else
    {
      uint64_t v9 = *(id *)(gLogObjects + 32);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#Now Playing] No clients connected, ignore cancel for accessoryUID %@, requestID %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)setPlaybackElapsedTime:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCNowPlayingServer *)self remoteObject];
  [v5 setPlaybackElapsedTime:v4 withReply:&__block_literal_global_96];
}

void __46__ACCNowPlayingServer_setPlaybackElapsedTime___block_invoke(id a1, BOOL a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __46__ACCNowPlayingServer_setPlaybackElapsedTime___block_invoke_cold_1();
  }
}

- (void)setPlaybackQueueIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCNowPlayingServer *)self remoteObject];
  [v5 setPlaybackQueueIndex:v4 withReply:&__block_literal_global_98];
}

void __45__ACCNowPlayingServer_setPlaybackQueueIndex___block_invoke(id a1, BOOL a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__ACCNowPlayingServer_setPlaybackQueueIndex___block_invoke_cold_1();
  }
}

- (NSXPCConnection)activeConnection
{
  id v3 = [(ACCNowPlayingServer *)self clientConnections];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(ACCNowPlayingServer *)self clientConnections];
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
  block[2] = __35__ACCNowPlayingServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once != -1) {
    dispatch_once(&sharedServer_once, block);
  }
  BOOL v2 = (void *)sharedServer_sharedInstance;

  return v2;
}

uint64_t __35__ACCNowPlayingServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.now-playing" andFeatureNotification:"com.apple.accessories.now-playing.availability-changed"];

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

- (AccessoryNowPlayingXPCClientProtocol)remoteObject
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
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[#Now Playing] Get remote object: %@", buf, 0xCu);
}

void __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke_73_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[#Now Playing] XPC connection error: %@", (uint8_t *)&v2, 0xCu);
}

void __48__ACCNowPlayingServer_sendUpdatedSubscriberList__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "[#Now Playing] Update subscriber list result: %d", v2, v3, v4, v5, v6);
}

void __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "[#Now Playing] Trigger mediaItemAttributes update result: %d", v2, v3, v4, v5, v6);
}

void __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "[#Now Playing] #Artwork Trigger mediaItemArtwork update result: %d", v2, v3, v4, v5, v6);
}

void __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "[#Now Playing] Trigger playbackAttributes update result: %d", v2, v3, v4, v5, v6);
}

void __46__ACCNowPlayingServer_setPlaybackElapsedTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "[#Now Playing] Set playback elapsed time result: %d", v2, v3, v4, v5, v6);
}

void __45__ACCNowPlayingServer_setPlaybackQueueIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "[#Now Playing] Set playback queue index result: %d", v2, v3, v4, v5, v6);
}

@end