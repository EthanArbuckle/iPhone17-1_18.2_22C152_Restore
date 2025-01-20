@interface HUPersonalRequestsDevicesModuleController
- (BOOL)_isCurrentDeviceCandidateForLocationDevice;
- (Class)cellClassForItem:(id)a3;
- (HUPersonalRequestsDevicesModuleController)initWithModule:(id)a3;
- (HUPersonalRequestsDevicesModuleController)initWithModule:(id)a3 host:(id)a4;
- (id)_preflightEnablingPersonalRequests;
- (id)_promptToChangeLocationDeviceFromCurrentDevice:(id)a3;
- (id)_promptToChangeLocationDeviceIfNecessary;
- (id)_promptToEnableSiriIfNecessary;
- (id)setPersonalRequestsDevices:(id)a3;
- (id)turnOnPersonalRequestsForAllMultiUserCapableDevices;
- (void)_presentAlert:(id)a3;
- (void)_presentConfirmationForEnablingPersonalRequestsForItem:(id)a3 cell:(id)a4 didTurnOn:(BOOL)a5 isOutdatedOS:(BOOL)a6 unsupportedAccessoryLanguage:(BOOL)a7 hasMismatchedLanguages:(BOOL)a8;
- (void)_togglePersonalRequestStateForItem:(id)a3;
- (void)_turnOnPersonalRequestForItem:(id)a3 cell:(id)a4 didTurnOn:(BOOL)a5;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUPersonalRequestsDevicesModuleController

- (HUPersonalRequestsDevicesModuleController)initWithModule:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithModule_host_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalRequestsDevicesModuleController.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUPersonalRequestsDevicesModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUPersonalRequestsDevicesModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    v11 = v9;
    if (v10) {
      goto LABEL_8;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUPersonalRequestsDevicesModuleController;
  v14 = [(HUItemModuleController *)&v17 initWithModule:v9];
  v15 = v14;
  if (v14) {
    [(HUItemModuleController *)v14 setHost:v7];
  }

  return v15;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(HUItemModuleController *)self module];
  if ([v7 isItemPersonalRequestsDevice:v6])
  {

LABEL_4:
    objc_opt_class();
    id v10 = v13;
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    [v12 setDelegate:self];
    goto LABEL_8;
  }
  uint64_t v8 = [(HUItemModuleController *)self module];
  int v9 = [v8 isItemPersonalRequestsToggle:v6];

  if (v9) {
    goto LABEL_4;
  }
LABEL_8:
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = self;
    __int16 v42 = 1024;
    BOOL v43 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", buf, 0x12u);
  }
  BOOL v39 = v4;

  uint64_t v8 = [v6 item];
  objc_opt_class();
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  objc_opt_class();
  id v15 = v9;
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v18 = [v17 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v14)
  {
    v21 = [v14 mediaProfileContainer];
    v22 = objc_msgSend(v21, "hf_home");

    int v23 = [v14 supportsMultiUser];
  }
  else
  {
    v24 = [v20 accessory];
    v22 = [v24 home];

    v25 = [v20 accessory];
    int v23 = [v25 supportsMultiUser];
  }
  v26 = [(HUItemModuleController *)self module];
  if ([v26 isItemPersonalRequestsDevice:v15])
  {
  }
  else
  {
    v27 = [(HUItemModuleController *)self module];
    int v28 = [v27 isItemPersonalRequestsToggle:v15];

    if (!v28) {
      goto LABEL_30;
    }
  }
  id v37 = v20;
  id v29 = v6;
  v30 = [(HUItemModuleController *)self module];
  if ([v30 isItemPersonalRequestsDevice:v15]) {
    int v31 = [v22 isMultiUserEnabled] & v39;
  }
  else {
    int v31 = 0;
  }

  v32 = [(HUItemModuleController *)self module];
  int v33 = [v32 recognitionLanguageIsSupportedVRLanguageForItem:v15];

  v34 = [(HUItemModuleController *)self module];
  int v35 = [v34 isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:v15];

  if (v31 && ((uint64_t v36 = v33 & v23 ^ 1u, (v36 & 1) != 0) || v35 != 1))
  {
    id v6 = v29;
    -[HUPersonalRequestsDevicesModuleController _presentConfirmationForEnablingPersonalRequestsForItem:cell:didTurnOn:isOutdatedOS:unsupportedAccessoryLanguage:hasMismatchedLanguages:](self, "_presentConfirmationForEnablingPersonalRequestsForItem:cell:didTurnOn:isOutdatedOS:unsupportedAccessoryLanguage:hasMismatchedLanguages:", v15, v29, v39, [v14 supportsMultiUser] ^ 1, v36, v35 ^ 1u);
  }
  else
  {
    id v6 = v29;
    [(HUPersonalRequestsDevicesModuleController *)self _turnOnPersonalRequestForItem:v15 cell:v29 didTurnOn:v39];
  }
  id v20 = v38;
