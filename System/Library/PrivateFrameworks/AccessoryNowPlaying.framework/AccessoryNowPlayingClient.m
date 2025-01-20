@interface AccessoryNowPlayingClient
- (AccessoryNowPlayingClient)initWithDelegate:(id)a3;
- (AccessoryNowPlayingClientProtocol)delegate;
- (AccessoryNowPlayingXPCServerProtocol)remoteObject;
- (BOOL)shouldSendArtwork;
- (BOOL)shouldSendPlaybackQueueList;
- (NSSet)subscriberList;
- (NSXPCConnection)serverConnection;
- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4;
- (void)connectToServer;
- (void)dealloc;
- (void)mediaItemArtworkDidChange;
- (void)mediaItemAttributesDidChange:(id)a3;
- (void)playbackAttributesDidChange:(id)a3;
- (void)playbackQueueListDidChange;
- (void)playbackQueueListInfoResponse:(id)a3 requestID:(id)a4 info:(id)a5;
- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7;
- (void)setDelegate:(id)a3;
- (void)setPlaybackElapsedTime:(id)a3 withReply:(id)a4;
- (void)setPlaybackQueueIndex:(id)a3 withReply:(id)a4;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setShouldSendArtwork:(BOOL)a3;
- (void)setSubscriberList:(id)a3;
- (void)triggerMediaItemArtworkUpdateWithReply:(id)a3;
- (void)triggerMediaItemAttributesUpdateWithReply:(id)a3;
- (void)triggerPlaybackAttributesUpdateWithReply:(id)a3;
- (void)updateSubscriberList:(id)a3 WithReply:(id)a4;
@end

@implementation AccessoryNowPlayingClient

- (AccessoryNowPlayingClient)initWithDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  init_logging();
  v20.receiver = self;
  v20.super_class = (Class)AccessoryNowPlayingClient;
  v5 = [(AccessoryNowPlayingClient *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v6->_serverConnection;
    v6->_serverConnection = 0;

    remoteObject = v6->_remoteObject;
    v6->_remoteObject = 0;

    subscriberList = v6->_subscriberList;
    v6->_subscriberList = 0;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __46__AccessoryNowPlayingClient_initWithDelegate___block_invoke;
    v17 = &unk_2645BF6E8;
    objc_copyWeak(&v18, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.now-playing.availability-changed", &v14);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[AccessoryNowPlayingClient initWithDelegate:]();
      }
      v10 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int isServerAvailable = accessoryServer_isServerAvailable();
      *(_DWORD *)buf = 67109120;
      int v22 = isServerAvailable;
      _os_log_impl(&dword_2216AB000, v10, OS_LOG_TYPE_DEFAULT, "Server available: %d", buf, 8u);
    }

    [(AccessoryNowPlayingClient *)v6 connectToServer];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __46__AccessoryNowPlayingClient_initWithDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_2216AB000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[AccessoryNowPlayingClient initWithDelegate:]();
      }
      v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2216AB000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(AccessoryNowPlayingClient *)self serverConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)AccessoryNowPlayingClient;
  [(AccessoryNowPlayingClient *)&v4 dealloc];
}

- (void)connectToServer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2216AB000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2216AB000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_77(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2216AB000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_78(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __44__AccessoryNowPlayingClient_connectToServer__block_invoke_78_cold_1((uint64_t)v2, v5);
  }
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_80(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_2216AB000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (BOOL)shouldSendArtwork
{
  id v2 = [(AccessoryNowPlayingClient *)self subscriberList];
  char v3 = [v2 containsObject:@"MediaItemArtwork"];

  return v3;
}

- (BOOL)shouldSendPlaybackQueueList
{
  id v2 = [(AccessoryNowPlayingClient *)self subscriberList];
  char v3 = [v2 containsObject:@"PlaybackQueueList"];

  return v3;
}

- (void)mediaItemAttributesDidChange:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(AccessoryNowPlayingClient *)self subscriberList];
  int v5 = [v4 containsObject:@"MediaItemAttributes"];
  if (v8 && v5)
  {
    uint64_t v6 = [v8 count];

    id v7 = v8;
    if (!v6) {
      goto LABEL_6;
    }
    BOOL v4 = [(AccessoryNowPlayingClient *)self remoteObject];
    [v4 mediaItemAttributesHaveChanged:v8 withReply:&__block_literal_global_82];
  }

  id v7 = v8;
LABEL_6:
}

void __58__AccessoryNowPlayingClient_mediaItemAttributesDidChange___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AccessoryNowPlayingClient_mediaItemAttributesDidChange___block_invoke_cold_1();
  }
}

- (void)mediaItemArtworkDidChange
{
  if ([(AccessoryNowPlayingClient *)self shouldSendArtwork])
  {
    [(AccessoryNowPlayingClient *)self triggerMediaItemArtworkUpdateWithReply:0];
  }
}

