@interface CPTemplateApplicationInstrumentClusterScene
+ (BOOL)_hostsWindows;
- (BOOL)_permitContextCreationForBindingDescription:(id *)a3;
- (CGRect)_referenceBounds;
- (CPInstrumentClusterController)instrumentClusterController;
- (CPTemplateApplicationInstrumentClusterScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (CPTemplateUISceneSettingsDiffAction)sceneSettingsDiffAction;
- (CPUIContentStyleDiffInspector)mapStyleInspector;
- (CPUIFrameRateLimitDiffInspector)frameRateLimitInspector;
- (NSNumber)frameRateLimit;
- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3;
- (UIScreen)_screen;
- (UITraitCollection)_traitCollection;
- (UIUserInterfaceStyle)contentStyle;
- (UIWindow)instrumentClusterWindow;
- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4;
- (id)_clusterSettings;
- (id)_componentForKey:(id)a3;
- (id)_definition;
- (id)_fbsSceneLayerForWindow:(id)a3;
- (id)_frameRateLimit;
- (id)_templateSettings;
- (int64_t)_interfaceOrientation;
- (int64_t)_mapStyle;
- (unint64_t)compassSetting;
- (unint64_t)itemType;
- (unint64_t)speedLimitSetting;
- (void)_attachWindow:(id)a3;
- (void)_deliverControllerToDelegate;
- (void)_detachWindow:(id)a3;
- (void)_invalidate;
- (void)_readySceneForConnection;
- (void)_refreshTraitCollection;
- (void)_updateContentStyle;
- (void)_updateFrameRateLimit;
- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3;
- (void)_windowUpdatedProperties:(id)a3;
- (void)_windowUpdatedVisibility:(id)a3;
- (void)handleZoomInDirection:(int64_t)a3;
- (void)setFrameRateLimit:(id)a3;
- (void)setFrameRateLimitInspector:(id)a3;
- (void)setInstrumentClusterController:(id)a3;
- (void)setInstrumentClusterWindow:(id)a3;
- (void)setMapStyleInspector:(id)a3;
- (void)setSceneSettingsDiffAction:(id)a3;
- (void)updateSceneForNewCompassSetting;
- (void)updateSceneForNewItemTypeSetting;
- (void)updateSceneForNewSpeedLimitSetting;
@end

@implementation CPTemplateApplicationInstrumentClusterScene

- (CPTemplateApplicationInstrumentClusterScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  v55[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)CPTemplateApplicationInstrumentClusterScene;
  v8 = [(CPTemplateApplicationInstrumentClusterScene *)&v53 initWithSession:v6 connectionOptions:v7];
  if (v8)
  {
    v9 = [v7 _specification];
    v10 = (objc_class *)[v9 sceneSubstrateClass];

    id v11 = objc_alloc(MEMORY[0x263F1CC58]);
    id v12 = [v10 alloc];
    v13 = [(CPTemplateApplicationInstrumentClusterScene *)v8 _FBSScene];
    v14 = (void *)[v12 initWithScene:v13];
    uint64_t v15 = [v11 initWithSubstrate:v14];
    contextBinder = v8->_contextBinder;
    v8->_contextBinder = (_UIContextBinder *)v15;

    [(_UIContextBinder *)v8->_contextBinder setContextCreationPolicyHolder:v8];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    v18 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v19 = *MEMORY[0x263F1D058];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke;
    v51[3] = &unk_264309CE8;
    v20 = v8;
    v52 = v20;
    uint64_t v21 = [v17 addObserverForName:v19 object:0 queue:v18 usingBlock:v51];
    didFinishLaunchingObserver = v20->_didFinishLaunchingObserver;
    v20->_didFinishLaunchingObserver = v21;

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    v24 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v25 = *MEMORY[0x263F1D580];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke_3;
    v49[3] = &unk_264309CE8;
    v26 = v20;
    v50 = v26;
    uint64_t v27 = [v23 addObserverForName:v25 object:v26 queue:v24 usingBlock:v49];
    sceneWillConnectObserver = v26->_sceneWillConnectObserver;
    v26->_sceneWillConnectObserver = v27;

    objc_initWeak(&location, v26);
    v29 = objc_alloc_init(CPUIContentStyleDiffInspector);
    mapStyleInspector = v26->_mapStyleInspector;
    v26->_mapStyleInspector = v29;

    v31 = v26->_mapStyleInspector;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke_5;
    v46[3] = &unk_264309D10;
    objc_copyWeak(&v47, &location);
    [(CPUIContentStyleDiffInspector *)v31 observeMapStyleWithBlock:v46];
    [(CPTemplateApplicationInstrumentClusterScene *)v26 _updateContentStyle];
    v32 = objc_alloc_init(CPUIFrameRateLimitDiffInspector);
    frameRateLimitInspector = v26->_frameRateLimitInspector;
    v26->_frameRateLimitInspector = v32;

    v34 = v26->_frameRateLimitInspector;
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke_2;
    v44 = &unk_264309D10;
    objc_copyWeak(&v45, &location);
    [(CPUIFrameRateLimitDiffInspector *)v34 observeFrameRateLimitWithBlock:&v41];
    [(CPTemplateApplicationInstrumentClusterScene *)v26 _updateFrameRateLimit];
    v35 = [CPTemplateUISceneSettingsDiffAction alloc];
    v55[0] = v26->_mapStyleInspector;
    v55[1] = v26->_frameRateLimitInspector;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    v37 = [(CPTemplateUISceneSettingsDiffAction *)v35 initWithInspectors:v36];
    [(CPTemplateApplicationInstrumentClusterScene *)v26 setSceneSettingsDiffAction:v37];

    v38 = [(CPTemplateApplicationInstrumentClusterScene *)v26 sceneSettingsDiffAction];
    v54 = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
    [(CPTemplateApplicationInstrumentClusterScene *)v26 _registerSettingsDiffActionArray:v39 forKey:@"InterfaceStyle"];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  return v8;
}

uint64_t __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Did finish launching observer fired", v4, 2u);
  }

  return [*(id *)(a1 + 32) _deliverControllerToDelegate];
}

