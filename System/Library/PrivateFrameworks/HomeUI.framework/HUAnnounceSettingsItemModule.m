@interface HUAnnounceSettingsItemModule
+ (id)_announceDeviceItemComparator;
+ (id)_userItemComparator;
- (HFItemProvider)announceDeviceItemProvider;
- (HFItemProvider)announceOtherDeviceItemProvider;
- (HFUserItemProvider)userItemProvider;
- (HMHome)home;
- (HUAnnounceNotificationSettingsItemProvider)notificationSettingsItemProvider;
- (HUAnnounceSettingsItemModule)initWithItemUpdater:(id)a3;
- (HUAnnounceSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 settingsContext:(unint64_t)a5;
- (id)_updateNotificationSettings:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)enableAnnounceSetting:(BOOL)a3 forItem:(id)a4;
- (id)enablePermissionSetting:(BOOL)a3 forItem:(id)a4;
- (id)itemProviders;
- (id)updateNotificationSettings:(id)a3;
- (unint64_t)settingsContext;
- (void)_buildItemProviders;
- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5;
- (void)setAnnounceDeviceItemProvider:(id)a3;
- (void)setAnnounceOtherDeviceItemProvider:(id)a3;
- (void)setNotificationSettingsItemProvider:(id)a3;
- (void)setUserItemProvider:(id)a3;
@end

@implementation HUAnnounceSettingsItemModule

- (HUAnnounceSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 settingsContext:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUAnnounceSettingsItemModule.m", 38, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HUAnnounceSettingsItemModule;
  v11 = [(HFItemModule *)&v15 initWithItemUpdater:v9];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    v12->_settingsContext = a5;
    [(HUAnnounceSettingsItemModule *)v12 _buildItemProviders];
  }

  return v12;
}

