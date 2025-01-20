@interface QLScreenTimeItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (NSString)bundleIdentifier;
- (NSString)categoryIdentifier;
- (QLScreenTimeItemViewController)initWithBundleIdentifier:(id)a3;
- (QLScreenTimeItemViewController)initWithCategoryIdentifier:(id)a3;
- (STBlockingViewController)blockingViewController;
- (int64_t)policy;
- (void)_updateBlockingViewControllerWithCurrentPolicy;
- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)setBlockingViewController:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)showBlockingViewControllerWithPolicy:(int64_t)a3;
@end

@implementation QLScreenTimeItemViewController

- (QLScreenTimeItemViewController)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLScreenTimeItemViewController;
  v6 = [(QLItemViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (QLScreenTimeItemViewController)initWithCategoryIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLScreenTimeItemViewController;
  v6 = [(QLItemViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_categoryIdentifier, a3);
  }

  return v7;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263F825C8];
  v7 = (void (**)(id, void))a5;
  v8 = [v6 clearColor];
  objc_super v9 = [(QLScreenTimeItemViewController *)self view];
  [v9 setBackgroundColor:v8];

  double Helper_x8__OBJC_CLASS___STBlockingViewController = gotLoadHelper_x8__OBJC_CLASS___STBlockingViewController(v10);
  v13 = (STBlockingViewController *)objc_msgSend(*(id *)(v12 + 1024), "newTranslucentBlockingViewController", Helper_x8__OBJC_CLASS___STBlockingViewController);
  blockingViewController = self->_blockingViewController;
  self->_blockingViewController = v13;

  [(QLScreenTimeItemViewController *)self addChildViewController:self->_blockingViewController];
  v15 = [(QLScreenTimeItemViewController *)self view];
  v16 = [(STBlockingViewController *)self->_blockingViewController view];
  [v15 addSubview:v16];

  [(STBlockingViewController *)self->_blockingViewController didMoveToParentViewController:self];
  v17 = [(STBlockingViewController *)self->_blockingViewController view];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(QLScreenTimeItemViewController *)self view];
  v19 = (void *)MEMORY[0x263F08938];
  v30 = @"lockoutView";
  v20 = [(STBlockingViewController *)self->_blockingViewController view];
  v31[0] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v22 = [v19 constraintsWithVisualFormat:@"H:|[lockoutView]|" options:0 metrics:0 views:v21];
  [v18 addConstraints:v22];

  v23 = [(QLScreenTimeItemViewController *)self view];
  v24 = (void *)MEMORY[0x263F08938];
  v28 = @"lockoutView";
  v25 = [(STBlockingViewController *)self->_blockingViewController view];
  v29 = v25;
  v26 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v27 = [v24 constraintsWithVisualFormat:@"V:|[lockoutView]|" options:0 metrics:0 views:v26];
  [v23 addConstraints:v27];

  v7[2](v7, 0);
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (void)showBlockingViewControllerWithPolicy:(int64_t)a3
{
  if (self->_policy != a3)
  {
    self->_policy = a3;
    [(QLScreenTimeItemViewController *)self _updateBlockingViewControllerWithCurrentPolicy];
    if (self->_policy)
    {
      blockingViewController = self->_blockingViewController;
      [(STBlockingViewController *)blockingViewController showWithAnimation:1 completionHandler:0];
    }
  }
}

- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3
{
  self->_policy = 0;
}

- (void)_updateBlockingViewControllerWithCurrentPolicy
{
  if (self->_policy)
  {
    if (self->_bundleIdentifier)
    {
      -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:](self->_blockingViewController, "updateAppearanceUsingPolicy:forBundleIdentifier:");
    }
    else if (self->_categoryIdentifier)
    {
      -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:](self->_blockingViewController, "updateAppearanceUsingPolicy:forCategoryIdentifier:");
    }
  }
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (STBlockingViewController)blockingViewController
{
  return self->_blockingViewController;
}

- (void)setBlockingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingViewController, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end