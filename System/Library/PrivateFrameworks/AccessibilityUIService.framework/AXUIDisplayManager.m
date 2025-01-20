@interface AXUIDisplayManager
+ (id)sharedDisplayManager;
- (AXUIAlertStyleProvider)defaultAlertStyleProvider;
- (AXUIDisplayManager)init;
- (AXUIDisplayManager)initWithServiceManager:(id)a3;
- (AXUIServiceManager)serviceManager;
- (BOOL)_axIsPointInForeheadRect:(CGPoint)a3;
- (BOOL)_hasVisibleAlertWithType:(unint64_t)a3;
- (BOOL)_platformShouldUseScenes;
- (BOOL)_serviceWantsToPreventAutorotation:(id)a3;
- (BOOL)allWindowsHidden;
- (BOOL)destroyWindowSceneIfNeeded:(id)a3 discardableWindow:(id)a4;
- (BOOL)sceneRequestedForSceneClientIdentifier:(id)a3;
- (NSMutableDictionary)activeContentViewControllers;
- (NSMutableDictionary)activeWindows;
- (NSMutableDictionary)addContentViewControllerBlocks;
- (NSMutableDictionary)alertQueues;
- (NSMutableDictionary)externalScenes;
- (NSMutableDictionary)mainScenes;
- (NSMutableDictionary)nubbitContexts;
- (NSMutableDictionary)passiveContentViewControllers;
- (NSMutableDictionary)passiveWindows;
- (NSMutableDictionary)sceneClients;
- (NSMutableDictionary)visibleAlertContexts;
- (NSString)debugDescription;
- (NSString)systemServerActionHandlerIdentifier;
- (SBSAccessibilityWindowHostingController)windowHostingController;
- (double)_originalDurationForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 withAdjustedDuration:(double)result;
- (double)desiredWindowLevelForService:(id)a3 forContentViewController:(id)a4 userInteractionEnabled:(BOOL)a5;
- (id)_boundingViewForNubbit:(id)a3;
- (id)_contentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4 createIfNeeded:(BOOL)a5;
- (id)_gravityBehaviorForNubbit:(id)a3 velocity:(CGPoint)a4 boundingView:(id)a5;
- (id)_nubbitContextForGestureRecognizer:(id)a3;
- (id)_nubbitContextKeyForNubbit:(id)a3;
- (id)_transactionIdentifierForDisplayingAlertWithContext:(id)a3 service:(id)a4;
- (id)_transactionIdentifierForDisplayingContentViewController:(id)a3 service:(id)a4;
- (id)_windowWithUserInteractionEnabled:(BOOL)a3 windowLevel:(double)a4 createIfNeeded:(BOOL)a5 purposeIdentifier:(id)a6;
- (id)_windowWithUserInteractionEnabled:(BOOL)a3 windowLevel:(double)a4 createIfNeeded:(BOOL)a5 purposeIdentifier:(id)a6 userInterfaceStyle:(int64_t)a7 windowScene:(id)a8 savedWindowScene:(id)a9;
- (id)contentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4;
- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 forService:(id)a7;
- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 priority:(unint64_t)a7 duration:(double)a8 forService:(id)a9;
- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 priority:(unint64_t)a7 duration:(double)a8 userInfo:(id)a9 forService:(id)a10;
- (id)windowSceneForSceneClientIdentifier:(id)a3 external:(BOOL)a4;
- (int64_t)activeInterfaceOrientation;
- (int64_t)userInterfaceStyle;
- (unint64_t)numberOfAttemptsToInitializeActiveInterfaceOrientation;
- (void)_addContentViewController:(id)a3 toWindow:(id)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7;
- (void)_addDynamicAnimationsForNubbitContext:(id)a3;
- (void)_attemptToInitializeActiveInterfaceOrientation;
- (void)_beginMoveForNubbitContext:(id)a3;
- (void)_changeNubbitPositionForNubbitContext:(id)a3;
- (void)_cleanupWindowsFromSceneDisconnection:(id)a3;
- (void)_didHideOrDequeueAlertWithContext:(id)a3;
- (void)_disposeOfContentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4;
- (void)_endMoveForNubbitContext:(id)a3;
- (void)_enumerateWindowsUsingBlock:(id)a3;
- (void)_externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)_externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)_handleMoveNubbitGestureRecognizer:(id)a3;
- (void)_handleNextAlertForType:(unint64_t)a3;
- (void)_hideAlertWithContext:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_reapHiddenWindows;
- (void)_removeContentViewController:(id)a3 forService:(id)a4 completion:(id)a5;
- (void)_removeDynamicAnimationsForNubbitContext:(id)a3;
- (void)_resetServiceManager;
- (void)_scheduleFadeForNubbitContext:(id)a3;
- (void)_showAlertWithContext:(id)a3;
- (void)_showOrEnqueueAlertWithContext:(id)a3;
- (void)_undoFadeForNubbitContext:(id)a3;
- (void)_windowSceneConnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)_windowSceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 allowSystemAppHosting:(BOOL)a6;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 allowSystemAppHosting:(BOOL)a8 forWindowScene:(id)a9 completion:(id)a10;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 completion:(id)a8;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 forWindowScene:(id)a8 completion:(id)a9;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 allowSystemAppHosting:(BOOL)a9 forWindowScene:(id)a10 completion:(id)a11;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 completion:(id)a10;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 spatialConfiguration:(id)a10 completion:(id)a11;
- (void)cancelNubbitFade:(id)a3;
- (void)collisionBehavior:(id)a3 beganContactForItem:(id)a4 withBoundaryIdentifier:(id)a5 atPoint:(CGPoint)a6;
- (void)dealloc;
- (void)dynamicAnimatorDidPause:(id)a3;
- (void)enumerateContentViewControllersUsingBlock:(id)a3;
- (void)hideAlertWithIdentifier:(id)a3 forService:(id)a4;
- (void)pinNubbitToEdge:(id)a3;
- (void)registerNubbit:(id)a3 delegate:(id)a4;
- (void)removeAddContentViewControllerBlockForObjectKey:(id)a3;
- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5;
- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7;
- (void)removeWindowSceneForSceneClientIdentifier:(id)a3 external:(BOOL)a4;
- (void)saveAddContentViewControllerBlock:(id)a3 forObjectKey:(id)a4 forSceneClientIdentifier:(id)a5;
- (void)saveWindowScene:(id)a3 forSceneClientIdentifier:(id)a4 external:(BOOL)a5;
- (void)serviceDidConnect:(id)a3 clientWithIdentifier:(id)a4;
- (void)setActiveContentViewControllers:(id)a3;
- (void)setActiveInterfaceOrientation:(int64_t)a3;
- (void)setActiveWindows:(id)a3;
- (void)setAddContentViewControllerBlocks:(id)a3;
- (void)setAlertQueues:(id)a3;
- (void)setDefaultAlertStyleProvider:(id)a3;
- (void)setExternalScenes:(id)a3;
- (void)setMainScenes:(id)a3;
- (void)setNubbitContexts:(id)a3;
- (void)setNumberOfAttemptsToInitializeActiveInterfaceOrientation:(unint64_t)a3;
- (void)setPassiveContentViewControllers:(id)a3;
- (void)setPassiveWindows:(id)a3;
- (void)setSceneClients:(id)a3;
- (void)setServiceManager:(id)a3;
- (void)setSystemServerActionHandlerIdentifier:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setVisibleAlertContexts:(id)a3;
- (void)setWindowHostingController:(id)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)unregisterNubbit:(id)a3;
- (void)unregisterNubbit:(id)a3 shouldUndoFade:(BOOL)a4;
- (void)waitForSceneAddContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 spatialConfiguration:(id)a10 completion:(id)a11;
@end

@implementation AXUIDisplayManager

void __45__AXUIDisplayManager_initWithServiceManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 == 13)
  {
    v10[9] = v3;
    v10[10] = v4;
    v6 = [a3 objectForKeyedSubscript:*MEMORY[0x263F226F0]];
    uint64_t v7 = [v6 integerValue];

    [*(id *)(a1 + 32) setUserInterfaceStyle:v7];
    v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke_2;
    v10[3] = &__block_descriptor_40_e55_v32__0__NSString_8__UIWindow_AXUIWindowProtocol__16_B24l;
    v10[4] = v7;
    [v8 _enumerateWindowsUsingBlock:v10];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"AXUIServerModifiedWindowInterfaceStyle" object:*(void *)(a1 + 32)];
  }
}

+ (id)sharedDisplayManager
{
  v2 = +[AXUIServiceManager sharedServiceManager];
  uint64_t v3 = [v2 displayManager];

  return v3;
}

- (AXUIDisplayManager)init
{
  return [(AXUIDisplayManager *)self initWithServiceManager:0];
}

- (AXUIDisplayManager)initWithServiceManager:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AXUIDisplayManager;
  v5 = [(AXUIDisplayManager *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)v6;
    if (v4 && v6)
    {
      [(AXUIDisplayManager *)v5 setDefaultAlertStyleProvider:v6];
      [(AXUIDisplayManager *)v5 setServiceManager:v4];
      [(AXUIDisplayManager *)v5 _attemptToInitializeActiveInterfaceOrientation];
      v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 addObserver:v5 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x263F1D060] object:0];

      if ([MEMORY[0x263F22960] isAvailable])
      {
        v9 = [MEMORY[0x263F22960] server];
        int v10 = [v9 isDarkModeActive];
        uint64_t v11 = 1;
        if (v10) {
          uint64_t v11 = 2;
        }
        v5->_userInterfaceStyle = v11;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke;
        v29[3] = &unk_2645C59F0;
        v30 = v5;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke_3;
        v27[3] = &unk_2645C5A18;
        v28 = v30;
        [v9 registerSpringBoardActionHandler:v29 withIdentifierCallback:v27];
      }
      uint64_t v12 = objc_opt_new();
      mainScenes = v5->_mainScenes;
      v5->_mainScenes = (NSMutableDictionary *)v12;

      uint64_t v14 = objc_opt_new();
      externalScenes = v5->_externalScenes;
      v5->_externalScenes = (NSMutableDictionary *)v14;

      uint64_t v16 = objc_opt_new();
      addContentViewControllerBlocks = v5->_addContentViewControllerBlocks;
      v5->_addContentViewControllerBlocks = (NSMutableDictionary *)v16;

      uint64_t v18 = objc_opt_new();
      sceneClients = v5->_sceneClients;
      v5->_sceneClients = (NSMutableDictionary *)v18;
    }
    else
    {
      sceneClients = v5;
      v5 = 0;
    }

    id v20 = objc_alloc_init(MEMORY[0x263F79330]);
    [(AXUIDisplayManager *)v5 setWindowHostingController:v20];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)systemAppServerReady, (CFStringRef)*MEMORY[0x263F22748], 0, CFNotificationSuspensionBehaviorCoalesce);
    [(AXUIDisplayManager *)v5 systemAppServerReady];
  }
  v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke_4;
  block[3] = &unk_2645C5968;
  v23 = v5;
  v26 = v23;
  dispatch_async(v22, block);

  return v23;
}

void __45__AXUIDisplayManager_initWithServiceManager___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 shouldRespondToDarkModeChanges]) {
    [v4 setOverrideUserInterfaceStyle:*(void *)(a1 + 32)];
  }
}

