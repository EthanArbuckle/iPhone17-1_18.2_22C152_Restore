@interface HUUtilityOnboardingEnterOTPViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUUtilityOnboardingEnterOTPViewController)initWithContext:(id)a3;
- (HUUtilityOnboardingEnterOTPViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6;
- (id)hu_preloadContent;
- (void)clearButtonTapped:(id)a3;
- (void)navBarButtonTapped:(id)a3;
- (void)resendCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUUtilityOnboardingEnterOTPViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUConfigurationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingEnterOTPViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingEnterOTPViewController *)UtilityOnboardingEnterOTP.init(context:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE425B38();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UtilityOnboardingEnterOTP();
  v4 = (char *)v5.receiver;
  [(HUUtilityOnboardingEnterOTPViewController *)&v5 viewWillAppear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_codeTextField], sel_becomeFirstResponder, v5.receiver, v5.super_class);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UtilityOnboardingEnterOTP();
  v4 = (char *)v6.receiver;
  [(HUUtilityOnboardingEnterOTPViewController *)&v6 viewWillDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingFromParentViewController))
  {
    objc_super v5 = (id *)&v4[OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_delegate];
    swift_beginAccess();
    if (*v5) {
      objc_msgSend(*v5, sel_viewControllerDidGoBack_, v4);
    }
  }
}

- (void)clearButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.super.super.isa+ OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_codeTextField), sel_clearText);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)resendCode:(id)a3
{
}

- (void)navBarButtonTapped:(id)a3
{
}

- (id)hu_preloadContent
{
  id v2 = objc_msgSend(self, sel_futureWithNoResult);

  return v2;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1BE9C49F8();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1BE42AC20(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (Class)onboardingFlowClass
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA1144C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingEnterOTPViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  result = (HUUtilityOnboardingEnterOTPViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_onboardingContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_codeTextField));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_nextButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_resendCodeButton);
}

@end