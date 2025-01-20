@interface HUAirPlaySettingsDetailsViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUAirPlaySettingsDetailsItemManager)airPlaySettingsDetailsItemManager;
- (HUAirPlaySettingsDetailsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (NSMapTable)cellToItemMap;
- (NSMapTable)moduleToModuleControllerMap;
- (id)itemModuleControllers;
- (void)setAirPlaySettingsDetailsItemManager:(id)a3;
- (void)setCellToItemMap:(id)a3;
- (void)setModuleToModuleControllerMap:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUAirPlaySettingsDetailsViewController

- (HUAirPlaySettingsDetailsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v5 = a4;
  v6 = [[HUAirPlaySettingsDetailsItemManager alloc] initWithDelegate:self module:v5];

  [(HUAirPlaySettingsDetailsViewController *)self setAirPlaySettingsDetailsItemManager:v6];
  v7 = [(HUAirPlaySettingsDetailsViewController *)self airPlaySettingsDetailsItemManager];
  v13.receiver = self;
  v13.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  v8 = [(HUItemTableViewController *)&v13 initWithItemManager:v7 tableViewStyle:1];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    cellToItemMap = v8->_cellToItemMap;
    v8->_cellToItemMap = (NSMapTable *)v9;

    v11 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpointSetting_AirPlay_Title", @"HUSiriEndpointSetting_AirPlay_Title", 1);
    [(HUAirPlaySettingsDetailsViewController *)v8 setTitle:v11];

    [(HUItemTableViewController *)v8 setAutomaticallyUpdatesViewControllerTitle:0];
  }
  return v8;
}

- (id)itemModuleControllers
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v38.receiver = self;
  v38.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  v4 = [(HUItemTableViewController *)&v38 itemModuleControllers];
  [v3 unionSet:v4];

  id v5 = [(HUAirPlaySettingsDetailsViewController *)self airPlaySettingsDetailsItemManager];
  v6 = [v5 homeKitAccessorySettingsModules];

  if (v6)
  {
    v33 = v3;
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v31 = [(HUAirPlaySettingsDetailsViewController *)self airPlaySettingsDetailsItemManager];
      v32 = [v31 homeKitAccessorySettingsModules];
      *(_DWORD *)buf = 138412290;
      v40 = v32;
      _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "Creating Item Module Controllers from  homeKitAccessorySettingsModules = [%@]", buf, 0xCu);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v8 = [(HUAirPlaySettingsDetailsViewController *)self airPlaySettingsDetailsItemManager];
    uint64_t v9 = [v8 homeKitAccessorySettingsModules];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
          objc_opt_class();
          id v15 = v14;
          if (objc_opt_isKindOfClass()) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          if (v17)
          {
            v18 = [(HUAirPlaySettingsDetailsViewController *)self moduleToModuleControllerMap];
            v19 = [v18 objectForKey:v17];

            if (!v19)
            {
              v20 = [[HUHomeKitAccessorySettingsItemModuleController alloc] initWithModule:v17 delegate:self];
              v21 = [(HUAirPlaySettingsDetailsViewController *)self moduleToModuleControllerMap];

              if (!v21)
              {
                v22 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                [(HUAirPlaySettingsDetailsViewController *)self setModuleToModuleControllerMap:v22];
              }
              v23 = HFLogForCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v20;
                __int16 v41 = 2112;
                id v42 = v17;
                _os_log_debug_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEBUG, "Setting moduleController = [%@] for Module = [%@] in moduleToModuleControllerMap", buf, 0x16u);
              }

              v24 = [(HUAirPlaySettingsDetailsViewController *)self moduleToModuleControllerMap];
              [v24 setObject:v20 forKey:v17];
            }
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v11);
    }

    v25 = [(HUAirPlaySettingsDetailsViewController *)self moduleToModuleControllerMap];
    v26 = [v25 objectEnumerator];

    uint64_t v27 = [v26 nextObject];
    v3 = v33;
    if (v27)
    {
      v28 = (void *)v27;
      do
      {
        objc_msgSend(v33, "na_safeAddObject:", v28);
        uint64_t v29 = [v26 nextObject];

        v28 = (void *)v29;
      }
      while (v29);
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
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  id v17 = [v16 settingDict];
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
  v29.receiver = self;
  v29.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  [(HUItemTableViewController *)&v29 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
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
    v22 = [v14 settingKeyPath];
    int v23 = [v22 isEqualToString:*MEMORY[0x1E4F68028]];

    if (!v23)
    {
LABEL_18:

      goto LABEL_19;
    }
    v24 = [v17 detailTextLabel];
    [v24 setText:0];
LABEL_16:

    goto LABEL_18;
  }
  if (v20)
  {
    v25 = [v14 settingDict];
    uint64_t v26 = [v14 settingKeyPath];
    id v21 = [v25 objectForKeyedSubscript:v26];

    uint64_t v27 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68400]];
    LOBYTE(v26) = [v27 BOOLValue];

    if ((v26 & 1) == 0)
    {
      [v20 setValueText:0];
      goto LABEL_18;
    }
    v24 = [v12 latestResults];
    v28 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v20 setValueText:v28];

    goto LABEL_16;
  }