uint64_t __45__AXUIDisplayManager_initWithServiceManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSystemServerActionHandlerIdentifier:a2];
}

void __45__AXUIDisplayManager_initWithServiceManager___block_invoke_4(uint64_t a1)
{
  if (AXDeviceHasJindo())
  {
    id v2 = *(id *)(a1 + 32);
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

double __45__AXUIDisplayManager_initWithServiceManager___block_invoke_5(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F79478]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addObserver:");
  uint64_t v5 = *(void *)(a1 + 32);
  double result = 0.0;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  return result;
}

- (void)dealloc
{
  uint64_t v3 = [(AXUIDisplayManager *)self systemServerActionHandlerIdentifier];
  if (v3)
  {
    id v4 = [MEMORY[0x263F22960] server];
    [v4 removeActionHandler:v3];
  }
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  [(AXUIDisplayManager *)self setDefaultAlertStyleProvider:0];
  [(AXUIDisplayManager *)self setAlertQueues:0];
  [(AXUIDisplayManager *)self setVisibleAlertContexts:0];
  [(AXUIDisplayManager *)self setActiveWindows:0];
  [(AXUIDisplayManager *)self setPassiveWindows:0];
  [(AXUIDisplayManager *)self setActiveContentViewControllers:0];
  [(AXUIDisplayManager *)self setPassiveContentViewControllers:0];
  [(AXUIDisplayManager *)self setNubbitContexts:0];
  [(AXUIDisplayManager *)self setSystemServerActionHandlerIdentifier:0];

  v6.receiver = self;
  v6.super_class = (Class)AXUIDisplayManager;
  [(AXUIDisplayManager *)&v6 dealloc];
}

- (id)contentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4
{
  id v4 = [(AXUIDisplayManager *)self _contentViewControllersWithUserInteractionEnabled:a3 forService:a4 createIfNeeded:0];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v5;
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 completion:(id)a8
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 forWindowScene:(id)a8 completion:(id)a9
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 allowSystemAppHosting:(BOOL)a8 forWindowScene:(id)a9 completion:(id)a10
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 allowSystemAppHosting:(BOOL)a9 forWindowScene:(id)a10 completion:(id)a11
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 allowSystemAppHosting:(BOOL)a6
{
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 completion:(id)a10
{
}

- (BOOL)_platformShouldUseScenes
{
  if (_platformShouldUseScenes_onceToken != -1) {
    dispatch_once(&_platformShouldUseScenes_onceToken, &__block_literal_global);
  }
  return _platformShouldUseScenes__UseScenes;
}

void __46__AXUIDisplayManager__platformShouldUseScenes__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v0 = [(id)objc_opt_class() usesScenes];
  }
  else {
    char v0 = 1;
  }
  _platformShouldUseScenes__UseScenes = v0;
  v1 = AXLogUI();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [NSNumber numberWithBool:_platformShouldUseScenes__UseScenes];
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_221750000, v1, OS_LOG_TYPE_DEFAULT, "AXUIServer will request scenes for its UI: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 spatialConfiguration:(id)a10 completion:(id)a11
{
  BOOL v35 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v18 = a10;
  v19 = (void (**)(id, uint64_t))a11;
  id v20 = +[AXUIAssertionManager sharedInstance];
  [v20 acquireAssertionUIIfNeeded];

  BOOL v21 = [(AXUIDisplayManager *)self _platformShouldUseScenes];
  if (!v21)
  {

    id v16 = 0;
  }
  v22 = [(AXUIDisplayManager *)self windowSceneForSceneClientIdentifier:v16 external:0];
  v23 = AXLogUI();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219266;
    id v37 = v14;
    __int16 v38 = 2112;
    uint64_t v39 = objc_opt_class();
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 2048;
    id v45 = v17;
    __int16 v46 = 2048;
    v47 = v22;
    _os_log_impl(&dword_221750000, v23, OS_LOG_TYPE_INFO, "Adding contentVC=%p %@ service=%@ sceneClientIdentifier:%@ windowScene=%p, savedWindowScene=%p", buf, 0x3Eu);
  }

  if (v15 && v16) {
    [(NSMutableDictionary *)self->_sceneClients setObject:v15 forKey:v16];
  }
  char v24 = !v21;
  if (v17) {
    char v24 = 1;
  }
  if ((v24 & 1) != 0 || v22)
  {
    v25 = [(AXUIDisplayManager *)self _contentViewControllersWithUserInteractionEnabled:v35 forService:v15 createIfNeeded:1];
    v26 = v25;
    if (v14 && ([v25 containsObject:v14] & 1) == 0)
    {
      id v31 = v18;
      [v26 addObject:v14];
      [(AXUIDisplayManager *)self desiredWindowLevelForService:v15 forContentViewController:v14 userInteractionEnabled:v35];
      double v28 = v27;
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      v33 = [(AXUIDisplayManager *)self _windowWithUserInteractionEnabled:v35 windowLevel:1 createIfNeeded:v30 purposeIdentifier:a8 userInterfaceStyle:v17 windowScene:v22 savedWindowScene:v28];

      if (v35) {
        [v33 makeKeyAndVisible];
      }
      else {
        [v33 setHidden:0];
      }
      [(AXUIDisplayManager *)self _addContentViewController:v14 toWindow:v33 forService:v15 context:a7 completion:v19];

      id v18 = v31;
    }
    else if (v19)
    {
      v19[2](v19, 1);
    }
  }
  else
  {
    [(AXUIDisplayManager *)self waitForSceneAddContentViewController:v14 withUserInteractionEnabled:v35 forService:v15 forSceneClientIdentifier:v16 context:a7 userInterfaceStyle:a8 forWindowScene:0 spatialConfiguration:v18 completion:v19];
  }
}

- (void)waitForSceneAddContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 spatialConfiguration:(id)a10 completion:(id)a11
{
  BOOL v39 = a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __196__AXUIDisplayManager_waitForSceneAddContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_spatialConfiguration_completion___block_invoke;
  v40[3] = &unk_2645C5A60;
  id v37 = v47;
  objc_copyWeak(v47, &location);
  id v22 = v16;
  id v41 = v22;
  BOOL v48 = v39;
  id v38 = v17;
  id v42 = v38;
  id v23 = v18;
  id v43 = v23;
  v47[1] = a7;
  v47[2] = (id)a8;
  id v24 = v19;
  id v44 = v24;
  id v25 = v20;
  id v45 = v25;
  id v26 = v21;
  id v46 = v26;
  double v27 = (void *)MEMORY[0x223C897B0](v40);
  BOOL v28 = [(AXUIDisplayManager *)self sceneRequestedForSceneClientIdentifier:v23];
  [(AXUIDisplayManager *)self saveAddContentViewControllerBlock:v27 forObjectKey:v22 forSceneClientIdentifier:v23];
  v29 = AXLogUI();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v22;
    _os_log_impl(&dword_221750000, v29, OS_LOG_TYPE_INFO, "Tried to add %@ before a scene was connected, queuing for later.", buf, 0xCu);
  }

  if (!v28)
  {
    v30 = +[AXUIServiceManager sharedServiceManager];
    id v31 = [v30 delegate];
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      [(AXUIDisplayManager *)self desiredWindowLevelForService:v38 forContentViewController:v22 userInteractionEnabled:v39];
      double v34 = v33;
      BOOL v35 = +[AXUIServiceManager sharedServiceManager];
      v36 = [v35 delegate];
      [v36 requestSceneForSceneClientIdentifier:v23 scenePreferredLevel:v25 spatialConfiguration:v34];
    }
  }

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

void __196__AXUIDisplayManager_waitForSceneAddContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_spatialConfiguration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained addContentViewController:*(void *)(a1 + 32) withUserInteractionEnabled:*(unsigned __int8 *)(a1 + 104) forService:*(void *)(a1 + 40) forSceneClientIdentifier:*(void *)(a1 + 48) context:*(void *)(a1 + 88) userInterfaceStyle:*(void *)(a1 + 96) forWindowScene:*(void *)(a1 + 56) spatialConfiguration:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5
{
}

- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  [(AXUIDisplayManager *)self removeAddContentViewControllerBlockForObjectKey:v12];
  id v15 = [(AXUIDisplayManager *)self _contentViewControllersWithUserInteractionEnabled:v10 forService:v13 createIfNeeded:0];
  id v16 = v15;
  if (!v15 || v12 && [v15 containsObject:v12])
  {
    [v16 removeObject:v12];
    if (![v16 count]) {
      [(AXUIDisplayManager *)self _disposeOfContentViewControllersWithUserInteractionEnabled:v10 forService:v13];
    }
    if ([v12 conformsToProtocol:&unk_26D3E3960]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __107__AXUIDisplayManager_removeContentViewController_withUserInteractionEnabled_forService_context_completion___block_invoke;
      v17[3] = &unk_2645C5A88;
      v17[4] = self;
      id v18 = v12;
      id v19 = v13;
      id v20 = v14;
      [v18 transitionOutWithContext:a6 completion:v17];
    }
    else
    {
      [(AXUIDisplayManager *)self _removeContentViewController:v12 forService:v13 completion:v14];
    }
  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
}

uint64_t __107__AXUIDisplayManager_removeContentViewController_withUserInteractionEnabled_forService_context_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeContentViewController:*(void *)(a1 + 40) forService:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 forService:(id)a7
{
  double v7 = 3.0;
  if (!a6) {
    double v7 = 1.5;
  }
  return -[AXUIDisplayManager showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:](self, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:", a3, a4, a5, v7);
}

- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 priority:(unint64_t)a7 duration:(double)a8 forService:(id)a9
{
  return [(AXUIDisplayManager *)self showAlertWithText:a3 subtitleText:a4 iconImage:a5 type:a6 priority:a7 duration:MEMORY[0x263EFFA78] userInfo:a8 forService:a9];
}

- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 priority:(unint64_t)a7 duration:(double)a8 userInfo:(id)a9 forService:(id)a10
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  id v21 = a10;
  if ([v17 length])
  {
    if ([v21 conformsToProtocol:&unk_26D3E39C0])
    {
      id v22 = +[AXUIAssertionManager sharedInstance];
      [v22 acquireAssertionUIIfNeeded];

      id v23 = [MEMORY[0x263F08C38] UUID];
      id v24 = [v23 UUIDString];

      id v25 = objc_opt_new();
      [v25 setIdentifier:v24];
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      objc_msgSend(v25, "setCreationTimeInterval:");
      [v25 setService:v21];
      [v25 setPriority:a7];
      [v25 setDuration:a8];
      [v25 setText:v17];
      [v25 setSubtitleText:v18];
      [v25 setIconImage:v19];
      [v25 setType:a6];
      [v25 setUserInfo:v20];
      id v26 = [(AXUIDisplayManager *)self _transactionIdentifierForDisplayingAlertWithContext:v25 service:v21];
      double v27 = [(AXUIDisplayManager *)self serviceManager];
      [v27 beginTransactionWithIdentifier:v26 forService:v21];

      id v28 = v25;
      AXPerformBlockAsynchronouslyOnMainThread();

      goto LABEL_10;
    }
    id v26 = AXLogUI();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v21;
      v29 = "Cannot show alert service does not conform to AXUIService: %@";
      v30 = v26;
      uint32_t v31 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    id v26 = AXLogUI();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "Cannot show alert. Text was empty";
      v30 = v26;
      uint32_t v31 = 2;
LABEL_8:
      _os_log_impl(&dword_221750000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
  }
  id v24 = 0;
LABEL_10:

  return v24;
}

uint64_t __106__AXUIDisplayManager_showAlertWithText_subtitleText_iconImage_type_priority_duration_userInfo_forService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showOrEnqueueAlertWithContext:*(void *)(a1 + 40)];
}

