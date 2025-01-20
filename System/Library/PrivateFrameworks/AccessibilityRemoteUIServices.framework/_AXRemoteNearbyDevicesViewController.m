@interface _AXRemoteNearbyDevicesViewController
+ (id)exportedInterface;
+ (id)presentNearbyDevicesViewControllerWithConnectionHandler:(id)a3 dismissalHandler:(id)a4;
+ (id)serviceViewControllerInterface;
- (id)dismissHandler;
- (void)setDismissHandler:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _AXRemoteNearbyDevicesViewController

+ (id)presentNearbyDevicesViewControllerWithConnectionHandler:(id)a3 dismissalHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __113___AXRemoteNearbyDevicesViewController_presentNearbyDevicesViewControllerWithConnectionHandler_dismissalHandler___block_invoke;
  v12[3] = &unk_264DA8BC0;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  v10 = [v7 requestViewController:@"NearbyDevicesRemoteViewController" fromServiceWithBundleIdentifier:@"com.apple.AXRemoteViewService" connectionHandler:v12];

  return v10;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ECF21A8];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED03188];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_AXRemoteNearbyDevicesViewController;
  [(_UIRemoteViewController *)&v7 viewServiceDidTerminateWithError:v4];
  id v5 = [(_AXRemoteNearbyDevicesViewController *)self dismissHandler];

  if (v5)
  {
    id v6 = [(_AXRemoteNearbyDevicesViewController *)self dismissHandler];
    ((void (**)(void, id))v6)[2](v6, v4);
  }
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end