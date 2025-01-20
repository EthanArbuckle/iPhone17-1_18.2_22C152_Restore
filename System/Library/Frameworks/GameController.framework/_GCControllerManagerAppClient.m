@interface _GCControllerManagerAppClient
+ (id)serviceFor:(id)a3 client:(id)a4;
- (BOOL)_containsPublishedController:(id)a3;
- (GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface)adaptiveTriggersXPCProxyServiceRemoteServer;
- (GCBatteryXPCProxyServiceRemoteServerInterface)batteryXPCProxyServiceRemoteServer;
- (GCGameIntentXPCProxyServiceRemoteServerInterface)gameIntentXPCProxyServiceRemoteServer;
- (GCLightXPCProxyServiceRemoteServerInterface)lightXPCProxyServiceRemoteServer;
- (GCMotionXPCProxyServiceRemoteServerInterface)motionXPCProxyServiceRemoteServer;
- (GCPlayerIndicatorXPCProxyServiceRemoteServerInterface)playerIndicatorXPCProxyServiceRemoteServer;
- (GCSettingsXPCProxyServiceRemoteServerInterface)settingsXPCProxyServiceRemoteServer;
- (GCSystemGestureXPCProxyServiceRemoteServerInterface)systemGestureXPCProxyServiceRemoteServer;
- (_GCControllerManagerAppClient)init;
- (_GCIPCEndpointConnection)adaptiveTriggersXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)batteryXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)gameIntentXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)lightXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)motionXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)playerIndicatorXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)settingsXPCProxyServiceConnection;
- (_GCIPCEndpointConnection)systemGestureXPCProxyServiceConnection;
- (id)_mostRecentlyActiveControllerIgnoring:(id)a3;
- (id)_mostRecentlyActiveExtendedGamepadIgnoring:(id)a3;
- (id)_mostRecentlyActiveMicroGamepadIgnoring:(id)a3;
- (id)controllers;
- (id)currentController;
- (id)currentExtendedGamepad;
- (id)currentMicroGamepad;
- (id)serviceClientForIPCService:(id)a3;
- (void)CBApplicationDidBecomeActive;
- (void)CBApplicationWillResignActive;
- (void)_connectToDaemon;
- (void)_onqueue_addPendingController:(id)a3;
- (void)_onqueue_publishController:(id)a3;
- (void)_onqueue_publishCustomController:(id)a3;
- (void)_onqueue_refreshPublishedControllers;
- (void)_onqueue_unpublishController:(id)a3;
- (void)_onqueue_unpublishCustomController:(id)a3;
- (void)_resumeDaemonConnection;
- (void)_setCurrentController:(id)a3;
- (void)_setCurrentExtendedGamepad:(id)a3;
- (void)_setCurrentMicroGamepad:(id)a3;
- (void)dealloc;
- (void)finalizeRecording;
- (void)observerDeliveryPolicyDidChange:(id)a3;
- (void)onHIDServiceAdded:(id)a3;
- (void)onHIDServiceRemoved:(id)a3;
- (void)onScreenshotTriggeredWithController:(id)a3;
- (void)onVideoRecordingToggledWithController:(id)a3 mode:(int64_t)a4;
- (void)open;
- (void)publishControllers:(id)a3;
- (void)refreshControllers;
- (void)setCurrentController:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4 forHIDServiceClientWithRegistryID:(id)a5;
- (void)startBuffering;
- (void)startVideoRecording;
- (void)startVideoRecordingBuffering;
- (void)stopBuffering;
- (void)stopVideoRecordingBuffering;
- (void)stopVideoRecordingWithClipBuffering:(BOOL)a3 controller:(id)a4;
- (void)unpublishControllersWithIdentifiers:(id)a3;
- (void)updateCurrentControllerAndProfileForUnpublishedController:(id)a3;
- (void)updateEmulatedControllerEnabled;
@end

@implementation _GCControllerManagerAppClient

