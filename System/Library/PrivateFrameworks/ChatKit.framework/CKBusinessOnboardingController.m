@interface CKBusinessOnboardingController
+ (BOOL)shouldShowBusinessOnboarding;
+ (void)checkForBusinessAlertsIDSIssues:(id)a3;
- (CKBusinessOnboardingController)initWithCompletionHandler:(id)a3;
- (id)completionHandler;
- (id)notNowActionHandler;
- (void)_addBusinessInitiatedBullets;
- (void)_setBusinessInitiatedFeatureStateOn:(BOOL)a3 completion:(id)a4;
- (void)continueButtonTapped:(id)a3;
- (void)notNowButtonTapped:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setNotNowActionHandler:(id)a3;
- (void)setupNotNowWithActionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKBusinessOnboardingController

+ (BOOL)shouldShowBusinessOnboarding
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"BusinessChatPrivacyPageDisplayed"];

  if (v3 > 2) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F6E730];

  return [v4 supportsBusinessChat];
}

+ (void)checkForBusinessAlertsIDSIssues:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6AB10]);
    v5 = (void *)[v4 initWithService:*MEMORY[0x1E4F6AA80] queue:MEMORY[0x1E4F14428]];
    v6 = [MEMORY[0x1E4F6AB00] optionsWithFeatureID:@"bia-opt-out"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__CKBusinessOnboardingController_checkForBusinessAlertsIDSIssues___block_invoke;
    v7[3] = &unk_1E5625588;
    id v8 = v3;
    [v5 retrieveFeatureToggleStateForOptions:v6 completion:v7];
  }
}

void __66__CKBusinessOnboardingController_checkForBusinessAlertsIDSIssues___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 success] && (objc_msgSend(v4, "state") == 3 || !objc_msgSend(v4, "state"))) {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v3();
}

- (CKBusinessOnboardingController)initWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CKBusinessOnboardingController.m", 65, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isBIAEnabled];

  id v8 = CKFrameworkBundle();
  v9 = v8;
  if (v7)
  {
    v10 = &stru_1EDE4CA38;
    v11 = [v8 localizedStringForKey:@"BUSINESS_INITIATED_ALERTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    v11 = [v8 localizedStringForKey:@"MESSAGES_FOR_BUSINESS" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v9 = CKFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"BUSINESS_DESCRIPTION_PLACEHOLDER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  v18.receiver = self;
  v18.super_class = (Class)CKBusinessOnboardingController;
  v12 = [(CKBusinessOnboardingController *)&v18 initWithTitle:v11 detailText:v10 icon:0];
  v13 = v12;
  if (v12)
  {
    [(CKBusinessOnboardingController *)v12 setCompletionHandler:v5];
    [(CKBusinessOnboardingController *)v13 setModalPresentationStyle:2];
    [(CKBusinessOnboardingController *)v13 setModalInPresentation:1];
    v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isBIAEnabled];

    if (v15) {
      [(CKBusinessOnboardingController *)v13 _addBusinessInitiatedBullets];
    }
  }

  return v13;
}

- (void)_addBusinessInitiatedBullets
{
  id v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_TRUST_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v5 = CKFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_TRUST_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKBusinessOnboardingController *)self addBulletedListItemWithTitle:v4 description:v6 symbolName:@"checkmark.seal.fill"];

  int v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_OPTOUT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v9 = CKFrameworkBundle();
  v10 = [v9 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_OPTOUT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKBusinessOnboardingController *)self addBulletedListItemWithTitle:v8 description:v10 symbolName:@"rectangle.portrait.and.arrow.right.fill"];

  CKFrameworkBundle();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = [v14 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_CHAT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v12 = CKFrameworkBundle();
  v13 = [v12 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_CHAT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKBusinessOnboardingController *)self addBulletedListItemWithTitle:v11 description:v13 symbolName:@"message.and.message.fill"];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CKBusinessOnboardingController;
  [(OBBaseWelcomeController *)&v8 viewDidLoad];
  id v3 = [MEMORY[0x1E4F83A80] boldButton];
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"CONTINUE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v3 setTitle:v5 forState:0];

  [v3 addTarget:self action:sel_continueButtonTapped_ forControlEvents:64];
  v6 = [(CKBusinessOnboardingController *)self buttonTray];
  [v6 addButton:v3];

  int v7 = [(CKBusinessOnboardingController *)self buttonTray];
  [v7 setPrivacyLinkForBundles:&unk_1EDF15308];
}

