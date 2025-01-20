@interface AXSpringBoardServerSideAppManager
+ (AXSpringBoardServerSideAppManager)sharedInstance;
+ (id)_mainDisplaySceneManager;
- (AXSpringBoardServerSideAppManager)init;
- (AXSpringBoardServerSideAppManagerDelegate)delegate;
- (BOOL)_hasFloatingApp;
- (BOOL)_hasPinnedApp;
- (BOOL)_isDockIconView:(id)a3;
- (BOOL)canActivateMedusaForDock;
- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3;
- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3;
- (BOOL)hasMultipleApps;
- (BOOL)isDisplayingApp;
- (BOOL)performMedusaGesture:(unint64_t)a3;
- (id)_activeApplicationBundleIdentifiers;
- (id)_appForLayoutRole:(int64_t)a3 layoutState:(id)a4;
- (id)_appWithIdentifier:(id)a3;
- (id)_applicationController;
- (id)_bundleIdentifierForIconView:(id)a3;
- (id)_firstFloatingAppLayout;
- (id)_floatingAppRootViewController;
- (id)_mainDisplaySceneManager;
- (id)_sbEmptyEntity;
- (id)_sbPreviousEntity;
- (id)_sbPreviousWorkspaceEntityClass;
- (id)_sbSwitcherTransitionRequestClass;
- (id)_sbWorkspaceMainWorkspace;
- (id)allowedMedusaGestures;
- (id)appForLayoutRole:(int64_t)a3;
- (id)medusaAppBundleIdsToLayoutRoles;
- (id)medusaApps;
- (id)sceneLayoutState;
- (int64_t)_currentFloatingConfiguration;
- (int64_t)_currentSpaceConfiguration;
- (unint64_t)dockIconActivationMode;
- (void)_addFloatingApplicationGesturesIfAllowed:(id)a3;
- (void)_addResizeGestureRecognizerGesturesIfAllowed:(id)a3;
- (void)_endDockIconActivationModeAfterTimeout;
- (void)_enumerateAppsAndLayoutRoles:(id)a3;
- (void)_performMedusaGesture:(unint64_t)a3;
- (void)_performSwipeOnFloatingAppSwitcher:(unint64_t)a3;
- (void)_performValidation;
- (void)_requestFloatingAppSwitcherVisible;
- (void)_requestTransactionWithPrimaryEntity:(id)a3 sideEntity:(id)a4 floatingEntity:(id)a5 spaceConfiguration:(int64_t)a6 floatingConfiguration:(int64_t)a7;
- (void)launchApplication:(id)a3;
- (void)launchApplicationWithFullConfiguration:(id)a3;
- (void)launchFloatingApplication:(id)a3;
- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDockIconActivationMode:(unint64_t)a3;
@end

@implementation AXSpringBoardServerSideAppManager

- (BOOL)_isDockIconView:(id)a3
{
  id v3 = a3;
  v4 = [v3 safeValueForKey:@"_iconLocation"];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v5 = (id *)getSBIconLocationDockSymbolLoc_ptr;
  uint64_t v15 = getSBIconLocationDockSymbolLoc_ptr;
  if (!getSBIconLocationDockSymbolLoc_ptr)
  {
    v6 = (void *)SpringBoardHomeLibrary();
    v13[3] = (uint64_t)dlsym(v6, "SBIconLocationDock");
    getSBIconLocationDockSymbolLoc_ptr = v13[3];
    v5 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v5) {
    -[AXSpringBoardServerSideAppManager _isDockIconView:]();
  }
  id v7 = *v5;
  if ([v4 isEqual:v7]) {
    goto LABEL_9;
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v8 = (void *)getSBIconLocationFloatingDockSymbolLoc_ptr;
  uint64_t v15 = getSBIconLocationFloatingDockSymbolLoc_ptr;
  if (!getSBIconLocationFloatingDockSymbolLoc_ptr)
  {
    v9 = (void *)SpringBoardHomeLibrary();
    v13[3] = (uint64_t)dlsym(v9, "SBIconLocationFloatingDock");
    getSBIconLocationFloatingDockSymbolLoc_ptr = v13[3];
    v8 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v8) {
    -[AXSpringBoardServerSideAppManager _isDockIconView:]();
  }
  if ([v4 isEqualToString:*v8]) {
LABEL_9:
  }
    char v10 = 1;
  else {
    char v10 = [v4 isEqual:@"SBIconLocationFloatingDockSuggestions"];
  }

  return v10;
}

+ (AXSpringBoardServerSideAppManager)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AXSpringBoardServerSideAppManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_SharedInstance;
  return (AXSpringBoardServerSideAppManager *)v2;
}

- (void)setDockIconActivationMode:(unint64_t)a3
{
  if (self->_dockIconActivationMode != a3)
  {
    self->_dockIconActivationMode = a3;
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__endDockIconActivationModeAfterTimeout object:0];
    if (a3)
    {
      [(AXSpringBoardServerSideAppManager *)self performSelector:sel__endDockIconActivationModeAfterTimeout withObject:0 afterDelay:15.0];
    }
  }
}

- (unint64_t)dockIconActivationMode
{
  return self->_dockIconActivationMode;
}

- (id)_bundleIdentifierForIconView:(id)a3
{
  id v3 = [a3 safeValueForKey:@"icon"];
  v4 = [v3 safeStringForKey:@"applicationBundleID"];

  return v4;
}

- (id)_appWithIdentifier:(id)a3
{
  return AXSBApplicationWithIdentifier(a3);
}

