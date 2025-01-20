@interface CHASActivitySetupThreeRingsOnboardingViewController
- (CHASActivitySetupThreeRingsOnboardingViewController)initWithPresentationContext:(int64_t)a3;
- (CHASActivitySetupThreeRingsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (CHASActivitySetupThreeRingsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)delegate;
- (void)didTapAcceptButton;
- (void)didTapSkipButton;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CHASActivitySetupThreeRingsOnboardingViewController

- (CHASActivitySetupThreeRingsOnboardingViewController)initWithPresentationContext:(int64_t)a3
{
  return (CHASActivitySetupThreeRingsOnboardingViewController *)sub_1972C(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_199CC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_19E9C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_19F90(a3);
}

- (void)didTapAcceptButton
{
  v2 = self;
  sub_1A07C();
}

- (void)didTapSkipButton
{
  v3 = self;
  id v2 = [(CHASActivitySetupThreeRingsOnboardingViewController *)v3 delegate];
  if (v2)
  {
    [v2 buddyControllerDone:v3];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (CHASActivitySetupThreeRingsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (CHASActivitySetupThreeRingsOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CHASActivitySetupThreeRingsOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (CHASActivitySetupThreeRingsOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = &self->OBWelcomeController_opaque[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController__delegate];

  sub_17CB8((uint64_t)v3);
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return Strong;
}

@end