- (void)setupNotNowWithActionHandler:(id)a3
{
  id aBlock = a3;
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isBIAEnabled];

  if (v5)
  {
    if (!self->_notNowActionHandler)
    {
      v6 = [MEMORY[0x1E4F83AB8] linkButton];
      int v7 = CKFrameworkBundle();
      objc_super v8 = [v7 localizedStringForKey:@"BUSINESS_INITIATED_WELCOME_OPTOUT_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v6 setTitle:v8 forState:0];

      [v6 addTarget:self action:sel_notNowButtonTapped_ forControlEvents:64];
      v9 = [(CKBusinessOnboardingController *)self buttonTray];
      [v9 addButton:v6];
    }
    v10 = _Block_copy(aBlock);
    id notNowActionHandler = self->_notNowActionHandler;
    self->_id notNowActionHandler = v10;
  }
}

- (void)continueButtonTapped:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v5 setInteger:3 forKey:@"BusinessChatPrivacyPageDisplayed"];

  id location = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CKBusinessOnboardingController_continueButtonTapped___block_invoke;
  v6[3] = &unk_1E56215C8;
  objc_copyWeak(&v7, &location);
  [(CKBusinessOnboardingController *)self _setBusinessInitiatedFeatureStateOn:1 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__CKBusinessOnboardingController_continueButtonTapped___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained completionHandler];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    int v5 = [v4 completionHandler];
    v5[2]();

    id v6 = objc_loadWeakRetained(v1);
    [v6 setCompletionHandler:0];
  }
}

- (void)notNowButtonTapped:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CKBusinessOnboardingController_notNowButtonTapped___block_invoke;
  v5[3] = &unk_1E56215C8;
  objc_copyWeak(&v6, &location);
  [(CKBusinessOnboardingController *)self _setBusinessInitiatedFeatureStateOn:0 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__CKBusinessOnboardingController_notNowButtonTapped___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained notNowActionHandler];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    int v5 = [v4 notNowActionHandler];
    v5[2]();

    id v6 = objc_loadWeakRetained(v1);
    [v6 setNotNowActionHandler:0];
  }
}

- (void)_setBusinessInitiatedFeatureStateOn:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F6AB10]);
  id v7 = (void *)[v6 initWithService:*MEMORY[0x1E4F6AA80] queue:MEMORY[0x1E4F14428]];
  if (v4) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  v9 = [MEMORY[0x1E4F6AB08] optionsWithFeatureID:@"bia-opt-out" state:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__CKBusinessOnboardingController__setBusinessInitiatedFeatureStateOn_completion___block_invoke;
  v11[3] = &unk_1E56255B0;
  BOOL v13 = v4;
  id v12 = v5;
  id v10 = v5;
  [v7 updateFeatureToggleStateWithOptions:v9 completion:v11];
}

void __81__CKBusinessOnboardingController__setBusinessInitiatedFeatureStateOn_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v4 = @"On";
  }
  else {
    BOOL v4 = @"Off";
  }
  id v5 = v4;
  int v6 = [v3 success];
  id v7 = IMLogHandleForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138478083;
      v11 = @"bia-opt-out";
      __int16 v12 = 2112;
      BOOL v13 = v5;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKBusinessOnboardingController => Update \"%{private}@\" feature toggle with option %@ returned success", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __81__CKBusinessOnboardingController__setBusinessInitiatedFeatureStateOn_completion___block_invoke_cold_1((uint64_t)v5, v3, v8);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)notNowActionHandler
{
  return self->_notNowActionHandler;
}

- (void)setNotNowActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notNowActionHandler, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

void __81__CKBusinessOnboardingController__setBusinessInitiatedFeatureStateOn_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 138478339;
  id v5 = @"bia-opt-out";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 error];
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "CKBusinessOnboardingController => Update \"%{private}@\" feature toggle with option %@ returned error (%lu)", (uint8_t *)&v4, 0x20u);
}

@end