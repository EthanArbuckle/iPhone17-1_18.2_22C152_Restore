@interface MOSuggestionsUIServerManager
+ (id)getConnectionIdentifier:(id)a3;
+ (id)getRemoteProcessIdentifier:(id)a3;
+ (id)sharedInstance;
- (BOOL)addConnection:(id)a3 withId:(id)a4;
- (BOOL)isClientVisibleFor:(id)a3;
- (BOOL)isConnectingProcessAuthorized:(id)a3;
- (BOOL)isVisibleClient:(id)a3;
- (MOSuggestionsUIServerManager)init;
- (id)getAnyVisibleClientId;
- (id)getClientBundleIdentifierFor:(id)a3;
- (id)getClientConnectionPropertiesFor:(id)a3;
- (id)getClientIdentifierFor:(id)a3;
- (id)getClientProxyFor:(id)a3;
- (id)getClientRemoteProcessFor:(id)a3;
- (id)getConnectionHostId:(id)a3;
- (id)getConnectionPropertiesForId:(id)a3;
- (id)getPropertiesForConnection:(id)a3;
- (void)cancelSheet:(id)a3;
- (void)dealloc;
- (void)destroyScene:(id)a3;
- (void)didConnectToSecureWindowWithSession:(id)a3 connectionId:(id)a4 delegate:(id)a5;
- (void)didDisonnectToSecureWindowForConnectionId:(id)a3;
- (void)fetchAssets:(id)a3 withTypes:(id)a4 completion:(id)a5;
- (void)fetchAssets:(id)a3 withTypes:(id)a4 onAssetsCallback:(id)a5;
- (void)getProxyFor:(id)a3 withBlock:(id)a4;
- (void)grantSandboxAccessFor:(id)a3 sender:(id)a4;
- (void)launch;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)onLockNotification;
- (void)performTask:(unint64_t)a3 suggestion:(id)a4 sender:(id)a5;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)registerForLayoutMonitorForBackgroundStateNotifications;
- (void)registerForLockNotifications;
- (void)removeConnection:(id)a3;
- (void)removeConnectionId:(id)a3;
- (void)requestNotificationAuthIfNeeded;
- (void)requestPickerForSceneIdentiyToken:(id)a3 withOptions:(id)a4;
- (void)sendSuggestionSheetStateUpdate:(unint64_t)a3 sender:(id)a4;
- (void)setupListener;
- (void)showBlankComposeView:(id)a3;
- (void)terminate;
- (void)updatePickerState:(id)a3 animated:(id)a4;
@end

@implementation MOSuggestionsUIServerManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__MOSuggestionsUIServerManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

uint64_t __46__MOSuggestionsUIServerManager_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_opt_new();

  return _objc_release_x1();
}

+ (id)getRemoteProcessIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 valueForEntitlement:@"application-identifier"];
    v6 = v5;
    if ((!v5 || ![(__CFString *)v5 length])
      && ([v4 bundleIdentifier],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          (v6 = (__CFString *)v7) == 0)
      || ![(__CFString *)v6 length])
    {

      v6 = &stru_100229C18;
    }
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%u", v6, [v4 pid]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getConnectionIdentifier:(id)a3
{
  return [a3 userInfo];
}

- (MOSuggestionsUIServerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MOSuggestionsUIServerManager;
  v2 = [(MOSuggestionsUIServerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    connectionProperties = v2->_connectionProperties;
    v2->_connectionProperties = (NSMutableDictionary *)v5;

    [(MOSuggestionsUIServerManager *)v2 setupListener];
    [(MOSuggestionsUIServerManager *)v2 registerForLockNotifications];
    [(MOSuggestionsUIServerManager *)v2 requestNotificationAuthIfNeeded];
    [(MOSuggestionsUIServerManager *)v2 registerForLayoutMonitorForBackgroundStateNotifications];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidate connection listener", buf, 2u);
  }

  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  [(FBSDisplayLayoutMonitor *)self->_displayMonitor invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MOSuggestionsUIServerManager;
  [(MOSuggestionsUIServerManager *)&v4 dealloc];
}

- (void)didConnectToSecureWindowWithSession:(id)a3 connectionId:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [v9 UUIDString];
      int v24 = 138412290;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Connected to window, client connection: %@", (uint8_t *)&v24, 0xCu);
    }
    v13 = [(NSMutableDictionary *)self->_connectionProperties objectForKeyedSubscript:v9];
    v14 = v13;
    if (v13)
    {
      [v13 setActivationState:3];
      [v14 setSession:v8];
      [v14 setDelegate:v10];
      v15 = [v14 pendingPresentationOptions];

      if (v15)
      {
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Fulfilling previously unfulfillable presentation request", (uint8_t *)&v24, 2u);
        }

        v17 = [v14 delegate];
        v18 = [v14 pendingPresentationOptions];
        [v17 didReceivePresentationRequestWithOptions:v18];
      }
      else
      {
        v20 = [v14 unfulfilledUpdateState];

        if (!v20)
        {
LABEL_19:
          [v14 setPendingPresentationOptions:0];
          [v14 setUnfulfilledUpdateState:0];
          [v14 setUnfulfilledUpdateIsAnimated:0];
          goto LABEL_20;
        }
        v21 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Fulfilling previously unfulfillable update request", (uint8_t *)&v24, 2u);
        }

        v17 = [v14 delegate];
        v18 = [v14 unfulfilledUpdateState];
        uint64_t v22 = [v18 unsignedIntValue];
        v23 = [v14 unfulfilledUpdateIsAnimated];
        [v17 didReceiveUpdateRequestWithState:v22 animated:[v23 BOOLValue]];
      }
      goto LABEL_19;
    }
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionsUIServerManager didConnectToSecureWindowWithSession:connectionId:delegate:]();
    }

    [(MOSuggestionsUIServerManager *)self destroyScene:v8];
  }
  else
  {
    [(MOSuggestionsUIServerManager *)self destroyScene:v8];
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[MOSuggestionsUIServerManager didConnectToSecureWindowWithSession:connectionId:delegate:]();
    }
  }
