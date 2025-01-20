@interface OnboardingTimelineTutorialViewController
- (_TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation OnboardingTimelineTutorialViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2414E8268();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2414E9354(a3);
}

- (void)hxui_primaryFooterButtonTapped
{
  v2 = self;
  sub_2414E9470();
}

- (_TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_tutorialProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_stepLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_footerButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController____lazy_storage___cycleTimelineViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40OnboardingTimelineTutorialViewController_calendarCache));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end