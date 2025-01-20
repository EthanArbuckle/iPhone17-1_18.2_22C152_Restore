@interface DKPairingAlertView
- (_TtC18DKPairingUIService18DKPairingAlertView)initWithCoder:(id)a3;
- (_TtC18DKPairingUIService18DKPairingAlertView)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DKPairingAlertView

- (_TtC18DKPairingUIService18DKPairingAlertView)initWithCoder:(id)a3
{
  return 0;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DKPairingAlertView();
  [(DKPairingAlertView *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DKPairingAlertView();
  id v4 = v5.receiver;
  [(DKPairingAlertView *)&v5 viewDidAppear:v3];
  sub_10000F558();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DKPairingAlertView();
  [(DKPairingAlertView *)&v4 viewDidDisappear:v3];
}

- (_TtC18DKPairingUIService18DKPairingAlertView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18DKPairingUIService18DKPairingAlertView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert));

  swift_release();
}

@end