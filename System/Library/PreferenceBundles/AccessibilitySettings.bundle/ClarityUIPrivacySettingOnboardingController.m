@interface ClarityUIPrivacySettingOnboardingController
- (ClarityUIPrivacySettingOnboardingController)initWithTitle:(id)a3 privacySpecifier:(id)a4 completion:(id)a5;
- (id)completionHandler;
- (void)cancelButtonTapped:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)updateContinueButtonForSpecifier:(id)a3;
@end

@implementation ClarityUIPrivacySettingOnboardingController

- (ClarityUIPrivacySettingOnboardingController)initWithTitle:(id)a3 privacySpecifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 propertyForKey:@"ClarityTCCExplanation"];
  v12 = [v8 propertyForKey:PSIconImageKey];
  if (!v12)
  {
    v13 = [v8 propertyForKey:PSLazyIconLoading];
    unsigned int v14 = [v13 BOOLValue];

    if (v14)
    {
      id v15 = [objc_alloc((Class)PSTableCell) initWithStyle:0 reuseIdentifier:0 specifier:v8];
      [v15 setSpecifier:v8];
      v12 = [v15 getLazyIcon];
    }
    else
    {
      v12 = 0;
    }
  }
  v16 = [[ClarityUISettingsWrapperController alloc] initWithPSSpecifier:v8];
  v21.receiver = self;
  v21.super_class = (Class)ClarityUIPrivacySettingOnboardingController;
  v17 = [(ClarityUIOnboardingSettingsWrapperController *)&v21 initWithTitle:v10 detailText:v11 icon:v12 controller:v16];

  if (v17)
  {
    id v18 = objc_retainBlock(v9);
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    [(ClarityUISettingsWrapperController *)v16 setDelegate:v17];
    [(ClarityUIOnboardingSettingsWrapperController *)v17 setNextButtonEnabled:0];
  }

  return v17;
}

- (void)nextButtonTapped:(id)a3
{
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)updateContinueButtonForSpecifier:(id)a3
{
  [(ClarityUIOnboardingSettingsWrapperController *)self setNextButtonEnabled:a3 != 0];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end