LABEL_20:
}

- (void)didDisonnectToSecureWindowForConnectionId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 UUIDString];
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Disconnected from window.", buf, 0xCu);
    }
    v6 = [(NSMutableDictionary *)self->_connectionProperties objectForKeyedSubscript:v4];
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v10 = [v4 UUIDString];
        *(_DWORD *)buf = 138412290;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ Connection state clean-up.", buf, 0xCu);
      }
      v11 = [v6 session];
      [(MOSuggestionsUIServerManager *)self destroyScene:v11];

      id v9 = objc_opt_new();
      v12 = [v6 connectionHost];
      [v9 setConnectionHost:v12];

      v13 = [v6 responseQueue];
      [v9 setResponseQueue:v13];

      v14 = [v6 delegate];
      [v9 setDelegate:v14];

      [(NSMutableDictionary *)self->_connectionProperties setObject:v9 forKeyedSubscript:v4];
      v15 = [v9 responseQueue];
      if (v15)
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke;
        block[3] = &unk_10021F528;
        objc_copyWeak(&v19, (id *)buf);
        id v17 = v4;
        dispatch_queue_t v18 = v15;
        dispatch_async(v18, block);

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[MOSuggestionsUIServerManager didDisonnectToSecureWindowForConnectionId:]();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[MOSuggestionsUIServerManager didDisonnectToSecureWindowForConnectionId:]();
  }
}

void __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained getConnectionHostId:*(void *)(a1 + 32)];
  uint64_t v5 = [v4 remoteTarget];

  [v5 didReceiveStateUpdateRequest:&off_10022B640];
  v6 = *(NSObject **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke_181;
  v7[3] = &unk_10021F500;
  objc_copyWeak(&v9, v2);
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v9);
}

void __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke_181(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeConnectionId:*(void *)(a1 + 32)];
}

- (void)onLockNotification
{
  int v3 = SBSGetScreenLockStatus();
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screen locked - terminating for view security", buf, 2u);
    }

    connectionProperties = self->_connectionProperties;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __50__MOSuggestionsUIServerManager_onLockNotification__block_invoke;
    v7[3] = &unk_10021F590;
    void v7[4] = self;
    [(NSMutableDictionary *)connectionProperties enumerateKeysAndObjectsUsingBlock:v7];
    [(FBSDisplayLayoutMonitor *)self->_displayMonitor invalidate];
    exit(0);
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screen locked false positive - ignored queued event", buf, 2u);
  }
}

void __50__MOSuggestionsUIServerManager_onLockNotification__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = [a3 delegate];
  [v3 getProxyFor:v4 withBlock:&__block_literal_global];
}

void __50__MOSuggestionsUIServerManager_onLockNotification__block_invoke_2(id a1, MOSuggestionsUIClient *a2)
{
}

- (void)registerForLayoutMonitorForBackgroundStateNotifications
{
  id v5 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v5 setTransitionHandler:&__block_literal_global_187];
  int v3 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v5];
  displayMonitor = self->_displayMonitor;
  self->_displayMonitor = v3;
}

void __87__MOSuggestionsUIServerManager_registerForLayoutMonitorForBackgroundStateNotifications__block_invoke(id a1, FBSDisplayLayoutMonitor *a2, FBSDisplayLayout *a3, FBSDisplayLayoutTransitionContext *a4)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(FBSDisplayLayout *)a3 elements];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = SBSDisplayLayoutElementAppSwitcherIdentifier;
    uint64_t v9 = SBSDisplayLayoutElementHomeScreenIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 identifier];
        if ([v12 isEqualToString:v8])
        {
        }
        else
        {
          v13 = [v11 identifier];
          unsigned int v14 = [v13 isEqualToString:v9];

          if (!v14) {
            continue;
          }
        }
        v15 = +[NSNotificationCenter defaultCenter];
        [v15 postNotificationName:@"MOSuggestionSheetVideoPlaybackViewPlaybackShouldPause" object:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)registerForLockNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)checkLockedState_bounce, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)requestNotificationAuthIfNeeded
{
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "onboardingStatus=%lu", (uint8_t *)&v3, 0xCu);
}