uint64_t __51__AXSpringBoardServerSideAppManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_SharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (AXSpringBoardServerSideAppManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSpringBoardServerSideAppManager;
  v2 = [(AXSpringBoardServerSideAppManager *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(AXSpringBoardServerSideAppManager *)v2 _performValidation];
  }
  return v3;
}

- (void)_performValidation
{
  id v2 = [MEMORY[0x263F21400] sharedInstance];
  [v2 performValidations:&__block_literal_global_3 withPreValidationHandler:&__block_literal_global_525 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_531];
}

uint64_t __55__AXSpringBoardServerSideAppManager__performValidation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SBPlatformController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBPlatformController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPlatformController", @"medusaCapabilities", "q", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"mainDisplaySceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"externalForegroundApplicationSceneHandles", "@", 0);
  [v2 validateClass:@"SBMainDisplaySceneManager"];
  [v2 validateClass:@"SBMainDisplaySceneManager" hasProperty:@"currentLayoutState" withType:"@"];
  [v2 validateClass:@"SBSceneManager"];
  [v2 validateClass:@"SBSceneManager" conformsToProtocol:@"SBApplicationSceneHandleProviding"];
  [v2 validateClass:@"SBSceneManager" conformsToProtocol:@"SBApplicationSceneIdentityProviding"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"newSceneIdentityForApplication:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"fetchOrCreateApplicationSceneHandleForRequest:", "@", "@", 0);
  [v2 validateClass:@"SBApplicationSceneHandleRequest"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationSceneHandleRequest", @"defaultRequestForApplication:sceneIdentity:displayIdentity:", "@", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"elementWithRole:", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"spaceConfiguration", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"floatingConfiguration", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"unlockedEnvironmentMode", "q", 0);
  [v2 validateClass:@"SBMainSwitcherControllerCoordinator"];
  [v2 validateClass:@"SBSwitcherController" hasProperty:@"contentViewController" withType:"@"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"sharedInstanceIfExists", "@", 0);
  [v2 validateClass:@"SBMainSwitcherControllerCoordinator" hasInstanceVariable:@"_appLayouts" withType:"NSArray"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentFloatingAppLayout", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_configureRequest:forSwitcherTransitionRequest:withEventLabel:", "v", "@", "@", "@", 0);
  [v2 validateClass:@"SBSwitcherTransitionRequest"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSwitcherTransitionRequest", @"requestForActivatingAppLayout:", "@", "@", 0);
  [v2 validateClass:@"SBFluidSwitcherViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_toggleFloatingAppVisibility", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"appLayouts", "@", 0);
  [v2 validateClass:@"SBWorkspace"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBWorkspace", @"mainWorkspace", "@", 0);
  [v2 validateClass:@"SBMainWorkspace"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"requestTransitionWithOptions:builder:validator:", "B", "Q", "@?", "@?", 0);
  [v2 validateClass:@"SBWorkspaceTransitionRequest"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransitionRequest", @"modifyApplicationContext:", "v", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspaceTransitionRequest", @"setSource:", "v", "q", 0);
  [v2 validateClass:@"SBWorkspaceApplicationSceneTransitionContext"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"setEntity:forLayoutRole:", "v", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"setRequestedSpaceConfiguration:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"setRequestedFloatingConfiguration:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"applicationSceneEntityForLayoutRole:", "@", "q", 0);
  [v2 validateClass:@"SBWorkspaceEntity"];
  [v2 validateClass:@"SBEmptyWorkspaceEntity" isKindOfClass:@"SBWorkspaceEntity"];
  [v2 validateClass:@"SBPreviousWorkspaceEntity" isKindOfClass:@"SBWorkspaceEntity"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBWorkspaceEntity", @"entity", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBPreviousWorkspaceEntity", @"entityWithPreviousLayoutRole:", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceEntity", @"applicationSceneEntity", "@", 0);
  [v2 validateClass:@"SBApplicationController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationController", @"sharedInstance", "@", 0);
  [v2 validateClass:@"SBApplicationSceneEntity"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneEntity", @"application", "@", 0);
  [v2 validateClass:@"SBApplication"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"isMedusaCapable", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"info", "@", 0);
  [v2 validateClass:@"SBDeviceApplicationSceneEntity"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneEntity", @"initWithApplicationForMainDisplay:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneEntity", @"initWithApplicationSceneHandle:", "@", "@", 0);
  [v2 validateClass:@"FBSApplicationInfo"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSApplicationInfo", @"supportsMultiwindow", "B", 0);
  [v2 validateClass:@"SBLayoutElement"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutElement", @"layoutAttributes", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutElement", @"workspaceEntity", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"mainDisplaySceneManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_activeDisplaySwitcherController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"layoutState", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"isFloatingSwitcherVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
  [v2 validateClass:@"SBIconView" hasInstanceVariable:@"_iconLocation" withType:"NSString"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconManager:launchIconForIconView:withActions:modifierFlags:", "v", "@", "@", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"applicationBundleID", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"environment", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"type", "q", 0);

  return 1;
}

uint64_t __55__AXSpringBoardServerSideAppManager__performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AXSpringBoardServerHelperSideAppManager"];
  [v2 setOverrideProcessName:@"AXSpringBoardServerHelperSideAppManager"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

uint64_t __55__AXSpringBoardServerSideAppManager__performValidation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"AXSB_SBIconControllerSafeCategory" canInteractWithTargetClass:1];
}

- (id)allowedMedusaGestures
{
  id v3 = [MEMORY[0x263EFF980] array];
  if (AXDeviceSupportsSideApp())
  {
    v4 = [NSClassFromString(&cfstr_Gaxspringboard.isa) safeValueForKey:@"sharedInstance"];
    objc_super v5 = v4;
    if (v4
      && ([v4 safeValueForKey:@"shouldAllowMedusaGestures"],
          v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 BOOLValue],
          v6,
          (v7 & 1) == 0))
    {
      id v19 = v3;
    }
    else
    {
      v8 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
      objc_opt_class();
      v9 = [v8 safeValueForKey:@"_contentViewController"];
      char v10 = __UIAccessibilityCastAsClass();

      v11 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"_activeDisplaySwitcherController"];
      uint64_t v12 = [v11 safeValueForKey:@"layoutState"];

      char v13 = [v12 safeBoolForKey:@"isFloatingSwitcherVisible"];
      uint64_t v14 = [v10 view];
      uint64_t v15 = [v14 window];
      char v16 = [v15 isHidden];

      if ((v16 & 1) == 0 && (v13 & 1) == 0) {
        [(AXSpringBoardServerSideAppManager *)self _addFloatingApplicationGesturesIfAllowed:v3];
      }
      if ([(AXSpringBoardServerSideAppManager *)self _hasPinnedApp]) {
        [(AXSpringBoardServerSideAppManager *)self _addResizeGestureRecognizerGesturesIfAllowed:v3];
      }
      id v17 = v3;
    }
  }
  else
  {
    id v18 = v3;
  }

  return v3;
}

- (id)appForLayoutRole:(int64_t)a3
{
  objc_super v5 = [(AXSpringBoardServerSideAppManager *)self sceneLayoutState];
  v6 = [(AXSpringBoardServerSideAppManager *)self _appForLayoutRole:a3 layoutState:v5];

  return v6;
}

- (id)_appForLayoutRole:(int64_t)a3 layoutState:(id)a4
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v6 = a4;
  AXPerformSafeBlock();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __67__AXSpringBoardServerSideAppManager__appForLayoutRole_layoutState___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) elementWithRole:*(void *)(a1 + 48)];
  id v2 = [v7 safeValueForKey:@"workspaceEntity"];
  id v3 = [v2 safeValueForKey:@"applicationSceneEntity"];
  uint64_t v4 = [v3 safeValueForKey:@"application"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_enumerateAppsAndLayoutRoles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSpringBoardServerSideAppManager *)self sceneLayoutState];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AXSpringBoardServerSideAppManager__enumerateAppsAndLayoutRoles___block_invoke;
  aBlock[3] = &unk_2647F1258;
  aBlock[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v8[2](v8, 1);
  v8[2](v8, 2);
  if ([(AXSpringBoardServerSideAppManager *)self _currentFloatingConfiguration] != 3
    && [(AXSpringBoardServerSideAppManager *)self _currentFloatingConfiguration] != 4)
  {
    v8[2](v8, 3);
  }
}

uint64_t __66__AXSpringBoardServerSideAppManager__enumerateAppsAndLayoutRoles___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _appForLayoutRole:a2 layoutState:*(void *)(a1 + 40)];
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)isDisplayingApp
{
  objc_opt_class();
  id v3 = [(AXSpringBoardServerSideAppManager *)self _mainDisplaySceneManager];
  id v4 = [v3 safeValueForKey:@"externalForegroundApplicationSceneHandles"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  BOOL v6 = [v5 count] != 0;
  return v6;
}

- (id)medusaApps
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__AXSpringBoardServerSideAppManager_medusaApps__block_invoke;
  v6[3] = &unk_2647F1280;
  id v4 = v3;
  id v7 = v4;
  [(AXSpringBoardServerSideAppManager *)self _enumerateAppsAndLayoutRoles:v6];

  return v4;
}

void __47__AXSpringBoardServerSideAppManager_medusaApps__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [a2 safeValueForKey:@"displayName"];
  if (v6)
  {
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)medusaAppBundleIdsToLayoutRoles
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__AXSpringBoardServerSideAppManager_medusaAppBundleIdsToLayoutRoles__block_invoke;
  v6[3] = &unk_2647F1280;
  id v4 = v3;
  id v7 = v4;
  [(AXSpringBoardServerSideAppManager *)self _enumerateAppsAndLayoutRoles:v6];

  return v4;
}

