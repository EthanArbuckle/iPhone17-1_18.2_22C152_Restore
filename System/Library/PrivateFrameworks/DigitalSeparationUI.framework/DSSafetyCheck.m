@interface DSSafetyCheck
+ (BOOL)isManagedAccount;
+ (BOOL)shouldShowHSA2Upgrade;
+ (BOOL)shouldSkipAuthenticationForController:(id)a3;
+ (BOOL)startWithPresentingViewController:(id)a3 withURL:(id)a4;
+ (id)safetyCheckViewController;
+ (void)authForSafetyCheckWithPresentingViewController:(id)a3 safetyCheckController:(id)a4;
+ (void)isChildOrTeenAccountWithCompletion:(id)a3;
+ (void)isManagedAccount;
+ (void)presentSafetyCheckWithViewController:(id)a3 navigationController:(id)a4;
+ (void)showHSA2UpgradeWithPresentingViewController:(id)a3 safetyCheckController:(id)a4;
+ (void)showManagedAccountAlertWithPresentingViewController:(id)a3;
+ (void)showlearnMoreForPresentingViewController:(id)a3 withURL:(id)a4;
+ (void)startEmergencyResetWithPresentingViewController:(id)a3;
+ (void)startManageSharingWithPresentingViewController:(id)a3;
+ (void)startReviewDeviceAccessWithPresentingViewController:(id)a3;
+ (void)startSafetyCheckWithPresentingViewController:(id)a3 safetyCheckController:(id)a4;
@end

@implementation DSSafetyCheck

+ (id)safetyCheckViewController
{
  v2 = objc_alloc_init(DSNavigationController);
  return v2;
}

+ (void)startSafetyCheckWithPresentingViewController:(id)a3 safetyCheckController:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (+[DSSafetyCheck isManagedAccount])
  {
    +[DSSafetyCheck showManagedAccountAlertWithPresentingViewController:v6];
  }
  else if (+[DSSafetyCheck shouldShowHSA2Upgrade])
  {
    +[DSSafetyCheck showHSA2UpgradeWithPresentingViewController:v6 safetyCheckController:v5];
  }
  else if (+[DSSafetyCheck shouldSkipAuthenticationForController:v5])
  {
    +[DSSafetyCheck presentSafetyCheckWithViewController:v6 navigationController:v5];
  }
  else
  {
    +[DSSafetyCheck authForSafetyCheckWithPresentingViewController:v6 safetyCheckController:v5];
  }
}

+ (void)startEmergencyResetWithPresentingViewController:(id)a3
{
  id v4 = a3;
  id v5 = [[DSNavigationController alloc] initStartingWithEmergencyReset];
  [a1 startSafetyCheckWithPresentingViewController:v4 safetyCheckController:v5];
}

+ (void)startManageSharingWithPresentingViewController:(id)a3
{
  id v4 = a3;
  id v5 = [[DSNavigationController alloc] initStartingWithMangeSharing];
  [a1 startSafetyCheckWithPresentingViewController:v4 safetyCheckController:v5];
}

+ (BOOL)startWithPresentingViewController:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[DSNavigationController alloc] initStartingWithURL:v7];
  if (v8)
  {
    [a1 startSafetyCheckWithPresentingViewController:v6 safetyCheckController:v8];
  }
  else
  {
    v9 = [v7 objectForKey:@"path"];
    if ([v9 containsString:@"#root"]) {
      AnalyticsSendEventLazy();
    }
  }
  return v8 != 0;
}

void *__59__DSSafetyCheck_startWithPresentingViewController_withURL___block_invoke()
{
  return &unk_26E91F920;
}

+ (void)authForSafetyCheckWithPresentingViewController:(id)a3 safetyCheckController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
  v9 = (void *)DSLog_3;
  DSLog_3 = (uint64_t)v8;

  id v10 = objc_alloc_init(MEMORY[0x263F10468]);
  id v30 = 0;
  int v11 = [v10 canEvaluatePolicy:2 error:&v30];
  id v12 = v30;
  v13 = v12;
  if (v11)
  {
    v14 = DSUILocStringForKey(@"SAFETY_CHECK_AUTH_REASON");
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke;
    v25[3] = &unk_264C6EED8;
    id v26 = v7;
    id v27 = v10;
    id v29 = a1;
    id v28 = v6;
    [v27 evaluatePolicy:2 localizedReason:v14 reply:v25];

    v15 = v26;
LABEL_3:

    goto LABEL_12;
  }
  v16 = [v12 domain];
  if ([v16 isEqualToString:*MEMORY[0x263F10440]])
  {
    uint64_t v17 = [v13 code];

    if (v17 == -5)
    {
      v18 = DSLog_3;
      if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235BFC000, v18, OS_LOG_TYPE_INFO, "Cannot evaluate authentication policy for Safety Check, no passcode set, allowing access.", buf, 2u);
      }
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_337;
      v19[3] = &unk_264C6EE90;
      id v20 = v7;
      id v21 = v10;
      id v23 = a1;
      id v22 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v19);

      v15 = v20;
      goto LABEL_3;
    }
  }
  else
  {
  }
  if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
    +[DSSafetyCheck authForSafetyCheckWithPresentingViewController:safetyCheckController:]();
  }