void __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke_cold_1(v3);
  }

  if (![v3 authorizationStatus]
    && (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Authorization TCC prompt not yet sent and onboarding status >= getStarted", v6, 2u);
    }

    [*(id *)(a1 + 32) requestAuthorizationWithOptions:7 completionHandler:&__block_literal_global_201];
  }
}

void __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke_198(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Request notification authorization complete. granted=%u, error=%@", (uint8_t *)v6, 0x12u);
  }
}

- (void)setupListener
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __45__MOSuggestionsUIServerManager_setupListener__block_invoke;
  v9[3] = &unk_10021F660;
  v9[4] = self;
  BOOL v3 = +[BSServiceConnectionListener listenerWithConfigurator:v9];
  [v3 activate];
  connectionListener = self->_connectionListener;
  self->_connectionListener = (BSServiceConnectionListener *)v3;
  id v5 = v3;

  id v6 = +[FBProcessManager sharedInstance];

  [v6 addObserver:self];
  __int16 v7 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Endpoint ready and awaiting connections", v8, 2u);
  }
}

void __45__MOSuggestionsUIServerManager_setupListener__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.moments.ui-services"];
  [v3 setService:@"com.apple.moments.ui-services.presenter"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (listener_didReceiveConnection_withContext__onceToken != -1) {
    dispatch_once(&listener_didReceiveConnection_withContext__onceToken, &__block_literal_global_213);
  }
  v11 = [v9 remoteProcess];
  unsigned int v12 = [v11 pid];
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v35) = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Endpoint received new connection request -- pid:%d", buf, 8u);
  }

  objc_initWeak(&location, self);
  if ([(MOSuggestionsUIServerManager *)self isConnectingProcessAuthorized:v11])
  {
    unsigned int v14 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:]();
    }

    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_279;
    v29 = &unk_10021F730;
    v30 = self;
    id v15 = (id)objc_opt_new();
    id v31 = v15;
    objc_copyWeak(&v32, &location);
    [v9 configureConnection:&v26];
    id v16 = objc_loadWeakRetained(&location);
    unsigned int v17 = [v16 addConnection:v9 withId:v15, v26, v27, v28, v29, v30];

    if (v17)
    {
      long long v18 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v24 = [v9 remoteProcess];
        v25 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v24];
        *(_DWORD *)buf = 138412546;
        id v35 = v15;
        __int16 v36 = 2112;
        v37 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Activating connection: client:%@, id:%@", buf, 0x16u);
      }
      [v9 activate];
    }
    else
    {
      v20 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [v9 remoteProcess];
        uint64_t v22 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v21];
        -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:](v22, (uint64_t)buf, v20, v21);
      }

      [v9 invalidate];
    }
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:]();
    }

    objc_destroyWeak(&v32);
  }
  else
  {
    long long v19 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:].cold.4();
    }

    [v9 invalidate];
  }
  objc_destroyWeak(&location);
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke(id a1)
{
  id v5 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.moments.ui-services.presenter"];
  v1 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___MOSuggestionsUIServer];
  [v5 setServer:v1];

  uint64_t v2 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___MOSuggestionsUIClient];
  [v5 setClient:v2];

  [v5 setClientMessagingExpectation:1];
  id v3 = [v5 copy];
  uint64_t v4 = (void *)listener_didReceiveConnection_withContext____interface;
  listener_didReceiveConnection_withContext____interface = (uint64_t)v3;
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_279(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetQueue:&_dispatch_main_q];
  uint64_t v4 = +[BSServiceQuality userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:listener_didReceiveConnection_withContext____interface];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setUserInfo:*(void *)(a1 + 40)];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_10021F6C8;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  [v3 setInvalidationHandler:v10];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  __int16 v7 = __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_283;
  id v8 = &unk_10021F6C8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  [v3 setInterruptionHandler:&v5];
  [v3 setActivationHandler:&__block_literal_global_286 v5, v6, v7, v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeConnection:v3];
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_283_cold_1((uint64_t)v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeConnection:v3];
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_284(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_284_cold_1((uint64_t)v2);
  }
}