void __68__AXSpringBoardServerSideAppManager_medusaAppBundleIdsToLayoutRoles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [a2 safeValueForKey:@"bundleIdentifier"];
  if (v6)
  {
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (BOOL)performMedusaGesture:(unint64_t)a3
{
  uint64_t v5 = [(AXSpringBoardServerSideAppManager *)self allowedMedusaGestures];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    if (a3 >= 0x10)
    {
      if (a3 == 16) {
        [(AXSpringBoardServerSideAppManager *)self _performSwipeOnFloatingAppSwitcher:16];
      }
    }
    else
    {
      [(AXSpringBoardServerSideAppManager *)self _performMedusaGesture:a3];
    }
  }
  else
  {
    _AXLogWithFacility();
  }

  return v7;
}

- (BOOL)hasMultipleApps
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F3F440] sharedInstance];
  id v3 = [v2 currentLayout];

  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(v3, "elements", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) bundleIdentifier];
        if ([v10 length]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  BOOL v11 = (unint64_t)[v4 count] > 1;
  return v11;
}

- (BOOL)canActivateMedusaForDock
{
  id v2 = [(AXSpringBoardServerSideAppManager *)self sceneLayoutState];
  BOOL v3 = [v2 safeIntegerForKey:@"unlockedEnvironmentMode"] == 3;

  return v3;
}

- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServerSideAppManager *)self canLaunchAsFloatingApplicationForIconView:v4])
  {
    uint64_t v5 = [(AXSpringBoardServerSideAppManager *)self sceneLayoutState];
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    long long v15 = __Block_byref_object_copy__3;
    long long v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    uint64_t v10 = MEMORY[0x263EF8330];
    id v11 = v5;
    AXPerformSafeBlock();
    id v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
    char v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", @"layoutAttributes", v10, 3221225472, __77__AXSpringBoardServerSideAppManager_canLaunchAsPinnedApplicationForIconView___block_invoke, &unk_2647F06D8);

    BOOL v8 = v7 & 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __77__AXSpringBoardServerSideAppManager_canLaunchAsPinnedApplicationForIconView___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) elementWithRole:1];
  return MEMORY[0x270F9A758]();
}

- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 safeValueForKey:@"icon"];
  id v6 = [v5 safeValueForKey:@"application"];
  char v7 = [v6 safeValueForKey:@"info"];
  if ([(AXSpringBoardServerSideAppManager *)self canActivateMedusaForDock]
    && [(AXSpringBoardServerSideAppManager *)self _isDockIconView:v4])
  {
    int v8 = [v7 safeBoolForKey:@"supportsMultiwindow"];
    uint64_t v9 = [(AXSpringBoardServerSideAppManager *)self _bundleIdentifierForIconView:v4];
    uint64_t v10 = [(AXSpringBoardServerSideAppManager *)self _appWithIdentifier:v9];
    int v11 = [v10 safeBoolForKey:@"isMedusaCapable"] | v8;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_endDockIconActivationModeAfterTimeout
{
  if (![(AXSpringBoardServerSideAppManager *)self dockIconActivationMode]) {
    _AXAssert();
  }
  if ([(AXSpringBoardServerSideAppManager *)self dockIconActivationMode] == 3)
  {
    BOOL v3 = [(AXSpringBoardServerSideAppManager *)self delegate];
    [v3 didFailToFloatAppForSideAppManager:self];
LABEL_8:

    goto LABEL_9;
  }
  if ([(AXSpringBoardServerSideAppManager *)self dockIconActivationMode] == 1
    || [(AXSpringBoardServerSideAppManager *)self dockIconActivationMode] == 2)
  {
    BOOL v3 = [(AXSpringBoardServerSideAppManager *)self delegate];
    [v3 didFailToPinAppForSideAppManager:self];
    goto LABEL_8;
  }
LABEL_9:
  [(AXSpringBoardServerSideAppManager *)self setDockIconActivationMode:0];
}

- (id)_applicationController
{
  id v2 = (void *)_applicationController_AX_SBApplicationController;
  if (!_applicationController_AX_SBApplicationController)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstance"];
    id v4 = (void *)_applicationController_AX_SBApplicationController;
    _applicationController_AX_SBApplicationController = v3;

    id v2 = (void *)_applicationController_AX_SBApplicationController;
  }
  return v2;
}

- (BOOL)_hasFloatingApp
{
  return (unint64_t)([(AXSpringBoardServerSideAppManager *)self _currentFloatingConfiguration]- 1) < 2;
}

