@interface AKAlertHandler
+ (AKAlertHandler)sharedInstance;
- (AKAlertHandlerUIProvider)uiProvider;
- (BOOL)_shouldShowAlertForManagedAccount:(id)a3 error:(id)a4;
- (BOOL)showAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5;
- (BOOL)showAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5 cancelAction:(id)a6;
- (id)_URLWithString:(id)a3 byAppendingParameters:(id)a4;
- (id)notificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6;
- (void)_openSpyglass;
- (void)_openUpgradeAccountSecurityLevelWithBundleID:(id)a3;
- (void)_showAlertForAccountNotSupportedWithCompletion:(id)a3;
- (void)_showAlertForCannotFindServerWithCompletion:(id)a3;
- (void)_showAlertForInsufficientSecurityLevelWithError:(id)a3 completionHandler:(id)a4;
- (void)_showAlertForInvalidContextWithCompletion:(id)a3;
- (void)_showAlertForManagedAccount:(id)a3 error:(id)a4 withCompletion:(id)a5;
- (void)_showAlertForMissingAppleAccountWithCompletion:(id)a3;
- (void)_showAlertForPasscodeSetupWithCompletion:(id)a3;
- (void)_showAlertForUnderageAccount:(id)a3 withCompletion:(id)a4;
- (void)_showAlertForUnverifiedEmailWithCompletion:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)showAlertForError:(id)a3 withAuthKitAccount:(id)a4 withCompletion:(id)a5;
- (void)showAlertForError:(id)a3 withCompletion:(id)a4;
@end

@implementation AKAlertHandler

+ (AKAlertHandler)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_32);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;

  return (AKAlertHandler *)v2;
}

uint64_t __32__AKAlertHandler_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = objc_alloc_init(AKAlertHandler);

  return MEMORY[0x1F41817F8]();
}

- (void)showAlertForError:(id)a3 withCompletion:(id)a4
{
}

