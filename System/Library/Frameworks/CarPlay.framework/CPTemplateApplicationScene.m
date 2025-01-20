@interface CPTemplateApplicationScene
+ (BOOL)_hostsWindows;
+ (CPTemplateApplicationScene)activeTemplateScene;
- (BOOL)_permitContextCreationForBindingDescription:(id *)a3;
- (BOOL)_sceneWillConnect;
- (BOOL)_shouldCallAppDelegate;
- (BOOL)_shouldCreateCarWindow;
- (CGRect)_referenceBounds;
- (CPInterfaceController)interfaceController;
- (CPTemplateApplicationScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (CPTemplateUISceneSettingsDiffAction)sceneSettingsDiffAction;
- (CPUIContentStyleDiffInspector)mapStyleInspector;
- (CPUIFrameRateLimitDiffInspector)frameRateLimitInspector;
- (CPWindow)carWindow;
- (NSNumber)frameRateLimit;
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsInterfaceStyleDiffInspector;
- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3;
- (UIScreen)_screen;
- (UITraitCollection)_traitCollection;
- (UITraitCollection)carTraitCollection;
- (UIUserInterfaceStyle)contentStyle;
- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4;
- (id)_componentForKey:(id)a3;
- (id)_definition;
- (id)_fbsSceneLayerForWindow:(id)a3;
- (id)_frameRateLimit;
- (id)_templateSettings;
- (int64_t)_interfaceOrientation;
- (int64_t)_mapStyle;
- (void)_attachWindow:(id)a3;
- (void)_deliverInterfaceControllerToDelegate;
- (void)_detachWindow:(id)a3;
- (void)_invalidate;
- (void)_readySceneForConnection;
- (void)_refreshTraitCollection;
- (void)_updateContentStyle;
- (void)_updateFrameRateLimit;
- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3;
- (void)_windowUpdatedProperties:(id)a3;
- (void)_windowUpdatedVisibility:(id)a3;
- (void)setCarWindow:(id)a3;
- (void)setFrameRateLimit:(id)a3;
- (void)setFrameRateLimitInspector:(id)a3;
- (void)setMapStyleInspector:(id)a3;
- (void)setSceneSettingsDiffAction:(id)a3;
- (void)setSceneSettingsInterfaceStyleDiffInspector:(id)a3;
- (void)updateLayoutGuideWithInsets:(UIEdgeInsets)a3;
@end

@implementation CPTemplateApplicationScene

- (CPTemplateApplicationScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  v61[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)CPTemplateApplicationScene;
  v8 = [(CPTemplateApplicationScene *)&v59 initWithSession:v6 connectionOptions:v7];
  if (v8)
  {
    v9 = [v7 _specification];
    v10 = (objc_class *)[v9 sceneSubstrateClass];

    id v11 = objc_alloc(MEMORY[0x263F1CC58]);
    id v12 = [v10 alloc];
    v13 = [(CPTemplateApplicationScene *)v8 _FBSScene];
    v14 = (void *)[v12 initWithScene:v13];
    uint64_t v15 = [v11 initWithSubstrate:v14];
    contextBinder = v8->_contextBinder;
    v8->_contextBinder = (_UIContextBinder *)v15;

    [(_UIContextBinder *)v8->_contextBinder setContextCreationPolicyHolder:v8];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    v18 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v19 = *MEMORY[0x263F1D058];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke;
    v57[3] = &unk_264309CE8;
    v20 = v8;
    v58 = v20;
    uint64_t v21 = [v17 addObserverForName:v19 object:0 queue:v18 usingBlock:v57];
    didFinishLaunchingObserver = v20->_didFinishLaunchingObserver;
    v20->_didFinishLaunchingObserver = v21;

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    v24 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v25 = *MEMORY[0x263F1D580];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_4;
    v55[3] = &unk_264309CE8;
    v26 = v20;
    v56 = v26;
    uint64_t v27 = [v23 addObserverForName:v25 object:v26 queue:v24 usingBlock:v55];
    sceneWillConnectObserver = v26->_sceneWillConnectObserver;
    v26->_sceneWillConnectObserver = v27;

    uint64_t v29 = objc_opt_new();
    sceneSettingsInterfaceStyleDiffInspector = v26->_sceneSettingsInterfaceStyleDiffInspector;
    v26->_sceneSettingsInterfaceStyleDiffInspector = (UIApplicationSceneSettingsDiffInspector *)v29;

    objc_initWeak(&location, v26);
    v31 = v26->_sceneSettingsInterfaceStyleDiffInspector;
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_6;
    v52[3] = &unk_264309D10;
    objc_copyWeak(&v53, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v31 observeUserInterfaceStyleWithBlock:v52];
    v32 = [MEMORY[0x263EFF980] arrayWithObject:v26->_sceneSettingsInterfaceStyleDiffInspector];
    v33 = objc_alloc_init(CPUIContentStyleDiffInspector);
    mapStyleInspector = v26->_mapStyleInspector;
    v26->_mapStyleInspector = v33;

    v35 = v26->_mapStyleInspector;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_2;
    v50[3] = &unk_264309D10;
    objc_copyWeak(&v51, &location);
    [(CPUIContentStyleDiffInspector *)v35 observeMapStyleWithBlock:v50];
    [(CPTemplateApplicationScene *)v26 _updateContentStyle];
    v36 = objc_alloc_init(CPUIFrameRateLimitDiffInspector);
    frameRateLimitInspector = v26->_frameRateLimitInspector;
    v26->_frameRateLimitInspector = v36;

    v38 = v26->_frameRateLimitInspector;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_3;
    v48[3] = &unk_264309D10;
    objc_copyWeak(&v49, &location);
    [(CPUIFrameRateLimitDiffInspector *)v38 observeFrameRateLimitWithBlock:v48];
    [(CPTemplateApplicationScene *)v26 _updateFrameRateLimit];
    v61[0] = v26->_mapStyleInspector;
    v61[1] = v26->_frameRateLimitInspector;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
    [v32 addObjectsFromArray:v39];

    v40 = [[CPTemplateUISceneSettingsDiffAction alloc] initWithInspectors:v32];
    [(CPTemplateApplicationScene *)v26 setSceneSettingsDiffAction:v40];

    v41 = [(CPTemplateApplicationScene *)v26 sceneSettingsDiffAction];
    v60 = v41;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    [(CPTemplateApplicationScene *)v26 _registerSettingsDiffActionArray:v42 forKey:@"settingsObserver"];

    v43 = v26;
    v44 = (void *)_templateScenes;
    if (!_templateScenes)
    {
      uint64_t v45 = objc_opt_new();
      v46 = (void *)_templateScenes;
      _templateScenes = v45;

      v44 = (void *)_templateScenes;
    }
    [v44 insertObject:v43 atIndex:0];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }
  return v8;
}

uint64_t __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Did finish launching observer fired", v4, 2u);
  }

  return [*(id *)(a1 + 32) _deliverInterfaceControllerToDelegate];
}

