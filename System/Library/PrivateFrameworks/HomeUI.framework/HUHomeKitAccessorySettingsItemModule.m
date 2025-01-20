@interface HUHomeKitAccessorySettingsItemModule
- (BOOL)isCollapsed;
- (HFAccessorySettingsManagerProtocol)accessorySettingsManager;
- (HFHomeKitAccessorySettingsItemProvider)accessorySettingsItemProvider;
- (HFServiceLikeItem)sourceItem;
- (HMAccessorySettingsController)settingsController;
- (HMHome)home;
- (HUHomeKitAccessorySettingsItemModule)initWithSettingsController:(id)a3 itemUpdater:(id)a4 home:(id)a5 sourceItem:(id)a6 settingGroupKeyPath:(id)a7 isCollapsed:(BOOL)a8;
- (NSString)settingGroupKeyPath;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setAccessorySettingsItemProvider:(id)a3;
- (void)setAccessorySettingsManager:(id)a3;
- (void)setHome:(id)a3;
- (void)setIsCollapsed:(BOOL)a3;
- (void)setSettingGroupKeyPath:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setSourceItem:(id)a3;
@end

@implementation HUHomeKitAccessorySettingsItemModule

- (HUHomeKitAccessorySettingsItemModule)initWithSettingsController:(id)a3 itemUpdater:(id)a4 home:(id)a5 sourceItem:(id)a6 settingGroupKeyPath:(id)a7 isCollapsed:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HUHomeKitAccessorySettingsItemModule.m", 42, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"HUHomeKitAccessorySettingsItemModule.m", 43, @"Invalid parameter not satisfying: %@", @"sourceItem" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HUHomeKitAccessorySettingsItemModule;
  v19 = [(HFItemModule *)&v26 initWithItemUpdater:v15];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_settingsController, a3);
    objc_storeStrong((id *)&v20->_home, a5);
    objc_storeStrong((id *)&v20->_sourceItem, a6);
    objc_storeStrong((id *)&v20->_settingGroupKeyPath, a7);
    v20->_isCollapsed = a8;
    [(HUHomeKitAccessorySettingsItemModule *)v20 _buildItemProviders];
  }

  return v20;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUHomeKitAccessorySettingsItemModule *)self accessorySettingsItemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v44 = (id)objc_opt_new();
  v5 = NSString;
  v6 = [(HUHomeKitAccessorySettingsItemModule *)self settingGroupKeyPath];
  uint64_t v7 = [v5 stringWithFormat:@"%@", v6];

  v43 = (void *)v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v7];
  v9 = [(HUHomeKitAccessorySettingsItemModule *)self accessorySettingsItemProvider];
  v10 = [v9 items];
  v11 = [v10 allObjects];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __72__HUHomeKitAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v45[3] = &unk_1E6386108;
  id v42 = v4;
  id v46 = v42;
  v12 = objc_msgSend(v11, "na_filter:", v45);
  [v8 setItems:v12];

  v13 = [v8 items];
  id v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_21];
  [v8 setItems:v14];

  id v15 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  id v16 = [(HUHomeKitAccessorySettingsItemModule *)self settingGroupKeyPath];
  id v17 = [v15 objectForKey:v16];

  id v18 = (void *)MEMORY[0x1E4F68730];
  uint64_t v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68730]];
  if (!v19
    || (v20 = (void *)v19,
        [v17 objectForKeyedSubscript:*v18],
        v21 = objc_claimAutoreleasedReturnValue(),
        HFLocalizedString(),
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        !v22))
  {
    BOOL v23 = [(HUHomeKitAccessorySettingsItemModule *)self isCollapsed];
    v24 = (void *)MEMORY[0x1E4F683A0];
    if (!v23) {
      v24 = (void *)MEMORY[0x1E4F68460];
    }
    v25 = [v17 objectForKeyedSubscript:*v24];
    v22 = [v25 objectForKeyedSubscript:*v18];
  }
  if (v22) {
    objc_super v26 = v22;
  }
  else {
    objc_super v26 = &stru_1F18F92B8;
  }
  [v8 setHeaderTitle:v26];
  v27 = (void *)MEMORY[0x1E4F68470];
  v28 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68470]];
  if (v28) {
    goto LABEL_13;
  }
  BOOL v29 = [(HUHomeKitAccessorySettingsItemModule *)self isCollapsed];
  v30 = (void *)MEMORY[0x1E4F683A0];
  if (!v29) {
    v30 = (void *)MEMORY[0x1E4F68460];
  }
  v31 = [v17 objectForKeyedSubscript:*v30];
  v28 = [v31 objectForKeyedSubscript:*v27];

  if (v28)
  {
LABEL_13:
    v32 = [MEMORY[0x1E4F68E60] defaultFactory];
    v33 = [v32 formatterForKey:v28];
  }
  else
  {
    v33 = 0;
  }
  v34 = [(HUHomeKitAccessorySettingsItemModule *)self sourceItem];
  v35 = [v33 attributedStringForObjectValue:v34 withDefaultAttributes:0];

  if (v35)
  {
    [v8 setAttributedFooterTitle:v35];
  }
  else
  {
    v36 = [(HUHomeKitAccessorySettingsItemModule *)self sourceItem];
    v37 = [v33 stringForObjectValue:v36];
    [v8 setFooterTitle:v37];
  }
  if ([v11 count]) {
    [v44 addObject:v8];
  }
  v38 = HFLogForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v41 = [(HUHomeKitAccessorySettingsItemModule *)self settingGroupKeyPath];
    *(_DWORD *)buf = 138412546;
    id v48 = v44;
    __int16 v49 = 2112;
    v50 = v41;
    _os_log_debug_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEBUG, "Built sections [%@] for settingGroupKeyPath = [%@]", buf, 0x16u);
  }
  id v39 = v44;

  return v39;
}

