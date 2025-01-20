@interface OnboardingRegionAlreadyExistsViewController
- (_TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapPrimaryButton;
- (void)openAppButtonTapped;
- (void)viewDidLoad;
@end

@implementation OnboardingRegionAlreadyExistsViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OnboardingRegionAlreadyExistsViewController();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_2294180F8();
}

- (void)didTapPrimaryButton
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();
}

- (void)openAppButtonTapped
{
  id v2 = self;
  sub_2294188F8();
}

- (_TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController_healthAgencyModel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI43OnboardingRegionAlreadyExistsViewController_primaryButton);
}

@end