uint64_t __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 272) = 1;
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Scene will connect observer fired", v4, 2u);
  }

  return [*(id *)(a1 + 32) _deliverInterfaceControllerToDelegate];
}

void __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshTraitCollection];
}

void __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContentStyle];
}

void __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFrameRateLimit];
}

- (void)_updateContentStyle
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_contentStyle = [(CPTemplateApplicationScene *)self _mapStyle];
  v3 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_contentStyle == 2) {
      v4 = @"dark";
    }
    else {
      v4 = @"light";
    }
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "Template scene content style updated to %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v5 = [(CPTemplateApplicationScene *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Informing delegate of style update", (uint8_t *)&v10, 2u);
    }

    v8 = [(CPTemplateApplicationScene *)self delegate];
    [v8 contentStyleDidChange:self->_contentStyle];
  }
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"CPTemplateApplicationSceneContentStyleUpdated" object:self];
}

- (int64_t)_mapStyle
{
  v2 = [(CPTemplateApplicationScene *)self _templateSettings];
  int64_t v3 = [v2 mapStyle];

  return v3;
}

- (void)_updateFrameRateLimit
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  self->_frameRateLimit = (NSNumber *)[(CPTemplateApplicationScene *)self _frameRateLimit];
  int64_t v3 = [(CPTemplateApplicationScene *)self _templateSettings];
  v4 = [v3 displayConfiguration];
  v5 = [v4 CADisplay];

  frameRateLimit = self->_frameRateLimit;
  if (frameRateLimit)
  {
    [(NSNumber *)frameRateLimit doubleValue];
    if (v7 <= 0.0) {
      double v8 = 30.0;
    }
    else {
      double v8 = v7;
    }
    v9 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v17 = v8;
      _os_log_impl(&dword_2181A5000, v9, OS_LOG_TYPE_DEFAULT, "Template app scene frameRateLimit updated to %{public}f fps", buf, 0xCu);
    }

    double v10 = 1.0 / v8;
  }
  else
  {
    id v11 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_DEFAULT, "Template app scene updated to unrestricted frame rate", buf, 2u);
    }

    double v10 = 0.0333333333;
  }
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:", v10, *MEMORY[0x263F15A60]);
  uint64_t v15 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v5 overrideDisplayTimings:v13];
}

