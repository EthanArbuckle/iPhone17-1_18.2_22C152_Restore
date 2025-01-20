@interface DBInstrumentCluster
+ (id)_directionStringForDirection:(int64_t)a3;
- (BOOL)isGaugeCluster;
- (BSInvalidatable)dispatchingFocusAssertion;
- (BSInvalidatable)dispatchingSystemAssertion;
- (CARDisplayInfo)displayInfo;
- (CARScreenInfo)screenInfo;
- (CGRect)sceneFrameForApplication:(id)a3;
- (CGRect)sceneFrameForApplication:(id)a3 proxyApplication:(id)a4;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBFocusController)focusController;
- (DBInstrumentCluster)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4;
- (DBInstrumentClusterRootViewController)viewController;
- (DBInstrumentClusterThemeDelegate)clusterThemeDelegate;
- (DBInstrumentClusterWorkspaceOwner)workspaceOwner;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayIdentity)displayIdentity;
- (NSMutableDictionary)identifierToAppScenesMap;
- (NSMutableDictionary)identifierToApplicationMap;
- (NSMutableDictionary)identifierToForegroundAppScenesMap;
- (UIEdgeInsets)_rootViewControllerInsets;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3 proxyApplication:(id)a4;
- (UIScreen)screen;
- (UIView)cornerRadiusView;
- (UIView)interestingView;
- (UIWindow)clusterWindow;
- (UIWindow)cornerRadiusWindow;
- (UIWindow)interestingWindow;
- (UIWindowScene)windowScene;
- (double)currentCornerRadius;
- (id)_clusterScene;
- (id)_foregroundActiveScene;
- (id)applicationForScene:(id)a3;
- (id)focusWindow;
- (id)sceneForApplication:(id)a3;
- (id)sceneIdentifierForApplication:(id)a3;
- (id)systemGestureWindow;
- (int64_t)sceneInterfaceStyleForApplication:(id)a3 proxyApplication:(id)a4;
- (void)_drawCorners;
- (void)_updateWallpaper;
- (void)acquireFocus;
- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6;
- (void)clusterThemeService:(id)a3 didSetThemeData:(id)a4 completion:(id)a5;
- (void)environmentConfiguration:(double)a3 viewAreaDidChangeFromViewAreaFrame:(double)a4 safeAreaInsets:(double)a5 toViewAreaFrame:(uint64_t)a6 safeAreaInsets:(void *)a7 duration:(uint64_t)a8 transitionControlType:(uint64_t)a9;
- (void)environmentConfiguration:(id)a3 appearanceStyleDidChange:(int64_t)a4;
- (void)environmentConfiguration:(id)a3 mapsAppearanceStyleDidChange:(int64_t)a4;
- (void)environmentConfiguration:(id)a3 nightModeDidChange:(BOOL)a4;
- (void)environmentConfiguration:(id)a3 receivedShowUIWithURL:(id)a4;
- (void)handleConnect;
- (void)invalidate;
- (void)navigationStateProvider:(id)a3 frontmostIdentifierDidChange:(id)a4;
- (void)navigationStateProvider:(id)a3 navigatingIdentifiersDidChange:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releaseFocus;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)session:(id)a3 receivedUnhandledRemoteEvent:(id)a4 withPayload:(id)a5;
- (void)setClusterThemeDelegate:(id)a3;
- (void)setClusterWindow:(id)a3;
- (void)setCornerRadiusView:(id)a3;
- (void)setCornerRadiusWindow:(id)a3;
- (void)setCurrentCornerRadius:(double)a3;
- (void)setDispatchingFocusAssertion:(id)a3;
- (void)setDispatchingSystemAssertion:(id)a3;
- (void)setDisplayInfo:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setFocusController:(id)a3;
- (void)setGaugeCluster:(BOOL)a3;
- (void)setIdentifierToAppScenesMap:(id)a3;
- (void)setIdentifierToApplicationMap:(id)a3;
- (void)setIdentifierToForegroundAppScenesMap:(id)a3;
- (void)setInterestingView:(id)a3;
- (void)setInterestingWindow:(id)a3;
- (void)setScreen:(id)a3;
- (void)setScreenInfo:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)setWorkspaceOwner:(id)a3;
- (void)setupFocusRulesForDisplayWithConfiguration:(id)a3;
- (void)setupSystemRulesForDisplayWithConfiguration:(id)a3;
- (void)stopUIReceivedForEnvironmentConfiguration:(id)a3;
@end

@implementation DBInstrumentCluster

- (DBInstrumentCluster)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DBInstrumentCluster;
  v9 = [(DBInstrumentCluster *)&v33 init];
  if (v9)
  {
    v10 = [v8 displayConfiguration];
    objc_storeStrong((id *)&v9->_environmentConfiguration, a4);
    v11 = [(DBEnvironmentConfiguration *)v9->_environmentConfiguration navigationStateProvider];
    [v11 addObserver:v9];
    uint64_t v12 = [(DBEnvironmentConfiguration *)v9->_environmentConfiguration screen];
    screen = v9->_screen;
    v9->_screen = (UIScreen *)v12;

    v14 = [v8 session];
    v15 = [v14 configuration];
    v16 = [v15 screens];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __68__DBInstrumentCluster_initWithWindowScene_environmentConfiguration___block_invoke;
    v31[3] = &unk_2649B3F28;
    id v32 = v10;
    id v17 = v10;
    uint64_t v18 = objc_msgSend(v16, "bs_firstObjectPassingTest:", v31);
    screenInfo = v9->_screenInfo;
    v9->_screenInfo = (CARScreenInfo *)v18;

    v20 = [v8 session];
    v21 = [v20 configuration];
    uint64_t v22 = objc_msgSend(v21, "db_displayInfoForScreenInfo:", v9->_screenInfo);
    displayInfo = v9->_displayInfo;
    v9->_displayInfo = (CARDisplayInfo *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToAppScenesMap = v9->_identifierToAppScenesMap;
    v9->_identifierToAppScenesMap = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToForegroundAppScenesMap = v9->_identifierToForegroundAppScenesMap;
    v9->_identifierToForegroundAppScenesMap = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifierToApplicationMap = v9->_identifierToApplicationMap;
    v9->_identifierToApplicationMap = v28;

    objc_storeStrong((id *)&v9->_windowScene, a3);
  }

  return v9;
}

