@interface HUUtilityOnboardingIntroViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingIntroViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUUtilityOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelButtonTapped:(id)a3;
- (void)continueButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUUtilityOnboardingIntroViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingIntroViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingIntroViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingIntroViewController *)UtilityOnboardingIntroViewController.init(context:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE46B01C();
}

- (void)continueButtonTapped:(id)a3
{
}

- (void)cancelButtonTapped:(id)a3
{
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (HUUtilityOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (HUUtilityOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingIntroViewController_onboardingContext));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingIntroViewController_continueButton);
}

@end