- (HUAnnounceSettingsItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAnnounceSettingsItemModule.m", 51, @"%s is unavailable; use %@ instead",
    "-[HUAnnounceSettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(HUAnnounceSettingsItemModule *)self notificationSettingsItemProvider];
  v5 = [(HUAnnounceSettingsItemModule *)self announceDeviceItemProvider];
  v6 = [(HUAnnounceSettingsItemModule *)self announceOtherDeviceItemProvider];
  v7 = [(HUAnnounceSettingsItemModule *)self userItemProvider];
  v8 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, 0);

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  if ([(HUAnnounceSettingsItemModule *)self settingsContext] != 3)
  {
    v6 = [(HUAnnounceSettingsItemModule *)self home];
    int v7 = objc_msgSend(v6, "hf_shouldShowAnnounceFeatureForThisHome");

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAnnounceSettingsNotificationSettingsItemSectionIdentifier"];
      if ([(HUAnnounceSettingsItemModule *)self settingsContext] != 2)
      {
        id v9 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsNotificationsSection_Header", @"HUAnnounceSettingsNotificationsSection_Header", 1);
        [v8 setHeaderTitle:v9];
      }
      id v10 = [(HUAnnounceSettingsItemModule *)self notificationSettingsItemProvider];
      v11 = [v10 items];
      v12 = [v11 allObjects];
      v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_183];

      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3;
      v86[3] = &unk_1E6386108;
      id v87 = v4;
      v14 = objc_msgSend(v13, "na_filter:", v86);
      [v8 setItems:v14];

      [v5 addObject:v8];
      [v8 setFooterTitle:0];
      objc_super v15 = [v8 items];
      uint64_t v16 = [v15 count];

      if (v16 == 1)
      {
        objc_opt_class();
        v17 = [v8 items];
        v18 = [v17 firstObject];
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        if (v20 && [v20 notificationMode] == 1)
        {
          v21 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsNotificationsSection_Footer", @"HUAnnounceSettingsNotificationsSection_Footer", 1);
          [v8 setFooterTitle:v21];
        }
      }
    }
  }
  if ([(HUAnnounceSettingsItemModule *)self settingsContext])
  {
    if ([(HUAnnounceSettingsItemModule *)self settingsContext] != 2)
    {
      v22 = [(HUAnnounceSettingsItemModule *)self home];
      int v23 = objc_msgSend(v22, "hf_shouldShowAnnounceFeatureForThisHome");

      if (v23)
      {
        v24 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAnnounceSettingsUserItemSectionIdentifier"];
        if ([(HUAnnounceSettingsItemModule *)self settingsContext] != 3)
        {
          v25 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsUserSection_Header", @"HUAnnounceSettingsUserSection_Header", 1);
          [v24 setHeaderTitle:v25];

          v26 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsUserSection_Footer", @"HUAnnounceSettingsUserSection_Footer", 1);
          [v24 setFooterTitle:v26];
        }
        v27 = [(HUAnnounceSettingsItemModule *)self userItemProvider];
        v28 = [v27 items];
        v29 = [v28 allObjects];
        v30 = [(id)objc_opt_class() _userItemComparator];
        v31 = [v29 sortedArrayUsingComparator:v30];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_4;
        v84[3] = &unk_1E6386108;
        id v85 = v4;
        objc_msgSend(v31, "na_filter:", v84);
        v33 = id v32 = v4;
        [v24 setItems:v33];

        id v4 = v32;
        [v5 addObject:v24];
      }
    }
  }
  if ([(HUAnnounceSettingsItemModule *)self settingsContext] != 2
    && [(HUAnnounceSettingsItemModule *)self settingsContext] != 3)
  {
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUAnnounceSettingsAnnounceDeviceItemSectionIdentifier"];
    v35 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsHomePodSection_Header", @"HUAnnounceSettingsHomePodSection_Header", 1);
    [v34 setHeaderTitle:v35];

    v36 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsHomePodSection_Footer", @"HUAnnounceSettingsHomePodSection_Footer", 1);
    [v34 setFooterTitle:v36];

    v37 = objc_opt_new();
    v38 = [(HUAnnounceSettingsItemModule *)self announceDeviceItemProvider];
    v39 = [v38 items];
    v40 = [v39 allObjects];
    objc_msgSend(v37, "na_safeAddObjectsFromArray:", v40);

    v41 = [(HUAnnounceSettingsItemModule *)self announceOtherDeviceItemProvider];
    v42 = [v41 items];
    v43 = [v42 allObjects];
    objc_msgSend(v37, "na_safeAddObjectsFromArray:", v43);

    v44 = [(HUAnnounceSettingsItemModule *)self announceOtherDeviceItemProvider];
    v45 = [v44 items];
    uint64_t v46 = [v45 count];

    if (v46)
    {
      v47 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsAccessoriesSection_Header", @"HUAnnounceSettingsAccessoriesSection_Header", 1);
      [v34 setHeaderTitle:v47];

      v48 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsAccessoriesSection_Footer", @"HUAnnounceSettingsAccessoriesSection_Footer", 1);
      [v34 setFooterTitle:v48];
    }
    else
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v49 = [(HUAnnounceSettingsItemModule *)self announceDeviceItemProvider];
      v48 = [v49 items];

      uint64_t v50 = [v48 countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        v74 = v37;
        v75 = v34;
        id v76 = v4;
        v77 = v5;
        uint64_t v52 = *(void *)v81;
        while (2)
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v81 != v52) {
              objc_enumerationMutation(v48);
            }
            v54 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            objc_opt_class();
            id v55 = v54;
            if (objc_opt_isKindOfClass()) {
              v56 = v55;
            }
            else {
              v56 = 0;
            }
            id v57 = v56;

            objc_opt_class();
            v58 = [v57 sourceItem];
            if (objc_opt_isKindOfClass()) {
              v59 = v58;
            }
            else {
              v59 = 0;
            }
            id v60 = v59;

            objc_opt_class();
            v61 = [v57 sourceItem];
            if (objc_opt_isKindOfClass()) {
              v62 = v61;
            }
            else {
              v62 = 0;
            }
            id v63 = v62;

            if (v60) {
              v64 = v60;
            }
            else {
              v64 = v63;
            }
            v65 = [v64 accessories];
            v66 = [v65 anyObject];

            if (objc_msgSend(v66, "hf_isSiriEndpoint"))
            {
              v67 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsAccessoriesSection_Header", @"HUAnnounceSettingsAccessoriesSection_Header", 1);
              v34 = v75;
              [v75 setHeaderTitle:v67];

              v68 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettingsAccessoriesSection_Footer", @"HUAnnounceSettingsAccessoriesSection_Footer", 1);
              [v75 setFooterTitle:v68];

              id v4 = v76;
              v5 = v77;
              goto LABEL_46;
            }
          }
          uint64_t v51 = [v48 countByEnumeratingWithState:&v80 objects:v88 count:16];
          if (v51) {
            continue;
          }
          break;
        }
        id v4 = v76;
        v5 = v77;
        v34 = v75;
LABEL_46:
        v37 = v74;
      }
    }

    v69 = (void *)[v37 copy];
    v70 = [(id)objc_opt_class() _announceDeviceItemComparator];
    v71 = [v69 sortedArrayUsingComparator:v70];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_5;
    v78[3] = &unk_1E6386108;
    id v79 = v4;
    v72 = objc_msgSend(v71, "na_filter:", v78);
    [v34 setItems:v72];

    [v5 addObject:v34];
  }

  return v5;
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  int v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  v8 = [v4 latestResults];

  id v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  v18 = v10;
  id v11 = v9;
  v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    objc_super v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    objc_super v15 = v19;
  }

  return v13;
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)updateNotificationSettings:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7
    && ([(HUAnnounceSettingsItemModule *)self notificationSettingsItemProvider],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 items],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 containsObject:v5],
        v9,
        v8,
        v10))
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E668]), "initWithDeviceNotificationMode:", objc_msgSend(v7, "notificationMode"));
    v12 = [(HUAnnounceSettingsItemModule *)self _updateNotificationSettings:v11];
  }
  else
  {
    v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v12;
}

