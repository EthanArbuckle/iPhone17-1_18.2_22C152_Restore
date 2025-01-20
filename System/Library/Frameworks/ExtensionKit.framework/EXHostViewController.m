@interface EXHostViewController
- (APBaseExtensionShieldView)shieldView;
- (EXHostViewController)init;
- (EXHostViewController)initWithConfiguration:(id)a3;
- (NSXPCConnection)makeXPCConnectionWithError:(NSError *)error;
- (UIView)placeholderView;
- (UIViewController)embededViewController;
- (_EXHostSessionDriver)sessionDriver;
- (_EXHostViewControllerConfiguration)configuration;
- (_EXHostViewControllerSession)session;
- (_UIRemoteSheet)_remoteSheet;
- (id)delegate;
- (id)extensionProcess;
- (void)addShieldView;
- (void)dealloc;
- (void)embedViewController:(id)a3;
- (void)loadView;
- (void)removeShieldView;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEmbededViewController:(id)a3;
- (void)setPlaceholderView:(UIView *)placeholderView;
- (void)setSessionDriver:(id)a3;
- (void)setShieldView:(id)a3;
- (void)shieldViewUnlockButtonPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EXHostViewController

- (EXHostViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)EXHostViewController;
  v2 = [(EXHostViewController *)&v6 init];
  if (v2)
  {
    v3 = [[_EXHostSessionDriver alloc] initWithHostViewController:v2];
    sessionDriver = v2->_sessionDriver;
    v2->_sessionDriver = v3;
  }
  return v2;
}

- (EXHostViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(EXHostViewController *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(EXHostViewController *)v5 setConfiguration:v4];
  }

  return v6;
}

- (void)dealloc
{
  [(_EXHostSessionDriver *)self->_sessionDriver setSession:0];
  v3.receiver = self;
  v3.super_class = (Class)EXHostViewController;
  [(EXHostViewController *)&v3 dealloc];
}

- (_EXHostViewControllerConfiguration)configuration
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_super v3 = [(_EXHostSessionDriver *)self->_sessionDriver session];
  id v4 = [v3 configuration];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (_EXHostViewControllerConfiguration *)v5;
}

- (void)setConfiguration:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = objc_alloc(MEMORY[0x263F04DD8]);
  id v5 = [v15 extensionIdentity];
  objc_super v6 = [v15 instanceIdentifier];
  v7 = (void *)[v4 initWithExtensionIdentity:v5 instanceIdentifier:v6];

  [(_EXHostSessionDriver *)self->_sessionDriver startSessionWithProcessConfiguration:v7 configuration:v15];
  if (v15)
  {
    v8 = [v15 extensionIdentity];
    v9 = appProtectionEffectiveContainerFor(v8);

    id v10 = objc_alloc((Class)getAPBaseExtensionShieldViewClass());
    v11 = [v9 localizedName];
    v12 = iconImageFor(v9);
    v13 = (APBaseExtensionShieldView *)[v10 initWithLocalizedApplicationName:v11 iconImage:v12];
    shieldView = self->_shieldView;
    self->_shieldView = v13;

    [(APBaseExtensionShieldView *)self->_shieldView setDelegate:self];
  }
  else
  {
    [(APBaseExtensionShieldView *)self->_shieldView removeFromSuperview];
    v9 = self->_shieldView;
    self->_shieldView = 0;
  }
}

- (void)loadView
{
  objc_super v3 = objc_opt_new();
  [(EXHostViewController *)self setView:v3];

  id v4 = [(EXHostViewController *)self view];
  [v4 setDelegate:self];

  id v6 = [(EXHostViewController *)self view];
  id v5 = [(EXHostViewController *)self placeholderView];
  [v6 embedView:v5];
}

- (void)viewDidLoad
{
}