LABEL_19:
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(HUAirPlaySettingsDetailsViewController *)self tableView];
  id v9 = [v8 indexPathForCell:v7];

  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 displayedItemAtIndexPath:v9];

  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  id v15 = [(HUAirPlaySettingsDetailsViewController *)self airPlaySettingsDetailsItemManager];
  id v16 = [NSNumber numberWithBool:v4];
  id v17 = [v15 updateSettingItem:v14 withValue:v16];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke;
  v28[3] = &unk_1E6389DD8;
  id v29 = v7;
  BOOL v31 = v4;
  id v18 = v12;
  id v30 = v18;
  id v19 = v7;
  id v20 = (id)[v17 addFailureBlock:v28];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke_17;
  v23[3] = &unk_1E6389730;
  BOOL v27 = v4;
  id v24 = v18;
  v25 = self;
  SEL v26 = a2;
  id v21 = v18;
  id v22 = (id)[v17 addSuccessBlock:v23];
}

void __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
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

void __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke_17(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 56);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Setting [%@] Successfully updated with value %{BOOL}d.", (uint8_t *)&v7, 0x12u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) airPlaySettingsDetailsItemManager];
  id v6 = (id)[v5 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v30 tableView:v7 didSelectRowAtIndexPath:v6];
  uint64_t v8 = [(HUItemTableViewController *)self itemManager];
  __int16 v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  int v10 = [v7 cellForRowAtIndexPath:v6];
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "User tapped item [%@]", buf, 0xCu);
  }

  objc_opt_class();
  id v14 = v9;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  id v17 = [v16 settingKeyPath];
  id v18 = [v16 settingDict];
  id v19 = [v18 objectForKeyedSubscript:v17];

  if (!v12)
  {
    id v20 = (void *)MEMORY[0x1E4F68CB8];
    id v21 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68CB8]];

    if (v21)
    {
      id v22 = [v19 objectForKeyedSubscript:*v20];
      int v23 = NSClassFromString(v22);

      id v24 = [v23 alloc];
      v25 = [(HUAirPlaySettingsDetailsViewController *)self airPlaySettingsDetailsItemManager];
      SEL v26 = [v25 module];
      BOOL v27 = (void *)[v24 initWithAccessorySettingItem:v14 module:v26];

      v28 = [(HUAirPlaySettingsDetailsViewController *)self navigationController];
      id v29 = (id)objc_msgSend(v28, "hu_pushPreloadableViewController:animated:", v27, 1);
    }
  }
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setCellToItemMap:(id)a3
{
}

- (HUAirPlaySettingsDetailsItemManager)airPlaySettingsDetailsItemManager
{
  return self->_airPlaySettingsDetailsItemManager;
}

- (void)setAirPlaySettingsDetailsItemManager:(id)a3
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
  objc_storeStrong((id *)&self->_airPlaySettingsDetailsItemManager, 0);

  objc_storeStrong((id *)&self->_cellToItemMap, 0);
}

@end