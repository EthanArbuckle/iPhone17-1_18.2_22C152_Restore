@interface HUSafetyAndSecuritySettingsItemModule
+ (id)_userItemComparator;
- (HFItem)homeUpgradeBannerItem;
- (HFItem)listenForSoundsItem;
- (HFItem)notificationsItem;
- (HFItemProvider)staticItemProvider;
- (HFUserItemProvider)userItemProvider;
- (HMHome)home;
- (HUSafetyAndSecuritySettingsItemModule)initWithItemUpdater:(id)a3;
- (HUSafetyAndSecuritySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (NSArray)ownerHomes;
- (NSSet)devices;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)enableUserPermissionSetting:(BOOL)a3 forItem:(id)a4;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setDevices:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeUpgradeBannerItem:(id)a3;
- (void)setListenForSoundsItem:(id)a3;
- (void)setNotificationsItem:(id)a3;
- (void)setOwnerHomes:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setUserItemProvider:(id)a3;
@end

@implementation HUSafetyAndSecuritySettingsItemModule

- (HUSafetyAndSecuritySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUSafetyAndSecuritySettingsItemModule.m", 42, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HUSafetyAndSecuritySettingsItemModule;
  v9 = [(HFItemModule *)&v18 initWithItemUpdater:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_initWeak(&location, v10);
    v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v12 = [v11 homeManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__HUSafetyAndSecuritySettingsItemModule_initWithItemUpdater_home___block_invoke;
    v15[3] = &unk_1E638AA50;
    objc_copyWeak(&v16, &location);
    [v12 fetchDevicesWithCompletionHandler:v15];

    [(HUSafetyAndSecuritySettingsItemModule *)v10 _buildItemProviders];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __66__HUSafetyAndSecuritySettingsItemModule_initWithItemUpdater_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Fetched devices:[%@] Error:[%@]", (uint8_t *)&v9, 0x16u);
  }

  [WeakRetained setDevices:v5];
}

- (HUSafetyAndSecuritySettingsItemModule)initWithItemUpdater:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSafetyAndSecuritySettingsItemModule.m", 64, @"%s is unavailable; use %@ instead",
    "-[HUSafetyAndSecuritySettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

+ (id)_userItemComparator
{
  return &__block_literal_global_300;
}

uint64_t __60__HUSafetyAndSecuritySettingsItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68C78];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

  int v9 = [v5 latestResults];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if ([v8 type] || !objc_msgSend(v10, "type"))
  {
    if ([v8 type] && !objc_msgSend(v10, "type"))
    {
      uint64_t v12 = 1;
    }
    else
    {
      __int16 v11 = [MEMORY[0x1E4F69220] defaultItemComparator];
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
  v34[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F695C0]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke;
  v31[3] = &unk_1E6385000;
  v31[4] = self;
  id v4 = (void *)[v3 initWithResultsBlock:v31];
  [(HUSafetyAndSecuritySettingsItemModule *)self setHomeUpgradeBannerItem:v4];

  id v5 = [HUSoundRecognitionItem alloc];
  id v6 = [(HUSafetyAndSecuritySettingsItemModule *)self home];
  uint64_t v7 = [(HUSoundRecognitionItem *)v5 initWithHome:v6];
  [(HUSafetyAndSecuritySettingsItemModule *)self setListenForSoundsItem:v7];

  id v8 = [(HUSafetyAndSecuritySettingsItemModule *)self home];
  uint64_t v9 = objc_msgSend(v8, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory") ^ 1;

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v33[0] = *MEMORY[0x1E4F68AB8];
  __int16 v11 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettings_Notifications_Title", @"HUSafetyAndSecuritySettings_Notifications_Title", 1);
  uint64_t v12 = *MEMORY[0x1E4F68AC0];
  v34[0] = v11;
  v34[1] = @"HUSafetyAndSecuritySettings_Notifications_Title";
  uint64_t v13 = *MEMORY[0x1E4F68B10];
  v33[1] = v12;
  v33[2] = v13;
  v14 = [NSNumber numberWithBool:v9];
  v33[3] = *MEMORY[0x1E4F68A70];
  v34[2] = v14;
  v34[3] = MEMORY[0x1E4F1CC28];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
  id v16 = (void *)[v10 initWithResults:v15];
  [(HUSafetyAndSecuritySettingsItemModule *)self setNotificationsItem:v16];

  v17 = [(HUSafetyAndSecuritySettingsItemModule *)self listenForSoundsItem];
  v32[0] = v17;
  objc_super v18 = [(HUSafetyAndSecuritySettingsItemModule *)self notificationsItem];
  v32[1] = v18;
  v19 = [(HUSafetyAndSecuritySettingsItemModule *)self homeUpgradeBannerItem];
  v32[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];

  id v21 = objc_alloc(MEMORY[0x1E4F695C8]);
  v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
  v23 = (void *)[v21 initWithItems:v22];
  [(HUSafetyAndSecuritySettingsItemModule *)self setStaticItemProvider:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F69718]);
  v25 = [(HUSafetyAndSecuritySettingsItemModule *)self home];
  v26 = (void *)[v24 initWithHome:v25];
  [(HUSafetyAndSecuritySettingsItemModule *)self setUserItemProvider:v26];

  v27 = [(HUSafetyAndSecuritySettingsItemModule *)self userItemProvider];
  [v27 setIncludeCurrentUser:1];

  v28 = [(HUSafetyAndSecuritySettingsItemModule *)self home];
  uint64_t v29 = objc_msgSend(v28, "hf_currentUserIsAdministrator");
  v30 = [(HUSafetyAndSecuritySettingsItemModule *)self userItemProvider];
  [v30 setIncludeOtherUsers:v29];
}

id __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = [v3 allHomesFuture];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  __int16 v11 = __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke_2;
  uint64_t v12 = &unk_1E63873E0;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v2;
  id v5 = v2;
  id v6 = (id)[v4 addSuccessBlock:&v9];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", v5, v9, v10, v11, v12, v13);

  return v7;
}

