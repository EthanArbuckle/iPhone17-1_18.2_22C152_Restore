@interface HUUtilityOnboardingSelectLocationViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingSelectLocationViewController)initWithHome:(id)a3 context:(id)a4;
- (HUUtilityOnboardingSelectLocationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 itemTableViewController:(id)a7;
- (id)hu_preloadContent;
- (void)goToConnectedScreen:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingSelectLocationViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingSelectLocationViewController)initWithHome:(id)a3 context:(id)a4
{
  return (HUUtilityOnboardingSelectLocationViewController *)UtilityOnboardingLocationSelection.init(home:context:)(a3, (char *)a4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE54BD48();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UtilityOnboardingLocationSelection();
  v4 = (char *)v6.receiver;
  [(HUUtilityOnboardingSelectLocationViewController *)&v6 viewWillDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingFromParentViewController))
  {
    v5 = (id *)&v4[OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_delegate];
    swift_beginAccess();
    if (*v5) {
      objc_msgSend(*v5, sel_viewControllerDidGoBack_, v4);
    }
  }
}

- (void)goToConnectedScreen:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE54C120();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (id)hu_preloadContent
{
  id v2 = objc_msgSend(self, sel_futureWithNoResult);

  return v2;
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingSelectLocationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 itemTableViewController:(id)a7
{
  id v8 = a5;
  id v9 = a7;
  result = (HUUtilityOnboardingSelectLocationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_home));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_onboardingContext));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_connectAccountButton);
}

@end