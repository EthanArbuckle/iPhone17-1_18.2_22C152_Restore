@interface ClarityAppSetupNavigationController
- (ClarityAppSetupNavigationController)initWithSetupController:(id)a3;
- (ClarityAppSetupNavigationControllerDelegate)delegate;
- (ClarityUIAppSetupController)appSetupController;
- (NSMutableArray)setupControllers;
- (NSString)bundleIdentifier;
- (id)appSetupCompletion;
- (int64_t)_currentIndex;
- (void)_cancelAppOnboarding;
- (void)_completeAppOnboarding;
- (void)_continueAppOnboarding;
- (void)setAppSetupCompletion:(id)a3;
- (void)setAppSetupController:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSetupControllers:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClarityAppSetupNavigationController

- (ClarityAppSetupNavigationController)initWithSetupController:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ClarityAppSetupNavigationController;
  v6 = [(ClarityOnboardingNavigationWrapperController *)&v34 initWithController:0 shouldPresentWithAnimation:1];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [v5 bundleIdentifier];
  bundleIdentifier = v6->_bundleIdentifier;
  v6->_bundleIdentifier = (NSString *)v7;

  p_appSetupController = (id *)&v6->_appSetupController;
  objc_storeStrong((id *)&v6->_appSetupController, a3);
  [(ClarityUIAppSetupController *)v6->_appSetupController setDelegate:v6];
  objc_initWeak(&location, v6);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __63__ClarityAppSetupNavigationController_initWithSetupController___block_invoke;
  v31[3] = &unk_208F28;
  objc_copyWeak(&v32, &location);
  v10 = objc_retainBlock(v31);
  id appSetupCompletion = v6->_appSetupCompletion;
  v6->_id appSetupCompletion = v10;

  uint64_t v12 = objc_opt_new();
  setupControllers = v6->_setupControllers;
  v6->_setupControllers = (NSMutableArray *)v12;

  v14 = +[ClarityUIAppSetupCoordinator sharedInstance];
  unsigned int v15 = [v14 bundleIdentifierHasClaritySettings:v6->_bundleIdentifier includingSystem:0];

  if (v15) {
    [(NSMutableArray *)v6->_setupControllers addObject:*p_appSetupController];
  }
  v16 = +[ClarityUIAppSetupCoordinator sharedInstance];
  v17 = [v16 appNameForBundleIdentifier:v6->_bundleIdentifier];

  v18 = [*p_appSetupController dataSource];
  v19 = [v18 privacySpecifiers];

  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = __63__ClarityAppSetupNavigationController_initWithSetupController___block_invoke_2;
  v28 = &unk_209AD0;
  id v20 = v17;
  id v29 = v20;
  v21 = v6;
  v30 = v21;
  [v19 enumerateObjectsUsingBlock:&v25];
  unint64_t v22 = [(ClarityAppSetupNavigationController *)v21 _currentIndex];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  if ((v22 & 0x8000000000000000) != 0) {
    v23 = 0;
  }
  else {
LABEL_5:
  }
    v23 = v6;

  return v23;
}

void __63__ClarityAppSetupNavigationController_initWithSetupController___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2) {
    [WeakRetained _continueAppOnboarding];
  }
  else {
    [WeakRetained _cancelAppOnboarding];
  }
}

void __63__ClarityAppSetupNavigationController_initWithSetupController___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 propertyForKey:@"ClarityTCCExplanation"];

  if (v3)
  {
    id v4 = [v11 identifier];
    unsigned int v5 = [v4 isEqualToString:@"Allow Tracking"];

    if (v5)
    {
      v6 = settingsLocString(@"PRIVACY_ALLOW_APP_TO_TRACK", @"ClarityUISettings");
      uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, *(void *)(a1 + 32));
    }
    else
    {
      v6 = settingsLocString(@"PRIVACY_ALLOW_APP_TO_ACCESS", @"ClarityUISettings");
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = [v11 name];
      uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8, v9);
    }
    [v11 setProperty:*(void *)(a1 + 32) forKey:@"ClarityTCCAppNameKey"];
    v10 = [[ClarityUIPrivacySettingOnboardingController alloc] initWithTitle:v7 privacySpecifier:v11 completion:*(void *)(*(void *)(a1 + 40) + 64)];
    [*(id *)(*(void *)(a1 + 40) + 56) addObject:v10];
  }
}

- (void)viewDidLoad
{
  v3 = [(NSMutableArray *)self->_setupControllers objectAtIndex:[(ClarityAppSetupNavigationController *)self _currentIndex]];
  [(ClarityOnboardingNavigationWrapperController *)self setController:v3];
  v4.receiver = self;
  v4.super_class = (Class)ClarityAppSetupNavigationController;
  [(ClarityAppSetupNavigationController *)&v4 viewDidLoad];
}

- (void)_continueAppOnboarding
{
  int64_t v3 = [(ClarityAppSetupNavigationController *)self _currentIndex];
  if (v3 < 0)
  {
    [(ClarityAppSetupNavigationController *)self _completeAppOnboarding];
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_setupControllers objectAtIndex:v3];
    objc_super v4 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
    [v4 pushViewController:v5 animated:1];
  }
}

- (int64_t)_currentIndex
{
  int64_t v3 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  objc_super v4 = [v3 viewControllers];
  unint64_t v5 = (unint64_t)[v4 count];

  return (int64_t)[(NSMutableArray *)self->_setupControllers count] + ~v5;
}

- (void)_completeAppOnboarding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nextButtonTappedForBundleIdentifier:self->_bundleIdentifier];
}

- (void)_cancelAppOnboarding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelButtonTappedForBundleIdentifier:self->_bundleIdentifier];
}

- (ClarityAppSetupNavigationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ClarityAppSetupNavigationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (ClarityUIAppSetupController)appSetupController
{
  return self->_appSetupController;
}

- (void)setAppSetupController:(id)a3
{
}

- (NSMutableArray)setupControllers
{
  return self->_setupControllers;
}

- (void)setSetupControllers:(id)a3
{
}

- (id)appSetupCompletion
{
  return self->_appSetupCompletion;
}

- (void)setAppSetupCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appSetupCompletion, 0);
  objc_storeStrong((id *)&self->_setupControllers, 0);
  objc_storeStrong((id *)&self->_appSetupController, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end