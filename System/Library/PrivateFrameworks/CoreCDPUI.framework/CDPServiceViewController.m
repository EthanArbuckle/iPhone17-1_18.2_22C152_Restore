@interface CDPServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (unint64_t)supportedInterfaceOrientations;
- (void)offsetForCurrentKeyboard:(id)a3;
- (void)viewDidLoad;
@end

@implementation CDPServiceViewController

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)CDPServiceViewController;
  [(CDPServiceViewController *)&v22 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F5FC30]);
  v4 = objc_alloc_init(CDPRemoteUILocalSecretEntryViewController);
  v5 = [(CDPRemoteUILocalSecretEntryViewController *)v4 navigationItem];
  [v5 setAccessibilityIdentifier:@"local-secret-entry-view"];

  [v3 showController:v4];
  p_contentViewController = &self->_contentViewController;
  objc_storeStrong((id *)&self->_contentViewController, v3);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v7 = (void *)getBFFStyleClass_softClass_2;
  uint64_t v27 = getBFFStyleClass_softClass_2;
  if (!getBFFStyleClass_softClass_2)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __getBFFStyleClass_block_invoke_2;
    v23[3] = &unk_26433D708;
    v23[4] = &v24;
    __getBFFStyleClass_block_invoke_2((uint64_t)v23);
    v7 = (void *)v25[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v24, 8);
  v9 = [v8 sharedStyle];
  [v9 applyThemeToNavigationController:v3];

  [(UIViewController *)*p_contentViewController willMoveToParentViewController:self];
  [(CDPServiceViewController *)self addChildViewController:*p_contentViewController];
  v10 = [(CDPServiceViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(UIViewController *)*p_contentViewController view];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v20 = [(CDPServiceViewController *)self view];
  v21 = [(UIViewController *)*p_contentViewController view];
  [v20 addSubview:v21];

  [(UIViewController *)*p_contentViewController didMoveToParentViewController:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(UIViewController *)self->_contentViewController supportedInterfaceOrientations];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA4AE20];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA38620];
}

- (void)offsetForCurrentKeyboard:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke;
    v10[3] = &unk_26433DDC8;
    id v6 = v4;
    id v11 = v6;
    v7 = [(CDPServiceViewController *)self _remoteViewControllerProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke_2;
    v8[3] = &unk_26433DDF0;
    id v9 = v6;
    [v7 hostKeyboardOffset:v8];
  }
}

uint64_t __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t __53__CDPServiceViewController_offsetForCurrentKeyboard___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 floatValue];
  v3.n128_f64[0] = v3.n128_f32[0];
  id v4 = *(uint64_t (**)(uint64_t, __n128))(v2 + 16);

  return v4(v2, v3);
}

- (void).cxx_destruct
{
}

@end