- (_GCControllerManagerAppClient)init
{
  v21.receiver = self;
  v21.super_class = (Class)_GCControllerManagerAppClient;
  v2 = [(_GCControllerManager *)&v21 init];
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __37___GCControllerManagerAppClient_init__block_invoke;
    block[3] = &unk_26D22A8C0;
    v4 = v2;
    v20 = v4;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
    v5 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    knownHIDServices = v4->_knownHIDServices;
    v4->_knownHIDServices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    publishedControllers = v4->_publishedControllers;
    v4->_publishedControllers = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    pendingControllers = v4->_pendingControllers;
    v4->_pendingControllers = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    serverValidControllerIdentifiers = v4->_serverValidControllerIdentifiers;
    v4->_serverValidControllerIdentifiers = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    customControllerIdentifiers = v4->_customControllerIdentifiers;
    v4->_customControllerIdentifiers = v13;

    v4->_shouldStartBufferingOnForeground = 0;
    v4->_bufferingStarted = 0;
    v15 = (BKSHIDEventDeliveryPolicyObserver *)objc_alloc_init((Class)&off_26D2CF610);
    hidEventObserver = v4->_hidEventObserver;
    v4->_hidEventObserver = v15;

    v17 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
    [(BKSHIDEventDeliveryPolicyObserver *)v4->_hidEventObserver setDeferringEnvironment:v17];

    [(BKSHIDEventDeliveryPolicyObserver *)v4->_hidEventObserver addObserver:v4];
  }
  return v3;
}

- (void)dealloc
{
  hidEventObserver = self->_hidEventObserver;
  if (hidEventObserver)
  {
    [(BKSHIDEventDeliveryPolicyObserver *)hidEventObserver removeObserver:self];
    v4 = self->_hidEventObserver;
    self->_hidEventObserver = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCControllerManagerAppClient;
  [(_GCControllerManager *)&v5 dealloc];
}

+ (id)serviceFor:(id)a3 client:(id)a4
{
  if (&unk_26D291B80 == a3)
  {
    v4 = +[GCAnalytics instance];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)open
{
  v7.receiver = self;
  v7.super_class = (Class)_GCControllerManagerAppClient;
  [(_GCControllerManager *)&v7 open];
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __37___GCControllerManagerAppClient_open__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_220998000, "Connect To Game Controller Daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v3 = currentProcessBundleIdentifier();
    char v4 = [v3 isEqualToString:@"com.apple.Preferences"];

    if ((v4 & 1) == 0)
    {
      objc_super v5 = +[_GCUIInteractionCompatibilityManager sharedInstance];
      [v5 setEnabled:1];
    }
  }
  SetupVirtualGameControllerIfForced();
  +[GCFrameworkInitialization controllerManagerDidOpen];
}

- (void)finalizeRecording
{
  v2 = objc_opt_new();
  [v2 resume];
  v3 = [v2 remoteProxy];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __50___GCControllerManagerAppClient_finalizeRecording__block_invoke;
  v5[3] = &unk_26D22B0D0;
  id v6 = v2;
  id v4 = v2;
  [v3 moveLastRecordingToDesktop:v5];
}

- (void)_connectToDaemon
{
  if (self->_serverConnection)
  {
    if (!gc_isInternalBuild()) {
      return;
    }
    v2 = getGCLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_INFO, "Game Controller daemon connection has already been established.", buf, 2u);
    }
  }
  else
  {
    id v4 = objc_opt_new();
    [v4 setClient:self];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke;
    v11[3] = &unk_26D22A8C0;
    v11[4] = self;
    objc_super v5 = [v4 addInvalidationHandler:v11];
    id serverConnectionInvalidation = self->_serverConnectionInvalidation;
    self->_id serverConnectionInvalidation = v5;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_168;
    v10[3] = &unk_26D22A8C0;
    v10[4] = self;
    objc_super v7 = [v4 addInterruptionHandler:v10];
    id serverConnectionInterruption = self->_serverConnectionInterruption;
    self->_id serverConnectionInterruption = v7;

    serverConnection = self->_serverConnection;
    self->_serverConnection = (GCIPCOutgoingConnection *)v4;
    v2 = v4;

    [(GCIPCOutgoingConnection *)self->_serverConnection resume];
    [(_GCControllerManagerAppClient *)self _resumeDaemonConnection];
  }
}