- (void)hideAlertWithIdentifier:(id)a3 forService:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(AXUIDisplayManager *)self visibleAlertContexts];
  double v7 = [v6 objectForKey:v5];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 showOrHideTimer];
    [v9 cancel];

    [v8 setShowOrHideTimer:0];
    [(AXUIDisplayManager *)self _hideAlertWithContext:v8 notifyDelegate:0];
  }
  else
  {
    BOOL v10 = [(AXUIDisplayManager *)self alertQueues];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke;
    v11[3] = &unk_2645C5B00;
    id v12 = v5;
    id v13 = self;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke_2;
  v10[3] = &unk_2645C5AD8;
  id v11 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 indexOfObjectPassingTest:v10];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    v9 = [v6 objectAtIndex:v7];
    [v6 removeObjectAtIndex:v8];
    [*(id *)(a1 + 40) _didHideOrDequeueAlertWithContext:v9];
    *a4 = 1;
  }
}

uint64_t __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)registerNubbit:(id)a3 delegate:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = [(AXUIDisplayManager *)self nubbitContexts];

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(AXUIDisplayManager *)self setNubbitContexts:v8];
  }
  v9 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v18];
  BOOL v10 = [(AXUIDisplayManager *)self nubbitContexts];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    id v12 = objc_alloc_init(AXUINubbitContext);
    [(AXUINubbitContext *)v12 setNubbit:v18];
    [(AXUINubbitContext *)v12 setDelegate:v6];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel__handleMoveNubbitGestureRecognizer_];
    [v18 addGestureRecognizer:v13];
    [(AXUINubbitContext *)v12 setMoveNubbitGestureRecognizer:v13];
    id v14 = objc_alloc(MEMORY[0x263F21398]);
    id v15 = (void *)[v14 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [v15 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(AXUINubbitContext *)v12 setFadeTimer:v15];
    [v18 alpha];
    -[AXUINubbitContext setOriginalAlpha:](v12, "setOriginalAlpha:");
    [(AXUIDisplayManager *)self _scheduleFadeForNubbitContext:v12];
    [(AXUIDisplayManager *)self _addDynamicAnimationsForNubbitContext:v12];
    id v16 = [(AXUIDisplayManager *)self nubbitContexts];
    id v17 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v18];
    [v16 setObject:v12 forKeyedSubscript:v17];
  }
}

- (void)unregisterNubbit:(id)a3
{
}

- (void)unregisterNubbit:(id)a3 shouldUndoFade:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  id v6 = -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:");
  uint64_t v7 = [(AXUIDisplayManager *)self nubbitContexts];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v9 = [v8 moveNubbitGestureRecognizer];
    if (v9) {
      [v14 removeGestureRecognizer:v9];
    }
    if (v4) {
      [(AXUIDisplayManager *)self _undoFadeForNubbitContext:v8];
    }
    [(AXUIDisplayManager *)self _removeDynamicAnimationsForNubbitContext:v8];
    BOOL v10 = [v8 fadeTimer];
    [v10 cancel];

    id v11 = [(AXUIDisplayManager *)self nubbitContexts];
    [v11 removeObjectForKey:v6];

    id v12 = [(AXUIDisplayManager *)self nubbitContexts];
    uint64_t v13 = [v12 count];

    if (!v13) {
      [(AXUIDisplayManager *)self setNubbitContexts:0];
    }
  }
}

- (BOOL)allWindowsHidden
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__AXUIDisplayManager_allWindowsHidden__block_invoke;
  v4[3] = &unk_2645C5B28;
  v4[4] = &v5;
  [(AXUIDisplayManager *)self _enumerateWindowsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__AXUIDisplayManager_allWindowsHidden__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isHidden];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = result;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)_enumerateWindowsUsingBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  id v6 = [(AXUIDisplayManager *)self activeWindows];
  uint64_t v7 = [v6 allValues];
  [v5 addObjectsFromArray:v7];

  char v8 = [(AXUIDisplayManager *)self passiveWindows];
  v9 = [v8 allValues];
  [v5 addObjectsFromArray:v9];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v10);
      }
      id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __50__AXUIDisplayManager__enumerateWindowsUsingBlock___block_invoke;
      v15[3] = &unk_2645C5B50;
      id v16 = v4;
      id v17 = &v22;
      [v14 enumerateKeysAndObjectsUsingBlock:v15];
      LOBYTE(v14) = *((unsigned char *)v23 + 24) == 0;

      if ((v14 & 1) == 0) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __50__AXUIDisplayManager__enumerateWindowsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)_windowWithUserInteractionEnabled:(BOOL)a3 windowLevel:(double)a4 createIfNeeded:(BOOL)a5 purposeIdentifier:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v10 = a6;
  uint64_t v11 = [(AXUIDisplayManager *)self windowSceneForSceneClientIdentifier:0 external:0];
  uint64_t v12 = [(AXUIDisplayManager *)self _windowWithUserInteractionEnabled:v8 windowLevel:v6 createIfNeeded:v10 purposeIdentifier:0 userInterfaceStyle:0 windowScene:v11 savedWindowScene:a4];

  return v12;
}

- (id)_windowWithUserInteractionEnabled:(BOOL)a3 windowLevel:(double)a4 createIfNeeded:(BOOL)a5 purposeIdentifier:(id)a6 userInterfaceStyle:(int64_t)a7 windowScene:(id)a8 savedWindowScene:(id)a9
{
  BOOL v12 = a5;
  BOOL v14 = a3;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v52 = a6;
  id v16 = a8;
  id v17 = a9;
  long long v18 = &selRef_activeWindows;
  double v19 = round(a4);
  if (!v14) {
    long long v18 = &selRef_passiveWindows;
  }
  uint64_t v20 = NSStringFromSelector(*v18);
  long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"%f-%ld", *(void *)&v19, a7);
  v53 = (void *)v20;
  uint64_t v22 = [(AXUIDisplayManager *)self valueForKey:v20];
  id v23 = [v16 _sceneIdentifier];
  if (!v23)
  {
    uint64_t v24 = [v17 _sceneIdentifier];
    if (v24) {
      id v23 = (__CFString *)v24;
    }
    else {
      id v23 = @"MAIN-DISPLAY";
    }
  }
  v54 = v17;
  char v25 = [v22 objectForKey:v23];
  id v26 = [v25 objectForKey:v21];

  if (v26) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = !v12;
  }
  if (v27)
  {
    id v28 = v52;
    goto LABEL_35;
  }
  objc_opt_class();
  objc_opt_class();
  [(AXUIDisplayManager *)self _platformShouldUseScenes];
  uint64_t v29 = objc_opt_class();
  v30 = (objc_class *)objc_opt_class();
  if (v14) {
    v30 = (objc_class *)v29;
  }
  if (v16)
  {
    id v26 = (void *)[[v30 alloc] initWithWindowScene:v16];
    uint32_t v31 = AXLogUI();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v16;
      __int16 v57 = 2112;
      v58 = v26;
      char v32 = "Made window with external scene: %@ %@";
LABEL_21:
      uint64_t v35 = v31;
      uint32_t v36 = 22;
LABEL_22:
      _os_log_impl(&dword_221750000, v35, OS_LOG_TYPE_INFO, v32, buf, v36);
    }
  }
  else
  {
    id v33 = [v30 alloc];
    id v34 = v33;
    if (!v54)
    {
      id v51 = [MEMORY[0x263F1C920] mainScreen];
      id v26 = (void *)[v34 initWithScreen:v51];

      uint32_t v31 = AXLogUI();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      id v56 = v26;
      char v32 = "Made window for main screen %@";
      uint64_t v35 = v31;
      uint32_t v36 = 12;
      goto LABEL_22;
    }
    id v26 = (void *)[v33 initWithWindowScene:v54];
    uint32_t v31 = AXLogUI();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v54;
      __int16 v57 = 2112;
      v58 = v26;
      char v32 = "Made window with main scene: %@ %@";
      goto LABEL_21;
    }
  }
LABEL_23:

  [v26 setWindowLevel:v19];
  id v37 = [MEMORY[0x263F1C550] clearColor];
  [v26 setBackgroundColor:v37];

  if (a7)
  {
    [v26 setOverrideUserInterfaceStyle:a7];
  }
  else
  {
    if ([MEMORY[0x263F22960] isAvailable])
    {
      id v38 = [MEMORY[0x263F22960] server];
      int v39 = [v38 isDarkModeActive];

      if (v39)
      {
        if ([(AXUIDisplayManager *)self userInterfaceStyle] != 2) {
          [(AXUIDisplayManager *)self setUserInterfaceStyle:2];
        }
      }
    }
    objc_msgSend(v26, "setOverrideUserInterfaceStyle:", -[AXUIDisplayManager userInterfaceStyle](self, "userInterfaceStyle"));
    [v26 setShouldRespondToDarkModeChanges:1];
  }
  id v28 = v52;
  [v26 _setWindowControlsStatusBarOrientation:0];
  __int16 v40 = objc_opt_new();
  [v26 setRootViewController:v40];
  [v26 setHidden:0];
  [v26 setHidden:1];
  if (!v22)
  {
    uint64_t v22 = objc_opt_new();
    [(AXUIDisplayManager *)self setValue:v22 forKey:v53];
  }
  id v41 = [v22 objectForKey:v23];
  if (!v41)
  {
    id v41 = [MEMORY[0x263EFF9A0] dictionary];
  }
  [v41 setObject:v26 forKey:v21];
  [v22 setObject:v41 forKey:v23];

LABEL_35:
  id v42 = [v26 accessibilityIdentifier];
  id v43 = v42;
  if (!v42 || [v42 rangeOfString:v28] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v44 = [v26 accessibilityIdentifier];
    uint64_t v45 = [v44 length];

    if (v45)
    {
      id v46 = NSString;
      v47 = [v26 accessibilityIdentifier];
      BOOL v48 = [v46 stringWithFormat:@"%@|%@", v47, v28];
      [v26 setAccessibilityIdentifier:v48];
    }
    else
    {
      [v26 setAccessibilityIdentifier:v28];
    }
  }
  v49 = [MEMORY[0x263F08A00] defaultCenter];
  [v49 postNotificationName:@"AXUIServerModifiedWindowInterfaceStyle" object:self];

  return v26;
}

- (double)_originalDurationForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 withAdjustedDuration:(double)result
{
  if (a3 != a4 && (unint64_t)(a3 - 1) < 2 == (unint64_t)(a4 - 1) < 2) {
    return result * 0.5;
  }
  return result;
}

