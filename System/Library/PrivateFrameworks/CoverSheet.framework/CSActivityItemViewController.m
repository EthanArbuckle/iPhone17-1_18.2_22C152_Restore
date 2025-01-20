@interface CSActivityItemViewController
- (ACUISActivityHostViewController)activityHostViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isContentVisibleAndAppeared;
- (BOOL)isContentVisible;
- (BOOL)isListAppeared;
- (BOOL)isScreenOn;
- (BSInvalidatable)restrictsTouchesAssertion;
- (CGSize)contentSizeForContentView:(id)a3;
- (CSActivityItemViewController)initWithActivityHostViewController:(id)a3;
- (CSActivityItemViewControllerDelegate)delegate;
- (CSListItemSceneHostEnvironmentObserving)sceneHostEnvironmentObserver;
- (NSArray)activityHostTouchRestrictedRects;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (id)sceneHostEnvironmentEntriesForBacklightSession;
- (void)_backlightLuminanceDidChange;
- (void)_invalidateRestrictsTouchesAssertion;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)_updateAudioCategoriesDisablingVolumeHUDWithReason:(id)a3;
- (void)_updatePresentationModeWithReason:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)notificationListSupplementaryViewPresentableContentWillBecomeVisible:(BOOL)a3;
- (void)reevaluateAudioCategoriesDisablingVolumeHUD;
- (void)restrictsTouchesOnHostedScene:(BOOL)a3;
- (void)setActivityHostViewController:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setListAppeared:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRestrictsTouchesAssertion:(id)a3;
- (void)setSceneHostEnvironmentObserver:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CSActivityItemViewController

- (CSActivityItemViewController)initWithActivityHostViewController:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSActivityItemViewController;
  v6 = [(CSActivityItemViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityHostViewController, a3);
    [(CSActivityItemViewController *)v7 _updateAudioCategoriesDisablingVolumeHUDWithReason:@"Initialization"];
    v8 = self;
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = (id)[(CSActivityItemViewController *)v7 registerForTraitChanges:v9 withAction:sel__backlightLuminanceDidChange];
  }
  return v7;
}

- (void)dealloc
{
  [(CSActivityItemViewController *)self _invalidateRestrictsTouchesAssertion];
  [(CSActivityItemViewController *)self bs_removeChildViewController:self->_activityHostViewController];
  v3.receiver = self;
  v3.super_class = (Class)CSActivityItemViewController;
  [(CSActivityItemViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(CSActivityItemContentView);
  [(CSActivityItemContentView *)v3 setSizeProvider:self];
  [(CSActivityItemContentView *)v3 setAccessibilityIdentifier:@"activity-content-view"];
  [(CSActivityItemViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  [(CSActivityItemViewController *)self bs_addChildViewController:self->_activityHostViewController];
  [(ACUISActivityHostViewController *)self->_activityHostViewController preferredContentSize];
  -[CSActivityItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v3.receiver = self;
  v3.super_class = (Class)CSActivityItemViewController;
  [(CSActivityItemViewController *)&v3 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  [(ACUISActivityHostViewController *)self->_activityHostViewController preferredContentSize];

  -[CSActivityItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CSActivityItemViewController;
  [(CSActivityItemViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(CSActivityItemViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(ACUISActivityHostViewController *)self->_activityHostViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (NSArray)activityHostTouchRestrictedRects
{
  return (NSArray *)[(ACUISActivityHostViewController *)self->_activityHostViewController hostIgnoredTouchedRects];
}

- (void)setPresentationMode:(unint64_t)a3
{
  -[ACUISActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CSActivityItemViewController_setPresentationMode___block_invoke;
  v5[3] = &unk_1E6AD9748;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __52__CSActivityItemViewController_setPresentationMode___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1)
  {
    id v1 = [*(id *)(a1 + 32) sceneHostEnvironmentObserver];
    if (objc_opt_respondsToSelector()) {
      [v1 didAddNewSceneHostEnvironment];
    }
  }
}

- (void)reevaluateAudioCategoriesDisablingVolumeHUD
{
  NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CSActivityItemViewController *)self _updateAudioCategoriesDisablingVolumeHUDWithReason:v3];
}

- (void)_backlightLuminanceDidChange
{
  NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CSActivityItemViewController *)self _updatePresentationModeWithReason:v3];
}

- (BOOL)_isContentVisibleAndAppeared
{
  BOOL v3 = [(CSActivityItemViewController *)self isContentVisible];
  if (v3)
  {
    LOBYTE(v3) = [(CSActivityItemViewController *)self isListAppeared];
  }
  return v3;
}

- (void)_updatePresentationModeWithReason:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(CSActivityItemViewController *)self _isContentVisibleAndAppeared];
  BOOL v6 = [(CSActivityItemViewController *)self isScreenOn];
  double v7 = [(CSActivityItemViewController *)self traitCollection];
  uint64_t v8 = [v7 _backlightLuminance];

  if (v8) {
    int v9 = 1;
  }
  else {
    int v9 = v6;
  }
  int v10 = v5 & v9;
  double v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      objc_super v12 = @"live";
    }
    else {
      objc_super v12 = @"live snapshot";
    }
    objc_super v13 = NSStringFromBOOL();
    v14 = NSStringFromBOOL();
    int v16 = 138413314;
    v17 = v12;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Updating activity scene presentation mode to: %@, for reason: %@, for screen on: %@, appeared: %@, backlight luminance: %ld", (uint8_t *)&v16, 0x34u);
  }
  if (v10) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }

  [(CSActivityItemViewController *)self setPresentationMode:v15];
}

- (void)_updateAudioCategoriesDisablingVolumeHUDWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CSActivityItemViewController *)self _isContentVisibleAndAppeared])
  {
    BOOL v5 = [(ACUISActivityHostViewController *)self->_activityHostViewController audioCategoriesDisablingVolumeHUD];
    if (v5)
    {
      BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
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
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v6);
    double v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543874;
      int v10 = self;
      __int16 v11 = 2114;
      objc_super v12 = v6;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating audioCategoriesDisablingVolumeHUD to '%{public}@' for reason: %{public}@", (uint8_t *)&v9, 0x20u);
    }

    uint64_t v8 = [(CSActivityItemViewController *)self delegate];
    [v8 activityItemViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:self];
  }
}