LABEL_30:
}

- (BOOL)_isCurrentDeviceCandidateForLocationDevice
{
  return MGGetSInt32Answer() == 1;
}

- (id)_preflightEnablingPersonalRequests
{
  if ([(HUPersonalRequestsDevicesModuleController *)self _isCurrentDeviceCandidateForLocationDevice])
  {
    v3 = [(HUPersonalRequestsDevicesModuleController *)self _promptToChangeLocationDeviceIfNecessary];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__HUPersonalRequestsDevicesModuleController__preflightEnablingPersonalRequests__block_invoke;
    v6[3] = &unk_1E6388A88;
    v6[4] = self;
    BOOL v4 = [v3 flatMap:v6];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v4;
}

uint64_t __79__HUPersonalRequestsDevicesModuleController__preflightEnablingPersonalRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptToEnableSiriIfNecessary];
}

- (id)_promptToEnableSiriIfNecessary
{
  v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v4 = [v3 assistantIsEnabled];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v6 = [(HUItemModuleController *)self module];
    id v7 = [v6 activeLocationDeviceFuture];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke;
    v9[3] = &unk_1E6387F70;
    v9[4] = self;
    v5 = [v7 flatMap:v9];
  }

  return v5;
}

id __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isCurrentDevice])
  {
    v3 = HULocalizedModelString(@"HUUsersPersonalRequestsSiriDisabledAlertTitle");
    int v4 = [*(id *)(a1 + 32) module];
    v5 = [v4 home];
    id v6 = HULocalizedSiriTriggerPhrase(v5);
    id v13 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsSiriDisabledAlertMessage", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

    id v14 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v3 message:v13 preferredStyle:1];
    id v15 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    v16 = (void *)MEMORY[0x1E4F42720];
    id v17 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_2;
    v28[3] = &unk_1E6385188;
    id v18 = v15;
    id v29 = v18;
    v19 = [v16 actionWithTitle:v17 style:1 handler:v28];

    [v14 addAction:v19];
    id v20 = (void *)MEMORY[0x1E4F42720];
    v21 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsSiriDisabledAlertActionTurnOn", @"HUUsersPersonalRequestsSiriDisabledAlertActionTurnOn", 1);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_3;
    v26[3] = &unk_1E6385188;
    id v27 = v18;
    id v22 = v18;
    int v23 = [v20 actionWithTitle:v21 style:0 handler:v26];

    [v14 addAction:v23];
    [v14 setPreferredAction:v23];
    [*(id *)(a1 + 32) _presentAlert:v14];
    v24 = [v22 flatMap:&__block_literal_global_94];
  }
  else
  {
    v24 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v24;
}

uint64_t __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

id __75__HUPersonalRequestsDevicesModuleController__promptToEnableSiriIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
    [v2 setAssistantIsEnabled:1];

    v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F7A0D8];
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
    v3 = [v4 futureWithError:v5];
  }

  return v3;
}

