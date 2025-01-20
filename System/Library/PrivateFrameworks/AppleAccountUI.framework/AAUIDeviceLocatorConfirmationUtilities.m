@interface AAUIDeviceLocatorConfirmationUtilities
+ (id)_messageForError:(id)a3 account:(id)a4;
+ (id)_titleForError:(id)a3 account:(id)a4;
+ (void)_handleFMIPAuthenticationResponse:(id)a3 withError:(id)a4 forContext:(id)a5 completion:(id)a6;
+ (void)_performFMIPAuthenticationForContext:(id)a3 completion:(id)a4;
+ (void)checkIfWatchHasAppleIDAccount:(id)a3;
+ (void)showDisableAlertForAccount:(id)a3 presentingViewController:(id)a4 telemetryFlowID:(id)a5 withCompletion:(id)a6;
+ (void)showDisableAlertForAccount:(id)a3 presentingViewController:(id)a4 withCompletion:(id)a5;
+ (void)showDisableAlertForAccount:(id)a3 withCompletion:(id)a4;
+ (void)showDisableAlertForAccount:(id)a3 withMessage:(id)a4 confirmationButtonTitle:(id)a5 completion:(id)a6;
+ (void)showDisableAlertForAccount:(id)a3 withMessage:(id)a4 confirmationButtonTitle:(id)a5 presentingViewController:(id)a6 completion:(id)a7;
+ (void)showDisableAlertForContext:(id)a3 withCompletion:(id)a4;
+ (void)showEnableAlertWithCompletion:(id)a3;
@end

@implementation AAUIDeviceLocatorConfirmationUtilities

+ (void)showEnableAlertWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [MEMORY[0x263F57730] sharedInstance];
  v6 = [v5 getActivePairedDevice];

  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"02168E84-5DD8-4B19-9204-A79F04B33A32"];
  int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke;
    v9[3] = &__block_descriptor_40_e11_v16__0B8B12l;
    v9[4] = a1;
    +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:v9];
  }
  if (v4) {
    v4[2](v4, 0);
  }
}

void __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke(uint64_t a1, char a2, char a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke_2;
  v3[3] = &__block_descriptor_42_e5_v8__0l;
  char v4 = a2;
  char v5 = a3;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    v1 = [MEMORY[0x263F3CC60] sharedInstance];
    [v1 userNotifiedOfActivationLockForAllPairedDevices];

    v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v2 localizedStringForKey:@"DEVICE_LOCATOR_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];

    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (([@"ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH" containsString:@"REBRAND"] & 1) != 0
      || (_os_feature_enabled_impl() & 1) == 0)
    {
      char v5 = [v3 localizedStringForKey:@"ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH" value:&stru_26BD39CD8 table:@"Localizable"];
    }
    else
    {
      char v4 = [@"ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH" stringByAppendingString:@"_REBRAND"];
      char v5 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];
    }
    v6 = (void *)MEMORY[0x263F259E0];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
    [v6 showUserNotificationWithTitle:v9 message:v5 cancelButtonTitle:0 otherButtonTitle:v8 withCompletionBlock:0];
  }
}

+ (void)checkIfWatchHasAppleIDAccount:(id)a3
{
  id v3 = a3;
  char v4 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke;
  block[3] = &unk_263F920E8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = objc_alloc_init(MEMORY[0x263EFB210]);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__0;
  v19[4] = __Block_byref_object_dispose__0;
  objc_msgSend(v3, "aa_primaryAppleAccount");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  char v4 = (void *)getNSSManagerClass_softClass;
  uint64_t v25 = getNSSManagerClass_softClass;
  if (!getNSSManagerClass_softClass)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getNSSManagerClass_block_invoke;
    v21[3] = &unk_263F92608;
    v21[4] = &v22;
    __getNSSManagerClass_block_invoke((uint64_t)v21);
    char v4 = (void *)v23[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v22, 8);
  v6 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_104;
  v11[3] = &unk_263F924F0;
  v13 = v19;
  v14 = &v15;
  id v7 = v2;
  v12 = v7;
  [v6 getiCloudInfo:v11];
  dispatch_time_t v8 = dispatch_time(0, 4000000000);
  intptr_t v9 = dispatch_semaphore_wait(v7, v8);
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, BOOL))(v10 + 16))(v10, *((unsigned __int8 *)v16 + 24), v9 > 0);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
}