- (id)enablePermissionSetting:(BOOL)a3 forItem:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9
    && ([(HUAnnounceSettingsItemModule *)self userItemProvider],
        int v10 = objc_claimAutoreleasedReturnValue(),
        [v10 items],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 containsObject:v7],
        v11,
        v10,
        v12))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F7A0D8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke;
    v16[3] = &unk_1E63864C8;
    BOOL v19 = a3;
    id v17 = v9;
    v18 = self;
    BOOL v14 = [v13 futureWithBlock:v16];
  }
  else
  {
    BOOL v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v14;
}

void __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) setEnableAnnounce:*(unsigned __int8 *)(a1 + 48)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E638DA20;
  objc_copyWeak(&v10, &location);
  id v5 = v3;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = (id)[v4 addCompletionBlock:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v6)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Failed to update enable announce setting : %@", buf, 0xCu);
    }

    [a1[4] finishWithError:v6];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_59;
    uint64_t v13 = &unk_1E6387408;
    id v14 = WeakRetained;
    id v15 = a1[5];
    [v9 dispatchHomeObserverMessage:&v10 sender:0];

    objc_msgSend(a1[4], "finishWithResult:error:", v5, 0, v10, v11, v12, v13, v14);
  }
}

void __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_59(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 40) user];
    [v5 home:v3 didUpdateAccessControlForUser:v4];
  }
}

- (id)enableAnnounceSetting:(BOOL)a3 forItem:(id)a4
{
  id v5 = [a4 sourceItem];
  id v6 = &unk_1F1A3D2C0;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F7A0D8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke;
    v12[3] = &unk_1E6388DB0;
    id v13 = v8;
    BOOL v14 = a3;
    uint64_t v10 = [v9 futureWithBlock:v12];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

void __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) setEnableAnnounce:*(unsigned __int8 *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E63850B8;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addCompletionBlock:v7];
}

void __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Failed to update enable announce setting : %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  [*(id *)(a1 + 32) finishWithResult:v5 error:v6];
}

+ (id)_announceDeviceItemComparator
{
  return &__block_literal_global_122_2;
}

uint64_t __61__HUAnnounceSettingsItemModule__announceDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F69220];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 defaultItemComparator];
  uint64_t v8 = ((uint64_t (**)(void, id, id))v7)[2](v7, v6, v5);

  return v8;
}

+ (id)_userItemComparator
{
  return &__block_literal_global_125_2;
}

uint64_t __51__HUAnnounceSettingsItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68C78];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  id v9 = [v5 latestResults];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if ([v8 type] || !objc_msgSend(v10, "type"))
  {
    if ([v8 type] && !objc_msgSend(v10, "type"))
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
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
  id v3 = [HUAnnounceNotificationSettingsItemProvider alloc];
  id v4 = [(HUAnnounceSettingsItemModule *)self home];
  id v5 = [(HUAnnounceNotificationSettingsItemProvider *)v3 initWithHome:v4];
  [(HUAnnounceSettingsItemModule *)self setNotificationSettingsItemProvider:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F69288]);
  uint64_t v7 = [(HUAnnounceSettingsItemModule *)self home];
  uint64_t v8 = (void *)[v6 initWithHome:v7];

  [v8 setFilter:&__block_literal_global_130_1];
  id v9 = objc_alloc(MEMORY[0x1E4F696B0]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_3;
  v24[3] = &unk_1E638DB80;
  v24[4] = self;
  uint64_t v10 = (void *)[v9 initWithSourceProvider:v8 transformationBlock:v24];
  [(HUAnnounceSettingsItemModule *)self setAnnounceDeviceItemProvider:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F68E20]);
  uint64_t v12 = [(HUAnnounceSettingsItemModule *)self home];
  id v13 = (void *)[v11 initWithHome:v12];

  [v13 setFilter:&__block_literal_global_347];
  id v14 = objc_alloc(MEMORY[0x1E4F696B0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_6;
  v23[3] = &unk_1E6387890;
  v23[4] = self;
  id v15 = (void *)[v14 initWithSourceProvider:v13 transformationBlock:v23];
  [(HUAnnounceSettingsItemModule *)self setAnnounceOtherDeviceItemProvider:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F69718]);
  id v17 = [(HUAnnounceSettingsItemModule *)self home];
  uint64_t v18 = (void *)[v16 initWithHome:v17];
  [(HUAnnounceSettingsItemModule *)self setUserItemProvider:v18];

  BOOL v19 = [(HUAnnounceSettingsItemModule *)self userItemProvider];
  [v19 setIncludeCurrentUser:1];

  id v20 = [(HUAnnounceSettingsItemModule *)self home];
  uint64_t v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");
  v22 = [(HUAnnounceSettingsItemModule *)self userItemProvider];
  [v22 setIncludeOtherUsers:v21];
}