- (void)playbackAttributesDidChange:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(AccessoryNowPlayingClient *)self subscriberList];
  int v5 = [v4 containsObject:@"PlaybackAttributes"];
  if (v8 && v5)
  {
    uint64_t v6 = [v8 count];

    id v7 = v8;
    if (!v6) {
      goto LABEL_6;
    }
    BOOL v4 = [(AccessoryNowPlayingClient *)self remoteObject];
    [v4 playbackAttributesHaveChanged:v8 withReply:&__block_literal_global_84];
  }

  id v7 = v8;
LABEL_6:
}

void __57__AccessoryNowPlayingClient_playbackAttributesDidChange___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__AccessoryNowPlayingClient_playbackAttributesDidChange___block_invoke_cold_1();
  }
}

- (void)playbackQueueListDidChange
{
  if ([(AccessoryNowPlayingClient *)self shouldSendPlaybackQueueList])
  {
    id v3 = [(AccessoryNowPlayingClient *)self remoteObject];
    [v3 playbackQueueListChanged];
  }
}

- (void)playbackQueueListInfoResponse:(id)a3 requestID:(id)a4 info:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AccessoryNowPlayingClient *)self shouldSendPlaybackQueueList])
  {
    uint64_t v11 = [(AccessoryNowPlayingClient *)self remoteObject];
    [v11 playbackQueueListInfoResponse:v8 requestID:v9 info:v10];
  }
  else
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[AccessoryNowPlayingClient initWithDelegate:]();
      }
      uint64_t v11 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    else
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_2216AB000, v11, OS_LOG_TYPE_INFO, "Not shouldSendPlaybackQueueList, ignore! %@, requestID=%@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)updateSubscriberList:(id)a3 WithReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v10 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AccessoryNowPlayingClient updateSubscriberList:WithReply:]((uint64_t)v6, v10);
  }

  if (v6)
  {
    uint64_t v11 = [MEMORY[0x263EFFA08] setWithArray:v6];
    [(AccessoryNowPlayingClient *)self setSubscriberList:v11];

    BOOL v12 = [(AccessoryNowPlayingClient *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      int v14 = [(AccessoryNowPlayingClient *)self delegate];
      objc_msgSend(v14, "shouldSendArtworkDidChange:", -[AccessoryNowPlayingClient shouldSendArtwork](self, "shouldSendArtwork"));
    }
  }
  if (v7) {
    v7[2](v7, 1);
  }
}

- (void)triggerMediaItemAttributesUpdateWithReply:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(AccessoryNowPlayingClient *)self delegate];
  if (!v4) {
    goto LABEL_5;
  }
  int v5 = (void *)v4;
  id v6 = [(AccessoryNowPlayingClient *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v8 = [(AccessoryNowPlayingClient *)self delegate];
  id v9 = [v8 currentMediaItemAttributes];

  if (v9)
  {
    id v10 = [(AccessoryNowPlayingClient *)self remoteObject];
    [v10 mediaItemAttributesHaveChanged:v9 withReply:&__block_literal_global_91];

    uint64_t v11 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v11 = 0;
  }
  BOOL v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    BOOL v12 = v13;
  }
}

void __71__AccessoryNowPlayingClient_triggerMediaItemAttributesUpdateWithReply___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __71__AccessoryNowPlayingClient_triggerMediaItemAttributesUpdateWithReply___block_invoke_cold_1();
  }
}

- (void)triggerMediaItemArtworkUpdateWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = [(AccessoryNowPlayingClient *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    char v7 = [(AccessoryNowPlayingClient *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(AccessoryNowPlayingClient *)self delegate];
      id v10 = [v9 currentMediaItemArtwork];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[AccessoryNowPlayingClient initWithDelegate:]();
        }
        uint64_t v11 = &_os_log_internal;
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[AccessoryNowPlayingClient triggerMediaItemArtworkUpdateWithReply:](v10, v11);
      }

      if (v10)
      {
        id v13 = [(AccessoryNowPlayingClient *)self remoteObject];
        [v13 mediaItemArtworkHasChanged:v10 withReply:&__block_literal_global_95];

        uint64_t v14 = 1;
        if (!v4) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
  }
  uint64_t v14 = 0;
  if (v4) {
LABEL_15:
  }
    v4[2](v4, v14);
LABEL_16:
}

void __68__AccessoryNowPlayingClient_triggerMediaItemArtworkUpdateWithReply___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__AccessoryNowPlayingClient_triggerMediaItemArtworkUpdateWithReply___block_invoke_cold_1();
  }
}

