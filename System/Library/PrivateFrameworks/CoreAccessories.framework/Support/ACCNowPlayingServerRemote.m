@interface ACCNowPlayingServerRemote
- (ACCNowPlayingServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)initConnection:(id)a3;
- (void)mediaItemArtworkHasChanged:(id)a3 withReply:(id)a4;
- (void)mediaItemAttributesHaveChanged:(id)a3 withReply:(id)a4;
- (void)playbackAttributesHaveChanged:(id)a3 withReply:(id)a4;
- (void)playbackQueueListChanged;
- (void)playbackQueueListInfoResponse:(id)a3 requestID:(id)a4 info:(id)a5;
@end

@implementation ACCNowPlayingServerRemote

- (ACCNowPlayingServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCNowPlayingServerRemote;
  v6 = [(ACCNowPlayingServerRemote *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_XPCConnection, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)initConnection:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCNowPlayingServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(ACCNowPlayingServerRemote *)self XPCConnection];
    BOOL v7 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v6] != 0;
  }
  else
  {
    BOOL v7 = 0;
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
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#Now Playing] Client has called initConnection method!", (uint8_t *)v14, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[#Now Playing] shouldStayConnected: %d", (uint8_t *)v14, 8u);
  }

  if (v7)
  {
    v13 = +[ACCNowPlayingServer sharedServer];
    [v13 sendUpdatedSubscriberList];
  }
  v4[2](v4, v7);
}

- (void)mediaItemAttributesHaveChanged:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
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
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#Now Playing] Received mediaItemAttributes update: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = platform_nowPlaying_mediaItemAttributesUpdate((uint64_t)v5);
  if (v6) {
    v6[2](v6, v10);
  }
}

- (void)mediaItemArtworkHasChanged:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
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
    int v11 = 134217984;
    id v12 = [v5 length];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#Now Playing] #Artwork Received mediaItemArtwork update: %lu bytes", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = platform_nowPlaying_mediaItemArtworkUpdate((uint64_t)v5);
  if (v6) {
    v6[2](v6, v10);
  }
}

- (void)playbackAttributesHaveChanged:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
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
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#Now Playing] Received playbackAttributes update: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = platform_nowPlaying_playbackAttributesUpdate(v5);
  if (v6) {
    v6[2](v6, v10);
  }
}

- (void)playbackQueueListChanged
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[#Now Playing] Received playbackQueueListChanged", v5, 2u);
  }

  platform_nowPlaying_playbackQueueListChanged(1u);
}

- (void)playbackQueueListInfoResponse:(id)a3 requestID:(id)a4 info:(id)a5
{
  id v7 = a3;
  id v8 = a4;
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
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[#Now Playing] Received playbackQueueListInfoResponse: %@ requestID: %@ info: %@", (uint8_t *)&v13, 0x20u);
  }

  platform_nowPlaying_playbackQueueListInfoResponse(v7, (uint64_t)v9);
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

@end