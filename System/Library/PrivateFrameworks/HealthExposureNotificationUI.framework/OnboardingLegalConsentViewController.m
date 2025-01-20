@interface OnboardingLegalConsentViewController
- (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didConfirmAgree;
- (void)didConfirmDontAgree;
- (void)didTapCancel;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
- (void)viewDidLoad;
@end

@implementation OnboardingLegalConsentViewController

- (void)viewDidLoad
{
  v2 = self;
  OnboardingLegalConsentViewController.viewDidLoad()();
}

- (void)didTapPrimaryButton
{
  v2 = self;
  sub_2293E05B8();
}

- (void)didTapSecondaryButton
{
  v2 = self;
  sub_2293E0D9C();
}

- (void)didTapCancel
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();
}

- (void)didConfirmAgree
{
  v2 = self;
  sub_2293E0B54();
}

- (void)didConfirmDontAgree
{
  v2 = self;
  sub_2293E12A0();
}

- (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_primaryButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_secondaryButton);
}

@end