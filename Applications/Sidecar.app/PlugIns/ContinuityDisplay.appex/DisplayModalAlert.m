@interface DisplayModalAlert
- (BOOL)_canShowWhileLocked;
- (_TtC17ContinuityDisplay17DisplayModalAlert)initWithCoder:(id)a3;
- (_TtC17ContinuityDisplay17DisplayModalAlert)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_disconnectPressedWithSender:(id)a3;
- (void)loadView;
@end

@implementation DisplayModalAlert

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17ContinuityDisplay17DisplayModalAlert)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001FA6C();
}

- (void)loadView
{
  v2 = self;
  sub_10001FB90();
}

- (void)_disconnectPressedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000205A4();
}

- (_TtC17ContinuityDisplay17DisplayModalAlert)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10005E920();
  }
  id v5 = a4;
  sub_100020664();
}

- (void).cxx_destruct
{
  sub_10001A3E0((uint64_t)self + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_delegate);
  swift_errorRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_disconnectButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_mainLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_secondaryLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_debugLabel);
}

@end