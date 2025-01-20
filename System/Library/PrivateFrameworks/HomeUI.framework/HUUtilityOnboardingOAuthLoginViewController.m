@interface HUUtilityOnboardingOAuthLoginViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingOAuthLoginViewController)initWithCoder:(id)a3;
- (HUUtilityOnboardingOAuthLoginViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingOAuthLoginViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingOAuthLoginViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUUtilityOnboardingOAuthLoginViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingOAuthLoginViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingOAuthLoginViewController *)UtilityOnboardingOAuthLoginView.init(context:)((char *)a3);
}

- (HUUtilityOnboardingOAuthLoginViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE3EF7F8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE3EDB74();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE3EF890();

  return v6;
}

- (Class)onboardingFlowClass
{
  sub_1BE3EFB08();

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingOAuthLoginViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (HUUtilityOnboardingOAuthLoginViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingOAuthLoginViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingOAuthLoginViewController_loginManager));

  swift_bridgeObjectRelease();
}

@end