- (void)_resumeDaemonConnection
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "resume daemon connection - begin", buf, 2u);
    }
  }
  if ([(_GCControllerManager *)self isAppInBackground])
  {
    if (gc_isInternalBuild())
    {
      id v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "resume daemon connection - app is backgrounded, deferring to app foreground", buf, 2u);
      }
    }
    self->_shouldResumeDaemonConnectionOnForeground = 1;
  }
  else
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke;
    activity_block[3] = &unk_26D22A8C0;
    activity_void block[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Controller Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_171;
    v13[3] = &unk_26D22A8C0;
    v13[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Player Indicator XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_174;
    v12[3] = &unk_26D22A8C0;
    v12[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Light XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_177;
    v11[3] = &unk_26D22A8C0;
    v11[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Adaptive Triggers XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_180;
    v10[3] = &unk_26D22A8C0;
    v10[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Motion XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_183;
    v9[3] = &unk_26D22A8C0;
    v9[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Battery XPC Proxy Service", OS_ACTIVITY_FLAG_DEFAULT, v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_186;
    v8[3] = &unk_26D22A8C0;
    v8[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Settings XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_189;
    v7[3] = &unk_26D22A8C0;
    v7[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'PhotoVideo XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_192;
    v6[3] = &unk_26D22A8C0;
    v6[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'Game Intent XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_195;
    v5[3] = &unk_26D22A8C0;
    void v5[4] = self;
    _os_activity_initiate(&dword_220998000, "Connect To 'System Gesture XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v5);
  }
}

- (void)CBApplicationDidBecomeActive
{
  v6.receiver = self;
  v6.super_class = (Class)_GCControllerManagerAppClient;
  [(_GCControllerManager *)&v6 CBApplicationDidBecomeActive];
  if (self->_shouldResumeDaemonConnectionOnForeground)
  {
    if (gc_isInternalBuild())
    {
      v3 = getGCLogger();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "app is foregrounded, executing deferred _resumeDaemonConnection", v5, 2u);
      }
    }
    [(_GCControllerManagerAppClient *)self _resumeDaemonConnection];
    self->_shouldResumeDaemonConnectionOnForeground = 0;
  }
  if (self->_shouldStartBufferingOnForeground)
  {
    if (gc_isInternalBuild())
    {
      id v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "app is foregrounded, executing deferred startBuffering", v5, 2u);
      }
    }
    if (!self->_bufferingStarted) {
      [(_GCControllerManagerAppClient *)self startBuffering];
    }
    self->_shouldStartBufferingOnForeground = 0;
  }
}

- (void)CBApplicationWillResignActive
{
  v2.receiver = self;
  v2.super_class = (Class)_GCControllerManagerAppClient;
  [(_GCControllerManager *)&v2 CBApplicationWillResignActive];
}

- (id)controllers
{
  v3 = +[NSMutableArray array];
  id v4 = [(_GCControllerManager *)self controllersQueue];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = __44___GCControllerManagerAppClient_controllers__block_invoke;
  v12 = &unk_26D22A8E8;
  id v5 = v3;
  id v13 = v5;
  v14 = self;
  dispatch_barrier_sync(v4, &v9);

  objc_super v6 = [(_GCControllerManager *)self _legacy_controllers];
  [v5 addObjectsFromArray:v6];

  id v7 = v5;
  return v7;
}

- (void)_onqueue_addPendingController:(id)a3
{
  id v9 = a3;
  id v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  objc_super v6 = [v9 identifier];
  id v7 = [(NSMutableSet *)self->_serverValidControllerIdentifiers member:v6];

  if (!v7)
  {
    v8 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v8 handleFailureInMethod:a2, self, @"GCControllerManagerApp.m", 439, @"Asked to add %@, which is not in the valid set.", v9 object file lineNumber description];
  }
  [(NSMutableSet *)self->_pendingControllers addObject:v9];
}

- (void)_onqueue_refreshPublishedControllers
{
  v3 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(NSMutableDictionary *)self->_publishedControllers allKeys];
  id v5 = +[NSSet setWithArray:v4];

  objc_super v6 = +[NSSet setWithSet:self->_serverValidControllerIdentifiers];
  id v7 = [v6 setByAddingObjectsFromSet:self->_customControllerIdentifiers];

  v35 = v5;
  v8 = objc_msgSend(v5, "gc_setByRemovingObjectsFromSet:", v7);
  publishedControllers = self->_publishedControllers;
  v34 = v8;
  uint64_t v10 = [v8 allObjects];
  v11 = +[NSNull null];
  v12 = [(NSMutableDictionary *)publishedControllers objectsForKeys:v10 notFoundMarker:v11];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        [(_GCControllerManagerAppClient *)self _onqueue_unpublishController:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v15);
  }
  v33 = v13;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)[(NSMutableSet *)self->_pendingControllers copy];
  uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v37 + 1) + 8 * v21);
        v23 = [v22 identifier];
        char v24 = [v7 containsObject:v23];

        if ((v24 & 1) == 0)
        {
          v28 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
          [v28 handleFailureInMethod:a2, self, @"GCControllerManagerApp.m", 459, @"Pending controller is not valid: %@", v22 object file lineNumber description];
        }
        v25 = self->_publishedControllers;
        v26 = [v22 identifier];
        v27 = [(NSMutableDictionary *)v25 objectForKey:v26];

        if (v27)
        {
          if ([v22 update:v27 withContext:self])
          {
            if (gc_isInternalBuild())
            {
              v29 = getGCLogger();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_debug_impl(&dword_220998000, v29, OS_LOG_TYPE_DEBUG, "Updated controller: '%@'", buf, 0xCu);
              }
            }
            [(NSMutableSet *)self->_pendingControllers removeObject:v22];
          }
        }
        else
        {
          v27 = [v22 materializeWithContext:self];
          if (v27)
          {
            if (gc_isInternalBuild())
            {
              v30 = getGCLogger();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_debug_impl(&dword_220998000, v30, OS_LOG_TYPE_DEBUG, "Materialized controller: '%@'", buf, 0xCu);
              }
            }
            [(NSMutableSet *)self->_pendingControllers removeObject:v22];
            [(_GCControllerManagerAppClient *)self _onqueue_publishController:v27];
          }
        }

        ++v21;
      }
      while (v19 != v21);
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      uint64_t v19 = v31;
    }
    while (v31);
  }
}

