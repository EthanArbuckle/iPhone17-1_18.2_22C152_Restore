@interface PregnancyOffboardingConfirmationViewController
- (_TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation PregnancyOffboardingConfirmationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_24155A79C();
}

- (void)hxui_primaryFooterButtonTapped
{
  v2 = self;
  sub_24155AB28();
}

- (_TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOffboardingConfirmationViewController_offboardingStep);

  sub_2412F4CFC(v3);
}

@end