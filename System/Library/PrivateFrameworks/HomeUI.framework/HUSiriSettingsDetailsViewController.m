@interface HUSiriSettingsDetailsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUSiriSettingsDetailsItemManager)siriSettingsDetailsItemManager;
- (HUSiriSettingsDetailsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (NSMapTable)cellToItemMap;
- (NSMapTable)moduleToModuleControllerMap;
- (id)itemModuleControllers;
- (void)_preflightCheckToAllowSwitchingForSettingItem:(id)a3 changingToOn:(BOOL)a4 withCompletion:(id)a5;
- (void)_updateSwitchSettingItem:(id)a3 forCell:(id)a4 withValue:(BOOL)a5;
- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6;
- (void)setCellToItemMap:(id)a3;
- (void)setModuleToModuleControllerMap:(id)a3;
- (void)setSiriSettingsDetailsItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUSiriSettingsDetailsViewController

- (HUSiriSettingsDetailsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v5 = a4;
  v6 = [[HUSiriSettingsDetailsItemManager alloc] initWithDelegate:self module:v5];
  [(HUSiriSettingsDetailsViewController *)self setSiriSettingsDetailsItemManager:v6];

  v7 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
  v16.receiver = self;
  v16.super_class = (Class)HUSiriSettingsDetailsViewController;
  v8 = [(HUItemTableViewController *)&v16 initWithItemManager:v7 tableViewStyle:1];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    cellToItemMap = v8->_cellToItemMap;
    v8->_cellToItemMap = (NSMapTable *)v9;

    v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v12 = [v11 accessorySettingsDataSource];
    v13 = [v5 settingGroupKeyPath];
    v14 = objc_msgSend(v12, "hf_localizedTitleForKeyPath:", v13);
    [(HUSiriSettingsDetailsViewController *)v8 setTitle:v14];
  }
  return v8;
}

- (id)itemModuleControllers
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
  id v5 = [v4 homeKitAccessorySettingsModules];

  if (v5)
  {
    v32 = v3;
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v30 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
      v31 = [v30 homeKitAccessorySettingsModules];
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      _os_log_debug_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEBUG, "Creating Item Module Controllers from  homeKitAccessorySettingsModules = [%@]", buf, 0xCu);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v7 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
    v8 = [v7 homeKitAccessorySettingsModules];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
          objc_opt_class();
          id v14 = v13;
          if (objc_opt_isKindOfClass()) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
          id v16 = v15;

          if (v16)
          {
            v17 = [(HUSiriSettingsDetailsViewController *)self moduleToModuleControllerMap];
            v18 = [v17 objectForKey:v16];

            if (!v18)
            {
              v19 = [[HUHomeKitAccessorySettingsItemModuleController alloc] initWithModule:v16 delegate:self];
              v20 = [(HUSiriSettingsDetailsViewController *)self moduleToModuleControllerMap];

              if (!v20)
              {
                v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                [(HUSiriSettingsDetailsViewController *)self setModuleToModuleControllerMap:v21];
              }
              v22 = HFLogForCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v19;
                __int16 v39 = 2112;
                id v40 = v16;
                _os_log_debug_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEBUG, "Setting moduleController = [%@] for Module = [%@] in moduleToModuleControllerMap", buf, 0x16u);
              }

              v23 = [(HUSiriSettingsDetailsViewController *)self moduleToModuleControllerMap];
              [v23 setObject:v19 forKey:v16];
            }
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v10);
    }

    v24 = [(HUSiriSettingsDetailsViewController *)self moduleToModuleControllerMap];
    v25 = [v24 objectEnumerator];

    uint64_t v26 = [v25 nextObject];
    v3 = v32;
    if (v26)
    {
      v27 = (void *)v26;
      do
      {
        objc_msgSend(v32, "na_safeAddObject:", v27);
        uint64_t v28 = [v25 nextObject];

        v27 = (void *)v28;
      }
      while (v28);
    }
  }

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if ([v7 userInterfaceType] != 8
    && [v7 userInterfaceType]
    && [v7 userInterfaceType] != 4)
  {
    [v7 userInterfaceType];
  }
  v8 = objc_opt_class();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v9 = v7;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  id v21 = v9;
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v21;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = v8;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [v16 settingDict];
  v18 = [v16 settingKeyPath];
  v19 = [v17 objectForKeyedSubscript:v18];

  if (v11)
  {
    [v11 setDelegate:self];
  }
  else if (v13)
  {
    [v13 setHideIcon:1];
  }
  v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68CB8]];
  [v21 setAccessoryType:v20 != 0];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUSiriSettingsDetailsViewController;
  [(HUItemTableViewController *)&v27 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = v10;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  objc_opt_class();
  id v18 = v15;
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v17)
  {
    id v21 = [v14 settingValue];
    objc_msgSend(v17, "setOn:", objc_msgSend(v21, "BOOLValue"));
  }
  else
  {
    if (!v20) {
      goto LABEL_13;
    }
    v22 = [v14 settingDict];
    uint64_t v23 = [v14 settingKeyPath];
    id v21 = [v22 objectForKeyedSubscript:v23];

    v24 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68400]];
    LOBYTE(v23) = [v24 BOOLValue];

    if (v23)
    {
      v25 = [v12 latestResults];
      uint64_t v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      [v20 setValueText:v26];
    }
    else
    {
      [v20 setValueText:0];
    }
  }

