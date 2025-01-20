@interface HUUtilityOnboardingNoAccountViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingNoAccountViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingNoAccountViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUUtilityOnboardingNoAccountViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)closeButtonWith_sender:(id)a3;
- (void)editDetails:(id)a3;
- (void)providerAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUUtilityOnboardingNoAccountViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingNoAccountViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingNoAccountViewController *)UtilityOnboardingNoAccountViewController.init(context:)((char *)a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE510D24();
}

- (void)closeButtonWith_sender:(id)a3
{
}

- (void)editDetails:(id)a3
{
}

- (void)providerAccount:(id)a3
{
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE514028();

  return v6;
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingNoAccountViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (HUUtilityOnboardingNoAccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingNoAccountViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (HUUtilityOnboardingNoAccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_onboardingContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_loginManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_editButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_providerAccountButton);
}

@end