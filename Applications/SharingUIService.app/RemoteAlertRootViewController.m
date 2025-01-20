@interface RemoteAlertRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController)initWithCoder:(id)a3;
- (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_100015C38;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_100015BBC;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000056C4;
  aBlock[3] = &unk_100039D48;
  v9 = _Block_copy(aBlock);
  v10 = self;
  sub_100015BE0((uint64_t)v6);
  swift_release();
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  [(RemoteAlertRootViewController *)&v11 dismissViewControllerAnimated:v4 completion:v9];
  _Block_release(v9);
  sub_100015BF0((uint64_t)v6);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end