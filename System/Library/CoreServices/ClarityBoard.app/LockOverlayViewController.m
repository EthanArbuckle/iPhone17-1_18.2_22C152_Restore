@interface LockOverlayViewController
- (BOOL)_canShowWhileLocked;
- (_TtC12ClarityBoard25LockOverlayViewController)initWithCoder:(id)a3;
- (_TtC12ClarityBoard25LockOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation LockOverlayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10007ED6C();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_10007F2BC();
  sub_10007F8B0(&qword_10017E450, (void (*)(uint64_t))sub_10007F2BC);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  v7 = self;
  sub_10007F73C();

  swift_bridgeObjectRelease();
}

- (_TtC12ClarityBoard25LockOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC12ClarityBoard25LockOverlayViewController *)sub_10007F008(v5, v7, a4);
}

- (_TtC12ClarityBoard25LockOverlayViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12ClarityBoard25LockOverlayViewController_hostingView) = 0;
  uint64_t v5 = OBJC_IVAR____TtC12ClarityBoard25LockOverlayViewController_dismissPublisher;
  sub_100029F90(&qword_10017E440);
  swift_allocObject();
  id v6 = a3;
  uint64_t v7 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)PassthroughSubject.init()();

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for LockOverlayViewController();
  id v8 = [(LockOverlayViewController *)&v10 initWithCoder:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12ClarityBoard25LockOverlayViewController_hostingView));

  swift_release();
}

@end