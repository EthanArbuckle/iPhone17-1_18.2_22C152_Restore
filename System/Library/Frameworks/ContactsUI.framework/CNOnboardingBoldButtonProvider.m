@interface CNOnboardingBoldButtonProvider
- (id)boldAlternateButton;
- (id)boldButton;
@end

@implementation CNOnboardingBoldButtonProvider

- (id)boldButton
{
  return (id)[MEMORY[0x1E4F83A78] boldButton];
}

- (id)boldAlternateButton
{
  return (id)[MEMORY[0x1E4F83A78] boldAlternateButton];
}

@end