uint64_t __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 272) = 1;
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Scene will connect observer fired", v4, 2u);
  }

  return [*(id *)(a1 + 32) _deliverControllerToDelegate];
}

void __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContentStyle];
}

void __81__CPTemplateApplicationInstrumentClusterScene_initWithSession_connectionOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFrameRateLimit];
}

- (void)_updateContentStyle
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  self->_contentStyle = [(CPTemplateApplicationInstrumentClusterScene *)self _mapStyle];
  v3 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_contentStyle == 2) {
      v4 = @"dark";
    }
    else {
      v4 = @"light";
    }
    int v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "Cluster scene content style updated to %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v5 = [(CPTemplateApplicationInstrumentClusterScene *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Informing delegate of style update", (uint8_t *)&v9, 2u);
    }

    v8 = [(CPTemplateApplicationInstrumentClusterScene *)self delegate];
    [v8 contentStyleDidChange:self->_contentStyle];
  }
}

- (int64_t)_mapStyle
{
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _templateSettings];
  int64_t v3 = [v2 mapStyle];

  return v3;
}

- (void)_updateFrameRateLimit
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  self->_frameRateLimit = (NSNumber *)[(CPTemplateApplicationInstrumentClusterScene *)self _frameRateLimit];
  int64_t v3 = [(CPTemplateApplicationInstrumentClusterScene *)self _templateSettings];
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
    int v9 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v17 = v8;
      _os_log_impl(&dword_2181A5000, v9, OS_LOG_TYPE_DEFAULT, "Cluster scene frame rate limit updated to %{public}f fps", buf, 0xCu);
    }

    double v10 = 1.0 / v8;
  }
  else
  {
    uint64_t v11 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_DEFAULT, "Cluster scene updated to unrestricted frame rate", buf, 2u);
    }

    double v10 = 0.0333333333;
  }
  id v12 = objc_msgSend(NSNumber, "numberWithDouble:", v10, *MEMORY[0x263F15A60]);
  uint64_t v15 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v5 overrideDisplayTimings:v13];
}

- (id)_frameRateLimit
{
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _templateSettings];
  int64_t v3 = [v2 frameRateLimit];

  return v3;
}

