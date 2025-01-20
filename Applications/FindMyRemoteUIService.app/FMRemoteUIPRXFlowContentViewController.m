@interface FMRemoteUIPRXFlowContentViewController
- (_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController)initWithCoder:(id)a3;
- (_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FMRemoteUIPRXFlowContentViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000E37C(a3);
}

- (_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  v9 = [(FMRemoteUIPRXFlowContentViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  return [(FMRemoteUIPRXFlowContentViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10000E734();
}

- (void)proxCardFlowWillPresent
{
  uint64_t v2 = qword_100019640;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000075A4(v4, (uint64_t)qword_1000199F0);
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Prox card flow will present.", v6, 2u);
    swift_slowDealloc();
  }
}

@end