void __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v24 = a2;
  id v23 = a3;
  if (v23)
  {
    char v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Error getting Watch Account: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_27;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v5 = (void *)getkNSSiCloudAccountsKeySymbolLoc_ptr;
  uint64_t v33 = getkNSSiCloudAccountsKeySymbolLoc_ptr;
  if (!getkNSSiCloudAccountsKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v36 = __getkNSSiCloudAccountsKeySymbolLoc_block_invoke;
    v37 = &unk_263F92608;
    v38 = &v30;
    v6 = (void *)NanoSystemSettingsLibrary();
    id v7 = dlsym(v6, "kNSSiCloudAccountsKey");
    *(void *)(v38[1] + 24) = v7;
    getkNSSiCloudAccountsKeySymbolLoc_ptr = *(void *)(v38[1] + 24);
    id v5 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v5)
  {
    __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_104_cold_1();
    goto LABEL_31;
  }
  dispatch_time_t v8 = [v24 objectForKeyedSubscript:*v5];
  intptr_t v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "aa_personID");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v4 = v8;
  uint64_t v10 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v10) {
    goto LABEL_26;
  }
  uint64_t v11 = *(void *)v27;
LABEL_9:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v27 != v11) {
      objc_enumerationMutation(v4);
    }
    v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v14 = (void *)getkNSSiCloudPersonIDKeySymbolLoc_ptr;
    uint64_t v33 = getkNSSiCloudPersonIDKeySymbolLoc_ptr;
    if (!getkNSSiCloudPersonIDKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v36 = __getkNSSiCloudPersonIDKeySymbolLoc_block_invoke;
      v37 = &unk_263F92608;
      v38 = &v30;
      uint64_t v15 = (void *)NanoSystemSettingsLibrary();
      v16 = dlsym(v15, "kNSSiCloudPersonIDKey");
      *(void *)(v38[1] + 24) = v16;
      getkNSSiCloudPersonIDKeySymbolLoc_ptr = *(void *)(v38[1] + 24);
      v14 = (void *)v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v14) {
      goto LABEL_30;
    }
    uint64_t v17 = [v13 objectForKeyedSubscript:*v14];
    if ([v17 isEqualToString:v9]) {
      break;
    }

    if (v10 == ++v12)
    {
      uint64_t v10 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (!v10) {
        goto LABEL_26;
      }
      goto LABEL_9;
    }
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v18 = (void *)getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr;
  uint64_t v33 = getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr;
  if (!getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v36 = __getkNSSiCloudIsAuthenticatedKeySymbolLoc_block_invoke;
    v37 = &unk_263F92608;
    v38 = &v30;
    v19 = (void *)NanoSystemSettingsLibrary();
    id v20 = dlsym(v19, "kNSSiCloudIsAuthenticatedKey");
    *(void *)(v38[1] + 24) = v20;
    getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr = *(void *)(v38[1] + 24);
    char v18 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v18)
  {
LABEL_30:
    __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_104_cold_1();
LABEL_31:
    __break(1u);
  }
  v21 = [v13 objectForKeyedSubscript:*v18];
  uint64_t v22 = v21;
  if (!v21 || [v21 BOOLValue]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

LABEL_26:
LABEL_27:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)showDisableAlertForAccount:(id)a3 withCompletion:(id)a4
{
}

