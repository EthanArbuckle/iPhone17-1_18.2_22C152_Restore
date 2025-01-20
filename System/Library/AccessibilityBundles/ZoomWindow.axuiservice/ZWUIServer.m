@interface ZWUIServer
+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3;
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXDispatchTimer)keyboardHideTimer;
- (NSMutableArray)externalWindowScenes;
- (NSMutableDictionary)zoomRootViewControllers;
- (OS_dispatch_group)showHideGroup;
- (OS_dispatch_queue)showHideQueue;
- (ZWUIServer)init;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_showingOrHidingControllerWillBegin;
- (void)_showingOrHidingControllerWillEnd;
- (void)_waitForControllerShowHideToComplete:(id)a3;
- (void)dealloc;
- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)notifyOtherDisplaysOfDockedZoomRegionVisibilityChange:(BOOL)a3;
- (void)setExternalWindowScenes:(id)a3;
- (void)setKeyboardHideTimer:(id)a3;
- (void)setShowHideGroup:(id)a3;
- (void)setShowHideQueue:(id)a3;
- (void)updateZoomListeners:(id)a3;
@end

@implementation ZWUIServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__service;

  return v2;
}

void __28__ZWUIServer_sharedInstance__block_invoke(id a1)
{
  sharedInstance__service = objc_alloc_init(ZWUIServer);

  _objc_release_x1();
}

- (ZWUIServer)init
{
  v21.receiver = self;
  v21.super_class = (Class)ZWUIServer;
  v2 = [(ZWUIServer *)&v21 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_appTransitionOccurred, @"com.apple.mobile.SubstantialTransition", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:1];
    dispatch_group_t v4 = dispatch_group_create();
    [(ZWUIServer *)v2 setShowHideGroup:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.Zoom.ShowHide", 0);
    [(ZWUIServer *)v2 setShowHideQueue:v5];

    id v6 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(ZWUIServer *)v2 setKeyboardHideTimer:v6];

    v7 = +[NSMutableArray array];
    [(ZWUIServer *)v2 setExternalWindowScenes:v7];

    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    zoomListeners = v2->_zoomListeners;
    v2->_zoomListeners = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    zoomAttributeListeners = v2->_zoomAttributeListeners;
    v2->_zoomAttributeListeners = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessibility.zoom.update_listeners", 0);
    zoomListenersUpdateQueue = v2->_zoomListenersUpdateQueue;
    v2->_zoomListenersUpdateQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.accessibility.zoom.focused_apps_retrieval", 0);
    focusedAppsRetrievalQueue = v2->_focusedAppsRetrievalQueue;
    v2->_focusedAppsRetrievalQueue = (OS_dispatch_queue *)v14;

    v16 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:v2->_zoomListenersUpdateQueue];
    zoomListenerUpdateTimer = v2->_zoomListenerUpdateTimer;
    v2->_zoomListenerUpdateTimer = v16;

    [(AXDispatchTimer *)v2->_zoomListenerUpdateTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v18 = (AXDispatchTimer *)objc_alloc_init((Class)AXDispatchTimer);
    zoomServicesUpdate = v2->_zoomServicesUpdate;
    v2->_zoomServicesUpdate = v18;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.SubstantialTransition", 0);
  v4.receiver = self;
  v4.super_class = (Class)ZWUIServer;
  [(ZWUIServer *)&v4 dealloc];
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double result = UIWindowLevelNormal;
  if (isKindOfClass) {
    return 10000016.0;
  }
  return result;
}

- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v5 = a3;
  zoomRootViewControllers = self->_zoomRootViewControllers;
  v7 = [v5 _sceneIdentifier];
  v8 = [(NSMutableDictionary *)zoomRootViewControllers objectForKeyedSubscript:v7];

  if (!v8)
  {
    v9 = [(ZWUIServer *)self externalWindowScenes];
    [v9 addObject:v5];

    v10 = [ZWRootViewController alloc];
    v11 = [v5 screen];
    dispatch_queue_t v12 = [(ZWRootViewController *)v10 initWithAXUIService:self onScreen:v11 isMainDisplay:0];

    v13 = self->_zoomRootViewControllers;
    dispatch_queue_t v14 = [v5 _sceneIdentifier];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    v15 = [(NSMutableDictionary *)self->_zoomRootViewControllers objectForKeyedSubscript:@"MAIN-DISPLAY"];
    if ([v15 isZoomLensVisible])
    {
      [(ZWUIServer *)self _showingOrHidingControllerWillBegin];
      v16 = +[AXUIDisplayManager sharedDisplayManager];
      [v16 addContentViewController:v12 withUserInteractionEnabled:1 forService:self context:0 userInterfaceStyle:1 forWindowScene:v5 completion:0];

      v17 = +[AXSubsystemZoom sharedInstance];
      unsigned __int8 v18 = [v17 ignoreLogging];

      if ((v18 & 1) == 0)
      {
        v19 = +[AXSubsystemZoom identifier];
        v20 = AXLoggerForFacility();

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v20, v21))
        {
          v31 = AXColorizeFormatLog();
          v30 = [(ZWRootViewController *)v12 view];
          [v30 bounds];
          v22 = NSStringFromCGRect(v35);
          [(ZWRootViewController *)v12 view];
          v23 = os_log_type_t v29 = v21;
          v24 = [v23 window];
          [v24 bounds];
          v27 = NSStringFromCGRect(v36);
          id v28 = [(ZWRootViewController *)v12 interfaceOrientation];
          v26 = v22;
          v25 = _AXStringForArgs();

          if (os_log_type_enabled(v20, v29))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v25;
            _os_log_impl(&dword_0, v20, v29, "%{public}@", buf, 0xCu);
          }
        }
      }
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = __69__ZWUIServer_externalDisplaySceneConnected_forSceneClientIdentifier___block_invoke;
      v32[3] = &unk_78CA8;
      v32[4] = self;
      -[ZWRootViewController showZoomSlugAndLens:completion:](v12, "showZoomSlugAndLens:completion:", 1, v32, v26, v27, v28);
    }
  }
}

id __69__ZWUIServer_externalDisplaySceneConnected_forSceneClientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showingOrHidingControllerWillEnd];
}

- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(ZWUIServer *)self externalWindowScenes];
  [v6 removeObject:v5];

  id v8 = [(ZWUIServer *)self zoomRootViewControllers];
  v7 = [v5 _sceneIdentifier];

  [v8 removeObjectForKey:v7];
}

- (void)updateZoomListeners:(id)a3
{
  id v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  id v5 = [v4 objectForKeyedSubscript:ZWAttributeKeyDisplayID];
  zoomListenersUpdateQueue = self->_zoomListenersUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__ZWUIServer_updateZoomListeners___block_invoke;
  block[3] = &unk_790A0;
  v20 = v24;
  block[4] = self;
  id v7 = v5;
  id v18 = v7;
  os_log_type_t v21 = v22;
  id v8 = v4;
  id v19 = v8;
  dispatch_sync(zoomListenersUpdateQueue, block);
  objc_initWeak(&location, self);
  zoomListenerUpdateTimer = self->_zoomListenerUpdateTimer;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __34__ZWUIServer_updateZoomListeners___block_invoke_2;
  v12[3] = &unk_790F0;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(AXDispatchTimer *)zoomListenerUpdateTimer afterDelay:v12 processBlock:0.25];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __34__ZWUIServer_updateZoomListeners___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = *(id *)(a1 + 48);
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:v14];
          v16 = [v5 objectForKeyedSubscript:v14];
          unsigned __int8 v17 = [v15 isEqual:v16];

          if ((v17 & 1) == 0)
          {
            id v18 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v14];
            if ([v18 count]) {
              [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) unionSet:v18];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v11);
    }
  }
  v27 = v5;
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = +[AXUIClientMessenger clientMessengerWithIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
        uint64_t v25 = *(void *)(a1 + 48);
        v26 = +[AXAccessQueue mainAccessQueue];
        [v24 sendAsynchronousMessage:v25 withIdentifier:3000 targetAccessQueue:v26 completionRequiresWritingBlock:0 completion:0];
      }
      id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }
}

