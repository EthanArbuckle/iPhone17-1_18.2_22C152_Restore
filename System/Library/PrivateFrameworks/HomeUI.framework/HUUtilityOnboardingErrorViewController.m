@interface HUUtilityOnboardingErrorViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingErrorViewController)initWithContext:(id)a3 error:(id)a4;
- (HUUtilityOnboardingErrorViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUUtilityOnboardingErrorViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)finishOnboarding:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUUtilityOnboardingErrorViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingErrorViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingErrorViewController)initWithContext:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (HUUtilityOnboardingErrorViewController *)UtilityOnboardingErrorViewController.init(context:error:)(v5, a4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE5711EC();
}

- (void)finishOnboarding:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE571A0C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingErrorViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (HUUtilityOnboardingErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingErrorViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (HUUtilityOnboardingErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingErrorViewController_onboardingContext);
}

@end