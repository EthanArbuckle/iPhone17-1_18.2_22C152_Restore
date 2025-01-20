@interface HKImproveSafetyDataCollectionViewController
+ (BOOL)needsRequestedPermission;
+ (id)improveSafetyPrivacyIdentifier;
+ (id)localizedStringWithKey:(id)a3;
+ (void)presentInViewController:(id)a3 completion:(id)a4;
- (BOOL)shouldInlineButtonTray;
- (id)completion;
- (id)localizedStringWithKey:(id)a3;
- (void)_disableDataCollection;
- (void)_enableDataCollection;
- (void)_setDataCollectionToNewValue:(BOOL)a3;
- (void)_showDataCollectionAdditionalInfo;
- (void)setCompletion:(id)a3;
- (void)setUpButtons;
- (void)setUpContent;
- (void)viewDidLoad;
@end

@implementation HKImproveSafetyDataCollectionViewController

+ (void)presentInViewController:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F83A88];
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() improveSafetyPrivacyIdentifier];
  id v13 = [v5 bundleWithIdentifier:v8];

  v9 = [v13 privacyFlow];
  v10 = [v9 localizedShortTitle];

  v11 = [(OBTextWelcomeController *)[HKImproveSafetyDataCollectionViewController alloc] initWithTitle:v10];
  [(HKImproveSafetyDataCollectionViewController *)v11 setCompletion:v6];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v11];
  [v12 setModalInPresentation:1];
  [v7 presentViewController:v12 animated:1 completion:0];
}

+ (BOOL)needsRequestedPermission
{
  if (([MEMORY[0x1E4F2B860] isRunningStoreDemoMode] & 1) != 0
    || ([MEMORY[0x1E4F74230] sharedConnection],
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 isDiagnosticSubmissionAllowed],
        v2,
        !v3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F74230] sharedConnection];
    int v5 = [v4 hasSafetyDataSubmissionAllowedBeenSet] ^ 1;
  }
  return v5;
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

+ (id)improveSafetyPrivacyIdentifier
{
  return @"com.apple.onboarding.improveSafetyFeatures";
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HKImproveSafetyDataCollectionViewController;
  [(OBBaseWelcomeController *)&v6 viewDidLoad];
  int v3 = [(HKImproveSafetyDataCollectionViewController *)self headerView];
  LODWORD(v4) = 1045220557;
  [v3 setTitleHyphenationFactor:v4];

  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)@"UIA.Health.Onboarding.ImproveSafety";

  [(HKImproveSafetyDataCollectionViewController *)self setUpContent];
  [(HKImproveSafetyDataCollectionViewController *)self setUpButtons];
}

- (void)setUpContent
{
  v20[2] = *MEMORY[0x1E4F143B8];
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  double v4 = [(HKImproveSafetyDataCollectionViewController *)self view];
  [v4 setAccessibilityIdentifier:baseAutomationIdentifier];

  int v5 = (void *)MEMORY[0x1E4F83A88];
  objc_super v6 = [(id)objc_opt_class() improveSafetyPrivacyIdentifier];
  id v7 = [v5 bundleWithIdentifier:v6];

  v8 = [MEMORY[0x1E4F83AE0] accessoryButton];
  v9 = NSString;
  v10 = [v7 privacyFlow];
  v11 = [v10 localizedButtonTitle];
  v12 = [v9 stringWithFormat:@"\n%@", v11];

  [v8 setTitle:v12 forState:0];
  id v13 = [v8 titleLabel];
  [v13 setNumberOfLines:0];

  [v8 addTarget:self action:sel__showDataCollectionAdditionalInfo forControlEvents:64];
  v20[0] = self->_baseAutomationIdentifier;
  v20[1] = @"LearnMoreButton";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v15 = HKUIJoinStringsForAutomationIdentifier(v14);
  [v8 setAccessibilityIdentifier:v15];

  v16 = [(HKImproveSafetyDataCollectionViewController *)self localizedStringWithKey:@"IMPROVE_SAFETY_DESCRIPTION"];
  [(OBTextWelcomeController *)self addSectionWithHeader:&stru_1F3B9CF20 content:v16 accessoryButton:v8];

  v17 = [(HKImproveSafetyDataCollectionViewController *)self localizedStringWithKey:@"IMPROVE_SAFETY_EXAMPLES_HEADER_TITLE"];
  [(OBTextWelcomeController *)self addSectionWithHeader:v17 content:&stru_1F3B9CF20];

  v18 = [(HKImproveSafetyDataCollectionViewController *)self localizedStringWithKey:@"IMPROVE_SAFETY_EXAMPLES_BULLET_1"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v18 description:0];

  v19 = [(HKImproveSafetyDataCollectionViewController *)self localizedStringWithKey:@"IMPROVE_SAFETY_EXAMPLES_BULLET_2"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v19 description:0];
}

