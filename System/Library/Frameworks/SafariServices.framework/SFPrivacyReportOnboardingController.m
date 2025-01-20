@interface SFPrivacyReportOnboardingController
+ (id)_createEnableRecommendedProtectionControllerWithCompletionHandler:(id)a3;
+ (id)_createEnableTrackerProtectionControllerWithCompletionHandler:(id)a3;
+ (id)onboardingViewControllerWithCompletionHandler:(id)a3;
@end

@implementation SFPrivacyReportOnboardingController

+ (id)onboardingViewControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F98CF0] sharedManager];
  if ([v5 isPrivacyProxyActive])
  {
    v6 = [MEMORY[0x1E4F98CF0] sharedManager];
    int v7 = [v6 isPrivacyProxyOnForEitherTier];

    if (!v7)
    {
      uint64_t v8 = [a1 _createEnableRecommendedProtectionControllerWithCompletionHandler:v4];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v8 = [a1 _createEnableTrackerProtectionControllerWithCompletionHandler:v4];
LABEL_6:
  v9 = (void *)v8;

  return v9;
}

+ (id)_createEnableTrackerProtectionControllerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"Shield");
  id v5 = objc_alloc((Class)getOBWelcomeControllerClass());
  v6 = _WBSLocalizedString();
  int v7 = _WBSLocalizedString();
  uint64_t v8 = (void *)[v5 initWithTitle:v6 detailText:v7 icon:v4];

  v9 = [getOBBoldTrayButtonClass() boldButton];
  v10 = _WBSLocalizedString();
  [v9 setTitle:v10 forState:0];

  v11 = (void *)MEMORY[0x1E4FB13F0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__SFPrivacyReportOnboardingController__createEnableTrackerProtectionControllerWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E5C72C88;
  id v19 = v3;
  id v12 = v3;
  v13 = [v11 actionWithTitle:&stru_1EFB97EB8 image:0 identifier:0 handler:v18];
  [v9 addAction:v13 forControlEvents:0x2000];

  v14 = [v8 buttonTray];
  [v14 addButton:v9];

  v15 = [v8 buttonTray];
  v16 = createPromptCancelButtonWithCompletionHandler(v12);
  [v15 addButton:v16];

  return v8;
}

uint64_t __101__SFPrivacyReportOnboardingController__createEnableTrackerProtectionControllerWithCompletionHandler___block_invoke(uint64_t a1)
{
  enableTrackerProtection();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

+ (id)_createEnableRecommendedProtectionControllerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F98CF0] sharedManager];
  [v4 isPrivacyProxyOnInICloudSettings];
  id v5 = _WBSLocalizedString();

  v6 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"Shield");
  id v7 = objc_alloc((Class)getOBWelcomeControllerClass());
  uint64_t v8 = _WBSLocalizedString();
  v9 = (void *)[v7 initWithTitle:v8 detailText:v5 icon:v6];

  v10 = [v9 headerView];
  LODWORD(v11) = 1036831949;
  [v10 setTitleHyphenationFactor:v11];

  id v12 = [getOBBoldTrayButtonClass() boldButton];
  v13 = _WBSLocalizedString();
  [v12 setTitle:v13 forState:0];

  v14 = (void *)MEMORY[0x1E4FB13F0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __105__SFPrivacyReportOnboardingController__createEnableRecommendedProtectionControllerWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E5C72C88;
  id v22 = v3;
  id v15 = v3;
  v16 = [v14 actionWithTitle:&stru_1EFB97EB8 image:0 identifier:0 handler:v21];
  [v12 addAction:v16 forControlEvents:0x2000];

  v17 = [v9 buttonTray];
  [v17 addButton:v12];

  v18 = [v9 buttonTray];
  id v19 = createPromptCancelButtonWithCompletionHandler(v15);
  [v18 addButton:v19];

  return v9;
}

uint64_t __105__SFPrivacyReportOnboardingController__createEnableRecommendedProtectionControllerWithCompletionHandler___block_invoke(uint64_t a1)
{
  enableTrackerProtection();
  v2 = [MEMORY[0x1E4F98CF0] sharedManager];
  [v2 setPrivacyProxyEnabled:1 completionHandler:&__block_literal_global_13];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

@end