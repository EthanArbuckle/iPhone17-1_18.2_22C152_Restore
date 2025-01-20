@interface StatusBarViewController
- (BOOL)_canShowWhileLocked;
- (_TtC12ClarityBoard23StatusBarViewController)initWithCoder:(id)a3;
- (_TtC12ClarityBoard23StatusBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation StatusBarViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000ACCE0();
}

- (_TtC12ClarityBoard23StatusBarViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC12ClarityBoard23StatusBarViewController *)sub_1000AD9C4(v5, v7, a4);
}

- (_TtC12ClarityBoard23StatusBarViewController)initWithCoder:(id)a3
{
  return (_TtC12ClarityBoard23StatusBarViewController *)sub_1000ADBB8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12ClarityBoard23StatusBarViewController_statusBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12ClarityBoard23StatusBarViewController_sensorActivityIndicator));
  sub_10002A840((uint64_t)self + OBJC_IVAR____TtC12ClarityBoard23StatusBarViewController_sensorActivityShowDate, (uint64_t *)&unk_10017DE90);
  swift_release();

  swift_release();
}

@end