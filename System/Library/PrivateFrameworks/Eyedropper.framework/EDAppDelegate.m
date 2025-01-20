@interface EDAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CGPoint)_lastDisplayLocationForLensView:(id)a3;
- (CGPoint)_startingPointForWindow:(id)a3;
- (EDAppDelegate)init;
- (EDLensView)activeLensView;
- (id)mainScreenLensView;
- (id)mainScreenWindow;
- (void)_enumerateRemoteClientsUsingBlock:(id)a3;
- (void)_sceneDidDisconnect:(id)a3;
- (void)_sceneWillConnect:(id)a3;
- (void)_updateLastDisplayLocation:(CGPoint)a3 forLensView:(id)a4;
- (void)beginShowingEyeDropper:(id)a3;
- (void)cancelShowingEyeDropper;
- (void)dismissEyedropper;
- (void)floatEyeDropper;
- (void)hideSystemPointer:(BOOL)a3;
- (void)lensView:(id)a3 didSelectColor:(id)a4;
- (void)lensViewDidActivate:(id)a3;
- (void)lockStateChanged;
- (void)performOnAllWindows:(id)a3;
- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
@end

@implementation EDAppDelegate

- (EDAppDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)EDAppDelegate;
  v2 = [(EDAppDelegate *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__sceneWillConnect_ name:*MEMORY[0x263F1D580] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__sceneDidDisconnect_ name:*MEMORY[0x263F1D570] object:0];

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    mousePointerServiceAssertionByDisplayIdentifier = v2->_mousePointerServiceAssertionByDisplayIdentifier;
    v2->_mousePointerServiceAssertionByDisplayIdentifier = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)_sceneWillConnect:(id)a3
{
  id v9 = [a3 object];
  v4 = [v9 delegate];
  uint64_t v5 = EDDisplayIdentifierForWindowScene(v9);
  sceneDelegateByDisplayIdentifier = self->_sceneDelegateByDisplayIdentifier;
  if (!sceneDelegateByDisplayIdentifier)
  {
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    objc_super v8 = self->_sceneDelegateByDisplayIdentifier;
    self->_sceneDelegateByDisplayIdentifier = v7;

    sceneDelegateByDisplayIdentifier = self->_sceneDelegateByDisplayIdentifier;
  }
  [(NSMutableDictionary *)sceneDelegateByDisplayIdentifier setObject:v4 forKey:v5];
}

- (void)_sceneDidDisconnect:(id)a3
{
  id v5 = [a3 object];
  v4 = EDDisplayIdentifierForWindowScene(v5);
  [(NSMutableDictionary *)self->_sceneDelegateByDisplayIdentifier removeObjectForKey:v4];
}

- (id)mainScreenWindow
{
  v2 = [(NSMutableDictionary *)self->_sceneDelegateByDisplayIdentifier objectForKey:EDEmbeddedDisplayIdentifier];
  v3 = [v2 window];

  return v3;
}

- (id)mainScreenLensView
{
  v2 = [(EDAppDelegate *)self mainScreenWindow];
  v3 = [v2 rootViewController];
  v4 = [v3 lensView];

  return v4;
}

- (EDLensView)activeLensView
{
  activeLensView = self->_activeLensView;
  if (activeLensView)
  {
    v3 = activeLensView;
  }
  else
  {
    v3 = [(EDAppDelegate *)self mainScreenLensView];
  }

  return v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.uikit.eyedropperd.service"];
  serviceListener = self->_serviceListener;
  self->_serviceListener = v5;

  [(NSXPCListener *)self->_serviceListener setDelegate:self];
  v7 = [MEMORY[0x263EFF980] array];
  liveConnections = self->_liveConnections;
  self->_liveConnections = v7;

  id v9 = (PSPointerClientController *)objc_opt_new();
  pointerClientController = self->_pointerClientController;
  self->_pointerClientController = v9;

  v11 = (void *)*MEMORY[0x263F1D020];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke;
  v14[3] = &unk_264CFF310;
  v14[4] = self;
  [v11 _performBlockAfterCATransactionCommits:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke_2;
  v13[3] = &unk_264CFF338;
  v13[4] = self;
  notify_register_dispatch("com.apple.springboard.lockstate", &self->_notifyTokenLocked, MEMORY[0x263EF83A0], v13);
  return 1;
}

uint64_t __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) resume];
}

