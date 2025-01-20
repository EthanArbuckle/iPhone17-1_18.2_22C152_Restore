@interface HUAnnounceSettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)_populateHostInformation:(id)a3;
- (void)_submitAnalyticsForAnnounceHomePodSettingItem:(id)a3 enabled:(BOOL)a4 writeWasSuccessfull:(BOOL)a5;
- (void)_submitAnalyticsForAnnounceNotificationSettingItem:(id)a3 writeWasSuccessfull:(BOOL)a4;
- (void)_submitAnalyticsForAnnounceUserSettingItem:(id)a3 enabled:(BOOL)a4 writeWasSuccessfull:(BOOL)a5;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUAnnounceSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }
  v4 = objc_opt_class();

  return (Class)v4;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUAnnounceSettingsItemModuleController;
  [(HUItemModuleController *)&v13 setupCell:v6 forItem:a4];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    [v9 setDelegate:self];
  }
  objc_opt_class();
  id v10 = v7;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12) {
    [v12 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)HUAnnounceSettingsItemModuleController;
  [(HUItemModuleController *)&v55 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    objc_opt_class();
    id v13 = v9;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      v16 = [v13 latestResults];
      v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
      if ([v17 BOOLValue]) {
        uint64_t v18 = 3;
      }
      else {
        uint64_t v18 = 0;
      }
      [v12 setAccessoryType:v18];

      [v12 setDisabled:0];
    }
  }
  objc_opt_class();
  id v19 = v10;
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  if (v21)
  {
    objc_opt_class();
    id v22 = v9;
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    if (v24)
    {
      v25 = [v24 home];
      v26 = [v24 user];
      v27 = objc_msgSend(v25, "hf_handleForUser:", v26);
      [v21 setUserHandle:v27];

      objc_msgSend(v21, "setOn:", objc_msgSend(v24, "isAnnounceEnabled"));
      if (objc_msgSend(v25, "hf_currentUserIsOwner"))
      {
        uint64_t v28 = 0;
      }
      else if (objc_msgSend(v25, "hf_currentUserIsAdministrator"))
      {
        v29 = [v26 uniqueIdentifier];
        v30 = [v25 currentUser];
        v31 = [v30 uniqueIdentifier];
        int v53 = objc_msgSend(v29, "hmf_isEqualToUUID:", v31);

        v32 = [v25 homeAccessControlForUser:v26];
        LODWORD(v30) = [v32 isAdministrator];

        uint64_t v28 = v30 & ~v53;
      }
      else
      {
        uint64_t v28 = 1;
      }
      [v21 setDisabled:v28];
    }
  }
  objc_opt_class();
  id v33 = v19;
  if (objc_opt_isKindOfClass()) {
    v34 = v33;
  }
  else {
    v34 = 0;
  }
  id v35 = v34;

  if (v35)
  {
    id v54 = v12;
    objc_opt_class();
    id v36 = v9;
    if (objc_opt_isKindOfClass()) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    objc_opt_class();
    v39 = [v38 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v40 = v39;
    }
    else {
      v40 = 0;
    }
    id v41 = v40;

    id v42 = v41;
    if ([v42 conformsToProtocol:&unk_1F1A3D558]) {
      v43 = v42;
    }
    else {
      v43 = 0;
    }
    id v44 = v43;

    v45 = [v44 accessories];

    v46 = [v45 anyObject];
    v47 = [v46 home];
    int v48 = objc_msgSend(v47, "hf_currentUserIsAdministrator");

    v49 = [v38 sourceItem];
    if ([v49 conformsToProtocol:&unk_1F1A3D2C0]) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
    id v51 = v50;

    if (v51)
    {
      objc_msgSend(v35, "setOn:", objc_msgSend(v51, "isAnnounceEnabled"));
      [v35 setDisabled:v48 ^ 1u];
      [v35 setIconDisplayStyle:1];
      v52 = +[HUIconCellContentMetrics compactMetrics];
      [v35 setContentMetrics:v52];
    }
    id v12 = v54;
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 updateNotificationSettings:v4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__HUAnnounceSettingsItemModuleController_didSelectItem___block_invoke;
    v11[3] = &unk_1E6384CE0;
    v11[4] = self;
    id v12 = v4;
    id v9 = (id)[v8 addCompletionBlock:v11];
  }
  return 0;
}