LABEL_13:
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUSiriSettingsDetailsViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 displayedItemAtIndexPath:v8];

  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke;
  v16[3] = &unk_1E638B740;
  id v17 = v6;
  id v18 = v13;
  BOOL v20 = v4;
  v19 = self;
  id v14 = v13;
  id v15 = v6;
  [(HUSiriSettingsDetailsViewController *)self _preflightCheckToAllowSwitchingForSettingItem:v14 changingToOn:v4 withCompletion:v16];
}

void __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' running preflight check before changing...", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_14;
    v15[3] = &unk_1E638B718;
    id v7 = *(id *)(a1 + 40);
    char v19 = *(unsigned char *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 48);
    id v16 = v7;
    uint64_t v17 = v8;
    id v18 = *(id *)(a1 + 32);
    id v9 = (id)[v3 addSuccessBlock:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_31;
    v11[3] = &unk_1E6389DD8;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 56);
    id v10 = (id)[v3 addFailureBlock:v11];
  }
}

void __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if ([v3 BOOLValue]) {
      uint64_t v6 = @"passed";
    }
    else {
      uint64_t v6 = @"failed";
    }
    int v7 = [v3 BOOLValue];
    uint64_t v8 = @"NOT CHANGING";
    int v9 = *(unsigned __int8 *)(a1 + 56);
    if (v7) {
      uint64_t v8 = @"CHANGING";
    }
    id v10 = @"ON";
    int v11 = 138413058;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    char v14 = v6;
    __int16 v15 = 2112;
    if (!v9) {
      id v10 = @"OFF";
    }
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) preflight returned check %@, %@ %@ to '%@'", (uint8_t *)&v11, 0x2Au);
  }

  if ([v3 BOOLValue]) {
    [*(id *)(a1 + 40) _updateSwitchSettingItem:*(void *)(a1 + 32) forCell:*(void *)(a1 + 48) withValue:*(unsigned __int8 *)(a1 + 56)];
  }
}

uint64_t __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_31(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(Switch) preflight failed, NOT changing %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setOn:*(unsigned char *)(a1 + 48) == 0 animated:1];
}

- (void)_updateSwitchSettingItem:(id)a3 forCell:(id)a4 withValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
  int v11 = [NSNumber numberWithBool:v5];
  uint64_t v12 = [v10 updateSettingItem:v8 withValue:v11];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke;
  v21[3] = &unk_1E6389DD8;
  id v22 = v9;
  BOOL v24 = v5;
  id v13 = v8;
  id v23 = v13;
  id v14 = v9;
  id v15 = (id)[v12 addFailureBlock:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke_35;
  v18[3] = &unk_1E638B768;
  id v19 = v13;
  BOOL v20 = v5;
  id v16 = v13;
  id v17 = (id)[v12 addSuccessBlock:v18];
}

void __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 48) == 0];
  }
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 48);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Setting [%@] FAILED to update with value %{BOOL}d. Reverting UI state.", (uint8_t *)&v7, 0x12u);
  }
}

void __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke_35(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Setting [%@] Successfully updated with value %{BOOL}d.", (uint8_t *)&v5, 0x12u);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HUSiriSettingsDetailsViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v27 tableView:v7 didSelectRowAtIndexPath:v6];
  int v8 = [(HUItemTableViewController *)self itemManager];
  uint64_t v9 = [v8 displayedItemAtIndexPath:v6];

  [v7 deselectRowAtIndexPath:v6 animated:1];
  int v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "User tapped item [%@]", buf, 0xCu);
  }

  objc_opt_class();
  id v11 = v9;
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  id v14 = [v13 settingKeyPath];
  id v15 = [v13 settingDict];
  id v16 = [v15 objectForKeyedSubscript:v14];

  id v17 = (void *)MEMORY[0x1E4F68CB8];
  id v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68CB8]];

  if (v18)
  {
    id v19 = [v16 objectForKeyedSubscript:*v17];
    BOOL v20 = NSClassFromString(v19);

    id v21 = [v20 alloc];
    id v22 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
    id v23 = [v22 module];
    BOOL v24 = (void *)[v21 initWithAccessorySettingItem:v11 module:v23];

    v25 = [(HUSiriSettingsDetailsViewController *)self navigationController];
    id v26 = (id)objc_msgSend(v25, "hu_pushPreloadableViewController:animated:", v24, 1);
  }
}