- (void)setUpButtons
{
  v14[2] = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F83A80] boldButton];
  [v3 addTarget:self action:sel__enableDataCollection forControlEvents:64];
  double v4 = [(HKImproveSafetyDataCollectionViewController *)self localizedStringWithKey:@"IMPROVE_SAFETY_ENABLE_BUTTON_TITLE"];
  [v3 setTitle:v4 forState:0];

  v14[0] = self->_baseAutomationIdentifier;
  v14[1] = @"EnableButton";
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  objc_super v6 = HKUIJoinStringsForAutomationIdentifier(v5);
  [v3 setAccessibilityIdentifier:v6];

  id v7 = [(HKImproveSafetyDataCollectionViewController *)self buttonTray];
  [v7 addButton:v3];

  v8 = [MEMORY[0x1E4F83AB8] linkButton];
  [v8 addTarget:self action:sel__disableDataCollection forControlEvents:64];
  v9 = [(HKImproveSafetyDataCollectionViewController *)self localizedStringWithKey:@"IMPROVE_SAFETY_DISABLE_BUTTON_TITLE"];
  [v8 setTitle:v9 forState:0];

  v13[0] = self->_baseAutomationIdentifier;
  v13[1] = @"DisableButton";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = HKUIJoinStringsForAutomationIdentifier(v10);
  [v8 setAccessibilityIdentifier:v11];

  v12 = [(HKImproveSafetyDataCollectionViewController *)self buttonTray];
  [v12 addButton:v8];
}

- (void)_enableDataCollection
{
}

- (void)_disableDataCollection
{
}

- (void)_setDataCollectionToNewValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v5 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set Improve Safety Data Collection to %d", buf, 0x12u);
  }
  objc_super v6 = [MEMORY[0x1E4F74230] sharedConnection];
  [v6 setSafetyDataSubmissionAllowed:v3];

  id v7 = [(HKImproveSafetyDataCollectionViewController *)self presentingViewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HKImproveSafetyDataCollectionViewController__setDataCollectionToNewValue___block_invoke;
  v8[3] = &unk_1E6D53A88;
  v8[4] = self;
  BOOL v9 = v3;
  [v7 dismissViewControllerAnimated:1 completion:v8];
}

void __76__HKImproveSafetyDataCollectionViewController__setDataCollectionToNewValue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));
  }
}

- (void)_showDataCollectionAdditionalInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    BOOL v9 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting Privacy view controller", (uint8_t *)&v8, 0xCu);
  }
  double v4 = (void *)MEMORY[0x1E4F83AD8];
  int v5 = [(id)objc_opt_class() improveSafetyPrivacyIdentifier];
  objc_super v6 = [v4 presenterForPrivacySplashWithIdentifier:v5];

  id v7 = [(HKImproveSafetyDataCollectionViewController *)self navigationController];
  [v6 presentInNavigationStack:v7];
}

+ (id)localizedStringWithKey:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  int v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v6 = [v5 localizedStringForKey:v4 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v6;
}

- (id)localizedStringWithKey:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() localizedStringWithKey:v3];

  return v4;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_baseAutomationIdentifier, 0);
}

@end