uint64_t __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) lockStateChanged];
}

- (void)lockStateChanged
{
  if (self->_notifyTokenLocked != -1)
  {
    if (SBSGetScreenLockStatus())
    {
      [(EDAppDelegate *)self cancelShowingEyeDropper];
      v3 = &__block_literal_global;
    }
    else
    {
      v3 = &__block_literal_global_17;
    }
    [(EDAppDelegate *)self performOnAllWindows:v3];
  }
}

uint64_t __33__EDAppDelegate_lockStateChanged__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:1];
}

uint64_t __33__EDAppDelegate_lockStateChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

- (void)performOnAllWindows:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NSMutableDictionary *)self->_sceneDelegateByDisplayIdentifier allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    v15 = (char *)(v4 + 2);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = -[NSMutableDictionary objectForKey:](self->_mousePointerServiceAssertionByDisplayIdentifier, "objectForKey:", v10, v15);
        if (!v11)
        {
          v12 = [(NSMutableDictionary *)self->_sceneDelegateByDisplayIdentifier objectForKey:v10];
          v13 = v12;
          if (v4)
          {
            v14 = [v12 window];
            v4[2](v4, v14);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EAFFE98];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EAFFF98];
  [v7 setRemoteObjectInterface:v9];

  [(NSMutableArray *)self->_liveConnections addObject:v7];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_264CFF380;
  objc_copyWeak(&v15, &from);
  [v7 setInterruptionHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v11[3] = &unk_264CFF3A8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v7 setInvalidationHandler:v11];
  [v7 resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained[4] removeObject:v2];
  }
}

- (void)_enumerateRemoteClientsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_liveConnections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "remoteObjectProxy", (void)v11);
        if (v10) {
          v4[2](v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v7 = a6;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)*MEMORY[0x263F1D020];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__EDAppDelegate_scene_didUpdateWithDiff_transitionContext_completion___block_invoke;
    v10[3] = &unk_264CFF3D0;
    id v11 = v7;
    [v9 _scheduleSceneEventResponseForScene:a3 withResponseBlock:v10];
  }
}

void __70__EDAppDelegate_scene_didUpdateWithDiff_transitionContext_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F3F810]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hideSystemPointer:(BOOL)a3
{
  hidePointerAssertion = self->_hidePointerAssertion;
  if (a3)
  {
    if (hidePointerAssertion) {
      return;
    }
    id v5 = [(PSPointerClientController *)self->_pointerClientController persistentlyHidePointerAssertionForReason:5];
  }
  else
  {
    [(BSInvalidatable *)hidePointerAssertion invalidate];
    id v5 = 0;
  }
  self->_hidePointerAssertion = v5;

  MEMORY[0x270F9A758]();
}

- (CGPoint)_startingPointForWindow:(id)a3
{
  [a3 bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v12);
  double v9 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v9;
  return result;
}

- (void)beginShowingEyeDropper:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (!v4) {
    id v4 = (id)EDEmbeddedDisplayIdentifier;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__EDAppDelegate_beginShowingEyeDropper___block_invoke;
  v6[3] = &unk_264CFF3F8;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__EDAppDelegate_beginShowingEyeDropper___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) performOnAllWindows:&__block_literal_global_71];
    v32 = [WeakRetained[11] objectForKey:*(void *)(a1 + 40)];
    v3 = [v32 lensView];
    [v3 lastPosition];
    if (v5 == *MEMORY[0x263F00148] && v4 == *(double *)(MEMORY[0x263F00148] + 8))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v3 window];
      [v7 _startingPointForWindow:v8];
      objc_msgSend(v3, "setLastPosition:");
    }
    uint64_t v33 = a1;
    *((unsigned char *)WeakRetained + 56) = 0;
    *((unsigned char *)WeakRetained + 57) = 0;
    objc_msgSend(v3, "setFloatingMode:", 0, v3);
    if (!WeakRetained[6])
    {
      id v9 = objc_alloc(MEMORY[0x263F298C0]);
      uint64_t v10 = [WeakRetained mainScreenWindow];
      uint64_t v11 = [v10 _contextId];
      CGRect v12 = objc_opt_new();
      uint64_t v13 = [v9 initWithContextID:v11 displayUUID:0 identifier:2 policy:v12];
      id v14 = WeakRetained[6];
      WeakRetained[6] = (id)v13;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [WeakRetained[11] allKeys];
    uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      unint64_t v18 = 0x268948000uLL;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v21 = *(int *)(v18 + 104);
          v22 = [*(id *)((char *)WeakRetained + v21) objectForKey:v20];
          if (!v22)
          {
            v23 = [WeakRetained[11] objectForKey:v20];
            v35 = v23;
            v24 = [MEMORY[0x263F29878] sharedInstance];
            if ([v20 isEqualToString:EDEmbeddedDisplayIdentifier]) {
              v25 = 0;
            }
            else {
              v25 = v20;
            }
            [v23 window];
            uint64_t v26 = v16;
            uint64_t v27 = v17;
            v28 = WeakRetained;
            v30 = unint64_t v29 = v18;
            v22 = objc_msgSend(v24, "requestGlobalMouseEventsForDisplay:targetContextID:", v25, objc_msgSend(v30, "_contextId"));

            unint64_t v18 = v29;
            id WeakRetained = v28;
            uint64_t v17 = v27;
            uint64_t v16 = v26;

            [*(id *)((char *)WeakRetained + v21) setObject:v22 forKey:v20];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }

    [*(id *)(v33 + 32) hideSystemPointer:1];
  }
}