- (id)_templateSettings
{
  int64_t v3 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
  v4 = [v3 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v6 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
    double v7 = [v6 settings];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)_refreshTraitCollection
{
  v18[3] = *MEMORY[0x263EF8340];
  int64_t v3 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceIdiom:3];
  v4 = (void *)MEMORY[0x263F1CB00];
  v5 = [(CPTemplateApplicationInstrumentClusterScene *)self _screen];
  char v6 = [v5 traitCollection];
  [v6 displayScale];
  double v7 = objc_msgSend(v4, "traitCollectionWithDisplayScale:");

  objc_opt_class();
  double v8 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
  id v9 = [v8 settings];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  uint64_t v11 = (void *)MEMORY[0x263F1CB00];
  if (v10) {
    uint64_t v12 = [v10 userInterfaceStyle];
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = [v11 traitCollectionWithUserInterfaceStyle:v12];
  uint64_t v14 = (void *)MEMORY[0x263F1CB00];
  v18[0] = v3;
  v18[1] = v13;
  v18[2] = v7;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v16 = [v14 traitCollectionWithTraitsFromCollections:v15];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v16;
}

+ (BOOL)_hostsWindows
{
  return 1;
}

- (UIScreen)_screen
{
  screen = self->_screen;
  if (!screen)
  {
    v4 = (void *)MEMORY[0x263F1C920];
    v5 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
    char v6 = [v4 _screenForScene:v5];
    double v7 = self->_screen;
    self->_screen = v6;

    screen = self->_screen;
  }

  return screen;
}

- (int64_t)_interfaceOrientation
{
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
  int64_t v3 = [v2 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    v5 = [v2 settings];
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
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
  int64_t v3 = [v2 settings];
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

- (UITraitCollection)_traitCollection
{
  traitCollection = self->_traitCollection;
  if (!traitCollection)
  {
    [(CPTemplateApplicationInstrumentClusterScene *)self _refreshTraitCollection];
    traitCollection = self->_traitCollection;
  }

  return traitCollection;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3
{
  BOOL v3 = a3;
  [(CPTemplateApplicationInstrumentClusterScene *)self _refreshTraitCollection];
  v5.receiver = self;
  v5.super_class = (Class)CPTemplateApplicationInstrumentClusterScene;
  [(CPTemplateApplicationInstrumentClusterScene *)&v5 _updateSceneTraitsAndPushTraitsToScreen:v3];
}

- (void)_attachWindow:(id)a3
{
  id v5 = a3;
  double v4 = [v5 _windowHostingScene];
  if (([v4 isEqual:self] & 1) == 0)
  {
    [v4 _detachWindow:v5];
    [(CPTemplateApplicationInstrumentClusterScene *)self __captureWindow:v5];
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
  [(CPTemplateApplicationInstrumentClusterScene *)self __releaseWindow:v5];
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
    double v9 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_12];
    id v8 = [v7 filteredArrayUsingPredicate:v9];
  }

  return v8;
}

uint64_t __102__CPTemplateApplicationInstrumentClusterScene__allWindowsIncludingInternalWindows_onlyVisibleWindows___block_invoke()
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
  BOOL v3 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
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

- (void)_deliverControllerToDelegate
{
  BOOL v3 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to deliver instrument cluster scene...", buf, 2u);
  }

  id v4 = [(CPTemplateApplicationInstrumentClusterScene *)self delegate];
  if ([(id)*MEMORY[0x263F1D020] _hasApplicationCalledLaunchDelegate])
  {
    if (self->_sceneWillConnect)
    {
      int v5 = [(CPTemplateApplicationInstrumentClusterScene *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        double v7 = CarPlayFrameworkGeneralLogging();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v9 = 0;
          _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Cluster delegate supports templateApplicationDidConnectInstrumentClusterScene method", v9, 2u);
        }

        double v8 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
        [v4 templateApplicationInstrumentClusterScene:self didConnectInstrumentClusterController:v8];
      }
    }
  }
}

- (void)_invalidate
{
  [(CPInstrumentClusterController *)self->_instrumentClusterController _invalidate];
  BOOL v3 = [(CPTemplateApplicationInstrumentClusterScene *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(CPTemplateApplicationInstrumentClusterScene *)self delegate];
    char v6 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
    [v5 templateApplicationInstrumentClusterScene:self didDisconnectInstrumentClusterController:v6];
  }
  [(UIWindow *)self->_instrumentClusterWindow setHidden:1];
  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self->_sceneWillConnectObserver];

  double v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self->_didFinishLaunchingObserver];

  didFinishLaunchingObserver = self->_didFinishLaunchingObserver;
  self->_didFinishLaunchingObserver = 0;

  sceneWillConnectObserver = self->_sceneWillConnectObserver;
  self->_sceneWillConnectObserver = 0;

  v11.receiver = self;
  v11.super_class = (Class)CPTemplateApplicationInstrumentClusterScene;
  [(CPTemplateApplicationInstrumentClusterScene *)&v11 _invalidate];
}

