@interface HUCCControlCenterCompactModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isDeviceUnlockedForModuleContentViewController:(id)a3;
- (CCUIContentModuleContentViewController)contentViewController;
- (CCUIContentModuleContext)contentModuleContext;
- (HUCCControlCenterCompactModule)init;
- (HUCCLockStateHandler)lockStateHandler;
- (id)contentViewControllerForContext:(id)a3;
- (unint64_t)supportedGridSizeClasses;
- (void)launchHomeAppForModuleContentViewController:(id)a3;
- (void)lockStateWasUpdated:(BOOL)a3;
- (void)moduleContentViewController:(id)a3 viewDidDisappear:(BOOL)a4;
- (void)moduleContentViewController:(id)a3 viewWillAppear:(BOOL)a4;
- (void)setContentModuleContext:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setLockStateHandler:(id)a3;
@end

@implementation HUCCControlCenterCompactModule

- (HUCCControlCenterCompactModule)init
{
  v7.receiver = self;
  v7.super_class = (Class)HUCCControlCenterCompactModule;
  v2 = [(HUCCControlCenterCompactModule *)&v7 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = [MEMORY[0x263F49B30] sharedManager];
      [v3 bootstrap];
    }
    else
    {
      HUCCPerformCommonInitialization();
    }
    v4 = [[HUCCLockStateHandler alloc] initWithDelegate:v2];
    lockStateHandler = v2->_lockStateHandler;
    v2->_lockStateHandler = v4;

    if (qword_268C8C860 != -1) {
      dispatch_once(&qword_268C8C860, &unk_26F4C62C8);
    }
  }
  return v2;
}

- (id)contentViewControllerForContext:(id)a3
{
  v3 = [[HUCCCompactModuleContentViewController alloc] initWithDelegate:self];

  return v3;
}

- (unint64_t)supportedGridSizeClasses
{
  return MEMORY[0x270F18848](self, a2);
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)lockStateWasUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  v5 = [(HUCCControlCenterCompactModule *)self contentViewController];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [v7 setAccessAllowedForCurrentLockState:v3];
}

- (void)moduleContentViewController:(id)a3 viewWillAppear:(BOOL)a4
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [MEMORY[0x263F49B30] sharedManager];
    [v4 enterModuleViewWillAppear];
  }
  else
  {
    HUCCUpdateRunningState(1);
  }
}

- (void)moduleContentViewController:(id)a3 viewDidDisappear:(BOOL)a4
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [MEMORY[0x263F49B30] sharedManager];
    [v4 exitModuleViewDidDisappear];
  }
  else
  {
    HUCCUpdateRunningState(0);
  }
}

- (void)launchHomeAppForModuleContentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCCControlCenterCompactModule *)self contentModuleContext];
  launchHomeAppForModuleViewController(v4, v5);
}

- (BOOL)isDeviceUnlockedForModuleContentViewController:(id)a3
{
  BOOL v3 = [(HUCCControlCenterCompactModule *)self lockStateHandler];
  char v4 = [v3 isDeviceUnlocked];

  return v4;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (HUCCLockStateHandler)lockStateHandler
{
  return self->_lockStateHandler;
}

- (void)setLockStateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateHandler, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end