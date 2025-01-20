@interface GKExtensionViewController
- (BOOL)_useBackdropViewForWindowBackground;
- (BOOL)adjustTopConstraint;
- (BOOL)alwaysShowDoneButton;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasInitialData;
- (GKExtensionViewController)initWithCoder:(id)a3;
- (NSLayoutConstraint)effectBottomConstraint;
- (NSLayoutConstraint)effectTopConstraint;
- (UIViewController)contentViewController;
- (UIVisualEffectView)effectView;
- (double)_statusBarHeightForCurrentInterfaceOrientation;
- (double)statusBarHeight;
- (id)daemonProxy;
- (id)hostObjectProxy;
- (int)hostPID;
- (int64_t)hostUserInterfaceIdiom;
- (void)addDoneButtonToViewController:(id)a3;
- (void)addVisualEffectViewForView:(id)a3;
- (void)configureContentViewController;
- (void)constructContentViewController;
- (void)extensionIsCanceling;
- (void)extensionIsFinishing;
- (void)logOnceGameControllerUsedInGameLayer;
- (void)messageFromClient:(id)a3;
- (void)messageFromExtension:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)sendMessageToClient:(id)a3;
- (void)setAdjustTopConstraint:(BOOL)a3;
- (void)setAlwaysShowDoneButton:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setEffectBottomConstraint:(id)a3;
- (void)setEffectTopConstraint:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHasInitialData:(BOOL)a3;
- (void)setHostPID:(int)a3;
- (void)setHostUserInterfaceIdiom:(int64_t)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setStatusBarHeight:(double)a3;
- (void)setToDarkBackground;
- (void)setToLightBackground;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setupVisualEffects;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKExtensionViewController

- (GKExtensionViewController)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKExtensionViewController;
  v3 = [(GKExtensionViewController *)&v8 initWithCoder:a3];
  if (v3)
  {
    GKUISetRemote();
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      [(GKExtensionViewController *)v3 setModalPresentationStyle:16];
      v6 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v6 formSheetSize];
      -[GKExtensionViewController setPreferredContentSize:](v3, "setPreferredContentSize:");

      *MEMORY[0x1E4F63A38] = 0;
    }
    else
    {
      [(GKExtensionViewController *)v3 setModalPresentationStyle:17];
    }
    v3->_alwaysShowDoneButton = 1;
    v3->_adjustTopConstraint = 1;
    [(GKExtensionViewController *)v3 _setClipUnderlapWhileTransitioning:1];
    [(GKExtensionViewController *)v3 _setPositionBarsExclusivelyWithSafeArea:1];
  }
  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)GKExtensionViewController;
  [(GKExtensionViewController *)&v6 viewDidLoad];
  v3 = [(GKExtensionViewController *)self navigationBar];
  [v3 setBarStyle:0];

  v4 = [(GKExtensionViewController *)self navigationBar];
  [v4 setTranslucent:1];

  [(GKExtensionViewController *)self setOverrideUserInterfaceStyle:2];
  if ([(GKExtensionViewController *)self _useBackdropViewForWindowBackground])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    [(GKExtensionViewController *)self setEffectView:v5];

    [(GKExtensionViewController *)self setupVisualEffects];
  }
}

- (void)setupVisualEffects
{
  v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  v4 = [(GKExtensionViewController *)self effectView];
  [v4 setBackgroundEffects:v3];

  id v5 = [(GKExtensionViewController *)self effectView];
  [v5 _setGroupName:@"gameLayerGroup"];
}

