@interface OnboardingAnalyticsViewController
- (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapDone;
- (void)didTapLearnMore;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
- (void)viewDidLoad;
@end

@implementation OnboardingAnalyticsViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  sub_229415E2C();
  id v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);
}

- (void)didTapPrimaryButton
{
  id v2 = self;
  sub_229416678();
}

- (void)didTapSecondaryButton
{
  id v2 = self;
  sub_229416B8C();
}

- (void)didTapLearnMore
{
  id v2 = self;
  sub_2293BE608();
}

- (void)didTapDone
{
}

- (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController_primaryButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController_secondaryButton);
}

@end