- (id)_frameRateLimit
{
  v2 = [(CPTemplateApplicationScene *)self _templateSettings];
  int64_t v3 = [v2 frameRateLimit];

  return v3;
}

- (id)_templateSettings
{
  int64_t v3 = [(CPTemplateApplicationScene *)self _FBSScene];
  v4 = [v3 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v6 = [(CPTemplateApplicationScene *)self _FBSScene];
    double v7 = [v6 settings];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (BOOL)_hostsWindows
{
  return 1;
}

- (UITraitCollection)_traitCollection
{
  traitCollection = self->_traitCollection;
  if (!traitCollection)
  {
    [(CPTemplateApplicationScene *)self _refreshTraitCollection];
    traitCollection = self->_traitCollection;
  }

  return traitCollection;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3
{
  BOOL v3 = a3;
  [(CPTemplateApplicationScene *)self _refreshTraitCollection];
  v5.receiver = self;
  v5.super_class = (Class)CPTemplateApplicationScene;
  [(CPTemplateApplicationScene *)&v5 _updateSceneTraitsAndPushTraitsToScreen:v3];
}

- (UIScreen)_screen
{
  screen = self->_screen;
  if (!screen)
  {
    v4 = (void *)MEMORY[0x263F1C920];
    objc_super v5 = [(CPTemplateApplicationScene *)self _FBSScene];
    char v6 = [v4 _screenForScene:v5];
    double v7 = self->_screen;
    self->_screen = v6;

    screen = self->_screen;
  }

  return screen;
}

- (int64_t)_interfaceOrientation
{
  v2 = [(CPTemplateApplicationScene *)self _FBSScene];
  BOOL v3 = [v2 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    objc_super v5 = [v2 settings];
    int64_t v6 = [v5 interfaceOrientation];
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (CGRect)_referenceBounds
{
  v2 = [(CPTemplateApplicationScene *)self _FBSScene];
  BOOL v3 = [v2 settings];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_refreshTraitCollection
{
  v18[3] = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceIdiom:3];
  double v4 = (void *)MEMORY[0x263F1CB00];
  double v5 = [(CPTemplateApplicationScene *)self _screen];
  double v6 = [v5 traitCollection];
  [v6 displayScale];
  double v7 = objc_msgSend(v4, "traitCollectionWithDisplayScale:");

  objc_opt_class();
  double v8 = [(CPTemplateApplicationScene *)self _FBSScene];
  id v9 = [v8 settings];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  double v11 = (void *)MEMORY[0x263F1CB00];
  if (v10) {
    uint64_t v12 = [v10 userInterfaceStyle];
  }
  else {
    uint64_t v12 = 0;
  }
  double v13 = [v11 traitCollectionWithUserInterfaceStyle:v12];
  double v14 = (void *)MEMORY[0x263F1CB00];
  v18[0] = v3;
  v18[1] = v13;
  v18[2] = v7;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v16 = [v14 traitCollectionWithTraitsFromCollections:v15];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v16;
}

- (void)_attachWindow:(id)a3
{
  id v5 = a3;
  double v4 = [v5 _windowHostingScene];
  if (([v4 isEqual:self] & 1) == 0)
  {
    [v4 _detachWindow:v5];
    [(CPTemplateApplicationScene *)self __captureWindow:v5];
    [(_UIContextBinder *)self->_contextBinder enrollBindable:v5];
    [v5 _didMoveFromScene:v4 toScene:self];
  }
  if (([v5 isHidden] & 1) == 0) {
    [(_UIContextBinder *)self->_contextBinder attachBindable:v5];
  }
}

- (void)_detachWindow:(id)a3
{
  contextBinder = self->_contextBinder;
  id v5 = a3;
  [(_UIContextBinder *)contextBinder expellBindable:v5];
  [(CPTemplateApplicationScene *)self __releaseWindow:v5];
}

- (void)_windowUpdatedVisibility:(id)a3
{
  id v6 = a3;
  int v4 = [v6 isHidden];
  contextBinder = self->_contextBinder;
  if (v4) {
    [(_UIContextBinder *)contextBinder detachBindable:v6];
  }
  else {
    [(_UIContextBinder *)contextBinder attachBindable:v6];
  }
}

- (void)_windowUpdatedProperties:(id)a3
{
}

- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4
{
  BOOL v4 = a3;
  contextBinder = self->_contextBinder;
  if (a4) {
    [(_UIContextBinder *)contextBinder attachedBindables];
  }
  else {
  id v6 = [(_UIContextBinder *)contextBinder enrolledBindables];
  }
  double v7 = v6;
  if (v4)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_23];
    id v8 = [v7 filteredArrayUsingPredicate:v9];
  }

  return v8;
}

uint64_t __85__CPTemplateApplicationScene__allWindowsIncludingInternalWindows_onlyVisibleWindows___block_invoke()
{
  return 1;
}

- (BOOL)_permitContextCreationForBindingDescription:(id *)a3
{
  return 1;
}

- (id)_fbsSceneLayerForWindow:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_UIContextBinder *)self->_contextBinder substrate];
  id v6 = [v5 scene];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = [v6 clientSettings];
  id v8 = [v7 layers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v18 = v5;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          double v15 = [v14 CAContext];
          v16 = [v4 _boundContext];

          if (v15 == v16) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
    id v14 = 0;
LABEL_12:
    id v5 = v18;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_componentForKey:(id)a3
{
  return 0;
}

- (id)_definition
{
  return 0;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  BOOL v3 = [(CPTemplateApplicationScene *)self _FBSScene];
  id v4 = [v3 settings];
  int v5 = [v4 isUISubclass];

  if (v5)
  {
    id v6 = [v3 settings];
    [v6 safeAreaInsetsPortrait];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x263F1D1C0];
    double v10 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v12 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v14 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_readySceneForConnection
{
  v15.receiver = self;
  v15.super_class = (Class)CPTemplateApplicationScene;
  [(CPTemplateApplicationScene *)&v15 _readySceneForConnection];
  [(CPTemplateApplicationScene *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CPTemplateApplicationScene *)self _shouldCreateCarWindow])
  {
    double v11 = -[CPWindow initWithFrame:templateScene:]([CPWindow alloc], "initWithFrame:templateScene:", self, v4, v6, v8, v10);
    carWindow = self->_carWindow;
    self->_carWindow = v11;

    [(CPWindow *)self->_carWindow _setWindowHostingScene:self];
    [(CPWindow *)self->_carWindow setAutoresizesSubviews:1];
    [(CPWindow *)self->_carWindow setAutoresizingMask:18];
    -[CPWindow setFrame:](self->_carWindow, "setFrame:", v4, v6, v8, v10);
    [(CPWindow *)self->_carWindow makeKeyAndVisible];
  }
  double v13 = [[CPInterfaceController alloc] _init];
  interfaceController = self->_interfaceController;
  self->_interfaceController = v13;

  [(CPInterfaceController *)self->_interfaceController setWindowProvider:self];
  [(CPInterfaceController *)self->_interfaceController _sceneConnect:self];
}

- (void)_invalidate
{
  [(CPInterfaceController *)self->_interfaceController _invalidate];
  double v3 = [(CPTemplateApplicationScene *)self delegate];
  if ([(CPTemplateApplicationScene *)self _shouldCreateCarWindow]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 templateApplicationScene:self didDisconnectInterfaceController:self->_interfaceController fromWindow:self->_carWindow];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 templateApplicationScene:self didDisconnectInterfaceController:self->_interfaceController];
  }
  else if ([(CPTemplateApplicationScene *)self _shouldCallAppDelegate])
  {
    double v4 = [MEMORY[0x263F1C408] sharedApplication];
    double v5 = [v4 delegate];

    double v6 = [MEMORY[0x263F1C408] sharedApplication];
    [v5 application:v6 didDisconnectCarInterfaceController:self->_interfaceController fromWindow:self->_carWindow];
  }
  [(CPWindow *)self->_carWindow setHidden:1];
  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self->_sceneWillConnectObserver];

  double v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self->_didFinishLaunchingObserver];

  didFinishLaunchingObserver = self->_didFinishLaunchingObserver;
  self->_didFinishLaunchingObserver = 0;

  sceneWillConnectObserver = self->_sceneWillConnectObserver;
  self->_sceneWillConnectObserver = 0;

  if (_templateScenes) {
    [(id)_templateScenes removeObject:self];
  }
  [(CPTemplateApplicationScene *)self _unregisterSettingsDiffActionArrayForKey:@"InterfaceStyle"];
  v11.receiver = self;
  v11.super_class = (Class)CPTemplateApplicationScene;
  [(CPTemplateApplicationScene *)&v11 _invalidate];
}

