@interface AXRemoteViewServiceAdaptor
+ (void)presentRemoteNearbyDevicesViewControllerWithConnectionHandler:(id)a3 dismissalHandler:(id)a4;
+ (void)presentRemoteNearbyDevicesViewControllerWithPresentationHandler:(id)a3 dismissalHandler:(id)a4;
@end

@implementation AXRemoteViewServiceAdaptor

+ (void)presentRemoteNearbyDevicesViewControllerWithPresentationHandler:(id)a3 dismissalHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AXRemoteUIAlertManager sharedInstance];
  [v7 presentRemoteUIAlertWithIdentifier:@"com.apple.AXRemoteViewService" viewControllerClassName:@"NearbyDevicesRemoteViewController" userInfo:MEMORY[0x263EFFA78] presentationHandler:v6 dismissalHandler:v5];
}

+ (void)presentRemoteNearbyDevicesViewControllerWithConnectionHandler:(id)a3 dismissalHandler:(id)a4
{
  id v4 = +[_AXRemoteNearbyDevicesViewController presentNearbyDevicesViewControllerWithConnectionHandler:a3 dismissalHandler:a4];
}

@end