void __34__ZWUIServer_updateZoomListeners___block_invoke_2(id *a1)
{
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained[5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__ZWUIServer_updateZoomListeners___block_invoke_3;
  block[3] = &unk_790C8;
  block[4] = WeakRetained;
  id v5 = a1[4];
  id v6 = a1[5];
  dispatch_async(v3, block);
}

id __34__ZWUIServer_updateZoomListeners___block_invoke_3(void *a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = +[AXUIClientMessenger clientMessengerWithIdentifier:](AXUIClientMessenger, "clientMessengerWithIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v6), (void)v11);
        uint64_t v8 = a1[5];
        id v9 = +[AXAccessQueue mainAccessQueue];
        [v7 sendAsynchronousMessage:v8 withIdentifier:3000 targetAccessQueue:v9 completionRequiresWritingBlock:0 completion:0];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1[4] + 32) setObject:a1[5] forKeyedSubscript:a1[6]];
}

- (void)notifyOtherDisplaysOfDockedZoomRegionVisibilityChange:(BOOL)a3
{
  BOOL v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ZWUIServer *)self zoomRootViewControllers];
  uint64_t v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateDockedZoomRegionVisibility:v3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_waitForControllerShowHideToComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ZWUIServer *)self showHideQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __51__ZWUIServer__waitForControllerShowHideToComplete___block_invoke;
  v7[3] = &unk_78FC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__ZWUIServer__waitForControllerShowHideToComplete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) showHideGroup];
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  BOOL v3 = *(void **)(a1 + 40);

  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_showingOrHidingControllerWillBegin
{
  id v2 = [(ZWUIServer *)self showHideGroup];
  dispatch_group_enter(v2);
}

- (void)_showingOrHidingControllerWillEnd
{
  id v2 = [(ZWUIServer *)self showHideGroup];
  dispatch_group_leave(v2);
}

- (NSMutableDictionary)zoomRootViewControllers
{
  _AXAssertIsMainThread();
  zoomRootViewControllers = self->_zoomRootViewControllers;
  if (!zoomRootViewControllers)
  {
    id v4 = +[NSMutableDictionary dictionary];
    uint64_t v5 = self->_zoomRootViewControllers;
    self->_zoomRootViewControllers = v4;

    id v6 = [ZWRootViewController alloc];
    id v7 = +[UIScreen mainScreen];
    id v8 = [(ZWRootViewController *)v6 initWithAXUIService:self onScreen:v7 isMainDisplay:1];
    [(NSMutableDictionary *)self->_zoomRootViewControllers setObject:v8 forKeyedSubscript:@"MAIN-DISPLAY"];

    zoomRootViewControllers = self->_zoomRootViewControllers;
  }

  return zoomRootViewControllers;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  id result = 0;
  if ((uint64_t)a3 <= 2199)
  {
    switch(a3)
    {
      case 0x7D3uLL:
      case 0x7D7uLL:
      case 0x7D8uLL:
        return @"com.apple.accessibility.SpringBoard";
      case 0x7D4uLL:
      case 0x7D5uLL:
      case 0x7D6uLL:
      case 0x7D9uLL:
      case 0x7DAuLL:
      case 0x7DBuLL:
      case 0x7DCuLL:
      case 0x7DFuLL:
      case 0x7E1uLL:
      case 0x7E2uLL:
        return result;
      case 0x7DDuLL:
      case 0x7DEuLL:
        id result = @"com.apple.accessibility.voiceover";
        break;
      case 0x7E0uLL:
        id result = @"com.apple.springboard.inCallPresentation";
        break;
      case 0x7E3uLL:
      case 0x7E4uLL:
      case 0x7E5uLL:
        return @"com.apple.accessibility.zoom.client";
      default:
        if (a3 - 1000 >= 2) {
          id result = 0;
        }
        else {
          id result = @"com.apple.accessibility.BackBoard";
        }
        break;
    }
  }
  else
  {
    char v4 = a3 + 59;
    if (a3 - 2501 <= 0xD)
    {
      if (((1 << v4) & 0x3C03) != 0) {
        return @"com.apple.accessibility.SpringBoard";
      }
      if (((1 << v4) & 0x3C0) != 0) {
        return @"com.apple.accessibility.Carousel";
      }
    }
    if (a3 - 2200 < 4) {
      return @"com.apple.accessibility.zoom.client";
    }
  }
  return result;
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (a3 - 2004 <= 0xB && ((1 << (a3 + 44)) & 0x821) != 0)
  {
    uint64_t v5 = &off_7B5F8;
    goto LABEL_6;
  }
  if (a3 == 2500)
  {
    uint64_t v5 = &off_7B5E0;
LABEL_6:
    id v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v5, v3);
    return v6;
  }
  id v6 = 0;
  return v6;
}

+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 - 2000 > 0x18 || ((1 << (a3 + 48)) & 0x1C20467) == 0) {
    return a3 == 3000;
  }
  return result;
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = v9;
  if ((uint64_t)a4 > 2199)
  {
    long long v13 = 0;
    switch(a4)
    {
      case 0x9C4uLL:
      case 0x9C5uLL:
      case 0x9C6uLL:
      case 0x9CBuLL:
      case 0x9D0uLL:
      case 0x9D1uLL:
      case 0x9D2uLL:
        goto LABEL_211;
      case 0x9C7uLL:
      case 0x9C8uLL:
      case 0x9C9uLL:
      case 0x9CAuLL:
LABEL_29:
        v37 = +[NSNumber numberWithUnsignedInteger:a4];
        v38 = +[NSString stringWithFormat:@"Unexpected message sent: %@", v37];
        v39 = +[NSException exceptionWithName:@"Zoom Exception" reason:v38 userInfo:0];
        [v39 raise];

        goto LABEL_271;
      case 0x9CCuLL:
        long long v380 = 0u;
        long long v379 = 0u;
        long long v378 = 0u;
        long long v377 = 0u;
        long long v14 = [(ZWUIServer *)self zoomRootViewControllers];
        id v15 = [v14 allValues];

        id v16 = [v15 countByEnumeratingWithState:&v377 objects:v446 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v378;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v378 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v377 + 1) + 8 * i) handleDeviceReturnedToClockAtIdle];
            }
            id v17 = [v15 countByEnumeratingWithState:&v377 objects:v446 count:16];
          }
          while (v17);
        }
        goto LABEL_209;
      case 0x9CDuLL:
        long long v376 = 0u;
        long long v375 = 0u;
        long long v374 = 0u;
        long long v373 = 0u;
        v40 = [(ZWUIServer *)self zoomRootViewControllers];
        id v15 = [v40 allValues];

        id v41 = [v15 countByEnumeratingWithState:&v373 objects:v445 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v374;
          do
          {
            for (j = 0; j != v42; j = (char *)j + 1)
            {
              if (*(void *)v374 != v43) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v373 + 1) + 8 * (void)j) handleCarouselLockBegan];
            }
            id v42 = [v15 countByEnumeratingWithState:&v373 objects:v445 count:16];
          }
          while (v42);
        }
        goto LABEL_209;
      case 0x9CEuLL:
        long long v372 = 0u;
        long long v371 = 0u;
        long long v370 = 0u;
        long long v369 = 0u;
        v45 = [(ZWUIServer *)self zoomRootViewControllers];
        id v15 = [v45 allValues];

        id v46 = [v15 countByEnumeratingWithState:&v369 objects:v444 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v370;
          do
          {
            for (k = 0; k != v47; k = (char *)k + 1)
            {
              if (*(void *)v370 != v48) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v369 + 1) + 8 * (void)k) handleCarouselLockEnded];
            }
            id v47 = [v15 countByEnumeratingWithState:&v369 objects:v444 count:16];
          }
          while (v47);
        }
        goto LABEL_209;
      case 0x9CFuLL:
        long long v327 = 0u;
        long long v328 = 0u;
        long long v325 = 0u;
        long long v326 = 0u;
        v50 = [(ZWUIServer *)self zoomRootViewControllers];
        id v15 = [v50 allValues];

        id v51 = [v15 countByEnumeratingWithState:&v325 objects:v427 count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v326;
          do
          {
            for (m = 0; m != v52; m = (char *)m + 1)
            {
              if (*(void *)v326 != v53) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v325 + 1) + 8 * (void)m) handleDeviceWillWake];
            }
            id v52 = [v15 countByEnumeratingWithState:&v325 objects:v427 count:16];
          }
          while (v52);
        }
