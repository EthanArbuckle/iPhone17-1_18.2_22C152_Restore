@interface HURestrictedGuestAccessSettingsModule
+ (id)_userItemComparator;
- (HFTransformItemProvider)transformedUserItemProvider;
- (HMAccessory)accessoryToAdd;
- (HMHome)home;
- (HURestrictedGuestAccessSettingsModule)initWithItemUpdater:(id)a3;
- (HURestrictedGuestAccessSettingsModule)initWithItemUpdater:(id)a3 home:(id)a4 accessoryToAdd:(id)a5;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)enableRestrictedGuestAccessSetting:(BOOL)a3 forItem:(id)a4;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setTransformedUserItemProvider:(id)a3;
@end

@implementation HURestrictedGuestAccessSettingsModule

- (HURestrictedGuestAccessSettingsModule)initWithItemUpdater:(id)a3 home:(id)a4 accessoryToAdd:(id)a5
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
    [v16 handleFailureInMethod:a2, self, @"HURestrictedGuestAccessSettingsModule.m", 26, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HURestrictedGuestAccessSettingsModule.m", 27, @"Invalid parameter not satisfying: %@", @"accessoryToAdd != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HURestrictedGuestAccessSettingsModule;
  v13 = [(HFItemModule *)&v18 initWithItemUpdater:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_accessoryToAdd, a5);
    [(HURestrictedGuestAccessSettingsModule *)v14 _buildItemProviders];
  }

  return v14;
}

- (HURestrictedGuestAccessSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HURestrictedGuestAccessSettingsModule.m", 40, @"%s is unavailable; use %@ instead",
    "-[HURestrictedGuestAccessSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HURestrictedGuestAccessSettingsModule *)self transformedUserItemProvider];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(HURestrictedGuestAccessSettingsModule *)self transformedUserItemProvider];
  v7 = [v6 items];
  int v8 = [v7 intersectsSet:v4];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HURestrictedGuestAccessSettingsUserItemSectionIdentifier"];
    id v10 = [(HURestrictedGuestAccessSettingsModule *)self transformedUserItemProvider];
    id v11 = [v10 items];
    v12 = [v11 allObjects];
    v13 = [(id)objc_opt_class() _userItemComparator];
    v14 = [v12 sortedArrayUsingComparator:v13];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__HURestrictedGuestAccessSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
    v17[3] = &unk_1E6386108;
    id v18 = v4;
    v15 = objc_msgSend(v14, "na_filter:", v17);
    [v9 setItems:v15];

    [v5 addObject:v9];
  }

  return v5;
}

uint64_t __73__HURestrictedGuestAccessSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)enableRestrictedGuestAccessSetting:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v43 = self;
    __int16 v44 = 2112;
    v45 = v9;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Inside enableRestrictedGuestAccessSetting...", buf, 0x16u);
  }
  id v10 = [(HURestrictedGuestAccessSettingsModule *)self home];
  id v11 = [v7 user];

  v12 = [v10 homeAccessControlForUser:v11];
  id v13 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v14 = [v12 restrictedGuestAccessSettings];
  v15 = [v14 accessAllowedToAccessories];
  v16 = (void *)[v13 initWithSet:v15];

  v17 = [(HURestrictedGuestAccessSettingsModule *)self accessoryToAdd];
  int v18 = objc_msgSend(v16, "na_safeContainsObject:", v17);

  if (v4)
  {
    if (v18) {
      goto LABEL_9;
    }
    v19 = [(HURestrictedGuestAccessSettingsModule *)self accessoryToAdd];
    objc_msgSend(v16, "na_safeAddObject:", v19);
  }
  else
  {
    if (!v18) {
      goto LABEL_9;
    }
    v19 = [(HURestrictedGuestAccessSettingsModule *)self accessoryToAdd];
    [v16 removeObject:v19];
  }

