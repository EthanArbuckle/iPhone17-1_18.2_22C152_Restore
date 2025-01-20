@interface HUUtilityOnboardingTermsViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingTermsViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingTermsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6;
- (void)cancelOnboardingWithSender:(id)a3;
- (void)didAcceptConsentWithSender:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUUtilityOnboardingTermsViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingTermsViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingTermsViewController *)UtilityOnboardingTermsViewController.init(context:)((char *)a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE58E0E4();
}

- (void)cancelOnboardingWithSender:(id)a3
{
}

- (void)didAcceptConsentWithSender:(id)a3
{
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingTermsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  result = (HUUtilityOnboardingTermsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingTermsViewController_onboardingContext));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingTermsViewController_agreeButton);
}

@end