- (void)enumerateContentViewControllersUsingBlock:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, char *))a3;
  char v49 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v5 = [(AXUIDisplayManager *)self activeContentViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v46;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v11 = self;
        BOOL v12 = [(AXUIDisplayManager *)self activeContentViewControllers];
        uint64_t v13 = [v12 objectForKeyedSubscript:v10];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v52 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v42;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v42 != v17) {
                objc_enumerationMutation(v14);
              }
              v4[2](v4, *(void *)(*((void *)&v41 + 1) + 8 * j), &v49);
              if (v49)
              {
LABEL_32:

                goto LABEL_33;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v52 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v31;
        self = v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = [(AXUIDisplayManager *)self passiveContentViewControllers];
  uint64_t v19 = [v5 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    uint64_t v32 = *(void *)v38;
    while (2)
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v5);
        }
        uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * k);
        uint64_t v24 = self;
        char v25 = [(AXUIDisplayManager *)self passiveContentViewControllers];
        id v26 = [v25 objectForKeyedSubscript:v23];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v14 = v26;
        uint64_t v27 = [v14 countByEnumeratingWithState:&v33 objects:v50 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v34;
LABEL_23:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v14);
            }
            v4[2](v4, *(void *)(*((void *)&v33 + 1) + 8 * v30), &v49);
            if (v49) {
              goto LABEL_32;
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = [v14 countByEnumeratingWithState:&v33 objects:v50 count:16];
              if (v28) {
                goto LABEL_23;
              }
              break;
            }
          }
        }

        self = v24;
        uint64_t v21 = v32;
      }
      uint64_t v20 = [v5 countByEnumeratingWithState:&v37 objects:v51 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_33:
}

- (void)_windowSceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = AXLogUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 134218242;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    long long v18 = v7;
    _os_log_impl(&dword_221750000, v8, OS_LOG_TYPE_INFO, "New window scene connected: %p for scene client: %@. Adding queued content view controllers", (uint8_t *)&v15, 0x16u);
  }

  [(AXUIDisplayManager *)self saveWindowScene:v6 forSceneClientIdentifier:v7 external:0];
  v9 = @"AXUIServerDefaultSceneClientIdentifier";
  if (v7) {
    v9 = v7;
  }
  uint64_t v10 = v9;

  uint64_t v11 = [(NSMutableDictionary *)self->_addContentViewControllerBlocks objectForKeyedSubscript:v10];
  [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_409];
  [(NSMutableDictionary *)self->_addContentViewControllerBlocks removeObjectForKey:v10];
  uint64_t v12 = [(AXUIDisplayManager *)self sceneClients];
  uint64_t v13 = [(id)v12 objectForKeyedSubscript:v10];

  LOBYTE(v12) = objc_opt_respondsToSelector();
  if (v12)
  {
    id v14 = AXLogUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      long long v18 = v6;
      _os_log_impl(&dword_221750000, v14, OS_LOG_TYPE_INFO, "Main display scene connected for Service: %@. windowScene: %@", (uint8_t *)&v15, 0x16u);
    }

    [(__CFString *)v13 mainDisplaySceneConnected:v6];
  }
}

uint64_t __69__AXUIDisplayManager__windowSceneConnected_forSceneClientIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (void)_windowSceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AXLogUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_221750000, v8, OS_LOG_TYPE_INFO, "Window scene disconnected: %p, for scene client:%@", (uint8_t *)&v10, 0x16u);
  }

  [(AXUIDisplayManager *)self removeWindowSceneForSceneClientIdentifier:v7 external:0];
  v9 = [v6 _sceneIdentifier];
  [(AXUIDisplayManager *)self _cleanupWindowsFromSceneDisconnection:v9];
}

- (void)_externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F22298] usesScenes])
  {
    uint64_t v8 = AXLogUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_221750000, v8, OS_LOG_TYPE_INFO, "New external window scene connected: %p for scene client: %@. Notifying services.", buf, 0x16u);
    }

    [(AXUIDisplayManager *)self saveWindowScene:v6 forSceneClientIdentifier:v7 external:1];
    id v9 = v7;
    id v10 = v6;
    AXPerformBlockOnMainThread();
  }
}

void __78__AXUIDisplayManager__externalDisplaySceneConnected_forSceneClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    char v2 = [*(id *)(a1 + 40) sceneClients];
    int v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (objc_opt_respondsToSelector())
    {
      id v4 = AXLogUI();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v3;
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        _os_log_impl(&dword_221750000, v4, OS_LOG_TYPE_INFO, "External display scene connected for Service: %@, sceneClientIdentifier: %@", buf, 0x16u);
      }

      [v3 externalDisplaySceneConnected:*(void *)(a1 + 48) forSceneClientIdentifier:*(void *)(a1 + 32)];
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [*(id *)(a1 + 40) serviceManager];
    int v3 = [v6 _services];

    uint64_t v7 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v3);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v12 = AXLogUI();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v19 = v11;
              _os_log_impl(&dword_221750000, v12, OS_LOG_TYPE_INFO, "External display scene connected for Service: %@", buf, 0xCu);
            }

            [v11 externalDisplaySceneConnected:*(void *)(a1 + 48)];
          }
        }
        uint64_t v8 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F22298] usesScenes])
  {
    uint64_t v8 = AXLogUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_221750000, v8, OS_LOG_TYPE_INFO, "Disconnecting external scene: %@", buf, 0xCu);
    }

    [(AXUIDisplayManager *)self removeWindowSceneForSceneClientIdentifier:v7 external:1];
    uint64_t v9 = [v6 _sceneIdentifier];
    [(AXUIDisplayManager *)self _cleanupWindowsFromSceneDisconnection:v9];

    id v10 = v7;
    id v11 = v6;
    AXPerformBlockOnMainThread();
  }
}

void __81__AXUIDisplayManager__externalDisplaySceneDisconnected_forSceneClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    char v2 = [*(id *)(a1 + 40) sceneClients];
    int v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (objc_opt_respondsToSelector())
    {
      id v4 = AXLogUI();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v3;
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        _os_log_impl(&dword_221750000, v4, OS_LOG_TYPE_INFO, "External display scene disconnected for Service: %@, sceneClientIdentifier: %@", buf, 0x16u);
      }

      [v3 externalDisplaySceneDisconnected:*(void *)(a1 + 48) forSceneClientIdentifier:*(void *)(a1 + 32)];
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [*(id *)(a1 + 40) serviceManager];
    int v3 = [v6 _services];

    uint64_t v7 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v3);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v12 = AXLogUI();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v19 = v11;
              _os_log_impl(&dword_221750000, v12, OS_LOG_TYPE_INFO, "External display scene disconnected for Service: %@", buf, 0xCu);
            }

            [v11 externalDisplaySceneDisconnected:*(void *)(a1 + 48)];
          }
        }
        uint64_t v8 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_cleanupWindowsFromSceneDisconnection:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  id v6 = [(NSMutableDictionary *)self->_activeWindows objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 allValues];
  [v5 axSafelyAddObjectsFromArray:v7];

  uint64_t v8 = [(NSMutableDictionary *)self->_passiveWindows objectForKeyedSubscript:v4];
  uint64_t v9 = [v8 allValues];
  [v5 axSafelyAddObjectsFromArray:v9];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        long long v16 = [(AXUIDisplayManager *)self windowHostingController];
        objc_msgSend(v16, "unregisterWindowWithContextID:", objc_msgSend(v15, "_contextId"));

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [(NSMutableDictionary *)self->_activeWindows setObject:0 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_passiveWindows setObject:0 forKeyedSubscript:v4];
}

- (void)saveWindowScene:(id)a3 forSceneClientIdentifier:(id)a4 external:(BOOL)a5
{
  uint64_t v6 = 144;
  if (a5) {
    uint64_t v6 = 152;
  }
  uint64_t v7 = *(Class *)((char *)&self->super.isa + v6);
  uint64_t v8 = @"AXUIServerDefaultSceneClientIdentifier";
  if (a4) {
    uint64_t v8 = (__CFString *)a4;
  }
  uint64_t v9 = v8;
  id v10 = v7;
  id v11 = a3;
  [v10 setObject:v11 forKey:v9];
}

- (BOOL)destroyWindowSceneIfNeeded:(id)a3 discardableWindow:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v7 = AXLogUI();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 windows];
    *(_DWORD *)buf = 134218242;
    id v29 = v5;
    __int16 v30 = 2112;
    uint64_t v31 = v8;
    _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_INFO, "checking scene: %p, windows: %@", buf, 0x16u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = objc_msgSend(v5, "windows", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        if (([v15 isHidden] & 1) == 0 && v15 != v6)
        {
          NSClassFromString(&cfstr_Uitexteffectsw.isa);
          v12 += (objc_opt_isKindOfClass() & 1) == 0;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);

    if (v12) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  long long v16 = +[AXUIServiceManager sharedServiceManager];
  long long v17 = [v16 delegate];
  char v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0)
  {
LABEL_19:
    char v21 = 0;
    goto LABEL_20;
  }
  long long v19 = +[AXUIServiceManager sharedServiceManager];
  long long v20 = [v19 delegate];
  char v21 = [v20 destroyScene:v5];

LABEL_20:
  return v21;
}

- (void)removeWindowSceneForSceneClientIdentifier:(id)a3 external:(BOOL)a4
{
  uint64_t v4 = 144;
  if (a4) {
    uint64_t v4 = 152;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);
  id v6 = @"AXUIServerDefaultSceneClientIdentifier";
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  uint64_t v7 = v6;
  id v8 = v5;
  [v8 removeObjectForKey:v7];
}

- (id)windowSceneForSceneClientIdentifier:(id)a3 external:(BOOL)a4
{
  uint64_t v4 = 144;
  if (a4) {
    uint64_t v4 = 152;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);
  id v6 = @"AXUIServerDefaultSceneClientIdentifier";
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  uint64_t v7 = v6;
  id v8 = v5;
  uint64_t v9 = [v8 objectForKey:v7];

  return v9;
}

- (void)saveAddContentViewControllerBlock:(id)a3 forObjectKey:(id)a4 forSceneClientIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  uint64_t v11 = v10;
  if (v8 && v9)
  {
    uint64_t v12 = @"AXUIServerDefaultSceneClientIdentifier";
    if (v10) {
      uint64_t v12 = v10;
    }
    uint64_t v13 = v12;

    uint64_t v14 = [(NSMutableDictionary *)self->_addContentViewControllerBlocks objectForKeyedSubscript:v13];
    if (!v14) {
      uint64_t v14 = objc_opt_new();
    }
    id v15 = (void *)MEMORY[0x223C897B0](v8);
    long long v16 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v9);
    [v14 setObject:v15 forKey:v16];

    long long v17 = AXLogUI();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_221750000, v17, OS_LOG_TYPE_DEFAULT, "Save block for objectKey: %@", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_addContentViewControllerBlocks setObject:v14 forKeyedSubscript:v13];
  }
  else
  {
    uint64_t v13 = v10;
  }
}