- (id)daemonProxy
{
  return (id)[MEMORY[0x1E4F636C8] daemonProxy];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKExtensionViewController *)self daemonProxy];
  [v5 setDataUpdateDelegate:self];

  v27.receiver = self;
  v27.super_class = (Class)GKExtensionViewController;
  [(GKExtensionViewController *)&v27 viewWillAppear:v3];
  if ([(GKExtensionViewController *)self _useBackdropViewForWindowBackground])
  {
    [(GKExtensionViewController *)self setupVisualEffects];
    objc_super v6 = [(GKExtensionViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [(GKExtensionViewController *)self effectView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v16 = [(GKExtensionViewController *)self effectView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(GKExtensionViewController *)self parentViewController];
    v18 = [v17 view];
    v19 = [v18 window];
    v20 = [v19 rootViewController];
    v21 = [v20 view];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      v24 = [(GKExtensionViewController *)self parentViewController];
      v25 = [v24 view];
      id v23 = [v25 window];
    }
    [(GKExtensionViewController *)self addVisualEffectViewForView:v23];
  }
  if ([(GKExtensionViewController *)self hasInitialData])
  {
    v26 = [(GKExtensionViewController *)self contentViewController];

    if (!v26) {
      [(GKExtensionViewController *)self constructContentViewController];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKExtensionViewController;
  [(GKExtensionViewController *)&v11 viewDidAppear:a3];
  v4 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  objc_super v6 = (os_log_t *)MEMORY[0x1E4F63880];
  double v7 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "GKExtensionViewController viewDidAppear called", v10, 2u);
  }
  [(GKExtensionViewController *)self becomeFirstResponder];
  if (!*v4) {
    id v8 = (id)GKOSLoggers();
  }
  double v9 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "ControllerSupport: Focus system activated by calling becomeFirstResponder", v10, 2u);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)addVisualEffectViewForView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewWithTag:678];
  [v5 removeFromSuperview];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  objc_super v6 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v8 setBackgroundEffects:v6];

  double v7 = [(GKExtensionViewController *)self effectView];
  [v7 _setGroupName:@"gameLayerGroup"];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setTag:678];
  [v4 insertSubview:v8 atIndex:0];
  [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForView:v8 containedWithinParentView:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionViewController;
  [(GKExtensionViewController *)&v7 viewDidDisappear:a3];
  [(GKExtensionViewController *)self setViewControllers:MEMORY[0x1E4F1CBF0] animated:0];
  [(GKExtensionViewController *)self setContentViewController:0];
  id v4 = [(GKExtensionViewController *)self daemonProxy];
  id v5 = [v4 dataUpdateDelegate];

  if (v5 == self)
  {
    objc_super v6 = [(GKExtensionViewController *)self daemonProxy];
    [v6 setDataUpdateDelegate:0];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKExtensionViewController;
  id v6 = a4;
  [(GKExtensionViewController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__GKExtensionViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E5F63B68;
  v7[4] = self;
  [v6 animateAlongsideTransition:v7 completion:&__block_literal_global_52];
}

void __87__GKExtensionViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double Height = 0.0;
  if ([*(id *)(a1 + 32) adjustTopConstraint])
  {
    BOOL v3 = [*(id *)(a1 + 32) navigationBar];
    [v3 bounds];
    double Height = CGRectGetHeight(v6);
  }
  id v4 = [*(id *)(a1 + 32) effectTopConstraint];
  [v4 setConstant:Height];
}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 1;
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 objectForKeyedSubscript:@"StatusBarHeightKey"];
  [v8 floatValue];
  [(GKExtensionViewController *)self setStatusBarHeight:v9];

  double v10 = [v7 objectForKeyedSubscript:@"HostPIDKey"];
  -[GKExtensionViewController setHostPID:](self, "setHostPID:", [v10 integerValue]);

  objc_super v11 = [v7 objectForKeyedSubscript:@"CurrentGameKey"];
  double v12 = (void *)MEMORY[0x1E4F636F0];
  double v13 = [v11 internal];
  objc_msgSend(v12, "setCurrentGameFromInternal:serverEnvironment:", v13, objc_msgSend(v11, "environment"));

  double v14 = [MEMORY[0x1E4F63760] localPlayer];
  v15 = [v7 objectForKeyedSubscript:@"LocalPlayerKey"];
  [v14 updateFromLocalPlayer:v15];

  v16 = [v7 objectForKeyedSubscript:@"RTLKey"];
  char v17 = [v16 BOOLValue];
  *MEMORY[0x1E4F63A30] = v17;

  v18 = [v7 objectForKeyedSubscript:@"HostUserInterfaceIdiom"];

  -[GKExtensionViewController setHostUserInterfaceIdiom:](self, "setHostUserInterfaceIdiom:", [v18 integerValue]);
  [(GKExtensionViewController *)self hostUserInterfaceIdiom];
  GKSetHostUserInterfaceIdiom();
  v19 = [(GKExtensionViewController *)self daemonProxy];
  objc_msgSend(v19, "setHostPID:", -[GKExtensionViewController hostPID](self, "hostPID"));

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__GKExtensionViewController_setInitialState_withReply___block_invoke;
  v21[3] = &unk_1E5F63E30;
  v21[4] = self;
  id v22 = v6;
  id v20 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v21);
}

