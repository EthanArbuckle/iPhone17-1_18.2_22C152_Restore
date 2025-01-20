@interface HSPCMVVMShellViewController
- (HSPCMVVMShellViewController)initWithTableViewStyle:(int64_t)a3 moduleCreator:(id)a4 moduleControllerBuilder:(id)a5;
- (HUPRXItemModuleTableViewController)mvvmController;
- (void)performPRXLayoutPass;
- (void)setMvvmController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCMVVMShellViewController

- (HSPCMVVMShellViewController)initWithTableViewStyle:(int64_t)a3 moduleCreator:(id)a4 moduleControllerBuilder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[HUPRXItemModuleTableViewController alloc] initWithTableViewStyle:a3 moduleCreator:v9 moduleControllerBuilder:v8];

  id v11 = objc_alloc((Class)PRXScrollableContentView);
  v12 = [(HUPRXItemModuleTableViewController *)v10 tableView];
  id v13 = [v11 initWithCardStyle:0 scrollView:v12];

  v17.receiver = self;
  v17.super_class = (Class)HSPCMVVMShellViewController;
  v14 = [(HSPCMVVMShellViewController *)&v17 initWithContentView:v13];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_mvvmController, v10);
  }

  return v15;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCMVVMShellViewController;
  [(HSPCMVVMShellViewController *)&v5 viewDidLoad];
  v3 = [(HSPCMVVMShellViewController *)self mvvmController];
  [(HSPCMVVMShellViewController *)self addChildViewController:v3];

  v4 = [(HSPCMVVMShellViewController *)self mvvmController];
  [v4 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HSPCMVVMShellViewController;
  [(HSPCMVVMShellViewController *)&v9 viewWillAppear:a3];
  v4 = [(HSPCMVVMShellViewController *)self mvvmController];
  objc_super v5 = [v4 tableView];

  v6 = +[UIColor systemBackgroundColor];
  [v5 setBackgroundColor:v6];

  v7 = +[UIColor systemBackgroundColor];
  id v8 = [v5 backgroundView];
  [v8 setBackgroundColor:v7];

  if ([v5 style] == (id)2)
  {
    [v5 _setTopPadding:0.0];
    [v5 _setBottomPadding:0.0];
  }
  [(HSPCMVVMShellViewController *)self performPRXLayoutPass];
}

- (void)performPRXLayoutPass
{
  v3 = [(HSPCMVVMShellViewController *)self mvvmController];
  v4 = [v3 tableView];
  [v4 layoutIfNeeded];

  objc_super v5 = [(HSPCMVVMShellViewController *)self contentView];
  [v5 setNeedsUpdateConstraints];

  id v7 = [(HSPCMVVMShellViewController *)self view];
  [v7 bounds];
  [(HSPCMVVMShellViewController *)self updatePreferredContentSizeForCardWidth:v6];
}

- (HUPRXItemModuleTableViewController)mvvmController
{
  return self->_mvvmController;
}

- (void)setMvvmController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end