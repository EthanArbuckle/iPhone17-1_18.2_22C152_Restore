@interface GKHostedViewController
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)gkIsDisappearing;
- (BOOL)isRequestingRemoteViewController;
- (BOOL)presentingRemoteViewController;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldPresentRemoteViewController;
- (GKGame)game;
- (GKHostedViewController)init;
- (GKRemoteViewServiceController)remoteViewController;
- (id)remoteViewReadyHandler;
- (id)serviceSideViewControllerClassName;
- (unint64_t)supportedInterfaceOrientations;
- (void)didReceiveMemoryWarning;
- (void)dismissModalViewControllerAnimated:(BOOL)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)donePressed:(id)a3;
- (void)init;
- (void)presentRemoteViewControllerIfNeeded;
- (void)requestRemoteViewControllerIfNeeded;
- (void)resetRemoteViewController;
- (void)setGame:(id)a3;
- (void)setGkIsDisappearing:(BOOL)a3;
- (void)setIsRequestingRemoteViewController:(BOOL)a3;
- (void)setPresentingRemoteViewController:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRemoteViewReadyHandler:(id)a3;
- (void)setShouldPresentRemoteViewController:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKHostedViewController

- (id)serviceSideViewControllerClassName
{
  return @"GKServiceViewController";
}

- (GKHostedViewController)init
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKHostedViewController init]();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKHostedViewController;
  v4 = [(GKHostedViewController *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F636F0] currentGame];
    game = v4->_game;
    v4->_game = (GKGame *)v5;

    [(GKHostedViewController *)v4 requestRemoteViewControllerIfNeeded];
  }
  return v4;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v2 didReceiveMemoryWarning];
}

- (void)donePressed:(id)a3
{
  [(GKHostedViewController *)self setPresentingRemoteViewController:0];
  id v4 = [(GKHostedViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:&__block_literal_global_50];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v5 viewDidLoad];
  id v3 = [(GKHostedViewController *)self view];
  [v3 setBackgroundColor:0];

  id v4 = [(GKHostedViewController *)self view];
  [v4 setOpaque:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKHostedViewController *)self requestRemoteViewControllerIfNeeded];
  v6.receiver = self;
  v6.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v6 viewWillAppear:v3];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewWillAppear:]();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v5 viewDidAppear:a3];
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKHostedViewController viewDidAppear:]();
  }
  [(GKHostedViewController *)self presentRemoteViewControllerIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKHostedViewController *)self setGkIsDisappearing:1];
  v6.receiver = self;
  v6.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v6 viewWillDisappear:v3];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewWillDisappear:]();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v5 viewDidDisappear:a3];
  [(GKHostedViewController *)self setGkIsDisappearing:0];
  [(GKHostedViewController *)self requestRemoteViewControllerIfNeeded];
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewDidDisappear:]();
  }
}

- (void)requestRemoteViewControllerIfNeeded
{
  if (!self->_isRequestingRemoteViewController)
  {
    remoteViewController = self->_remoteViewController;
    if (remoteViewController)
    {
      [(GKRemoteViewServiceController *)remoteViewController setManagingViewController:self];
      id v4 = self->_remoteViewController;
      [(GKRemoteViewServiceController *)v4 nudge];
    }
    else
    {
      objc_super v5 = [(GKHostedViewController *)self _presentingViewController];
      self->_isRequestingRemoteViewController = 1;
      objc_super v6 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if (v7 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v8 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v8 = 0), v8))
      {
        [(GKHostedViewController *)self setModalPresentationStyle:17];
      }
      else
      {
        [(GKHostedViewController *)self setModalPresentationStyle:16];
        v9 = [MEMORY[0x1E4F63A10] sharedTheme];
        [v9 formSheetSize];
        -[GKHostedViewController setFormSheetSize:](self, "setFormSheetSize:");

        id v10 = (id)[(GKHostedViewController *)self view];
      }
      [(GKHostedViewController *)self setWantsFullScreenLayout:1];
      v11 = [(GKHostedViewController *)self serviceSideViewControllerClassName];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke;
      v17 = &unk_1E5F644B8;
      v18 = self;
      id v19 = v5;
      id v12 = v5;
      id v13 = +[_UIRemoteViewController requestViewController:v11 fromServiceWithBundleIdentifier:@"com.apple.gamecenter.GameCenterUIService" connectionHandler:&v14];

      objc_msgSend(v12, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_70, 5.0, v14, v15, v16, v17, v18);
    }
  }
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 978) = 0;
  if (v6)
  {
    uint64_t v7 = (NSObject **)MEMORY[0x1E4F63860];
    BOOL v8 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v9 = (id)GKOSLoggers();
      BOOL v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_2((uint64_t)v6, v8);
    }