uint64_t __68__DBInstrumentCluster_initWithWindowScene_environmentConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) hardwareIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)handleConnect
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_FAULT, "Unexpected nil hardware identifier for instrument cluster display configuration: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)setupFocusRulesForDisplayWithConfiguration:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = (void *)MEMORY[0x263F29858];
  id v6 = a3;
  id v7 = [v6 hardwareIdentifier];
  id v8 = [v5 displayWithHardwareIdentifier:v7];
  v9 = [v4 setWithObject:v8];

  v10 = [MEMORY[0x263F29890] defaultFocusPredicate];
  [v10 setDisplays:v9];
  v11 = (void *)MEMORY[0x263F29848];
  uint64_t v12 = [MEMORY[0x263F29850] keyboardFocusTarget];
  v13 = [v11 ruleForDispatchingDiscreteEventsMatchingPredicate:v10 toTarget:v12];

  id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v15 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:64];
  [v14 addObject:v15];

  v16 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:65];
  [v14 addObject:v16];

  id v17 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:66];
  [v14 addObject:v17];

  uint64_t v18 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:67];
  [v14 addObject:v18];

  v19 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:68];
  [v14 addObject:v19];

  v20 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:69];
  [v14 addObject:v20];

  v21 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:562];
  [v14 addObject:v21];

  id v22 = objc_alloc_init(MEMORY[0x263F29890]);
  [v22 setDescriptors:v14];
  [v22 setDisplays:v9];
  v23 = (void *)MEMORY[0x263F29848];
  v24 = [MEMORY[0x263F29850] keyboardFocusTarget];
  v25 = [v23 ruleForDispatchingDiscreteEventsMatchingPredicate:v22 toTarget:v24];

  v26 = NSString;
  v27 = [v6 identity];

  v28 = [v26 stringWithFormat:@"InstrumentCluster-Focus-%@", v27];

  v29 = [MEMORY[0x263F29830] sharedInstance];
  v33[0] = v13;
  v33[1] = v25;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  v31 = [v29 dispatchDiscreteEventsForReason:v28 withRules:v30];
  dispatchingFocusAssertion = self->_dispatchingFocusAssertion;
  self->_dispatchingFocusAssertion = v31;
}

- (void)setupSystemRulesForDisplayWithConfiguration:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = (void *)MEMORY[0x263F29858];
  id v6 = a3;
  id v7 = [v6 hardwareIdentifier];
  id v8 = [v5 displayWithHardwareIdentifier:v7];
  v9 = [v4 setWithObject:v8];

  id v32 = [MEMORY[0x263F29890] defaultSystemPredicate];
  [v32 setDisplays:v9];
  v10 = (void *)MEMORY[0x263F29848];
  v11 = [MEMORY[0x263F29850] systemTarget];
  uint64_t v12 = [v10 ruleForDispatchingDiscreteEventsMatchingPredicate:v32 toTarget:v11];

  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v14 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:548];
  [v13 addObject:v14];

  v15 = [MEMORY[0x263F29860] descriptorWithPage:12 usage:562];
  [v13 addObject:v15];

  v16 = [MEMORY[0x263F29840] descriptorWithEventType:17];
  [v13 addObject:v16];

  id v17 = objc_alloc_init(MEMORY[0x263F29890]);
  [v17 setDescriptors:v13];
  [v17 setDisplays:v9];
  uint64_t v18 = (void *)MEMORY[0x263F29848];
  v19 = [MEMORY[0x263F29850] systemTarget];
  v20 = [v18 ruleForDispatchingDiscreteEventsMatchingPredicate:v17 toTarget:v19];

  v21 = NSString;
  id v22 = [v6 identity];

  v23 = [v21 stringWithFormat:@"InstrumentCluster-System-%@", v22];

  v24 = [MEMORY[0x263F29830] sharedInstance];
  v33[0] = v12;
  v33[1] = v20;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  v26 = [v24 dispatchDiscreteEventsForReason:v23 withRules:v25];
  dispatchingSystemAssertion = self->_dispatchingSystemAssertion;
  self->_dispatchingSystemAssertion = v26;

  v28 = (void *)[objc_alloc(MEMORY[0x263F82788]) initWithTarget:self action:sel__nullGestureHandler_];
  [v28 setEnabled:0];
  v29 = [MEMORY[0x263F83118] sharedInstance];
  v30 = [(DBInstrumentCluster *)self displayConfiguration];
  v31 = [v30 identity];
  [v29 addGestureRecognizer:v28 toDisplayWithIdentity:v31];
}