+ (CPTemplateApplicationScene)activeTemplateScene
{
  return (CPTemplateApplicationScene *)[(id)_templateScenes firstObject];
}

- (void)updateLayoutGuideWithInsets:(UIEdgeInsets)a3
{
}

- (UITraitCollection)carTraitCollection
{
  traitCollection = self->_traitCollection;
  if (!traitCollection)
  {
    [(CPTemplateApplicationScene *)self _refreshTraitCollection];
    traitCollection = self->_traitCollection;
  }

  return traitCollection;
}

- (BOOL)_sceneWillConnect
{
  return self->_sceneWillConnect;
}

- (BOOL)_shouldCreateCarWindow
{
  if (_shouldCreateCarWindow_onceToken != -1) {
    dispatch_once(&_shouldCreateCarWindow_onceToken, &__block_literal_global_51);
  }
  return _shouldCreateCarWindow___shouldCreateWindow;
}

uint64_t __52__CPTemplateApplicationScene__shouldCreateCarWindow__block_invoke()
{
  uint64_t result = CPCurrentProcessHasMapsEntitlement();
  _shouldCreateCarWindow___shouldCreateWindow = result;
  return result;
}

- (BOOL)_shouldCallAppDelegate
{
  double v3 = [MEMORY[0x263F1C408] sharedApplication];
  double v4 = [v3 delegate];

  if ([(CPTemplateApplicationScene *)self _shouldCreateCarWindow]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (void)_deliverInterfaceControllerToDelegate
{
  double v3 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to deliver interface controller...", buf, 2u);
  }

  if ([(id)*MEMORY[0x263F1D020] _hasApplicationCalledLaunchDelegate]
    && self->_sceneWillConnect)
  {
    double v4 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "App ready to receive interface controller", buf, 2u);
    }

    char v5 = [(CPTemplateApplicationScene *)self delegate];
    if ([(CPTemplateApplicationScene *)self _shouldCreateCarWindow]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      double v6 = CarPlayFrameworkGeneralLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "App supports CPTemplateApplicationScene method with window", buf, 2u);
      }

      double v7 = [(CPTemplateApplicationScene *)self interfaceController];
      double v8 = [(CPTemplateApplicationScene *)self carWindow];
      [v5 templateApplicationScene:self didConnectInterfaceController:v7 toWindow:v8];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if ([(CPTemplateApplicationScene *)self _shouldCallAppDelegate])
        {
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __67__CPTemplateApplicationScene__deliverInterfaceControllerToDelegate__block_invoke;
          v12[3] = &unk_264309D80;
          v12[4] = self;
          double v10 = (void (**)(void))MEMORY[0x21D4648A0](v12);
          if (dyld_program_sdk_at_least()) {
            v10[2](v10);
          }
          else {
            dispatch_async(MEMORY[0x263EF83A0], v10);
          }
        }
        else
        {
          objc_super v11 = CarPlayFrameworkGeneralLogging();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_DEFAULT, "App does not support any CarPlay template connection", buf, 2u);
          }

          [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Application does not implement CarPlay template application lifecycle methods in its scene delegate."];
        }
        goto LABEL_25;
      }
      double v9 = CarPlayFrameworkGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2181A5000, v9, OS_LOG_TYPE_DEFAULT, "App supports CPTemplateApplicationScene method without window", buf, 2u);
      }

      double v7 = [(CPTemplateApplicationScene *)self interfaceController];
      [v5 templateApplicationScene:self didConnectInterfaceController:v7];
    }