- (void)removeAddContentViewControllerBlockForObjectKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy_;
    long long v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    addContentViewControllerBlocks = self->_addContentViewControllerBlocks;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__AXUIDisplayManager_removeAddContentViewControllerBlockForObjectKey___block_invoke;
    v10[3] = &unk_2645C5BC0;
    id v7 = v5;
    id v11 = v7;
    uint64_t v12 = &v13;
    [(NSMutableDictionary *)addContentViewControllerBlocks enumerateKeysAndObjectsUsingBlock:v10];
    if (v14[5])
    {
      id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_addContentViewControllerBlocks, "objectForKeyedSubscript:");
      [v8 removeObjectForKey:v7];
      id v9 = AXLogUI();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_221750000, v9, OS_LOG_TYPE_DEFAULT, "Remove block for objectKey: %@", buf, 0xCu);
      }

      [(NSMutableDictionary *)self->_addContentViewControllerBlocks setObject:v8 forKeyedSubscript:v14[5]];
    }

    _Block_object_dispose(&v13, 8);
  }
}

void __70__AXUIDisplayManager_removeAddContentViewControllerBlockForObjectKey___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = [a3 objectForKey:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)sceneRequestedForSceneClientIdentifier:(id)a3
{
  id v4 = @"AXUIServerDefaultSceneClientIdentifier";
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  id v5 = v4;
  id v6 = [(NSMutableDictionary *)self->_addContentViewControllerBlocks objectForKeyedSubscript:v5];

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

- (double)desiredWindowLevelForService:(id)a3 forContentViewController:(id)a4 userInteractionEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v7 conformsToProtocol:&unk_26D3E3A20])
  {
    id v9 = v7;
    if (objc_opt_respondsToSelector())
    {
      [v9 desiredWindowLevelForContentViewController:v8 userInteractionEnabled:v5];
      double v11 = v10;
    }
    else
    {
      double v11 = 10000002.0;
    }
  }
  else
  {
    double v11 = 10000002.0;
  }

  return v11;
}

- (void)serviceDidConnect:(id)a3 clientWithIdentifier:(id)a4
{
  id v4 = a3;
  if ([MEMORY[0x263F22298] usesScenes])
  {
    id v5 = v4;
    AXPerformBlockOnMainThread();
  }
}

void __61__AXUIDisplayManager_serviceDidConnect_clientWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) windowSceneForSceneClientIdentifier:0 external:1];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v3 = AXLogUI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_221750000, v3, OS_LOG_TYPE_INFO, "External display scene connected for Service: %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 40) externalDisplaySceneConnected:v2];
  }
}

- (id)_contentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x223C895D0]();
  double v10 = [(AXUIDisplayManager *)self serviceManager];
  double v11 = [v10 _uniqueIdentifierForService:v8];

  uint64_t v12 = &selRef_activeContentViewControllers;
  if (!v6) {
    uint64_t v12 = &selRef_passiveContentViewControllers;
  }
  uint64_t v13 = NSStringFromSelector(*v12);
  uint64_t v14 = [(AXUIDisplayManager *)self valueForKey:v13];
  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = !v5;
  }
  if (!v15)
  {
    uint64_t v14 = objc_opt_new();
    [(AXUIDisplayManager *)self setValue:v14 forKey:v13];
  }
  uint64_t v16 = [v14 objectForKey:v11];
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v11 == 0;
  }
  char v18 = v17 || !v5;
  if (v17) {
    id v19 = (void *)v16;
  }
  else {
    id v19 = 0;
  }
  if ((v18 & 1) == 0)
  {
    id v19 = objc_opt_new();
    [v14 setObject:v19 forKey:v11];
  }

  return v19;
}

- (void)_disposeOfContentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  BOOL v6 = (void *)MEMORY[0x223C895D0]();
  uint64_t v7 = [(AXUIDisplayManager *)self serviceManager];
  id v8 = [v7 _uniqueIdentifierForService:v13];

  id v9 = &selRef_activeContentViewControllers;
  if (!v4) {
    id v9 = &selRef_passiveContentViewControllers;
  }
  double v10 = NSStringFromSelector(*v9);
  double v11 = [(AXUIDisplayManager *)self valueForKey:v10];
  uint64_t v12 = v11;
  if (v8) {
    [v11 removeObjectForKey:v8];
  }
  if (![v12 count]) {
    [(AXUIDisplayManager *)self setValue:0 forKey:v10];
  }
}

- (void)_addContentViewController:(id)a3 toWindow:(id)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [v13 rootViewController];
  BOOL v17 = v16;
  if (v12)
  {
    char v18 = [(AXUIDisplayManager *)self _transactionIdentifierForDisplayingContentViewController:v12 service:v14];
    id v19 = [(AXUIDisplayManager *)self serviceManager];
    [v19 beginTransactionWithIdentifier:v18 forService:v14];

    id v20 = [v17 view];
    uint64_t v21 = [v12 view];
    [v21 removeFromSuperview];
    [v20 bounds];
    objc_msgSend(v21, "setFrame:");
    [v21 setAutoresizingMask:18];
    [v17 addChildViewController:v12];
    [v20 addSubview:v21];
    [v12 didMoveToParentViewController:v17];
    if ([v12 conformsToProtocol:&unk_26D3E3960]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __87__AXUIDisplayManager__addContentViewController_toWindow_forService_context_completion___block_invoke;
      v27[3] = &unk_2645C5BE8;
      id v28 = v15;
      [v12 transitionInWithContext:a6 completion:v27];

      int v22 = 0;
    }
    else
    {
      int v22 = 1;
    }

    if (!v15) {
      goto LABEL_15;
    }
LABEL_13:
    if (v22) {
      (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
    }
    goto LABEL_15;
  }
  long long v23 = [v16 childViewControllers];
  uint64_t v24 = [v23 count];
  if (v24 || ([v17 isViewLoaded] & 1) == 0)
  {
    [v13 setHidden:v24 == 0];
  }
  else
  {
    long long v25 = [v17 view];
    long long v26 = [v25 subviews];
    objc_msgSend(v13, "setHidden:", objc_msgSend(v26, "count") == 0);
  }
  [(AXUIDisplayManager *)self _reapHiddenWindows];
  int v22 = 1;
  if (v15) {
    goto LABEL_13;
  }
LABEL_15:
}

uint64_t __87__AXUIDisplayManager__addContentViewController_toWindow_forService_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeContentViewController:(id)a3 forService:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    double v11 = AXLogUI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = [v8 view];
      id v14 = [v13 window];
      id v15 = [v14 windowScene];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2048;
      long long v25 = v15;
      _os_log_impl(&dword_221750000, v11, OS_LOG_TYPE_DEFAULT, "remove contentViewController: %@, service: %@ scene: %p", buf, 0x20u);
    }
    id v18 = v8;
    id v19 = v10;
    AXPerformBlockAsynchronouslyOnMainThread();
    uint64_t v16 = [(AXUIDisplayManager *)self _transactionIdentifierForDisplayingContentViewController:v18 service:v9];
    BOOL v17 = [(AXUIDisplayManager *)self serviceManager];
    [v17 endTransactionWithIdentifier:v16 forService:v9];
  }
}

uint64_t __73__AXUIDisplayManager__removeContentViewController_forService_completion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) parentViewController];
  int v3 = [v2 childViewControllers];
  if ([v3 count] == 1)
  {
    BOOL v4 = [v2 childViewControllers];
    BOOL v5 = [v4 firstObject];
    if (v5 == *(void **)(a1 + 32))
    {
      uint64_t v7 = [v2 view];
      id v8 = [v7 subviews];
      if ([v8 count])
      {
        id v9 = [v2 view];
        id v10 = [v9 subviews];
        if ([v10 count] == 1)
        {
          uint64_t v27 = [v2 view];
          uint64_t v26 = [v27 subviews];
          [v26 firstObject];
          double v11 = v28 = v9;
          uint64_t v12 = [*(id *)(a1 + 32) view];
          BOOL v6 = v11 == v12;

          id v9 = v28;
        }
        else
        {
          BOOL v6 = 0;
        }
      }
      else
      {
        BOOL v6 = 1;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  id v13 = [v2 view];
  id v14 = [v13 window];

  id v15 = *(void **)(a1 + 40);
  uint64_t v16 = [v14 windowScene];
  if (v6) {
    BOOL v17 = v14;
  }
  else {
    BOOL v17 = 0;
  }
  char v18 = [v15 destroyWindowSceneIfNeeded:v16 discardableWindow:v17];

  if ((v18 & 1) == 0)
  {
    [*(id *)(a1 + 32) willMoveToParentViewController:0];
    if ([*(id *)(a1 + 32) isViewLoaded])
    {
      id v19 = [*(id *)(a1 + 32) view];
      [v19 removeFromSuperview];
    }
    [*(id *)(a1 + 32) removeFromParentViewController];
    id v20 = [v2 childViewControllers];
    if ([v20 count])
    {
      [v14 setHidden:0];
    }
    else
    {
      uint64_t v21 = [v2 view];
      __int16 v22 = [v21 subviews];
      objc_msgSend(v14, "setHidden:", objc_msgSend(v22, "count") == 0);
    }
    [*(id *)(a1 + 40) _reapHiddenWindows];
  }

  id v23 = +[AXUIAssertionManager sharedInstance];
  [v23 invalidateAssertionUIIfNeeded];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    long long v25 = *(uint64_t (**)(void))(result + 16);
    return v25();
  }
  return result;
}

- (id)_transactionIdentifierForDisplayingContentViewController:(id)a3 service:(id)a4
{
  BOOL v4 = NSString;
  id v5 = a3;
  BOOL v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];

  return v8;
}