- (id)_clusterScene
{
  int v2 = [(DBInstrumentCluster *)self environmentConfiguration];
  uint64_t v3 = [v2 displayIdentity];
  uint64_t v4 = [NSString stringWithFormat:@"DBInstrumentCluster-%@", v3];

  uint64_t v5 = [MEMORY[0x263F3F4F0] sharedInstance];
  id v6 = [v5 sceneWithIdentifier:v4];

  return v6;
}

- (void)_drawCorners
{
}

id __35__DBInstrumentCluster__drawCorners__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00250]);
  uint64_t v5 = CGBitmapContextCreate(0, (unint64_t)*(double *)(a1 + 32), (unint64_t)*(double *)(a1 + 32), 8uLL, 0, v4, a2 ^ 1u);
  CGColorSpaceRelease(v4);
  CGContextTranslateCTM(v5, 0.0, *(CGFloat *)(a1 + 32));
  CGContextScaleCTM(v5, 1.0, -1.0);
  id v6 = [MEMORY[0x263F825C8] blackColor];
  CGContextSetFillColorWithColor(v5, (CGColorRef)[v6 CGColor]);

  v15.size.width = *(CGFloat *)(a1 + 32);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.height = v15.size.width;
  CGContextFillRect(v5, v15);
  if (a2) {
    CGBlendMode v7 = kCGBlendModeSourceAtop;
  }
  else {
    CGBlendMode v7 = kCGBlendModeDestinationOut;
  }
  CGContextSetBlendMode(v5, v7);
  id v8 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 32) * 4.0, *(double *)(a1 + 32) * 4.0, *(double *)(a1 + 40));
  if (((a2 ^ 1) & 1) == 0)
  {
    id v9 = [MEMORY[0x263F825C8] whiteColor];
    CGContextSetFillColorWithColor(v5, (CGColorRef)[v9 CGColor]);
  }
  id v10 = v8;
  CGContextAddPath(v5, (CGPathRef)[v10 CGPath]);
  CGContextFillPath(v5);
  Image = CGBitmapContextCreateImage(v5);
  CGContextRelease(v5);
  uint64_t v12 = [MEMORY[0x263F827E8] imageWithCGImage:Image];
  CGImageRelease(Image);

  return v12;
}

uint64_t __35__DBInstrumentCluster__drawCorners__block_invoke_155(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"CARClusterCornerRadius"])
  {
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    [v13 floatValue];
    self->_currentCornerRadius = v14;

    [(DBInstrumentCluster *)self _drawCorners];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DBInstrumentCluster;
    [(DBInstrumentCluster *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (FBSDisplayIdentity)displayIdentity
{
  int v2 = [(DBInstrumentCluster *)self environmentConfiguration];
  uint64_t v3 = [v2 displayIdentity];

  return (FBSDisplayIdentity *)v3;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  int v2 = [(DBInstrumentCluster *)self environmentConfiguration];
  uint64_t v3 = [v2 displayConfiguration];

  return (FBSDisplayConfiguration *)v3;
}

- (id)sceneIdentifierForApplication:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [(DBInstrumentCluster *)self displayIdentity];
  CGBlendMode v7 = [v5 bundleIdentifier];

  id v8 = [v4 stringWithFormat:@"%@:%@", v6, v7];

  return v8;
}

- (id)sceneForApplication:(id)a3
{
  return 0;
}

- (CGRect)sceneFrameForApplication:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)sceneFrameForApplication:(id)a3 proxyApplication:(id)a4
{
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3
{
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3 proxyApplication:(id)a4
{
  double v4 = *MEMORY[0x263F834E8];
  double v5 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v7 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (int64_t)sceneInterfaceStyleForApplication:(id)a3 proxyApplication:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v5 = [(DBEnvironmentConfiguration *)self->_environmentConfiguration vehicle];
  if (!v5)
  {
    double v6 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DBInstrumentCluster sceneInterfaceStyleForApplication:proxyApplication:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t v14 = [v5 appearanceModePreference];
  if (v14 == -1)
  {
    objc_super v15 = [(DBEnvironmentConfiguration *)self->_environmentConfiguration session];
    v16 = [v15 configuration];
    uint64_t v14 = [v16 userInterfaceStyle];

    id v17 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(DBEnvironmentConfiguration *)v14 _effectiveVehicleAppearancePreference];
    }
  }
  uint64_t v18 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134217984;
    uint64_t v27 = v14;
    _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "InterfaceStylePreference is: %ld", (uint8_t *)&v26, 0xCu);
  }

  v19 = [(DBEnvironmentConfiguration *)self->_environmentConfiguration themeController];
  int v20 = [v19 requiresDarkAppearanceInEnvironment:self];

  if (v20)
  {
    v21 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      id v22 = "Theme controller requires dark appearance";
LABEL_17:
      int64_t v23 = 2;
      _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, 2u);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (v14 == 2)
  {
    v21 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      id v22 = "Always dark enabled, returning dark style";
      goto LABEL_17;
    }
LABEL_18:
    int64_t v23 = 2;
    goto LABEL_21;
  }
  int64_t v23 = [(DBEnvironmentConfiguration *)self->_environmentConfiguration carUserInterfaceStyle];
  v21 = DBLogForCategory(0x10uLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v24 = CPUIDescriptionForUserInterfaceStyle();
    int v26 = 138412290;
    uint64_t v27 = (uint64_t)v24;
    _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Using car user interface style: %@", (uint8_t *)&v26, 0xCu);
  }
LABEL_21:

  return v23;
}

- (id)applicationForScene:(id)a3
{
  return 0;
}

- (id)focusWindow
{
  return [(DBFocusController *)self->_focusController focusWindow];
}