- (void)showAlertForError:(id)a3 withAuthKitAccount:(id)a4 withCompletion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "AlertHandler called with error: %@", (uint8_t *)&v16, 0xCu);
  }

  if ([v8 code] != -7003)
  {
    if ([v8 code] == -7006 || objc_msgSend(v8, "code") == -7075)
    {
      v12 = (void (*)(void *, uint64_t, void))v10[2];
    }
    else
    {
      if ([v8 code] == -7044)
      {
        [(AKAlertHandler *)self _showAlertForInvalidContextWithCompletion:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7022)
      {
        [(AKAlertHandler *)self _showAlertForMissingAppleAccountWithCompletion:v10];
        goto LABEL_11;
      }
      if ([(AKAlertHandler *)self _shouldShowAlertForManagedAccount:v9 error:v8])
      {
        [(AKAlertHandler *)self _showAlertForManagedAccount:v9 error:v8 withCompletion:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7027)
      {
        [(AKAlertHandler *)self _showAlertForAccountNotSupportedWithCompletion:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7072)
      {
        [(AKAlertHandler *)self _showAlertForUnverifiedEmailWithCompletion:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7070)
      {
        [(AKAlertHandler *)self _showAlertForInsufficientSecurityLevelWithError:v8 completionHandler:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7005)
      {
        [(AKAlertHandler *)self _showAlertForCannotFindServerWithCompletion:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7076)
      {
        [(AKAlertHandler *)self _showAlertForUnderageAccount:v9 withCompletion:v10];
        goto LABEL_11;
      }
      if ([v8 code] == -7080)
      {
        [(AKAlertHandler *)self _showAlertForPasscodeSetupWithCompletion:v10];
        goto LABEL_11;
      }
      uint64_t v15 = [v8 code];
      v12 = (void (*)(void *, uint64_t, void))v10[2];
      if (v15 == -7034) {
        goto LABEL_5;
      }
    }
    v13 = v10;
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  v12 = (void (*)(void *, uint64_t, void))v10[2];
LABEL_5:
  v13 = v10;
  uint64_t v14 = 1;
LABEL_10:
  v12(v13, v14, 0);
LABEL_11:
}

- (void)_showAlertForInvalidContextWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[AKDevice currentDevice];
  char v6 = [v5 isInternalBuild];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_INVALID_CONTEXT_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

    id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    v10 = [v9 localizedStringForKey:@"AUTH_ERROR_ALERT_INVALID_CONTEXT_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];

    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    v12 = [v11 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_OK" value:&stru_1EE40D360 table:@"Localizable"];

    v13 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v8 message:v10 defaultButton:v12 alternateButton:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke;
    v16[3] = &unk_1E5760FC8;
    id v17 = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_46;
    v14[3] = &unk_1E5760FC8;
    id v15 = v17;
    [(AKAlertHandler *)self showAlert:v13 primaryAction:v16 altAction:v14];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

uint64_t __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_46(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_46_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForMissingAppleAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  if ([@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE" containsString:@"REBRAND"])
  {
    char v6 = [v5 localizedStringForKey:@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE" value:&stru_1EE40D360 table:@"Localizable"];
  }
  else
  {
    v7 = +[AKFeatureManager sharedManager];
    if ([v7 isAABrandingEnabled])
    {
      id v8 = [@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE" stringByAppendingString:@"_REBRAND"];
      char v6 = [v5 localizedStringForKey:v8 value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      char v6 = [v5 localizedStringForKey:@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE" value:&stru_1EE40D360 table:@"Localizable"];
    }
  }
  id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  if ([@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE" containsString:@"REBRAND"])
  {
    v10 = [v9 localizedStringForKey:@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
  }
  else
  {
    v11 = +[AKFeatureManager sharedManager];
    if ([v11 isAABrandingEnabled])
    {
      v12 = [@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE" stringByAppendingString:@"_REBRAND"];
      v10 = [v9 localizedStringForKey:v12 value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      v10 = [v9 localizedStringForKey:@"AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
    }
  }
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  uint64_t v14 = [v13 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_SETTINGS" value:&stru_1EE40D360 table:@"Localizable"];

  id v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  int v16 = [v15 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_CLOSE" value:&stru_1EE40D360 table:@"Localizable"];

  id v17 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v6 message:v10 defaultButton:v14 alternateButton:v16];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke;
  v21[3] = &unk_1E57608A0;
  v21[4] = self;
  id v22 = v4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2;
  v19[3] = &unk_1E5760FC8;
  id v20 = v22;
  id v18 = v22;
  [(AKAlertHandler *)self showAlert:v17 primaryAction:v21 altAction:v19];
}

uint64_t __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openSpyglass];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForAccountNotSupportedWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  char v6 = [v5 localizedStringForKey:@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  if ([@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" containsString:@"REBRAND"])
  {
    id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
  }
  else
  {
    id v9 = +[AKFeatureManager sharedManager];
    if ([v9 isAABrandingEnabled])
    {
      v10 = [@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" stringByAppendingString:@"_REBRAND"];
      id v8 = [v7 localizedStringForKey:v10 value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
    }
  }
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v12 = [v11 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_OK" value:&stru_1EE40D360 table:@"Localizable"];

  v13 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v6 message:v8 defaultButton:v12 alternateButton:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke;
  v17[3] = &unk_1E5760FC8;
  id v18 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke_2;
  v15[3] = &unk_1E5760FC8;
  id v16 = v18;
  id v14 = v18;
  [(AKAlertHandler *)self showAlert:v13 primaryAction:v17 altAction:v15];
}

uint64_t __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForUnverifiedEmailWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  char v6 = [v5 localizedStringForKey:@"AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  if ([@"AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE" containsString:@"REBRAND"])
  {
    id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
  }
  else
  {
    id v9 = +[AKFeatureManager sharedManager];
    if ([v9 isAABrandingEnabled])
    {
      v10 = [@"AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE" stringByAppendingString:@"_REBRAND"];
      id v8 = [v7 localizedStringForKey:v10 value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
    }
  }
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v12 = [v11 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_SETTINGS" value:&stru_1EE40D360 table:@"Localizable"];

  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v14 = [v13 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_CLOSE" value:&stru_1EE40D360 table:@"Localizable"];

  id v15 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v6 message:v8 defaultButton:v12 alternateButton:v14];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke;
  v19[3] = &unk_1E57608A0;
  void v19[4] = self;
  id v20 = v4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2;
  v17[3] = &unk_1E5760FC8;
  id v18 = v20;
  id v16 = v20;
  [(AKAlertHandler *)self showAlert:v15 primaryAction:v19 altAction:v17];
}

uint64_t __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openSpyglass];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForInsufficientSecurityLevelWithError:(id)a3 completionHandler:(id)a4
{
  id v31 = a4;
  id v6 = a3;
  v7 = [v6 userInfo];
  v33 = [v7 objectForKey:@"AKClientBundleID"];

  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v9 = [v8 localizedStringForKey:@"AUTH_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  v10 = [v6 userInfo];

  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v12)
  {
    uint64_t v13 = objc_msgSend(v10, "objectForKeyedSubscript:", v11, v31);

    id v9 = (void *)v13;
  }
  id v14 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.AuthKit", v31);
  id v15 = [v14 localizedStringForKey:@"AUTH_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];

  uint64_t v16 = *MEMORY[0x1E4F28588];
  id v17 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];

  if (v17)
  {
    uint64_t v18 = [v10 objectForKeyedSubscript:v16];

    id v15 = (void *)v18;
  }
  v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v20 = [v19 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_CONTINUE" value:&stru_1EE40D360 table:@"Localizable"];

  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v22 = [v21 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_CLOSE" value:&stru_1EE40D360 table:@"Localizable"];

  uint64_t v23 = *MEMORY[0x1E4F28590];
  v24 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28590]];

  if (v24)
  {
    v25 = [v10 objectForKeyedSubscript:v23];
    if ([v25 count] == 2)
    {
      uint64_t v26 = [v25 objectAtIndexedSubscript:0];

      uint64_t v27 = [v25 objectAtIndexedSubscript:1];

      id v20 = (void *)v26;
      id v22 = (void *)v27;
    }
  }
  v28 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v9 message:v15 defaultButton:v20 alternateButton:v22];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke;
  v36[3] = &unk_1E5760B00;
  v36[4] = self;
  id v37 = v33;
  id v38 = v32;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2;
  v34[3] = &unk_1E5760FC8;
  id v35 = v38;
  id v29 = v38;
  id v30 = v33;
  [(AKAlertHandler *)self showAlert:v28 primaryAction:v36 altAction:v34];
}

uint64_t __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openUpgradeAccountSecurityLevelWithBundleID:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForCannotFindServerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v6 = [v5 localizedStringForKey:@"AUTH_ERROR_ALERT_CANNOT_FIND_SERVER_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  LODWORD(v5) = MGGetBoolAnswer();
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v8 = v7;
  if (v5) {
    id v9 = @"AUTH_ERROR_ALERT_CANNOT_FIND_SERVER_MESSAGE_WLAN";
  }
  else {
    id v9 = @"AUTH_ERROR_ALERT_CANNOT_FIND_SERVER_MESSAGE_WIFI";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_1EE40D360 table:@"Localizable"];

  uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v12 = [v11 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_OK" value:&stru_1EE40D360 table:@"Localizable"];

  uint64_t v13 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v6 message:v10 defaultButton:v12 alternateButton:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke;
  v17[3] = &unk_1E5760FC8;
  id v18 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2;
  v15[3] = &unk_1E5760FC8;
  id v16 = v18;
  id v14 = v18;
  [(AKAlertHandler *)self showAlert:v13 primaryAction:v17 altAction:v15];
}

uint64_t __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForUnderageAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a3;
  id v9 = [v7 bundleWithIdentifier:@"com.apple.AuthKit"];
  v10 = [v9 localizedStringForKey:@"AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  if ([@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" containsString:@"REBRAND"])
  {
    v12 = [v11 localizedStringForKey:@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
  }
  else
  {
    uint64_t v13 = +[AKFeatureManager sharedManager];
    if ([v13 isAABrandingEnabled])
    {
      id v14 = [@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" stringByAppendingString:@"_REBRAND"];
      v12 = [v11 localizedStringForKey:v14 value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      v12 = [v11 localizedStringForKey:@"AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
    }
  }
  id v15 = +[AKAccountManager sharedInstance];
  id v16 = [v15 ageOfMajorityForAccount:v8];

  if (v16)
  {
    id v17 = NSString;
    id v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    v19 = @"AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_MESSAGE";
    char v20 = [@"AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_MESSAGE" containsString:@"REBRAND"];
    id v31 = v6;
    v32 = v10;
    if (v20)
    {
      v21 = self;
      int v22 = 0;
    }
    else
    {
      id v30 = +[AKFeatureManager sharedManager];
      v21 = self;
      if ([v30 isAABrandingEnabled])
      {
        v19 = [@"AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_MESSAGE" stringByAppendingString:@"_REBRAND"];
        int v22 = 1;
      }
      else
      {
        int v22 = 0;
      }
    }
    uint64_t v23 = [v18 localizedStringForKey:v19 value:&stru_1EE40D360 table:@"Localizable"];
    v24 = [v16 stringValue];
    uint64_t v25 = objc_msgSend(v17, "stringWithFormat:", v23, v24);

    if (v22) {
    self = v21;
    }
    if ((v20 & 1) == 0) {

    }
    v12 = (void *)v25;
    id v6 = v31;
    v10 = v32;
  }
  uint64_t v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  uint64_t v27 = [v26 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_OK" value:&stru_1EE40D360 table:@"Localizable"];

  v28 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v10 message:v12 defaultButton:v27 alternateButton:0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke;
  v35[3] = &unk_1E5760FC8;
  id v36 = v6;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2;
  v33[3] = &unk_1E5760FC8;
  id v34 = v36;
  id v29 = v36;
  [(AKAlertHandler *)self showAlert:v28 primaryAction:v35 altAction:v33];
}

uint64_t __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_showAlertForPasscodeSetupWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v6 = [v5 localizedStringForKey:@"AUTH_ERROR_ALERT_CREATE_PASSCODE_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  if ([@"AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH" containsString:@"REBRAND"])
  {
    id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH" value:&stru_1EE40D360 table:@"Localizable"];
  }
  else
  {
    id v9 = +[AKFeatureManager sharedManager];
    if ([v9 isAABrandingEnabled])
    {
      v10 = [@"AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH" stringByAppendingString:@"_REBRAND"];
      id v8 = [v7 localizedStringForKey:v10 value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      id v8 = [v7 localizedStringForKey:@"AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH" value:&stru_1EE40D360 table:@"Localizable"];
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v12 = [v11 localizedStringForKey:@"AUTH_ERROR_BUTTON_OPEN_PASSCODE_SETUP" value:&stru_1EE40D360 table:@"Localizable"];

  uint64_t v13 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v6 message:v8 defaultButton:v12 alternateButton:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke;
  v17[3] = &unk_1E57608A0;
  void v17[4] = self;
  id v18 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2;
  v15[3] = &unk_1E5760FC8;
  id v16 = v18;
  id v14 = v18;
  [(AKAlertHandler *)self showAlert:v13 primaryAction:v17 altAction:v15];
}

uint64_t __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openPasscodeSetup];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (BOOL)_shouldShowAlertForManagedAccount:(id)a3 error:(id)a4
{
  id v4 = a4;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"isManagedAccount"];
  int v7 = [v6 BOOLValue];

  if (v7) {
    BOOL v8 = [v4 code] == -7100 || objc_msgSend(v4, "code") == -7093 || objc_msgSend(v4, "code") == -7027;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_showAlertForManagedAccount:(id)a3 error:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v33 = a5;
  BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v9 = [v8 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_CANNOT_SIGN_IN_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  uint64_t v11 = [v10 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_CANNOT_SIGN_IN_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];

  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  uint64_t v13 = [v12 localizedStringForKey:@"AUTH_ERROR_ALERT_BUTTON_OK" value:&stru_1EE40D360 table:@"Localizable"];

  if ([v7 code] == -7100)
  {
    id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    uint64_t v32 = [v14 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_TITLE" value:&stru_1EE40D360 table:@"Localizable"];

    id v15 = [v7 userInfo];
    id v16 = [v15 objectForKeyedSubscript:@"managedOrganizationName"];

    id v17 = [v7 userInfo];
    id v18 = [v17 objectForKeyedSubscript:@"localizedAppName"];

    uint64_t v19 = [v16 length];
    uint64_t v20 = [v18 length];
    if (v20 && v19)
    {
      v21 = NSString;
      int v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
      uint64_t v23 = [v22 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_ORGNAME_FORMAT" value:&stru_1EE40D360 table:@"Localizable"];
      objc_msgSend(v21, "stringWithFormat:", v23, v18, v16);
    }
    else
    {
      if (v20)
      {
        uint64_t v26 = NSString;
        int v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
        uint64_t v27 = [v22 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_FORMAT" value:&stru_1EE40D360 table:@"Localizable"];
        uint64_t v24 = objc_msgSend(v26, "stringWithFormat:", v27, v18);

        uint64_t v11 = (void *)v27;
        goto LABEL_9;
      }
      if (!v19)
      {
        int v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
        uint64_t v24 = [v22 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE" value:&stru_1EE40D360 table:@"Localizable"];
        goto LABEL_9;
      }
      id v30 = NSString;
      int v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
      uint64_t v23 = [v22 localizedStringForKey:@"AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_ORGNAME_FORMAT" value:&stru_1EE40D360 table:@"Localizable"];
      objc_msgSend(v30, "stringWithFormat:", v23, v16, v31);
    uint64_t v24 = };

    uint64_t v11 = (void *)v23;
LABEL_9:
    uint64_t v25 = v33;

    uint64_t v11 = (void *)v24;
    id v9 = (void *)v32;
    goto LABEL_10;
  }
  uint64_t v25 = v33;
LABEL_10:
  v28 = [(AKAlertHandler *)self notificationDictionaryWithTitle:v9 message:v11 defaultButton:v13 alternateButton:0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke;
  v36[3] = &unk_1E5760FC8;
  id v37 = v25;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2;
  v34[3] = &unk_1E5760FC8;
  id v35 = v37;
  id v29 = v37;
  [(AKAlertHandler *)self showAlert:v28 primaryAction:v36 altAction:v34];
}

uint64_t __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (BOOL)showAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5
{
  p_uiProvider = &self->_uiProvider;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_uiProvider);
  if (objc_opt_respondsToSelector())
  {
    char v13 = [WeakRetained alertHandlerShowAlert:v11 primaryAction:v10 altAction:v9];

    objc_storeWeak((id *)p_uiProvider, 0);
  }
  else
  {
    char v13 = [(AKAlertHandler *)self showAlert:v11 primaryAction:v10 altAction:v9 cancelAction:v9];
  }
  return v13;
}

- (BOOL)showAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5 cancelAction:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([MEMORY[0x1E4F46FF0] deviceIsAudioAccessory])
  {
    char v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AKAlertHandler showAlert:primaryAction:altAction:cancelAction:](v9, v13);
    }

    BOOL v14 = 0;
  }
  else
  {
    SInt32 error = 0;
    CFUserNotificationRef v15 = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, (CFDictionaryRef)v9);
    BOOL v14 = v15 != 0;
    if (v15)
    {
      CFUserNotificationRef v16 = v15;
      id v17 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__AKAlertHandler_showAlert_primaryAction_altAction_cancelAction___block_invoke;
      block[3] = &unk_1E5761608;
      CFUserNotificationRef v24 = v16;
      v21 = v12;
      id v22 = v10;
      id v23 = v11;
      dispatch_async(v17, block);

      id v18 = v21;
    }
    else
    {
      id v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AKAlertHandler showAlert:primaryAction:altAction:cancelAction:](v9, &error, v18);
      }
    }
  }
  return v14;
}

void __65__AKAlertHandler_showAlert_primaryAction_altAction_cancelAction___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  uint64_t v2 = AKUserNotificationResponseAction(responseFlags);
  uint64_t v3 = a1 + 40;
  uint64_t v4 = a1 + 48;
  if (v2 == 3) {
    uint64_t v4 = a1 + 32;
  }
  if (v2) {
    uint64_t v3 = v4;
  }
  (*(void (**)(void))(*(void *)v3 + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

- (id)notificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v14 = v13;
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  }
  [v14 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  }
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FA7290]];
  CFUserNotificationRef v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v17 = [v16 resourceURL];
  [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];

  return v14;
}

- (void)_openSpyglass
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)_openUpgradeAccountSecurityLevelWithBundleID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v9 = @"AKClientBundleID";
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  BOOL v8 = [(AKAlertHandler *)self _URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=upgradeSecurityLevel" byAppendingParameters:v6];
  [v7 openSensitiveURL:v8 withOptions:0];
}

- (id)_URLWithString:(id)a3 byAppendingParameters:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v5 keyEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v5 objectForKeyedSubscript:v12];
        [v6 appendFormat:@"&%@=%@", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  return v14;
}

- (AKAlertHandlerUIProvider)uiProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiProvider);

  return (AKAlertHandlerUIProvider *)WeakRetained;
}

- (void)setUiProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

void __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert - invalid context", v2, v3, v4, v5, v6);
}

void __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - invalid context", v2, v3, v4, v5, v6);
}

void __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - missing apple account", v2, v3, v4, v5, v6);
}

void __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - unverified email", v2, v3, v4, v5, v6);
}

void __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - insufficient security level", v2, v3, v4, v5, v6);
}

void __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - cannot find server", v2, v3, v4, v5, v6);
}

void __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - underage account", v2, v3, v4, v5, v6);
}

void __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - passcode setup required", v2, v3, v4, v5, v6);
}

void __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Authorization alert dismissed - managed account", v2, v3, v4, v5, v6);
}

- (void)showAlert:(void *)a1 primaryAction:(NSObject *)a2 altAction:cancelAction:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F1D990]];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Attempted to show CFUserNotification (%@) on HomePod, AuthKit prompts aren't made for this!", (uint8_t *)&v4, 0xCu);
}

- (void)showAlert:(NSObject *)a3 primaryAction:altAction:cancelAction:.cold.2(void *a1, int *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F1D990]];
  int v6 = *a2;
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  _os_log_error_impl(&dword_193494000, a3, OS_LOG_TYPE_ERROR, "Showing alert (%@) failed, user notification is nil!. Error: %d", (uint8_t *)&v7, 0x12u);
}

@end