- (BOOL)_hasPinnedApp
{
  int64_t v2 = [(AXSpringBoardServerSideAppManager *)self _currentSpaceConfiguration];
  return v2 == 4 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_addFloatingApplicationGesturesIfAllowed:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  id v5 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  char v6 = objc_msgSend(v5, "safeUnsignedIntegerForKey:", @"layoutAttributes", v13, 3221225472, __78__AXSpringBoardServerSideAppManager__addFloatingApplicationGesturesIfAllowed___block_invoke, &unk_2647F06D8, self, &v14);
  int64_t v7 = [(AXSpringBoardServerSideAppManager *)self _currentFloatingConfiguration];
  if ((unint64_t)(v7 - 3) < 2)
  {
    uint64_t v9 = &unk_26DB201D8;
LABEL_11:
    [v4 addObject:v9];
    goto LABEL_12;
  }
  if (v7 == 1)
  {
    [v4 addObject:&unk_26DB20130];
    if (v6)
    {
      int v8 = &unk_26DB20148;
      goto LABEL_9;
    }
LABEL_10:
    [v4 addObject:&unk_26DB20160];
    [v4 addObject:&unk_26DB20178];
    uint64_t v9 = &unk_26DB20190;
    goto LABEL_11;
  }
  if (v7 == 2)
  {
    [v4 addObject:&unk_26DB201A8];
    if (v6)
    {
      int v8 = &unk_26DB201C0;
LABEL_9:
      [v4 addObject:v8];
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v10 = [(AXSpringBoardServerSideAppManager *)self _firstFloatingAppLayout];
  if (v10)
  {
    int v11 = (void *)v10;
    char v12 = [v4 containsObject:&unk_26DB201D8];

    if ((v12 & 1) == 0) {
      [v4 addObject:&unk_26DB201D8];
    }
  }
}

void __78__AXSpringBoardServerSideAppManager__addFloatingApplicationGesturesIfAllowed___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sceneLayoutState];
  uint64_t v2 = [v5 elementWithRole:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_addResizeGestureRecognizerGesturesIfAllowed:(id)a3
{
  id v9 = a3;
  int64_t v4 = [(AXSpringBoardServerSideAppManager *)self _currentSpaceConfiguration];
  uint64_t v5 = [(id)*MEMORY[0x263F83300] activeInterfaceOrientation];
  if (v4 == 3 || (unint64_t)(v5 - 3) > 1)
  {
    BOOL v7 = v4 == 3 && (unint64_t)(v5 - 5) < 0xFFFFFFFFFFFFFFFELL;
    if (v4 == 4 || v7) {
      goto LABEL_14;
    }
LABEL_13:
    [v9 addObject:&unk_26DB20208];
    [v9 addObject:&unk_26DB20220];
    int v8 = v9;
    if (v4 == 2) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  [v9 addObject:&unk_26DB201F0];
  if (v4 != 4) {
    goto LABEL_13;
  }
LABEL_14:
  [v9 addObject:&unk_26DB20238];
  [v9 addObject:&unk_26DB20250];
  int v8 = v9;
LABEL_15:
  [v8 addObject:&unk_26DB20268];
  [v9 addObject:&unk_26DB20280];
  [v9 addObject:&unk_26DB20298];
  [v9 addObject:&unk_26DB202B0];
}

- (void)_performMedusaGesture:(unint64_t)a3
{
  [(AXSpringBoardServerSideAppManager *)self _currentSpaceConfiguration];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__3;
  char v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  if (*((unsigned char *)v5 + 24)) {
    [(AXSpringBoardServerSideAppManager *)self _requestFloatingAppSwitcherVisible];
  }
  else {
    [(AXSpringBoardServerSideAppManager *)self _requestTransactionWithPrimaryEntity:v21[5] sideEntity:v15[5] floatingEntity:v9[5] spaceConfiguration:v31[3] floatingConfiguration:v27[3]];
  }
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 88);
  switch(*(void *)(a1 + 88))
  {
    case 0:
      uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v5 = 3;
      goto LABEL_18;
    case 1:
    case 4:
      uint64_t v3 = *(void *)(a1 + 72);
      goto LABEL_12;
    case 2:
    case 3:
      goto LABEL_16;
    case 5:
      uint64_t v6 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v7 = [v6 entityWithPreviousLayoutRole:3];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v11 = [v10 entityWithPreviousLayoutRole:1];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      uint64_t v14 = [*(id *)(a1 + 32) _sbEmptyEntity];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v5 = *(void *)(a1 + 96);
      uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v5 != 1) {
        goto LABEL_18;
      }
      goto LABEL_13;
    case 6:
      id v17 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v18 = [v17 entityWithPreviousLayoutRole:1];
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      v21 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v22 = [v21 entityWithPreviousLayoutRole:3];
      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      uint64_t v25 = [*(id *)(a1 + 32) _sbEmptyEntity];
      uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
      v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      uint64_t v5 = *(void *)(a1 + 96);
      uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v5 != 1) {
        goto LABEL_18;
      }
      goto LABEL_17;
    case 7:
      uint64_t v28 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v29 = [v28 entityWithPreviousLayoutRole:2];
      uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;

      uint64_t v32 = [*(id *)(a1 + 32) _sbEmptyEntity];
      uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
      v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;

      v35 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      v36 = v35;
      uint64_t v37 = 1;
      uint64_t v38 = 1;
      goto LABEL_10;
    case 8:
      v39 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v40 = [v39 entityWithPreviousLayoutRole:1];
      uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 8);
      v42 = *(void **)(v41 + 40);
      *(void *)(v41 + 40) = v40;

      uint64_t v43 = [*(id *)(a1 + 32) _sbEmptyEntity];
      uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
      v45 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = v43;

      v35 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      v36 = v35;
      uint64_t v37 = 2;
      uint64_t v38 = 2;
LABEL_10:
      uint64_t v46 = [v35 entityWithPreviousLayoutRole:v38];
      uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
      v48 = *(void **)(v47 + 40);
      *(void *)(v47 + 40) = v46;

      uint64_t v49 = *(void *)(a1 + 64);
      goto LABEL_20;
    case 9:
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v3 = *(void *)(a1 + 64);
LABEL_12:
      uint64_t v4 = *(void *)(v3 + 8);
LABEL_13:
      uint64_t v5 = 2;
      goto LABEL_18;
    case 0xALL:
      uint64_t v5 = 1;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
      goto LABEL_18;
    case 0xBLL:
      v50 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v51 = [v50 entityWithPreviousLayoutRole:2];
      uint64_t v52 = *(void *)(*(void *)(a1 + 40) + 8);
      v53 = *(void **)(v52 + 40);
      *(void *)(v52 + 40) = v51;

      uint64_t v54 = [*(id *)(a1 + 32) _sbEmptyEntity];
      uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8);
      v56 = *(void **)(v55 + 40);
      *(void *)(v55 + 40) = v54;

      uint64_t v57 = [*(id *)(a1 + 32) _sbPreviousEntity];
      uint64_t v58 = *(void *)(*(void *)(a1 + 56) + 8);
      v59 = *(void **)(v58 + 40);
      *(void *)(v58 + 40) = v57;

LABEL_16:
      uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
LABEL_17:
      uint64_t v5 = 4;
