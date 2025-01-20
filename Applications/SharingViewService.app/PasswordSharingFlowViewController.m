@interface PasswordSharingFlowViewController
- (_TtC18SharingViewService33PasswordSharingFlowViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService33PasswordSharingFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasswordSharingFlowViewController

- (_TtC18SharingViewService33PasswordSharingFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18SharingViewService33PasswordSharingFlowViewController *)sub_100077C14(v5, v7, a4);
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
  sub_100077D38(v7, v6);
  sub_100017C38((uint64_t)v6);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100078988();
    sub_100069EE8();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (*(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                               + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_module))
  {
    uint64_t v5 = self;
    swift_unknownObjectRetain();
    sub_1000AAC88(v4);

    swift_unknownObjectRelease();
  }

  swift_bridgeObjectRelease();
}

- (_TtC18SharingViewService33PasswordSharingFlowViewController)initWithCoder:(id)a3
{
  uint64_t v4 = (_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_module);
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                          + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_prxContainerViewController) = 0;
  *(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                          + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_userInfo) = 0;
  id v5 = a3;

  result = (_TtC18SharingViewService33PasswordSharingFlowViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10007819C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = self;
  uint64_t v7 = sub_10007340C();
  if (v7)
  {
    id v8 = (void *)v7;
    NSString v9 = String._bridgeToObjectiveC()();
    [v8 setIdleTimerDisabled:0 forReason:v9];

    swift_unknownObjectRelease();
  }
  v10.receiver = v6;
  v10.super_class = ObjectType;
  [(PasswordSharingFlowViewController *)&v10 viewDidDisappear:v3];
}

- (void)proxCardFlowWillPresent
{
  uint64_t v2 = qword_1001C6FE8;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100012C4C(v4, (uint64_t)qword_1001C9B80);
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Begin Password Sharing flow", v6, 2u);
    swift_slowDealloc();
  }
}

- (void)proxCardFlowDidDismiss
{
  uint64_t v2 = self;
  sub_100078598();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_prxContainerViewController));

  swift_bridgeObjectRelease();
}

@end