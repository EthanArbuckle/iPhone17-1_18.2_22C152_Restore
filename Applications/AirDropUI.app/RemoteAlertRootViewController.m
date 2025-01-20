@interface RemoteAlertRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController)initWithCoder:(id)a3;
- (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation RemoteAlertRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1000301C8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_10002FB44(a3, (uint64_t)v6, v7);
  sub_100030180((uint64_t)v6);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 3;
}

- (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end