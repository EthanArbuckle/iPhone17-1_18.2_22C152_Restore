@interface AllowGuestProximityCardViewController
- (BOOL)_canShowWhileLocked;
- (_TtC22GuestUserHandoverSetup37AllowGuestProximityCardViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AllowGuestProximityCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000FEB8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100011048(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC22GuestUserHandoverSetup37AllowGuestProximityCardViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC22GuestUserHandoverSetup37AllowGuestProximityCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end