- (void)triggerPlaybackAttributesUpdateWithReply:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(AccessoryNowPlayingClient *)self delegate];
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(AccessoryNowPlayingClient *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    goto LABEL_5;
  }
  char v8 = [(AccessoryNowPlayingClient *)self delegate];
  id v9 = [v8 currentPlaybackAttributes];

  if (v9)
  {
    id v10 = [(AccessoryNowPlayingClient *)self remoteObject];
    [v10 playbackAttributesHaveChanged:v9 withReply:&__block_literal_global_99];

    uint64_t v11 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v11 = 0;
  }
  id v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    id v12 = v13;
  }
}

void __70__AccessoryNowPlayingClient_triggerPlaybackAttributesUpdateWithReply___block_invoke()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[AccessoryNowPlayingClient initWithDelegate:]();
    }
    id v2 = &_os_log_internal;
    id v1 = &_os_log_internal;
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__AccessoryNowPlayingClient_triggerPlaybackAttributesUpdateWithReply___block_invoke_cold_1();
  }
}

- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v18 = a3;
  id v12 = a4;
  uint64_t v13 = [(AccessoryNowPlayingClient *)self delegate];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    id v15 = [(AccessoryNowPlayingClient *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = [(AccessoryNowPlayingClient *)self delegate];
      [v17 requestPlaybackQueueListInfo:v18 requestID:v12 startIndex:v9 upToCount:v8 infoMask:v7];
    }
  }
}

- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(AccessoryNowPlayingClient *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(AccessoryNowPlayingClient *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(AccessoryNowPlayingClient *)self delegate];
      [v11 cancelRequestPlaybackQueueListInfo:v12 requestID:v6];
    }
  }
}

- (void)setPlaybackElapsedTime:(id)a3 withReply:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = [(AccessoryNowPlayingClient *)self delegate];
  if (!v7
    || (uint64_t v8 = (void *)v7,
        [(AccessoryNowPlayingClient *)self delegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    uint64_t v12 = 0;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v11 = [(AccessoryNowPlayingClient *)self delegate];
  uint64_t v12 = [v11 setPlaybackElapsedTime:v13];

  if (v6) {
LABEL_6:
  }
    v6[2](v6, v12);
LABEL_7:
}

- (void)setPlaybackQueueIndex:(id)a3 withReply:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = [(AccessoryNowPlayingClient *)self delegate];
  if (!v7
    || (uint64_t v8 = (void *)v7,
        [(AccessoryNowPlayingClient *)self delegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    uint64_t v12 = 0;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v11 = [(AccessoryNowPlayingClient *)self delegate];
  uint64_t v12 = [v11 setPlaybackQueueIndex:v13];

  if (v6) {
LABEL_6:
  }
    v6[2](v6, v12);
LABEL_7:
}

- (AccessoryNowPlayingClientProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AccessoryNowPlayingClientProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setShouldSendArtwork:(BOOL)a3
{
  self->_shouldSendArtwork = a3;
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (AccessoryNowPlayingXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSSet)subscriberList
{
  return self->_subscriberList;
}

- (void)setSubscriberList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriberList, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2216AB000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __44__AccessoryNowPlayingClient_connectToServer__block_invoke_78_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216AB000, a2, OS_LOG_TYPE_ERROR, "XPC connection error: %@", (uint8_t *)&v2, 0xCu);
}

void __58__AccessoryNowPlayingClient_mediaItemAttributesDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216AB000, v0, v1, "Update mediaItemAttributes result: %d", v2, v3, v4, v5, v6);
}

void __57__AccessoryNowPlayingClient_playbackAttributesDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216AB000, v0, v1, "Update playbackAttributes result: %d", v2, v3, v4, v5, v6);
}

- (void)updateSubscriberList:(uint64_t)a1 WithReply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2216AB000, a2, OS_LOG_TYPE_DEBUG, "Received subscriberList update: %@", (uint8_t *)&v2, 0xCu);
}

void __71__AccessoryNowPlayingClient_triggerMediaItemAttributesUpdateWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216AB000, v0, v1, "(Triggered) Update mediaItemAttributes result: %d", v2, v3, v4, v5, v6);
}

- (void)triggerMediaItemArtworkUpdateWithReply:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_debug_impl(&dword_2216AB000, a2, OS_LOG_TYPE_DEBUG, "Received mediaItemArtwork from client: %lu bytes", (uint8_t *)&v3, 0xCu);
}

void __68__AccessoryNowPlayingClient_triggerMediaItemArtworkUpdateWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216AB000, v0, v1, "#Artwork (Triggered) Update mediaItemArtwork result: %d", v2, v3, v4, v5, v6);
}

void __70__AccessoryNowPlayingClient_triggerPlaybackAttributesUpdateWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2216AB000, v0, v1, "(Triggered) Update playbackAttributes result: %d", v2, v3, v4, v5, v6);
}

@end