- (BOOL)isConnectingProcessAuthorized:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueForEntitlement:@"com.apple.developer.journal.allow"];
  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v3 bundleIdentifier];
      *(_DWORD *)buf = 138412802;
      int v24 = v6;
      __int16 v25 = 1024;
      unsigned int v26 = [v3 pid];
      __int16 v27 = 2112;
      v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection BundleID=%@ pid=%d API entitlements=%@", buf, 0x1Cu);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "isEqualToString:", @"suggestions", (void)v18))
          {

            unsigned __int8 v16 = 1;
            goto LABEL_17;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  unsigned int v12 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v3 bundleIdentifier];
    unsigned int v14 = [v3 pid];
    id v15 = [v3 valueForEntitlement:@"com.apple.moments.allowSuggestions"];
    *(_DWORD *)buf = 138412802;
    int v24 = v13;
    __int16 v25 = 1024;
    unsigned int v26 = v14;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connection BundleID=%@ pid=%d valueFor=%@", buf, 0x1Cu);
  }
  unsigned __int8 v16 = [v3 hasEntitlement:@"com.apple.moments.allowSuggestions"];
LABEL_17:

  return v16;
}

- (BOOL)addConnection:(id)a3 withId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 remoteProcess];
  id v9 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v8];

  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || v7 == 0;
  BOOL v12 = !v11;
  if (v11)
  {
    unsigned int v26 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionsUIServerManager addConnection:withId:]();
    }
  }
  else
  {
    v13 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v9];

    if (!v13)
    {
      unsigned int v14 = objc_opt_new();
      [(NSMutableDictionary *)self->_clientConnections setObject:v14 forKeyedSubscript:v9];
    }
    id v15 = objc_opt_new();
    [v15 setConnectionHost:v6];
    unsigned __int8 v16 = [v6 remoteProcess];
    id v17 = [v16 bundleIdentifier];

    if (!v17) {
      id v17 = v9;
    }
    long long v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);

    id v20 = +[NSString stringWithFormat:@"RSP:%@", v17];
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], v19);
    [v15 setResponseQueue:v21];

    uint64_t v22 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v9];
    [v22 addObject:v7];

    [(NSMutableDictionary *)self->_connectionProperties setObject:v15 forKeyedSubscript:v7];
    v23 = +[MOApprovedApplicationsManager sharedInstance];
    int v24 = [v6 remoteProcess];
    __int16 v25 = [v24 bundleIdentifier];
    [v23 registerApplicationsForDataAccess:v25];
  }
  return v12;
}

- (void)destroyScene:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      *(_DWORD *)buf = 138412290;
      BOOL v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(destroyScene) destroying scene %@", buf, 0xCu);
    }
    id v6 = +[UIApplication sharedApplication];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __45__MOSuggestionsUIServerManager_destroyScene___block_invoke;
    v7[3] = &unk_10021F758;
    id v8 = v3;
    [v6 requestSceneSessionDestruction:v8 options:0 errorHandler:v7];
  }
}

void __45__MOSuggestionsUIServerManager_destroyScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__MOSuggestionsUIServerManager_destroyScene___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) description];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(destroyScene) Successfully destroyed scene %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)removeConnectionId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_connectionProperties objectForKeyedSubscript:v4];
    if (v5)
    {
      id v6 = [(MOSuggestionsUIServerManager *)self getConnectionHostId:v4];
      [v6 invalidate];

      int v7 = [v5 session];
      [(MOSuggestionsUIServerManager *)self destroyScene:v7];

      [(NSMutableDictionary *)self->_connectionProperties removeObjectForKey:v4];
      id v8 = [v5 connectionHost];
      id v9 = [v8 remoteProcess];
      BOOL v10 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v9];

      if (v10)
      {
        BOOL v11 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v4;
          __int16 v27 = 2112;
          v28 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection '%@' removed for '%@'", buf, 0x16u);
        }

        BOOL v12 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v10];
        [v12 removeObject:v4];

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v13 = self->_clientConnections;
        id v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v21;
LABEL_8:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v17), (void)v20);
            id v19 = [v18 count];

            if (v19) {
              break;
            }
            if (v15 == (id)++v17)
            {
              id v15 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v15) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
    }
  }
}

- (void)removeConnection:(id)a3
{
  id v4 = +[MOSuggestionsUIServerManager getConnectionIdentifier:a3];
  [(MOSuggestionsUIServerManager *)self removeConnectionId:v4];
}

