@interface HURestrictedGuestAccessSettingsModuleController
- (Class)cellClassForItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HURestrictedGuestAccessSettingsModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 sourceItem];
  objc_opt_class();
  objc_opt_isKindOfClass();

  v8 = objc_opt_class();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HURestrictedGuestAccessSettingsModuleController;
  [(HUItemModuleController *)&v23 setupCell:v6 forItem:v7];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [v10 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    id v13 = v6;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    v16 = [v8 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

    if (v17) {
      [v15 setUserHandle:v17];
    }
    v18 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v8];
    [v15 setShowAccessLevelDescription:1];
    [v18 setPrefersSideBySideTextAndSecondaryText:0];
    [v13 setContentConfiguration:v18];
    v19 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    [v13 setBackgroundColor:v19];
  }
  objc_opt_class();
  id v20 = v6;
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    [v22 setDelegate:self];
    [v22 setOverrideDefaultContentConfiguration:0];
  }
}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    id v10 = [v7 text];
    v11 = [v7 item];
    *(_DWORD *)buf = 138413314;
    v56 = self;
    __int16 v57 = 2112;
    v58 = v9;
    __int16 v59 = 2112;
    v60 = v10;
    __int16 v61 = 1024;
    BOOL v62 = v4;
    __int16 v63 = 2112;
    v64 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped on switch cell '%@' | isOn = %{BOOL}d | item = %@", buf, 0x30u);
  }
  objc_opt_class();
  v12 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = [v7 item];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v18 = [v17 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    id v45 = v17;
    id v20 = [v17 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6384D08;
    id v43 = v14;
    id v23 = v14;
    id v51 = v23;
    BOOL v54 = v4;
    id v24 = v22;
    id v52 = v24;
    id v46 = v7;
    id v25 = v7;
    BOOL v26 = v4;
    id v27 = v25;
    id v53 = v25;
    v28 = (void (**)(void))_Block_copy(aBlock);
    v29 = [v24 user];
    v44 = v24;
    v30 = [v24 home];
    objc_opt_class();
    v31 = [(HUItemModuleController *)self host];
    if (objc_opt_isKindOfClass()) {
      v32 = v31;
    }
    else {
      v32 = 0;
    }
    id v33 = v32;

    v34 = [v23 accessoryToAdd];
    if (v33)
    {
      v35 = (void *)MEMORY[0x1E4F42FF8];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_11;
      v47[3] = &unk_1E6385A70;
      id v48 = v27;
      BOOL v49 = v26;
      objc_msgSend(v35, "hu_presentingLockLimitAlertIfNeededFromViewController:home:user:accessory:include:continueActionBlock:cancelActionBlock:", v33, v30, v29, v34, v26, v28, v47);
    }
    else
    {
      v36 = HFLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v42 = [(HUItemModuleController *)self host];
        *(_DWORD *)buf = 136315394;
        v56 = (HURestrictedGuestAccessSettingsModuleController *)"-[HURestrictedGuestAccessSettingsModuleController userS"
                                                                 "witchCell:didTurnOn:]";
        __int16 v57 = 2112;
        v58 = v42;
        _os_log_error_impl(&dword_1BE345000, v36, OS_LOG_TYPE_ERROR, "(%s) Unable to find hostVC. Updating access without alert. host = %@", buf, 0x16u);
      }
      v28[2](v28);
    }
    id v7 = v46;

    id v17 = v45;
    id v14 = v43;
  }
  v37 = [v14 itemUpdater];
  v38 = (void *)MEMORY[0x1E4F69230];
  v39 = [v14 itemProviders];
  v40 = [v38 requestToReloadItemProviders:v39 senderSelector:a2];
  id v41 = (id)[v37 performItemUpdateRequest:v40];
}

void __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) enableRestrictedGuestAccessSetting:*(unsigned __int8 *)(a1 + 56) forItem:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_2;
  v4[3] = &unk_1E6385A48;
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  id v3 = (id)[v2 addCompletionBlock:v4];
}

void __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[HURestrictedGuestAccessSettingsModuleController userSwitchCell:didTurnOn:]_block_invoke_2";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "(%s) Failed to update restricted guest access settings with error %@.", (uint8_t *)&v7, 0x16u);
    }

    char v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:v4 operationType:*MEMORY[0x1E4F687E8] options:0 retryBlock:0 cancelBlock:0];
  }
}

uint64_t __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0];
}

@end