- (void)_invalidateRestrictsTouchesAssertion
{
  [(BSInvalidatable *)self->_restrictsTouchesAssertion invalidate];
  restrictsTouchesAssertion = self->_restrictsTouchesAssertion;
  self->_restrictsTouchesAssertion = 0;
}

- (void)notificationListSupplementaryViewPresentableContentWillBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSActivityItemViewController setContentVisible:](self, "setContentVisible:");
  [(ACUISActivityHostViewController *)self->_activityHostViewController setVisibility:v3];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CSActivityItemViewController *)self _updatePresentationModeWithReason:v6];
  [(CSActivityItemViewController *)self _updateAudioCategoriesDisablingVolumeHUDWithReason:v6];
}

- (CGSize)contentSizeForContentView:(id)a3
{
  [(ACUISActivityHostViewController *)self->_activityHostViewController preferredContentSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v7 = [(ACUISActivityHostViewController *)self->_activityHostViewController activitySceneDescriptor];
    uint64_t v8 = [v7 metricsRequest];

    int v9 = [v8 lockScreenMetrics];
    [v9 initialSize];
    double v11 = v10;
    double v13 = v12;

    double v4 = v11;
    double v5 = v13;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    NSStringFromSelector(a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CSActivityItemViewController *)self _updatePresentationModeWithReason:v4];
  }
}

- (void)setListAppeared:(BOOL)a3
{
  if (self->_listAppeared != a3)
  {
    self->_listAppeared = a3;
    NSStringFromSelector(a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CSActivityItemViewController *)self _updatePresentationModeWithReason:v4];
    [(CSActivityItemViewController *)self _updateAudioCategoriesDisablingVolumeHUDWithReason:v4];
  }
}

- (void)restrictsTouchesOnHostedScene:(BOOL)a3
{
  if (a3)
  {
    if (!self->_restrictsTouchesAssertion)
    {
      id v4 = [(ACUISActivityHostViewController *)self->_activityHostViewController cancelTouchesForCurrentEventInHostedContent];
      restrictsTouchesAssertion = self->_restrictsTouchesAssertion;
      self->_restrictsTouchesAssertion = v4;
      MEMORY[0x1F41817F8](v4, restrictsTouchesAssertion);
    }
  }
  else
  {
    [(CSActivityItemViewController *)self _invalidateRestrictsTouchesAssertion];
  }
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  BOOL v3 = [(ACUISActivityHostViewController *)self->_activityHostViewController backlightHostEnvironment];
  if (v3)
  {
    id v4 = [(ACUISActivityHostViewController *)self->_activityHostViewController activitySceneDescriptor];
    double v5 = [v4 activityDescriptor];
    id v6 = [v5 platterTargetBundleIdentifier];

    double v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [MEMORY[0x1E4FA5EB0] entryWithSceneHostEnvironment:v3 bundleIdentifier:v6];
    int v9 = [v7 setWithObject:v8];
  }
  else
  {
    int v9 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v9;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)isListAppeared
{
  return self->_listAppeared;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (CSActivityItemViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSActivityItemViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSListItemSceneHostEnvironmentObserving)sceneHostEnvironmentObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostEnvironmentObserver);

  return (CSListItemSceneHostEnvironmentObserving *)WeakRetained;
}

- (void)setSceneHostEnvironmentObserver:(id)a3
{
}

- (ACUISActivityHostViewController)activityHostViewController
{
  return self->_activityHostViewController;
}

- (void)setActivityHostViewController:(id)a3
{
}

- (BSInvalidatable)restrictsTouchesAssertion
{
  return self->_restrictsTouchesAssertion;
}

- (void)setRestrictsTouchesAssertion:(id)a3
{
}

- (BOOL)isContentVisible
{
  return self->_contentVisible;
}

- (void)setContentVisible:(BOOL)a3
{
  self->_contentVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictsTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_activityHostViewController, 0);
  objc_destroyWeak((id *)&self->_sceneHostEnvironmentObserver);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
}

@end