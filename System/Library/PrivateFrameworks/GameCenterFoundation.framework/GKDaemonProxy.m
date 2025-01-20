@interface GKDaemonProxy
+ (GKDaemonProxy)daemonProxy;
+ (GKServiceProxy)proxyForLocalPlayer;
+ (id)proxiesForPlayer;
+ (id)proxyForPlayer:(id)a3;
+ (void)getActiveFriendRequestCount:(id)a3;
+ (void)messagesDidReceiveGameCenterURL:(id)a3;
+ (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5;
+ (void)removeProxyForPlayer:(id)a3;
- (BOOL)hasAuthenticatedAccount;
- (GKDaemonProxy)init;
- (GKDaemonProxyDataUpdateDelegate)dataUpdateDelegate;
- (GKDaemonProxyNetworkActivityIndicatorDelegate)networkActivityIndicatorDelegate;
- (NSDictionary)interfaceLookup;
- (NSHashTable)dataUpdateDelegates;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)authenticationQueue;
- (OS_dispatch_queue)invocationQueue;
- (OS_dispatch_semaphore)concurrentRequestSemaphore;
- (id)accountName;
- (id)authenticatedCredential;
- (id)authenticatedLocalPlayersWithStatus:(unint64_t)a3;
- (id)authenticatedPlayerID;
- (id)authenticatedPlayerInfo;
- (id)getGamedFiredUp;
- (id)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4;
- (id)matchmaker;
- (id)replyQueueForRequestSelector:(SEL)a3;
- (id)userInfoForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5 discoveryInfo:(id)a6;
- (int)hostPID;
- (void)_resetServiceLookup;
- (void)acceptInviteWithNotification:(id)a3;
- (void)acceptMultiplayerGameInvite;
- (void)addDataUpdateDelegate:(id)a3;
- (void)addInterface:(id)a3 toLookup:(id)a4;
- (void)authenticatedLocalPlayersWithStatus:(unint64_t)a3 completion:(id)a4;
- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5;
- (void)beginNetworkActivity;
- (void)buildInterfaceLookup;
- (void)cancelGameInvite:(id)a3;
- (void)cancelInviteWithNotification:(id)a3;
- (void)challengeCompleted:(id)a3;
- (void)challengeReceived:(id)a3;
- (void)completedChallengeSelected:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)declineInviteWithNotification:(id)a3;
- (void)didConnectToParticipantWithID:(id)a3;
- (void)didDisconnectFromParticipantWithID:(id)a3;
- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6;
- (void)dispatchCompletedChallenge:(id)a3;
- (void)endNetworkActivity;
- (void)fetchTurnBasedData;
- (void)friendRequestSelected:(id)a3;
- (void)getAccountNameWithHandler:(id)a3;
- (void)getAuthenticatedPlayerIDWithHandler:(id)a3;
- (void)init;
- (void)loadRemoteImageDataForClientForURL:(id)a3 reply:(id)a4;
- (void)metricsValuesChanged;
- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5;
- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5;
- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4;
- (void)presentBannerWithNotification:(id)a3;
- (void)receivedChallengeSelected:(id)a3;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)relayPushNotification:(id)a3;
- (void)removeDataUpdateDelegate:(id)a3;
- (void)requestSandboxExtension:(id)a3;
- (void)resetLoginCancelCount;
- (void)resetNetworkActivity;
- (void)resetServiceLookup;
- (void)respondedToNearbyInvite:(id)a3;
- (void)setAuthenticationQueue:(id)a3;
- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4;
- (void)setConcurrentRequestSemaphore:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5;
- (void)setDataUpdateDelegate:(id)a3;
- (void)setDataUpdateDelegates:(id)a3;
- (void)setHostPID:(int)a3;
- (void)setInterfaceLookup:(id)a3;
- (void)setInvocationQueue:(id)a3;
- (void)setNetworkActivityIndicatorDelegate:(id)a3;
- (void)setPreferencesValues:(id)a3;
- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5;
- (void)updateInviteWithNotification:(id)a3;
@end

@implementation GKDaemonProxy

- (void)addInterface:(id)a3 toLookup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int outCount = 0;
  v7 = [v5 protocol];
  v8 = protocol_copyMethodDescriptionList(v7, 1, 1, &outCount);
  v9 = v8;
  if (outCount)
  {
    unsigned int v10 = 0;
    p_name = &v8->name;
    do
    {
      v12 = NSStringFromSelector(*p_name);
      v13 = [v6 objectForKey:v12];

      if (!v13) {
        [v6 setObject:v5 forKey:v12];
      }

      ++v10;
      p_name += 2;
    }
    while (v10 < outCount);
  }
  free(v9);
  v14 = protocol_copyMethodDescriptionList(v7, 0, 1, &outCount);
  v15 = v14;
  if (outCount)
  {
    unsigned int v16 = 0;
    v17 = &v14->name;
    do
    {
      v18 = NSStringFromSelector(*v17);
      v19 = [v6 objectForKey:v18];

      if (!v19) {
        [v6 setObject:v5 forKey:v18];
      }

      ++v16;
      v17 += 2;
    }
    while (v16 < outCount);
  }
  free(v15);
}

- (void)addDataUpdateDelegate:(id)a3
{
}