- (BOOL)_containsPublishedController:(id)a3
{
  publishedControllers = self->_publishedControllers;
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)publishedControllers objectForKey:v4];
  LOBYTE(publishedControllers) = v5 != 0;

  return (char)publishedControllers;
}

- (void)_onqueue_unpublishController:(id)a3
{
  id v4 = a3;
  id v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  publishedControllers = self->_publishedControllers;
  id v7 = [v4 identifier];
  [(NSMutableDictionary *)publishedControllers removeObjectForKey:v7];

  if (![(NSMutableDictionary *)self->_publishedControllers count])
  {
    v8 = +[_GCControllerManager sharedInstance];
    [v8 stopVideoRecordingBuffering];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __62___GCControllerManagerAppClient__onqueue_unpublishController___block_invoke;
  v10[3] = &unk_26D22A8E8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_onqueue_publishController:(id)a3
{
  id v4 = a3;
  id v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  publishedControllers = self->_publishedControllers;
  id v7 = [v4 identifier];
  [(NSMutableDictionary *)publishedControllers setObject:v4 forKey:v7];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __60___GCControllerManagerAppClient__onqueue_publishController___block_invoke;
  v9[3] = &unk_26D22A8E8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_onqueue_publishCustomController:(id)a3
{
  id v7 = a3;
  id v4 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v4);

  customControllerIdentifiers = self->_customControllerIdentifiers;
  objc_super v6 = [v7 identifier];
  [(NSMutableSet *)customControllerIdentifiers addObject:v6];

  [(_GCControllerManagerAppClient *)self _onqueue_publishController:v7];
}

- (void)_onqueue_unpublishCustomController:(id)a3
{
  id v7 = a3;
  id v4 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v4);

  customControllerIdentifiers = self->_customControllerIdentifiers;
  objc_super v6 = [v7 identifier];
  [(NSMutableSet *)customControllerIdentifiers removeObject:v6];

  [(_GCControllerManagerAppClient *)self _onqueue_unpublishController:v7];
}

- (void)updateEmulatedControllerEnabled
{
}

- (void)updateCurrentControllerAndProfileForUnpublishedController:(id)a3
{
  id v11 = a3;
  id v4 = [(_GCControllerManagerAppClient *)self _mostRecentlyActiveControllerIgnoring:v11];
  [(_GCControllerManagerAppClient *)self _setCurrentController:v4];

  id v5 = [v11 extendedGamepad];

  if (v5)
  {
    objc_super v6 = [v11 extendedGamepad];
    id v7 = [(_GCControllerManagerAppClient *)self _mostRecentlyActiveExtendedGamepadIgnoring:v6];
    [(_GCControllerManagerAppClient *)self setCurrentExtendedGamepad:v7];
  }
  else
  {
    id v8 = [v11 microGamepad];

    if (!v8) {
      goto LABEL_5;
    }
  }
  id v9 = [v11 microGamepad];
  id v10 = [(_GCControllerManagerAppClient *)self _mostRecentlyActiveMicroGamepadIgnoring:v9];
  [(_GCControllerManagerAppClient *)self setCurrentMicroGamepad:v10];

LABEL_5:
}

- (id)currentController
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  v3 = v2->super._currentController;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentController:(id)a3
{
  [(_GCControllerManagerAppClient *)self _setCurrentController:a3];
  id v4 = [(GCController *)self->super._currentController extendedGamepad];

  if (v4)
  {
    id v5 = [(GCController *)self->super._currentController extendedGamepad];
    [(_GCControllerManagerAppClient *)self _setCurrentExtendedGamepad:v5];
  }
  objc_super v6 = [(GCController *)self->super._currentController microGamepad];

  if (v6)
  {
    id v7 = [(GCController *)self->super._currentController microGamepad];
    [(_GCControllerManagerAppClient *)self _setCurrentMicroGamepad:v7];
  }
}

- (void)_setCurrentController:(id)a3
{
  id v5 = (GCController *)a3;
  objc_super v6 = self;
  objc_sync_enter(v6);
  p_currentController = &v6->super._currentController;
  currentController = v6->super._currentController;
  if (currentController != v5)
  {
    if (currentController)
    {
      if (gc_isInternalBuild())
      {
        id v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = *p_currentController;
          int v15 = 138412290;
          uint64_t v16 = v14;
          _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Posting GCControllerDidStopBeingCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"GCControllerDidStopBeingCurrentNotification" object:*p_currentController userInfo:0];
    }
    objc_storeStrong((id *)&v6->super._currentController, a3);
    if (gc_isInternalBuild())
    {
      id v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *p_currentController;
        int v15 = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Posting GCControllerDidBecomeCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"GCControllerDidBecomeCurrentNotification" object:*p_currentController userInfo:0];
  }
  objc_sync_exit(v6);
}

- (id)currentMicroGamepad
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  v3 = v2->super._currentMicroGamepad;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setCurrentMicroGamepad:(id)a3
{
  id v5 = (GCMicroGamepad *)a3;
  objc_super v6 = self;
  objc_sync_enter(v6);
  p_currentMicroGamepad = &v6->super._currentMicroGamepad;
  currentMicroGamepad = v6->super._currentMicroGamepad;
  if (currentMicroGamepad != v5)
  {
    if (currentMicroGamepad)
    {
      if (gc_isInternalBuild())
      {
        id v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = *p_currentMicroGamepad;
          int v15 = 138412290;
          uint64_t v16 = v14;
          _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Posting GCMicroGamepadDidStopBeingCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"GCMicroGamepadDidStopBeingCurrentNotification" object:*p_currentMicroGamepad userInfo:0];
    }
    objc_storeStrong((id *)&v6->super._currentMicroGamepad, a3);
    if (gc_isInternalBuild())
    {
      id v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *p_currentMicroGamepad;
        int v15 = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Posting GCMicroGamepadDidBecomeCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"GCMicroGamepadDidBecomeCurrentNotification" object:*p_currentMicroGamepad userInfo:0];
  }
  objc_sync_exit(v6);
}

- (id)currentExtendedGamepad
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  v3 = v2->super._currentExtendedGamepad;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setCurrentExtendedGamepad:(id)a3
{
  id v5 = (GCExtendedGamepad *)a3;
  objc_super v6 = self;
  objc_sync_enter(v6);
  p_currentExtendedGamepad = &v6->super._currentExtendedGamepad;
  currentExtendedGamepad = v6->super._currentExtendedGamepad;
  if (currentExtendedGamepad != v5)
  {
    if (currentExtendedGamepad)
    {
      if (gc_isInternalBuild())
      {
        id v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = *p_currentExtendedGamepad;
          int v15 = 138412290;
          uint64_t v16 = v14;
          _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Posting GCExtendedGamepadDidStopBeingCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"GCExtendedGamepadDidStopBeingCurrentNotification" object:*p_currentExtendedGamepad userInfo:0];
    }
    objc_storeStrong((id *)&v6->super._currentExtendedGamepad, a3);
    if (gc_isInternalBuild())
    {
      id v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *p_currentExtendedGamepad;
        int v15 = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Posting GCExtendedGamepadDidBecomeCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"GCExtendedGamepadDidBecomeCurrentNotification" object:*p_currentExtendedGamepad userInfo:0];
  }
  objc_sync_exit(v6);
}

- (id)_mostRecentlyActiveControllerIgnoring:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(_GCControllerManagerAppClient *)self controllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        if (v11 != v4)
        {
          if (v8)
          {
            v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) physicalInputProfile];
            [v12 lastEventTimestamp];
            double v14 = v13;
            int v15 = [v8 physicalInputProfile];
            [v15 lastEventTimestamp];
            double v17 = v16;

            if (v14 >= v17)
            {
              id v18 = v11;

              id v8 = v18;
            }
          }
          else
          {
            id v8 = v11;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_mostRecentlyActiveMicroGamepadIgnoring:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(_GCControllerManagerAppClient *)self controllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) microGamepad];
        v12 = v11;
        if (v11) {
          BOOL v13 = v11 == v4;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          if (v8)
          {
            [v11 lastEventTimestamp];
            double v15 = v14;
            [v8 lastEventTimestamp];
            if (v15 >= v16)
            {
              id v17 = v12;

              id v8 = v17;
            }
          }
          else
          {
            id v8 = v11;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_mostRecentlyActiveExtendedGamepadIgnoring:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(_GCControllerManagerAppClient *)self controllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) extendedGamepad];
        v12 = v11;
        if (v11) {
          BOOL v13 = v11 == v4;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          if (v8)
          {
            [v11 lastEventTimestamp];
            double v15 = v14;
            [v8 lastEventTimestamp];
            if (v15 >= v16)
            {
              id v17 = v12;

              id v8 = v17;
            }
          }
          else
          {
            id v8 = v11;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)onHIDServiceAdded:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_knownHIDServices containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_knownHIDServices addObject:v4];
    [(_GCControllerManager *)self registerIPCObject:v4];
    id v5 = [(_GCControllerManager *)self controllersQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __51___GCControllerManagerAppClient_onHIDServiceAdded___block_invoke;
    block[3] = &unk_26D22A8C0;
    void block[4] = self;
    dispatch_barrier_async(v5, block);
  }
}

