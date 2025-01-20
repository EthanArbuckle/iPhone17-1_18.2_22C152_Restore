@interface VNDocumentCameraViewController
+ (BOOL)isSupported;
+ (id)newDefaultViewController;
+ (id)newInProcessViewController;
+ (id)newViewServiceViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (UIViewController)childViewController;
- (VNDocumentCameraViewController)init;
- (VNDocumentCameraViewController)initWithChildViewController:(id)a3;
- (VNDocumentCameraViewController)initWithCoder:(NSCoder *)aDecoder;
- (VNDocumentCameraViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (id)delegate;
- (void)setChildViewController:(id)a3;
- (void)setDelegate:(id)delegate;
@end

@implementation VNDocumentCameraViewController

+ (BOOL)isSupported
{
  if (DCDebugInterfaceEnabled())
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = MGGetBoolAnswer();
    if (v2) {
      LOBYTE(v2) = MGGetBoolAnswer() ^ 1;
    }
  }
  return v2;
}

- (VNDocumentCameraViewController)init
{
  if (([(id)objc_opt_class() isSupported] & 1) == 0)
  {
    id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Document camera is not available" userInfo:0];
    objc_exception_throw(v5);
  }
  v3 = +[VNDocumentCameraViewController newDefaultViewController];

  return v3;
}

- (VNDocumentCameraViewController)initWithChildViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNDocumentCameraViewController;
  id v5 = [(VNDocumentCameraViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v4 && v5) {
    [(VNDocumentCameraViewController *)v5 setChildViewController:v4];
  }

  return v6;
}

- (VNDocumentCameraViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  return 0;
}

- (VNDocumentCameraViewController)initWithCoder:(NSCoder *)aDecoder
{
  return 0;
}

+ (id)newDefaultViewController
{
  v3 = +[DCSettings sharedSettings];
  int v4 = [v3 enableViewService];

  if (v4)
  {
    return (id)[a1 newViewServiceViewController];
  }
  else
  {
    return (id)[a1 newInProcessViewController];
  }
}

+ (id)newViewServiceViewController
{
  return objc_alloc_init(VNDocumentCameraViewController_ViewService);
}

+ (id)newInProcessViewController
{
  return objc_alloc_init(VNDocumentCameraViewController_InProcess);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setChildViewController:(id)a3
{
  v31[4] = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)&self->_childViewController, a3);
  id v5 = a3;
  [v5 beginAppearanceTransition:1 animated:0];
  [(VNDocumentCameraViewController *)self addChildViewController:v5];
  v6 = [v5 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(VNDocumentCameraViewController *)self view];
  objc_super v8 = [v5 view];
  [v7 addSubview:v8];

  v21 = (void *)MEMORY[0x263F08938];
  v30 = [v5 view];
  v28 = [v30 leadingAnchor];
  v29 = [(VNDocumentCameraViewController *)self view];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v31[0] = v26;
  v25 = [v5 view];
  v23 = [v25 trailingAnchor];
  v24 = [(VNDocumentCameraViewController *)self view];
  v22 = [v24 trailingAnchor];
  v20 = [v23 constraintEqualToAnchor:v22];
  v31[1] = v20;
  v19 = [v5 view];
  v17 = [v19 topAnchor];
  v18 = [(VNDocumentCameraViewController *)self view];
  v9 = [v18 topAnchor];
  v10 = [v17 constraintEqualToAnchor:v9];
  v31[2] = v10;
  v11 = [v5 view];
  v12 = [v11 bottomAnchor];
  v13 = [(VNDocumentCameraViewController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v31[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  [v21 activateConstraints:v16];

  [v5 didMoveToParentViewController:self];
  [v5 endAppearanceTransition];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_2((uint64_t)v7, v8);
  }

  if (v7)
  {
    v9 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_1(a1, (uint64_t)v7, v9);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) endDelayingDisplayOfRemoteController];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263F297E0]);
    [*(id *)(a1 + 32) setAccelerometer:v10];

    v11 = *(void **)(a1 + 32);
    v12 = [v11 accelerometer];
    [v12 setDelegate:v11];

    v13 = [*(id *)(a1 + 32) accelerometer];
    [v13 setOrientationEventsEnabled:1];

    v14 = [*(id *)(a1 + 32) accelerometer];
    [v14 setPassiveOrientationEvents:0];

    [v6 setPublicViewController:*(void *)(a1 + 32)];
    v15 = [v6 serviceViewControllerProxy];
    v16 = objc_alloc_init(DCDocumentCameraViewServiceSessionRequest);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_10;
    v19[3] = &unk_2642A9C18;
    uint64_t v17 = *(void *)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v15;
    uint64_t v21 = v17;
    id v18 = v15;
    [v18 startSessionWithClientContext:v16 completion:v19];
  }
}

uint64_t __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_10(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setViewServiceSession:a2];
  v3 = *(void **)(a1 + 40);
  int v4 = [*(id *)(a1 + 32) accelerometer];
  objc_msgSend(v3, "setOrientation:animated:", objc_msgSend(v4, "currentDeviceOrientation"), 0);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_2;
  v8[3] = &unk_2642A9BF0;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[4] = *(void *)(a1 + 32);
  v8[5] = v6;
  return [v5 prepareForDisplayWithCompletion:v8];
}

uint64_t __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 endDelayingDisplayOfRemoteController];
}

void __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_217885000, a3, OS_LOG_TYPE_ERROR, "Remote view controller error while displaying %@: %@", (uint8_t *)&v6, 0x16u);
}

void __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217885000, a2, OS_LOG_TYPE_DEBUG, "_UIResilientRemoteViewContainerViewController initialized (%@)", (uint8_t *)&v2, 0xCu);
}

@end