- (NSDictionary)interfaceLookup
{
  return self->_interfaceLookup;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v9 = NSString;
      unsigned int v10 = [NSString stringWithFormat:@"NSInvocation should response to userInfo, please file a radar against Foundation"];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m"];
      id v12 = [v11 lastPathComponent];
      v13 = [v9 stringWithFormat:@"%@ ([invocation respondsToSelector:@selector(userInfo)])\n[%s (%s:%d)]", v10, "-[GKDaemonProxy connection:handleInvocation:isReply:]", objc_msgSend(v12, "UTF8String"), 1091];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
    }
    v14 = [v8 userInfo];
    v15 = [v14 objectForKey:*MEMORY[0x1E4F292F0]];

    unsigned int v16 = [v8 userInfo];
    v17 = [v16 objectForKey:*MEMORY[0x1E4F292F8]];

    if (v17)
    {
      if (!os_log_GKGeneral) {
        id v18 = GKOSLoggers();
      }
      v19 = (void *)os_log_GKPerf;
      if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        double Current = CFAbsoluteTimeGetCurrent();
        v22 = [v17 objectForKey:@"timestamp"];
        [v22 doubleValue];
        *(_DWORD *)buf = 138412546;
        v32 = v15;
        __int16 v33 = 2048;
        double v34 = Current - v23;
        _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "Received reply for request %@ duration(%fs)", buf, 0x16u);
      }
    }
    v24 = [(GKDaemonProxy *)self replyQueueForRequestSelector:NSSelectorFromString(v15)];
    [v8 retainArguments];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__GKDaemonProxy_connection_handleInvocation_isReply___block_invoke;
    block[3] = &unk_1E646EC80;
    id v25 = v8;
    id v29 = v25;
    v30 = self;
    dispatch_async(v24, block);
    v26 = [v17 objectForKey:@"requestID"];
    v27 = [v17 objectForKey:@"subproxy"];
    [v27 replyToDuplicatesForRequest:v26 withInvocation:v25 queue:v24];
  }
  else
  {
    [v7 _gkInvokeOnce];
  }
}

- (id)replyQueueForRequestSelector:(SEL)a3
{
  id v4 = MEMORY[0x1E4F14428];
  if (sel_isEqual(sel_getAuthenticatedPlayerIDWithHandler_, a3)
    || sel_isEqual(sel_getAccountNameWithHandler_, a3)
    || sel_isEqual(sel_getAuthenticatedPlayerInfo_, a3)
    || sel_isEqual(sel_getAuthenticatedPlayerCredential_, a3)
    || sel_isEqual(sel_getAuthenticatedLocalPlayersWithStatus_handler_, a3)
    || sel_isEqual(sel_getConcernsForPlayer_handler_, a3)
    || sel_isEqual(sel_getPreferenceForKey_handler_, a3)
    || sel_isEqual(sel_localizedMessageFromDictionary_forBundleID_handler_, a3))
  {
    if (replyQueueForRequestSelector__onceToken != -1) {
      dispatch_once(&replyQueueForRequestSelector__onceToken, &__block_literal_global_172);
    }
    id v5 = (id)replyQueueForRequestSelector__sPrivateQueue;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14428];
  }

  return v5;
}

- (int)hostPID
{
  return self->_hostPID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

void __45__GKDaemonProxy_getActiveFriendRequestCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[GKPreferences shared];
  int v8 = [v7 inboxContactsOnly];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v9);
        }
        if (!v8
          || objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isFriendInvitationInContacts", (void)v15))
        {
          ++v12;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)invocationQueue
{
  return self->_invocationQueue;
}

intptr_t __53__GKDaemonProxy_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _gkInvokeOnce];
  v2 = *(NSObject **)(*(void *)(a1 + 40) + 72);

  return dispatch_semaphore_signal(v2);
}

- (OS_dispatch_semaphore)concurrentRequestSemaphore
{
  return self->_concurrentRequestSemaphore;
}

uint64_t __28__GKDaemonProxy_daemonProxy__block_invoke()
{
  daemonProxy_sDaemonProxy = objc_alloc_init(GKDaemonProxy);

  return MEMORY[0x1F41817F8]();
}

- (GKDaemonProxy)init
{
  v41.receiver = self;
  v41.super_class = (Class)GKDaemonProxy;
  v2 = [(GKServiceProxy *)&v41 initWithPlayer:0];
  if (!v2) {
    return v2;
  }
  v2->_hostPID = getpid();
  [(GKServiceProxy *)v2 setBaseProxy:v2];
  if (!v2->_hostPID)
  {
    v3 = NSString;
    id v4 = [NSString stringWithFormat:@"_hostPID must not be 0"];
    id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m"];
    id v6 = [v5 lastPathComponent];
    id v7 = [v3 stringWithFormat:@"%@ (_hostPID != 0)\n[%s (%s:%d)]", v4, "-[GKDaemonProxy init]", objc_msgSend(v6, "UTF8String"), 342];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  dataUpdateDelegates = v2->_dataUpdateDelegates;
  v2->_dataUpdateDelegates = (NSHashTable *)v8;

  dispatch_semaphore_t v10 = dispatch_semaphore_create(10);
  concurrentRequestSemaphore = v2->_concurrentRequestSemaphore;
  v2->_concurrentRequestSemaphore = (OS_dispatch_semaphore *)v10;

  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.gamecenter.GKDaemonProxy", v12);
  invocationQueue = v2->_invocationQueue;
  v2->_invocationQueue = (OS_dispatch_queue *)v13;

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.GameKit.GKDaemonProxy.authenticationQueue", 0);
  authenticationQueue = v2->_authenticationQueue;
  v2->_authenticationQueue = (OS_dispatch_queue *)v15;

  uint64_t v17 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.gamed" options:256];
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v17;

  [(NSXPCConnection *)v2->_connection setExportedObject:v2];
  v19 = +[GKClientInterface interface];
  [(NSXPCConnection *)v2->_connection setExportedInterface:v19];

  uint64_t v20 = +[GKDaemonInterface interface];
  [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v20];

  [(NSXPCConnection *)v2->_connection setDelegate:v2];
  [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_86];
  objc_initWeak(&location, v2);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __21__GKDaemonProxy_init__block_invoke_2;
  v38[3] = &unk_1E646EF00;
  objc_copyWeak(&v39, &location);
  [(NSXPCConnection *)v2->_connection setInterruptionHandler:v38];
  v21 = [MEMORY[0x1E4F28B50] mainBundle];
  v22 = [v21 bundleIdentifier];

  BOOL v23 = +[GKEntitledContextProvider hasAnyGameCenterEntitlement];
  v24 = os_log_GKGeneral;
  if (v23)
  {
    if (!os_log_GKGeneral)
    {
      id v25 = GKOSLoggers();
      v24 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[GKDaemonProxy init]();
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v26 = GKOSLoggers();
    }
    v27 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKDaemonProxy init].cold.6(v27);
    }
    int v28 = GKApplicationLinkedOnOrAfter(1114112, 917504);
    id v29 = os_log_GKGeneral;
    if (v28)
    {
      if (!os_log_GKGeneral) {
        id v30 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        -[GKDaemonProxy init].cold.4();
      }
      int v31 = [v22 hasPrefix:@"com.apple."];
      v32 = os_log_GKGeneral;
      if (!v31)
      {
        if (!os_log_GKGeneral)
        {
          id v37 = GKOSLoggers();
          v32 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[GKDaemonProxy init]();
        }
        char v35 = 0;
        goto LABEL_28;
      }
      if (!os_log_GKGeneral)
      {
        id v33 = GKOSLoggers();
        v32 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[GKDaemonProxy init]();
      }
    }
    else
    {
      if (!os_log_GKGeneral)
      {
        id v34 = GKOSLoggers();
        id v29 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[GKDaemonProxy init].cold.5();
      }
    }
  }
  char v35 = 1;