LABEL_9:
  v20 = [v12 restrictedGuestAccessSettings];
  v21 = (void *)[v20 mutableCopy];

  [v21 setAccessAllowedToAccessories:v16];
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v43 = self;
    __int16 v44 = 2112;
    v45 = v23;
    __int16 v46 = 2112;
    v47 = v16;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating allowed accessories to: %@", buf, 0x20u);
  }
  v24 = (void *)MEMORY[0x1E4F7A0D8];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke;
  v39[3] = &unk_1E6385D90;
  id v40 = v12;
  id v41 = v21;
  id v25 = v21;
  id v26 = v12;
  v27 = [v24 futureWithBlock:v39];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_26;
  v36[3] = &unk_1E63859F8;
  id v28 = v11;
  id v37 = v28;
  id v38 = v10;
  id v29 = v10;
  id v30 = (id)[v27 addSuccessBlock:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_33;
  v34[3] = &unk_1E6386708;
  id v35 = v28;
  id v31 = v28;
  id v32 = (id)[v27 addFailureBlock:v34];

  return v27;
}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6386708;
  id v8 = v3;
  id v6 = v3;
  [v5 updateRestrictedGuestSettings:v4 completionHandler:v7];
}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[HURestrictedGuestAccessSettingsModule enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  if (v3) {
    [v5 finishWithError:v3];
  }
  else {
    [v5 finishWithNoResult];
  }
}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_26(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v9 = "-[HURestrictedGuestAccessSettingsModule enableRestrictedGuestAccessSetting:forItem:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories for %@", buf, 0x16u);
  }

  uint64_t v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_28;
  v5[3] = &unk_1E6387408;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v5 sender:0];
}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_33(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[HURestrictedGuestAccessSettingsModule enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories for %@ with error: %@.", (uint8_t *)&v6, 0x20u);
  }
}

+ (id)_userItemComparator
{
  return &__block_literal_global_99;
}

uint64_t __60__HURestrictedGuestAccessSettingsModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68C78];
  __int16 v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  uint64_t v9 = [v5 latestResults];
  __int16 v10 = [v9 objectForKeyedSubscript:v7];

  if ([v8 type] || !objc_msgSend(v10, "type"))
  {
    if ([v8 type] && !objc_msgSend(v10, "type"))
    {
      uint64_t v12 = 1;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
      uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v4, v5);
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)_buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F69718]);
  id v4 = [(HURestrictedGuestAccessSettingsModule *)self home];
  id v5 = (void *)[v3 initWithHome:v4];

  [v5 setIncludeGuestUsers:1];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke;
  v10[3] = &unk_1E63862F8;
  objc_copyWeak(&v11, &location);
  [v5 setFilter:v10];
  id v6 = objc_alloc(MEMORY[0x1E4F696B0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_2;
  v8[3] = &unk_1E638A408;
  objc_copyWeak(&v9, &location);
  uint64_t v7 = (void *)[v6 initWithSourceProvider:v5 transformationBlock:v8];
  [(HURestrictedGuestAccessSettingsModule *)self setTransformedUserItemProvider:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  __int16 v8 = [WeakRetained home];
  uint64_t v9 = objc_msgSend(v8, "hf_userIsRestrictedGuest:", v7);

  return v9;
}

id __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_alloc(MEMORY[0x1E4F696A8]);
  id v7 = (void *)[v3 copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_3;
  v11[3] = &unk_1E6387EF8;
  objc_copyWeak(&v13, v4);
  id v8 = v3;
  id v12 = v8;
  uint64_t v9 = (void *)[v6 initWithSourceItem:v7 transformationBlock:v11];

  objc_destroyWeak(&v13);

  return v9;
}

id __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[v4 mutableCopy];

  objc_opt_class();
  id v7 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  __int16 v10 = [WeakRetained home];
  id v11 = [v9 user];
  id v12 = [v10 homeAccessControlForUser:v11];

  id v13 = [v12 restrictedGuestAccessSettings];
  v14 = [v13 accessAllowedToAccessories];
  v15 = [WeakRetained accessoryToAdd];
  objc_msgSend(v14, "na_safeContainsObject:", v15);

  v16 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HMAccessory)accessoryToAdd
{
  return self->_accessoryToAdd;
}

- (HFTransformItemProvider)transformedUserItemProvider
{
  return self->_transformedUserItemProvider;
}

- (void)setTransformedUserItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformedUserItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryToAdd, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end