LABEL_18:
      *(void *)(v4 + 24) = v5;
      break;
    case 0xCLL:
      v60 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
      uint64_t v37 = 1;
      uint64_t v61 = [v60 entityWithPreviousLayoutRole:1];
      uint64_t v62 = *(void *)(*(void *)(a1 + 40) + 8);
      v63 = *(void **)(v62 + 40);
      *(void *)(v62 + 40) = v61;

      uint64_t v64 = [*(id *)(a1 + 32) _sbEmptyEntity];
      uint64_t v65 = *(void *)(*(void *)(a1 + 48) + 8);
      v66 = *(void **)(v65 + 40);
      *(void *)(v65 + 40) = v64;

      uint64_t v67 = [*(id *)(a1 + 32) _sbPreviousEntity];
      uint64_t v68 = *(void *)(*(void *)(a1 + 56) + 8);
      v69 = *(void **)(v68 + 40);
      *(void *)(v68 + 40) = v67;

      uint64_t v49 = *(void *)(a1 + 72);
LABEL_20:
      *(void *)(*(void *)(v49 + 8) + 24) = v37;
      break;
    case 0xDLL:
    case 0xELL:
      AXPerformSafeBlock();
      break;
    case 0xFLL:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      break;
    case 0x10:
      v70 = AXLogSpringboardServer();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_cold_1(v1, v70);
      }

      break;
    default:
      return;
  }
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _floatingAppRootViewController];
  [v1 _toggleFloatingAppVisibility];
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _floatingAppRootViewController];
  [v1 _toggleFloatingAppVisibility];
}

- (void)_performSwipeOnFloatingAppSwitcher:(unint64_t)a3
{
  uint64_t v4 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
  uint64_t v5 = [v4 safeArrayForKey:@"_appLayouts"];
  uint64_t v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_597);

  uint64_t v7 = [v4 safeValueForKeyPath:@"_activeDisplaySwitcherController._currentFloatingAppLayout"];
  unint64_t v8 = [v6 indexOfObject:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && a3 == 16)
  {
    unint64_t v10 = v8;
    if (v8 >= [v6 count] - 1)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = [v6 objectAtIndex:++v10];

        uint64_t v11 = v12;
      }
      while (v10 < [v6 count] - 1);
    }
    id v14 = v4;
    id v13 = v12;
    AXPerformSafeBlock();
  }
}

BOOL __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke(uint64_t a1, void *a2)
{
  return [a2 safeIntegerForKey:@"environment"] == 2;
}

void __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _sbWorkspaceMainWorkspace];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke_3;
  unint64_t v8 = &unk_2647F12F0;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  uint64_t v4 = _Block_copy(&v5);
  objc_msgSend(v2, "requestTransitionWithOptions:builder:validator:", 0, v4, 0, v5, v6, v7, v8, v9);
}

void __72__AXSpringBoardServerSideAppManager__performSwipeOnFloatingAppSwitcher___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sbSwitcherTransitionRequestClass];
  id v6 = [v5 requestForActivatingAppLayout:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) _configureRequest:v4 forSwitcherTransitionRequest:v6 withEventLabel:*(void *)(a1 + 56)];
  [v4 setSource:18];
}

- (void)_requestTransactionWithPrimaryEntity:(id)a3 sideEntity:(id)a4 floatingEntity:(id)a5 spaceConfiguration:(int64_t)a6 floatingConfiguration:(int64_t)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    id v11 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
    if (v12) {
      goto LABEL_4;
    }
LABEL_7:
    id v12 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
    goto LABEL_4;
  }
  id v10 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
  if (!v11) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v12) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v16 = v10;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  AXPerformSafeBlock();
}

void __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _sbWorkspaceMainWorkspace];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_2;
  aBlock[3] = &unk_2647F1368;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 64);
  uint64_t v3 = _Block_copy(aBlock);
  [v2 requestTransitionWithOptions:0 builder:v3 validator:0];
}

void __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_3;
  v5[3] = &unk_2647F1340;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v4 = a2;
  [v4 modifyApplicationContext:v5];
  [v4 setSource:18];
}

void __141__AXSpringBoardServerSideAppManager__requestTransactionWithPrimaryEntity_sideEntity_floatingEntity_spaceConfiguration_floatingConfiguration___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setEntity:v3 forLayoutRole:1];
  [v4 setEntity:a1[5] forLayoutRole:2];
  [v4 setEntity:a1[6] forLayoutRole:3];
  [v4 setRequestedSpaceConfiguration:a1[7]];
  [v4 setRequestedFloatingConfiguration:a1[8]];
}

- (void)_requestFloatingAppSwitcherVisible
{
}

void __71__AXSpringBoardServerSideAppManager__requestFloatingAppSwitcherVisible__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _sbWorkspaceMainWorkspace];
  [v1 requestTransitionWithOptions:0 builder:&__block_literal_global_607 validator:0];
}

void __71__AXSpringBoardServerSideAppManager__requestFloatingAppSwitcherVisible__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 modifyApplicationContext:&__block_literal_global_609];
  [v2 setSource:18];
}

uint64_t __71__AXSpringBoardServerSideAppManager__requestFloatingAppSwitcherVisible__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setRequestedFloatingSwitcherVisible:1];
}

- (void)launchApplication:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Sbapplication.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = 0;
    long long v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__3;
    id v12 = __Block_byref_object_dispose__3;
    id v13 = 0;
    uint64_t v6 = MEMORY[0x263EF8330];
    id v7 = v4;
    AXPerformSafeBlock();
    id v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v5, 0, 0, 1, 0, v6, 3221225472, __55__AXSpringBoardServerSideAppManager_launchApplication___block_invoke, &unk_2647F06D8);
  }
}