LABEL_25:
  }
}

void __67__CPTemplateApplicationScene__deliverInterfaceControllerToDelegate__block_invoke(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "App supports CPApplicationDelegate method", v8, 2u);
  }

  double v3 = [MEMORY[0x263F1C408] sharedApplication];
  double v4 = [v3 delegate];

  char v5 = [MEMORY[0x263F1C408] sharedApplication];
  double v6 = [*(id *)(a1 + 32) interfaceController];
  double v7 = [*(id *)(a1 + 32) carWindow];
  [v4 application:v5 didConnectCarInterfaceController:v6 toWindow:v7];
}

- (CPWindow)carWindow
{
  return self->_carWindow;
}

- (void)setCarWindow:(id)a3
{
}

- (CPInterfaceController)interfaceController
{
  return self->_interfaceController;
}

- (UIUserInterfaceStyle)contentStyle
{
  return self->_contentStyle;
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsInterfaceStyleDiffInspector
{
  return self->_sceneSettingsInterfaceStyleDiffInspector;
}

- (void)setSceneSettingsInterfaceStyleDiffInspector:(id)a3
{
}

- (CPTemplateUISceneSettingsDiffAction)sceneSettingsDiffAction
{
  return self->_sceneSettingsDiffAction;
}

- (void)setSceneSettingsDiffAction:(id)a3
{
}

- (CPUIContentStyleDiffInspector)mapStyleInspector
{
  return self->_mapStyleInspector;
}

- (void)setMapStyleInspector:(id)a3
{
}

- (CPUIFrameRateLimitDiffInspector)frameRateLimitInspector
{
  return self->_frameRateLimitInspector;
}

- (void)setFrameRateLimitInspector:(id)a3
{
}

- (NSNumber)frameRateLimit
{
  return self->_frameRateLimit;
}

- (void)setFrameRateLimit:(id)a3
{
  self->_frameRateLimit = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameRateLimitInspector, 0);
  objc_storeStrong((id *)&self->_mapStyleInspector, 0);
  objc_storeStrong((id *)&self->_sceneSettingsDiffAction, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInterfaceStyleDiffInspector, 0);
  objc_storeStrong((id *)&self->_interfaceController, 0);
  objc_storeStrong((id *)&self->_carWindow, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_contextBinder, 0);
  objc_storeStrong((id *)&self->_didFinishLaunchingObserver, 0);

  objc_storeStrong((id *)&self->_sceneWillConnectObserver, 0);
}

@end