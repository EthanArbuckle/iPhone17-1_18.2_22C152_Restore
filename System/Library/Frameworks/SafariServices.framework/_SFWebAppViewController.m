@interface _SFWebAppViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (_SFWebAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SFWebAppViewControllerDelegate)delegate;
- (void)_sf_sceneDidBecomeActive:(id)a3;
- (void)_sf_sceneDidEnterBackground:(id)a3;
- (void)_sf_sceneWillEnterForeground:(id)a3;
- (void)_sf_sceneWillResignActive:(id)a3;
- (void)destroyScene;
- (void)didChangeLoadingState:(BOOL)a3;
- (void)didFinishInitialLoad:(BOOL)a3;
- (void)fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4;
- (void)handlePushNotificationActivation:(id)a3;
- (void)loadWebAppWithIdentifier:(id)a3;
- (void)processWebPushForWebAppWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)suspendApplication;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _SFWebAppViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"_SFWebAppServiceViewController" fromServiceWithBundleIdentifier:@"com.apple.SafariViewService" connectionHandler:v3];

  return v4;
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC3D8F8];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC4F4A0];
}

- (void)loadWebAppWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 loadWebAppWithIdentifier:v4];
}

- (void)processWebPushForWebAppWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 processWebPushForWebAppWithIdentifier:v4];
}

- (void)handlePushNotificationActivation:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 handlePushNotificationActivation:v4];
}

- (_SFWebAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppViewController;
  id v4 = [(_SFWebAppViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__sf_sceneWillEnterForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];
    [v5 addObserver:v4 selector:sel__sf_sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
    [v5 addObserver:v4 selector:sel__sf_sceneDidBecomeActive_ name:*MEMORY[0x1E4FB2E80] object:0];
    MEMORY[0x1AD0C2480]([v5 addObserver:v4 selector:sel__sf_sceneWillResignActive_ name:*MEMORY[0x1E4FB2EA8] object:0]);
    v6 = v4;
  }
  return v4;
}

- (void)didChangeLoadingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_SFWebAppViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 webAppViewController:self didChangeLoadingState:v3];
  }
}

- (void)didFinishInitialLoad:(BOOL)a3
{
  id v4 = [(_SFWebAppViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 webAppViewControllerDidFinishInitialLoad:self];
  }
}

- (void)fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 didFetchCustomActivities:0 excludedActivityTypes:0];
}

- (void)suspendApplication
{
  id v8 = (id)[objc_alloc(MEMORY[0x1E4FB16E0]) initWithInfo:0 responder:0];
  BOOL v3 = [(_SFWebAppViewController *)self viewIfLoaded];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  v6 = [v5 _FBSScene];
  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [v6 sendActions:v7];
}

- (void)destroyScene
{
  id v4 = [(_SFWebAppViewController *)self viewIfLoaded];
  v2 = [v4 window];
  BOOL v3 = [v2 windowScene];
  objc_msgSend(v3, "_sf_destroyScene");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFWebAppViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 webAppViewController:self viewServiceDidTerminateWithError:v5];
  }
}

- (void)_sf_sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFWebAppViewController *)self viewIfLoaded];
  v6 = [v5 window];
  v7 = [v6 windowScene];
  id v8 = [v4 object];

  if (v7 == v8)
  {
    id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v9 beginDigitalHealthTracking];
  }
}

- (void)_sf_sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFWebAppViewController *)self viewIfLoaded];
  v6 = [v5 window];
  v7 = [v6 windowScene];
  id v8 = [v4 object];

  if (v7 == v8)
  {
    id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v9 stopDigitalHealthTrackingWithCompletionHandler:&__block_literal_global_29];
  }
}

- (void)_sf_sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFWebAppViewController *)self viewIfLoaded];
  v6 = [v5 window];
  v7 = [v6 windowScene];
  id v8 = [v4 object];

  if (v7 == v8)
  {
    id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v9 webAppDidBecomeActive];
  }
}

- (void)_sf_sceneWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFWebAppViewController *)self viewIfLoaded];
  v6 = [v5 window];
  v7 = [v6 windowScene];
  id v8 = [v4 object];

  if (v7 == v8)
  {
    id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v9 webAppWillResignActive];
  }
}

- (_SFWebAppViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFWebAppViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end