uint64_t __40__EDAppDelegate_beginShowingEyeDropper___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 makeKeyAndVisible];
}

- (void)cancelShowingEyeDropper
{
  [(EDAppDelegate *)self hideSystemPointer:0];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__EDAppDelegate_cancelShowingEyeDropper__block_invoke;
  v3[3] = &unk_264CFF380;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__EDAppDelegate_cancelShowingEyeDropper__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissEyedropper];
    *((unsigned char *)v2 + 56) = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = objc_msgSend(*((id *)v2 + 11), "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) resetTouchesBeganTime];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_updateLastDisplayLocation:(CGPoint)a3 forLensView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v15 = v7;
  if (!self->_lastDisplayLocationByDisplayIdentifier)
  {
    long long v8 = [MEMORY[0x263EFF9A0] dictionary];
    lastDisplayLocationByDisplayIdentifier = self->_lastDisplayLocationByDisplayIdentifier;
    self->_lastDisplayLocationByDisplayIdentifier = v8;

    id v7 = v15;
  }
  long long v10 = [v7 window];
  long long v11 = [v10 windowScene];
  CGRect v12 = EDDisplayIdentifierForWindowScene(v11);

  if (v12)
  {
    uint64_t v13 = self->_lastDisplayLocationByDisplayIdentifier;
    id v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
    [(NSMutableDictionary *)v13 setObject:v14 forKey:v12];
  }
}

- (CGPoint)_lastDisplayLocationForLensView:(id)a3
{
  uint64_t v4 = [a3 window];
  uint64_t v5 = [v4 windowScene];
  uint64_t v6 = EDDisplayIdentifierForWindowScene(v5);

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_lastDisplayLocationByDisplayIdentifier objectForKey:v6];
    [v7 CGPointValue];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x263F00148];
    double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  }

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)floatEyeDropper
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__EDAppDelegate_floatEyeDropper__block_invoke;
  block[3] = &unk_264CFF420;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __32__EDAppDelegate_floatEyeDropper__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 57))
    {
      id v4 = [WeakRetained activeLensView];
      char v5 = [v4 isActive];

      if ((v5 & 1) == 0)
      {
        [v3 hideSystemPointer:0];
        *((unsigned char *)v3 + 56) = 1;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v6 = objc_msgSend(v3[11], "allValues", 0);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v37 != v9) {
                objc_enumerationMutation(v6);
              }
              double v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              double v12 = [v11 lensView];
              [v12 setFloatingMode:1];

              double v13 = [v11 window];
              id v14 = [v13 layer];
              [v14 setHitTestsAsOpaque:1];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v8);
        }

        id v15 = [v3 activeLensView];
        uint64_t v16 = [v15 window];
        uint64_t v17 = [v16 screen];
        [v17 bounds];
        double v19 = v18;
        double v21 = v20;

        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        if (v22 - *((double *)v3 + 8) >= 10.0)
        {
          double v25 = v19 * 0.5;
          double v27 = v21 * 0.5;
        }
        else
        {
          v23 = [v3 activeLensView];
          [v3 _lastDisplayLocationForLensView:v23];
          double v25 = v24;
          double v27 = v26;
        }
        if (v25 == *MEMORY[0x263F00148] && v27 == *(double *)(MEMORY[0x263F00148] + 8))
        {
          v28 = *(void **)(a1 + 32);
          unint64_t v29 = [v3 activeLensView];
          v30 = [v29 window];
          [v28 _startingPointForWindow:v30];
          double v25 = v31;
          double v27 = v32;
        }
        uint64_t v33 = [v3 activeLensView];
        objc_msgSend(v33, "updateCenterOffsetAtTouchDown:", v25, v27);

        v34 = [v3 activeLensView];
        objc_msgSend(v34, "presentAtLocation:", v25, v27);

        v35 = [v3 activeLensView];
        [v35 setActive:1];
      }
    }
  }
}