void __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a2, "na_filter:", &__block_literal_global_32_2);
  [*(id *)(a1 + 32) setOwnerHomes:v3];

  id v4 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateHomeKitUpdateAvailable", @"HUSoftwareUpdateHomeKitUpdateAvailable", 1);
  [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v5 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySoftwareUpdateImproveReliabilityAndPerformance", @"HUSafetyAndSecuritySoftwareUpdateImproveReliabilityAndPerformance", 1);
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v6 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySoftwareUpdateContinueButtonTitle", @"HUSafetyAndSecuritySoftwareUpdateContinueButtonTitle", 1);
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  uint64_t v7 = (void *)MEMORY[0x1E4F42A98];
  id v8 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  uint64_t v9 = [v7 configurationWithHierarchicalColor:v8];

  uint64_t v10 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
  __int16 v11 = [v10 configurationByApplyingConfiguration:v9];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F69600]) initWithSystemImageName:@"homekit" configuration:v11];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSymbolIconConfiguration:v12];
  [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  id v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v15 = [v14 homeManager];

  id v16 = [*(id *)(a1 + 32) home];
  int v17 = objc_msgSend(v16, "hf_canUpdateToHH2");

  objc_super v18 = HFLogForCategory();
  unint64_t v19 = 0x1E4F28000;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = @"Hiding";
    if (v17) {
      v20 = @"Showing";
    }
    id v21 = NSNumber;
    objc_msgSend(*(id *)(a1 + 32), "home", v20);
    v30 = v32 = v9;
    v22 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v30, "hf_currentUserIsOwner"));
    v31 = v10;
    v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "isHH2MigrationAvailable"));
    id v24 = v13;
    v25 = v12;
    v26 = v11;
    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "hasOptedToHH2"));
    *(_DWORD *)buf = 138413058;
    uint64_t v34 = v29;
    __int16 v35 = 2112;
    v36 = v22;
    __int16 v37 = 2112;
    v38 = v23;
    __int16 v39 = 2112;
    v40 = v27;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@ HH2 migration banner. Owner:%@ migrationAvailable:%@ userAlreadyOptedIn:%@", buf, 0x2Au);

    __int16 v11 = v26;
    uint64_t v12 = v25;
    uint64_t v13 = v24;

    uint64_t v10 = v31;
    unint64_t v19 = 0x1E4F28000uLL;

    uint64_t v9 = v32;
  }

  v28 = [*(id *)(v19 + 3792) numberWithInt:v17 ^ 1u];
  [*(id *)(a1 + 40) setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68B10]];
}

