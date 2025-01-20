@interface OnboardingRegionChangeSummaryViewController
- (_TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapPrimaryButton;
- (void)viewDidLoad;
@end

@implementation OnboardingRegionChangeSummaryViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  sub_2293A95EC();
  id v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);
}

- (void)didTapPrimaryButton
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController_flow);
  swift_getObjectType();
  objc_super v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();
}

- (_TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController_healthAgencyModel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI43OnboardingRegionChangeSummaryViewController_primaryButton);
}

@end