LABEL_28:
  [(NSXPCConnection *)v2->_connection resume];
  if ((v35 & 1) == 0) {
    [(NSXPCConnection *)v2->_connection invalidate];
  }
  [(GKDaemonProxy *)v2 buildInterfaceLookup];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  return v2;
}

- (void)buildInterfaceLookup
{
  id v23 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  v3 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v3 toLookup:v23];

  id v4 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v4 toLookup:v23];

  id v5 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v5 toLookup:v23];

  id v6 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v6 toLookup:v23];

  id v7 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v7 toLookup:v23];

  uint64_t v8 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v8 toLookup:v23];

  id v9 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v9 toLookup:v23];

  dispatch_semaphore_t v10 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v10 toLookup:v23];

  uint64_t v11 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v11 toLookup:v23];

  uint64_t v12 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v12 toLookup:v23];

  dispatch_queue_t v13 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v13 toLookup:v23];

  v14 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v14 toLookup:v23];

  dispatch_queue_t v15 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v15 toLookup:v23];

  long long v16 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v16 toLookup:v23];

  uint64_t v17 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v17 toLookup:v23];

  long long v18 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v18 toLookup:v23];

  v19 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v19 toLookup:v23];

  uint64_t v20 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v20 toLookup:v23];

  v21 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v21 toLookup:v23];

  v22 = +[GKServiceInterface interface];
  [(GKDaemonProxy *)self addInterface:v22 toLookup:v23];

  [(GKDaemonProxy *)self setInterfaceLookup:v23];
}

- (void)setInterfaceLookup:(id)a3
{
}

+ (void)getActiveFriendRequestCount:(id)a3
{
  id v3 = a3;
  id v4 = +[GKDaemonProxy daemonProxy];
  id v5 = [v4 friendServicePrivate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__GKDaemonProxy_getActiveFriendRequestCount___block_invoke;
  v7[3] = &unk_1E646DCF0;
  id v8 = v3;
  id v6 = v3;
  [v5 getCombinedFriendInvitationListWithCompletion:v7];
}

+ (GKDaemonProxy)daemonProxy
{
  if (daemonProxy_onceToken != -1) {
    dispatch_once(&daemonProxy_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)daemonProxy_sDaemonProxy;

  return (GKDaemonProxy *)v2;
}

+ (id)proxiesForPlayer
{
  if (proxiesForPlayer_once != -1) {
    dispatch_once(&proxiesForPlayer_once, &__block_literal_global_9_1);
  }
  v2 = (void *)proxiesForPlayer_proxies;

  return v2;
}

uint64_t __33__GKDaemonProxy_proxiesForPlayer__block_invoke()
{
  proxiesForPlayer_proxies = [[GKThreadsafeDictionary alloc] initWithName:@"com.apple.gamecenter.per-player-daemonproxies"];

  return MEMORY[0x1F41817F8]();
}

+ (void)removeProxyForPlayer:(id)a3
{
  id v6 = [a3 internal];
  id v3 = [v6 playerID];

  if (v3)
  {
    id v4 = [v6 playerID];
    id v5 = +[GKDaemonProxy proxiesForPlayer];
    [v5 removeObjectForKey:v4];
  }
}

+ (id)proxyForPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [a1 daemonProxy];
  id v6 = [v4 internal];

  id v7 = [v6 playerID];

  if (v7)
  {
    id v8 = [v6 playerID];
  }
  else
  {

    id v6 = 0;
    id v8 = @"<no associated player>";
  }
  id v9 = +[GKDaemonProxy proxiesForPlayer];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __32__GKDaemonProxy_proxyForPlayer___block_invoke;
  v14[3] = &unk_1E64703A0;
  id v15 = v5;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = [v9 objectForKeyWillReplace:v8 objectProducerBlock:v14];

  return v12;
}

GKServiceProxy *__32__GKDaemonProxy_proxyForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3
    && ([v3 baseProxy],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = *(void **)(a1 + 32),
        v5,
        v5 == v6))
  {
    id v7 = v4;
  }
  else
  {
    id v7 = [[GKServiceProxy alloc] initWithPlayer:*(void *)(a1 + 40)];
    [(GKServiceProxy *)v7 setLocalPlayer:*(void *)(a1 + 40)];
    [(GKServiceProxy *)v7 setBaseProxy:*(void *)(a1 + 32)];
  }

  return v7;
}

+ (GKServiceProxy)proxyForLocalPlayer
{
  v2 = +[GKLocalPlayer localPlayer];
  id v3 = +[GKDaemonProxy proxyForPlayer:v2];

  return (GKServiceProxy *)v3;
}

- (id)matchmaker
{
  return +[GKMatchmaker sharedMatchmaker];
}

