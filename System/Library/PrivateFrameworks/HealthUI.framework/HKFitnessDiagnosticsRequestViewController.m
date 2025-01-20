@interface HKFitnessDiagnosticsRequestViewController
+ (BOOL)needsRequestedPermission;
+ (void)presentInViewController:(id)a3 completion:(id)a4;
- (BOOL)shouldInlineButtonTray;
- (id)completion;
- (id)improveHealthPrivacyIdentifier;
- (void)_disableDataCollection;
- (void)_enableDataCollection;
- (void)_showDataCollectionAdditionalInfo;
- (void)setCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKFitnessDiagnosticsRequestViewController

- (id)improveHealthPrivacyIdentifier
{
  return @"com.apple.onboarding.improvehealth";
}

- (void)viewDidLoad
{
  v52[2] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)HKFitnessDiagnosticsRequestViewController;
  [(OBBaseWelcomeController *)&v49 viewDidLoad];
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)@"UIA.Health.Onboarding.ImproveHealthAndActivity";

  v4 = self->_baseAutomationIdentifier;
  v5 = [(HKFitnessDiagnosticsRequestViewController *)self view];
  [v5 setAccessibilityIdentifier:v4];

  v6 = (void *)MEMORY[0x1E4F83A88];
  v7 = [(HKFitnessDiagnosticsRequestViewController *)self improveHealthPrivacyIdentifier];
  v48 = [v6 bundleWithIdentifier:v7];

  v8 = [MEMORY[0x1E4F83AE0] accessoryButton];
  v9 = NSString;
  v10 = [v48 privacyFlow];
  v11 = [v10 localizedButtonTitle];
  v47 = [v9 stringWithFormat:@"\n%@", v11];

  [v8 setTitle:v47 forState:0];
  v12 = [v8 titleLabel];
  [v12 setNumberOfLines:0];

  [v8 addTarget:self action:sel__showDataCollectionAdditionalInfo forControlEvents:64];
  v52[0] = self->_baseAutomationIdentifier;
  v52[1] = @"LearnMoreButton";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v14 = HKUIJoinStringsForAutomationIdentifier(v13);
  [v8 setAccessibilityIdentifier:v14];

  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"DATA_COLLECTION_MESSAGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addSectionWithHeader:&stru_1F3B9CF20 content:v16 accessoryButton:v8];

  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v18 = [v17 localizedStringForKey:@"DATA_COLLECTION_BODY_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addSectionWithHeader:v18 content:&stru_1F3B9CF20];

  v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v20 = [v19 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_1" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v20 description:0];

  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v22 = [v21 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_2" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v22 description:0];

  v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v24 = [v23 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_3" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v24 description:0];

  v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v26 = [v25 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_4" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v26 description:0];

  v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v28 = [v27 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_5" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v28 description:0];

  v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v30 = [v29 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_6" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v30 description:0];

  v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v32 = [v31 localizedStringForKey:@"DATA_COLLECTION_BODY_BULLET_7" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v32 description:0];

  v33 = [MEMORY[0x1E4F83A80] boldButton];
  [v33 addTarget:self action:sel__enableDataCollection forControlEvents:64];
  v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v35 = [v34 localizedStringForKey:@"DATA_COLLECTION_ENABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v33 setTitle:v35 forState:0];

  v51[0] = self->_baseAutomationIdentifier;
  v51[1] = @"EnableButton";
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  v37 = HKUIJoinStringsForAutomationIdentifier(v36);
  [v33 setAccessibilityIdentifier:v37];

  v38 = [(HKFitnessDiagnosticsRequestViewController *)self buttonTray];
  [v38 addButton:v33];

  v39 = [MEMORY[0x1E4F83AB8] linkButton];
  [v39 addTarget:self action:sel__disableDataCollection forControlEvents:64];
  v40 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v41 = [v40 localizedStringForKey:@"DATA_COLLECTION_DISABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v39 setTitle:v41 forState:0];

  v50[0] = self->_baseAutomationIdentifier;
  v50[1] = @"DisableButton";
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v43 = HKUIJoinStringsForAutomationIdentifier(v42);
  [v39 setAccessibilityIdentifier:v43];

  v44 = [(HKFitnessDiagnosticsRequestViewController *)self buttonTray];
  [v44 addButton:v39];

  v45 = [(HKFitnessDiagnosticsRequestViewController *)self headerView];
  LODWORD(v46) = 1045220557;
  [v45 setTitleHyphenationFactor:v46];
}

+ (void)presentInViewController:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [HKFitnessDiagnosticsRequestViewController alloc];
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"DATA_COLLECTION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v11 = [(OBTextWelcomeController *)v7 initWithTitle:v9];

  [(HKFitnessDiagnosticsRequestViewController *)v11 setCompletion:v5];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v11];
  [v10 setModalInPresentation:1];
  [v10 setModalPresentationStyle:2];
  [v6 presentViewController:v10 animated:1 completion:0];
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
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
    int v5 = [v4 hasHealthDataSubmissionAllowedBeenSet] ^ 1;
  }
  return v5;
}

- (void)_enableDataCollection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled Data Collection", buf, 0xCu);
  }
  uint64_t v4 = *MEMORY[0x1E4F65848];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke;
  v5[3] = &unk_1E6D512C8;
  v5[4] = self;
  [MEMORY[0x1E4F65860] setUserDidAccept:1 currentAgreement:v4 completion:v5];
}

void __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_2;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_3;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, 1);
  }
}

- (void)_disableDataCollection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disabled Data Collection", buf, 0xCu);
  }
  uint64_t v4 = *MEMORY[0x1E4F65848];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke;
  v5[3] = &unk_1E6D512C8;
  v5[4] = self;
  [MEMORY[0x1E4F65860] setUserDidAccept:0 currentAgreement:v4 completion:v5];
}

void __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_2;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_3;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) completion];
    v3[2](v3, 0);
  }
}

- (void)_showDataCollectionAdditionalInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting Privacy view controller", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F83AD8];
  int v5 = [(HKFitnessDiagnosticsRequestViewController *)self improveHealthPrivacyIdentifier];
  id v6 = [v4 presenterForPrivacySplashWithIdentifier:v5];

  v7 = [(HKFitnessDiagnosticsRequestViewController *)self navigationController];
  [v6 presentInNavigationStack:v7];
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