- (void)onHIDServiceRemoved:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_knownHIDServices, "containsObject:")) {
    [(NSMutableSet *)self->_knownHIDServices removeObject:v4];
  }
}

- (void)setProperty:(id)a3 forKey:(id)a4 forHIDServiceClientWithRegistryID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  hidSystemClientQueue = self->super._hidSystemClientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86___GCControllerManagerAppClient_setProperty_forKey_forHIDServiceClientWithRegistryID___block_invoke;
  v15[3] = &unk_26D22C640;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(hidSystemClientQueue, v15);
}

- (void)startVideoRecording
{
  v3 = [getRPScreenRecorderClass() sharedRecorder];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __52___GCControllerManagerAppClient_startVideoRecording__block_invoke;
  v4[3] = &unk_26D22B9F0;
  v4[4] = self;
  [v3 startRecordingWithHandler:v4];
}

- (void)stopVideoRecordingWithClipBuffering:(BOOL)a3 controller:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NSBundle mainBundle];
  id v8 = [v7 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

  if (!v8)
  {
    id v9 = +[NSProcessInfo processInfo];
    id v8 = [v9 processName];
  }
  photoVideoService = self->_photoVideoService;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke;
  v12[3] = &unk_26D22C6B8;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(GCPhotoVideoXPCProxyServiceRemoteServerInterface *)photoVideoService generateURLFor:v8 withReply:v12];
}