- (id)getPropertiesForConnection:(id)a3
{
  id v4 = +[MOSuggestionsUIServerManager getConnectionIdentifier:a3];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_connectionProperties objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isVisibleClient:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 pid]);
    id v17 = 0;
    id v6 = +[RBSProcessHandle handleForIdentifier:v5 error:&v17];
    id v7 = v17;

    id v8 = [v6 currentState];
    unsigned int v9 = [v8 taskState];

    BOOL v10 = [v6 currentState];
    BOOL v11 = [v10 endowmentNamespaces];
    unsigned int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];

    v13 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v4];
      *(_DWORD *)buf = 138413058;
      id v19 = v16;
      __int16 v20 = 1024;
      unsigned int v21 = v12;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 1024;
      BOOL v25 = v9 == 4;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Query client %@ visible=%u (error=%@) isRunning=%u", buf, 0x22u);
    }
    if (v9 == 4) {
      BOOL v14 = v12;
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)getConnectionHostId:(id)a3
{
  if (a3)
  {
    id v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:");
    id v4 = [v3 connectionHost];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)getConnectionPropertiesForId:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)getAnyVisibleClientId
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_connectionProperties;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v9 = -[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", v8, (void)v14);
        BOOL v10 = [v9 remoteProcess];
        unsigned __int8 v11 = [(MOSuggestionsUIServerManager *)self isVisibleClient:v10];

        if (v11)
        {
          id v12 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)getClientConnectionPropertiesFor:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy_;
  long long v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  connectionProperties = self->_connectionProperties;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __65__MOSuggestionsUIServerManager_getClientConnectionPropertiesFor___block_invoke;
  v9[3] = &unk_10021F780;
  id v6 = v4;
  id v10 = v6;
  unsigned __int8 v11 = &v12;
  [(NSMutableDictionary *)connectionProperties enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__MOSuggestionsUIServerManager_getClientConnectionPropertiesFor___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = [v9 delegate];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)getClientRemoteProcessFor:(id)a3
{
  if (a3)
  {
    uint64_t v3 = -[MOSuggestionsUIServerManager getClientConnectionPropertiesFor:](self, "getClientConnectionPropertiesFor:");
    id v4 = [v3 connectionHost];
    id v5 = [v4 remoteProcess];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)getClientIdentifierFor:(id)a3
{
  uint64_t v3 = [(MOSuggestionsUIServerManager *)self getClientRemoteProcessFor:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 bundleIdentifier];
    if (!v5)
    {
      id v5 = [v4 valueForEntitlement:@"application-identifier"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)getClientBundleIdentifierFor:(id)a3
{
  uint64_t v3 = [(MOSuggestionsUIServerManager *)self getClientRemoteProcessFor:a3];
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestionsUIServerManager getClientBundleIdentifierFor:](v3);
  }

  id v5 = [v3 bundleIdentifier];

  return v5;
}

- (id)getClientProxyFor:(id)a3
{
  id v4 = a3;
  id v5 = [(MOSuggestionsUIServerManager *)self getClientConnectionPropertiesFor:v4];
  id v6 = [v5 connectionHost];
  id v7 = [v6 remoteTarget];

  if (!v7)
  {
    if (v5 && ([v5 brokenPipeState] & 1) == 0)
    {
      id v8 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MOSuggestionsUIServerManager getClientProxyFor:]();
      }

      [v5 setBrokenPipeState:1];
    }
    [v4 didReceiveUpdateRequestWithState:0 animated:1];
  }
  if (v5 && [v5 brokenPipeState])
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Remote proxy target restored", v11, 2u);
    }

    [v5 setBrokenPipeState:0];
  }

  return v7;
}

- (void)getProxyFor:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOSuggestionsUIServerManager *)self getClientConnectionPropertiesFor:v6];
  id v9 = [v8 responseQueue];
  if (v9)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __54__MOSuggestionsUIServerManager_getProxyFor_withBlock___block_invoke;
    v11[3] = &unk_10021F7A8;
    objc_copyWeak(&v14, &location);
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else if (v8)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionsUIServerManager getProxyFor:withBlock:](v8, v10);
    }
  }
}

void __54__MOSuggestionsUIServerManager_getProxyFor_withBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained getClientProxyFor:*(void *)(a1 + 32)];

  uint64_t v3 = v4;
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v3 = v4;
  }
}

- (BOOL)isClientVisibleFor:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestionsUIServerManager isClientVisibleFor:]();
  }

  id v6 = +[MOOnboardingManager sharedInstance];
  unint64_t v7 = (unint64_t)[v6 onboardingFlowCompletionStatus];

  if (v7 > 4 || ((1 << v7) & 0x13) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = self->_connectionProperties;
    id v12 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v17 = -[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", v16, (void)v23);
          long long v18 = [v17 remoteProcess];
          unsigned __int8 v19 = [(MOSuggestionsUIServerManager *)self isVisibleClient:v18];

          if (v19)
          {
            unsigned __int8 v10 = v16 != 0;
            goto LABEL_10;
          }
        }
        id v13 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    __int16 v20 = [(MOSuggestionsUIServerManager *)self getClientConnectionPropertiesFor:v4];
    id v9 = v20;
    if (v20)
    {
      unsigned int v21 = [(NSMutableDictionary *)v20 connectionHost];
      __int16 v22 = [v21 remoteProcess];
      unsigned __int8 v10 = [(MOSuggestionsUIServerManager *)self isVisibleClient:v22];

      goto LABEL_10;
    }
  }
  else
  {
    _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    id v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_DEBUG)) {
      -[MOSuggestionsUIServerManager isClientVisibleFor:]();
    }
  }
  unsigned __int8 v10 = 0;
LABEL_10:

  return v10;
}