LABEL_209:

        goto LABEL_210;
      default:
        switch(a4)
        {
          case 0x898uLL:
            id v20 = [v8 objectForKeyedSubscript:@"displayID"];
            unsigned int v21 = [v20 unsignedIntValue];

            long long v347 = 0u;
            long long v348 = 0u;
            long long v345 = 0u;
            long long v346 = 0u;
            uint64_t v22 = [(ZWUIServer *)self zoomRootViewControllers];
            id v23 = [v22 allKeys];

            id obj = v23;
            id v24 = [v23 countByEnumeratingWithState:&v345 objects:v438 count:16];
            if (!v24) {
              goto LABEL_248;
            }
            id v25 = v24;
            v291 = v10;
            uint64_t v297 = *(void *)v346;
            while (1)
            {
              for (n = 0; n != v25; n = (char *)n + 1)
              {
                if (*(void *)v346 != v297) {
                  objc_enumerationMutation(obj);
                }
                v27 = *(void **)(*((void *)&v345 + 1) + 8 * (void)n);
                long long v28 = [(ZWUIServer *)self zoomRootViewControllers];
                long long v29 = [v28 objectForKeyedSubscript:v27];

                long long v30 = [v29 view];
                long long v31 = [v30 window];
                long long v32 = [v31 screen];
                long long v33 = [v32 displayIdentity];
                if ([v33 displayID] == v21)
                {

LABEL_259:
                  CFStringRef v436 = @"result";
                  [v29 zoomLevel];
                  v278 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  v437 = v278;
                  v279 = &v437;
                  v280 = &v436;
                  goto LABEL_262;
                }
                if (v21)
                {
                }
                else
                {
                  unsigned __int8 v34 = [v27 isEqualToString:@"MAIN-DISPLAY"];

                  if (v34) {
                    goto LABEL_259;
                  }
                }
              }
              id v25 = [obj countByEnumeratingWithState:&v345 objects:v438 count:16];
              if (!v25)
              {
LABEL_227:
                long long v13 = 0;
                goto LABEL_263;
              }
            }
          case 0x899uLL:
            v231 = [v8 objectForKeyedSubscript:@"displayID"];
            unsigned int v232 = [v231 unsignedIntValue];

            long long v343 = 0u;
            long long v344 = 0u;
            long long v341 = 0u;
            long long v342 = 0u;
            v233 = [(ZWUIServer *)self zoomRootViewControllers];
            v234 = [v233 allKeys];

            id obj = v234;
            id v235 = [v234 countByEnumeratingWithState:&v341 objects:v435 count:16];
            if (!v235)
            {
LABEL_248:
              long long v13 = 0;
              goto LABEL_264;
            }
            id v236 = v235;
            v291 = v10;
            uint64_t v302 = *(void *)v342;
            while (2)
            {
              uint64_t v237 = 0;
LABEL_219:
              if (*(void *)v342 != v302) {
                objc_enumerationMutation(obj);
              }
              v238 = *(void **)(*((void *)&v341 + 1) + 8 * v237);
              v239 = [(ZWUIServer *)self zoomRootViewControllers];
              long long v29 = [v239 objectForKeyedSubscript:v238];

              v240 = [v29 view];
              v241 = [v240 window];
              v242 = [v241 screen];
              v243 = [v242 displayIdentity];
              if ([v243 displayID] == v232)
              {
              }
              else
              {
                if (v232)
                {

                  goto LABEL_225;
                }
                unsigned __int8 v244 = [v238 isEqualToString:@"MAIN-DISPLAY"];

                if ((v244 & 1) == 0)
                {
LABEL_225:

                  if (v236 == (id)++v237)
                  {
                    id v236 = [obj countByEnumeratingWithState:&v341 objects:v435 count:16];
                    if (!v236) {
                      goto LABEL_227;
                    }
                    continue;
                  }
                  goto LABEL_219;
                }
              }
              break;
            }
            CFStringRef v433 = @"result";
            [v29 zoomFrame];
            v278 = NSStringFromCGRect(v456);
            v434 = v278;
            v279 = &v434;
            v280 = &v433;
LABEL_262:
            long long v13 = +[NSDictionary dictionaryWithObjects:v279 forKeys:v280 count:1];

LABEL_263:
            long long v10 = v291;
LABEL_264:

            goto LABEL_211;
          case 0x89AuLL:
            id v245 = v9;
            long long v351 = 0u;
            long long v352 = 0u;
            long long v349 = 0u;
            long long v350 = 0u;
            v246 = [(ZWUIServer *)self zoomRootViewControllers];
            v247 = [v246 allKeys];

            id v248 = [v247 countByEnumeratingWithState:&v349 objects:v439 count:16];
            if (!v248) {
              goto LABEL_250;
            }
            id v249 = v248;
            uint64_t v250 = *(void *)v350;
            while (1)
            {
              for (ii = 0; ii != v249; ii = (char *)ii + 1)
              {
                if (*(void *)v350 != v250) {
                  objc_enumerationMutation(v247);
                }
                v252 = *(void **)(*((void *)&v349 + 1) + 8 * (void)ii);
                v253 = [(ZWUIServer *)self zoomRootViewControllers];
                v254 = [v253 objectForKeyedSubscript:v252];

                if ([v252 isEqualToString:@"MAIN-DISPLAY"])
                {
                  [v254 toggleZoomMenu];

LABEL_250:
                  long long v13 = 0;
                  long long v10 = v245;
                  goto LABEL_211;
                }
              }
              id v249 = [v247 countByEnumeratingWithState:&v349 objects:v439 count:16];
              if (!v249) {
                goto LABEL_250;
              }
            }
          case 0x89BuLL:
            id v255 = v9;
            long long v339 = 0u;
            long long v340 = 0u;
            long long v337 = 0u;
            long long v338 = 0u;
            v256 = [(ZWUIServer *)self zoomRootViewControllers];
            v257 = [v256 allKeys];

            id v258 = [v257 countByEnumeratingWithState:&v337 objects:v432 count:16];
            if (!v258) {
              goto LABEL_245;
            }
            id v259 = v258;
            uint64_t v260 = *(void *)v338;
            while (1)
            {
              for (jj = 0; jj != v259; jj = (char *)jj + 1)
              {
                if (*(void *)v338 != v260) {
                  objc_enumerationMutation(v257);
                }
                v262 = *(void **)(*((void *)&v337 + 1) + 8 * (void)jj);
                v263 = [(ZWUIServer *)self zoomRootViewControllers];
                v264 = [v263 objectForKeyedSubscript:v262];

                if ([v262 isEqualToString:@"MAIN-DISPLAY"])
                {
                  uint64_t v265 = [v264 getLastSpeakUnderFingerPhrase];
                  v266 = (void *)v265;
                  if (v265)
                  {
                    CFStringRef v430 = @"result";
                    uint64_t v431 = v265;
                    long long v13 = +[NSDictionary dictionaryWithObjects:&v431 forKeys:&v430 count:1];
                  }
                  else
                  {
                    long long v13 = 0;
                  }
                  long long v10 = v255;

                  goto LABEL_277;
                }
              }
              id v259 = [v257 countByEnumeratingWithState:&v337 objects:v432 count:16];
              if (!v259)
              {
LABEL_245:
                long long v13 = 0;
                long long v10 = v255;
LABEL_277:

                goto LABEL_211;
              }
            }
          default:
            goto LABEL_29;
        }
    }
  }
  switch(a4)
  {
    case 0x7D0uLL:
      focusedAppsRetrievalQueue = self->_focusedAppsRetrievalQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_4;
      block[3] = &unk_79118;
      id v416 = v8;
      v417 = self;
      dispatch_async(focusedAppsRetrievalQueue, block);
      long long v12 = v416;
      goto LABEL_156;
    case 0x7D1uLL:
      v55 = self->_focusedAppsRetrievalQueue;
      v412[0] = _NSConcreteStackBlock;
      v412[1] = 3221225472;
      v412[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_6;
      v412[3] = &unk_79118;
      id v413 = v8;
      v414 = self;
      dispatch_async(v55, v412);
      long long v12 = v413;
      goto LABEL_156;
    case 0x7D2uLL:
      v56 = [v8 objectForKeyedSubscript:@"focusType"];
      v57 = (char *)[v56 unsignedIntegerValue];

      v58 = +[AXSettings sharedInstance];
      unsigned __int8 v59 = [v58 zoomShouldFollowFocus];

      if ((v59 & 1) == 0 && v57 != (unsigned char *)&dword_0 + 1) {
        goto LABEL_210;
      }
      id v289 = v57;
      v60 = [v8 objectForKeyedSubscript:@"focusFrame"];
      NSRect v453 = NSRectFromString(v60);
      double x = v453.origin.x;
      double y = v453.origin.y;
      double width = v453.size.width;
      double height = v453.size.height;

      v65 = [v8 objectForKeyedSubscript:@"contextId"];
      unsigned int v288 = [v65 unsignedIntValue];

      v66 = [v8 objectForKeyedSubscript:@"keyboardFrame"];
      NSRect v454 = NSRectFromString(v66);
      double v67 = v454.origin.x;
      double v68 = v454.origin.y;
      double v69 = v454.size.width;
      double v70 = v454.size.height;

      v37 = [v8 objectForKeyedSubscript:@"appID"];
      v71 = [v8 objectForKeyedSubscript:@"displayID"];
      unsigned int v298 = [v71 unsignedIntValue];

      long long v400 = 0u;
      long long v399 = 0u;
      long long v398 = 0u;
      long long v397 = 0u;
      v72 = [(ZWUIServer *)self zoomRootViewControllers];
      v73 = [v72 allValues];

      id obja = v73;
      id v74 = [v73 countByEnumeratingWithState:&v397 objects:v451 count:16];
      if (!v74) {
        goto LABEL_270;
      }
      id v75 = v74;
      uint64_t v304 = *(void *)v398;
      v292 = v37;
      while (2)
      {
        for (kk = 0; kk != v75; kk = (char *)kk + 1)
        {
          v77 = v10;
          if (*(void *)v398 != v304) {
            objc_enumerationMutation(obja);
          }
          v78 = *(void **)(*((void *)&v397 + 1) + 8 * (void)kk);
          v79 = [v78 view];
          v80 = [v79 window];
          v81 = [v80 screen];
          v82 = [v81 displayIdentity];
          unsigned int v83 = [v82 displayID];

          if (v83 == v298)
          {
            v37 = v292;
            objc_msgSend(v78, "handleFocusChangedWithType:rect:keyboardFrame:contextId:appID:", v289, v288, v292, x, y, width, height, v67, v68, v69, v70);
            long long v10 = v77;
            goto LABEL_270;
          }
          long long v10 = v77;
        }
        id v75 = [obja countByEnumeratingWithState:&v397 objects:v451 count:16];
        v37 = v292;
        if (v75) {
          continue;
        }
        break;
      }
LABEL_270:

LABEL_271:
LABEL_210:
      long long v13 = 0;
      goto LABEL_211;
    case 0x7D3uLL:
      long long v396 = 0u;
      long long v395 = 0u;
      long long v394 = 0u;
      long long v393 = 0u;
      v84 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v84 allValues];

      id v85 = [v15 countByEnumeratingWithState:&v393 objects:v450 count:16];
      if (v85)
      {
        id v86 = v85;
        uint64_t v87 = *(void *)v394;
        do
        {
          for (mm = 0; mm != v86; mm = (char *)mm + 1)
          {
            if (*(void *)v394 != v87) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v393 + 1) + 8 * (void)mm) handleLockButtonWasPressed];
          }
          id v86 = [v15 countByEnumeratingWithState:&v393 objects:v450 count:16];
        }
        while (v86);
      }
      goto LABEL_209;
    case 0x7D4uLL:
      id v89 = v9;
      long long v392 = 0u;
      long long v391 = 0u;
      long long v390 = 0u;
      long long v389 = 0u;
      v90 = [(ZWUIServer *)self zoomRootViewControllers];
      v91 = [v90 allValues];

      id v92 = [v91 countByEnumeratingWithState:&v389 objects:v449 count:16];
      if (v92)
      {
        id v93 = v92;
        uint64_t v94 = *(void *)v390;
        do
        {
          for (nn = 0; nn != v93; nn = (char *)nn + 1)
          {
            if (*(void *)v390 != v94) {
              objc_enumerationMutation(v91);
            }
            v96 = *(void **)(*((void *)&v389 + 1) + 8 * (void)nn);
            v97 = [v8 objectForKeyedSubscript:@"lensMode"];
            [v96 handleSettingsAppDidUpdatePreferredLensMode:v97];
          }
          id v93 = [v91 countByEnumeratingWithState:&v389 objects:v449 count:16];
        }
        while (v93);
      }
      goto LABEL_146;
    case 0x7D5uLL:
      id v98 = v9;
      v99 = [v8 objectForKey:@"appID"];
      v100 = [v8 objectForKeyedSubscript:@"keyboardFrame"];
      NSRect v455 = NSRectFromString(v100);
      double v101 = v455.origin.x;
      double v102 = v455.origin.y;
      double v103 = v455.size.width;
      double v104 = v455.size.height;

      long long v368 = 0u;
      long long v367 = 0u;
      long long v366 = 0u;
      long long v365 = 0u;
      v105 = [(ZWUIServer *)self zoomRootViewControllers];
      v106 = [v105 allValues];

      id v107 = [v106 countByEnumeratingWithState:&v365 objects:v443 count:16];
      if (v107)
      {
        id v108 = v107;
        uint64_t v109 = *(void *)v366;
        do
        {
          for (i1 = 0; i1 != v108; i1 = (char *)i1 + 1)
          {
            if (*(void *)v366 != v109) {
              objc_enumerationMutation(v106);
            }
            objc_msgSend(*(id *)(*((void *)&v365 + 1) + 8 * (void)i1), "handleAppDidBecomeActiveWithID:initialKeyboardFrame:", v99, v101, v102, v103, v104);
          }
          id v108 = [v106 countByEnumeratingWithState:&v365 objects:v443 count:16];
        }
        while (v108);
      }
      goto LABEL_97;
    case 0x7D6uLL:
      id v98 = v9;
      v99 = [v8 objectForKey:@"appID"];
      long long v361 = 0u;
      long long v362 = 0u;
      long long v363 = 0u;
      long long v364 = 0u;
      v111 = [(ZWUIServer *)self zoomRootViewControllers];
      v106 = [v111 allValues];

      id v112 = [v106 countByEnumeratingWithState:&v361 objects:v442 count:16];
      if (v112)
      {
        id v113 = v112;
        uint64_t v114 = *(void *)v362;
        do
        {
          for (i2 = 0; i2 != v113; i2 = (char *)i2 + 1)
          {
            if (*(void *)v362 != v114) {
              objc_enumerationMutation(v106);
            }
            [*(id *)(*((void *)&v361 + 1) + 8 * (void)i2) handleAppDidEnterBackgroundWithID:v99];
          }
          id v113 = [v106 countByEnumeratingWithState:&v361 objects:v442 count:16];
        }
        while (v113);
      }
