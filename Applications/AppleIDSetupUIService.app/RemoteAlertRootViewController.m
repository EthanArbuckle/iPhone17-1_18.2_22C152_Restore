@interface RemoteAlertRootViewController
- (BOOL)_canShowWhileLocked;
- (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController)initWithCoder:(id)a3;
- (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)proxCardFlowDidDismiss;
- (void)viewDidLoad;
@end

@implementation RemoteAlertRootViewController

- (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_1000050A0();
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  [(RemoteAlertRootViewController *)&v2 viewDidLoad];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_1000059EC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_100005980;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004FC8;
  aBlock[3] = &unk_100010868;
  v9 = _Block_copy(aBlock);
  v10 = self;
  sub_1000059A4((uint64_t)v6);
  swift_release();
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  [(RemoteAlertRootViewController *)&v11 dismissViewControllerAnimated:v4 completion:v9];
  _Block_release(v9);
  sub_100004D44((uint64_t)v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler);

  sub_100004D44(v3);
}

- (void)proxCardFlowDidDismiss
{
}

@end