- (id)_promptToChangeLocationDeviceIfNecessary
{
  v3 = [(HUItemModuleController *)self module];
  int v4 = [v3 activeLocationDeviceFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke;
  v11[3] = &unk_1E6387F70;
  v11[4] = self;
  v5 = [v4 flatMap:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_2;
  v10[3] = &unk_1E6387340;
  v10[4] = self;
  id v6 = [v5 recover:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_40;
  v9[3] = &unk_1E6385648;
  v9[4] = self;
  uint64_t v7 = [v6 flatMap:v9];

  return v7;
}

id __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (([v6 isCurrentDevice] & 1) != 0
    || ([*(id *)(a1 + 32) module],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 onlyShowDeviceSwitches],
        v7,
        v8))
  {
    uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) _promptToChangeLocationDeviceFromCurrentDevice:v6];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

id __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch active location device: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) _promptToChangeLocationDeviceFromCurrentDevice:0];

  return v5;
}

id __85__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceIfNecessary__block_invoke_40(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    id v3 = [*(id *)(a1 + 32) module];
    id v4 = [v3 updateLocationDeviceToThisDevice];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v4;
}

- (id)_promptToChangeLocationDeviceFromCurrentDevice:(id)a3
{
  id v4 = a3;
  v5 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsChangeLocationDeviceAlertTitle", @"HUUsersPersonalRequestsChangeLocationDeviceAlertTitle", 1);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke;
  v24[3] = &unk_1E6387F48;
  id v25 = v4;
  id v19 = v4;
  id v6 = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke((uint64_t)v24);
  int v7 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  uint64_t v9 = (void *)MEMORY[0x1E4F42720];
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsChangeLocationDeviceAlertActionNotNow", @"HUUsersPersonalRequestsChangeLocationDeviceAlertActionNotNow", 1);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_2;
  v22[3] = &unk_1E6385188;
  id v11 = v8;
  id v23 = v11;
  uint64_t v12 = [v9 actionWithTitle:v10 style:1 handler:v22];

  [v7 addAction:v12];
  id v13 = (void *)MEMORY[0x1E4F42720];
  id v14 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsChangeLocationDeviceAlertActionUseCurrentDevice", @"HUUsersPersonalRequestsChangeLocationDeviceAlertActionUseCurrentDevice", 1);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_3;
  v20[3] = &unk_1E6385188;
  id v15 = v11;
  id v21 = v15;
  v16 = [v13 actionWithTitle:v14 style:0 handler:v20];

  [v7 addAction:v16];
  [v7 setPreferredAction:v16];
  [(HUPersonalRequestsDevicesModuleController *)self _presentAlert:v7];
  id v17 = v15;

  return v17;
}

id __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = [v1 name];
    uint64_t v9 = HULocalizedStringWithFormat(@"HUUsersPersonalRequestsChangeLocationDeviceAlertMessageFormat", @"%@", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  }
  else
  {
    uint64_t v9 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsChangeLocationDeviceAlertMessageNoCurrentDevice", @"HUUsersPersonalRequestsChangeLocationDeviceAlertMessageNoCurrentDevice", 1);
  }

  return v9;
}

uint64_t __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC28]];
}

uint64_t __92__HUPersonalRequestsDevicesModuleController__promptToChangeLocationDeviceFromCurrentDevice___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (void)_presentAlert:(id)a3
{
  id v6 = +[HUViewControllerPresentationRequest requestWithViewController:a3];
  [v6 setPreferredPresentationType:0];
  uint64_t v4 = [(HUItemModuleController *)self host];
  id v5 = (id)[v4 moduleController:self presentViewControllerForRequest:v6];
}