uint64_t __72__HUHomeKitAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __72__HUHomeKitAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  unint64_t v12 = [v8 displayIndex];
  if (v12 > [v11 displayIndex]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }

  return v13;
}

- (void)_buildItemProviders
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  id v4 = [(HUHomeKitAccessorySettingsItemModule *)self settingGroupKeyPath];
  id v5 = [v3 objectForKey:v4];

  BOOL v6 = [(HUHomeKitAccessorySettingsItemModule *)self isCollapsed];
  uint64_t v7 = (void *)MEMORY[0x1E4F683A0];
  if (!v6) {
    uint64_t v7 = (void *)MEMORY[0x1E4F68460];
  }
  id v8 = [v5 objectForKeyedSubscript:*v7];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68CC0]];
  id v10 = objc_alloc(MEMORY[0x1E4F69198]);
  id v11 = [(HUHomeKitAccessorySettingsItemModule *)self settingsController];
  unint64_t v12 = [(HUHomeKitAccessorySettingsItemModule *)self sourceItem];
  uint64_t v13 = [(HUHomeKitAccessorySettingsItemModule *)self settingGroupKeyPath];
  id v14 = (void *)[v10 initWithSettingsController:v11 sourceItem:v12 settingGroupKeyPath:v13 moduleSettings:v9 usageOptions:0];
  [(HUHomeKitAccessorySettingsItemModule *)self setAccessorySettingsItemProvider:v14];

  id v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(HUHomeKitAccessorySettingsItemModule *)self accessorySettingsItemProvider];
    id v17 = [(HUHomeKitAccessorySettingsItemModule *)self settingGroupKeyPath];
    int v18 = 138412546;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_debug_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEBUG, "Built accessorySettingsItemProvider [%@] for settingGroupKeyPath = [%@]", (uint8_t *)&v18, 0x16u);
  }
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (NSString)settingGroupKeyPath
{
  return self->_settingGroupKeyPath;
}

- (void)setSettingGroupKeyPath:(id)a3
{
}

- (BOOL)isCollapsed
{
  return self->_isCollapsed;
}

- (void)setIsCollapsed:(BOOL)a3
{
  self->_isCollapsed = a3;
}

- (HFHomeKitAccessorySettingsItemProvider)accessorySettingsItemProvider
{
  return self->_accessorySettingsItemProvider;
}

- (void)setAccessorySettingsItemProvider:(id)a3
{
}

- (HFAccessorySettingsManagerProtocol)accessorySettingsManager
{
  return self->_accessorySettingsManager;
}

- (void)setAccessorySettingsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingsManager, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_settingGroupKeyPath, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end