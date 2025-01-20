@interface BalanceOnboardingNotificationsViewController
- (_TtC22HealthBalanceAppPlugin44BalanceOnboardingNotificationsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC22HealthBalanceAppPlugin44BalanceOnboardingNotificationsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)hxui_secondaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation BalanceOnboardingNotificationsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_250E6D7E0();
}

- (void)hxui_primaryFooterButtonTapped
{
  v2 = self;
  sub_250E6DAF8();
}

- (void)hxui_secondaryFooterButtonTapped
{
  v2 = self;
  sub_250E6DD88();
}

- (void)hxui_cancelButtonTapped
{
  v2 = self;
  sub_250E6E010();
}

- (_TtC22HealthBalanceAppPlugin44BalanceOnboardingNotificationsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC22HealthBalanceAppPlugin44BalanceOnboardingNotificationsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22HealthBalanceAppPlugin44BalanceOnboardingNotificationsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC22HealthBalanceAppPlugin44BalanceOnboardingNotificationsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end