- (BOOL)_hasVisibleAlertWithType:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v4 = [(AXUIDisplayManager *)self visibleAlertContexts];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__AXUIDisplayManager__hasVisibleAlertWithType___block_invoke;
  v6[3] = &unk_2645C5C38;
  v6[4] = &v7;
  v6[5] = a3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  LOBYTE(a3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __47__AXUIDisplayManager__hasVisibleAlertWithType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 type];
  if (result == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_showAlertWithContext:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(AXUIDisplayManager *)self _platformShouldUseScenes];
  BOOL v6 = [(AXUIDisplayManager *)self windowSceneForSceneClientIdentifier:0 external:0];
  uint64_t v7 = AXLogUI();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v66 = v6;
    __int16 v67 = 2112;
    id v68 = v4;
    _os_log_impl(&dword_221750000, v7, OS_LOG_TYPE_INFO, "showAlert savedWindowScene:%p, context:%@", buf, 0x16u);
  }

  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5;
  }
  if (v8)
  {
    objc_initWeak((id *)buf, self);
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke;
    v60[3] = &unk_2645C5C60;
    objc_copyWeak(&v62, (id *)buf);
    id v9 = v4;
    id v61 = v9;
    char v10 = (void *)MEMORY[0x223C897B0](v60);
    BOOL v11 = [(AXUIDisplayManager *)self sceneRequestedForSceneClientIdentifier:0];
    [(AXUIDisplayManager *)self saveAddContentViewControllerBlock:v10 forObjectKey:v9 forSceneClientIdentifier:0];
    uint64_t v12 = AXLogUI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_221750000, v12, OS_LOG_TYPE_DEFAULT, "Need to request scene, queue alert request", v59, 2u);
    }

    if (!v11)
    {
      id v13 = +[AXUIServiceManager sharedServiceManager];
      id v14 = [v13 delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v16 = +[AXUIServiceManager sharedServiceManager];
        BOOL v17 = [v16 delegate];
        [v17 requestSceneForSceneClientIdentifier:0 scenePreferredLevel:0 spatialConfiguration:0.0];
      }
    }

    objc_destroyWeak(&v62);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    long long v48 = [v4 service];
    int v18 = [v48 conformsToProtocol:&unk_26D3E3A80];
    id v19 = v48;
    if (!v18) {
      id v19 = 0;
    }
    id v51 = v19;
    char v49 = [v4 identifier];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v51 styleProviderForAlertWithIdentifier:v49],
          (v50 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v50 = [(AXUIDisplayManager *)self defaultAlertStyleProvider];
    }
    uint64_t v20 = [v4 type];
    uint64_t v21 = [v4 text];
    __int16 v22 = [v4 subtitleText];
    id v23 = [v4 iconImage];
    __int16 v24 = [v4 userInfo];
    long long v25 = +[AXUIAlert alertWithType:v20 text:v21 subtitleText:v22 iconImage:v23 styleProvider:v50 userInfo:v24];

    [v25 setContext:v4];
    [v25 setAlpha:0.0];
    if (v25)
    {
      if (objc_opt_respondsToSelector()) {
        [v51 desiredWindowLevelForAlertWithIdentifier:v49];
      }
      else {
        double v26 = 10000002.0;
      }
      long long v47 = [(AXUIDisplayManager *)self _windowWithUserInteractionEnabled:v20 == 3 windowLevel:1 createIfNeeded:@"AXUIAlert" purposeIdentifier:0 userInterfaceStyle:0 windowScene:v6 savedWindowScene:v26];
      [v47 setHidden:0];
      uint64_t v27 = [v47 rootViewController];
      id v28 = [v27 view];
      [v25 addToContainerView:v28];

      [v4 setAlertView:v25];
      [v50 alertFadeAnimationDurationForType:v20];
      double v30 = v29;
      objc_msgSend(v4, "setFadeAnimationDuration:");
      [v4 duration];
      double v32 = v31;
      if (v31 < 1.79769313e308)
      {
        long long v33 = [v4 showOrHideTimer];
        [v33 cancel];

        id v34 = objc_alloc(MEMORY[0x263F21398]);
        long long v35 = (void *)[v34 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke_466;
        v57[3] = &unk_2645C5AB0;
        v57[4] = self;
        id v36 = v4;
        id v58 = v36;
        [v35 afterDelay:v57 processBlock:v30 + v32];
        [v36 setShowOrHideTimer:v35];
      }
      long long v37 = [(AXUIDisplayManager *)self visibleAlertContexts];
      if (!v37)
      {
        long long v37 = objc_opt_new();
        [(AXUIDisplayManager *)self setVisibleAlertContexts:v37];
      }
      [v37 setObject:v4 forKey:v49];
      BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
      if (v20 != 4 && IsVoiceOverRunning)
      {
        id v40 = objc_alloc(MEMORY[0x263F086A0]);
        long long v41 = [v4 text];
        long long v42 = [v4 subtitleText];
        long long v43 = __AXStringForVariables();
        uint64_t v63 = *MEMORY[0x263F216D8];
        v64 = &unk_26D3C9B10;
        long long v44 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1, v42, @"__AXStringForVariablesSentinel");
        long long v45 = (void *)[v40 initWithString:v43 attributes:v44];

        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v45);
      }
      long long v46 = (void *)MEMORY[0x263F1CB60];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke_474;
      v55[3] = &unk_2645C5968;
      id v56 = v25;
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke_2;
      v52[3] = &unk_2645C5C88;
      id v53 = v51;
      id v54 = v49;
      [v46 animateWithDuration:v55 animations:v52 completion:v30];
    }
  }
}

void __44__AXUIDisplayManager__showAlertWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showAlertWithContext:*(void *)(a1 + 32)];
}

uint64_t __44__AXUIDisplayManager__showAlertWithContext___block_invoke_466(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideAlertWithContext:*(void *)(a1 + 40) notifyDelegate:1];
  char v2 = *(void **)(a1 + 40);

  return [v2 setShowOrHideTimer:0];
}

uint64_t __44__AXUIDisplayManager__showAlertWithContext___block_invoke_474(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __44__AXUIDisplayManager__showAlertWithContext___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      int v3 = *(void **)(v2 + 32);
      uint64_t v4 = *(void *)(v2 + 40);
      return [v3 alertWithIdentifierDidAppear:v4];
    }
  }
  return result;
}

- (void)_hideAlertWithContext:(id)a3 notifyDelegate:(BOOL)a4
{
  id v6 = a3;
  [(AXUIDisplayManager *)self removeAddContentViewControllerBlockForObjectKey:v6];
  uint64_t v7 = [(AXUIDisplayManager *)self visibleAlertContexts];
  BOOL v8 = [v6 identifier];
  [v7 removeObjectForKey:v8];

  if (![v7 count]) {
    [(AXUIDisplayManager *)self setVisibleAlertContexts:0];
  }
  id v9 = [v6 alertView];
  [v9 alpha];
  if (v10 <= 2.22044605e-16)
  {
    [(AXUIDisplayManager *)self _didHideOrDequeueAlertWithContext:v6];
    -[AXUIDisplayManager _handleNextAlertForType:](self, "_handleNextAlertForType:", [v6 type]);
  }
  else
  {
    BOOL v11 = (void *)MEMORY[0x263F1CB60];
    [v6 fadeAnimationDuration];
    double v13 = v12;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke;
    v19[3] = &unk_2645C5AB0;
    id v20 = v6;
    id v21 = v9;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke_2;
    v14[3] = &unk_2645C5CB0;
    id v15 = v21;
    uint64_t v16 = self;
    BOOL v18 = a4;
    id v17 = v20;
    [v11 animateWithDuration:v19 animations:v14 completion:v13];
  }
}

uint64_t __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == 3)
  {
    [*(id *)(a1 + 40) frame];
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", v5.origin.x, -CGRectGetHeight(v5), v5.size.width, v5.size.height);
  }
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

void __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke_2(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) window];
  uint64_t v2 = [v14 rootViewController];
  [*(id *)(a1 + 32) removeFromSuperview];
  int v3 = [v2 childViewControllers];
  uint64_t v4 = [v3 count];
  if (v4 || ([v2 isViewLoaded] & 1) == 0)
  {
    [v14 setHidden:v4 == 0];
  }
  else
  {
    CGRect v5 = [v2 view];
    id v6 = [v5 subviews];
    objc_msgSend(v14, "setHidden:", objc_msgSend(v6, "count") == 0);
  }
  [*(id *)(a1 + 40) _reapHiddenWindows];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v7 = [*(id *)(a1 + 48) service];
    if ([v7 conformsToProtocol:&unk_26D3E3A80]) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
    id v9 = v8;
    if (objc_opt_respondsToSelector())
    {
      double v10 = [*(id *)(a1 + 48) identifier];
      [v9 alertWithIdentifierDidDisappear:v10];
    }
  }
  [*(id *)(a1 + 40) _didHideOrDequeueAlertWithContext:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 40), "_handleNextAlertForType:", objc_msgSend(*(id *)(a1 + 48), "type"));
  BOOL v11 = *(void **)(a1 + 40);
  double v12 = [v14 windowScene];
  [v11 destroyWindowSceneIfNeeded:v12 discardableWindow:0];

  double v13 = +[AXUIAssertionManager sharedInstance];
  [v13 invalidateAssertionUIIfNeeded];
}

- (void)_showOrEnqueueAlertWithContext:(id)a3
{
  id v12 = a3;
  if (-[AXUIDisplayManager _hasVisibleAlertWithType:](self, "_hasVisibleAlertWithType:", [v12 type]))
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "type"));
    CGRect v5 = [(AXUIDisplayManager *)self alertQueues];
    uint64_t v6 = [v5 objectForKey:v4];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
    }
    else
    {
      uint64_t v7 = objc_opt_new();
      if (!v5)
      {
        CGRect v5 = objc_opt_new();
        [(AXUIDisplayManager *)self setAlertQueues:v5];
      }
      [v5 setObject:v7 forKey:v4];
    }
    objc_msgSend(v7, "ax_enqueueObject:", v12);
    [v7 sortUsingComparator:&__block_literal_global_479];
    BOOL v8 = [v12 service];
    if ([v8 conformsToProtocol:&unk_26D3E3A80]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    if (objc_opt_respondsToSelector())
    {
      BOOL v11 = [v12 identifier];
      [v10 alertWithIdentifierWasEnqueued:v11];
    }
  }
  else
  {
    [(AXUIDisplayManager *)self _showAlertWithContext:v12];
  }
}

uint64_t __53__AXUIDisplayManager__showOrEnqueueAlertWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unint64_t v8 = [v6 priority];
  unint64_t v9 = [v7 priority];
  BOOL v10 = v8 == v9;
  if (v8 < v9) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 1;
  }
  if (v10)
  {
    [v7 creationTimeInterval];
    double v13 = v12;
    [v6 creationTimeInterval];
    uint64_t v11 = v13 >= v14 ? 1 : -1;
    if (v13 == v14)
    {
      [v7 duration];
      double v16 = v15;
      [v6 duration];
      uint64_t v18 = -1;
      if (v16 >= v17) {
        uint64_t v18 = 1;
      }
      if (v16 == v17) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = v18;
      }
    }
  }

  return v11;
}

- (void)_handleNextAlertForType:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(AXUIDisplayManager *)self alertQueues];
  id v6 = [v5 objectForKey:v4];
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy_;
  double v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v21 = 0;
  __int16 v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__AXUIDisplayManager__handleNextAlertForType___block_invoke;
  v16[3] = &unk_2645C5CF8;
  v16[4] = &v25;
  v16[5] = &v21;
  v16[6] = &v17;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v16];
  if (v18[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "removeObjectAtIndex:");
    if (![v6 count])
    {
      [v5 removeObjectForKey:v4];
      if (![v5 count]) {
        [(AXUIDisplayManager *)self setAlertQueues:0];
      }
    }
    id v7 = [(AXUIDisplayManager *)self visibleAlertContexts];
    if (!v7)
    {
      id v7 = objc_opt_new();
      [(AXUIDisplayManager *)self setVisibleAlertContexts:v7];
    }
    unint64_t v8 = (void *)v26[5];
    unint64_t v9 = [v8 identifier];
    [v7 setObject:v8 forKey:v9];

    id v10 = objc_alloc(MEMORY[0x263F21398]);
    uint64_t v11 = MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    double v13 = (void *)[v10 initWithTargetSerialQueue:v11];

    double v14 = v22[3];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__AXUIDisplayManager__handleNextAlertForType___block_invoke_2;
    v15[3] = &unk_2645C5D20;
    void v15[4] = self;
    v15[5] = &v25;
    [v13 afterDelay:v15 processBlock:v14];
    [(id)v26[5] setShowOrHideTimer:v13];
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __46__AXUIDisplayManager__handleNextAlertForType___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  unint64_t v8 = [v18 service];
  if ([v8 conformsToProtocol:&unk_26D3E3A80]) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = 0;
  }
  id v10 = v9;
  double v11 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    id v12 = [v18 identifier];
    [v10 delayForDequeuingAlertWithIdentifier:v12];
    double v11 = v13;
  }
  uint64_t v14 = *(void *)(a1[4] + 8);
  double v15 = *(void **)(v14 + 40);
  if (!v15) {
    goto LABEL_11;
  }
  double v16 = [v15 service];
  if (v8 != v16 && ([v8 isEqual:v16] & 1) == 0)
  {
    [v18 duration];
    if (v11 + v17 < *(double *)(*(void *)(a1[5] + 8) + 24))
    {
      *a4 = 1;

      uint64_t v14 = *(void *)(a1[4] + 8);
LABEL_11:
      objc_storeStrong((id *)(v14 + 40), a2);
      *(double *)(*(void *)(a1[5] + 8) + 24) = v11;
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
      goto LABEL_13;
    }
  }

