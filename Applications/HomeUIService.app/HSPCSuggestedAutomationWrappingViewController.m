@interface HSPCSuggestedAutomationWrappingViewController
- (HSPCSuggestedAutomationWrappingViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSPCSuggestedAutomationsViewController)mvvmController;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (id)shouldSkip;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setMvvmController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCSuggestedAutomationWrappingViewController

- (HSPCSuggestedAutomationWrappingViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[HSPCSuggestedAutomationsViewController alloc] initWithCoordinator:v7 config:v8];
  [(HSPCSuggestedAutomationWrappingViewController *)self setMvvmController:v9];
  id v10 = objc_alloc((Class)PRXScrollableContentView);
  v11 = [(HSPCSuggestedAutomationsViewController *)v9 tableView];
  id v12 = [v10 initWithCardStyle:0 scrollView:v11];

  v20.receiver = self;
  v20.super_class = (Class)HSPCSuggestedAutomationWrappingViewController;
  v13 = [(HSPCSuggestedAutomationWrappingViewController *)&v20 initWithContentView:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = [v7 activeTuple];
    v16 = [v15 accessoryCategoryOrPrimaryServiceType];
    v17 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCSuggestedAutomationWrappingViewController *)v14 setTitle:v17];

    id v18 = [(HSPCSuggestedAutomationWrappingViewController *)v14 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v14 futureSelector:"commitConfiguration"];
  }

  return v14;
}

- (id)commitConfiguration
{
  v2 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
  v3 = [v2 commitConfiguration];

  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCSuggestedAutomationWrappingViewController;
  [(HSPCSuggestedAutomationWrappingViewController *)&v5 viewDidLoad];
  v3 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
  [(HSPCSuggestedAutomationWrappingViewController *)self addChildViewController:v3];

  v4 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
  [v4 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HSPCSuggestedAutomationWrappingViewController;
  [(HSPCSuggestedAutomationWrappingViewController *)&v9 viewWillAppear:a3];
  v4 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
  objc_super v5 = [v4 tableView];
  [v5 layoutIfNeeded];

  v6 = [(HSPCSuggestedAutomationWrappingViewController *)self contentView];
  [v6 setNeedsUpdateConstraints];

  id v7 = [(HSPCSuggestedAutomationWrappingViewController *)self view];
  [v7 bounds];
  [(HSPCSuggestedAutomationWrappingViewController *)self updatePreferredContentSizeForCardWidth:v8];
}

- (id)hu_preloadContent
{
  v2 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
  v3 = [v2 hu_preloadContent];

  return v3;
}

- (id)shouldSkip
{
  v3 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(HSPCSuggestedAutomationWrappingViewController *)self mvvmController];
    v6 = [v5 shouldSkip];
  }
  else
  {
    v6 = +[NAFuture futureWithResult:&__kCFBooleanFalse];
  }

  return v6;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSPCSuggestedAutomationsViewController)mvvmController
{
  return self->_mvvmController;
}

- (void)setMvvmController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mvvmController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end