- (void)_readySceneForConnection
{
  v6.receiver = self;
  v6.super_class = (Class)CPTemplateApplicationInstrumentClusterScene;
  [(CPTemplateApplicationInstrumentClusterScene *)&v6 _readySceneForConnection];
  BOOL v3 = [[CPInstrumentClusterController alloc] _init];
  [(CPInstrumentClusterController *)v3 setCompassSetting:[(CPTemplateApplicationInstrumentClusterScene *)self compassSetting]];
  [(CPInstrumentClusterController *)v3 setSpeedLimitSetting:[(CPTemplateApplicationInstrumentClusterScene *)self speedLimitSetting]];
  instrumentClusterController = self->_instrumentClusterController;
  self->_instrumentClusterController = v3;
  int v5 = v3;

  [(CPTemplateApplicationInstrumentClusterScene *)self updateSceneForNewItemTypeSetting];
  [(CPInstrumentClusterController *)self->_instrumentClusterController _sceneConnect:self];
}

- (void)handleZoomInDirection:(int64_t)a3
{
  id v7 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
  int v5 = [v7 delegate];
  objc_super v6 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
  if (a3 == 1) {
    [v5 instrumentClusterControllerDidZoomIn:v6];
  }
  else {
    [v5 instrumentClusterControllerDidZoomOut:v6];
  }
}

- (void)updateSceneForNewCompassSetting
{
  id v3 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
  objc_msgSend(v3, "setCompassSetting:", -[CPTemplateApplicationInstrumentClusterScene compassSetting](self, "compassSetting"));
}

- (void)updateSceneForNewSpeedLimitSetting
{
  id v3 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
  objc_msgSend(v3, "setSpeedLimitSetting:", -[CPTemplateApplicationInstrumentClusterScene speedLimitSetting](self, "speedLimitSetting"));
}

- (void)updateSceneForNewItemTypeSetting
{
  if ([(CPTemplateApplicationInstrumentClusterScene *)self itemType] == 1
    || [(CPTemplateApplicationInstrumentClusterScene *)self itemType] == 3)
  {
    [(CPTemplateApplicationInstrumentClusterScene *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    objc_super v11 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x263F1CBC8]), "initWithFrame:", v3, v5, v7, v9);
    instrumentClusterWindow = self->_instrumentClusterWindow;
    self->_instrumentClusterWindow = v11;

    [(UIWindow *)self->_instrumentClusterWindow _setWindowHostingScene:self];
    [(UIWindow *)self->_instrumentClusterWindow setAutoresizesSubviews:1];
    [(UIWindow *)self->_instrumentClusterWindow setAutoresizingMask:18];
    -[UIWindow setFrame:](self->_instrumentClusterWindow, "setFrame:", v4, v6, v8, v10);
    [(UIWindow *)self->_instrumentClusterWindow makeKeyAndVisible];
    double v13 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
    double v14 = self->_instrumentClusterWindow;
    id v16 = v13;
  }
  else
  {
    [(UIWindow *)self->_instrumentClusterWindow setHidden:1];
    double v15 = self->_instrumentClusterWindow;
    self->_instrumentClusterWindow = 0;

    double v13 = [(CPTemplateApplicationInstrumentClusterScene *)self instrumentClusterController];
    id v16 = v13;
    double v14 = 0;
  }
  [v13 setInstrumentClusterWindow:v14];
}

- (unint64_t)itemType
{
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _clusterSettings];
  unint64_t v3 = [v2 itemType];

  return v3;
}

- (id)_clusterSettings
{
  unint64_t v3 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
  double v4 = [v3 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [(CPTemplateApplicationInstrumentClusterScene *)self _FBSScene];
    double v7 = [v6 settings];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (unint64_t)compassSetting
{
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _clusterSettings];
  unint64_t v3 = [v2 showsCompass];

  return v3;
}

- (unint64_t)speedLimitSetting
{
  v2 = [(CPTemplateApplicationInstrumentClusterScene *)self _clusterSettings];
  unint64_t v3 = [v2 showsSpeedLimit];

  return v3;
}

- (CPInstrumentClusterController)instrumentClusterController
{
  return self->_instrumentClusterController;
}

- (void)setInstrumentClusterController:(id)a3
{
}

- (UIUserInterfaceStyle)contentStyle
{
  return self->_contentStyle;
}

- (UIWindow)instrumentClusterWindow
{
  return self->_instrumentClusterWindow;
}

- (void)setInstrumentClusterWindow:(id)a3
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
  objc_storeStrong((id *)&self->_instrumentClusterWindow, 0);
  objc_storeStrong((id *)&self->_instrumentClusterController, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_contextBinder, 0);
  objc_storeStrong((id *)&self->_didFinishLaunchingObserver, 0);

  objc_storeStrong((id *)&self->_sceneWillConnectObserver, 0);
}

@end