+ (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = GKOSLoggers();
    id v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_DEBUG, "GKDaemonProxy - received URL from %@ (%@) : %@", (uint8_t *)&v14, 0x20u);
    if (!v7) {
      goto LABEL_8;
    }
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  uint64_t v12 = +[GKDaemonProxy daemonProxy];
  dispatch_queue_t v13 = [v12[11] remoteObjectProxyWithErrorHandler:&__block_literal_global_23];

  if (v13) {
    [v13 messagesDidReceiveGameCenterURL:v7 senderHandle:v8 contactID:v9];
  }

LABEL_8:
}

void __72__GKDaemonProxy_messagesDidReceiveGameCenterURL_senderHandle_contactID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __72__GKDaemonProxy_messagesDidReceiveGameCenterURL_senderHandle_contactID___block_invoke_cold_1();
    }
  }
}

+ (void)messagesDidReceiveGameCenterURL:(id)a3
{
}

- (void)_resetServiceLookup
{
  id v3 = dispatch_get_current_queue();
  id v4 = [(GKServiceProxy *)self baseProxy];
  id v5 = [v4 invocationQueue];

  if (v3 != v5)
  {
    id v6 = NSString;
    label = dispatch_queue_get_label(v3);
    id v8 = [(GKServiceProxy *)self baseProxy];
    id v9 = [v8 invocationQueue];
    id v10 = dispatch_queue_get_label(v9);
    id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v12 = [v6 stringWithFormat:@"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKDaemonProxy _resetServiceLookup]", label, v10, v11];
    dispatch_queue_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = [v6 stringWithFormat:@"%@ (_actualCurrentQueue == self.baseProxy.invocationQueue)\n[%s (%s:%d)]", v12, "-[GKDaemonProxy _resetServiceLookup]", objc_msgSend(v14, "UTF8String"), 201];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v15 format];
  }

  __int16 v16 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v17 = GKOSLoggers();
    __int16 v16 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "Resetting service lookup", buf, 2u);
  }
  [(GKServiceProxy *)self setServiceGeneration:[(GKServiceProxy *)self serviceGeneration] + 1];
  [(GKServiceProxy *)self setServiceLookup:0];
}

- (void)resetServiceLookup
{
  id v3 = [(GKServiceProxy *)self baseProxy];
  id v4 = [v3 invocationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__GKDaemonProxy_resetServiceLookup__block_invoke;
  block[3] = &unk_1E646D7F0;
  void block[4] = self;
  dispatch_barrier_async(v4, block);
}

uint64_t __35__GKDaemonProxy_resetServiceLookup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetServiceLookup];
}

- (void)setHostPID:(int)a3
{
  if (self->_hostPID != a3)
  {
    invocationQueue = self->_invocationQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __28__GKDaemonProxy_setHostPID___block_invoke;
    v4[3] = &unk_1E64703C8;
    v4[4] = self;
    int v5 = a3;
    dispatch_barrier_async(invocationQueue, v4);
  }
}

void __28__GKDaemonProxy_setHostPID___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v3 = GKOSLoggers();
    id v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
    int v5 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109376;
    int v17 = v4;
    __int16 v18 = 1024;
    int v19 = v5;
    _os_log_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_INFO, "Changing the host PID from %d to %d", buf, 0xEu);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 48) = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) _resetServiceLookup];
  CFAbsoluteTimeGetCurrent();
  id v6 = [*(id *)(*(void *)(a1 + 32) + 88) remoteObjectProxyWithErrorHandler:&__block_literal_global_65];
  if (v6)
  {
    id v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v8 = GKOSLoggers();
      id v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "Setting host PID", buf, 2u);
    }
    id v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 32) + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__GKDaemonProxy_setHostPID___block_invoke_66;
    v14[3] = &unk_1E646D7F0;
    id v11 = v9;
    id v15 = v11;
    [v6 setHostPID:v10 reply:v14];
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    dispatch_queue_t v13 = (void *)os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
      __28__GKDaemonProxy_setHostPID___block_invoke_cold_1(v13);
    }
  }
}

void __28__GKDaemonProxy_setHostPID___block_invoke_63(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __28__GKDaemonProxy_setHostPID___block_invoke_63_cold_1();
    }
  }
}

void __28__GKDaemonProxy_setHostPID___block_invoke_66(uint64_t a1)
{
}

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  invocationQueue = self->_invocationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke;
  v15[3] = &unk_1E646D9F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_barrier_async(invocationQueue, v15);
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetServiceLookup];
  dispatch_group_t v2 = dispatch_group_create();
  CFAbsoluteTimeGetCurrent();
  id v3 = *(void **)(*(void *)(a1 + 32) + 88);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2;
  v17[3] = &unk_1E646DB08;
  int v4 = v2;
  id v18 = v4;
  int v5 = [v3 remoteObjectProxyWithErrorHandler:v17];
  if (v5)
  {
    id v6 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v7 = GKOSLoggers();
      id v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Setting test game", buf, 2u);
    }
    dispatch_group_enter(v4);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_68;
    v13[3] = &unk_1E646EE10;
    id v15 = *(id *)(a1 + 56);
    id v10 = v4;
    id v14 = v10;
    [v5 setTestGame:v8 protocolVersion:v9 reply:v13];
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    id v12 = (void *)os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
      __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_cold_1(v12);
    }
  }
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
    __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

void __21__GKDaemonProxy_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetServiceLookup];
}

- (id)authenticatedPlayerID
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__10;
  id v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 403, "-[GKDaemonProxy authenticatedPlayerID]");
  id v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__GKDaemonProxy_authenticatedPlayerID__block_invoke;
  v7[3] = &unk_1E6470418;
  void v7[4] = self;
  v7[5] = &v8;
  [v4 perform:v7];
  [v4 wait];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void __38__GKDaemonProxy_authenticatedPlayerID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_2;
  v12[3] = &unk_1E646E098;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_3;
  v9[3] = &unk_1E64703F0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 getAuthenticatedPlayerIDWithHandler:v9];
}

