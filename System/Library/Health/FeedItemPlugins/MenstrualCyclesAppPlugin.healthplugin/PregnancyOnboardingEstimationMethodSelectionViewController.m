@interface PregnancyOnboardingEstimationMethodSelectionViewController
- (_TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)hxui_secondaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation PregnancyOnboardingEstimationMethodSelectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_24154E8F0();
}

- (void)hxui_primaryFooterButtonTapped
{
  char v2 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController_onboardingStep);
  v3 = self;
  swift_retain();
  sub_2415E7E28(v2, 2);

  swift_release();
}

- (void)hxui_secondaryFooterButtonTapped
{
  char v2 = self;
  sub_24154EFD0();
}

- (void)hxui_cancelButtonTapped
{
  char v2 = self;
  sub_24154F0BC();
}

- (_TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController____lazy_storage___estimationMethodSelectionButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin58PregnancyOnboardingEstimationMethodSelectionViewController____lazy_storage___hostingController);
}

@end