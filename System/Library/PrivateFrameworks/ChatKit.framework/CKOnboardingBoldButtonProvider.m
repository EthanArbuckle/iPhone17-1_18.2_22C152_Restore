@interface CKOnboardingBoldButtonProvider
- (BOOL)shouldForceAlternateButton;
- (id)boldAlternateButton;
- (id)boldButton;
@end

@implementation CKOnboardingBoldButtonProvider

- (BOOL)shouldForceAlternateButton
{
  return 0;
}

- (id)boldAlternateButton
{
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x1E4F83A80] boldAlternateButton];
  }
  else {
  v2 = [MEMORY[0x1E4F83A80] boldButton];
  }

  return v2;
}

- (id)boldButton
{
  if ([(CKOnboardingBoldButtonProvider *)self shouldForceAlternateButton]) {
    [(CKOnboardingBoldButtonProvider *)self boldAlternateButton];
  }
  else {
  v3 = [MEMORY[0x1E4F83A80] boldButton];
  }

  return v3;
}

@end