uint64_t __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accountName
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  id v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 422, "-[GKDaemonProxy accountName]");
  id v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__GKDaemonProxy_accountName__block_invoke;
  v7[3] = &unk_1E6470418;
  void v7[4] = self;
  v7[5] = &v8;
  [v4 perform:v7];
  [v4 wait];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void __28__GKDaemonProxy_accountName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__GKDaemonProxy_accountName__block_invoke_2;
  v12[3] = &unk_1E646E098;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__GKDaemonProxy_accountName__block_invoke_3;
  v9[3] = &unk_1E64703F0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 getAccountNameWithHandler:v9];
}

uint64_t __28__GKDaemonProxy_accountName__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __28__GKDaemonProxy_accountName__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasAuthenticatedAccount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 441, "-[GKDaemonProxy hasAuthenticatedAccount]");
  id v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke;
  v6[3] = &unk_1E6470418;
  v6[4] = self;
  v6[5] = &v7;
  [v4 perform:v6];
  [v4 wait];
  LOBYTE(self) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)self;
}

void __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_2;
  v12[3] = &unk_1E646E098;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_3;
  v9[3] = &unk_1E64703F0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 getAuthenticatedPlayerIDWithHandler:v9];
}

uint64_t __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)authenticatedPlayerInfo
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  id v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 460, "-[GKDaemonProxy authenticatedPlayerInfo]");
  id v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke;
  v7[3] = &unk_1E6470418;
  void v7[4] = self;
  v7[5] = &v8;
  [v4 perform:v7];
  [v4 wait];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_2;
  v12[3] = &unk_1E646E098;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_3;
  v9[3] = &unk_1E6470440;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 getAuthenticatedPlayerInfo:v9];
}

uint64_t __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)authenticatedCredential
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  id v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 479, "-[GKDaemonProxy authenticatedCredential]");
  id v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__GKDaemonProxy_authenticatedCredential__block_invoke;
  v7[3] = &unk_1E6470418;
  void v7[4] = self;
  v7[5] = &v8;
  [v4 perform:v7];
  [v4 wait];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__GKDaemonProxy_authenticatedCredential__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__GKDaemonProxy_authenticatedCredential__block_invoke_2;
  v12[3] = &unk_1E646E098;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__GKDaemonProxy_authenticatedCredential__block_invoke_3;
  v9[3] = &unk_1E6470468;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 getAuthenticatedPlayerCredential:v9];
}

uint64_t __40__GKDaemonProxy_authenticatedCredential__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__GKDaemonProxy_authenticatedCredential__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticatedLocalPlayersWithStatus:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  authenticationQueue = self->_authenticationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke;
  block[3] = &unk_1E64704B0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(authenticationQueue, block);
}

void __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_2;
  v7[3] = &unk_1E646E098;
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_3;
  v5[3] = &unk_1E646DCF0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 getAuthenticatedLocalPlayersWithStatus:v4 handler:v5];
}

uint64_t __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 _gkMapWithBlock:&__block_literal_global_103];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

GKLocalPlayer *__64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(GKLocalPlayer);
  [(GKPlayer *)v3 setInternal:v2];

  [(GKLocalPlayer *)v3 setAuthenticated:1];

  return v3;
}

- (id)authenticatedLocalPlayersWithStatus:(unint64_t)a3
{
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 518, "-[GKDaemonProxy authenticatedLocalPlayersWithStatus:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke;
  v10[3] = &unk_1E646E7B8;
  id v11 = v6;
  unint64_t v12 = a3;
  v10[4] = self;
  id v7 = v6;
  [v7 perform:v10];
  [v7 wait];
  id v8 = [v7 result];

  return v8;
}

void __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke_2;
  v7[3] = &unk_1E646DC78;
  id v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 authenticatedLocalPlayersWithStatus:v4 completion:v7];
}

uint64_t __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResult:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)getGamedFiredUp
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 535, "-[GKDaemonProxy getGamedFiredUp]");
  uint64_t v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke;
  v8[3] = &unk_1E646D928;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  [v5 perform:v8];
  [v5 wait];
  id v6 = [v5 objectForKeyedSubscript:@"message"];

  return v6;
}

void __32__GKDaemonProxy_getGamedFiredUp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke_2;
  block[3] = &unk_1E646E578;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v8 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __32__GKDaemonProxy_getGamedFiredUp__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke_3;
  v7[3] = &unk_1E646E098;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke_4;
  v4[3] = &unk_1E646E5F0;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 getGamedFiredUpWithHandler:v4];
}

uint64_t __32__GKDaemonProxy_getGamedFiredUp__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __32__GKDaemonProxy_getGamedFiredUp__block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"message"];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)getAccountNameWithHandler:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = [NSString stringWithFormat:@"getAccountNameWithHandler: should not be called on GKDaemonProxy, use accountName instead"];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKDaemonProxy getAccountNameWithHandler:]", objc_msgSend(v6, "UTF8String"), 624];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
}

- (void)getAuthenticatedPlayerIDWithHandler:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = [NSString stringWithFormat:@"getAuthenticatedPlayerIDWithHandler: should not be called on GKDaemonProxy, use authenticedPlayerID instead"];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKDaemonProxy getAuthenticatedPlayerIDWithHandler:]", objc_msgSend(v6, "UTF8String"), 629];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
}

- (void)removeDataUpdateDelegate:(id)a3
{
}

- (void)beginNetworkActivity
{
  id v2 = [(GKDaemonProxy *)self networkActivityIndicatorDelegate];
  [v2 beginNetworkActivity];
}

- (void)endNetworkActivity
{
  id v2 = [(GKDaemonProxy *)self networkActivityIndicatorDelegate];
  [v2 endNetworkActivity];
}

- (void)resetNetworkActivity
{
  id v2 = [(GKDaemonProxy *)self networkActivityIndicatorDelegate];
  [v2 resetNetworkActivity];
}