- (void)requestPickerForSceneIdentiyToken:(id)a3 withOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[BSServiceConnection currentContext];
  unsigned __int8 v10 = +[MOSuggestionsUIServerManager getConnectionIdentifier:v9];

  unsigned __int8 v11 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:]();
  }

  id v12 = +[BSServiceConnection currentContext];
  id v13 = [(MOSuggestionsUIServerManager *)self getPropertiesForConnection:v12];

  if (!v13)
  {
    uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:]();
    }

    long long v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MOSuggestionsUIServerManager.m" lineNumber:650 description:@"unexpected picker request from untracked connection (in %s:%d)", "-[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:]", 650];
  }
  uint64_t v16 = [v13 sceneIdentityToken];

  if (v16)
  {
    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:](v13, v17);
    }
  }
  else
  {
    [v13 setSceneIdentityToken:v7];
    [v13 setActivationState:2];
    long long v18 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v19 = [v7 stringRepresentation];
      *(_DWORD *)buf = 138412290;
      v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Activating new scene with token=%@", buf, 0xCu);
    }
    id v17 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.MomentsUIService.clientContext"];
    CFStringRef v35 = @"connectionId";
    __int16 v36 = v10;
    __int16 v20 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v17 setUserInfo:v20];

    unsigned int v21 = [v17 userInfo];
    __int16 v22 = [v21 allKeys];
    long long v23 = +[NSSet setWithArray:v22];
    [v17 setRequiredUserInfoKeys:v23];

    long long v24 = objc_opt_new();
    id v25 = [objc_alloc((Class)_UIWindowSceneOverlayPlacement) initWithTargetSceneIdentity:v7];
    [v24 setPlacement:v25];
    long long v26 = +[UIApplication sharedApplication];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke;
    v33[3] = &unk_10021F758;
    id v34 = v13;
    [v26 requestSceneSessionActivation:0 userActivity:v17 options:v24 errorHandler:v33];
  }
  __int16 v27 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [v13 sceneIdentityToken];
    v29 = [v28 stringRepresentation];
    *(_DWORD *)buf = 138412290;
    v38 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received picker presentation request with token=%@", buf, 0xCu);
  }
  v30 = [v13 session];

  if (v30)
  {
    id v31 = [v13 delegate];
    [v31 didReceivePresentationRequestWithOptions:v8];
  }
  else
  {
    id v32 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "View is not ready to accept presentations.", buf, 2u);
    }

    id v31 = [v8 copy];
    [v13 setPendingPresentationOptions:v31];
  }
}

void __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setSceneIdentityToken:0];
    [*(id *)(a1 + 32) setActivationState:0];
    id v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke_cold_1();
    }
  }
}

- (void)updatePickerState:(id)a3 animated:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[BSServiceConnection currentContext];
  unsigned __int8 v10 = [(MOSuggestionsUIServerManager *)self getPropertiesForConnection:v9];

  if (!v10)
  {
    unsigned __int8 v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionsUIServerManager updatePickerState:animated:]();
    }

    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MOSuggestionsUIServerManager.m" lineNumber:694 description:@"unexpected picker request from untracked connection (in %s:%d)", "-[MOSuggestionsUIServerManager updatePickerState:animated:]", 694];
  }
  id v13 = [v10 session];

  if (v13)
  {
    id v14 = [v10 delegate];
    [v14 didReceiveUpdateRequestWithState:[v7 unsignedIntValue] animated:[v8 BOOLValue]];
  }
  else
  {
    id v15 = [v10 activationState];
    uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    id v17 = v16;
    if (v15 == (id)2)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MOSuggestionsUIServerManager updatePickerState:animated:]();
      }

      id v18 = [v7 copy];
      [v10 setUnfulfilledUpdateState:v18];

      id v14 = [v8 copy];
      [v10 setUnfulfilledUpdateIsAnimated:v14];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[MOSuggestionsUIServerManager updatePickerState:animated:]();
      }

      unsigned __int8 v19 = [v10 delegate];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __59__MOSuggestionsUIServerManager_updatePickerState_animated___block_invoke;
      v20[3] = &unk_10021F7D0;
      id v21 = v10;
      [(MOSuggestionsUIServerManager *)self getProxyFor:v19 withBlock:v20];

      id v14 = v21;
    }
  }
}

void __59__MOSuggestionsUIServerManager_updatePickerState_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 currentViewState]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 didReceiveStateUpdateRequest:v4];
}

- (void)launch
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Called angel launch specifically", v3, 2u);
  }
}

- (void)terminate
{
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Terminating Angel connection", v8, 2u);
  }

  id v4 = +[BSServiceConnection currentContext];
  id v5 = [(MOSuggestionsUIServerManager *)self getPropertiesForConnection:v4];

  id v6 = [v5 connectionHost];
  [v6 invalidate];

  id v7 = +[BSServiceConnection currentContext];
  [(MOSuggestionsUIServerManager *)self removeConnection:v7];
}

