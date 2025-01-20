@interface AAUIBaseDetailViewController
- (AAUIBaseDetailViewController)init;
- (void)_setupNavigationBarButtons;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIBaseDetailViewController

- (AAUIBaseDetailViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIBaseDetailViewController;
  return [(AAUIBaseDetailViewController *)&v3 init];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIBaseDetailViewController;
  [(AAUIBaseDetailViewController *)&v3 viewDidLoad];
  [(AAUIBaseDetailViewController *)self _setupNavigationBarButtons];
}

- (void)_setupNavigationBarButtons
{
  id v3 = [(AAUIBaseDetailViewController *)self navigationItem];
  if (([(AAUIBaseDetailViewController *)self isPresentedAsModalSheet] & 1) == 0) {
    [v3 setRightBarButtonItem:0];
  }
  [(AAUIBaseDetailViewController *)self setCancelButton:0];
  [v3 setLeftBarButtonItem:0];
  [v3 setHidesBackButton:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AAUIBaseDetailViewController;
  [(AAUIBaseDetailViewController *)&v21 viewWillAppear:a3];
  v4 = [(AAUIBaseDetailViewController *)self specifier];
  v5 = [v4 propertyForKey:PSAppSettingsBundleIDKey];

  v6 = [*(id *)&self->ACUIAccountConfigurationViewController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:ACUIAccountKey];
  v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_48AF8((uint64_t)v5, (uint64_t)v6, v7);
  }

  v8 = [[AAUIBaseDataclassDetailViewController alloc] initWithBundleID:v5 account:v6];
  [(AAUIBaseDetailViewController *)self addChildViewController:v8];
  v9 = [(AAUIBaseDetailViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(AAUIBaseDataclassDetailViewController *)v8 view];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(AAUIBaseDetailViewController *)self view];
  v20 = [(AAUIBaseDataclassDetailViewController *)v8 view];
  [v19 addSubview:v20];

  [(AAUIBaseDataclassDetailViewController *)v8 didMoveToParentViewController:self];
}

@end