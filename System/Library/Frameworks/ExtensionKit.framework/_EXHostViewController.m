@interface _EXHostViewController
- (APBaseExtensionShieldView)shieldView;
- (UIView)placeholderView;
- (UIViewController)embededViewController;
- (_EXExtensionProcess)extensionProcess;
- (_EXHostSessionDriver)sessionDriver;
- (_EXHostViewController)init;
- (_EXHostViewController)initWithConfiguration:(id)a3;
- (_EXHostViewControllerConfiguration)configuration;
- (_EXHostViewControllerConfiguration)innerConfiguration;
- (_EXHostViewControllerDelegate)delegate;
- (_EXHostViewControllerDelegate)placeholderViewController;
- (_EXHostViewControllerSession)session;
- (_UIRemoteSheet)_remoteSheet;
- (id)makeXPCConnectionWithError:(id *)a3;
- (void)addShieldView;
- (void)dealloc;
- (void)embedPlaceholder;
- (void)embedViewController:(id)a3;
- (void)loadView;
- (void)removeShieldView;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmbededViewController:(id)a3;
- (void)setExtensionProcess:(id)a3;
- (void)setInnerConfiguration:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPlaceholderViewController:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionDriver:(id)a3;
- (void)setShieldView:(id)a3;
- (void)shieldViewUnlockButtonPressed:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _EXHostViewController

- (_EXHostViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_EXHostViewController;
  v2 = [(_EXHostViewController *)&v6 init];
  if (v2)
  {
    v3 = [[_EXHostSessionDriver alloc] initWithHostViewController:v2];
    sessionDriver = v2->_sessionDriver;
    v2->_sessionDriver = v3;
  }
  return v2;
}

- (_EXHostViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(_EXHostViewController *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(_EXHostViewController *)v5 setConfiguration:v4];
  }

  return v6;
}

- (void)dealloc
{
  [(_EXHostSessionDriver *)self->_sessionDriver setSession:0];
  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewController;
  [(_EXHostViewController *)&v3 dealloc];
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
  if (v15)
  {
    id v4 = objc_alloc(MEMORY[0x263F04DD8]);
    id v5 = [v15 extensionIdentity];
    objc_super v6 = [v15 instanceIdentifier];
    v7 = (void *)[v4 initWithExtensionIdentity:v5 instanceIdentifier:v6];

    [(_EXHostSessionDriver *)self->_sessionDriver startSessionWithProcessConfiguration:v7 configuration:v15];
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
    [(_EXHostSessionDriver *)self->_sessionDriver startSessionWithProcessConfiguration:0 configuration:0];
  }
}

- (_EXHostViewControllerSession)session
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  sessionDriver = self->_sessionDriver;

  return [(_EXHostSessionDriver *)sessionDriver session];
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    if (([v4 detached] & 1) == 0)
    {
      id v5 = _EXDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[_EXHostViewController setSession:](v5);
      }
    }
    [(_EXHostSessionDriver *)self->_sessionDriver setSession:v4];
    objc_super v6 = [v4 processConfiguration];
    v7 = [v6 extensionIdentity];
    v8 = appProtectionEffectiveContainerFor(v7);

    id v9 = objc_alloc((Class)getAPBaseExtensionShieldViewClass());
    id v10 = [v8 localizedName];
    v11 = iconImageFor(v8);
    v12 = (APBaseExtensionShieldView *)[v9 initWithLocalizedApplicationName:v10 iconImage:v11];
    shieldView = self->_shieldView;
    self->_shieldView = v12;

    [(APBaseExtensionShieldView *)self->_shieldView setDelegate:self];
  }
  else
  {
    [(_EXHostSessionDriver *)self->_sessionDriver setSession:0];
    [(APBaseExtensionShieldView *)self->_shieldView removeFromSuperview];
    v14 = self->_shieldView;
    self->_shieldView = 0;
  }
}