- (void)startBuffering
{
  if (!self->_bufferingStartPending)
  {
    self->_bufferingStartPending = 1;
    v3 = [getRPScreenRecorderClass() sharedRecorder];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __47___GCControllerManagerAppClient_startBuffering__block_invoke;
    v4[3] = &unk_26D22B9F0;
    v4[4] = self;
    [v3 startClipBufferingWithCompletionHandler:v4];
  }
}

- (void)stopBuffering
{
  v3 = [getRPScreenRecorderClass() sharedRecorder];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46___GCControllerManagerAppClient_stopBuffering__block_invoke;
  v4[3] = &unk_26D22B9F0;
  v4[4] = self;
  [v3 stopClipBufferingWithCompletionHandler:v4];
}

- (void)startVideoRecordingBuffering
{
  if ([(_GCControllerManager *)self isAppInBackground])
  {
    self->_shouldStartBufferingOnForeground = 1;
  }
  else if (!self->_bufferingStarted)
  {
    [(_GCControllerManagerAppClient *)self startBuffering];
  }
}

- (void)stopVideoRecordingBuffering
{
  if (self->_bufferingStarted) {
    [(_GCControllerManagerAppClient *)self stopBuffering];
  }
}

- (void)onVideoRecordingToggledWithController:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  if ([(_GCControllerManager *)self isAppInBackground]) {
    goto LABEL_20;
  }
  if (!a4 && self->_bufferingStarted)
  {
    [(_GCControllerManagerAppClient *)self stopBuffering];
    goto LABEL_20;
  }
  uint64_t v7 = [getRPScreenRecorderClass() sharedRecorder];
  char v8 = [v7 isRecording];

  int isInternalBuild = gc_isInternalBuild();
  if (v8)
  {
    if (isInternalBuild)
    {
      id v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_GCControllerManagerAppClient onVideoRecordingToggledWithController:mode:]();
      }
    }
    [(_GCControllerManagerAppClient *)self stopVideoRecordingWithClipBuffering:self->_bufferingStarted controller:v6];
    goto LABEL_20;
  }
  if (isInternalBuild)
  {
    id v11 = getGCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_GCControllerManagerAppClient onVideoRecordingToggledWithController:mode:]();
    }

    if (a4) {
      goto LABEL_8;
    }