- (void)lensView:(id)a3 didSelectColor:(id)a4
{
  id v6 = a4;
  self->_selectedColor = 1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__EDAppDelegate_lensView_didSelectColor___block_invoke;
  v9[3] = &unk_264CFF448;
  id v10 = v6;
  id v7 = v6;
  id v8 = a3;
  [(EDAppDelegate *)self _enumerateRemoteClientsUsingBlock:v9];
  [v8 lastPosition];
  -[EDAppDelegate _updateLastDisplayLocation:forLensView:](self, "_updateLastDisplayLocation:forLensView:", v8);
}

uint64_t __41__EDAppDelegate_lensView_didSelectColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 eyedropperDidSelectColor:*(void *)(a1 + 32)];
}

- (void)lensViewDidActivate:(id)a3
{
  id v5 = a3;
  p_activeLensView = (id *)&self->_activeLensView;
  id v7 = *p_activeLensView;
  if (*p_activeLensView != v5)
  {
    id v15 = v5;
    double v8 = *MEMORY[0x263F00148];
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
    double v10 = v9;
    double v11 = *MEMORY[0x263F00148];
    if (v7)
    {
      [v7 centerOffsetAtTouchDown];
      double v11 = v12;
      double v10 = v13;
      [*p_activeLensView setActive:0];
    }
    objc_storeStrong(p_activeLensView, a3);
    BOOL v14 = v11 == v8 && v10 == v9;
    id v5 = v15;
    if (!v14)
    {
      id v7 = (id)objc_msgSend(*p_activeLensView, "setCenterOffsetAtTouchDown:", v11, v10);
      id v5 = v15;
    }
  }

  MEMORY[0x270F9A758](v7, v5);
}

- (void)dismissEyedropper
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!self->_selectedColor) {
    [(EDAppDelegate *)self _enumerateRemoteClientsUsingBlock:&__block_literal_global_79];
  }
  v3 = [(EDAppDelegate *)self activeLensView];
  [v3 setActive:0];

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_lastDismissedTime = v4;
  if (self->_isFloating)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = [(NSMutableDictionary *)self->_sceneDelegateByDisplayIdentifier allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) window];
          double v11 = [v10 layer];
          [v11 setHitTestsAsOpaque:0];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v7);
    }
  }
  [(EDAppDelegate *)self hideSystemPointer:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v12 = self->_liveConnections;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * j) invalidate];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v14);
  }

  touchStream = self->_touchStream;
  if (touchStream)
  {
    [(BKSTouchStream *)touchStream invalidate];
    double v18 = self->_touchStream;
    self->_touchStream = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v19 = [(NSMutableDictionary *)self->_sceneDelegateByDisplayIdentifier allKeys];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * k);
        double v25 = [(NSMutableDictionary *)self->_mousePointerServiceAssertionByDisplayIdentifier objectForKey:v24];
        double v26 = v25;
        if (v25)
        {
          [v25 invalidate];
          [(NSMutableDictionary *)self->_mousePointerServiceAssertionByDisplayIdentifier removeObjectForKey:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v21);
  }
}

uint64_t __34__EDAppDelegate_dismissEyedropper__block_invoke(uint64_t a1, void *a2)
{
  return [a2 eyedropperDidSelectColor:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLensView, 0);
  objc_storeStrong((id *)&self->_lastDisplayLocationByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_mousePointerServiceAssertionByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneDelegateByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_hidePointerAssertion, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_liveConnections, 0);

  objc_storeStrong((id *)&self->_serviceListener, 0);
}

@end