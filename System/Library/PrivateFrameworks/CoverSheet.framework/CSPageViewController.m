@interface CSPageViewController
+ (BOOL)isAvailableForConfiguration;
+ (Class)viewClass;
+ (unint64_t)requiredCapabilities;
- (BOOL)authenticated;
- (BOOL)isTransitioning;
- (CSCoverSheetViewControllerProtocol)coverSheetViewController;
- (CSLayoutStrategy)layoutStrategy;
- (CSPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)requestedDismissalSettings;
- (id)view;
- (int64_t)participantState;
- (int64_t)presentationAltitude;
- (int64_t)requestedDismissalType;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)didTransitionToVisible:(BOOL)a3;
- (void)handleAction:(id)a3 fromSender:(id)a4;
- (void)setCoverSheetViewController:(id)a3;
- (void)setLayoutStrategy:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)viewDidLoad;
- (void)willTransitionToVisible:(BOOL)a3;
@end

@implementation CSPageViewController

- (void)aggregateBehavior:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CSPageViewController;
  [(CSPresentationViewController *)&v3 aggregateBehavior:a3];
}

- (int64_t)participantState
{
  if ([(CSCoverSheetViewControllerBase *)self isDisappeared]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (CSPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CSPageViewController;
  return [(CSPresentationViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)CSPageViewController;
  v2 = [(CSPageViewController *)&v4 view];

  return v2;
}

- (void)willTransitionToVisible:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    v6 = NSStringFromBOOL();
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will transition to visible %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)didTransitionToVisible:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    v6 = NSStringFromBOOL();
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ did transition to visible %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (int64_t)requestedDismissalType
{
  return 0;
}

- (id)requestedDismissalSettings
{
  return 0;
}

- (void)viewDidLoad
{
  objc_super v3 = [(CSPageViewController *)self view];
  [v3 setPageViewController:self];

  v4.receiver = self;
  v4.super_class = (Class)CSPageViewController;
  [(CSPresentationViewController *)&v4 viewDidLoad];
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CSPageViewController;
  [(CSPresentationViewController *)&v3 aggregateAppearance:a3];
}

- (int64_t)presentationAltitude
{
  return 2;
}

+ (BOOL)isAvailableForConfiguration
{
  return 1;
}

+ (unint64_t)requiredCapabilities
{
  return 0;
}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 1
    && ([(CSPresentationViewController *)self contentViewControllers],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 containsObject:v7],
        v8,
        v9))
  {
    [(CSPresentationViewController *)self dismissContentViewController:v7 animated:1];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CSPageViewController;
    [(CSCoverSheetViewControllerBase *)&v10 handleAction:v6 fromSender:v7];
  }
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void)setLayoutStrategy:(id)a3
{
}

- (CSCoverSheetViewControllerProtocol)coverSheetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);

  return (CSCoverSheetViewControllerProtocol *)WeakRetained;
}

- (void)setCoverSheetViewController:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStrategy, 0);

  objc_destroyWeak((id *)&self->_coverSheetViewController);
}

@end