+ (void)showDisableAlertForAccount:(id)a3 presentingViewController:(id)a4 withCompletion:(id)a5
{
  dispatch_time_t v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 bundleForClass:objc_opt_class()];
  v13 = (void *)MEMORY[0x263F82670];
  v14 = @"DISABLE_DEVICE_LOCATOR_MESSAGE";
  if (([@"DISABLE_DEVICE_LOCATOR_MESSAGE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v15 = 0;
  }
  else
  {
    v14 = [@"DISABLE_DEVICE_LOCATOR_MESSAGE" stringByAppendingString:@"_REBRAND"];
    int v15 = 1;
  }
  v16 = [v13 modelSpecificLocalizedStringKeyForKey:v14];
  id v19 = [v12 localizedStringForKey:v16 value:&stru_26BD39CD8 table:@"Localizable"];

  if (v15) {
  uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  }
  char v18 = [v17 localizedStringForKey:@"DISABLE_DEVICE_LOCATOR_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];

  [a1 showDisableAlertForAccount:v11 withMessage:v19 confirmationButtonTitle:v18 presentingViewController:v10 completion:v9];
}

+ (void)showDisableAlertForAccount:(id)a3 presentingViewController:(id)a4 telemetryFlowID:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = (void *)MEMORY[0x263F086E0];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  int v15 = [v11 bundleForClass:objc_opt_class()];
  v16 = (void *)MEMORY[0x263F82670];
  uint64_t v17 = @"DISABLE_DEVICE_LOCATOR_MESSAGE";
  if (([@"DISABLE_DEVICE_LOCATOR_MESSAGE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v18 = 0;
  }
  else
  {
    uint64_t v17 = [@"DISABLE_DEVICE_LOCATOR_MESSAGE" stringByAppendingString:@"_REBRAND"];
    int v18 = 1;
  }
  id v19 = [v16 modelSpecificLocalizedStringKeyForKey:v17];
  id v20 = [v15 localizedStringForKey:v19 value:&stru_26BD39CD8 table:@"Localizable"];

  if (v18) {
  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  }
  uint64_t v22 = [v21 localizedStringForKey:@"DISABLE_DEVICE_LOCATOR_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];

  id v23 = objc_opt_new();
  [v23 setAccount:v14];

  [v23 setMessage:v20];
  [v23 setButtonTitle:v22];
  [v23 setPresentingViewController:v13];

  [v23 setTelemetryFlowID:v12];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __125__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_presentingViewController_telemetryFlowID_withCompletion___block_invoke;
  v25[3] = &unk_263F92518;
  id v26 = v10;
  id v24 = v10;
  [a1 showDisableAlertForContext:v23 withCompletion:v25];
}

void __125__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_presentingViewController_telemetryFlowID_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a3 fmipWipeToken];
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

+ (void)showDisableAlertForAccount:(id)a3 withMessage:(id)a4 confirmationButtonTitle:(id)a5 completion:(id)a6
{
}

+ (void)showDisableAlertForAccount:(id)a3 withMessage:(id)a4 confirmationButtonTitle:(id)a5 presentingViewController:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = objc_opt_new();
  [v17 setAccount:v16];

  [v17 setMessage:v15];
  [v17 setButtonTitle:v14];

  [v17 setPresentingViewController:v13];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __141__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_withMessage_confirmationButtonTitle_presentingViewController_completion___block_invoke;
  v19[3] = &unk_263F92518;
  id v20 = v12;
  id v18 = v12;
  [a1 showDisableAlertForContext:v17 withCompletion:v19];
}

void __141__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_withMessage_confirmationButtonTitle_presentingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a3 fmipWipeToken];
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

+ (void)showDisableAlertForContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = [v6 presentingViewController];
  id v9 = [v6 account];
  uint64_t v10 = [v6 message];
  id v11 = [v6 buttonTitle];
  id v27 = a1;
  if (v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F292A8]);
    [v12 setPresentingViewController:v8];
  }
  else
  {
    id v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "AAUIDeviceLocatorConfirmationUtilities: Warning! Caller has not provided a presenting VC.", buf, 2u);
    }

    id v12 = objc_alloc_init(MEMORY[0x263F29110]);
    [v12 _setProxyingForApp:1];
  }
  id v14 = [v9 username];
  [v12 setUsername:v14];

  id v15 = objc_msgSend(v9, "aa_altDSID");
  [v12 setAltDSID:v15];

  id v26 = (void *)v10;
  [v12 setReason:v10];
  [v12 setShouldPromptForPasswordOnly:1];
  [v12 setAuthenticationType:2];
  [v12 setIsEphemeral:1];
  [v12 setIsUsernameEditable:0];
  [v12 setDefaultButtonString:v11];
  [v12 setMaximumLoginAttempts:2];
  [v12 setEnablePasscodeAuth:0];
  *(void *)long long buf = 0;
  v37 = buf;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  id v41 = objc_alloc_init(MEMORY[0x263F29118]);
  id v16 = (void *)MEMORY[0x263F202A8];
  uint64_t v17 = objc_msgSend(v9, "aa_altDSID");
  id v18 = [v6 telemetryFlowID];
  id v19 = [v16 analyticsEventWithName:*MEMORY[0x263F25A58] altDSID:v17 flowID:v18];

  id v20 = (void *)*((void *)v37 + 5);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke;
  v28[3] = &unk_263F92568;
  v34 = buf;
  id v21 = v19;
  id v29 = v21;
  id v22 = v7;
  id v33 = v22;
  id v35 = v27;
  id v23 = v8;
  id v30 = v23;
  id v24 = v9;
  id v31 = v24;
  id v25 = v6;
  id v32 = v25;
  [v20 authenticateWithContext:v12 completion:v28];

  _Block_object_dispose(buf, 8);
}