- (void)setPreferencesValues:(id)a3
{
  id v3 = a3;
  id v4 = +[GKPreferences shared];
  [v4 setOverrideValues:v3];
}

- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__GKDaemonProxy_setCurrentGame_serverEnvironment_reply___block_invoke;
  block[3] = &unk_1E64704B0;
  id v13 = v8;
  int64_t v14 = a4;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__GKDaemonProxy_setCurrentGame_serverEnvironment_reply___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  char v3 = [v2 _gkIsAnyOverlayUI];

  if ((v3 & 1) == 0) {
    +[GKGame setCurrentGameFromInternal:a1[4] serverEnvironment:a1[6]];
  }
  id v4 = *(uint64_t (**)(void))(a1[5] + 16);

  return v4();
}

- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__GKDaemonProxy_authenticatedPlayersDidChange_authenticatingBundleID_reply___block_invoke;
  v11[3] = &unk_1E646E198;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  +[GKLocalPlayer authenticatedLocalPlayersDidChange:a3 complete:v11];
}

uint64_t __76__GKDaemonProxy_authenticatedPlayersDidChange_authenticatingBundleID_reply___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"com.apple.GameCenterUI.GameCenterHostingContainer"] & 1) != 0
    || [MEMORY[0x1E4F28B50] _gkBundleIdentifierIsAnyOverlayUI:*(void *)(a1 + 32)])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess];
    char v3 = +[GKLocalPlayer local];
    char v4 = objc_opt_respondsToSelector();

    id v5 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v6 = GKOSLoggers();
      id v5 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = NSNumber;
      id v9 = v5;
      id v10 = [v8 numberWithBool:v2];
      id v11 = [NSNumber numberWithBool:v4 & 1];
      int v14 = 138412802;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      int v19 = v11;
      _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "authenticatedPlayersDidChange - player authenticated from %@ (GC system process? %@, update local player? %@)", (uint8_t *)&v14, 0x20u);
    }
    if (!(v2 & 1 | ((v4 & 1) == 0)))
    {
      id v12 = +[GKLocalPlayer local];
      [v12 authenticationDidCompleteWithError:0 signInOrigin:6];
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)respondedToNearbyInvite:(id)a3
{
  id v4 = a3;
  id v5 = [(GKDaemonProxy *)self matchmaker];
  [v5 localPlayerRespondedToNearbyInvite:v4];
}

- (void)metricsValuesChanged
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"GKMetricsValuesChangedNotification" object:self];
}

- (void)friendRequestSelected:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKDaemonProxy *)self dataUpdateDelegate];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(GKDaemonProxy *)self dataUpdateDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__GKDaemonProxy_friendRequestSelected___block_invoke;
      block[3] = &unk_1E646EC80;
      void block[4] = self;
      id v23 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(NSHashTable *)self->_dataUpdateDelegates _gkSafeCopy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    id v13 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __39__GKDaemonProxy_friendRequestSelected___block_invoke_2;
          v16[3] = &unk_1E646EC80;
          v16[4] = v15;
          id v17 = v4;
          dispatch_async(v13, v16);
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }
}

void __39__GKDaemonProxy_friendRequestSelected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataUpdateDelegate];
  [v2 friendRequestSelected:*(void *)(a1 + 40)];
}

uint64_t __39__GKDaemonProxy_friendRequestSelected___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) friendRequestSelected:*(void *)(a1 + 40)];
}

- (void)receivedChallengeSelected:(id)a3
{
  id v3 = a3;
  id v4 = +[GKChallengeEventHandler challengeEventHandler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__GKDaemonProxy_receivedChallengeSelected___block_invoke;
  v7[3] = &unk_1E646EC80;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __43__GKDaemonProxy_receivedChallengeSelected___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 receivedChallengeSelected:*(void *)(a1 + 40)];
  }
  id v5 = +[GKLocalPlayer localPlayer];
  id v3 = +[GKChallenge challengeForInternalRepresentation:*(void *)(a1 + 40)];
  id v4 = [v5 eventEmitter];
  [v4 player:v5 wantsToPlayChallenge:v3];
}

- (void)dispatchCompletedChallenge:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer localPlayer];
  id v5 = [v3 receivingPlayer];
  int v6 = [v5 isEqual:0];

  if (v6)
  {
    uint64_t v7 = [v3 receivingPlayer];
    id v8 = +[GKPlayer canonicalizedPlayerForInternal:v7];

    id v9 = v4;
  }
  else
  {
    id v8 = v4;
    uint64_t v10 = [v3 receivingPlayer];
    id v9 = +[GKPlayer canonicalizedPlayerForInternal:v10];
  }
  uint64_t v11 = +[GKChallenge challengeForInternalRepresentation:v3];
  if ([v8 isEqual:v4])
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke;
    v26[3] = &unk_1E646F558;
    uint64_t v12 = &v27;
    id v13 = &v28;
    id v27 = v4;
    int v28 = v11;
    uint64_t v14 = &v29;
    id v15 = v9;
    id v29 = v15;
    id v16 = v11;
    id v17 = v26;
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    long long v21 = __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke_2;
    v22 = &unk_1E646F558;
    uint64_t v12 = &v23;
    id v13 = &v24;
    id v23 = v4;
    v24 = v11;
    uint64_t v14 = &v25;
    id v15 = v8;
    id v25 = v15;
    id v18 = v11;
    id v17 = &v19;
  }
  objc_msgSend(v15, "updateScopedIDs:", v17, v19, v20, v21, v22);
}

void __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventEmitter];
  [v2 player:*(void *)(a1 + 32) didCompleteChallenge:*(void *)(a1 + 40) issuedByFriend:*(void *)(a1 + 48)];
}

void __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventEmitter];
  [v2 player:*(void *)(a1 + 32) issuedChallengeWasCompleted:*(void *)(a1 + 40) byFriend:*(void *)(a1 + 48)];
}

