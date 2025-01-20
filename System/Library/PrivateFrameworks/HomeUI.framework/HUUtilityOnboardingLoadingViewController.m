@interface HUUtilityOnboardingLoadingViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingLoadingViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingLoadingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUUtilityOnboardingLoadingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingLoadingViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingLoadingViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingLoadingViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingLoadingViewController *)UtilityOnboardingLoadingViewController.init(context:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE49A2B8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1BE49A95C(a3);
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingLoadingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (HUUtilityOnboardingLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingLoadingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (HUUtilityOnboardingLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingLoadingViewController_onboardingContext));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingLoadingViewController_rootVC);
}

@end