@interface CNKCNSharedProfileOnboardingController
- (CNSharedProfileOnboardingController)onboardingController;
- (void)presentOnboardingControllerFrom:(id)a3 withContactStore:(id)a4;
- (void)presentOnboardingControllerOnLaunchIfNeededFrom:(id)a3 withContactStore:(id)a4;
- (void)setOnboardingController:(id)a3;
@end

@implementation CNKCNSharedProfileOnboardingController

- (void)presentOnboardingControllerOnLaunchIfNeededFrom:(id)a3 withContactStore:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1BBF8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithContactStore:v7];

  [(CNKCNSharedProfileOnboardingController *)self setOnboardingController:v9];
  id v10 = [(CNKCNSharedProfileOnboardingController *)self onboardingController];
  [v10 presentOnboardingFlowIfNeededForMode:1 fromViewController:v8];
}

- (void)setOnboardingController:(id)a3
{
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)presentOnboardingControllerFrom:(id)a3 withContactStore:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1BBF8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithContactStore:v7];

  [(CNKCNSharedProfileOnboardingController *)self setOnboardingController:v9];
  id v10 = [(CNKCNSharedProfileOnboardingController *)self onboardingController];
  [v10 startOnboardingOrEditForMode:1 fromViewController:v8];
}

- (void).cxx_destruct
{
}

@end