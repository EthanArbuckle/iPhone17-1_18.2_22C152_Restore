@interface PregnancyOnboardingIntroductionViewController
- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation PregnancyOnboardingIntroductionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_24156FA78();
}

- (void)hxui_primaryFooterButtonTapped
{
  char v2 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController_onboardingStep);
  v3 = self;
  swift_retain();
  sub_2415E7E28(v2, 2);

  swift_release();
}

- (void)hxui_cancelButtonTapped
{
  char v2 = self;
  sub_241570134();
}

- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingIntroductionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end