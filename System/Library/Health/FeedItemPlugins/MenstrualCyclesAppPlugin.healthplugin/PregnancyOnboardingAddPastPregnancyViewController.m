@interface PregnancyOnboardingAddPastPregnancyViewController
- (_TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation PregnancyOnboardingAddPastPregnancyViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241218D68();
}

- (void)hxui_primaryFooterButtonTapped
{
  v2 = self;
  sub_241219B5C();
}

- (void)hxui_cancelButtonTapped
{
  v2 = self;
  sub_241219E60();
}

- (_TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController_nextButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49PregnancyOnboardingAddPastPregnancyViewController____lazy_storage___hostingController);
}

@end