@interface DKUncertifiedAlertView
- (_TtC18DKPairingUIService22DKUncertifiedAlertView)initWithCoder:(id)a3;
- (_TtC18DKPairingUIService22DKUncertifiedAlertView)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DKUncertifiedAlertView

- (_TtC18DKPairingUIService22DKUncertifiedAlertView)initWithCoder:(id)a3
{
  v3 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger;
  v4 = self;
  Logger.init(subsystem:category:)();
  uint64_t v5 = OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert;
  *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert) = 0;
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v3, v6);
  v7 = *(Class *)((char *)&v4->super.super.super.isa + v5);

  type metadata accessor for DKUncertifiedAlertView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DKUncertifiedAlertView();
  [(DKUncertifiedAlertView *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DKUncertifiedAlertView();
  id v4 = v5.receiver;
  [(DKUncertifiedAlertView *)&v5 viewDidAppear:v3];
  sub_1000046E0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DKUncertifiedAlertView();
  [(DKUncertifiedAlertView *)&v4 viewDidDisappear:v3];
}

- (_TtC18DKPairingUIService22DKUncertifiedAlertView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18DKPairingUIService22DKUncertifiedAlertView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert));
  objc_super v5 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate;

  sub_100005710((uint64_t)v5);
}

@end