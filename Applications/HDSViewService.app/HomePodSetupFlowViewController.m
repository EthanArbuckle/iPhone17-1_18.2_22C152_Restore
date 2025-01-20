@interface HomePodSetupFlowViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC14HDSViewService30HomePodSetupFlowViewController)initWithCoder:(id)a3;
- (_TtC14HDSViewService30HomePodSetupFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation HomePodSetupFlowViewController

- (_TtC14HDSViewService30HomePodSetupFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = (_TtC14HDSViewService26BaseProxFlowViewController *)((char *)&self->super
                                                            + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter);
    _TtC14HDSViewService26BaseProxFlowViewController *v8 = 0;
    v8[1] = 0;
    id v9 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (_TtC14HDSViewService26BaseProxFlowViewController *)((char *)&self->super
                                                             + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter);
    _TtC14HDSViewService26BaseProxFlowViewController *v10 = 0;
    v10[1] = 0;
    id v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(BaseProxFlowViewController *)&v14 initWithNibName:a3 bundle:a4];

  return v12;
}

- (_TtC14HDSViewService30HomePodSetupFlowViewController)initWithCoder:(id)a3
{
  v4 = (_TtC14HDSViewService26BaseProxFlowViewController *)((char *)&self->super
                                                          + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter);
  _TtC14HDSViewService26BaseProxFlowViewController *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC14HDSViewService30HomePodSetupFlowViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10007883C;
  }
  id v7 = a3;
  v8 = self;
  sub_100077A84(v7, v6);
  sub_1000647CC((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000780AC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000782F4(a3);
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(BaseProxFlowViewController *)&v4 _willAppearInRemoteViewController];
  v3 = (void *)sub_100099744();
  if (v3)
  {
    [v3 setAllowsAlertItems:1];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_10007876C();
    sub_1000787AC();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_10007854C(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end