- (id)systemGestureWindow
{
  double v3 = [MEMORY[0x263F83118] sharedInstance];
  double v4 = [(DBInstrumentCluster *)self displayIdentity];
  double v5 = [v3 windowForSystemGesturesForDisplayWithIdentity:v4];

  return v5;
}

- (void)invalidate
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  double v4 = [(DBInstrumentCluster *)self environmentConfiguration];
  double v5 = [v4 session];
  [v5 removeObserver:self];

  double v6 = [(DBInstrumentCluster *)self viewController];
  [v6 invalidate];

  [(DBInstrumentClusterWorkspaceOwner *)self->_workspaceOwner invalidate];
  [(DBWorkspace *)self->_workspace invalidate];
  uint64_t v7 = [MEMORY[0x263F3F4F0] sharedInstance];
  uint64_t v8 = [(DBInstrumentCluster *)self identifierToAppScenesMap];
  uint64_t v9 = (void *)[v8 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__DBInstrumentCluster_invalidate__block_invoke;
  v16[3] = &unk_2649B4A78;
  id v17 = v7;
  id v10 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];

  [(UIWindow *)self->_clusterWindow setHidden:1];
  clusterWindow = self->_clusterWindow;
  self->_clusterWindow = 0;

  uint64_t v12 = (void *)gCARCarPlayTestAppClusterCornerOverrideImageData;
  gCARCarPlayTestAppClusterCornerOverrideImageData = 0;

  uint64_t v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 removeObserver:self forKeyPath:@"CARClusterCornerRadius"];

  [(BSInvalidatable *)self->_dispatchingFocusAssertion invalidate];
  dispatchingFocusAssertion = self->_dispatchingFocusAssertion;
  self->_dispatchingFocusAssertion = 0;

  [(BSInvalidatable *)self->_dispatchingSystemAssertion invalidate];
  dispatchingSystemAssertion = self->_dispatchingSystemAssertion;
  self->_dispatchingSystemAssertion = 0;

  [(DBFocusController *)self->_focusController invalidate];
}

void __33__DBInstrumentCluster_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 updateSettingsWithBlock:&__block_literal_global_166];
  [*(id *)(a1 + 32) destroyScene:v5 withTransitionContext:0];
}

uint64_t __33__DBInstrumentCluster_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)acquireFocus
{
  focusController = self->_focusController;
  clusterWindow = self->_clusterWindow;
  FBSystemAppBundleID();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = getpid();
  double v6 = [(DBInstrumentCluster *)self _clusterScene];
  [(DBFocusController *)focusController takeWithPriority:@"ClusterFocus" reason:clusterWindow forWindow:v7 bundleIdentifier:v5 pid:v6 scene:1.0];
}

- (void)releaseFocus
{
}

- (void)clusterThemeService:(id)a3 didSetThemeData:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__DBInstrumentCluster_clusterThemeService_didSetThemeData_completion___block_invoke;
  block[3] = &unk_2649B5170;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__DBInstrumentCluster_clusterThemeService_didSetThemeData_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) clusterThemeDelegate];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = 0;
  [v2 setThemeData:v3 error:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [v5 settings];
  id v7 = [v6 displayIdentity];
  id v8 = [(DBInstrumentCluster *)self displayIdentity];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v5 definition];
    uint64_t v11 = [v10 clientIdentity];
    id v12 = [v11 processIdentity];
    id v13 = [v12 embeddedApplicationIdentifier];

    uint64_t v14 = +[DBApplicationController sharedInstance];
    objc_super v15 = [v14 applicationWithBundleIdentifier:v13];

    v16 = DBLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v5;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_INFO, "didAddScene: %@", (uint8_t *)&v27, 0xCu);
    }

    id v17 = DBLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_INFO, "bundle ID: %@", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v18 = DBLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v15;
      _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_INFO, "application: %@", (uint8_t *)&v27, 0xCu);
    }

    if (v15)
    {
      v19 = [v5 identifier];
      int v20 = [(DBInstrumentCluster *)self identifierToApplicationMap];
      [v20 setObject:v15 forKeyedSubscript:v19];

      v21 = [(DBInstrumentCluster *)self identifierToAppScenesMap];
      [v21 setObject:v5 forKeyedSubscript:v19];

      uint64_t v22 = [v5 settings];
      if (v22)
      {
        int64_t v23 = (void *)v22;
        v24 = [v5 settings];
        int v25 = [v24 isForeground];

        if (v25)
        {
          int v26 = [(DBInstrumentCluster *)self identifierToForegroundAppScenesMap];
          [v26 setObject:v5 forKeyedSubscript:v19];
        }
      }
    }
    [v5 addObserver:self];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  id v10 = [v4 identifier];
  id v5 = [(DBInstrumentCluster *)self identifierToAppScenesMap];
  id v6 = [v5 objectForKeyedSubscript:v10];

  if (v6 == v4)
  {
    id v7 = [(DBInstrumentCluster *)self identifierToApplicationMap];
    [v7 setObject:0 forKeyedSubscript:v10];

    id v8 = [(DBInstrumentCluster *)self identifierToAppScenesMap];
    [v8 setObject:0 forKeyedSubscript:v10];

    int v9 = [(DBInstrumentCluster *)self identifierToForegroundAppScenesMap];
    [v9 setObject:0 forKeyedSubscript:v10];
  }
}

