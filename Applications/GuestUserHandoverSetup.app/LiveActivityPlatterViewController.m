@interface LiveActivityPlatterViewController
- (BOOL)_canShowWhileLocked;
- (_TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController)initWithCoder:(id)a3;
- (_TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)endGuestUserModeButtonTapped;
- (void)tapGestureDetectedWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation LiveActivityPlatterViewController

- (_TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100009134();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100008570();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tapGestureDetectedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100009348("[%s] Tap gesture detected.", (uint64_t (*)(uint64_t, uint64_t))sub_100006574);
}

- (void)endGuestUserModeButtonTapped
{
  v2 = self;
  sub_100008DA4();
}

- (_TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_leadingAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_labelAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_tapGestureInterceptorView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22GuestUserHandoverSetup33LiveActivityPlatterViewController_endGuestUserModeButton);
}

@end