@interface CAMCameraButtonBuddyViewController
- (BOOL)assetsLoaded;
- (CAMCameraButtonBuddyViewController)init;
- (CAMCameraButtonBuddyViewControllerDelegate)delegate;
- (CAMOnboardingBuddyViewManager)_onboardingManager;
- (UIViewController)_contentViewController;
- (int64_t)preferredStatusBarStyle;
- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3;
- (void)composeInterface;
- (void)loadAssetsWithCompletion:(id)a3;
- (void)setAssetsLoaded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)set_contentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation CAMCameraButtonBuddyViewController

- (CAMCameraButtonBuddyViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMCameraButtonBuddyViewController;
  v2 = [(CAMCameraButtonBuddyViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_assetsLoaded = 0;
    v4 = objc_alloc_init(CAMOnboardingBuddyViewManager);
    onboardingManager = v3->__onboardingManager;
    v3->__onboardingManager = v4;
  }
  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CAMCameraButtonBuddyViewController;
  [(CAMCameraButtonBuddyViewController *)&v6 viewDidLoad];
  if ([(CAMCameraButtonBuddyViewController *)self assetsLoaded])
  {
    [(CAMCameraButtonBuddyViewController *)self composeInterface];
  }
  else
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __49__CAMCameraButtonBuddyViewController_viewDidLoad__block_invoke;
    v3[3] = &unk_263FA0E00;
    objc_copyWeak(&v4, &location);
    [(CAMCameraButtonBuddyViewController *)self loadAssetsWithCompletion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __49__CAMCameraButtonBuddyViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained composeInterface];
}

- (void)composeInterface
{
  v3 = [(CAMCameraButtonBuddyViewController *)self _onboardingManager];
  id v22 = [v3 createViewControllerWithDelegate:self];

  id v4 = [v22 view];
  [(CAMCameraButtonBuddyViewController *)self addChildViewController:v22];
  v5 = [(CAMCameraButtonBuddyViewController *)self view];
  [v5 addSubview:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [v4 topAnchor];
  objc_super v7 = [(CAMCameraButtonBuddyViewController *)self view];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v4 leadingAnchor];
  v11 = [(CAMCameraButtonBuddyViewController *)self view];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v4 trailingAnchor];
  v15 = [(CAMCameraButtonBuddyViewController *)self view];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [v4 bottomAnchor];
  v19 = [(CAMCameraButtonBuddyViewController *)self view];
  v20 = [v19 bottomAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  [v22 didMoveToParentViewController:self];
  [(CAMCameraButtonBuddyViewController *)self set_contentViewController:v22];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)loadAssetsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = [(CAMCameraButtonBuddyViewController *)self _onboardingManager];
  uint64_t v6 = [v5 modelLoadingStatus];

  if (v6 == 2)
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_super v7 = [(CAMCameraButtonBuddyViewController *)self _onboardingManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__CAMCameraButtonBuddyViewController_loadAssetsWithCompletion___block_invoke;
    v8[3] = &unk_263FA0E28;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    [v7 createViewModel:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __63__CAMCameraButtonBuddyViewController_loadAssetsWithCompletion___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v3 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    [WeakRetained setAssetsLoaded:1];

    v5 = *(uint64_t (**)(void))(*(void *)(v3 + 32) + 16);
    return v5();
  }
  return result;
}

- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3
{
  id v4 = [(CAMCameraButtonBuddyViewController *)self delegate];
  [v4 cameraButtonBuddyViewControllerDidFinish:self];
}

- (CAMCameraButtonBuddyViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMCameraButtonBuddyViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)assetsLoaded
{
  return self->_assetsLoaded;
}

- (void)setAssetsLoaded:(BOOL)a3
{
  self->_assetsLoaded = a3;
}

- (UIViewController)_contentViewController
{
  return self->__contentViewController;
}

- (void)set_contentViewController:(id)a3
{
}

- (CAMOnboardingBuddyViewManager)_onboardingManager
{
  return self->__onboardingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__onboardingManager, 0);
  objc_storeStrong((id *)&self->__contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end