LABEL_12:
}

void __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = DSLog_3;
  if (!os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_INFO))
  {
    if (!a2) {
      goto LABEL_3;
    }
LABEL_6:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_334;
    block[3] = &unk_264C6EE90;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    long long v8 = *(_OWORD *)(a1 + 48);
    id v7 = (id)v8;
    long long v12 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);

    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  *(_DWORD *)buf = 67109120;
  int v14 = a2;
  _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "Asked user to auth for Safety Check on entry with success: %d", buf, 8u);
  if (a2) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v5) {
    goto LABEL_9;
  }
LABEL_7:
  if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
    __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_cold_1();
  }
LABEL_9:
}

uint64_t __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_334(uint64_t a1)
{
  [*(id *)(a1 + 32) setAuthContext:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  return [v2 presentSafetyCheckWithViewController:v3 navigationController:v4];
}

uint64_t __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_337(uint64_t a1)
{
  [*(id *)(a1 + 32) setAuthContext:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  return [v2 presentSafetyCheckWithViewController:v3 navigationController:v4];
}

+ (void)presentSafetyCheckWithViewController:(id)a3 navigationController:(id)a4
{
  id v5 = a4;
  [a3 presentViewController:v5 animated:1 completion:&__block_literal_global_339];
  +[DSDTOManager isRatchetActiveWithCompletion:&__block_literal_global_344];
  id v6 = v5;
  AnalyticsSendEventLazy();
}

void __75__DSSafetyCheck_presentSafetyCheckWithViewController_navigationController___block_invoke()
{
  id v0 = +[DSDeviceManager sharedInstance];
  [v0 appDidLaunch];
}

uint64_t __75__DSSafetyCheck_presentSafetyCheckWithViewController_navigationController___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return +[DSDTOManager protectUserLocationOnWebDuringDTO];
  }
  return result;
}

id __75__DSSafetyCheck_presentSafetyCheckWithViewController_navigationController___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"entrypoint";
  v1 = [*(id *)(a1 + 32) entryMethod];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)isChildOrTeenAccountWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F3BF48]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke;
  v6[3] = &unk_264C6EF20;
  id v7 = v3;
  id v5 = v3;
  [v4 startRequestWithCompletionHandler:v6];
}

void __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
    long long v8 = (void *)DSLog_3;
    DSLog_3 = (uint64_t)v7;

    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
      __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke_cold_1();
    }
  }
  [v5 members];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "isMe", (void)v15) && objc_msgSend(v14, "memberType"))
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

          goto LABEL_15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_15:
}

+ (BOOL)isManagedAccount
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = objc_msgSend(v3, "aa_altDSID");
  id v11 = 0;
  id v6 = [v4 authKitAccountWithAltDSID:v5 error:&v11];
  id v7 = v11;

  if (v7 && os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
    +[DSSafetyCheck isManagedAccount]();
  }
  long long v8 = [MEMORY[0x263F290F0] sharedInstance];
  BOOL v9 = [v8 securityLevelForAccount:v6] == 5;

  return v9;
}

+ (void)showManagedAccountAlertWithPresentingViewController:(id)a3
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = a3;
  id v5 = DSUILocStringForKey(@"MANAGED_ACCOUNT_TITLE");
  id v6 = DSUILocStringForKey(@"MANAGED_ACCOUNT_DETAIL");
  id v10 = [v3 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  id v7 = (void *)MEMORY[0x263F82400];
  long long v8 = DSUILocStringForKey(@"OK");
  BOOL v9 = [v7 actionWithTitle:v8 style:1 handler:&__block_literal_global_363];
  [v10 addAction:v9];

  [v4 presentViewController:v10 animated:1 completion:0];
  AnalyticsSendEventLazy();
}

void *__69__DSSafetyCheck_showManagedAccountAlertWithPresentingViewController___block_invoke_2()
{
  return &unk_26E91F948;
}

+ (BOOL)shouldShowHSA2Upgrade
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = objc_msgSend(v3, "aa_altDSID");
  id v11 = 0;
  id v6 = [v4 authKitAccountWithAltDSID:v5 error:&v11];
  id v7 = v11;

  if (v7 && os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
    +[DSSafetyCheck isManagedAccount]();
  }
  long long v8 = [MEMORY[0x263F290F0] sharedInstance];
  BOOL v9 = [v8 securityLevelForAccount:v6] != 4;

  return v9;
}