uint64_t __56__HUAnnounceSettingsItemModuleController_didSelectItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = v3;
  return [*(id *)(a1 + 32) _submitAnalyticsForAnnounceNotificationSettingItem:*(void *)(a1 + 40) writeWasSuccessfull:v4];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  id v10 = [v6 item];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = [v12 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  unint64_t v15 = v14;

  objc_opt_class();
  v16 = [v12 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  unint64_t v18 = v17;

  if (v15 | v18)
  {
    id v19 = [v6 item];
    v20 = [v9 enableAnnounceSetting:v4 forItem:v19];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__HUAnnounceSettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v27[3] = &unk_1E6387E38;
    v27[4] = self;
    id v28 = v6;
    BOOL v29 = v4;
    id v21 = (id)[v20 addCompletionBlock:v27];
  }
  objc_opt_class();
  id v22 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  id v24 = v23;

  if (v24)
  {
    if (v15) {
      v25 = (void *)v15;
    }
    else {
      v25 = (void *)v18;
    }
    id v26 = v25;
    if (!v26) {
      id v26 = v12;
    }
    [MEMORY[0x1E4F68EE0] sendSwitchCellToggleEventForItem:v26 isOn:v4 title:@"announceAccessoryItem" fromSourceViewController:v24];
  }
}

void __63__HUAnnounceSettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) item];
  if (a2) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  [v6 _submitAnalyticsForAnnounceHomePodSettingItem:v7 enabled:*(unsigned __int8 *)(a1 + 48) writeWasSuccessfull:v9];

  if (a3)
  {
    id v10 = *(void **)(a1 + 40);
    BOOL v11 = *(unsigned char *)(a1 + 48) == 0;
    [v10 setOn:v11 animated:1];
  }
}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_opt_class();
  BOOL v8 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  BOOL v11 = [v7 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v13 = [v7 item];
    v14 = [v10 enablePermissionSetting:v4 forItem:v13];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__HUAnnounceSettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke;
    v26[3] = &unk_1E6387E38;
    v26[4] = self;
    id v27 = v7;
    BOOL v28 = v4;
    id v15 = (id)[v14 addCompletionBlock:v26];
  }
  v16 = [v10 itemUpdater];
  v17 = (void *)MEMORY[0x1E4F69230];
  unint64_t v18 = [v10 itemProviders];
  id v19 = [v17 requestToReloadItemProviders:v18 senderSelector:a2];
  id v20 = (id)[v16 performItemUpdateRequest:v19];

  objc_opt_class();
  id v21 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  if (v23)
  {
    id v24 = (void *)MEMORY[0x1E4F68EE0];
    v25 = [v7 item];
    [v24 sendSwitchCellToggleEventForItem:v25 isOn:v4 title:@"userDisplayString" fromSourceViewController:v23];
  }
}

void __67__HUAnnounceSettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) item];
  if (a2) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  [v6 _submitAnalyticsForAnnounceUserSettingItem:v7 enabled:*(unsigned __int8 *)(a1 + 48) writeWasSuccessfull:v9];

  if (a3)
  {
    id v10 = *(void **)(a1 + 40);
    BOOL v11 = *(unsigned char *)(a1 + 48) == 0;
    [v10 setOn:v11 animated:1];
  }
}