- (void)fetchAssets:(id)a3 withTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v11 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 suggestionIdentifier];
    id v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138412290;
    long long v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(Legacy) server, fetching suggestion assets for suggestion id=%@", buf, 0xCu);
  }
  id v14 = +[BSServiceConnection currentContext];
  id v15 = [(MOSuggestionsUIServerManager *)self getPropertiesForConnection:v14];

  uint64_t v16 = [v15 delegate];
  id v17 = [v10 requestedTypes];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __65__MOSuggestionsUIServerManager_fetchAssets_withTypes_completion___block_invoke;
  v20[3] = &unk_10021F7F8;
  id v21 = v8;
  id v22 = v9;
  id v18 = v9;
  id v19 = v8;
  [v16 willReturnAssetsForSuggestion:v19 withTypes:v17 completion:v20];
}

void __65__MOSuggestionsUIServerManager_fetchAssets_withTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) baseBundle];
    id v6 = [v5 bundleIdentifier];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetchAssets:withTypes:completion completing with assets for suggestion: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [v3 copy];

  (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0);
}

- (void)fetchAssets:(id)a3 withTypes:(id)a4 onAssetsCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v11 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 suggestionIdentifier];
    id v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138412290;
    long long v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, " server, fetching suggestion assets for suggestion id=%@", buf, 0xCu);
  }
  id v14 = +[BSServiceConnection currentContext];
  id v15 = [(MOSuggestionsUIServerManager *)self getPropertiesForConnection:v14];

  uint64_t v16 = [v15 delegate];
  id v17 = [v10 requestedTypes];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __71__MOSuggestionsUIServerManager_fetchAssets_withTypes_onAssetsCallback___block_invoke;
  v20[3] = &unk_10021F820;
  id v21 = v8;
  id v22 = v9;
  id v18 = v9;
  id v19 = v8;
  [v16 willReturnAssetsForSuggestion:v19 withTypes:v17 onAssetsCallback:v20];
}

void __71__MOSuggestionsUIServerManager_fetchAssets_withTypes_onAssetsCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) baseBundle];
    id v6 = [v5 bundleIdentifier];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetchAssets:withTypes:onAssetsCallback completing with assets for suggestion: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = objc_opt_new();
  id v8 = [v3 copy];

  [v7 setAssets:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelSheet:(id)a3
{
}

void __44__MOSuggestionsUIServerManager_cancelSheet___block_invoke(id a1, MOSuggestionsUIClient *a2)
{
}

- (void)showBlankComposeView:(id)a3
{
}

void __53__MOSuggestionsUIServerManager_showBlankComposeView___block_invoke(id a1, MOSuggestionsUIClient *a2)
{
}

- (void)performTask:(unint64_t)a3 suggestion:(id)a4 sender:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke;
  v9[3] = &unk_10021F888;
  id v10 = a4;
  unint64_t v11 = a3;
  id v8 = v10;
  [(MOSuggestionsUIServerManager *)self getProxyFor:a5 withBlock:v9];
}

void __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke_cold_1(a1);
  }

  id v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v3 performTask:v5 suggestion:*(void *)(a1 + 32)];
}

- (void)sendSuggestionSheetStateUpdate:(unint64_t)a3 sender:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MOSuggestionsUIServerManager *)self getClientConnectionPropertiesFor:v6];
  if ([v7 currentViewState] != (id)a3)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[MOSuggestionsUIServerManager sendSuggestionSheetStateUpdate:sender:](a3, v8);
    }

    int v9 = +[NSNumber numberWithUnsignedInteger:a3];
    [v7 setCurrentViewState:a3];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __70__MOSuggestionsUIServerManager_sendSuggestionSheetStateUpdate_sender___block_invoke;
    v11[3] = &unk_10021F7D0;
    id v12 = v9;
    id v10 = v9;
    [(MOSuggestionsUIServerManager *)self getProxyFor:v6 withBlock:v11];
  }
}

id __70__MOSuggestionsUIServerManager_sendSuggestionSheetStateUpdate_sender___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didReceiveStateUpdateRequest:*(void *)(a1 + 32)];
}

- (void)grantSandboxAccessFor:(id)a3 sender:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 path];
  [v7 fileSystemRepresentation];
  uint64_t v8 = sandbox_extension_issue_file();
  if (v8)
  {
    int v9 = (void *)v8;
    id v10 = +[NSString stringWithUTF8String:v8];
    free(v9);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __61__MOSuggestionsUIServerManager_grantSandboxAccessFor_sender___block_invoke;
    v12[3] = &unk_10021F7D0;
    id v13 = v10;
    id v11 = v10;
    [(MOSuggestionsUIServerManager *)self getProxyFor:v6 withBlock:v12];
  }
}

id __61__MOSuggestionsUIServerManager_grantSandboxAccessFor_sender___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didGrantSandboxAccessFor:*(void *)(a1 + 32)];
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_connectionProperties;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        id v12 = [v11 remoteProcess];

        if (v12)
        {
          unsigned int v13 = [v5 pid];
          if (v13 == [v12 pid])
          {
            id v14 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v12];
              *(_DWORD *)buf = 138412290;
              id v21 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client process has ended id=%@", buf, 0xCu);
            }
            goto LABEL_14;
          }
        }
      }
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionProperties, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (void)didConnectToSecureWindowWithSession:connectionId:delegate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Could not link new scene to client connection", v1, 2u);
}