LABEL_6:
    [*(id *)(a1 + 40) _endDelayingPresentation];
    goto LABEL_7;
  }
  if (!v5)
  {
    v28 = (NSObject **)MEMORY[0x1E4F63860];
    v29 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v30 = (id)GKOSLoggers();
      v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_1(v29);
    }
    goto LABEL_6;
  }
  [*(id *)(a1 + 32) setRemoteViewController:v5];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setManagingViewController:");
  [*(id *)(a1 + 32) didGetRemoteViewController];
  id v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v12 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v12 = 0), v12))
  {
    [*(id *)(*(void *)(a1 + 32) + 992) setModalPresentationStyle:17];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 992) setModalPresentationStyle:16];
    id v13 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v13 formSheetSize];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setFormSheetSize:");

    id v14 = (id)[*(id *)(*(void *)(a1 + 32) + 992) view];
  }
  uint64_t v15 = [*(id *)(a1 + 32) view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [*(id *)(*(void *)(a1 + 32) + 992) view];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 992)];
  v25 = [*(id *)(a1 + 32) view];
  v26 = [*(id *)(*(void *)(a1 + 32) + 992) view];
  [v25 addSubview:v26];

  [*(id *)(*(void *)(a1 + 32) + 992) setupRemoteView];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "didMoveToParentViewController:");
  [*(id *)(a1 + 40) _endDelayingPresentation];
  uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 1000);
  if (v27) {
    (*(void (**)(void))(v27 + 16))();
  }
LABEL_7:
}

uint64_t __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_67(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_67_cold_1();
    }
  }
  return a2 ^ 1u;
}

- (void)resetRemoteViewController
{
  [(GKRemoteViewServiceController *)self->_remoteViewController willMoveToParentViewController:0];
  [(GKHostedViewController *)self removeChildViewController:self->_remoteViewController];
  id v3 = [(GKRemoteViewServiceController *)self->_remoteViewController view];
  [v3 removeFromSuperview];

  [(GKHostedViewController *)self setRemoteViewController:0];
  [(GKHostedViewController *)self setRemoteViewReadyHandler:0];
  if (![(GKHostedViewController *)self gkIsDisappearing])
  {
    [(GKHostedViewController *)self requestRemoteViewControllerIfNeeded];
  }
}

- (BOOL)shouldPresentRemoteViewController
{
  if (![(GKHostedViewController *)self isViewLoaded]) {
    return 0;
  }
  id v3 = [(GKHostedViewController *)self remoteViewController];
  if (v3)
  {
    id v4 = [(GKHostedViewController *)self remoteViewController];
    char v5 = [v4 didSetRemoteGame];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)presentRemoteViewControllerIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "presenting now!", v2, v3, v4, v5, v6);
}

- (void)dismissModalViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKHostedViewController dismissModalViewControllerAnimated:]();
  }
  [(GKHostedViewController *)self setPresentingRemoteViewController:0];
  v6.receiver = self;
  v6.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v6 dismissModalViewControllerAnimated:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v7 = (id)GKOSLoggers();
  }
  BOOL v8 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKHostedViewController dismissViewControllerAnimated:completion:](v8, v6);
  }
  [(GKHostedViewController *)self setPresentingRemoteViewController:0];
  v9.receiver = self;
  v9.super_class = (Class)GKHostedViewController;
  [(GKHostedViewController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (GKRemoteViewServiceController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (BOOL)presentingRemoteViewController
{
  return self->_presentingRemoteViewController;
}

- (void)setPresentingRemoteViewController:(BOOL)a3
{
  self->_presentingRemoteViewController = a3;
}

- (void)setShouldPresentRemoteViewController:(BOOL)a3
{
  self->_shouldPresentRemoteViewController = a3;
}

- (id)remoteViewReadyHandler
{
  return self->_remoteViewReadyHandler;
}

- (void)setRemoteViewReadyHandler:(id)a3
{
}

- (BOOL)isRequestingRemoteViewController
{
  return self->_isRequestingRemoteViewController;
}

- (void)setIsRequestingRemoteViewController:(BOOL)a3
{
  self->_isRequestingRemoteViewController = a3;
}

- (BOOL)gkIsDisappearing
{
  return self->_gkIsDisappearing;
}

- (void)setGkIsDisappearing:(BOOL)a3
{
  self->_gkIsDisappearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteViewReadyHandler, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_game, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "init'd a GKHostedViewController", v2, v3, v4, v5, v6);
}

- (void)viewDidAppear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "APPEARED", v2, v3, v4, v5, v6);
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_debug_impl(&dword_1AF250000, log, OS_LOG_TYPE_DEBUG, "Didn't get a remote view controller: %@", (uint8_t *)&v1, 0xCu);
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "Error getting a remote view controller: %@", (uint8_t *)&v2, 0xCu);
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_67_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1AF250000, v0, OS_LOG_TYPE_ERROR, "requestRemoteViewControllerIfNeeded-> _beginDelayingPresentation timed out.We failed to present.", v1, 2u);
}

- (void)dismissModalViewControllerAnimated:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "DISMISSED (no completion handler", v2, v3, v4, v5, v6);
}

- (void)dismissViewControllerAnimated:(void *)a1 completion:(const void *)a2 .cold.1(void *a1, const void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = _Block_copy(a2);
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_1AF250000, v3, OS_LOG_TYPE_DEBUG, "DISMISSED (w completion handler %@)", (uint8_t *)&v5, 0xCu);
}

@end