uint64_t __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
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
    uint64_t v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_338);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [v2 supportsAnnounce];
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory")) {
    uint64_t v3 = [v2 supportsAnnounce];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_4;
  v9[3] = &unk_1E638B630;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  uint64_t v7 = (void *)[v4 initWithSourceItem:v6 transformationBlock:v9];

  return v7;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
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

  if ([v10 isSiriEndpointAccessory])
  {
    uint64_t v11 = [v10 commonSettingsManager];

    if (v11)
    {
      uint64_t v12 = [v10 commonSettingsManager];
      [v12 addObserver:*(void *)(a1 + 40)];
    }
  }
  id v13 = NSNumber;
  [v10 isAnnounceEnabled];
  id v14 = [v13 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

void *__51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
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
  id v6 = objc_msgSend(v5, "hf_siriEndpointProfile");
  if (v6)
  {
    id v7 = objc_msgSend(v5, "hf_primaryService");

    if (v7)
    {
      id v6 = (void *)[v5 supportsAnnounce];
      goto LABEL_9;
    }
LABEL_8:
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_7;
  v9[3] = &unk_1E638B630;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  id v7 = (void *)[v4 initWithSourceItem:v6 transformationBlock:v9];

  return v7;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_7(uint64_t a1, void *a2)
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

  if ([v10 isSiriEndpointAccessory])
  {
    uint64_t v11 = [v10 commonSettingsManager];

    if (v11)
    {
      uint64_t v12 = [v10 commonSettingsManager];
      [v12 addObserver:*(void *)(a1 + 40)];
    }
  }
  id v13 = NSNumber;
  [v10 isAnnounceEnabled];
  id v14 = [v13 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

- (id)_updateNotificationSettings:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 deviceNotificationMode];
  id v7 = [(HUAnnounceSettingsItemModule *)self home];
  uint64_t v8 = [v7 currentUser];
  id v9 = [v8 announceUserSettings];
  uint64_t v10 = [v9 deviceNotificationMode];

  uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
  if (v6 == v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke;
    v16[3] = &unk_1E6385D90;
    void v16[4] = self;
    id v17 = v5;
    id v13 = [v11 futureWithBlock:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_351;
    v15[3] = &unk_1E63877D0;
    v15[4] = self;
    v15[5] = a2;
    uint64_t v12 = [v13 addCompletionBlock:v15];
  }

  return v12;
}

void __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 currentUser];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) home];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_2;
  v9[3] = &unk_1E6385A20;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v8 = v3;
  [v5 updateAnnounceUserSettings:v6 forHome:v7 completionHandler:v9];
}

void __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error setting announce notification setting: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "deviceNotificationMode"));
    [v5 finishWithResult:v6 error:0];
  }
}

void __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_351(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemUpdater];
  id v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = [*(id *)(a1 + 32) itemProviders];
  id v4 = [v2 requestToReloadItemProviders:v3 senderSelector:*(void *)(a1 + 40)];
  id v5 = (id)[v6 performItemUpdateRequest:v4];
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v16, 0x16u);
  }

  id v11 = [(HFItemModule *)self itemUpdater];
  uint64_t v12 = (void *)MEMORY[0x1E4F69230];
  id v13 = [(HUAnnounceSettingsItemModule *)self itemProviders];
  id v14 = [v12 requestToReloadItemProviders:v13 senderSelector:a2];
  id v15 = (id)[v11 performItemUpdateRequest:v14];
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (HUAnnounceNotificationSettingsItemProvider)notificationSettingsItemProvider
{
  return self->_notificationSettingsItemProvider;
}

- (void)setNotificationSettingsItemProvider:(id)a3
{
}

- (HFItemProvider)announceDeviceItemProvider
{
  return self->_announceDeviceItemProvider;
}

- (void)setAnnounceDeviceItemProvider:(id)a3
{
}

- (HFItemProvider)announceOtherDeviceItemProvider
{
  return self->_announceOtherDeviceItemProvider;
}

- (void)setAnnounceOtherDeviceItemProvider:(id)a3
{
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_announceOtherDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_announceDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_notificationSettingsItemProvider, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end