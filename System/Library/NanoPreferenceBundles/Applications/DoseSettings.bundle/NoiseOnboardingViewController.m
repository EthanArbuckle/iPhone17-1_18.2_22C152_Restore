@interface NoiseOnboardingViewController
- (BOOL)wantsLightenBlendedScreen;
- (NoiseOnboardingViewController)init;
- (NoiseOnboardingViewControllerDelegate)noiseOnboardingDelegate;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)setNoiseOnboardingDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NoiseOnboardingViewController

- (NoiseOnboardingViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)NoiseOnboardingViewController;
  v2 = [(NoiseOnboardingViewController *)&v4 init];
  [(NoiseOnboardingViewController *)v2 setStyle:74];
  return v2;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"ONBOARDING_TITLE" value:&stru_8600 table:0];
  v5 = [v2 localizedStringForKey:@"ONBOARDING_TITLE" value:v4 table:@"Noise"];

  return v5;
}

- (id)detailString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"ONBOARDING_SUBTITLE" value:&stru_8600 table:0];
  v5 = [v2 localizedStringForKey:@"ONBOARDING_SUBTITLE" value:v4 table:@"Noise"];

  return v5;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_8600 table:0];
  v5 = [v2 localizedStringForKey:@"ONBOARDING_CONTINUE" value:v4 table:@"Noise"];

  return v5;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"ONBOARDING_LATER" value:&stru_8600 table:0];
  v5 = [v2 localizedStringForKey:@"ONBOARDING_LATER" value:v4 table:@"Noise"];

  return v5;
}

- (id)imageResource
{
  return @"onboarding";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v3 = [(NoiseOnboardingViewController *)self noiseOnboardingDelegate];
  [v3 onboardingCompletedWithEnabled:1];
}

- (void)alternateButtonPressed:(id)a3
{
  id v3 = [(NoiseOnboardingViewController *)self noiseOnboardingDelegate];
  [v3 onboardingCompletedWithEnabled:0];
}

- (NoiseOnboardingViewControllerDelegate)noiseOnboardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noiseOnboardingDelegate);

  return (NoiseOnboardingViewControllerDelegate *)WeakRetained;
}

- (void)setNoiseOnboardingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end