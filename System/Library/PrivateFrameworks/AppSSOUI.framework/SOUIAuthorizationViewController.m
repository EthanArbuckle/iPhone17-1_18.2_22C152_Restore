@interface SOUIAuthorizationViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)shouldAutorotate;
- (SOUIAuthorizationViewController)initWithExtensionViewController:(id)a3 hints:(id)a4;
- (SOUIAuthorizationViewControllerDelegate)delegate;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)dismissCompletionHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancel;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SOUIAuthorizationViewController

- (SOUIAuthorizationViewController)initWithExtensionViewController:(id)a3 hints:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v23 = "-[SOUIAuthorizationViewController initWithExtensionViewController:hints:]";
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2113;
    id v27 = v8;
    __int16 v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_22F4E7000, v9, OS_LOG_TYPE_DEFAULT, "%s extensionViewController = %{public}@, hints = %{private}@ on %@", buf, 0x2Au);
  }

  v21.receiver = self;
  v21.super_class = (Class)SOUIAuthorizationViewController;
  v10 = [(SOUIAuthorizationViewController *)&v21 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_extensionViewController, a3);
    v12 = [v8 objectForKeyedSubscript:&unk_26E2BE1C8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 integerValue];
      int v14 = v13;
      uint64_t v15 = v13 + 2;
      if (unint64_t)(v13 + 2) < 0xB && ((0x7FDu >> v15))
      {
        uint64_t v17 = qword_22F4E9010[v15];
        goto LABEL_11;
      }
      v16 = SO_LOG_SOUIAuthorizationViewController();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v14;
        _os_log_impl(&dword_22F4E7000, v16, OS_LOG_TYPE_INFO, "unsupported UIModalPresentationStyle (%d) specified, using default", buf, 8u);
      }
    }
    uint64_t v17 = 2;
LABEL_11:
    [(SOUIAuthorizationViewController *)v11 setModalPresentationStyle:v17];
    v18 = [MEMORY[0x263F1CBC8] keyWindow];
    v19 = [v18 _rootSheetPresentationController];
    [v19 _setShouldScaleDownBehindDescendantSheets:0];
  }
  return v11;
}

- (void)loadView
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315394;
    v31 = "-[SOUIAuthorizationViewController loadView]";
    __int16 v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_22F4E7000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v30, 0x16u);
  }

  v4 = objc_opt_new();
  [(SOUIAuthorizationViewController *)self setView:v4];

  v5 = [MEMORY[0x263F1C550] clearColor];
  v6 = [(SOUIAuthorizationViewController *)self view];
  [v6 setBackgroundColor:v5];

  [(SOUIAuthorizationViewController *)self addChildViewController:self->_extensionViewController];
  id v7 = [(SOUIAuthorizationViewController *)self view];
  id v8 = [(UIViewController *)self->_extensionViewController view];
  [v7 addSubview:v8];

  v9 = [(UIViewController *)self->_extensionViewController view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(UIViewController *)self->_extensionViewController view];
  v11 = [v10 topAnchor];
  v12 = [(SOUIAuthorizationViewController *)self view];
  uint64_t v13 = [v12 topAnchor];
  int v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  uint64_t v15 = [(UIViewController *)self->_extensionViewController view];
  v16 = [v15 bottomAnchor];
  uint64_t v17 = [(SOUIAuthorizationViewController *)self view];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(UIViewController *)self->_extensionViewController view];
  objc_super v21 = [v20 leadingAnchor];
  v22 = [(SOUIAuthorizationViewController *)self view];
  v23 = [v22 leadingAnchor];
  __int16 v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  id v25 = [(UIViewController *)self->_extensionViewController view];
  __int16 v26 = [v25 trailingAnchor];
  id v27 = [(SOUIAuthorizationViewController *)self view];
  __int16 v28 = [v27 trailingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  [(UIViewController *)self->_extensionViewController didMoveToParentViewController:self];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_264A0A4D8;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)SOUIAuthorizationViewController;
  id v7 = v6;
  [(SOUIAuthorizationViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dismissCompletionHandler];

  if (v2)
  {
    v3 = SO_LOG_SOUIAuthorizationViewController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke_cold_1(v3);
    }

    BOOL v4 = [*(id *)(a1 + 32) dismissCompletionHandler];
    v4[2]();

    [*(id *)(a1 + 32) setDismissCompletionHandler:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidLoad
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[SOUIAuthorizationViewController viewDidLoad]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_22F4E7000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  [(SOUIAuthorizationViewController *)&v6 viewDidLoad];
  BOOL v4 = objc_opt_new();
  [v4 setDelegate:self];
  v5 = [(SOUIAuthorizationViewController *)self view];
  [v5 addGestureRecognizer:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[SOUIAuthorizationViewController viewWillAppear:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_22F4E7000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  [(SOUIAuthorizationViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[SOUIAuthorizationViewController viewDidAppear:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_22F4E7000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  [(SOUIAuthorizationViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[SOUIAuthorizationViewController viewWillDisappear:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_22F4E7000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  [(SOUIAuthorizationViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOUIAuthorizationViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[SOUIAuthorizationViewController viewDidDisappear:]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_22F4E7000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  [(SOUIAuthorizationViewController *)&v6 viewDidDisappear:v3];
  [(SOUIAuthorizationViewController *)self _cancel];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_extensionViewController;
}

- (void)_cancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (objc_opt_respondsToSelector())
    {
      objc_storeWeak((id *)p_delegate, 0);
      [v5 viewControllerDidCancel:self];
    }
  }

  MEMORY[0x270F9A790]();
}

- (SOUIAuthorizationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SOUIAuthorizationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_extensionViewController, 0);
}

void __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22F4E7000, log, OS_LOG_TYPE_DEBUG, "dismissing _UIFallbackPresentationViewController", v1, 2u);
}

@end