uint64_t __55__AXSpringBoardServerSideAppManager_launchApplication___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(NSClassFromString(&cfstr_Sbdeviceapplic_2.isa)) initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (void)launchApplicationWithFullConfiguration:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Sbapplication.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__3;
    id v14 = __Block_byref_object_dispose__3;
    id v15 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    id v9 = v4;
    AXPerformSafeBlock();
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    uint64_t v6 = [(AXSpringBoardServerSideAppManager *)self _sbEmptyEntity];
    id v7 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
    [(AXSpringBoardServerSideAppManager *)self _requestTransactionWithPrimaryEntity:v5 sideEntity:v6 floatingEntity:v7 spaceConfiguration:1 floatingConfiguration:3];
  }
}

uint64_t __76__AXSpringBoardServerSideAppManager_launchApplicationWithFullConfiguration___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(NSClassFromString(&cfstr_Sbdeviceapplic_2.isa)) initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  NSClassFromString(&cfstr_Sbapplication.isa);
  if (objc_opt_isKindOfClass())
  {
    int64_t v7 = [(AXSpringBoardServerSideAppManager *)self _currentSpaceConfiguration];
    uint64_t v8 = v7;
    if (v7 != 4 && v7 != 2)
    {
      if (v4) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 4;
      }
    }
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    v35 = __Block_byref_object_dispose__3;
    id v36 = 0;
    AXPerformSafeBlock();
    id v9 = (id)v32[5];
    _Block_object_dispose(&v31, 8);

    uint64_t v10 = [(AXSpringBoardServerSideAppManager *)self _mainDisplaySceneManager];
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    v35 = __Block_byref_object_dispose__3;
    id v36 = 0;
    id v29 = v10;
    id v30 = v6;
    AXPerformSafeBlock();
    id v11 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    v35 = __Block_byref_object_dispose__3;
    id v36 = 0;
    id v26 = v30;
    id v27 = v11;
    id v28 = v29;
    AXPerformSafeBlock();
    id v12 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    v35 = __Block_byref_object_dispose__3;
    id v36 = 0;
    id v13 = v28;
    id v14 = v12;
    AXPerformSafeBlock();
    id v25 = v6;
    id v15 = v9;
    uint64_t v16 = v8;
    id v17 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    v35 = __Block_byref_object_dispose__3;
    id v36 = 0;
    id v18 = v17;
    AXPerformSafeBlock();
    id v19 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
    if (v4) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v15;
    }
    if (v4) {
      v21 = v15;
    }
    else {
      v21 = v19;
    }
    id v22 = v21;
    id v23 = v20;
    v24 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
    [(AXSpringBoardServerSideAppManager *)self _requestTransactionWithPrimaryEntity:v23 sideEntity:v22 floatingEntity:v24 spaceConfiguration:v16 floatingConfiguration:0];

    id v6 = v25;
  }
}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _sbPreviousWorkspaceEntityClass];
  uint64_t v2 = [v5 entityWithPreviousLayoutRole:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) newSceneIdentityForApplication:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

void __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_3(uint64_t a1)
{
  Class v2 = NSClassFromString(&cfstr_Sbapplications.isa);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) safeValueForKey:@"displayIdentity"];
  uint64_t v5 = [(objc_class *)v2 defaultRequestForApplication:v3 sceneIdentity:v4 displayIdentity:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  int64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) fetchOrCreateApplicationSceneHandleForRequest:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

uint64_t __75__AXSpringBoardServerSideAppManager_launchPinnedApplication_onLeadingSide___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(NSClassFromString(&cfstr_Sbdeviceapplic_2.isa)) initWithApplicationSceneHandle:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (void)launchFloatingApplication:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Sbapplication.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
    uint64_t v6 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousEntity];
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__3;
    id v14 = __Block_byref_object_dispose__3;
    id v15 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    id v9 = v4;
    AXPerformSafeBlock();
    id v7 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    -[AXSpringBoardServerSideAppManager _requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:](self, "_requestTransactionWithPrimaryEntity:sideEntity:floatingEntity:spaceConfiguration:floatingConfiguration:", v5, v6, v7, 0, 2, v8, 3221225472, __63__AXSpringBoardServerSideAppManager_launchFloatingApplication___block_invoke, &unk_2647F06D8);
  }
}

uint64_t __63__AXSpringBoardServerSideAppManager_launchFloatingApplication___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(NSClassFromString(&cfstr_Sbdeviceapplic_2.isa)) initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (id)_activeApplicationBundleIdentifiers
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  AXPerformSafeBlock();
  id v2 = v4;

  return v2;
}

