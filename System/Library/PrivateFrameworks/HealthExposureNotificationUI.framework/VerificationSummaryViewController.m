@interface VerificationSummaryViewController
- (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapLearnMoreButton;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
- (void)viewDidLoad;
@end

@implementation VerificationSummaryViewController

- (void)viewDidLoad
{
  v2 = self;
  VerificationSummaryViewController.viewDidLoad()();
}

- (void)didTapLearnMoreButton
{
  type metadata accessor for OnboardingInfoViewController();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v5);

  [(VerificationSummaryViewController *)v4 presentViewController:v6 animated:1 completion:0];
}

- (void)didTapPrimaryButton
{
  v2 = self;
  sub_2293C90A4();
}

- (void)didTapSecondaryButton
{
  v2 = self;
  sub_2293CA274();
}

- (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_primaryButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_secondaryButton);
}

@end