- (void)environmentConfiguration:(double)a3 viewAreaDidChangeFromViewAreaFrame:(double)a4 safeAreaInsets:(double)a5 toViewAreaFrame:(uint64_t)a6 safeAreaInsets:(void *)a7 duration:(uint64_t)a8 transitionControlType:(uint64_t)a9
{
  v52[2] = *MEMORY[0x263EF8340];
  id v26 = a7;
  int v27 = [a1 viewController];
  [a1 _rootViewControllerInsets];
  objc_msgSend(v27, "setAdditionalSafeAreaInsets:");

  if (*(double *)&a21 <= 0.0)
  {
    v43 = [a1 interestingView];
    objc_msgSend(v43, "setFrame:", *(double *)&a13, *(double *)&a14, *(double *)&a15, *(double *)&a16);

    v44 = [a1 viewController];
    [v44 updateSceneWithAnimationSettings:0];
  }
  else
  {
    id v28 = [a1 viewController];
    uint64_t v29 = [v28 view];
    [v29 setHidden:1];

    v30 = [a1 viewController];
    v31 = [v30 snapshotAppSceneView];

    [v31 setAutoresizingMask:18];
    id v32 = -[DBAnimationView initWithFrame:]([DBAnimationView alloc], "initWithFrame:", a2, a3, a4, a5);
    [(DBAnimationView *)v32 setClipsToBounds:1];
    objc_super v33 = [a1 clusterWindow];
    [v33 addSubview:v32];

    [(DBAnimationView *)v32 setAutoresizingMask:18];
    v52[0] = @"filters.gaussianBlur.inputRadius";
    v52[1] = @"filters.saturation.inputAmount";
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    [(DBAnimationView *)v32 setKeysToAnimate:v34];

    v35 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v35 setName:@"gaussianBlur"];
    [v35 setValue:&unk_26E17F0A0 forKey:@"inputRadius"];
    [v35 setValue:MEMORY[0x263EFFA88] forKey:@"inputHardEdges"];
    v36 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
    [v36 setName:@"saturation"];
    [v36 setValue:&unk_26E17F0B0 forKey:@"inputAmount"];
    v37 = [(DBAnimationView *)v32 layer];
    v51[0] = v35;
    v51[1] = v36;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
    [v37 setFilters:v38];

    [(DBAnimationView *)v32 addSubview:v31];
    [(DBAnimationView *)v32 bounds];
    objc_msgSend(v31, "setFrame:");
    v39 = [a1 viewController];
    [v39 updateSceneWithAnimationSettings:0];

    objc_initWeak(&location, a1);
    v40 = (void *)MEMORY[0x263F82E00];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke;
    v48[3] = &unk_2649B3E90;
    v41 = v32;
    v49 = v41;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_177;
    v45[3] = &unk_2649B51E8;
    objc_copyWeak(v47, &location);
    v42 = v41;
    v46 = v42;
    v47[1] = a21;
    v47[2] = a13;
    v47[3] = a14;
    v47[4] = a15;
    v47[5] = a16;
    [v40 animateWithDuration:v48 animations:v45 completion:0.25];

    objc_destroyWeak(v47);
    objc_destroyWeak(&location);
  }
}

void __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) layer];
  [v2 setValue:&unk_26E17F0C0 forKeyPath:@"filters.saturation.inputAmount"];

  id v3 = [*(id *)(a1 + 32) layer];
  [v3 setValue:&unk_26E17F0D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_177(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained viewController];
  id v5 = [v4 snapshotAppSceneView];

  [v5 setAutoresizingMask:18];
  [v5 setAlpha:0.0];
  [*(id *)(a1 + 32) addSubview:v5];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v5, "setFrame:");
  id v6 = (void *)MEMORY[0x263F82E00];
  double v7 = *(double *)(a1 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_2;
  v13[3] = &unk_2649B5198;
  objc_copyWeak(&v16, v2);
  id v14 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 72);
  long long v17 = *(_OWORD *)(a1 + 56);
  long long v18 = v8;
  id v9 = v5;
  id v15 = v9;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_3;
  v10[3] = &unk_2649B51C0;
  objc_copyWeak(&v12, v2);
  id v11 = *(id *)(a1 + 32);
  [v6 animateWithDuration:0x20000 delay:v13 usingSpringWithDamping:v10 initialSpringVelocity:v7 options:0.0 animations:100.0 completion:0.0];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
}

void __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  int v2 = [WeakRetained interestingView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [*(id *)(a1 + 40) setAlpha:1.0];
}

void __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained viewController];
  id v4 = [v3 view];
  [v4 setHidden:0];

  id v5 = (void *)MEMORY[0x263F82E00];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_4;
  v8[3] = &unk_2649B3E90;
  id v9 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_5;
  v6[3] = &unk_2649B3FA8;
  id v7 = *(id *)(a1 + 32);
  [v5 animateWithDuration:v8 animations:v6 completion:0.25];
}