- (void)loadView
{
  objc_super v3 = objc_opt_new();
  [(_EXHostViewController *)self setView:v3];

  id v4 = [(_EXHostViewController *)self view];
  [v4 setDelegate:self];

  [(_EXHostViewController *)self embedPlaceholder];
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
  objc_super v6 = [v5 remoteViewController];

  if (v6)
  {
    [(_EXHostViewController *)self embedViewController:v6];
  }
  else
  {
    v7 = [(_EXHostSessionDriver *)self->_sessionDriver session];
    v8 = [v7 sceneViewController];

    [(_EXHostViewController *)self embedViewController:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)_EXHostViewController;
  [(_EXHostViewController *)&v9 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewController;
  [(_EXHostViewController *)&v3 viewDidDisappear:a3];
}

- (void)embedViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(_EXHostViewController *)self embededViewController];
  if (v4 != v7)
  {
    if (v4)
    {
      [(_EXHostViewController *)self setEmbededViewController:0];
      [v4 removeFromParentViewController];
    }
    if (v7)
    {
      id v5 = [v7 view];
      objc_super v6 = [(_EXHostViewController *)self view];
      [v6 embedView:v5];

      [(_EXHostViewController *)self setEmbededViewController:v7];
      [(_EXHostViewController *)self addChildViewController:v7];
      [v7 didMoveToParentViewController:self];
    }
    else
    {
      [(_EXHostViewController *)self embedPlaceholder];
    }
  }
}

- (_UIRemoteSheet)_remoteSheet
{
  v2 = [(_EXHostViewController *)self session];
  objc_super v3 = [v2 remoteSheet];

  return (_UIRemoteSheet *)v3;
}

- (void)embedPlaceholder
{
  objc_super v3 = [(_EXHostViewController *)self placeholderViewController];

  if (v3)
  {
    id v6 = [(_EXHostViewController *)self placeholderViewController];
    id v4 = [v6 view];
    id v5 = [(_EXHostViewController *)self view];
    [v5 embedView:v4];

    [(_EXHostViewController *)self setEmbededViewController:v6];
    [(_EXHostViewController *)self addChildViewController:v6];
  }
  else
  {
    id v6 = [(_EXHostViewController *)self view];
    id v4 = [(_EXHostViewController *)self placeholderView];
    [v6 embedView:v4];
  }
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  return [(_EXHostSessionDriver *)self->_sessionDriver makeXPCConnectionWithError:a3];
}

- (_EXExtensionProcess)extensionProcess
{
  return (_EXExtensionProcess *)[(_EXHostSessionDriver *)self->_sessionDriver extensionProcess];
}

- (void)addShieldView
{
  id v2 = [(_EXHostViewController *)self view];
  [v2 addShieldView];
}

- (void)removeShieldView
{
  id v2 = [(_EXHostViewController *)self view];
  [v2 removeShieldView];
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4 = [(_EXHostViewController *)self session];
  id v5 = [v4 extensionProcess];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F251E0]);
    id v7 = [(_EXHostViewController *)self session];
    v8 = [v7 extensionProcess];
    objc_super v9 = [v8 extensionIdentity];
    id v10 = [(_EXHostViewController *)self session];
    v11 = [v10 extensionProcess];
    v12 = v11;
    if (v11) {
      [v11 auditToken];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    v13 = (void *)[v6 initWithExtensionIdentity:v9 auditToken:v16];

    v14 = [MEMORY[0x263F25200] sharedGuard];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke;
    v15[3] = &unk_2642586B0;
    v15[4] = self;
    [v14 authenticateForExtension:v13 completion:v15];
  }
}

- (APBaseExtensionShieldView)shieldView
{
  return self->_shieldView;
}

- (void)setShieldView:(id)a3
{
}

- (void)setPlaceholderView:(id)a3
{
}

- (_EXHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_EXHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_EXHostViewControllerDelegate)placeholderViewController
{
  return self->_placeholderViewController;
}

- (void)setPlaceholderViewController:(id)a3
{
}

- (void)setExtensionProcess:(id)a3
{
}

- (_EXHostSessionDriver)sessionDriver
{
  return (_EXHostSessionDriver *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setSessionDriver:(id)a3
{
}

- (UIViewController)embededViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setEmbededViewController:(id)a3
{
}

- (_EXHostViewControllerConfiguration)innerConfiguration
{
  return self->_innerConfiguration;
}

- (void)setInnerConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerConfiguration, 0);
  objc_storeStrong((id *)&self->_embededViewController, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderView, 0);

  objc_storeStrong((id *)&self->_shieldView, 0);
}

- (void)setSession:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = "session == nil || session.detached";
  __int16 v3 = 2080;
  int v1 = 136315650;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/HostViewController/EXHostViewController.m";
  __int16 v5 = 1024;
  int v6 = 495;
  _os_log_fault_impl(&dword_2156DD000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Only detached sessions can be set", (uint8_t *)&v1, 0x1Cu);
}

@end