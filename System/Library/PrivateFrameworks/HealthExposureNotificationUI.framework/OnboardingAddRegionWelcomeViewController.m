@interface OnboardingAddRegionWelcomeViewController
- (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapHowExposureNotificationsWork;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
- (void)viewDidLoad;
@end

@implementation OnboardingAddRegionWelcomeViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_229414C60();
}

- (void)didTapHowExposureNotificationsWork
{
  type metadata accessor for OnboardingInfoViewController();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v5);

  [(OnboardingAddRegionWelcomeViewController *)v4 presentViewController:v6 animated:1 completion:0];
}

- (void)didTapPrimaryButton
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  id v5 = self;
  v4();
}

- (void)didTapSecondaryButton
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  id v5 = self;
  v4();
}

- (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_primaryButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_secondaryButton);
}

@end