void __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) layer];
  [v2 setValue:&unk_26E17F0B0 forKeyPath:@"filters.saturation.inputAmount"];

  id v3 = [*(id *)(a1 + 32) layer];
  [v3 setValue:&unk_26E17F0A0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

uint64_t __160__DBInstrumentCluster_environmentConfiguration_viewAreaDidChangeFromViewAreaFrame_safeAreaInsets_toViewAreaFrame_safeAreaInsets_duration_transitionControlType___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (UIEdgeInsets)_rootViewControllerInsets
{
  [(DBEnvironmentConfiguration *)self->_environmentConfiguration currentViewAreaFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(DBEnvironmentConfiguration *)self->_environmentConfiguration displayConfiguration];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat rect = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  CGFloat rect_16 = CGRectGetMinY(v30);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  CGFloat rect_8 = CGRectGetMinX(v31);
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  double v21 = MaxY - CGRectGetMaxY(v33);
  v34.origin.x = rect;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double v23 = MaxX - CGRectGetMaxX(v35);
  double v25 = rect_8;
  double v24 = rect_16;
  double v26 = v21;
  result.right = v23;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (void)environmentConfiguration:(id)a3 receivedShowUIWithURL:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Received showUI for %{public}@", (uint8_t *)&v18, 0xCu);
  }

  if ([(DBInstrumentCluster *)self isGaugeCluster])
  {
    double v9 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DBInstrumentCluster environmentConfiguration:receivedShowUIWithURL:]((uint64_t)v7, v9);
    }
  }
  else if (+[DBInstrumentClusterURLHandler isURLSupported:v7])
  {
    CGFloat v10 = [(DBInstrumentCluster *)self viewController];
    id v11 = [(DBInstrumentCluster *)self environmentConfiguration];
    double v12 = [v11 navigationStateProvider];
    CGFloat v13 = [v12 mostRecentClusterNavigatingApp];
    [v10 setTargetBundleIdentifier:v13];

    double v14 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Foregrounding instrument cluster scene.", (uint8_t *)&v18, 2u);
    }

    CGFloat v15 = [(DBInstrumentCluster *)self clusterWindow];
    [v15 setHidden:0];

    double v16 = [(DBInstrumentCluster *)self viewController];
    [v16 foregroundSceneWithURL:v7];

    CGFloat v17 = [v6 displayConfiguration];
    double v9 = [v17 hardwareIdentifier];
  }
  else
  {
    double v9 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DBInstrumentCluster environmentConfiguration:receivedShowUIWithURL:]((uint64_t)v7, v9);
    }
  }
}

- (void)environmentConfiguration:(id)a3 appearanceStyleDidChange:(int64_t)a4
{
  id v5 = a3;
  id v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Appearance style changed for environment, updating user interface style", buf, 2u);
  }

  id v7 = [MEMORY[0x263F3F4F0] sharedInstance];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __73__DBInstrumentCluster_environmentConfiguration_appearanceStyleDidChange___block_invoke;
  double v12 = &unk_2649B5238;
  CGFloat v13 = self;
  id v14 = v5;
  id v8 = v5;
  [v7 enumerateScenesWithBlock:&v9];

  [(DBInstrumentCluster *)self _updateWallpaper];
}

void __73__DBInstrumentCluster_environmentConfiguration_appearanceStyleDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  CGFloat v4 = [v3 settings];
  id v5 = [v4 displayIdentity];
  id v6 = [*(id *)(a1 + 32) displayIdentity];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) environmentConfiguration];
    uint64_t v9 = [v8 carUserInterfaceStyle];

    uint64_t v10 = DBLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Updating user interface style to %lu for scene: %@", buf, 0x16u);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__DBInstrumentCluster_environmentConfiguration_appearanceStyleDidChange___block_invoke_180;
    v11[3] = &unk_2649B5210;
    id v12 = v3;
    uint64_t v14 = v9;
    id v13 = *(id *)(a1 + 40);
    [v12 updateUISettingsWithBlock:v11];
  }
}

void __73__DBInstrumentCluster_environmentConfiguration_appearanceStyleDidChange___block_invoke_180(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) identifier];
  char v4 = [v3 containsString:@"com.apple.CarPlayWallpaper"];

  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 48);
  }
  [v6 setUserInterfaceStyle:v5];
  if ([*(id *)(a1 + 40) supportsDisplayPlugin]) {
    [v6 setUserInterfaceStyle:2];
  }
}

- (void)_updateWallpaper
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Updating #wallpaper", buf, 2u);
  }

  char v4 = [(DBInstrumentCluster *)self environmentConfiguration];
  uint64_t v5 = [v4 wallpaperPreferences];

  id v6 = [v5 currentWallpaper];
  int v7 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v6;
    _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Applying #wallpaper %{public}@", buf, 0xCu);
  }

  id v8 = [v6 traits];
  if ([v8 isBlack])
  {
    uint64_t v9 = [MEMORY[0x263F82DA0] currentTraitCollection];
    BOOL v10 = [v9 userInterfaceStyle] == 2;
  }
  else
  {
    BOOL v10 = 0;
  }

  id v11 = [MEMORY[0x263F3F4F0] sharedInstance];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__DBInstrumentCluster__updateWallpaper__block_invoke;
  v15[3] = &unk_2649B4908;
  v15[4] = self;
  BOOL v16 = v10;
  [v11 enumerateScenesWithBlock:v15];

  id v12 = [v6 traits];
  uint64_t v13 = [v12 hideRoundedCorners];
  uint64_t v14 = [(DBInstrumentCluster *)self cornerRadiusWindow];
  [v14 setHidden:v13];
}

void __39__DBInstrumentCluster__updateWallpaper__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 settings];
  uint64_t v5 = [v4 displayIdentity];
  id v6 = [*(id *)(a1 + 32) displayIdentity];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__DBInstrumentCluster__updateWallpaper__block_invoke_2;
    v8[3] = &__block_descriptor_33_e43_v16__0__UIMutableApplicationSceneSettings_8l;
    char v9 = *(unsigned char *)(a1 + 40);
    [v3 updateUISettingsWithBlock:v8];
  }
}

