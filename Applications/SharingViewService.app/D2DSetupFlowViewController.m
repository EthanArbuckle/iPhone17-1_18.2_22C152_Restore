@interface D2DSetupFlowViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC18SharingViewService26D2DSetupFlowViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService26D2DSetupFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation D2DSetupFlowViewController

- (_TtC18SharingViewService26D2DSetupFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18SharingViewService26D2DSetupFlowViewController *)sub_1000A0E58(v5, v7, a4);
}

- (_TtC18SharingViewService26D2DSetupFlowViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A3854();
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v6 = (uint64_t (*)(uint64_t))sub_100069EE0;
  }
  id v7 = a3;
  id v8 = self;
  sub_1000A1258(a3, v6);
  sub_100017C38((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000A2560(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000A2888(a3);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100017EF4(0, (unint64_t *)&qword_1001C9600);
    sub_100069EE8();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (*(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                               + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_router))
  {
    uint64_t v5 = self;
    swift_unknownObjectRetain();
    sub_10009BE4C(v4);

    swift_unknownObjectRelease();
  }

  swift_bridgeObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_svsAssertion));
  id v3 = *(void **)((char *)&self->super
                + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_remoteAlertHandle);
}

@end