@interface _UIViewServiceViewController
- (UINavigationController)containedNavController;
- (_UIViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)hostingViewController;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setContainedNavController:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation _UIViewServiceViewController

- (_UIViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewServiceViewController;
  v8 = [(_UIViewServiceViewController *)&v17 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = objc_alloc_init(_UIPreferredContentSizeRelayingNavigationController);
    objc_initWeak(&location, v8);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __55___UIViewServiceViewController_initWithNibName_bundle___block_invoke;
    v14 = &unk_26492D1E8;
    objc_copyWeak(&v15, &location);
    [(_UIPreferredContentSizeRelayingNavigationController *)v9 setPreferredContentSizeDidChange:&v11];
    -[_UIViewServiceViewController setContainedNavController:](v8, "setContainedNavController:", v9, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)setContainedNavController:(id)a3
{
  p_containedNavController = &self->_containedNavController;
  objc_storeStrong((id *)&self->_containedNavController, a3);
  id v9 = a3;
  [v9 setDelegate:self];
  [(UINavigationController *)*p_containedNavController beginAppearanceTransition:1 animated:0];
  id v6 = [(UINavigationController *)*p_containedNavController view];
  [v6 setAutoresizingMask:18];

  [(_UIViewServiceViewController *)self addChildViewController:*p_containedNavController];
  id v7 = [(_UIViewServiceViewController *)self view];
  v8 = [(UINavigationController *)*p_containedNavController view];
  [v7 addSubview:v8];

  [(UINavigationController *)*p_containedNavController didMoveToParentViewController:self];
  [(UINavigationController *)*p_containedNavController endAppearanceTransition];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)_UIViewServiceViewController;
  [(_UIViewServiceViewController *)&v2 viewDidLayoutSubviews];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v5 = cdui_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_UIViewServiceViewController preferredContentSizeDidChangeForChildContentContainer:](v4, v5);
  }

  [v4 preferredContentSize];
  -[_UIViewServiceViewController _updatedContentSizeForPreferredContentSize:](self, "_updatedContentSizeForPreferredContentSize:");
  -[_UIViewServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a3;
  [a4 preferredContentSize];
  objc_msgSend(v6, "setPreferredContentSize:");
}

- (id)hostingViewController
{
  return self->_hostingViewController;
}

- (UINavigationController)containedNavController
{
  return self->_containedNavController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedNavController, 0);

  objc_storeStrong(&self->_hostingViewController, 0);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a1 preferredContentSize];
  v3 = NSStringFromCGSize(v7);
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_22CA47000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] requesting content size %@", (uint8_t *)&v4, 0xCu);
}

@end