void __39__DBInstrumentCluster__updateWallpaper__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setBlackWallpaperModeEnabled:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void)environmentConfiguration:(id)a3 nightModeDidChange:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromBOOL();
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Night mode changed for environment to: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)environmentConfiguration:(id)a3 mapsAppearanceStyleDidChange:(int64_t)a4
{
  int v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Maps style changed for environment, updating user interface style on scenes that can use Maps style", buf, 2u);
  }

  int v7 = [MEMORY[0x263F3F4F0] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__DBInstrumentCluster_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke;
  v8[3] = &unk_2649B4C38;
  void v8[4] = self;
  v8[5] = a4;
  [v7 enumerateScenesWithBlock:v8];
}

void __77__DBInstrumentCluster_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 settings];
  uint64_t v5 = [v4 displayIdentity];
  int v6 = [*(id *)(a1 + 32) displayIdentity];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v3 settings];
    int v9 = [v8 conformsToProtocol:&unk_26E239760];

    BOOL v10 = DBLogForCategory(0);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        id v12 = CPUIDescriptionForUserInterfaceStyle();
        *(_DWORD *)buf = 138543618;
        id v16 = v12;
        __int16 v17 = 2114;
        id v18 = v3;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Updating map style to: %{public}@, for scene: %{public}@", buf, 0x16u);
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __77__DBInstrumentCluster_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke_232;
      v14[3] = &unk_2649B5260;
      uint64_t v13 = *(void *)(a1 + 40);
      v14[4] = *(void *)(a1 + 32);
      v14[5] = v13;
      [v3 updateSettingsWithBlock:v14];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v3;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring map style update for scene: %{public}@", buf, 0xCu);
      }
    }
  }
}

void __77__DBInstrumentCluster_environmentConfiguration_mapsAppearanceStyleDidChange___block_invoke_232(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_26E239858]) {
    id v3 = v5;
  }
  else {
    id v3 = 0;
  }

  if ([*(id *)(*(void *)(a1 + 32) + 72) supportsDisplayPlugin]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  [v3 setMapStyle:v4];
}

- (void)stopUIReceivedForEnvironmentConfiguration:(id)a3
{
  if ([(DBInstrumentCluster *)self isGaugeCluster])
  {
    uint64_t v4 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DBInstrumentCluster stopUIReceivedForEnvironmentConfiguration:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    id v12 = [(DBInstrumentCluster *)self viewController];
    [v12 backgroundScene];

    id v13 = [(DBInstrumentCluster *)self clusterWindow];
    [v13 setHidden:1];
  }
}

- (void)session:(id)a3 receivedUnhandledRemoteEvent:(id)a4 withPayload:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__DBInstrumentCluster_session_receivedUnhandledRemoteEvent_withPayload___block_invoke;
  block[3] = &unk_2649B3ED8;
  id v12 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__DBInstrumentCluster_session_receivedUnhandledRemoteEvent_withPayload___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([a1[4] isEqualToString:@"changeMapZoomLevel"])
  {
    int v2 = [a1[5] objectForKey:@"uuid"];
    id v3 = [a1[6] environmentConfiguration];
    uint64_t v4 = [v3 displayConfiguration];
    uint64_t v5 = [v4 hardwareIdentifier];
    int v6 = [v2 isEqualToString:v5];

    if (v6)
    {
      id v7 = [a1[5] objectForKey:@"zoomDirection"];
      if ([v7 integerValue]) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }

      id v9 = [a1[6] _foregroundActiveScene];
      id v10 = DBLogForCategory(8uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(id)objc_opt_class() _directionStringForDirection:v8];
        int v14 = 138543618;
        CGFloat v15 = v11;
        __int16 v16 = 2114;
        __int16 v17 = v9;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Zoom command received for cluster display with direction: %{public}@, sending to scene: %{public}@", (uint8_t *)&v14, 0x16u);
      }
      id v12 = (void *)[objc_alloc(MEMORY[0x263F314D0]) initWithZoomDirection:v8];
      id v13 = [MEMORY[0x263EFFA08] setWithObject:v12];
      [v9 sendActions:v13];
    }
  }
}

- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6
{
  id v7 = [(DBInstrumentCluster *)self identifierToApplicationMap];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __103__DBInstrumentCluster_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke;
  v8[3] = &unk_2649B4BD0;
  void v8[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

void __103__DBInstrumentCluster_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 identifierToAppScenesMap];
  id v18 = [v7 objectForKeyedSubscript:v6];

  int v8 = [v5 isLockedOrHidden];
  id v9 = [v18 settings];
  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5)
  {
    id v10 = [v18 settings];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
    id v15 = v13;

    __int16 v16 = [v15 proxiedApplicationBundleIdentifier];

    __int16 v17 = +[DBApplicationController sharedInstance];
    int v14 = [v17 applicationWithBundleIdentifier:v16];
  }
  else
  {
    int v14 = 0;
  }
  if (([v14 isLockedOrHidden] | v8) == 1) {
    [v18 invalidate];
  }
}

+ (id)_directionStringForDirection:(int64_t)a3
{
  id v3 = @"none";
  if (a3 == 2) {
    id v3 = @"out";
  }
  if (a3 == 1) {
    return @"in";
  }
  else {
    return v3;
  }
}