- (void)didConnectToSecureWindowWithSession:connectionId:delegate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Could not link new scene, client connection missing", v2, v3, v4, v5, v6);
}

- (void)didDisonnectToSecureWindowForConnectionId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Secure window disconnection from nil connection, ignoring.)", v2, v3, v4, v5, v6);
}

- (void)didDisonnectToSecureWindowForConnectionId:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Disconnected from secure window after client dropped", v2, v3, v4, v5, v6);
}

void __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke_cold_1(void *a1)
{
  [a1 authorizationStatus];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v1, v2, "UNNotificationSettings auth status=%lu", v3, v4, v5, v6, v7);
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Activating Connection", v2, v3, v4, v5, v6);
}

- (void)listener:(NSObject *)a3 didReceiveConnection:(void *)a4 withContext:.cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, a3, (uint64_t)a3, "Can't add new connection, clientId:%@", (uint8_t *)a2);
}

- (void)listener:didReceiveConnection:withContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Caller is entitled ", v2, v3, v4, v5, v6);
}

- (void)listener:didReceiveConnection:withContext:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "'%{public}@' is not entitled!", v2);
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = +[MOSuggestionsUIServerManager getConnectionIdentifier:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Connection invalid - %@", v4, v5, v6, v7, v8);
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_283_cold_1(uint64_t a1)
{
  uint64_t v1 = +[MOSuggestionsUIServerManager getConnectionIdentifier:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Connection interrupted - %@", v4, v5, v6, v7, v8);
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_284_cold_1(uint64_t a1)
{
  uint64_t v1 = +[MOSuggestionsUIServerManager getConnectionIdentifier:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Connection active - %@", v4, v5, v6, v7, v8);
}

- (void)addConnection:withId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Can't add connection: Can't get proper client identity", v2, v3, v4, v5, v6);
}

void __45__MOSuggestionsUIServerManager_destroyScene___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "(destroyScene) Error de-activating scene: %@", v2);
}

- (void)getClientBundleIdentifierFor:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Remote bundle identifier: %@", v4, v5, v6, v7, v8);
}

- (void)getClientProxyFor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Lost remote proxy target", v2, v3, v4, v5, v6);
}

- (void)getProxyFor:(void *)a1 withBlock:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 connectionHost];
  uint64_t v4 = [v3 remoteProcess];
  uint64_t v5 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v4];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, a2, v6, "Can't send message to %@", v7);
}

- (void)isClientVisibleFor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Rejecting clients visibility due onboarding status", v2, v3, v4, v5, v6);
}

- (void)isClientVisibleFor:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "MOSuggestionsUIServerManager:clientsVisible:", v2, v3, v4, v5, v6);
}

- (void)requestPickerForSceneIdentiyToken:(void *)a1 withOptions:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  unsigned int v4 = [a1 activationState];
  uint64_t v5 = [a1 session];
  CFStringRef v6 = @"Y";
  if (!v5) {
    CFStringRef v6 = @"N";
  }
  v7[0] = 67109378;
  v7[1] = v4;
  __int16 v8 = 2112;
  CFStringRef v9 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "client activation = %u, session=%@", (uint8_t *)v7, 0x12u);
}

- (void)requestPickerForSceneIdentiyToken:withOptions:.cold.2()
{
  OUTLINED_FUNCTION_7();
  int v2 = 650;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "unexpected picker request from untracked connection (in %s:%d)", v1, 0x12u);
}

- (void)requestPickerForSceneIdentiyToken:withOptions:.cold.3()
{
  os_log_t v0 = +[BSServiceConnection currentContext];
  uint64_t v1 = [v0 remoteProcess];
  __int16 v8 = +[MOSuggestionsUIServerManager getRemoteProcessIdentifier:v1];
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v2, v3, "requestPickerForSceneIdentiyToken from %@-%@", v4, v5, v6, v7, 2u);
}

void __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "Error activating scene: %@", v2);
}

- (void)updatePickerState:animated:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "View is getting ready to accept updates.", v2, v3, v4, v5, v6);
}

- (void)updatePickerState:animated:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "View is out of sync, updating client", v2, v3, v4, v5, v6);
}

- (void)updatePickerState:animated:.cold.3()
{
  OUTLINED_FUNCTION_7();
  int v2 = 694;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "unexpected picker request from untracked connection (in %s:%d)", v1, 0x12u);
}

void __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) baseBundle];
  __int16 v8 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v2, v3, "server, requesting client to perform task %lu for suggestion %@", v4, v5, v6, v7, 2u);
}

- (void)sendSuggestionSheetStateUpdate:(int)a1 sender:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "server, acknowledging state transition to %d", (uint8_t *)v2, 8u);
}

@end