uint64_t __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 currentUser];
  uint64_t v4 = objc_msgSend(v2, "hf_userIsOwner:", v3);

  return v4;
}

- (id)itemProviders
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [(HUSafetyAndSecuritySettingsItemModule *)self staticItemProvider];
  id v5 = [(HUSafetyAndSecuritySettingsItemModule *)self userItemProvider];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(HUSafetyAndSecuritySettingsItemModule *)self homeUpgradeBannerItem];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSafetyAndSecurityBannerSectionIdentifier"];
    uint64_t v9 = [(HUSafetyAndSecuritySettingsItemModule *)self homeUpgradeBannerItem];
    v42[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v8 setItems:v10];

    __int16 v11 = [(HUSafetyAndSecuritySettingsItemModule *)self ownerHomes];
    if ((unint64_t)[v11 count] <= 1) {
      uint64_t v12 = @"HUSafetyAndSecuritySoftwareUpdateFooter";
    }
    else {
      uint64_t v12 = @"HUSafetyAndSecuritySoftwareUpdateFooterPlural";
    }
    uint64_t v13 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
    [v8 setFooterTitle:v13];

    [v5 addObject:v8];
  }
  id v14 = [(HUSafetyAndSecuritySettingsItemModule *)self listenForSoundsItem];
  int v15 = [v4 containsObject:v14];

  if (v15)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSafetyAndSecuritySettingsListenForSoundsSectionIdentifier"];
    int v17 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettings_ListenForSoundsSection_Footer", @"HUSafetyAndSecuritySettings_ListenForSoundsSection_Footer", 1);
    [v16 setFooterTitle:v17];

    objc_super v18 = [(HUSafetyAndSecuritySettingsItemModule *)self listenForSoundsItem];
    uint64_t v41 = v18;
    unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v16 setItems:v19];

    [v5 addObject:v16];
  }
  v20 = [(HUSafetyAndSecuritySettingsItemModule *)self notificationsItem];
  int v21 = [v4 containsObject:v20];

  if (v21)
  {
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSafetyAndSecuritySettingsNotificationsSectionIdentifier"];
    v23 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettings_Notifications_Footer", @"HUSafetyAndSecuritySettings_Notifications_Footer", 1);
    [v22 setFooterTitle:v23];

    id v24 = [(HUSafetyAndSecuritySettingsItemModule *)self notificationsItem];
    v40 = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v22 setItems:v25];

    [v5 addObject:v22];
  }
  v26 = [(HUSafetyAndSecuritySettingsItemModule *)self home];
  int v27 = objc_msgSend(v26, "hf_hasAtleastOneAudioAnalysisSupportedAccessory");

  if (v27)
  {
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSafetyAndSecuritySettingsUserItemSectionIdentifier"];
    uint64_t v29 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettingsUserSection_Header", @"HUSafetyAndSecuritySettingsUserSection_Header", 1);
    [v28 setHeaderTitle:v29];

    v30 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettingsUserSection_Footer", @"HUSafetyAndSecuritySettingsUserSection_Footer", 1);
    [v28 setFooterTitle:v30];

    v31 = [(HUSafetyAndSecuritySettingsItemModule *)self userItemProvider];
    v32 = [v31 items];
    v33 = [v32 allObjects];
    uint64_t v34 = [(id)objc_opt_class() _userItemComparator];
    __int16 v35 = [v33 sortedArrayUsingComparator:v34];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __73__HUSafetyAndSecuritySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v38[3] = &unk_1E6386108;
    id v39 = v4;
    v36 = objc_msgSend(v35, "na_filter:", v38);
    [v28 setItems:v36];

    [v5 addObject:v28];
  }

  return v5;
}

uint64_t __73__HUSafetyAndSecuritySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)enableUserPermissionSetting:(BOOL)a3 forItem:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    v26 = v9;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Attempting to update DropIn permission setting for item %@", buf, 0x20u);
  }
  objc_opt_class();
  id v10 = v7;
  if (objc_opt_isKindOfClass()) {
    __int16 v11 = v10;
  }
  else {
    __int16 v11 = 0;
  }
  id v12 = v11;

  if (v12
    && ([(HUSafetyAndSecuritySettingsItemModule *)self userItemProvider],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 items],
        id v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 containsObject:v10],
        v14,
        v13,
        v15))
  {
    id v16 = (void *)MEMORY[0x1E4F7A0D8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke;
    v19[3] = &unk_1E638C118;
    BOOL v22 = a3;
    v19[4] = self;
    id v20 = v12;
    SEL v21 = a2;
    int v17 = [v16 futureWithBlock:v19];
  }
  else
  {
    int v17 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v17;
}

void __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = [*(id *)(a1 + 32) home];
  id v6 = [*(id *)(a1 + 40) user];
  id v7 = [v5 homeAccessControlForUser:v6];

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    if (*(unsigned char *)(a1 + 56)) {
      __int16 v11 = @"enable";
    }
    else {
      __int16 v11 = @"disable";
    }
    id v12 = [*(id *)(a1 + 40) user];
    *(_DWORD *)buf = 138413058;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    SEL v21 = v10;
    __int16 v22 = 2112;
    v23 = v11;
    __int16 v24 = 2112;
    __int16 v25 = v12;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Will %@ DropIn permission setting for %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_96;
  v14[3] = &unk_1E638AA28;
  objc_copyWeak(&v17, (id *)buf);
  id v13 = v3;
  id v15 = v13;
  id v16 = *(id *)(a1 + 40);
  [v7 updateAudioAnalysisUserDropinAccessLevel:v4 completionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_96(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = HFLogForCategory();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Error setting dropin access level setting: %@", buf, 0xCu);
    }

    [a1[4] finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Success in setting dropin access level setting", buf, 2u);
    }

    id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_97;
    __int16 v11 = &unk_1E6387408;
    id v12 = WeakRetained;
    id v13 = a1[5];
    [v7 dispatchHomeObserverMessage:&v8 sender:0];

    objc_msgSend(a1[4], "finishWithNoResult", v8, v9, v10, v11, v12);
  }
}

void __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_97(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    uint64_t v4 = [*(id *)(a1 + 40) user];
    [v5 home:v3 didUpdateAccessControlForUser:v4];
  }
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFItem)listenForSoundsItem
{
  return self->_listenForSoundsItem;
}

- (void)setListenForSoundsItem:(id)a3
{
}

- (HFItem)notificationsItem
{
  return self->_notificationsItem;
}

- (void)setNotificationsItem:(id)a3
{
}

- (HFItem)homeUpgradeBannerItem
{
  return self->_homeUpgradeBannerItem;
}

- (void)setHomeUpgradeBannerItem:(id)a3
{
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
}

- (NSArray)ownerHomes
{
  return self->_ownerHomes;
}

- (void)setOwnerHomes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerHomes, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_homeUpgradeBannerItem, 0);
  objc_storeStrong((id *)&self->_notificationsItem, 0);
  objc_storeStrong((id *)&self->_listenForSoundsItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end