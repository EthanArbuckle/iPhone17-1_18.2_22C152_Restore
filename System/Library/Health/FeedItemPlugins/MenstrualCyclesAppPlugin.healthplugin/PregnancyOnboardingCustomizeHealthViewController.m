@interface PregnancyOnboardingCustomizeHealthViewController
- (_TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation PregnancyOnboardingCustomizeHealthViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2414510DC();
}

- (void)hxui_primaryFooterButtonTapped
{
  char v2 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController_onboardingStep);
  v3 = self;
  swift_retain();
  sub_2415E7E28(v2, 2);

  swift_release();
}

- (void)hxui_cancelButtonTapped
{
  char v2 = self;
  sub_24145188C();
}

- (_TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin48PregnancyOnboardingCustomizeHealthViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end