+ (void)showHSA2UpgradeWithPresentingViewController:(id)a3 safetyCheckController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  BOOL v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(v8, "aa_altDSID");
    id v11 = (void *)[objc_alloc(MEMORY[0x263F34A18]) initWithAltDSID:v10];
    [v11 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
    [v11 setDeviceToDeviceEncryptionUpgradeType:1];
    uint64_t v12 = DSUILocStringForKey(@"SAFETY_CHECK");
    [v11 setFeatureName:v12];

    [v11 setPresentingViewController:v5];
    v13 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v11];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3;
    v20[3] = &unk_264C6EF48;
    id v21 = v5;
    id v22 = v6;
    [v13 performDeviceToDeviceEncryptionStateRepairWithCompletion:v20];
  }
  else
  {
    int v14 = (void *)MEMORY[0x263F82418];
    long long v15 = DSUILocStringForKey(@"HSA2_NOT_REPAIRED_TITLE");
    long long v16 = DSUILocStringForKey(@"HSA2_NOT_REPAIRED_DETAIL");
    id v10 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

    long long v17 = (void *)MEMORY[0x263F82400];
    long long v18 = DSUILocStringForKey(@"OK");
    v19 = [v17 actionWithTitle:v18 style:1 handler:&__block_literal_global_389];
    [v10 addAction:v19];

    [v5 presentViewController:v10 animated:1 completion:0];
    AnalyticsSendEventLazy();
  }
}

void *__83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_2()
{
  return &unk_26E91F970;
}

void __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    AnalyticsSendEventLazy();
    +[DSSafetyCheck authForSafetyCheckWithPresentingViewController:*(void *)(a1 + 32) safetyCheckController:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      os_log_t v7 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
      long long v8 = (void *)DSLog_3;
      DSLog_3 = (uint64_t)v7;

      if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
        __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3_cold_1();
      }
      BOOL v9 = (void *)MEMORY[0x263F82418];
      id v10 = DSUILocStringForKey(@"HSA2_NOT_REPAIRED_TITLE");
      id v11 = [v9 alertControllerWithTitle:v10 message:0 preferredStyle:1];

      uint64_t v12 = (void *)MEMORY[0x263F82400];
      v13 = DSUILocStringForKey(@"OK");
      int v14 = [v12 actionWithTitle:v13 style:1 handler:&__block_literal_global_412];
      [v11 addAction:v14];

      [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
    }
    AnalyticsSendEventLazy();
  }
}

void *__83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_4()
{
  return &unk_26E91F998;
}

void *__83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_2_413()
{
  return &unk_26E91F9C0;
}

+ (void)showlearnMoreForPresentingViewController:(id)a3 withURL:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F16988];
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_alloc_init(v5);
  [v11 _setEphemeral:1];
  id v8 = objc_alloc(MEMORY[0x263F16980]);
  BOOL v9 = [NSURL URLWithString:v6];

  id v10 = (void *)[v8 initWithURL:v9 configuration:v11];
  [v7 presentViewController:v10 animated:1 completion:0];
}

+ (BOOL)shouldSkipAuthenticationForController:(id)a3
{
  return [a3 requiresAuthForEntry] ^ 1;
}

+ (void)startReviewDeviceAccessWithPresentingViewController:(id)a3
{
  id v3 = a3;
  id v4 = +[DSAlternateDeviceAccessManager sharedManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__DSSafetyCheck_startReviewDeviceAccessWithPresentingViewController___block_invoke;
  v6[3] = &unk_264C6EF98;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchAccessMethodsWithCompletion:v6];
}

void __69__DSSafetyCheck_startReviewDeviceAccessWithPresentingViewController___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__DSSafetyCheck_startReviewDeviceAccessWithPresentingViewController___block_invoke_2;
  block[3] = &unk_264C6EF70;
  char v10 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__DSSafetyCheck_startReviewDeviceAccessWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 48))
  {
    if (!v2)
    {
LABEL_9:
      v13 = [*(id *)(a1 + 40) presentingViewController];
      [v13 dismissViewControllerAnimated:1 completion:0];

      return;
    }
LABEL_7:
    os_log_t v4 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
    id v5 = (void *)DSLog_3;
    DSLog_3 = (uint64_t)v4;

    id v6 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
      __69__DSSafetyCheck_startReviewDeviceAccessWithPresentingViewController___block_invoke_2_cold_1(v3, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_9;
  }
  if (v2) {
    goto LABEL_7;
  }
  id v14 = +[DSAlternateDeviceAccessManager sharedManager];
  [v14 startPresentationWithNavigationController:*(void *)(a1 + 40)];
}

+ (void)authForSafetyCheckWithPresentingViewController:safetyCheckController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Cannot evaluate authentication policy for Safety Check, error %@, returning.", v2, v3, v4, v5, v6);
}

void __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error while evaluating authentication policy for Safety Check, error %@", v2, v3, v4, v5, v6);
}

void __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to fetch family members, error %@", v2, v3, v4, v5, v6);
}

+ (void)isManagedAccount
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to fetch AK Account, error: %{public}@", v2, v3, v4, v5, v6);
}

void __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to complete HSA2 repair with error: %@", v2, v3, v4, v5, v6);
}

void __69__DSSafetyCheck_startReviewDeviceAccessWithPresentingViewController___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end