- (void)_togglePersonalRequestStateForItem:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HUItemModuleController *)self module];
  int v7 = [v6 isItemPersonalRequestsDevice:v5];

  if (v7)
  {
    objc_opt_class();
    objc_opt_class();
    id v8 = v5;
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 sourceItem];
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    v49 = v13;
    id v14 = [v13 accessories];
    objc_opt_class();
    objc_opt_class();
    id v15 = v8;
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    id v18 = [v17 sourceItem];
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    uint64_t v21 = [v20 accessories];
    id v22 = (void *)v21;
    if (v14) {
      id v23 = v14;
    }
    else {
      id v23 = (void *)v21;
    }
    id v24 = v23;
    id v25 = HFLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = NSStringFromSelector(a2);
      id v27 = [(HUItemModuleController *)self module];
      [v27 personalRequestsDevices];
      int v28 = v47 = self;
      *(_DWORD *)buf = 138412802;
      v56 = v26;
      __int16 v57 = 2112;
      id v58 = v24;
      __int16 v59 = 2112;
      v60 = v28;
      _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@ toggling PR Set for targetSet = [%@], currentPRDevices = %@", buf, 0x20u);

      self = v47;
    }

    if (!v24) {
      goto LABEL_36;
    }
    id v29 = self;
    v30 = [(HUItemModuleController *)self module];
    int v31 = [v30 personalRequestsDevices];
    v32 = (void *)[v31 mutableCopy];
    int v33 = v32;
    if (v32) {
      id v34 = v32;
    }
    else {
      id v34 = (id)objc_opt_new();
    }
    uint64_t v36 = v34;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v37 = v24;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      v46 = v22;
      id v48 = v20;
      uint64_t v40 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v51 != v40) {
            objc_enumerationMutation(v37);
          }
          int v42 = [v36 containsObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        int v43 = v42;
        uint64_t v39 = [v37 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v39);

      id v22 = v46;
      id v20 = v48;
      if (v43)
      {
        uint64_t v44 = [v37 allObjects];
        [v36 removeObjectsInArray:v44];
LABEL_35:

        v45 = [(HUItemModuleController *)v29 module];
        [v45 setPersonalRequestsDevices:v36];

LABEL_36:
        goto LABEL_37;
      }
    }
    else
    {
    }
    uint64_t v44 = [v37 allObjects];
    [v36 addObjectsFromArray:v44];
    goto LABEL_35;
  }
  int v35 = [(HUItemModuleController *)self module];
  [v35 toggleAllPersonalRequestsDevices];

LABEL_37:
}

- (void)_presentConfirmationForEnablingPersonalRequestsForItem:(id)a3 cell:(id)a4 didTurnOn:(BOOL)a5 isOutdatedOS:(BOOL)a6 unsupportedAccessoryLanguage:(BOOL)a7 hasMismatchedLanguages:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v47 = a6;
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  id v14 = v12;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    id v17 = [v16 sourceItem];
  }
  else
  {
    id v17 = v14;
  }
  id v18 = v17;
  id v19 = &unk_1F1A3D558;
  if ([v18 conformsToProtocol:v19]) {
    id v20 = v18;
  }
  else {
    id v20 = 0;
  }
  id v49 = v20;

  if (v16) {
  uint64_t v21 = [v49 accessories];
  }
  id v22 = [v21 anyObject];
  id v23 = objc_msgSend(v22, "hf_categoryOrPrimaryServiceType");

  id v24 = [(HUItemModuleController *)self module];
  LODWORD(v22) = [v24 recognitionLanguageIsSupportedVRLanguageForCurrentDevice];

  id v25 = [MEMORY[0x1E4F42948] currentDevice];
  int v31 = [v25 name];
  v32 = @"HUUsersPersonalRequestsAlertTitleForMismatchedUnsupportedDeviceLanguage";
  if (v22) {
    v32 = @"HUUsersPersonalRequestsAlertTitleForMismatchedSupportedLanguages";
  }
  if (v9) {
    v32 = @"HUUsersPersonalRequestsAlertTitleForMismatchedUnsupportedAccessoryLanguage";
  }
  if (!v8) {
    v32 = @"HUUsersPersonalRequestsAlertTitleForUnsupportedMULanguages";
  }
  if (v47) {
    int v33 = @"HUUsersPersonalRequestsAlertTitleForUnsupported";
  }
  else {
    int v33 = v32;
  }
  v45 = v23;
  id v34 = HULocalizedCategoryOrPrimaryServiceTypeStringWithFormat(v33, @"%@", v23, v26, v27, v28, v29, v30, (uint64_t)v31);

  int v35 = objc_msgSend(MEMORY[0x1E4F42728], "hu_actionSheetWithTitle:message:anchorView:", 0, v34, v13);
  id v48 = self;
  objc_initWeak(location, self);
  uint64_t v36 = (void *)MEMORY[0x1E4F42720];
  id v37 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsUsePersonalRequestsAnywayActionTitle", @"HUUsersPersonalRequestsUsePersonalRequestsAnywayActionTitle", 1);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke;
  v52[3] = &unk_1E6389EB8;
  objc_copyWeak(&v55, location);
  id v38 = v14;
  id v53 = v38;
  id v39 = v13;
  id v54 = v39;
  BOOL v56 = a5;
  uint64_t v40 = [v36 actionWithTitle:v37 style:0 handler:v52];

  v41 = (void *)MEMORY[0x1E4F42720];
  int v42 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequestsUsePersonalRequestsCancelActionTitle", @"HUUsersPersonalRequestsUsePersonalRequestsCancelActionTitle", 1);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke_2;
  v50[3] = &unk_1E6385188;
  id v43 = v39;
  id v51 = v43;
  uint64_t v44 = [v41 actionWithTitle:v42 style:1 handler:v50];

  [v35 addAction:v40];
  [v35 addAction:v44];
  [(HUPersonalRequestsDevicesModuleController *)v48 _presentAlert:v35];

  objc_destroyWeak(&v55);
  objc_destroyWeak(location);
}

