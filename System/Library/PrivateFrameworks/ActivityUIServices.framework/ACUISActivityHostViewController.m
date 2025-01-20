@interface ACUISActivityHostViewController
- (ACUISActivityHostViewController)activityHostViewControllerWithViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4;
- (ACUISActivityHostViewController)activityHostViewControllerWithViewController:(id)a3 requestsLaunchWithAction:(id)a4;
- (ACUISActivityHostViewController)initWithActivityHostViewController:(id)a3;
- (ACUISActivityHostViewControllerDelegate)delegate;
- (ACUISActivitySceneDescriptor)activitySceneDescriptor;
- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment;
- (BOOL)_canShowWhileLocked;
- (BOOL)idleTimerDisabled;
- (NSArray)audioCategoriesDisablingVolumeHUD;
- (NSArray)hostIgnoredTouchedRects;
- (NSString)activityIdentifier;
- (UIColor)backgroundTintColor;
- (UIColor)textColor;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (unint64_t)presentationMode;
- (unint64_t)visibility;
- (unsigned)swiftPresentationMode:(unint64_t)a3;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController:(id)a3;
- (void)activityHostViewControllerBackgroundTintColorDidChangeWithViewController:(id)a3;
- (void)activityHostViewControllerHostShouldCancelTouchesWithViewController:(id)a3;
- (void)activityHostViewControllerSignificantUserInteractionBeganWithViewController:(id)a3;
- (void)activityHostViewControllerSignificantUserInteractionEndedWithViewController:(id)a3;
- (void)activityHostViewControllerTextColorDidChangeWithViewController:(id)a3;
- (void)dealloc;
- (void)ensureContent:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setShouldShareTouchesWithHost:(BOOL)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation ACUISActivityHostViewController

- (ACUISActivityHostViewController)initWithActivityHostViewController:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivityHostViewController;
  v6 = [(ACUISActivityHostViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityHostViewController, a3);
    [(ActivityHostViewController *)v7->_activityHostViewController setDelegate:v7];
    v8 = [ACUISActivitySceneDescriptor alloc];
    v9 = [v5 activitySceneDescriptor];
    v10 = [v5 acActivityDescriptor];
    uint64_t v11 = [(ACUISActivitySceneDescriptor *)v8 initWithActivitySceneDescriptor:v9 acActivityDescriptor:v10];
    activitySceneDescriptor = v7->_activitySceneDescriptor;
    v7->_activitySceneDescriptor = (ACUISActivitySceneDescriptor *)v11;

    if (v5) {
      [(ACUISActivitySceneDescriptor *)v7->_activitySceneDescriptor setUseFallbackMetrics:1];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(ACUISActivityHostViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ACUISActivityHostViewController;
  [(ACUISActivityHostViewController *)&v3 dealloc];
}

- (NSString)activityIdentifier
{
  v2 = [(ACUISActivitySceneDescriptor *)self->_activitySceneDescriptor activityDescriptor];
  objc_super v3 = [v2 activityIdentifier];

  return (NSString *)v3;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  return [(ActivityHostViewController *)self->_activityHostViewController cancelTouchesForCurrentEventInHostedContent];
}

- (UIColor)backgroundTintColor
{
  return [(ActivityHostViewController *)self->_activityHostViewController backgroundTintColor];
}

- (UIColor)textColor
{
  return [(ActivityHostViewController *)self->_activityHostViewController textColor];
}

- (NSArray)hostIgnoredTouchedRects
{
  return [(ActivityHostViewController *)self->_activityHostViewController activityTouchRestrictedRects];
}

- (BOOL)idleTimerDisabled
{
  return [(ActivityHostViewController *)self->_activityHostViewController idleTimerDisabled];
}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  return [(ActivityHostViewController *)self->_activityHostViewController audioCategoriesDisablingVolumeHUD];
}

- (void)setVisibility:(unint64_t)a3
{
  if (self->_visibility != a3) {
    self->_visibility = a3;
  }
}

- (unint64_t)presentationMode
{
  unsigned int v2 = [(ActivityHostViewController *)self->_activityHostViewController presentationMode];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  uint64_t v4 = [(ACUISActivityHostViewController *)self swiftPresentationMode:a3];
  activityHostViewController = self->_activityHostViewController;
  [(ActivityHostViewController *)activityHostViewController setPresentationMode:v4];
}

- (void)invalidate
{
  activityHostViewController = self->_activityHostViewController;
  if (activityHostViewController)
  {
    [(ActivityHostViewController *)activityHostViewController invalidate];
    [(ACUISActivityHostViewController *)self bs_removeChildViewController:self->_activityHostViewController];
    uint64_t v4 = self->_activityHostViewController;
    self->_activityHostViewController = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  [(ActivityHostViewController *)self->_activityHostViewController preferredContentSize];
  -[ACUISActivityHostViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidLoad
{
  [(ACUISActivityHostViewController *)self bs_addChildViewController:self->_activityHostViewController];
  [(ActivityHostViewController *)self->_activityHostViewController preferredContentSize];
  -[ACUISActivityHostViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v3.receiver = self;
  v3.super_class = (Class)ACUISActivityHostViewController;
  [(ACUISActivityHostViewController *)&v3 viewDidLoad];
}

- (void)ensureContent:(double)a3 queue:(id)a4 completion:(id)a5
{
}

- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment
{
  return [(ActivityHostViewController *)self->_activityHostViewController backlightHostEnvironment];
}

- (ACUISActivityHostViewController)activityHostViewControllerWithViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewController:self requestsLaunchWithAction:v7];
  }

  return result;
}

- (void)activityHostViewControllerBackgroundTintColorDidChangeWithViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewControllerBackgroundTintColorDidChange:self];
  }
}

- (void)activityHostViewControllerTextColorDidChangeWithViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewControllerTextColorDidChange:self];
  }
}

- (void)activityHostViewControllerHostShouldCancelTouchesWithViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewControllerHostShouldCancelTouches:self];
  }
}

- (void)activityHostViewControllerSignificantUserInteractionBeganWithViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewControllerSignificantUserInteractionBegan:self];
  }
}

- (void)activityHostViewControllerSignificantUserInteractionEndedWithViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewControllerSignificantUserInteractionEnded:self];
  }
}

- (ACUISActivityHostViewController)activityHostViewControllerWithViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewController:self didSetIdleTimerDisabled:v4];
  }

  return result;
}

- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:self];
  }
}

- (unsigned)swiftPresentationMode:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (ACUISActivitySceneDescriptor)activitySceneDescriptor
{
  return self->_activitySceneDescriptor;
}

- (ACUISActivityHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACUISActivityHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activitySceneDescriptor, 0);
  objc_storeStrong((id *)&self->_activityHostViewController, 0);
}

@end