LABEL_19:
    [(_GCControllerManagerAppClient *)self startVideoRecording];
    goto LABEL_20;
  }
  if (!a4) {
    goto LABEL_19;
  }
LABEL_8:
  if (a4 == 1)
  {
    if (gc_isInternalBuild())
    {
      id v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[_GCControllerManagerAppClient onVideoRecordingToggledWithController:mode:]();
      }
    }
    [(_GCControllerManagerAppClient *)self startBuffering];
  }
LABEL_20:
}

- (void)onScreenshotTriggeredWithController:(id)a3
{
  id v4 = a3;
  photoVideoService = self->_photoVideoService;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke;
  v7[3] = &unk_26D22B9F0;
  id v8 = v4;
  id v6 = v4;
  [(GCPhotoVideoXPCProxyServiceRemoteServerInterface *)photoVideoService takeScreenshotWithReply:v7];
}

- (id)serviceClientForIPCService:(id)a3
{
  if (&unk_26D2B4618 == a3
    || &unk_26D29A1E0 == a3
    || &unk_26D2B42B8 == a3
    || &unk_26D29A2E8 == a3
    || &unk_26D2B4678 == a3
    || &unk_26D29A408 == a3
    || &unk_26D2B3CE8 == a3
    || &unk_26D29A510 == a3
    || &unk_26D2B3C88 == a3
    || &unk_26D29A620 == a3
    || &unk_26D2B4558 == a3
    || &unk_26D2B3E68 == a3
    || &unk_26D2B46D8 == a3
    || &unk_26D29A730 == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingStart, 0);
  objc_storeStrong((id *)&self->_hidEventObserver, 0);
  objc_storeStrong((id *)&self->_userDefaultsXPCProxyService, 0);
  objc_storeStrong((id *)&self->_systemGestureXPCProxyService, 0);
  objc_storeStrong((id *)&self->_gameIntentXPCProxyService, 0);
  objc_storeStrong((id *)&self->_photoVideoService, 0);
  objc_storeStrong((id *)&self->_batteryXPCProxyService, 0);
  objc_storeStrong((id *)&self->_motionXPCProxyService, 0);
  objc_storeStrong((id *)&self->_settingsXPCProxyService, 0);
  objc_storeStrong((id *)&self->_adaptiveTriggersXPCProxyService, 0);
  objc_storeStrong((id *)&self->_lightXPCProxyService, 0);
  objc_storeStrong((id *)&self->_playerIndicatorXPCProxyService, 0);
  objc_storeStrong((id *)&self->_controllerService, 0);
  objc_storeStrong(&self->_serverConnectionInterruption, 0);
  objc_storeStrong(&self->_serverConnectionInvalidation, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_customControllerIdentifiers, 0);
  objc_storeStrong((id *)&self->_serverValidControllerIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingControllers, 0);
  objc_storeStrong((id *)&self->_publishedControllers, 0);

  objc_storeStrong((id *)&self->_knownHIDServices, 0);
}

