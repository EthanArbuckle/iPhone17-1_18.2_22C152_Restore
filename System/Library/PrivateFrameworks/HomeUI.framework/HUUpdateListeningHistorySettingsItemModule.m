@interface HUUpdateListeningHistorySettingsItemModule
+ (id)_ulhDeviceItemComparator;
- (HFItemProvider)mediaDeviceItemProvider;
- (HFItemProvider)otherDeviceItemProvider;
- (HMHome)home;
- (HMUser)user;
- (HUUpdateListeningHistorySettingsItemModule)initWithItemUpdater:(id)a3;
- (HUUpdateListeningHistorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 user:(id)a5;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)setUpdateListeningHistorySetting:(BOOL)a3 forItem:(id)a4;
- (void)_buildItemProviders;
- (void)setMediaDeviceItemProvider:(id)a3;
- (void)setOtherDeviceItemProvider:(id)a3;
@end

@implementation HUUpdateListeningHistorySettingsItemModule

- (HUUpdateListeningHistorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 user:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUUpdateListeningHistorySettingsItemModule.m", 35, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HUUpdateListeningHistorySettingsItemModule.m", 36, @"Invalid parameter not satisfying: %@", @"user != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUUpdateListeningHistorySettingsItemModule;
  v13 = [(HFItemModule *)&v18 initWithItemUpdater:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_user, a5);
    [(HUUpdateListeningHistorySettingsItemModule *)v14 _buildItemProviders];
  }

  return v14;
}

- (HUUpdateListeningHistorySettingsItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUpdateListeningHistorySettingsItemModule.m", 49, @"%s is unavailable; use %@ instead",
    "-[HUUpdateListeningHistorySettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(HUUpdateListeningHistorySettingsItemModule *)self mediaDeviceItemProvider];
  v5 = [(HUUpdateListeningHistorySettingsItemModule *)self otherDeviceItemProvider];
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29 = objc_opt_new();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUUpdateListeningHistoryDeviceItemSectionIdentifier"];
  v6 = objc_opt_new();
  v7 = [(HUUpdateListeningHistorySettingsItemModule *)self mediaDeviceItemProvider];
  v8 = [v7 items];
  id v9 = [v8 allObjects];
  objc_msgSend(v6, "na_safeAddObjectsFromArray:", v9);

  id v10 = [(HUUpdateListeningHistorySettingsItemModule *)self otherDeviceItemProvider];
  id v11 = [v10 items];
  v12 = [v11 allObjects];
  objc_msgSend(v6, "na_safeAddObjectsFromArray:", v12);

  v13 = _HULocalizedStringWithDefaultValue(@"HUUpdateListeningHistoryDeviceSectionTitle", @"HUUpdateListeningHistoryDeviceSectionTitle", 1);
  [v5 setHeaderTitle:v13];

  v14 = HFLocalizedString();
  v15 = HFLocalizedString();
  id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
  v17 = [v14 stringByAppendingString:@" "];
  objc_super v18 = (void *)[v16 initWithString:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v32 = *MEMORY[0x1E4F42530];
  v20 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
  v33[0] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  v22 = (void *)[v19 initWithString:v15 attributes:v21];
  [v18 appendAttributedString:v22];

  [v5 setAttributedFooterTitle:v18];
  v23 = (void *)[v6 copy];
  v24 = [(id)objc_opt_class() _ulhDeviceItemComparator];
  v25 = [v23 sortedArrayUsingComparator:v24];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78__HUUpdateListeningHistorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v30[3] = &unk_1E6386108;
  id v31 = v4;
  id v26 = v4;
  v27 = objc_msgSend(v25, "na_filter:", v30);
  [v5 setItems:v27];

  [v29 addObject:v5];

  return v29;
}

uint64_t __78__HUUpdateListeningHistorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)setUpdateListeningHistorySetting:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(HUUpdateListeningHistorySettingsItemModule *)self user];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v41 = v4;
    *(_WORD *)&v41[4] = 2112;
    *(void *)&v41[6] = v6;
    __int16 v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "setUpdateListeningHistorySetting enable? %{BOOL}d for item %@ user %@", buf, 0x1Cu);
  }
  objc_opt_class();
  id v9 = [v6 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  v12 = [v6 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  v15 = [(HUUpdateListeningHistorySettingsItemModule *)self user];
  id v16 = [(HUUpdateListeningHistorySettingsItemModule *)self home];
  v17 = [v15 userListeningHistoryUpdateControlForHome:v16];

  objc_super v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v17 accessories];
    *(_DWORD *)buf = 138412290;
    *(void *)v41 = v19;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "updateListeningHistoryUpdateControl accessories %@", buf, 0xCu);
  }
  v20 = (void *)[v17 mutableCopy];
  if (v14)
  {
    v21 = [v14 accessory];
    if (v4) {
      [v20 addAccessory:v21];
    }
    else {
      [v20 removeAccessory:v21];
    }
LABEL_27:

    v27 = (void *)MEMORY[0x1E4F7A0D8];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke;
    v32[3] = &unk_1E6385D90;
    id v33 = v20;
    v34 = self;
    v28 = [v27 futureWithBlock:v32];

    goto LABEL_28;
  }
  if (v11)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v21 = [v11 accessories];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      id v31 = v11;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          if (v4) {
            [v20 addAccessory:v26];
          }
          else {
            [v20 removeAccessory:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v23);
      id v11 = v31;
    }
    goto LABEL_27;
  }
  v30 = HFLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "Unable to find accessory to update user listening history setting", buf, 2u);
  }

  v28 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_28:

  return v28;
}