LABEL_97:

      long long v13 = 0;
      long long v10 = v98;
      goto LABEL_211;
    case 0x7D7uLL:
      long long v331 = 0u;
      long long v332 = 0u;
      long long v329 = 0u;
      long long v330 = 0u;
      v116 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v116 allValues];

      id v117 = [v15 countByEnumeratingWithState:&v329 objects:v428 count:16];
      if (v117)
      {
        id v118 = v117;
        uint64_t v119 = *(void *)v330;
        do
        {
          for (i3 = 0; i3 != v118; i3 = (char *)i3 + 1)
          {
            if (*(void *)v330 != v119) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v329 + 1) + 8 * (void)i3) handleDeviceWasUnlocked];
          }
          id v118 = [v15 countByEnumeratingWithState:&v329 objects:v428 count:16];
        }
        while (v118);
      }
      goto LABEL_209;
    case 0x7D8uLL:
      long long v323 = 0u;
      long long v324 = 0u;
      long long v321 = 0u;
      long long v322 = 0u;
      v121 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v121 allValues];

      id v122 = [v15 countByEnumeratingWithState:&v321 objects:v426 count:16];
      if (v122)
      {
        id v123 = v122;
        uint64_t v124 = *(void *)v322;
        do
        {
          for (i4 = 0; i4 != v123; i4 = (char *)i4 + 1)
          {
            if (*(void *)v322 != v124) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v321 + 1) + 8 * (void)i4) handleHomeButtonWasPressed];
          }
          id v123 = [v15 countByEnumeratingWithState:&v321 objects:v426 count:16];
        }
        while (v123);
      }
      goto LABEL_209;
    case 0x7D9uLL:
      id v89 = v9;
      long long v384 = 0u;
      long long v383 = 0u;
      long long v382 = 0u;
      long long v381 = 0u;
      v126 = [(ZWUIServer *)self zoomRootViewControllers];
      v91 = [v126 allValues];

      id v127 = [v91 countByEnumeratingWithState:&v381 objects:v447 count:16];
      if (v127)
      {
        id v128 = v127;
        uint64_t v129 = *(void *)v382;
        do
        {
          for (i5 = 0; i5 != v128; i5 = (char *)i5 + 1)
          {
            if (*(void *)v382 != v129) {
              objc_enumerationMutation(v91);
            }
            v131 = *(void **)(*((void *)&v381 + 1) + 8 * (void)i5);
            v132 = [v8 objectForKeyedSubscript:@"idleSlugOpacity"];
            [v132 floatValue];
            [v131 handleSettingsAppDidUpdateIdleSlugOpacity:v133];
          }
          id v128 = [v91 countByEnumeratingWithState:&v381 objects:v447 count:16];
        }
        while (v128);
      }
      goto LABEL_146;
    case 0x7DAuLL:
      v134 = [v8 objectForKeyedSubscript:@"register"];
      unsigned __int8 v135 = [v134 BOOLValue];

      zoomListenersUpdateQueue = self->_zoomListenersUpdateQueue;
      v406[0] = _NSConcreteStackBlock;
      v406[1] = 3221225472;
      v406[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_11;
      v406[3] = &unk_78E90;
      unsigned __int8 v408 = v135;
      v406[4] = self;
      id v407 = v10;
      dispatch_async(zoomListenersUpdateQueue, v406);
      long long v12 = v407;
      goto LABEL_156;
    case 0x7DBuLL:
    case 0x7DCuLL:
    case 0x7E2uLL:
      goto LABEL_29;
    case 0x7DDuLL:
      long long v319 = 0u;
      long long v320 = 0u;
      long long v317 = 0u;
      long long v318 = 0u;
      v137 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v137 allValues];

      id v138 = [v15 countByEnumeratingWithState:&v317 objects:v425 count:16];
      if (v138)
      {
        id v139 = v138;
        uint64_t v140 = *(void *)v318;
        do
        {
          for (i6 = 0; i6 != v139; i6 = (char *)i6 + 1)
          {
            if (*(void *)v318 != v140) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v317 + 1) + 8 * (void)i6) setBrailleInputUIIsShowing:1];
          }
          id v139 = [v15 countByEnumeratingWithState:&v317 objects:v425 count:16];
        }
        while (v139);
      }
      goto LABEL_209;
    case 0x7DEuLL:
      long long v315 = 0u;
      long long v316 = 0u;
      long long v313 = 0u;
      long long v314 = 0u;
      v142 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v142 allValues];

      id v143 = [v15 countByEnumeratingWithState:&v313 objects:v424 count:16];
      if (v143)
      {
        id v144 = v143;
        uint64_t v145 = *(void *)v314;
        do
        {
          for (i7 = 0; i7 != v144; i7 = (char *)i7 + 1)
          {
            if (*(void *)v314 != v145) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v313 + 1) + 8 * (void)i7) setBrailleInputUIIsShowing:0];
          }
          id v144 = [v15 countByEnumeratingWithState:&v313 objects:v424 count:16];
        }
        while (v144);
      }
      goto LABEL_209;
    case 0x7DFuLL:
      id v89 = v9;
      long long v388 = 0u;
      long long v387 = 0u;
      long long v386 = 0u;
      long long v385 = 0u;
      v147 = [(ZWUIServer *)self zoomRootViewControllers];
      v91 = [v147 allValues];

      id v148 = [v91 countByEnumeratingWithState:&v385 objects:v448 count:16];
      if (v148)
      {
        id v149 = v148;
        uint64_t v150 = *(void *)v386;
        do
        {
          for (i8 = 0; i8 != v149; i8 = (char *)i8 + 1)
          {
            if (*(void *)v386 != v150) {
              objc_enumerationMutation(v91);
            }
            v152 = *(void **)(*((void *)&v385 + 1) + 8 * (void)i8);
            v153 = [v8 objectForKeyedSubscript:@"dockPosition"];
            [v152 handleSettingsAppDidUpdatePreferredDockPosition:v153];
          }
          id v149 = [v91 countByEnumeratingWithState:&v385 objects:v448 count:16];
        }
        while (v149);
      }
