@interface ViewController
- (_TtC18DKPairingUIService14ViewController)initWithCoder:(id)a3;
- (_TtC18DKPairingUIService14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)pairingStatusWithInfo:(id)a3 state:(int64_t)a4 metadata:(id)a5 error:(id)a6;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ViewController();
  [(ViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ViewController();
  [(ViewController *)&v4 viewDidAppear:v3];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v7 = sub_10000C784;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(void **)&self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context];
  *(void *)&self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context] = a3;
  id v9 = a3;
  v11 = self;

  v10 = (void *)sub_1000058AC();
  if (v10)
  {
    [v10 setAllowsAlertStacking:1];
    v10 = (void *)swift_unknownObjectRelease();
  }
  if (v6)
  {
    ((void (*)(void *))v7)(v10);
    sub_10000C59C((uint64_t)v7);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10000C5E4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  id v9 = self;
  sub_10000B2B4(v6, v7);
  sub_10000C59C((uint64_t)v6);
}

- (void)pairingStatusWithInfo:(id)a3 state:(int64_t)a4 metadata:(id)a5 error:(id)a6
{
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a6;
  v11 = self;
  sub_10000C1A0(a4, v9, a6);

  swift_bridgeObjectRelease();
}

- (_TtC18DKPairingUIService14ViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18DKPairingUIService14ViewController *)sub_10000A214(v5, v7, a4);
}

- (_TtC18DKPairingUIService14ViewController)initWithCoder:(id)a3
{
  return (_TtC18DKPairingUIService14ViewController *)sub_10000A3EC(a3);
}

- (void).cxx_destruct
{
  BOOL v3 = &self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger];
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  uint64_t v5 = *(void **)&self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService];
}

- (void)proxCardFlowDidDismiss
{
  objc_super v2 = self;
  sub_10000A75C();
}

@end