- (void)completedChallengeSelected:(id)a3
{
  id v4 = a3;
  id v5 = +[GKChallengeEventHandler challengeEventHandler];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GKDaemonProxy_completedChallengeSelected___block_invoke;
  block[3] = &unk_1E646F558;
  id v9 = v5;
  id v10 = v4;
  uint64_t v11 = self;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__GKDaemonProxy_completedChallengeSelected___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    [v2 completedChallengeSelected:a1[5]];
  }
  uint64_t v4 = a1[5];
  id v3 = (void *)a1[6];

  return [v3 dispatchCompletedChallenge:v4];
}

- (void)challengeReceived:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[GKChallengeEventHandler challengeEventHandler];
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "Told by gamed we received a challenge %@, telling the handler %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__GKDaemonProxy_challengeReceived___block_invoke;
  v9[3] = &unk_1E646EC80;
  id v10 = v4;
  id v11 = v3;
  id v7 = v3;
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __35__GKDaemonProxy_challengeReceived___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 challengeReceived:*(void *)(a1 + 40)];
  }
  id v5 = +[GKLocalPlayer localPlayer];
  id v3 = +[GKChallenge challengeForInternalRepresentation:*(void *)(a1 + 40)];
  uint64_t v4 = [v5 eventEmitter];
  [v4 player:v5 didReceiveChallenge:v3];
}

- (void)challengeCompleted:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[GKChallengeEventHandler challengeEventHandler];
  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Told by gamed we completed a challenge %@, telling the handler %@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__GKDaemonProxy_challengeCompleted___block_invoke;
  block[3] = &unk_1E646F558;
  id v11 = v5;
  id v12 = v4;
  id v13 = self;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __36__GKDaemonProxy_challengeCompleted___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    [v2 challengeCompleted:a1[5]];
  }
  uint64_t v4 = a1[5];
  id v3 = (void *)a1[6];

  return [v3 dispatchCompletedChallenge:v4];
}

- (void)fetchTurnBasedData
{
  id v2 = +[GKLocalPlayer localPlayer];
  [v2 fetchTurnBasedEvent];
}

- (void)acceptMultiplayerGameInvite
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GKDaemonProxy_acceptMultiplayerGameInvite__block_invoke;
  block[3] = &unk_1E646D7F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__GKDaemonProxy_acceptMultiplayerGameInvite__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) matchmaker];
  [v2 localPlayerAcceptedGameInvite];

  id v3 = [*(id *)(a1 + 32) matchmaker];
  [v3 lookForInvite];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = +[GKLocalPlayer localPlayer];
  [v5 postNotificationName:@"GKAcceptedGameInvite" object:v4];
}

- (void)acceptInviteWithNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer localPlayer];
  [v4 inviteeAcceptedGameInviteWithNotification:v3];
}

- (void)declineInviteWithNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer localPlayer];
  [v4 inviteeDeclinedGameInviteWithNotification:v3];
}

- (void)updateInviteWithNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer localPlayer];
  [v4 inviteeUpdateGameInviteWithNotification:v3];
}

- (void)cancelInviteWithNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer localPlayer];
  [v4 cancelInviteWithNotification:v3];
}

- (void)cancelGameInvite:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer localPlayer];
  [v4 cancelGameInvite:v3];
}

- (void)presentBannerWithNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[GKLocalPlayer local];
  [v4 presentBannerWithNotification:v3];
}

- (void)relayPushNotification:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:@"GKRelayPushNotification" object:0 userInfo:v4];
}

- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v6 = [(GKDaemonProxy *)self userInfoForPlayerID:a3 deviceID:a4 data:0 discoveryInfo:a5];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"GKNearbyPlayerFoundNotification" object:0 userInfo:v6];
}

- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4
{
  id v5 = [(GKDaemonProxy *)self userInfoForPlayerID:a3 deviceID:a4 data:0 discoveryInfo:0];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"GKNearbyPlayerLostNotification" object:0 userInfo:v5];
}

- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v6 = [(GKDaemonProxy *)self userInfoForPlayerID:a3 deviceID:a4 data:a5 discoveryInfo:0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"GKNearbyDataReceivedNotification" object:0 userInfo:v6];
}

- (id)userInfoForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5 discoveryInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v14 = v13;
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"playerID"];
  }
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"deviceID"];
  }
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:@"data"];
  }
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:@"discoveryInfo"];
  }

  return v14;
}

- (void)didConnectToParticipantWithID:(id)a3
{
}

- (void)didDisconnectFromParticipantWithID:(id)a3
{
}

- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6
{
}

- (id)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  if (v6 && v7)
  {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDaemonProxy.m", 958, "-[GKDaemonProxy localizedMessageFromDictionary:forBundleID:]");
    id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke;
    v14[3] = &unk_1E64704D8;
    void v14[4] = self;
    id v15 = v6;
    id v16 = v8;
    id v17 = &v18;
    [v11 perform:v14];
    [v11 wait];

    id v9 = (void *)v19[5];
  }
  id v12 = v9;
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1[4] + 88);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2;
  v14[3] = &unk_1E646E098;
  id v5 = v3;
  id v15 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v14];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_145;
  v11[3] = &unk_1E64703F0;
  uint64_t v9 = a1[7];
  id v12 = v5;
  uint64_t v13 = v9;
  id v10 = v5;
  [v6 localizedMessageFromDictionary:v7 forBundleID:v8 handler:v11];
}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_145(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadRemoteImageDataForClientForURL:(id)a3 reply:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_147];
  uint64_t v8 = v7;
  if (v7) {
    [v7 loadRemoteImageDataForURL:v9 reply:v6];
  }
}

void __58__GKDaemonProxy_loadRemoteImageDataForClientForURL_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __58__GKDaemonProxy_loadRemoteImageDataForClientForURL_reply___block_invoke_cold_1();
    }
  }
}