uint64_t __72__AXSpringBoardServerSideAppManager__activeApplicationBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t result = [&unk_26DB20388 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(&unk_26DB20388);
        }
        uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * v5) integerValue];
        id v7 = [*(id *)(a1 + 32) appForLayoutRole:v6];
        uint64_t v8 = [v7 safeStringForKey:@"bundleIdentifier"];

        if (v6 == 3)
        {
          id v9 = [*(id *)(a1 + 32) sceneLayoutState];
          if ((unint64_t)([v9 safeIntegerForKey:@"floatingConfiguration"] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {

            uint64_t v8 = 0;
          }
        }
        [*(id *)(a1 + 40) axSafelyAddObject:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [&unk_26DB20388 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (id)_sbPreviousEntity
{
  id v2 = [(AXSpringBoardServerSideAppManager *)self _sbPreviousWorkspaceEntityClass];
  uint64_t v3 = [v2 safeValueForKey:@"entity"];

  return v3;
}

- (id)_sbEmptyEntity
{
  if (_sbEmptyEntity_onceToken != -1) {
    dispatch_once(&_sbEmptyEntity_onceToken, &__block_literal_global_620);
  }
  id v2 = (void *)_sbEmptyEntity__sbPreviousWorkspaceClass;
  return (id)[v2 safeValueForKey:@"entity"];
}

Class __51__AXSpringBoardServerSideAppManager__sbEmptyEntity__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbemptyworkspa.isa);
  _sbEmptyEntity__sbPreviousWorkspaceClass = (uint64_t)result;
  return result;
}

- (id)_sbPreviousWorkspaceEntityClass
{
  if (_sbPreviousWorkspaceEntityClass_onceToken != -1) {
    dispatch_once(&_sbPreviousWorkspaceEntityClass_onceToken, &__block_literal_global_622);
  }
  id v2 = (void *)_sbPreviousWorkspaceEntityClass__sbPreviousWorkspaceClass;
  return v2;
}

Class __68__AXSpringBoardServerSideAppManager__sbPreviousWorkspaceEntityClass__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbpreviouswork.isa);
  _sbPreviousWorkspaceEntityClass__sbPreviousWorkspaceClass = (uint64_t)result;
  return result;
}

- (id)_sbSwitcherTransitionRequestClass
{
  if (_sbSwitcherTransitionRequestClass_onceToken != -1) {
    dispatch_once(&_sbSwitcherTransitionRequestClass_onceToken, &__block_literal_global_624);
  }
  id v2 = (void *)_sbSwitcherTransitionRequestClass__sbSwitcherTransitionRequestClass;
  return v2;
}

Class __70__AXSpringBoardServerSideAppManager__sbSwitcherTransitionRequestClass__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbswitchertran.isa);
  _sbSwitcherTransitionRequestClass__sbSwitcherTransitionRequestClass = (uint64_t)result;
  return result;
}

- (id)_sbWorkspaceMainWorkspace
{
  if (_sbWorkspaceMainWorkspace_onceToken != -1) {
    dispatch_once(&_sbWorkspaceMainWorkspace_onceToken, &__block_literal_global_626);
  }
  id v2 = (void *)_sbWorkspaceMainWorkspace__sbWorkSpaceClass;
  return (id)[v2 safeValueForKey:@"mainWorkspace"];
}

Class __62__AXSpringBoardServerSideAppManager__sbWorkspaceMainWorkspace__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbworkspace.isa);
  _sbWorkspaceMainWorkspace__sbWorkSpaceClass = (uint64_t)result;
  return result;
}

- (int64_t)_currentFloatingConfiguration
{
  id v2 = [(AXSpringBoardServerSideAppManager *)self sceneLayoutState];
  int64_t v3 = [v2 safeIntegerForKey:@"floatingConfiguration"];

  return v3;
}

- (int64_t)_currentSpaceConfiguration
{
  id v2 = [(AXSpringBoardServerSideAppManager *)self sceneLayoutState];
  int64_t v3 = [v2 safeIntegerForKey:@"spaceConfiguration"];

  return v3;
}

- (id)sceneLayoutState
{
  id v2 = [(AXSpringBoardServerSideAppManager *)self _mainDisplaySceneManager];
  int64_t v3 = [v2 safeValueForKey:@"currentLayoutState"];

  return v3;
}

- (id)_floatingAppRootViewController
{
  id v2 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
  int64_t v3 = [v2 safeValueForKey:@"_contentViewController"];

  return v3;
}

- (id)_firstFloatingAppLayout
{
  id v2 = [(AXSpringBoardServerSideAppManager *)self _floatingAppRootViewController];
  int64_t v3 = [v2 safeArrayForKey:@"appLayouts"];
  uint64_t v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_628);

  uint64_t v5 = [v4 firstObject];

  return v5;
}

BOOL __60__AXSpringBoardServerSideAppManager__firstFloatingAppLayout__block_invoke(uint64_t a1, void *a2)
{
  return [a2 safeIntegerForKey:@"environment"] == 2;
}

- (id)_mainDisplaySceneManager
{
  id v2 = objc_opt_class();
  return (id)[v2 _mainDisplaySceneManager];
}

+ (id)_mainDisplaySceneManager
{
  if (AXSpringBoardIsReadyToBeProbed())
  {
    if (_mainDisplaySceneManager_onceToken != -1) {
      dispatch_once(&_mainDisplaySceneManager_onceToken, &__block_literal_global_630);
    }
    id v2 = [(id)_mainDisplaySceneManager__axSBSceneManagerCoordinatorClass safeValueForKey:@"mainDisplaySceneManager"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

Class __61__AXSpringBoardServerSideAppManager__mainDisplaySceneManager__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbscenemanager_0.isa);
  _mainDisplaySceneManager__axSBSceneManagerCoordinatorClass = (uint64_t)result;
  return result;
}

- (AXSpringBoardServerSideAppManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSpringBoardServerSideAppManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __59__AXSpringBoardServerSideAppManager__performMedusaGesture___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226EBC000, a2, OS_LOG_TYPE_ERROR, "Attempting to perform invalid gesture: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)_isDockIconView:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationDock(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerSideAppManager.m", 20, @"%s", dlerror());

  __break(1u);
}

- (void)_isDockIconView:.cold.2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationFloatingDock(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerSideAppManager.m", 21, @"%s", dlerror());

  __break(1u);
}

@end