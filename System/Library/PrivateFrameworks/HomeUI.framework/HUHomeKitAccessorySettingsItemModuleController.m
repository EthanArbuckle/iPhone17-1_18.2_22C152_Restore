@interface HUHomeKitAccessorySettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (HUHomeKitAccessorySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4;
- (HUHomeKitAccessorySettingsItemModuleControllerDelegate)delegate;
- (NSMapTable)cellToItemMap;
- (unint64_t)didSelectItem:(id)a3;
- (void)_updateSwitchSettingItem:(id)a3 forCell:(id)a4 withValue:(BOOL)a5;
- (void)setCellToItemMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUHomeKitAccessorySettingsItemModuleController

- (HUHomeKitAccessorySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUHomeKitAccessorySettingsItemModuleController;
  v7 = [(HUItemModuleController *)&v12 initWithModule:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    cellToItemMap = v8->_cellToItemMap;
    v8->_cellToItemMap = (NSMapTable *)v9;
  }
  return v8;
}

- (Class)cellClassForItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  v8 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v7 && ([v10 isCollapsed] & 1) == 0)
  {
    if ([v7 userInterfaceType] != 8
      && [v7 userInterfaceType]
      && [v7 userInterfaceType] != 4)
    {
      [v7 userInterfaceType];
    }
  }
  else if ([v10 isCollapsed])
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Module [%@] is asked to be configured as Collapsed, hence we will configure this cell as HUTitleValueCell", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_super v12 = objc_opt_class();

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUHomeKitAccessorySettingsItemModuleController;
  [(HUItemModuleController *)&v25 setupCell:v6 forItem:v7];
  v8 = [(HUHomeKitAccessorySettingsItemModuleController *)self cellToItemMap];
  [v8 setObject:v7 forKey:v6];

  objc_opt_class();
  id v9 = v6;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  id v12 = v9;
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  objc_opt_class();
  id v18 = v7;
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  v21 = [v20 settingDict];
  v22 = [v20 settingKeyPath];
  v23 = [v21 objectForKeyedSubscript:v22];

  if (v11)
  {
    [v11 setDelegate:self];
  }
  else if (v14)
  {
    [v14 setHideIcon:1];
  }
  if ([v17 isCollapsed])
  {
    [v12 setAccessoryType:1];
  }
  else
  {
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68CB8]];
    [v12 setAccessoryType:v24 != 0];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUHomeKitAccessorySettingsItemModuleController;
  [(HUItemModuleController *)&v25 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = v8;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  objc_opt_class();
  id v16 = v13;
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  if (v15)
  {
    v19 = [v12 settingValue];
    objc_msgSend(v15, "setOn:", objc_msgSend(v19, "BOOLValue"));
  }
  else
  {
    if (!v18) {
      goto LABEL_13;
    }
    id v20 = [v12 settingDict];
    uint64_t v21 = [v12 settingKeyPath];
    v19 = [v20 objectForKeyedSubscript:v21];

    v22 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68400]];
    LOBYTE(v21) = [v22 BOOLValue];

    if (v21)
    {
      v23 = [v10 latestResults];
      v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      [v18 setValueText:v24];
    }
    else
    {
      [v18 setValueText:0];
    }
  }

LABEL_13:
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "User tapped item [%@]", (uint8_t *)&v32, 0xCu);
  }

  objc_opt_class();
  id v6 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v4;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 settingKeyPath];
  id v13 = [v11 settingDict];
  id v14 = [v13 objectForKeyedSubscript:v12];

  id v15 = [v11 latestResults];
  id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  char v17 = [v16 BOOLValue];

  if ((v17 & 1) == 0)
  {
    id v18 = (void *)MEMORY[0x1E4F68CB8];
    uint64_t v19 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68CB8]];
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v21 = [(HUHomeKitAccessorySettingsItemModuleController *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = [v14 objectForKeyedSubscript:*v18];
        v24 = NSClassFromString(v23);

        id v25 = [v24 alloc];
        v26 = [(HUItemModuleController *)self module];
        v27 = (void *)[v25 initWithAccessorySettingItem:v9 module:v26];

        v28 = [(HUHomeKitAccessorySettingsItemModuleController *)self delegate];
        [v28 moduleController:self presentSettingDetailsViewController:v27];

LABEL_17:
        goto LABEL_18;
      }
    }
    if (v8)
    {
      if ([v8 isCollapsed])
      {
        v29 = [(HUHomeKitAccessorySettingsItemModuleController *)self delegate];
        char v30 = objc_opt_respondsToSelector();

        if (v30)
        {
          v27 = [(HUHomeKitAccessorySettingsItemModuleController *)self delegate];
          [v27 moduleController:self expandModule:v8];
          goto LABEL_17;
        }
      }
    }
  }
LABEL_18:

  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = [(HUHomeKitAccessorySettingsItemModuleController *)self cellToItemMap];
  id v8 = [v7 objectForKey:v6];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [(HUHomeKitAccessorySettingsItemModuleController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(HUHomeKitAccessorySettingsItemModuleController *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v14[3] = &unk_1E638B740;
    id v15 = v6;
    BOOL v18 = v4;
    id v16 = v10;
    char v17 = self;
    [v13 moduleController:self preflightCheckToAllowSwitchingForSettingItem:v16 changingToOn:v4 withCompletion:v14];
  }
  else
  {
    [(HUHomeKitAccessorySettingsItemModuleController *)self _updateSwitchSettingItem:v10 forCell:v6 withValue:v4];
  }
}

void __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
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
    v15[2] = __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_18;
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
    v11[2] = __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_35;
    v11[3] = &unk_1E6389DD8;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 56);
    id v10 = (id)[v3 addFailureBlock:v11];
  }
}

void __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_18(uint64_t a1, void *a2)
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

uint64_t __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_35(uint64_t a1)
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
  id v7 = a3;
  id v8 = a4;
  int v9 = [NSNumber numberWithBool:v5];
  id v10 = [v7 updateValue:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__HUHomeKitAccessorySettingsItemModuleController__updateSwitchSettingItem_forCell_withValue___block_invoke;
  v14[3] = &unk_1E6387E38;
  BOOL v17 = v5;
  id v15 = v8;
  id v16 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = (id)[v10 addCompletionBlock:v14];
}

void __93__HUHomeKitAccessorySettingsItemModuleController__updateSwitchSettingItem_forCell_withValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 48) == 0];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v8 = [v7 accessorySettingsDataSource];
    int v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    id v10 = [*(id *)(a1 + 40) settingKeyPath];
    id v11 = [*(id *)(a1 + 40) accessoryIdentifier];
    [v8 updateSettingValue:v9 forKeyPath:v10 accessoryIdentifier:v11];
  }
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    char v14 = @"FAILED to";
    int v15 = *(unsigned __int8 *)(a1 + 48);
    if (!v6) {
      char v14 = @"Successfully";
    }
    id v16 = @"Reverting UI state.";
    int v17 = 138413058;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    if (!v6) {
      id v16 = &stru_1F18F92B8;
    }
    id v20 = v14;
    __int16 v21 = 1024;
    int v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Setting [%@] %@ update with value %{BOOL}d. %@", (uint8_t *)&v17, 0x26u);
  }
}

- (HUHomeKitAccessorySettingsItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUHomeKitAccessorySettingsItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCellToItemMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellToItemMap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end