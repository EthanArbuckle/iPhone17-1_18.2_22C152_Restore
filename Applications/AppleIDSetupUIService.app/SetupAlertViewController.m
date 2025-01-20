@interface SetupAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (_TtC21AppleIDSetupUIService24SetupAlertViewController)init;
- (_TtC21AppleIDSetupUIService24SetupAlertViewController)initWithCoder:(id)a3;
- (_TtC21AppleIDSetupUIService24SetupAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SetupAlertViewController

- (_TtC21AppleIDSetupUIService24SetupAlertViewController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for PresentationRequest();
  swift_storeEnumTagMultiPayload();
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController] = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(BaseProxFlowViewController *)&v5 initWithNibName:0 bundle:0];
}

- (_TtC21AppleIDSetupUIService24SetupAlertViewController)initWithCoder:(id)a3
{
  type metadata accessor for PresentationRequest();
  swift_storeEnumTagMultiPayload();
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController] = 0;
  id v5 = a3;

  result = (_TtC21AppleIDSetupUIService24SetupAlertViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = (void *)swift_allocObject();
    v7[2] = v6;
    v6 = sub_100004FB8;
  }
  else
  {
    v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100002BB8(a3, (void (*)(void))v6, v7);
  sub_100004D44((uint64_t)v6);
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(SetupAlertViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000033A8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000035D8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100003894(a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_100004D8C;
  }
  v7 = self;
  sub_100004B60(a3);
  sub_100004D44((uint64_t)v6);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100004A24();
    sub_100004A64();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_100003B2C(v4);

  swift_bridgeObjectRelease();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC21AppleIDSetupUIService24SetupAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21AppleIDSetupUIService24SetupAlertViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000049C8((uint64_t)self + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest);
  v3 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController];
}

@end