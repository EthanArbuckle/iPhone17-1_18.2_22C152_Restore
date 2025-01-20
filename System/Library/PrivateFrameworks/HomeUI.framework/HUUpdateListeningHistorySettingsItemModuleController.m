@interface HUUpdateListeningHistorySettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUUpdateListeningHistorySettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  v4 = objc_opt_class();

  return (Class)v4;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUUpdateListeningHistorySettingsItemModuleController;
  [(HUItemModuleController *)&v10 setupCell:v6 forItem:a4];
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
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HUUpdateListeningHistorySettingsItemModuleController;
  [(HUItemModuleController *)&v37 updateCell:v8 forItem:v9 animated:v5];
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

    objc_opt_class();
    v16 = [v15 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    id v19 = v18;
    if ([v19 conformsToProtocol:&unk_1F1A3D558]) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    objc_opt_class();
    v22 = [(HUItemModuleController *)self module];
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    v25 = [v24 user];
    v26 = [v24 home];
    v27 = [v25 userListeningHistoryUpdateControlForHome:v26];

    v28 = [v21 accessories];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke;
    v35[3] = &unk_1E63869C8;
    id v29 = v27;
    id v36 = v29;
    uint64_t v30 = objc_msgSend(v28, "na_all:", v35);

    v31 = [v15 sourceItem];
    if ([v31 conformsToProtocol:&unk_1F1A3D2C0]) {
      v32 = v31;
    }
    else {
      v32 = 0;
    }
    id v33 = v32;

    if (v33)
    {
      [v12 setOn:v30];
      [v12 setIconDisplayStyle:1];
      v34 = +[HUIconCellContentMetrics compactMetrics];
      [v12 setContentMetrics:v34];
    }
  }
}

uint64_t __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) accessories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke_2;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 uniqueIdentifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [v3 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  uint64_t v8 = [v5 isEqualToString:v7];

  return v8;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 item];
    *(_DWORD *)buf = 67109378;
    BOOL v26 = v4;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "User tapped on switch to enable ULH? %{BOOL}d for item: %@", buf, 0x12u);
  }
  objc_opt_class();
  id v9 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  id v12 = [v6 item];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = [v14 sourceItem];
  if (objc_opt_isKindOfClass()) {
    unint64_t v16 = (unint64_t)v15;
  }
  else {
    unint64_t v16 = 0;
  }

  objc_opt_class();
  v17 = [v14 sourceItem];

  if (objc_opt_isKindOfClass()) {
    unint64_t v18 = (unint64_t)v17;
  }
  else {
    unint64_t v18 = 0;
  }

  if (v16 | v18)
  {
    id v19 = [v6 item];
    v20 = [v11 setUpdateListeningHistorySetting:v4 forItem:v19];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__HUUpdateListeningHistorySettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v22[3] = &unk_1E6385A48;
    id v23 = v6;
    BOOL v24 = v4;
    id v21 = (id)[v20 addCompletionBlock:v22];
  }
}

void __77__HUUpdateListeningHistorySettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Failed to enable update listening history setting with error: %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
  }
}

@end