- (UIView)placeholderView
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  placeholderView = self->_placeholderView;
  if (!placeholderView)
  {
    id v4 = (UIView *)objc_opt_new();
    id v5 = self->_placeholderView;
    self->_placeholderView = v4;

    placeholderView = self->_placeholderView;
  }

  return placeholderView;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_EXHostSessionDriver *)self->_sessionDriver session];
  id v6 = [v5 remoteViewController];

  if (v6)
  {
    [(EXHostViewController *)self embedViewController:v6];
  }
  else
  {
    v7 = [(_EXHostSessionDriver *)self->_sessionDriver session];
    v8 = [v7 sceneViewController];

    [(EXHostViewController *)self embedViewController:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)EXHostViewController;
  [(EXHostViewController *)&v9 viewWillAppear:v3];
}

- (void)embedViewController:(id)a3
{
  id v8 = a3;
  id v4 = [(EXHostViewController *)self embededViewController];
  if (v4 != v8)
  {
    if (v4)
    {
      [(EXHostViewController *)self setEmbededViewController:0];
      [v4 removeFromParentViewController];
    }
    if (v8)
    {
      id v5 = [v8 view];
      id v6 = [(EXHostViewController *)self view];
      [v6 embedView:v5];

      [(EXHostViewController *)self setEmbededViewController:v8];
      [(EXHostViewController *)self addChildViewController:v8];
    }
    else
    {
      id v5 = [(EXHostViewController *)self view];
      v7 = [(EXHostViewController *)self placeholderView];
      [v5 embedView:v7];
    }
  }
}

- (_UIRemoteSheet)_remoteSheet
{
  v2 = [(EXHostViewController *)self session];
  BOOL v3 = [v2 remoteSheet];

  return (_UIRemoteSheet *)v3;
}

- (NSXPCConnection)makeXPCConnectionWithError:(NSError *)error
{
  return (NSXPCConnection *)[(_EXHostSessionDriver *)self->_sessionDriver makeXPCConnectionWithError:error];
}

- (id)extensionProcess
{
  return [(_EXHostSessionDriver *)self->_sessionDriver extensionProcess];
}

- (void)addShieldView
{
  id v2 = [(EXHostViewController *)self view];
  [v2 addShieldView];
}

- (void)removeShieldView
{
  id v2 = [(EXHostViewController *)self view];
  [v2 removeShieldView];
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F251E0]);
  id v5 = [(EXHostViewController *)self session];
  id v6 = [v5 extensionProcess];
  v7 = [v6 extensionIdentity];
  id v8 = [(EXHostViewController *)self session];
  objc_super v9 = [v8 extensionProcess];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  v11 = (void *)[v4 initWithExtensionIdentity:v7 auditToken:v14];

  v12 = [MEMORY[0x263F25200] sharedGuard];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke;
  v13[3] = &unk_2642586B0;
  v13[4] = self;
  [v12 authenticateForExtension:v11 completion:v13];
}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2;
  block[3] = &unk_264258688;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = _EXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_2(v2);
    }

    [*(id *)(a1 + 32) removeShieldView];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v3 = (uint64_t *)(a1 + 40);
  if (v4)
  {
    id v5 = _EXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_1(v3, v5);
    }
  }
}

- (_EXHostViewControllerSession)session
{
  return self->_session;
}

- (APBaseExtensionShieldView)shieldView
{
  return self->_shieldView;
}

- (void)setShieldView:(id)a3
{
}

- (void)setPlaceholderView:(UIView *)placeholderView
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (_EXHostSessionDriver)sessionDriver
{
  return (_EXHostSessionDriver *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setSessionDriver:(id)a3
{
}

- (UIViewController)embededViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setEmbededViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embededViewController, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

void __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2;
  block[3] = &unk_264258688;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = _EXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_2(v2);
    }

    [*(id *)(a1 + 32) removeShieldView];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v3 = (uint64_t *)(a1 + 40);
  if (v4)
  {
    id v5 = _EXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_1(v3, v5);
    }
  }
}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2156DD000, a2, OS_LOG_TYPE_ERROR, "Unlocked failed with error: %@", (uint8_t *)&v3, 0xCu);
}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2156DD000, log, OS_LOG_TYPE_DEBUG, "Successfully Unlocked", v1, 2u);
}

@end