void __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _turnOnPersonalRequestForItem:*(void *)(a1 + 32) cell:*(void *)(a1 + 40) didTurnOn:*(unsigned __int8 *)(a1 + 56)];
}

uint64_t __180__HUPersonalRequestsDevicesModuleController__presentConfirmationForEnablingPersonalRequestsForItem_cell_didTurnOn_isOutdatedOS_unsupportedAccessoryLanguage_hasMismatchedLanguages___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:0];
}

- (void)_turnOnPersonalRequestForItem:(id)a3 cell:(id)a4 didTurnOn:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    [(HUPersonalRequestsDevicesModuleController *)self _preflightEnablingPersonalRequests];
  }
  else {
  id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke;
  v17[3] = &unk_1E63859F8;
  v17[4] = self;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v10 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke_2;
  v15[3] = &unk_1E6386708;
  id v16 = v9;
  id v13 = v9;
  id v14 = (id)[v12 addFailureBlock:v15];
}

uint64_t __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _togglePersonalRequestStateForItem:*(void *)(a1 + 40)];
}

uint64_t __90__HUPersonalRequestsDevicesModuleController__turnOnPersonalRequestForItem_cell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUIWithAnimation:1];
}

- (id)turnOnPersonalRequestsForAllMultiUserCapableDevices
{
  uint64_t v3 = [(HUPersonalRequestsDevicesModuleController *)self _preflightEnablingPersonalRequests];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__HUPersonalRequestsDevicesModuleController_turnOnPersonalRequestsForAllMultiUserCapableDevices__block_invoke;
  v6[3] = &unk_1E6387DC8;
  v6[4] = self;
  id v4 = (id)[v3 addSuccessBlock:v6];

  return v3;
}

void __96__HUPersonalRequestsDevicesModuleController_turnOnPersonalRequestsForAllMultiUserCapableDevices__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) module];
  [v1 turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices];
}

- (id)setPersonalRequestsDevices:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(HUPersonalRequestsDevicesModuleController *)self _preflightEnablingPersonalRequests];
  }
  else {
  id v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HUPersonalRequestsDevicesModuleController_setPersonalRequestsDevices___block_invoke;
  v9[3] = &unk_1E63859F8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addSuccessBlock:v9];

  return v5;
}

void __72__HUPersonalRequestsDevicesModuleController_setPersonalRequestsDevices___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) module];
  [v2 setPersonalRequestsDevices:*(void *)(a1 + 40)];
}

@end