LABEL_146:

      long long v13 = 0;
      long long v10 = v89;
      goto LABEL_211;
    case 0x7E0uLL:
      v154 = +[AXSubsystemZoom sharedInstance];
      unsigned __int8 v155 = [v154 ignoreLogging];

      if ((v155 & 1) == 0)
      {
        v156 = +[AXSubsystemZoom identifier];
        v157 = AXLoggerForFacility();

        os_log_type_t v158 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v157, v158))
        {
          v159 = AXColorizeFormatLog();
          v160 = _AXStringForArgs();
          if (os_log_type_enabled(v157, v158))
          {
            *(_DWORD *)buf = 138543362;
            v423 = v160;
            _os_log_impl(&dword_0, v157, v158, "%{public}@", buf, 0xCu);
          }
        }
      }
      v161 = +[AXSettings sharedInstance];
      unsigned __int8 v162 = [v161 zoomInStandby];

      if (v162) {
        goto LABEL_210;
      }
      id v163 = +[AXSettings sharedInstance];
      [v163 setZoomInStandby:1];
      goto LABEL_215;
    case 0x7E1uLL:
      v164 = self->_focusedAppsRetrievalQueue;
      v409[0] = _NSConcreteStackBlock;
      v409[1] = 3221225472;
      v409[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_9;
      v409[3] = &unk_79118;
      id v410 = v8;
      v411 = self;
      dispatch_async(v164, v409);
      long long v12 = v410;
LABEL_156:

      goto LABEL_210;
    case 0x7E3uLL:
      id v293 = v9;
      v165 = [v8 objectForKeyedSubscript:@"displayID"];
      unsigned int v166 = [v165 unsignedIntValue];

      long long v359 = 0u;
      long long v360 = 0u;
      long long v357 = 0u;
      long long v358 = 0u;
      v167 = [(ZWUIServer *)self zoomRootViewControllers];
      v168 = [v167 allKeys];

      id objb = v168;
      id v169 = [v168 countByEnumeratingWithState:&v357 objects:v441 count:16];
      if (!v169) {
        goto LABEL_274;
      }
      id v170 = v169;
      uint64_t v299 = *(void *)v358;
LABEL_159:
      v171 = 0;
      break;
    case 0x7E4uLL:
      v180 = [v8 objectForKeyedSubscript:@"zoomLevel"];
      [v180 doubleValue];
      double v182 = v181;

      if (v182 < 1.0) {
        goto LABEL_210;
      }
      id v293 = v10;
      v183 = [v8 objectForKeyedSubscript:@"displayID"];
      unsigned int v184 = [v183 unsignedIntValue];

      long long v355 = 0u;
      long long v356 = 0u;
      long long v353 = 0u;
      long long v354 = 0u;
      v185 = [(ZWUIServer *)self zoomRootViewControllers];
      v186 = [v185 allKeys];

      id objb = v186;
      id v187 = [v186 countByEnumeratingWithState:&v353 objects:v440 count:16];
      if (!v187) {
        goto LABEL_274;
      }
      id v188 = v187;
      uint64_t v300 = *(void *)v354;
      while (1)
      {
        for (i9 = 0; i9 != v188; i9 = (char *)i9 + 1)
        {
          if (*(void *)v354 != v300) {
            objc_enumerationMutation(objb);
          }
          v190 = *(void **)(*((void *)&v353 + 1) + 8 * (void)i9);
          v191 = [(ZWUIServer *)self zoomRootViewControllers];
          v192 = [v191 objectForKeyedSubscript:v190];

          v193 = [v192 view];
          v194 = [v193 window];
          v195 = [v194 screen];
          v196 = [v195 displayIdentity];
          if ([v196 displayID] == v184)
          {

LABEL_273:
            v283 = [v8 objectForKeyedSubscript:@"zoomLevel"];
            [v283 doubleValue];
            objc_msgSend(v192, "externalClientSetZoomFactor:");

            goto LABEL_274;
          }
          if (v184)
          {
          }
          else
          {
            unsigned __int8 v197 = [v190 isEqualToString:@"MAIN-DISPLAY"];

            if (v197) {
              goto LABEL_273;
            }
          }
        }
        id v188 = [objb countByEnumeratingWithState:&v353 objects:v440 count:16];
        if (!v188) {
          goto LABEL_274;
        }
      }
    case 0x7E5uLL:
      id v293 = v9;
      v198 = [v8 objectForKeyedSubscript:@"autoPanLocation"];
      CGPoint v199 = CGPointFromString(v198);

      v200 = [v8 objectForKeyedSubscript:@"panningStyle"];
      id v290 = [v200 unsignedIntegerValue];

      v201 = [v8 objectForKeyedSubscript:@"displayID"];
      unsigned int v202 = [v201 unsignedIntValue];

      long long v335 = 0u;
      long long v336 = 0u;
      long long v333 = 0u;
      long long v334 = 0u;
      v203 = [(ZWUIServer *)self zoomRootViewControllers];
      v204 = [v203 allKeys];

      id objb = v204;
      id v205 = [v204 countByEnumeratingWithState:&v333 objects:v429 count:16];
      if (!v205) {
        goto LABEL_274;
      }
      id v206 = v205;
      uint64_t v301 = *(void *)v334;
      while (1)
      {
        for (i10 = 0; i10 != v206; i10 = (char *)i10 + 1)
        {
          if (*(void *)v334 != v301) {
            objc_enumerationMutation(objb);
          }
          v208 = *(void **)(*((void *)&v333 + 1) + 8 * (void)i10);
          v209 = [(ZWUIServer *)self zoomRootViewControllers];
          v210 = [v209 objectForKeyedSubscript:v208];

          v211 = [v210 view];
          v212 = [v211 window];
          v213 = [v212 screen];
          v214 = [v213 displayIdentity];
          if ([v214 displayID] == v202)
          {

LABEL_257:
            objc_msgSend(v210, "externalClientWantsToAutopan:withPanningStyle:", v290, v199.x, v199.y);

            goto LABEL_274;
          }
          if (v202)
          {
          }
          else
          {
            unsigned __int8 v215 = [v208 isEqualToString:@"MAIN-DISPLAY"];

            if (v215) {
              goto LABEL_257;
            }
          }
        }
        id v206 = [objb countByEnumeratingWithState:&v333 objects:v429 count:16];
        if (!v206) {
          goto LABEL_274;
        }
      }
    case 0x7E6uLL:
      long long v311 = 0u;
      long long v312 = 0u;
      long long v309 = 0u;
      long long v310 = 0u;
      v216 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v216 allValues];

      id v217 = [v15 countByEnumeratingWithState:&v309 objects:v421 count:16];
      if (v217)
      {
        id v218 = v217;
        uint64_t v219 = *(void *)v310;
        do
        {
          for (i11 = 0; i11 != v218; i11 = (char *)i11 + 1)
          {
            if (*(void *)v310 != v219) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v309 + 1) + 8 * (void)i11) handleDragWillStart];
          }
          id v218 = [v15 countByEnumeratingWithState:&v309 objects:v421 count:16];
        }
        while (v218);
      }
      goto LABEL_209;
    case 0x7E7uLL:
      long long v307 = 0u;
      long long v308 = 0u;
      long long v305 = 0u;
      long long v306 = 0u;
      v221 = [(ZWUIServer *)self zoomRootViewControllers];
      id v15 = [v221 allValues];

      id v222 = [v15 countByEnumeratingWithState:&v305 objects:v420 count:16];
      if (v222)
      {
        id v223 = v222;
        uint64_t v224 = *(void *)v306;
        do
        {
          for (i12 = 0; i12 != v223; i12 = (char *)i12 + 1)
          {
            if (*(void *)v306 != v224) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v305 + 1) + 8 * (void)i12) handleDragWillEnd];
          }
          id v223 = [v15 countByEnumeratingWithState:&v305 objects:v420 count:16];
        }
        while (v223);
      }
      goto LABEL_209;
    case 0x7E8uLL:
      v227 = [v8 objectForKeyedSubscript:@"register"];
      unsigned __int8 v228 = [v227 BOOLValue];

      v229 = [v8 objectForKeyedSubscript:@"attributes"];
      v230 = self->_zoomListenersUpdateQueue;
      v401[0] = _NSConcreteStackBlock;
      v401[1] = 3221225472;
      v401[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_13;
      v401[3] = &unk_79140;
      id v402 = v229;
      v403 = self;
      unsigned __int8 v405 = v228;
      id v404 = v10;
      id v163 = v229;
      dispatch_async(v230, v401);

LABEL_215:
      goto LABEL_210;
    default:
      if (a4 == 1000)
      {
        v419[0] = _NSConcreteStackBlock;
        v419[1] = 3221225472;
        v419[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke;
        v419[3] = &unk_78CA8;
        long long v35 = self;
        v419[4] = self;
        CGRect v36 = v419;
      }
      else
      {
        if (a4 != 1001) {
          goto LABEL_29;
        }
        v418[0] = _NSConcreteStackBlock;
        v418[1] = 3221225472;
        v418[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_2;
        v418[3] = &unk_78CA8;
        long long v35 = self;
        v418[4] = self;
        CGRect v36 = v418;
      }
      [(ZWUIServer *)v35 _waitForControllerShowHideToComplete:v36];
      goto LABEL_210;
  }
  do
  {
    if (*(void *)v358 != v299) {
      objc_enumerationMutation(objb);
    }
    v172 = *(void **)(*((void *)&v357 + 1) + 8 * (void)v171);
    v173 = [(ZWUIServer *)self zoomRootViewControllers];
    v174 = [v173 objectForKeyedSubscript:v172];

    v175 = [v174 view];
    v176 = [v175 window];
    v177 = [v176 screen];
    v178 = [v177 displayIdentity];
    if ([v178 displayID] == v166)
    {

LABEL_254:
      [v174 zoomPanOffset];
      double v268 = v267;
      double v270 = v269;
      [v174 zoomFrame];
      double v272 = v271;
      double v274 = v273;
      v275 = [v8 objectForKeyedSubscript:@"direction"];
      unsigned int v276 = [v275 isEqualToString:@"left"];

      if (v276)
      {
        double v277 = -0.5;
      }
      else
      {
        v281 = [v8 objectForKeyedSubscript:@"direction"];
        unsigned int v282 = [v281 isEqualToString:@"right"];

        if (!v282)
        {
          v284 = [v8 objectForKeyedSubscript:@"direction"];
          unsigned int v285 = [v284 isEqualToString:@"up"];

          if (v285)
          {
            double v270 = v270 + v274 * -0.5;
          }
          else
          {
            v286 = [v8 objectForKeyedSubscript:@"direction"];
            unsigned int v287 = [v286 isEqualToString:@"down"];

            if (v287) {
              double v270 = v270 + v274 * 0.5;
            }
          }
          goto LABEL_268;
        }
        double v277 = 0.5;
      }
      double v268 = v268 + v272 * v277;
LABEL_268:
      objc_msgSend(v174, "externalClientSetZoomPanOffset:", v268, v270);

      goto LABEL_274;
    }
    if (v166)
    {
    }
    else
    {
      unsigned __int8 v179 = [v172 isEqualToString:@"MAIN-DISPLAY"];

      if (v179) {
        goto LABEL_254;
      }
    }

    v171 = (char *)v171 + 1;
  }
  while (v170 != v171);
  id v170 = [objb countByEnumeratingWithState:&v357 objects:v441 count:16];
  if (v170) {
    goto LABEL_159;
  }
LABEL_274:

  long long v13 = 0;
  long long v10 = v293;
LABEL_211:

  return v13;
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v2 = [*(id *)(a1 + 32) zoomRootViewControllers];
  uint64_t v3 = [v2 allKeys];

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v46;
    uint64_t v35 = v1;
    uint64_t v37 = *(void *)v46;
    do
    {
      id v7 = 0;
      id v38 = v5;
      do
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v7);
        id v9 = [*(id *)(v1 + 32) zoomRootViewControllers];
        long long v10 = [v9 objectForKeyedSubscript:v8];

        if (([v10 isZoomLensVisible] & 1) == 0)
        {
          [*(id *)(v1 + 32) _showingOrHidingControllerWillBegin];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v11 = [*(id *)(v1 + 32) externalWindowScenes];
          id v12 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v42;
            while (2)
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v42 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                id v17 = [v16 _sceneIdentifier];
                unsigned int v18 = [v17 isEqualToString:v8];

                if (v18)
                {
                  id v19 = v16;
                  goto LABEL_17;
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
              if (v13) {
                continue;
              }
              break;
            }
            id v19 = 0;
LABEL_17:
            uint64_t v1 = v35;
          }
          else
          {
            id v19 = 0;
          }

          id v20 = +[AXUIDisplayManager sharedDisplayManager];
          [v20 addContentViewController:v10 withUserInteractionEnabled:1 forService:*(void *)(v1 + 32) forSceneClientIdentifier:@"kAXZoomSceneClientIdentifier" context:0 userInterfaceStyle:1 forWindowScene:v19 completion:0];

          unsigned int v21 = +[AXSubsystemZoom sharedInstance];
          unsigned __int8 v22 = [v21 ignoreLogging];

          if ((v22 & 1) == 0)
          {
            id v23 = +[AXSubsystemZoom identifier];
            id v24 = AXLoggerForFacility();

            os_log_type_t v25 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v24, v25))
            {
              CGRect v36 = AXColorizeFormatLog();
              unsigned __int8 v34 = [v10 view];
              [v34 bounds];
              v26 = NSStringFromCGRect(v53);
              [v10 view];
              v27 = os_log_type_t v33 = v25;
              long long v28 = [v27 window];
              [v28 bounds];
              long long v31 = NSStringFromCGRect(v54);
              id v32 = [v10 interfaceOrientation];
              long long v30 = v26;
              long long v29 = _AXStringForArgs();

              if (os_log_type_enabled(v24, v33))
              {
                *(_DWORD *)buf = 138543362;
                v50 = v29;
                _os_log_impl(&dword_0, v24, v33, "%{public}@", buf, 0xCu);
              }
            }
          }
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_322;
          v40[3] = &unk_78CA8;
          v40[4] = *(void *)(v1 + 32);
          objc_msgSend(v10, "showZoomSlugAndLens:completion:", 1, v40, v30, v31, v32);

          uint64_t v6 = v37;
          id v5 = v38;
        }

        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v5);
  }
}