void __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  dispatch_time_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *MEMORY[0x263F20330];
  if (v6)
  {
    [v9 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v10];
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
    if (objc_msgSend(v6, "ak_isUserCancelError"))
    {
      id v11 = [MEMORY[0x263F25780] reporter];
      [v11 sendEvent:*(void *)(a1 + 32)];

      id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_8:
      v12();
      goto LABEL_9;
    }
    int v15 = objc_msgSend(v6, "ak_isAuthenticationErrorWithCode:", -7005);
    id v16 = [MEMORY[0x263F25780] reporter];
    [v16 sendEvent:*(void *)(a1 + 32)];

    if (!v15)
    {
      id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      goto LABEL_8;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_2;
    block[3] = &unk_263F92540;
    uint64_t v20 = *(void *)(a1 + 80);
    id v19 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v10];
    id v13 = [MEMORY[0x263F25780] reporter];
    [v13 sendEvent:*(void *)(a1 + 32)];

    id v14 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
    objc_msgSend(*(id *)(a1 + 48), "aa_setPassword:", v14);
    [*(id *)(a1 + 80) _performFMIPAuthenticationForContext:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
LABEL_9:
}

void __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"VERIFICATION_FAILED_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (([@"BAD_NETWORK_ALERT_MESSAGE" containsString:@"REBRAND"] & 1) != 0
    || (_os_feature_enabled_impl() & 1) == 0)
  {
    id v6 = [v4 localizedStringForKey:@"BAD_NETWORK_ALERT_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  }
  else
  {
    id v5 = [@"BAD_NETWORK_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
    id v6 = [v4 localizedStringForKey:v5 value:&stru_26BD39CD8 table:@"Localizable"];
  }
  uint64_t v7 = (void *)MEMORY[0x263F82418];
  dispatch_time_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_3;
  v11[3] = &unk_263F920E8;
  id v12 = *(id *)(a1 + 40);
  uint64_t v10 = [v7 alertWithTitle:v3 message:v6 buttonTitle:v9 actionHandler:v11];

  [*(id *)(a1 + 32) presentViewController:v10 animated:0 completion:0];
}

uint64_t __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_performFMIPAuthenticationForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F25840]);
  id v9 = [v6 account];
  uint64_t v10 = (void *)[v8 initWithAccount:v9];

  id v11 = [v6 customRequestHeaders];
  [v10 setCustomHeaders:v11];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__AAUIDeviceLocatorConfirmationUtilities__performFMIPAuthenticationForContext_completion___block_invoke;
  v14[3] = &unk_263F92590;
  id v16 = v7;
  id v17 = a1;
  id v15 = v6;
  id v12 = v7;
  id v13 = v6;
  [v10 performRequestWithHandler:v14];
}

void __90__AAUIDeviceLocatorConfirmationUtilities__performFMIPAuthenticationForContext_completion___block_invoke(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = (void *)a1[6];
  id v9 = v6;
  if (v6)
  {
    id v8 = [v6 error];
    [v7 _handleFMIPAuthenticationResponse:v9 withError:v8 forContext:a1[4] completion:a1[5]];
  }
  else
  {
    [v7 _handleFMIPAuthenticationResponse:0 withError:a4 forContext:a1[4] completion:a1[5]];
  }
}

+ (void)_handleFMIPAuthenticationResponse:(id)a3 withError:(id)a4 forContext:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10
    || v11
    || ([v10 error], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    id v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Failed to obtain an FMiP wipe token. Response: %@ and Error: %@", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke;
    aBlock[3] = &unk_263F925B8;
    id v28 = a1;
    id v16 = v12;
    id v26 = v16;
    id v27 = v13;
    id v17 = _Block_copy(aBlock);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2;
    block[3] = &unk_263F925E0;
    id v24 = a1;
    id v21 = v11;
    id v22 = v16;
    id v23 = v17;
    id v18 = v17;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "FMIPAuthenticationRequest succeeded!", buf, 2u);
    }

    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v10);
  }
}

uint64_t __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 48) showDisableAlertForContext:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
  }
}

void __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2 = (void *)MEMORY[0x263F259E0];
  id v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) account];
  id v5 = [v3 _titleForError:v4 account:v14];
  id v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) account];
  id v9 = [v6 _messageForError:v7 account:v8];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"RETRY" value:&stru_26BD39CD8 table:@"Localizable"];
  [v2 showUserNotificationWithTitle:v5 message:v9 cancelButtonTitle:v11 otherButtonTitle:v13 withCompletionBlock:*(void *)(a1 + 48)];
}

+ (id)_titleForError:(id)a3 account:(id)a4
{
  uint64_t v4 = [a3 code];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4 == 401)
  {
    uint64_t v7 = @"MOBILEME_AUTHENTICATION_FAILED_MESSAGE";
    if (([@"MOBILEME_AUTHENTICATION_FAILED_MESSAGE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v8 = 0;
    }
    else
    {
      uint64_t v7 = [@"MOBILEME_AUTHENTICATION_FAILED_MESSAGE" stringByAppendingString:@"_REBRAND"];
      int v8 = 1;
    }
    id v9 = [v6 localizedStringForKey:v7 value:&stru_26BD39CD8 table:@"Localizable"];
    if (v8) {
  }
    }
  else
  {
    id v9 = [v5 localizedStringForKey:@"VERIFICATION_FAILED_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  }

  return v9;
}

+ (id)_messageForError:(id)a3 account:(id)a4
{
  id v4 = a3;
  if ([v4 code] == 401)
  {
    id v5 = &stru_26BD39CD8;
  }
  else
  {
    id v5 = [v4 localizedDescription];
  }

  return v5;
}

uint64_t __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_104_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getNSSManagerClass_block_invoke_cold_1(v0);
}

@end