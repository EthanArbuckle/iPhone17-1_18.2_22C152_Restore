@interface HostRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (HostRemoteViewController)initWithCoder:(id)a3;
- (HostRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)sidecarServiceDisableDisplaySleep:(BOOL)a3;
- (void)sidecarServiceOrientationChanged;
- (void)sidecarServiceViewControllerAnimate:(int64_t)a3 completion:(id)a4;
- (void)sidecarServiceViewControllerBackgroundStyle:(int64_t)a3;
- (void)sidecarServiceViewControllerWantsVolumeButtonEvents:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation HostRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1000074F4();
}

+ (id)exportedInterface
{
  id v2 = sub_100007624(&protocolRef_SidecarServiceHostInterface);

  return v2;
}

+ (id)serviceViewControllerInterface
{
  id v2 = sub_100007624(&protocolRef_SidecarServiceServiceInterface);

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HostRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (HostRemoteViewController *)sub_1000076AC(v5, v7, a4);
}

- (HostRemoteViewController)initWithCoder:(id)a3
{
  return (HostRemoteViewController *)sub_1000077AC(a3);
}

- (void).cxx_destruct
{
}

- (void)sidecarServiceViewControllerAnimate:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_1000078A0(a3, (uint64_t)v7, (void (**)(void))v6);
  _Block_release(v6);
}

- (void)sidecarServiceViewControllerWantsVolumeButtonEvents:(BOOL)a3
{
  v4 = self;
  sub_1000079FC(a3);
}

- (void)sidecarServiceViewControllerBackgroundStyle:(int64_t)a3
{
  v4 = self;
  sub_100007AF8(a3);
}

- (void)sidecarServiceOrientationChanged
{
  id v2 = self;
  sub_100007BF0();
}

- (void)sidecarServiceDisableDisplaySleep:(BOOL)a3
{
  v4 = self;
  sub_100007CCC(a3);
}

@end