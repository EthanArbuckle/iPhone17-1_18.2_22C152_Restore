@interface HUUtilityOnboardingQuickLookupViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingQuickLookupViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingQuickLookupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6;
- (id)hu_preloadContent;
- (void)editAccountDetailsButtonTapped;
- (void)setDelegate:(id)a3;
- (void)verifyAddressAndSubmitTAF;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingQuickLookupViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingQuickLookupViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingQuickLookupViewController *)UtilityOnboardingQuickLookup.init(context:)((char *)a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE4A040C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UtilityOnboardingQuickLookup();
  v4 = (char *)v6.receiver;
  [(HUUtilityOnboardingQuickLookupViewController *)&v6 viewWillDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingFromParentViewController))
  {
    v5 = (id *)&v4[OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_delegate];
    swift_beginAccess();
    if (*v5) {
      objc_msgSend(*v5, sel_viewControllerDidGoBack_, v4);
    }
  }
}

- (void)editAccountDetailsButtonTapped
{
  v2 = self;
  sub_1BE4A0B34();
}

- (void)verifyAddressAndSubmitTAF
{
  v2 = self;
  sub_1BE4A0EAC();
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

- (HUUtilityOnboardingQuickLookupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  result = (HUUtilityOnboardingQuickLookupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_context));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_rootVC));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_accountDetails);
}

@end