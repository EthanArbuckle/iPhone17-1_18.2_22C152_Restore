@interface CKModernSettingsViewController
- (UIViewController)settingsViewController;
- (void)setSettingsViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKModernSettingsViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CKModernSettingsViewController;
  [(CKModernSettingsViewController *)&v9 viewDidLoad];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v3 = (void *)getCKSettingsHostingViewControllerClass_softClass;
  uint64_t v14 = getCKSettingsHostingViewControllerClass_softClass;
  if (!getCKSettingsHostingViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getCKSettingsHostingViewControllerClass_block_invoke;
    v10[3] = &unk_2644F0D88;
    v10[4] = &v11;
    __getCKSettingsHostingViewControllerClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = v3;
  _Block_object_dispose(&v11, 8);
  if (v4)
  {
    v5 = (UIViewController *)objc_alloc_init(v4);
    [(CKModernSettingsViewController *)self addChildViewController:v5];
    v6 = [(CKModernSettingsViewController *)self view];
    v7 = [(UIViewController *)v5 view];
    [v6 addSubview:v7];

    [(UIViewController *)v5 didMoveToParentViewController:self];
    settingsViewController = self->_settingsViewController;
    self->_settingsViewController = v5;
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKModernSettingsViewController;
  [(CKModernSettingsViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(CKModernSettingsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(UIViewController *)self->_settingsViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end