id __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_322(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showingOrHidingControllerWillEnd];
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_2(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [*(id *)(a1 + 32) zoomRootViewControllers];
  uint64_t v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isZoomLensVisible])
        {
          [*(id *)(a1 + 32) _showingOrHidingControllerWillBegin];
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_3;
          v10[3] = &unk_79118;
          uint64_t v9 = *(void *)(a1 + 32);
          v10[4] = v8;
          v10[5] = v9;
          [v8 hideZoomSlugAndLens:1 completion:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

id __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_3(uint64_t a1)
{
  id v2 = +[AXUIDisplayManager sharedDisplayManager];
  [v2 removeContentViewController:*(void *)(a1 + 32) withUserInteractionEnabled:1 forService:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 _showingOrHidingControllerWillEnd];
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_4(uint64_t a1)
{
  id v2 = +[AXSystemAppServer server];
  uint64_t v3 = [v2 focusedApps];

  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"appID"];
  id v7 = *(id *)(a1 + 32);
  id v4 = v6;
  id v5 = v3;
  AXPerformBlockOnMainThread();
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_5(uint64_t a1)
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v36 + 1) + 8 * i) bundleIdentifier];
        LODWORD(v7) = [v7 isEqualToString:v8];

        if (v7)
        {
          id v29 = v2;
          uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"keyboardFrame"];
          NSRect v42 = NSRectFromString(v9);
          double x = v42.origin.x;
          double y = v42.origin.y;
          double width = v42.size.width;
          double height = v42.size.height;

          long long v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"displayID"];
          unsigned int v15 = [v14 unsignedIntValue];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v16 = [*(id *)(a1 + 56) zoomRootViewControllers];
          id v17 = [v16 allKeys];

          id obj = v17;
          id v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v31 = *(void *)v33;
            while (2)
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v33 != v31) {
                  objc_enumerationMutation(obj);
                }
                unsigned int v21 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                unsigned __int8 v22 = [*(id *)(a1 + 56) zoomRootViewControllers];
                id v23 = [v22 objectForKeyedSubscript:v21];

                id v24 = [v23 view];
                os_log_type_t v25 = [v24 window];
                v26 = [v25 screen];
                v27 = [v26 displayIdentity];
                if ([v27 displayID] == v15)
                {

LABEL_23:
                  objc_msgSend(v23, "handleKeyboardWillAppearWithFrame:inAppWithBundleID:", *(void *)(a1 + 40), x, y, width, height);

                  goto LABEL_24;
                }
                if (v15)
                {
                }
                else
                {
                  unsigned __int8 v28 = [v21 isEqualToString:@"MAIN-DISPLAY"];

                  if (v28) {
                    goto LABEL_23;
                  }
                }
              }
              id v19 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          id v2 = v29;
          goto LABEL_25;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_25:
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_6(uint64_t a1)
{
  id v2 = +[AXSystemAppServer server];
  id v3 = [v2 focusedApps];

  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"appID"];
  id v4 = v6;
  id v5 = v3;
  AXPerformBlockOnMainThread();
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_7(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) bundleIdentifier];
        LODWORD(v7) = [v7 isEqualToString:v8];

        if (v7)
        {
          processMessage_withIdentifier_fromClientWithIdentifier_error__LastKbHideNotification = CFAbsoluteTimeGetCurrent();
          uint64_t v9 = [*(id *)(a1 + 48) keyboardHideTimer];
          [v9 cancel];

          long long v10 = [*(id *)(a1 + 48) keyboardHideTimer];
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_8;
          v13[3] = &unk_79118;
          int8x16_t v12 = *(int8x16_t *)(a1 + 40);
          id v11 = (id)v12.i64[0];
          int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
          [v10 afterDelay:v13 processBlock:0.1];

          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_8(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "zoomRootViewControllers", 0);
  id v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) handleKeyboardWillHideInAppWithBundleID:*(void *)(a1 + 40)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_9(uint64_t a1)
{
  id v2 = +[AXSystemAppServer server];
  id v3 = [v2 focusedApps];

  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"appID"];
  id v4 = v6;
  id v5 = v3;
  AXPerformBlockOnMainThread();
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_10(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        long long v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "bundleIdentifier", (void)v10);
        LODWORD(v7) = [v7 isEqualToString:v8];

        if (v7)
        {
          if (CFAbsoluteTimeGetCurrent()
             - *(double *)&processMessage_withIdentifier_fromClientWithIdentifier_error__LastKbHideNotification < 0.1)
          {
            long long v9 = [*(id *)(a1 + 48) keyboardHideTimer];
            [v9 cancel];
          }
          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_11(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2) {
    [v4 addObject:v3];
  }
  else {
    [v4 removeObject:v3];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_12;
  block[3] = &unk_78E90;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 48);
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_12(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = objc_msgSend(*(id *)(a1 + 32), "zoomRootViewControllers", 0);
  uint64_t v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) zoomListenerRegisteredForAllAttributeUpdatesCoalesced:*(unsigned __int8 *)(a1 + 48) clientIdentifier:*(void *)(a1 + 40)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_13(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v8 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v7];
        long long v9 = v8;
        if (*(unsigned char *)(a1 + 56))
        {
          if (!v8)
          {
            long long v9 = objc_opt_new();
            [*(id *)(*(void *)(a1 + 40) + 24) setObject:v9 forKey:v7];
          }
          [v9 addObject:*(void *)(a1 + 48)];
        }
        else
        {
          [v8 removeObject:*(void *)(a1 + 48)];
          id v10 = [v9 count];
          long long v11 = *(void **)(*(void *)(a1 + 40) + 24);
          if (v10) {
            [v11 setObject:v9 forKey:*(void *)(a1 + 48)];
          }
          else {
            [v11 removeObjectForKey:v7];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_14;
  block[3] = &unk_79140;
  int8x16_t v13 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v13.i64[0];
  int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
  char v17 = *(unsigned char *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_14(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "zoomRootViewControllers", 0);
  id v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) zoomListenerRegisteredForAttributeUpdatesImmediately:*(void *)(a1 + 40) registered:*(unsigned __int8 *)(a1 + 56) clientIdentifier:*(void *)(a1 + 48)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (OS_dispatch_group)showHideGroup
{
  return self->_showHideGroup;
}

- (void)setShowHideGroup:(id)a3
{
}

- (OS_dispatch_queue)showHideQueue
{
  return self->_showHideQueue;
}

- (void)setShowHideQueue:(id)a3
{
}

- (AXDispatchTimer)keyboardHideTimer
{
  return self->_keyboardHideTimer;
}

- (void)setKeyboardHideTimer:(id)a3
{
}

- (NSMutableArray)externalWindowScenes
{
  return self->_externalWindowScenes;
}

- (void)setExternalWindowScenes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalWindowScenes, 0);
  objc_storeStrong((id *)&self->_keyboardHideTimer, 0);
  objc_storeStrong((id *)&self->_showHideQueue, 0);
  objc_storeStrong((id *)&self->_showHideGroup, 0);
  objc_storeStrong((id *)&self->_zoomServicesUpdate, 0);
  objc_storeStrong((id *)&self->_zoomListenerUpdateTimer, 0);
  objc_storeStrong((id *)&self->_focusedAppsRetrievalQueue, 0);
  objc_storeStrong((id *)&self->_zoomListenersUpdateQueue, 0);
  objc_storeStrong((id *)&self->_lastCachedDataByDisplayID, 0);
  objc_storeStrong((id *)&self->_zoomAttributeListeners, 0);
  objc_storeStrong((id *)&self->_zoomListeners, 0);

  objc_storeStrong((id *)&self->_zoomRootViewControllers, 0);
}

@end