- (void)resetLoginCancelCount
{
  invocationQueue = self->_invocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__GKDaemonProxy_resetLoginCancelCount__block_invoke;
  block[3] = &unk_1E646D7F0;
  void block[4] = self;
  dispatch_barrier_async(invocationQueue, block);
}

void __38__GKDaemonProxy_resetLoginCancelCount__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 88) remoteObjectProxyWithErrorHandler:&__block_literal_global_149];
  if (v1)
  {
    id v2 = v1;
    [v1 resetLoginCancelCount];
    v1 = v2;
  }
}

void __38__GKDaemonProxy_resetLoginCancelCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __38__GKDaemonProxy_resetLoginCancelCount__block_invoke_2_cold_1();
    }
  }
}

- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(GKDaemonProxy *)self dataUpdateDelegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(GKDaemonProxy *)self dataUpdateDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(GKDaemonProxy *)self dataUpdateDelegate];
      [v11 setBadgeCount:a3 forType:a4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [(NSHashTable *)self->_dataUpdateDelegates _gkSafeCopy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 setBadgeCount:a3 forType:a4];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    uint64_t v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = v7;
    char v10 = GKRefreshDataTypeAsString(v4);
    *(_DWORD *)buf = 138412546;
    v32 = v10;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "GKRefreshContents - received for dataType: %@ userInfo: %@", buf, 0x16u);
  }
  uint64_t v11 = [(GKDaemonProxy *)self dataUpdateDelegate];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [(GKDaemonProxy *)self dataUpdateDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__GKDaemonProxy_refreshContentsForDataType_userInfo___block_invoke;
      block[3] = &unk_1E646F380;
      void block[4] = self;
      int v29 = v4;
      id v28 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [(NSHashTable *)self->_dataUpdateDelegates _gkSafeCopy];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector()) {
          [v20 refreshContentsForDataType:v4 userInfo:v6];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v17);
  }

  long long v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v22 = GKRefreshDataTypeAsString(v4);
  [v21 postNotificationName:v22 object:self userInfo:v6];
}

void __53__GKDaemonProxy_refreshContentsForDataType_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataUpdateDelegate];
  [v2 refreshContentsForDataType:*(unsigned int *)(a1 + 48) userInfo:*(void *)(a1 + 40)];
}

- (void)requestSandboxExtension:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void *))a3;
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundlePath];

  id v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = GKOSLoggers();
    id v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    char v14 = v5;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "daemon requested sandbox extension for: %@", (uint8_t *)&v13, 0xCu);
  }
  id v8 = v5;
  [v8 UTF8String];
  uint64_t v9 = sandbox_extension_issue_file();
  if (v9)
  {
    char v10 = (void *)v9;
    uint64_t v11 = [NSString stringWithUTF8String:v9];
    v3[2](v3, v11);

    free(v10);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      -[GKDaemonProxy requestSandboxExtension:]();
    }
  }
}

uint64_t __46__GKDaemonProxy_replyQueueForRequestSelector___block_invoke()
{
  replyQueueForRequestSelector__sPrivateQueue = (uint64_t)dispatch_queue_create("com.apple.GameKit.GKDaemonProxy.privateQueue", MEMORY[0x1E4F14430]);

  return MEMORY[0x1F41817F8]();
}

- (void)setInvocationQueue:(id)a3
{
}

- (OS_dispatch_queue)authenticationQueue
{
  return self->_authenticationQueue;
}

- (void)setAuthenticationQueue:(id)a3
{
}

- (void)setConcurrentRequestSemaphore:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (GKDaemonProxyNetworkActivityIndicatorDelegate)networkActivityIndicatorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkActivityIndicatorDelegate);

  return (GKDaemonProxyNetworkActivityIndicatorDelegate *)WeakRetained;
}

- (void)setNetworkActivityIndicatorDelegate:(id)a3
{
}

- (GKDaemonProxyDataUpdateDelegate)dataUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataUpdateDelegate);

  return (GKDaemonProxyDataUpdateDelegate *)WeakRetained;
}

- (void)setDataUpdateDelegate:(id)a3
{
}

- (NSHashTable)dataUpdateDelegates
{
  return self->_dataUpdateDelegates;
}

- (void)setDataUpdateDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUpdateDelegates, 0);
  objc_destroyWeak((id *)&self->_dataUpdateDelegate);
  objc_destroyWeak((id *)&self->_networkActivityIndicatorDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_interfaceLookup, 0);
  objc_storeStrong((id *)&self->_concurrentRequestSemaphore, 0);
  objc_storeStrong((id *)&self->_authenticationQueue, 0);

  objc_storeStrong((id *)&self->_invocationQueue, 0);
}

void __72__GKDaemonProxy_messagesDidReceiveGameCenterURL_senderHandle_contactID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKDaemonProxy->messagesDidReceiveGameCenterURL: error while getting the remoteObjectProxyWithErrorHandler:%@", v2, v3, v4, v5, v6);
}

void __28__GKDaemonProxy_setHostPID___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __28__GKDaemonProxy_setHostPID___block_invoke_63_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKDaemonProxy->setHostPID: error while getting the remoteObjectProxyWithErrorHandler:%@", v2, v3, v4, v5, v6);
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_13(&dword_1C2D22000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKDaemonProxy->setTestGame: error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
}

- (void)init
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "ERROR: The Game Center entitlement is required to use GameKit. To avoid failing App Store Review, follow these instructions:\nhttps://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_game-center", v1, 2u);
}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKDaemonProxy->localizedMessageFromDictionary:forBundleID: error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
}

void __58__GKDaemonProxy_loadRemoteImageDataForClientForURL_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKDaemonProxy->loadRemoteImageDataForClientForURL:reply: error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
}

void __38__GKDaemonProxy_resetLoginCancelCount__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "GKDaemonProxy->resetLoginCancelCount error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
}

- (void)requestSandboxExtension:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "failed to create sandbox extension for %@", v2, v3, v4, v5, v6);
}

@end