LABEL_13:
}

uint64_t __46__AXUIDisplayManager__handleNextAlertForType___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showAlertWithContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 setShowOrHideTimer:0];
}

- (void)_didHideOrDequeueAlertWithContext:(id)a3
{
  id v4 = a3;
  id v7 = [v4 service];
  id v5 = [(AXUIDisplayManager *)self _transactionIdentifierForDisplayingAlertWithContext:v4 service:v7];

  id v6 = [(AXUIDisplayManager *)self serviceManager];
  [v6 endTransactionWithIdentifier:v5 forService:v7];
}

- (id)_transactionIdentifierForDisplayingAlertWithContext:(id)a3 service:(id)a4
{
  return (id)[a3 description];
}

- (id)_nubbitContextKeyForNubbit:(id)a3
{
  return (id)[MEMORY[0x263F08D40] valueWithPointer:a3];
}

- (id)_boundingViewForNubbit:(id)a3
{
  return (id)[a3 superview];
}

- (id)_nubbitContextForGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  if (v5)
  {
    id v6 = [(AXUIDisplayManager *)self nubbitContexts];
    id v7 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v5];
    unint64_t v8 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    _AXLogWithFacility();
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)_scheduleFadeForNubbitContext:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  id v4 = [v3 fadeTimer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke;
  v6[3] = &unk_2645C5D48;
  id v5 = v3;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [v4 afterDelay:v6 processBlock:3.0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke_2;
  v3[3] = &unk_2645C5D48;
  id v4 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 animateWithDuration:v3 animations:0.5];
  objc_destroyWeak(&v5);
}

void __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    id v5 = [*(id *)(a1 + 32) nubbit];
    [v4 idleOpacityForNubbit:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.35;
  }
  id v8 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained originalAlpha];
  double v10 = v7 * v9;
  id v11 = objc_loadWeakRetained(v8);
  id v12 = [v11 nubbit];
  [v12 setAlpha:v10];
}

- (void)_undoFadeForNubbitContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fadeTimer];
  [v4 cancel];

  [v3 originalAlpha];
  double v6 = v5;
  id v7 = [v3 nubbit];

  [v7 setAlpha:v6];
}

- (void)_addDynamicAnimationsForNubbitContext:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 nubbit];
  id v6 = objc_alloc(MEMORY[0x263F1C608]);
  id v7 = [(AXUIDisplayManager *)self _boundingViewForNubbit:v5];
  id v8 = (void *)[v6 initWithReferenceView:v7];

  [v8 setDelegate:self];
  [v4 setDynamicAnimator:v8];
  id v9 = objc_alloc(MEMORY[0x263F1C540]);
  v16[0] = v5;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v11 = (void *)[v9 initWithItems:v10];

  [v11 setCollisionDelegate:self];
  [v11 setTranslatesReferenceBoundsIntoBoundary:1];
  [v8 addBehavior:v11];
  [v4 setCollisionBehavior:v11];
  id v12 = objc_alloc(MEMORY[0x263F1C610]);
  double v15 = v5;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  uint64_t v14 = (void *)[v12 initWithItems:v13];

  [v14 setAllowsRotation:0];
  [v14 setFriction:100.0];
  [v8 addBehavior:v14];
  [v4 setDynamicItemBehavior:v14];
}

- (void)_removeDynamicAnimationsForNubbitContext:(id)a3
{
  id v5 = a3;
  id v3 = [v5 dynamicAnimator];
  [v3 removeAllBehaviors];

  id v4 = [v5 dynamicAnimator];
  [v4 setDelegate:0];

  [v5 setDynamicAnimator:0];
}

- (void)_beginMoveForNubbitContext:(id)a3
{
  id v26 = a3;
  id v4 = [v26 nubbit];
  id v5 = [v26 moveNubbitGestureRecognizer];
  uint64_t v6 = [(AXUIDisplayManager *)self _boundingViewForNubbit:v4];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = [v26 delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v12 = [v26 delegate];
    [v12 nubbitWillBeginDragging:v4];
  }
  [(AXUIDisplayManager *)self _undoFadeForNubbitContext:v26];
  double v13 = [v26 dynamicAnimator];
  if (!v13) {
    _AXAssert();
  }
  uint64_t v14 = [v26 gravityBehavior];
  [v13 removeBehavior:v14];

  [v26 setGravityBehavior:0];
  double v15 = [v26 snapToBoundaryBehavior];
  [v13 removeBehavior:v15];

  [v26 setSnapToBoundaryBehavior:0];
  double v16 = [v26 collisionBehavior];
  [v13 removeBehavior:v16];

  if ([(AXUIDisplayManager *)self activeInterfaceOrientation] == 1)
  {
    if (AXDeviceHasJindo())
    {
      double v17 = [v26 collisionBehavior];
      objc_msgSend(v17, "addBoundaryWithIdentifier:fromPoint:toPoint:", @"foreheadRect", 0.0, self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0, self->_foreheadRect.size.width * 5.0, self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0);

      if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v8, v10)) {
        double v10 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0;
      }
    }
  }
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C448]), "initWithItem:attachedToAnchor:", v4, v8, v10);
  [v13 addBehavior:v18];
  [v26 setFollowPanBehavior:v18];
  uint64_t v19 = NSString;
  uint64_t v20 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v4];
  uint64_t v21 = [v19 stringWithFormat:@"%@", v20];

  __int16 v22 = [v26 disableSystemGesturesAssertion];

  if (v22)
  {
    uint64_t v23 = [MEMORY[0x263F22828] assertionWithType:*MEMORY[0x263F223D8] identifier:v21];
    [v26 setDisableSystemGesturesAssertion:v23];
  }
  uint64_t v24 = [v26 disableDashBoardSystemGesturesAssertion];

  if (v24)
  {
    uint64_t v25 = [MEMORY[0x263F22828] assertionWithType:*MEMORY[0x263F223A8] identifier:v21];
    [v26 setDisableDashBoardSystemGesturesAssertion:v25];
  }
}

- (void)_changeNubbitPositionForNubbitContext:(id)a3
{
  id v13 = a3;
  id v4 = [v13 moveNubbitGestureRecognizer];
  id v5 = [v13 nubbit];
  uint64_t v6 = [(AXUIDisplayManager *)self _boundingViewForNubbit:v5];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v8, v10))
  {
    id v11 = [v13 moveNubbitGestureRecognizer];
    [v11 setState:3];
  }
  id v12 = [v13 followPanBehavior];
  objc_msgSend(v12, "setAnchorPoint:", v8, v10);
}

- (void)_endMoveForNubbitContext:(id)a3
{
  id v16 = a3;
  id v4 = [v16 nubbit];
  id v5 = [(AXUIDisplayManager *)self _boundingViewForNubbit:v4];
  uint64_t v6 = [v16 moveNubbitGestureRecognizer];
  [v6 velocityInView:v5];
  double v8 = v7;
  double v10 = v9;

  if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v8, v10)) {
    double v10 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0;
  }
  id v11 = [v16 dynamicAnimator];
  id v12 = [v16 followPanBehavior];
  [v11 removeBehavior:v12];

  [v16 setFollowPanBehavior:0];
  id v13 = [v16 dynamicItemBehavior];
  objc_msgSend(v13, "addLinearVelocity:forItem:", v4, v8, v10);

  uint64_t v14 = -[AXUIDisplayManager _gravityBehaviorForNubbit:velocity:boundingView:](self, "_gravityBehaviorForNubbit:velocity:boundingView:", v4, v5, v8, v10);
  [v11 addBehavior:v14];
  [v16 setGravityBehavior:v14];
  double v15 = [v16 collisionBehavior];
  [v11 addBehavior:v15];

  [(AXUIDisplayManager *)self _scheduleFadeForNubbitContext:v16];
  [v16 setDisableSystemGesturesAssertion:0];
  [v16 setDisableDashBoardSystemGesturesAssertion:0];
}

- (void)pinNubbitToEdge:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUIDisplayManager *)self nubbitContexts];
  uint64_t v6 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  [(AXUIDisplayManager *)self _endMoveForNubbitContext:v7];
}

- (id)_gravityBehaviorForNubbit:(id)a3 velocity:(CGPoint)a4 boundingView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (a3)
  {
    double v9 = (objc_class *)MEMORY[0x263F1C690];
    id v10 = a3;
    id v11 = [v9 alloc];
    v24[0] = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    a3 = (id)[v11 initWithItems:v12];

    [v10 center];
    double v14 = v13 + x * 0.22;
    [v10 center];
    double v16 = v15;

    [v8 frame];
    if (v14 <= CGRectGetMinX(v26) + 50.0) {
      goto LABEL_14;
    }
    [v8 frame];
    if (v14 >= CGRectGetMaxX(v27) + -50.0) {
      goto LABEL_14;
    }
    double v17 = v16 + y * 0.22;
    [v8 frame];
    CGFloat MinY = CGRectGetMinY(v28);
    double v19 = -1.0;
    double v20 = 0.0;
    if (v17 >= MinY + 80.0)
    {
      [v8 frame];
      CGFloat MaxY = CGRectGetMaxY(v29);
      double v19 = 1.0;
      if (v17 <= MaxY + -80.0)
      {
LABEL_14:
        [v8 frame];
        CGFloat MidX = CGRectGetMidX(v30);
        double v19 = 0.0;
        double v20 = 1.0;
        if (v14 <= MidX) {
          double v20 = -1.0;
        }
      }
    }
    objc_msgSend(a3, "setGravityDirection:", v20 * 5.0, v19 * 5.0);
  }

  return a3;
}

- (void)_handleMoveNubbitGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v7 = [(AXUIDisplayManager *)self _nubbitContextForGestureRecognizer:v4];
  uint64_t v5 = [v4 state];

  if ((unint64_t)(v5 - 3) < 2)
  {
    [(AXUIDisplayManager *)self _endMoveForNubbitContext:v7];
  }
  else if (v5 == 2)
  {
    [(AXUIDisplayManager *)self _changeNubbitPositionForNubbitContext:v7];
  }
  else
  {
    uint64_t v6 = v7;
    if (v5 != 1) {
      goto LABEL_8;
    }
    [(AXUIDisplayManager *)self _beginMoveForNubbitContext:v7];
  }
  uint64_t v6 = v7;
LABEL_8:
}