uint64_t __55__GKExtensionViewController_setInitialState_withReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasInitialData:1];
  v2 = [*(id *)(a1 + 32) contentViewController];
  if (v2)
  {
  }
  else if ([*(id *)(a1 + 32) isViewLoaded])
  {
    [*(id *)(a1 + 32) constructContentViewController];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)constructContentViewController
{
  BOOL v3 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  id v4 = [v3 profileServicePrivate];

  [v4 startContactsIntegrationSyncWithOptions:2 completionHandler:&__block_literal_global_20];
  [(GKExtensionViewController *)self configureContentViewController];
}

void __59__GKExtensionViewController_constructContentViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63840], OS_LOG_TYPE_DEBUG)) {
    __59__GKExtensionViewController_constructContentViewController__block_invoke_cold_1();
  }
}

- (void)configureContentViewController
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(GKExtensionViewController *)self contentViewController];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      [(GKExtensionViewController *)self setModalPresentationStyle:16];
      id v6 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v6 formSheetSize];
      -[GKExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
    else
    {
      [(GKExtensionViewController *)self setModalPresentationStyle:17];
    }
    id v7 = [(GKExtensionViewController *)self view];
    [v7 setClipsToBounds:0];
    objc_super v8 = [MEMORY[0x1E4F639B0] sharedPalette];
    float v9 = [v8 systemInteractionColor];
    [v7 setTintColor:v9];

    if ([(GKExtensionViewController *)self alwaysShowDoneButton])
    {
      double v10 = [(GKExtensionViewController *)self contentViewController];
      [(GKExtensionViewController *)self addDoneButtonToViewController:v10];
    }
    objc_super v11 = [(GKExtensionViewController *)self contentViewController];
    v13[0] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(GKExtensionViewController *)self setViewControllers:v12 animated:0];
  }
}

- (void)addDoneButtonToViewController:(id)a3
{
  id v9 = a3;
  if (([v9 _gkExtensionWantsCustomRightBarButtonItemInViewService] & 1) == 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v5 = GKGameCenterUIFrameworkBundle();
    id v6 = GKGetLocalizedStringFromTableInBundle();
    id v7 = (void *)[v4 initWithTitle:v6 style:2 target:self action:sel_donePressed_];
    objc_super v8 = [v9 navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(GKExtensionViewController *)self alwaysShowDoneButton]) {
    [(GKExtensionViewController *)self addDoneButtonToViewController:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionViewController;
  [(GKExtensionViewController *)&v7 pushViewController:v6 animated:v4];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        if ([(GKExtensionViewController *)self alwaysShowDoneButton]) {
          [(GKExtensionViewController *)self addDoneButtonToViewController:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKExtensionViewController;
  [(GKExtensionViewController *)&v12 setViewControllers:v6 animated:v4];
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  return self->_statusBarHeight;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (-[GKExtensionViewController _gkShouldRefreshContentsForDataType:userInfo:](self, "_gkShouldRefreshContentsForDataType:userInfo:", v4))[(GKExtensionViewController *)self _gkRefreshContentsForDataType:v4 userInfo:v7]; {
  if (v4 == 16)
  }
  {
    id v6 = [MEMORY[0x1E4F63760] local];
    [v6 clearInMemoryCachedAvatars];
  }
}

- (id)hostObjectProxy
{
  uint64_t v4 = [(GKExtensionViewController *)self extensionContext];
  uint64_t v5 = [v4 _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_32];

  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"GKExtensionViewController.m" lineNumber:363 description:@"GKExtensionContext remote object proxy is nil!"];
  }

  return v6;
}

void __44__GKExtensionViewController_hostObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __44__GKExtensionViewController_hostObjectProxy__block_invoke_cold_1(v4, v2);
  }
}