- (void)_preflightCheckToAllowSwitchingForSettingItem:(id)a3 changingToOn:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v60 = self;
  int v10 = [(HUSiriSettingsDetailsViewController *)self siriSettingsDetailsItemManager];
  id v11 = [v10 module];
  uint64_t v12 = [v11 sourceItem];
  id v13 = &unk_1F1A3D558;
  if ([v12 conformsToProtocol:v13]) {
    id v14 = v12;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  id v16 = [v15 accessories];
  id v17 = [v16 anyObject];

  id v18 = [v17 mediaProfile];
  id v19 = objc_msgSend(v18, "hf_mediaAccessoryCommonSettingsManager");

  BOOL v20 = (void *)MEMORY[0x1E4F68038];
  id v21 = [v19 settingValueForKeyPath:*MEMORY[0x1E4F68038]];
  v61 = v21;
  if (v6 && ([v21 BOOLValue] & 1) == 0)
  {
    id v23 = [v8 settingKeyPath];
    int v22 = [v23 isEqualToString:*MEMORY[0x1E4F68D68]];
  }
  else
  {
    int v22 = 0;
  }
  BOOL v24 = HFLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [v8 settingKeyPath];
    *(_DWORD *)buf = 138413058;
    id v67 = v15;
    __int16 v68 = 1024;
    BOOL v69 = v6;
    __int16 v70 = 2112;
    v71 = v25;
    __int16 v72 = 1024;
    int v73 = v22;
    _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "sourceItem = %@, turningOnorOff = %{BOOL}d, settingItem.settingKeyPath = %@ , justTurningOnTapToAccess = %{BOOL}d", buf, 0x22u);
  }
  if (v6
    && ([v8 settingKeyPath],
        id v26 = objc_claimAutoreleasedReturnValue(),
        int v27 = [v26 isEqualToString:*v20] | v22,
        v26,
        v27 == 1))
  {
    uint64_t v28 = objc_msgSend(v17, "hf_siriEndpointProfile");
    v29 = [v28 currentAssistant];
    uint64_t v30 = HFLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = [v29 isSiriAssistant];
      *(_DWORD *)buf = 138412546;
      id v67 = v29;
      __int16 v68 = 1024;
      BOOL v69 = v31;
      _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "currentAssistant = %@, currentAssistant.isSiriAssistant = %{BOOL}d", buf, 0x12u);
    }

    if (v29 && ([v29 isSiriAssistant] & 1) == 0)
    {
      long long v33 = HFLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v29;
        _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "Accessory has a different assistant = %@", buf, 0xCu);
      }

      long long v34 = [v29 name];
      uint64_t v58 = HULocalizedStringWithFormat(@"HUSiriEndpoint_TurnOffAssistant_AlertTitle", @"%@", v35, v36, v37, v38, v39, v40, (uint64_t)v34);

      v41 = [v29 name];
      v59 = HULocalizedStringWithFormat(@"HUSiriEndpoint_TurnOffAssistant_AlertMessage", @"%@", v42, v43, v44, v45, v46, v47, (uint64_t)v41);

      v48 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v58 message:v59 preferredStyle:1];
      v49 = (void *)MEMORY[0x1E4F42720];
      uint64_t v50 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle", @"HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle", 1);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke;
      v64[3] = &unk_1E638B2B8;
      id v57 = v9;
      id v65 = v57;
      v51 = v49;
      v52 = (void *)v50;
      v53 = [v51 actionWithTitle:v50 style:0 handler:v64];
      [v48 addAction:v53];

      v54 = (void *)MEMORY[0x1E4F42720];
      v55 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_2;
      v62[3] = &unk_1E638B2B8;
      id v63 = v57;
      v56 = [v54 actionWithTitle:v55 style:1 handler:v62];
      [v48 addAction:v56];

      v32 = (void *)v58;
      [(HUSiriSettingsDetailsViewController *)v60 presentViewController:v48 animated:1 completion:0];
    }
    else
    {
      v32 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
      (*((void (**)(id, void *))v9 + 2))(v9, v32);
    }
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    (*((void (**)(id, void *))v9 + 2))(v9, v28);
  }
}

void __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 37);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 futureWithError:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v17, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F696F8] siriPrivacyURL];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [(HUSiriSettingsDetailsViewController *)self navigationController];
    uint64_t v12 = (void *)v11;
    if (v11) {
      id v13 = (HUSiriSettingsDetailsViewController *)v11;
    }
    else {
      id v13 = self;
    }
    id v14 = v13;

    id v15 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B48]];
    [v15 setPresentingViewController:v14];

    [v15 present];
  }

  return 0;
}

- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6
{
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setCellToItemMap:(id)a3
{
}

- (HUSiriSettingsDetailsItemManager)siriSettingsDetailsItemManager
{
  return self->_siriSettingsDetailsItemManager;
}

- (void)setSiriSettingsDetailsItemManager:(id)a3
{
}

- (NSMapTable)moduleToModuleControllerMap
{
  return self->_moduleToModuleControllerMap;
}

- (void)setModuleToModuleControllerMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleToModuleControllerMap, 0);
  objc_storeStrong((id *)&self->_siriSettingsDetailsItemManager, 0);

  objc_storeStrong((id *)&self->_cellToItemMap, 0);
}

@end