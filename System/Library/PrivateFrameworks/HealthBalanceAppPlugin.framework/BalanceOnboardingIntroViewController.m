@interface BalanceOnboardingIntroViewController
- (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation BalanceOnboardingIntroViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_250E67E8C();
}

- (void)hxui_primaryFooterButtonTapped
{
  uint64_t v3 = sub_250E79A48();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  id v8 = [(BalanceOnboardingIntroViewController *)v7 navigationController];
  if (v8)
  {
    v9 = v8;
    type metadata accessor for BalanceOnboardingNavigationController();
    if (swift_dynamicCastClass())
    {
      sub_250E74088();

      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F42B90], v3);
      sub_250E75844((uint64_t)v7, v6);
      swift_release();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

      return;
    }
  }
  sub_250E7B058();
  __break(1u);
}

- (void)hxui_cancelButtonTapped
{
  v2 = self;
  id v3 = [(BalanceOnboardingIntroViewController *)v2 navigationController];
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v4 = v3;
  type metadata accessor for BalanceOnboardingNavigationController();
  if (!swift_dynamicCastClass())
  {

LABEL_7:
    sub_250E7B058();
    __break(1u);
    return;
  }
  sub_250E74088();

  sub_250E75B4C();
  swift_release();
}

- (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end