- (void)sendMessageToClient:(id)a3
{
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v4 = [(GKExtensionViewController *)self hostObjectProxy];
  [v4 messageFromExtension:v5];
}

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(GKExtensionViewController *)self hostObjectProxy];
  [v5 messageFromExtension:v4];
}

- (void)extensionIsCanceling
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"MessageCommandKey";
  v5[0] = &unk_1F0812588;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionViewController *)self sendMessageToClient:v3];
}

- (void)extensionIsFinishing
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"MessageCommandKey";
  v5[0] = &unk_1F08125A0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionViewController *)self sendMessageToClient:v3];
}

- (void)messageFromClient:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v6 = GKExtensionProtocolSecureCodedClasses();
  id v12 = 0;
  id v7 = [v4 unarchivedObjectOfClasses:v6 fromData:v5 error:&v12];

  id v8 = v12;
  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKExtensionViewController messageFromClient:]();
    }
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v11 = [v10 integerValue];

  switch(v11)
  {
    case 47:
      [(GKExtensionViewController *)self clientWillTerminate];
      break;
    case 4:
      [(GKExtensionViewController *)self clientDidCancel];
      break;
    case 3:
      [(GKExtensionViewController *)self clientDidFinish];
      break;
  }
}

- (void)logOnceGameControllerUsedInGameLayer
{
  if (logOnceGameControllerUsedInGameLayer_onceToken_0 != -1) {
    dispatch_once(&logOnceGameControllerUsedInGameLayer_onceToken_0, &__block_literal_global_47);
  }
}

void __65__GKExtensionViewController_logOnceGameControllerUsedInGameLayer__block_invoke()
{
  id v4 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v0 = *MEMORY[0x1E4F63520];
  uint64_t v1 = *MEMORY[0x1E4F63588];
  id v2 = [MEMORY[0x1E4F636F0] currentGame];
  id v3 = [v2 bundleIdentifier];
  [v4 reportEvent:v0 type:v1 bundleID:v3];
}

- (void)setToLightBackground
{
  id v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:0];
  [(UIVisualEffectView *)self->_effectView setEffect:v3];
}

- (void)setToDarkBackground
{
  id v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
  [(UIVisualEffectView *)self->_effectView setEffect:v3];
}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBardouble Height = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void)setHostPID:(int)a3
{
  self->_hostPID = a3;
}

- (int64_t)hostUserInterfaceIdiom
{
  return self->_hostUserInterfaceIdiom;
}

- (void)setHostUserInterfaceIdiom:(int64_t)a3
{
  self->_hostUserInterfaceIdiom = a3;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (BOOL)adjustTopConstraint
{
  return self->_adjustTopConstraint;
}

- (void)setAdjustTopConstraint:(BOOL)a3
{
  self->_adjustTopConstraint = a3;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void)setHasInitialData:(BOOL)a3
{
  self->_hasInitialData = a3;
}

- (NSLayoutConstraint)effectBottomConstraint
{
  return self->_effectBottomConstraint;
}

- (void)setEffectBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)effectTopConstraint
{
  return self->_effectTopConstraint;
}

- (void)setEffectTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectTopConstraint, 0);
  objc_storeStrong((id *)&self->_effectBottomConstraint, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

void __59__GKExtensionViewController_constructContentViewController__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1AF250000, v0, OS_LOG_TYPE_DEBUG, "Starting cache updates from extension. error: %@", v1, 0xCu);
}

void __44__GKExtensionViewController_hostObjectProxy__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1AF250000, v3, OS_LOG_TYPE_DEBUG, "error calling host - %@", v5, 0xCu);
}

- (void)messageFromClient:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1AF250000, v0, OS_LOG_TYPE_ERROR, "error while decoding messageFromClient archive in GKExtensionViewController:%@", v1, 0xCu);
}

@end