- (void)publishControllers:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Controller Service Client) Publish Controllers", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (void)unpublishControllersWithIdentifiers:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Controller Service Client) Unpublish Controllers", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (void)refreshControllers
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Controller Service Client) Refresh Controllers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (_GCIPCEndpointConnection)playerIndicatorXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCPlayerIndicatorXPCProxyServiceRemoteServerInterface)playerIndicatorXPCProxyServiceRemoteServer
{
  return self->_playerIndicatorXPCProxyService;
}

- (_GCIPCEndpointConnection)lightXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCLightXPCProxyServiceRemoteServerInterface)lightXPCProxyServiceRemoteServer
{
  return self->_lightXPCProxyService;
}

- (_GCIPCEndpointConnection)adaptiveTriggersXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface)adaptiveTriggersXPCProxyServiceRemoteServer
{
  return self->_adaptiveTriggersXPCProxyService;
}

- (_GCIPCEndpointConnection)motionXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCMotionXPCProxyServiceRemoteServerInterface)motionXPCProxyServiceRemoteServer
{
  return self->_motionXPCProxyService;
}

- (_GCIPCEndpointConnection)batteryXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCBatteryXPCProxyServiceRemoteServerInterface)batteryXPCProxyServiceRemoteServer
{
  return self->_batteryXPCProxyService;
}

- (_GCIPCEndpointConnection)settingsXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCSettingsXPCProxyServiceRemoteServerInterface)settingsXPCProxyServiceRemoteServer
{
  return self->_settingsXPCProxyService;
}

- (_GCIPCEndpointConnection)gameIntentXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCGameIntentXPCProxyServiceRemoteServerInterface)gameIntentXPCProxyServiceRemoteServer
{
  return self->_gameIntentXPCProxyService;
}

- (_GCIPCEndpointConnection)systemGestureXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCSystemGestureXPCProxyServiceRemoteServerInterface)systemGestureXPCProxyServiceRemoteServer
{
  return self->_systemGestureXPCProxyService;
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  serverConnection = self->_serverConnection;
  id v4 = a3;
  id v6 = [(GCIPCOutgoingConnection *)serverConnection remoteProxy];
  uint64_t v5 = [v4 canReceiveEvents];

  [v6 clientCanReceiveEventsDidChange:v5];
}

- (void)onVideoRecordingToggledWithController:mode:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_220998000, v0, v1, "Requesting video recording end...", v2, v3, v4, v5, v6);
}

- (void)onVideoRecordingToggledWithController:mode:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_220998000, v0, v1, "Unexpected call to startBuffering. it should be already started", v2, v3, v4, v5, v6);
}

- (void)onVideoRecordingToggledWithController:mode:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_220998000, v0, v1, "Requesting video recording start...", v2, v3, v4, v5, v6);
}

@end