- (void)_submitAnalyticsForAnnounceUserSettingItem:(id)a3 enabled:(BOOL)a4 writeWasSuccessfull:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_opt_class();
  id v29 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v29;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  BOOL v11 = [v10 home];
  id v12 = objc_opt_new();
  id v13 = [NSNumber numberWithBool:v6];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68060]];

  v14 = NSNumber;
  id v15 = [v11 currentUser];
  v16 = [v10 user];
  v17 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isEqual:", v16));
  [v12 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68118]];

  unint64_t v18 = NSNumber;
  id v19 = [v10 user];
  if (objc_msgSend(v11, "hf_userIsAdministrator:", v19)) {
    uint64_t v20 = objc_msgSend(v11, "hf_currentUserIsOwner") ^ 1;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = [v18 numberWithInt:v20];
  [v12 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68110]];

  id v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "hf_currentUserIsOwner"));
  [v12 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F68100]];

  id v23 = NSNumber;
  if (objc_msgSend(v11, "hf_currentUserIsAdministrator")) {
    uint64_t v24 = objc_msgSend(v11, "hf_currentUserIsOwner") ^ 1;
  }
  else {
    uint64_t v24 = 0;
  }
  v25 = [v23 numberWithInt:v24];
  [v12 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F680F8]];

  id v26 = [NSNumber numberWithInt:!v5];
  [v12 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F680F0]];

  [(HUAnnounceSettingsItemModuleController *)self _populateHostInformation:v12];
  id v27 = (void *)MEMORY[0x1E4F68EE0];
  BOOL v28 = (void *)[v12 copy];
  [v27 sendEvent:21 withData:v28];
}

- (void)_submitAnalyticsForAnnounceHomePodSettingItem:(id)a3 enabled:(BOOL)a4 writeWasSuccessfull:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_opt_class();
  id v24 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v24;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  BOOL v11 = [v10 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  v14 = [v13 home];
  id v15 = objc_opt_new();
  v16 = [NSNumber numberWithBool:v6];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68058]];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "hf_currentUserIsOwner"));
  [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68100]];

  unint64_t v18 = NSNumber;
  if (objc_msgSend(v14, "hf_currentUserIsAdministrator")) {
    uint64_t v19 = objc_msgSend(v14, "hf_currentUserIsOwner") ^ 1;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [v18 numberWithInt:v19];
  [v15 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F680F8]];

  id v21 = [NSNumber numberWithInt:!v5];
  [v15 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F680F0]];

  [(HUAnnounceSettingsItemModuleController *)self _populateHostInformation:v15];
  id v22 = (void *)MEMORY[0x1E4F68EE0];
  id v23 = (void *)[v15 copy];
  [v22 sendEvent:22 withData:v23];
}

- (void)_submitAnalyticsForAnnounceNotificationSettingItem:(id)a3 writeWasSuccessfull:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  id v22 = v6;
  if (objc_opt_isKindOfClass()) {
    id v7 = v22;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  uint64_t v9 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 home];
  id v13 = objc_opt_new();
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "notificationMode"));
  [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68070]];

  id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsOwner"));
  [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68100]];

  v16 = NSNumber;
  if (objc_msgSend(v12, "hf_currentUserIsAdministrator")) {
    uint64_t v17 = objc_msgSend(v12, "hf_currentUserIsOwner") ^ 1;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [v16 numberWithInt:v17];
  [v13 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F680F8]];

  uint64_t v19 = [NSNumber numberWithInt:!v4];
  [v13 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F680F0]];

  [(HUAnnounceSettingsItemModuleController *)self _populateHostInformation:v13];
  uint64_t v20 = (void *)MEMORY[0x1E4F68EE0];
  id v21 = (void *)[v13 copy];
  [v20 sendEvent:23 withData:v21];
}

- (void)_populateHostInformation:(id)a3
{
  id v4 = a3;
  id v15 = [(HUItemModuleController *)self host];
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0;
  id v6 = v15;
  if (v5) {
    id v6 = 0;
  }
  id v7 = [v6 parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v9 = [(HUItemModuleController *)self host];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  id v11 = [(HUItemModuleController *)self host];
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  id v12 = [NSNumber numberWithBool:isKindOfClass & 1];
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68108]];

  id v13 = [NSNumber numberWithBool:v10 & 1];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68128]];

  v14 = [NSNumber numberWithBool:v9 & 1];
  [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68120]];
}

@end