- (id)_foregroundActiveScene
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  int v2 = [(DBInstrumentCluster *)self identifierToAppScenesMap];
  id v3 = [v2 allValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__DBInstrumentCluster__foregroundActiveScene__block_invoke;
  v6[3] = &unk_2649B4898;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__DBInstrumentCluster__foregroundActiveScene__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  id v7 = [v11 uiSettings];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  int v9 = [v8 isForeground];
  uint64_t v10 = [v8 deactivationReasons];
  if (v9 && !v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)navigationStateProvider:(id)a3 frontmostIdentifierDidChange:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = +[DBApplicationController sharedInstance];
  id v8 = [v7 applicationWithBundleIdentifier:v6];

  if ([v8 presentsFullScreen]
    && [v8 supportsInstrumentClusterNavigation])
  {
    int v9 = [(DBInstrumentCluster *)self viewController];
    [v9 setTargetBundleIdentifier:v6];

    uint64_t v10 = [(DBInstrumentCluster *)self interestingView];
    id v11 = [(DBInstrumentCluster *)self environmentConfiguration];
    id v12 = [v11 displayConfiguration];
    [v12 bounds];
    objc_msgSend(v10, "setFrame:");
  }
  else
  {
    uint64_t v10 = [v15 mostRecentClusterNavigatingApp];
    id v13 = [(DBInstrumentCluster *)self interestingView];
    int v14 = [(DBInstrumentCluster *)self environmentConfiguration];
    [v14 currentViewAreaFrame];
    objc_msgSend(v13, "setFrame:");

    id v11 = [(DBInstrumentCluster *)self viewController];
    [v11 setTargetBundleIdentifier:v10];
  }
}

- (void)navigationStateProvider:(id)a3 navigatingIdentifiersDidChange:(id)a4
{
  id v5 = a3;
  id v6 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_INFO, "Active navigation identifiers changed", v9, 2u);
  }

  id v7 = [v5 mostRecentClusterNavigatingApp];

  id v8 = [(DBInstrumentCluster *)self viewController];
  [v8 setTargetBundleIdentifier:v7];
}

- (DBInstrumentClusterThemeDelegate)clusterThemeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->clusterThemeDelegate);
  return (DBInstrumentClusterThemeDelegate *)WeakRetained;
}

- (void)setClusterThemeDelegate:(id)a3
{
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (CARScreenInfo)screenInfo
{
  return self->_screenInfo;
}

- (void)setScreenInfo:(id)a3
{
}

- (CARDisplayInfo)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (NSMutableDictionary)identifierToAppScenesMap
{
  return self->_identifierToAppScenesMap;
}

- (void)setIdentifierToAppScenesMap:(id)a3
{
}

- (NSMutableDictionary)identifierToForegroundAppScenesMap
{
  return self->_identifierToForegroundAppScenesMap;
}

- (void)setIdentifierToForegroundAppScenesMap:(id)a3
{
}

- (NSMutableDictionary)identifierToApplicationMap
{
  return self->_identifierToApplicationMap;
}

- (void)setIdentifierToApplicationMap:(id)a3
{
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (void)setWorkspace:(id)a3
{
}

- (DBInstrumentClusterWorkspaceOwner)workspaceOwner
{
  return self->_workspaceOwner;
}

- (void)setWorkspaceOwner:(id)a3
{
}

- (UIWindow)clusterWindow
{
  return self->_clusterWindow;
}

- (void)setClusterWindow:(id)a3
{
}

- (DBInstrumentClusterRootViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)isGaugeCluster
{
  return self->_gaugeCluster;
}

- (void)setGaugeCluster:(BOOL)a3
{
  self->_gaugeCluster = a3;
}

- (UIWindow)cornerRadiusWindow
{
  return self->_cornerRadiusWindow;
}

- (void)setCornerRadiusWindow:(id)a3
{
}

- (UIView)cornerRadiusView
{
  return self->_cornerRadiusView;
}

- (void)setCornerRadiusView:(id)a3
{
}

- (double)currentCornerRadius
{
  return self->_currentCornerRadius;
}

- (void)setCurrentCornerRadius:(double)a3
{
  self->_currentCornerRadius = a3;
}

- (UIWindow)interestingWindow
{
  return self->_interestingWindow;
}

- (void)setInterestingWindow:(id)a3
{
}

- (UIView)interestingView
{
  return self->_interestingView;
}

- (void)setInterestingView:(id)a3
{
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (BSInvalidatable)dispatchingFocusAssertion
{
  return self->_dispatchingFocusAssertion;
}

- (void)setDispatchingFocusAssertion:(id)a3
{
}

- (BSInvalidatable)dispatchingSystemAssertion
{
  return self->_dispatchingSystemAssertion;
}

- (void)setDispatchingSystemAssertion:(id)a3
{
}

- (DBFocusController)focusController
{
  return self->_focusController;
}

- (void)setFocusController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_dispatchingSystemAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchingFocusAssertion, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_interestingView, 0);
  objc_storeStrong((id *)&self->_interestingWindow, 0);
  objc_storeStrong((id *)&self->_cornerRadiusView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusWindow, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_clusterWindow, 0);
  objc_storeStrong((id *)&self->_workspaceOwner, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_identifierToApplicationMap, 0);
  objc_storeStrong((id *)&self->_identifierToForegroundAppScenesMap, 0);
  objc_storeStrong((id *)&self->_identifierToAppScenesMap, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_screenInfo, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_destroyWeak((id *)&self->clusterThemeDelegate);
}

- (void)sceneInterfaceStyleForApplication:(uint64_t)a3 proxyApplication:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)environmentConfiguration:(uint64_t)a1 receivedShowUIWithURL:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "showUI (%@) is unsupported on display with DDP enabled.", (uint8_t *)&v2, 0xCu);
}

- (void)environmentConfiguration:(uint64_t)a1 receivedShowUIWithURL:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Received an unsupported showUI URL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)stopUIReceivedForEnvironmentConfiguration:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end