- (void)cancelNubbitFade:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXUIDisplayManager *)self nubbitContexts];
  uint64_t v6 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    [(AXUIDisplayManager *)self _undoFadeForNubbitContext:v7];
    [(AXUIDisplayManager *)self _scheduleFadeForNubbitContext:v7];
  }
}

- (void)_attemptToInitializeActiveInterfaceOrientation
{
  id v4 = [MEMORY[0x263F22998] server];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__AXUIDisplayManager__attemptToInitializeActiveInterfaceOrientation__block_invoke;
  v5[3] = &unk_2645C5D98;
  v5[4] = self;
  v5[5] = a2;
  [v4 activeInterfaceOrientation:v5];
}

uint64_t __68__AXUIDisplayManager__attemptToInitializeActiveInterfaceOrientation__block_invoke()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __68__AXUIDisplayManager__attemptToInitializeActiveInterfaceOrientation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setActiveInterfaceOrientation:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    return [v2 setNumberOfAttemptsToInitializeActiveInterfaceOrientation:0];
  }
  else
  {
    unint64_t v4 = [v2 numberOfAttemptsToInitializeActiveInterfaceOrientation] + 1;
    uint64_t result = [*(id *)(a1 + 32) setNumberOfAttemptsToInitializeActiveInterfaceOrientation:v4];
    if (v4 <= 0x1D)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      return [v5 performSelector:v6 withObject:0 afterDelay:0.5];
    }
  }
  return result;
}

- (BOOL)_serviceWantsToPreventAutorotation:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_26D3E3A20])
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector()) {
      char v5 = [v4 shouldPreventAutorotatingAllContentViewControllers];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)dynamicAnimatorDidPause:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v5 = [(AXUIDisplayManager *)self nubbitContexts];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 dynamicAnimator];

        if (v12 == v4)
        {
          double v13 = [v11 delegate];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            double v15 = [v11 delegate];
            double v16 = [v11 nubbit];
            [v15 nubbitDidUpdatePosition:v16];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)collisionBehavior:(id)a3 beganContactForItem:(id)a4 withBoundaryIdentifier:(id)a5 atPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v15 = a4;
  uint64_t v9 = [(AXUIDisplayManager *)self nubbitContexts];
  id v10 = [(AXUIDisplayManager *)self _nubbitContextKeyForNubbit:v15];
  id v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = [v11 snapToBoundaryBehavior];

  if (!v12)
  {
    double v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C998]), "initWithItem:snapToPoint:", v15, x, y);
    [v11 setSnapToBoundaryBehavior:v13];
    char v14 = [v11 dynamicAnimator];
    [v14 addBehavior:v13];
  }
}

- (void)_resetServiceManager
{
}

- (void)_reapHiddenWindows
{
  v11[2] = *MEMORY[0x263EF8340];
  v11[0] = NSStringFromSelector(sel_activeWindows);
  uint64_t v3 = NSStringFromSelector(sel_passiveWindows);
  uint64_t v4 = 0;
  v11[1] = v3;
  char v5 = 1;
  do
  {
    char v6 = v5;
    id v7 = (id)v11[v4];
    uint64_t v8 = [(AXUIDisplayManager *)self valueForKey:v7];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__AXUIDisplayManager__reapHiddenWindows__block_invoke;
    v10[3] = &unk_2645C5DE8;
    void v10[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
    if (![v8 count]) {
      [(AXUIDisplayManager *)self setValue:0 forKey:v7];
    }

    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  for (uint64_t i = 1; i != -1; --i)
}

void __40__AXUIDisplayManager__reapHiddenWindows__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__AXUIDisplayManager__reapHiddenWindows__block_invoke_2;
  v7[3] = &unk_2645C5DC0;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = &v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
  if (v9[5]) {
    objc_msgSend(v6, "removeObjectsForKeys:");
  }
  _Block_object_dispose(&v8, 8);
}

void __40__AXUIDisplayManager__reapHiddenWindows__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 isHidden])
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v11];
    uint64_t v10 = [*(id *)(a1 + 32) windowHostingController];
    objc_msgSend(v10, "unregisterWindowWithContextID:", objc_msgSend(v5, "_contextId"));
  }
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"AXUIDisplayManager<%p>", self);
  double v32 = [(AXUIDisplayManager *)v2 activeWindows];
  if ([v32 count])
  {
    CGRect v27 = v2;
    [v3 appendFormat:@"\nActive Windows:\n"];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = [v32 allKeys];
    uint64_t v33 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v33)
    {
      uint64_t v30 = *(void *)v50;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v4;
          uint64_t v5 = *(void *)(*((void *)&v49 + 1) + 8 * v4);
          [v3 appendFormat:@"  ID: %@\n", v5];
          id v6 = [v32 objectForKeyedSubscript:v5];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v7 = [v6 allKeys];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v55 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v46 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                id v13 = [v6 objectForKeyedSubscript:v12];
                [v3 appendFormat:@"    %@: %@\n", v12, v13];
                char v14 = [v13 rootViewController];
                [v3 appendFormat:@"      Content: %@\n", v14];
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v55 count:16];
            }
            while (v9);
          }

          uint64_t v4 = v35 + 1;
        }
        while (v35 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v33);
    }

    uint64_t v2 = v27;
  }
  id v15 = [(AXUIDisplayManager *)v2 passiveWindows];
  if ([v15 count])
  {
    [v3 appendFormat:@"\nPassive Windows:\n"];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obja = [v15 allKeys];
    uint64_t v36 = [obja countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v36)
    {
      uint64_t v31 = *(void *)v42;
      id v34 = v15;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(obja);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          [v3 appendFormat:@"  ID: %@\n", v17];
          long long v18 = [v15 objectForKeyedSubscript:v17];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v19 = [v18 allKeys];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v53 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v38;
            do
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v38 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * k);
                uint64_t v25 = [v18 objectForKeyedSubscript:v24];
                [v3 appendFormat:@"    %@: %@\n", v24, v25];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v53 count:16];
            }
            while (v21);
          }

          id v15 = v34;
        }
        uint64_t v36 = [obja countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v36);
    }
  }

  return (NSString *)v3;
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    self->_foreheadRect.origin.double x = v6;
    self->_foreheadRect.origin.double y = v7;
    self->_foreheadRect.size.width = v8;
    self->_foreheadRect.size.height = v9;
  }
  else
  {
    if ([v4 count] != 2) {
      goto LABEL_6;
    }
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    long long v18 = [v4 objectAtIndexedSubscript:1];
    [v18 CGRectValue];
    v48.origin.double x = v19;
    v48.origin.double y = v20;
    v48.size.width = v21;
    v48.size.height = v22;
    v47.origin.double x = v11;
    v47.origin.double y = v13;
    v47.size.width = v15;
    v47.size.height = v17;
    self->_foreheadRect = CGRectUnion(v47, v48);
  }
LABEL_6:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v23 = [(AXUIDisplayManager *)self nubbitContexts];
  uint64_t v24 = [v23 allValues];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        CGRect v29 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v30 = [v29 nubbit];
        [v30 frame];
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;

        if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v32, v34)
          && AXDeviceHasJindo())
        {
          CGFloat v39 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0;
          long long v40 = [v29 nubbit];
          objc_msgSend(v40, "setFrame:", v32, v39, v36, v38);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v26);
  }
}

- (BOOL)_axIsPointInForeheadRect:(CGPoint)a3
{
  double y = a3.y;
  if ([(AXUIDisplayManager *)self activeInterfaceOrientation] != 1
    || self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0 < y)
  {
    return 0;
  }

  return AXDeviceHasJindo();
}

- (AXUIAlertStyleProvider)defaultAlertStyleProvider
{
  return self->_defaultAlertStyleProvider;
}

- (void)setDefaultAlertStyleProvider:(id)a3
{
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setActiveInterfaceOrientation:(int64_t)a3
{
  self->_activeInterfaceOrientation = a3;
}

- (unint64_t)numberOfAttemptsToInitializeActiveInterfaceOrientation
{
  return self->_numberOfAttemptsToInitializeActiveInterfaceOrientation;
}

- (void)setNumberOfAttemptsToInitializeActiveInterfaceOrientation:(unint64_t)a3
{
  self->_numberOfAttemptsToInitializeActiveInterfaceOrientation = a3;
}

- (AXUIServiceManager)serviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceManager);

  return (AXUIServiceManager *)WeakRetained;
}

- (void)setServiceManager:(id)a3
{
}

- (NSMutableDictionary)alertQueues
{
  return self->_alertQueues;
}

- (void)setAlertQueues:(id)a3
{
}

- (NSMutableDictionary)visibleAlertContexts
{
  return self->_visibleAlertContexts;
}

- (void)setVisibleAlertContexts:(id)a3
{
}

- (NSMutableDictionary)activeWindows
{
  return self->_activeWindows;
}

- (void)setActiveWindows:(id)a3
{
}

- (NSMutableDictionary)passiveWindows
{
  return self->_passiveWindows;
}

- (void)setPassiveWindows:(id)a3
{
}

- (NSMutableDictionary)activeContentViewControllers
{
  return self->_activeContentViewControllers;
}

- (void)setActiveContentViewControllers:(id)a3
{
}

- (NSMutableDictionary)passiveContentViewControllers
{
  return self->_passiveContentViewControllers;
}

- (void)setPassiveContentViewControllers:(id)a3
{
}

- (NSString)systemServerActionHandlerIdentifier
{
  return self->_systemServerActionHandlerIdentifier;
}

- (void)setSystemServerActionHandlerIdentifier:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSMutableDictionary)mainScenes
{
  return self->_mainScenes;
}

- (void)setMainScenes:(id)a3
{
}

- (NSMutableDictionary)externalScenes
{
  return self->_externalScenes;
}

- (void)setExternalScenes:(id)a3
{
}

- (NSMutableDictionary)sceneClients
{
  return self->_sceneClients;
}

- (void)setSceneClients:(id)a3
{
}

- (NSMutableDictionary)nubbitContexts
{
  return self->_nubbitContexts;
}

- (void)setNubbitContexts:(id)a3
{
}

- (SBSAccessibilityWindowHostingController)windowHostingController
{
  return self->_windowHostingController;
}

- (void)setWindowHostingController:(id)a3
{
}

- (NSMutableDictionary)addContentViewControllerBlocks
{
  return self->_addContentViewControllerBlocks;
}

- (void)setAddContentViewControllerBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addContentViewControllerBlocks, 0);
  objc_storeStrong((id *)&self->_windowHostingController, 0);
  objc_storeStrong((id *)&self->_nubbitContexts, 0);
  objc_storeStrong((id *)&self->_sceneClients, 0);
  objc_storeStrong((id *)&self->_externalScenes, 0);
  objc_storeStrong((id *)&self->_mainScenes, 0);
  objc_storeStrong((id *)&self->_systemServerActionHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_passiveContentViewControllers, 0);
  objc_storeStrong((id *)&self->_activeContentViewControllers, 0);
  objc_storeStrong((id *)&self->_passiveWindows, 0);
  objc_storeStrong((id *)&self->_activeWindows, 0);
  objc_storeStrong((id *)&self->_visibleAlertContexts, 0);
  objc_storeStrong((id *)&self->_alertQueues, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_defaultAlertStyleProvider, 0);

  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end