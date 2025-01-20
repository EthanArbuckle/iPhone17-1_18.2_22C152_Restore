@interface CSFocusActivityViewController
+ (Class)viewClass;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isActivityIndicatorVisible;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)usesBackgroundView;
- (CSActivityPickerViewController)activityPickerViewController;
- (CSFocusActivityViewControllerDelegate)delegate;
- (FCActivityDescribing)activity;
- (NSArray)requiredVisualStyleCategories;
- (UIView)activityIndicator;
- (UIView)customFocusActivityPickerPresentingView;
- (id)_activityViewIfLoaded;
- (id)activityPickerViewControllerPresentingView:(id)a3;
- (id)activityPickerViewControllerRepresentedActivityForDismissal:(id)a3;
- (id)activityPickerViewControllerRepresentedActivityForPresentation:(id)a3;
- (void)_removeActivityViewIndicatorIfNecessary;
- (void)_updateActivityViewActivity;
- (void)_updateActivityViewBehavior;
- (void)_updateActivityViewLegibility;
- (void)_updatePreferredContentSize;
- (void)focusActivityViewIndicatorDidChangeToVisible:(BOOL)a3;
- (void)focusActivityViewIndicatorPressed:(id)a3;
- (void)presentFocusActivityPickerViewControllerFromView:(id)a3 coverSheetViewPresenting:(id)a4;
- (void)setActivity:(id)a3;
- (void)setContainerSize:(CGSize)a3;
- (void)setCustomFocusActivityPickerPresentingView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CSFocusActivityViewController

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CSFocusActivityViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidLoad];
  v3 = +[CSLockScreenDomain rootSettings];
  v4 = [v3 focusSettings];
  [v4 addKeyObserver:self];

  [(CSFocusActivityViewController *)self _updateActivityViewBehavior];
  [(CSFocusActivityViewController *)self _updateActivityViewActivity];
  [(CSFocusActivityViewController *)self _updateActivityViewLegibility];
  v5 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  [v5 setDelegate:self];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSFocusActivityViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillLayoutSubviews];
  v3 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  [(CSFocusActivityViewController *)self preferredContentSize];
  objc_msgSend(v3, "setSize:");
}

- (void)focusActivityViewIndicatorPressed:(id)a3
{
  objc_storeWeak((id *)&self->_customFocusActivityPickerPresentingView, 0);
  id v4 = +[CSAction actionWithType:12];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];
}

- (void)focusActivityViewIndicatorDidChangeToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSFocusActivityViewController *)self delegate];
  [v4 focusActivityViewIndicatorDidChangeToVisible:v3];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFocusActivityViewController;
  if ([(CSCoverSheetViewControllerBase *)&v9 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    uint64_t v6 = [v4 type];
    switch(v6)
    {
      case 25:
        if (!self->_activity)
        {
          v7 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
          [v7 removeIndicator];
        }
        break;
      case 2:
        [(CSFocusActivityViewController *)self _updateActivityViewBehavior];
        break;
      case 1:
        [(CSFocusActivityViewController *)self _updateActivityViewLegibility];
        break;
    }
    char v5 = 0;
  }

  return v5;
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    [(CSFocusActivityViewController *)self _updatePreferredContentSize];
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)usesBackgroundView
{
  return 0;
}

- (id)activityPickerViewControllerPresentingView:(id)a3
{
  id v4 = [(CSFocusActivityViewController *)self customFocusActivityPickerPresentingView];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(CSFocusActivityViewController *)self activityIndicator];
  }
  v7 = v6;

  return v7;
}

- (id)activityPickerViewControllerRepresentedActivityForPresentation:(id)a3
{
  return self->_activity;
}

- (id)activityPickerViewControllerRepresentedActivityForDismissal:(id)a3
{
  return self->_activity;
}

- (BOOL)isActivityIndicatorVisible
{
  v2 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  char v3 = [v2 isActivityIndicatorVisible];

  return v3;
}

- (void)setActivity:(id)a3
{
  char v5 = (FCActivityDescribing *)a3;
  p_activity = &self->_activity;
  if (self->_activity != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_activity, a3);
    [(CSFocusActivityViewController *)self _updateActivityViewActivity];
    p_activity = (FCActivityDescribing **)[(CSFocusActivityViewController *)self _removeActivityViewIndicatorIfNecessary];
    char v5 = v7;
  }

  MEMORY[0x1F41817F8](p_activity, v5);
}

- (UIView)activityIndicator
{
  v2 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  char v3 = [v2 activityIndicator];

  return (UIView *)v3;
}

- (CSActivityPickerViewController)activityPickerViewController
{
  p_activityPickerViewController = &self->_activityPickerViewController;
  WeakRetained = (CSActivityPickerViewController *)objc_loadWeakRetained((id *)&self->_activityPickerViewController);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(CSActivityPickerViewController);
    [(CSActivityPickerViewController *)WeakRetained setDelegate:self];
    objc_storeWeak((id *)p_activityPickerViewController, WeakRetained);
  }

  return WeakRetained;
}

- (void)_updatePreferredContentSize
{
  +[CSFocusActivityView activityViewSize];
  double width = self->_containerSize.width;

  [(CSFocusActivityViewController *)self setPreferredContentSize:width];
}

- (void)presentFocusActivityPickerViewControllerFromView:(id)a3 coverSheetViewPresenting:(id)a4
{
  p_customFocusActivityPickerPresentingView = &self->_customFocusActivityPickerPresentingView;
  id v7 = a4;
  objc_storeWeak((id *)p_customFocusActivityPickerPresentingView, a3);
  id v8 = +[CSAction actionWithType:12];
  [v7 handleAction:v8 fromSender:self];
}

- (void)_updateActivityViewBehavior
{
  char v3 = [(CSCoverSheetViewControllerBase *)self activeBehavior];
  int v4 = [v3 areRestrictedCapabilities:0x400000];

  char v5 = +[CSLockScreenDomain rootSettings];
  id v6 = [v5 focusSettings];
  int v7 = [v6 gatesOnControlCenterAccess];

  id v8 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  [v8 setEnabled:v4 & v7 ^ 1u];
}

- (void)_updateActivityViewActivity
{
  id v3 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  [v3 setActivity:self->_activity];
}

- (void)_updateActivityViewLegibility
{
  id v5 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
  id v3 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  int v4 = [v3 legibilitySettings];
  [v5 setLegibilitySettings:v4];
}

- (void)_removeActivityViewIndicatorIfNecessary
{
  id v3 = [(CSFocusActivityViewController *)self activityPickerViewController];
  int v4 = [v3 _appearState];

  if (v4 != 2 && !self->_activity)
  {
    id v5 = [(CSFocusActivityViewController *)self _activityViewIfLoaded];
    [v5 removeIndicator];
  }
}

- (id)_activityViewIfLoaded
{
  v2 = [(CSFocusActivityViewController *)self viewIfLoaded];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([a4 isEqualToString:@"gatesOnControlCenterAccess"])
  {
    [(CSFocusActivityViewController *)self _updateActivityViewBehavior];
  }
}

- (FCActivityDescribing)activity
{
  return self->_activity;
}

- (CSFocusActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSFocusActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)customFocusActivityPickerPresentingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customFocusActivityPickerPresentingView);

  return (UIView *)WeakRetained;
}

- (void)setCustomFocusActivityPickerPresentingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customFocusActivityPickerPresentingView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_destroyWeak((id *)&self->_activityPickerViewController);
}

@end