void __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) home];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Updating user listening history setting %@ for home %@", buf, 0x16u);
  }
  v7 = [*(id *)(a1 + 40) user];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) home];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke_42;
  v13[3] = &unk_1E638C140;
  id v14 = v3;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  id v12 = v3;
  [v7 updateUserListeningHistoryUpdateControl:v8 forHome:v9 completionHandler:v13];
}

void __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to update user listening history setting with error : %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 40);
      v7 = [*(id *)(a1 + 48) home];
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated user listening history setting %@ for home %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

+ (id)_ulhDeviceItemComparator
{
  return &__block_literal_global_47_1;
}

uint64_t __70__HUUpdateListeningHistorySettingsItemModule__ulhDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (void *)MEMORY[0x1E4F69220];
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 defaultItemComparator];
  uint64_t v8 = ((uint64_t (**)(void, id, id))v7)[2](v7, v6, v5);

  return v8;
}

- (void)_buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F69288]);
  BOOL v4 = [(HUUpdateListeningHistorySettingsItemModule *)self home];
  id v5 = (void *)[v3 initWithHome:v4];

  id v6 = [(HUUpdateListeningHistorySettingsItemModule *)self user];
  v7 = [(HUUpdateListeningHistorySettingsItemModule *)self home];
  uint64_t v8 = [v6 userListeningHistoryUpdateControlForHome:v7];

  [v5 setFilter:&__block_literal_global_52_1];
  id v9 = objc_alloc(MEMORY[0x1E4F696B0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_3;
  v23[3] = &unk_1E638DB80;
  id v10 = v8;
  id v24 = v10;
  uint64_t v11 = (void *)[v9 initWithSourceProvider:v5 transformationBlock:v23];
  [(HUUpdateListeningHistorySettingsItemModule *)self setMediaDeviceItemProvider:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F68E20]);
  v13 = [(HUUpdateListeningHistorySettingsItemModule *)self home];
  id v14 = (void *)[v12 initWithHome:v13];

  [v14 setFilter:&__block_literal_global_326];
  id v15 = objc_alloc(MEMORY[0x1E4F696B0]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_8;
  uint64_t v21 = &unk_1E6387890;
  id v22 = v10;
  id v16 = v10;
  v17 = (void *)[v15 initWithSourceProvider:v14 transformationBlock:&v18];
  -[HUUpdateListeningHistorySettingsItemModule setOtherDeviceItemProvider:](self, "setOtherDeviceItemProvider:", v17, v18, v19, v20, v21);
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1AD86A8]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 accessories];
    uint64_t v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_302);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = objc_msgSend(v2, "hf_supportsUserLevelUpdateListeningHistorySetting");
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsUserLevelUpdateListeningHistorySetting");
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_4;
  v8[3] = &unk_1E638B630;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = (void *)[v4 initWithSourceItem:v5 transformationBlock:v8];

  return v6;
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;

  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = &unk_1F1A3D2C0;
  if ([v7 conformsToProtocol:v8]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 accessories];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_5;
  v14[3] = &unk_1E63869C8;
  id v15 = *(id *)(a1 + 40);
  objc_msgSend(v11, "na_all:", v14);

  id v12 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];

  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_6;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uniqueIdentifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [v3 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  uint64_t v8 = [v5 isEqualToString:v7];

  return v8;
}

void *__65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = objc_msgSend(v5, "hf_siriEndpointProfile");
  if (v6)
  {
    id v7 = objc_msgSend(v5, "hf_primaryService");

    if (v7)
    {
      uint64_t v6 = objc_msgSend(v5, "hf_supportsUserLevelUpdateListeningHistorySetting");
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v6 = 0;
  }
LABEL_9:

  return v6;
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_9;
  v8[3] = &unk_1E638B630;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = (void *)[v4 initWithSourceItem:v5 transformationBlock:v8];

  return v6;
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v6 = v5;

  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = &unk_1F1A3D2C0;
  if ([v7 conformsToProtocol:v8]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 accessories];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_10;
  v14[3] = &unk_1E63869C8;
  id v15 = *(id *)(a1 + 40);
  objc_msgSend(v11, "na_all:", v14);

  id v12 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];

  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_11;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uniqueIdentifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [v3 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  uint64_t v8 = [v5 isEqualToString:v7];

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (HFItemProvider)mediaDeviceItemProvider
{
  return self->_mediaDeviceItemProvider;
}

- (void)setMediaDeviceItemProvider:(id)a3
{
}

- (HFItemProvider)otherDeviceItemProvider
{
  return self->_otherDeviceItemProvider;
}

- (void)setOtherDeviceItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end