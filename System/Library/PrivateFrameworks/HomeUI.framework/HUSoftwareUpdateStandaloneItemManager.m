@interface HUSoftwareUpdateStandaloneItemManager
- (HFItem)autoUpdateItem;
- (HFItem)autoUpdateThirdPartyItem;
- (HFItem)betaUpdatesItem;
- (HFItem)carrySettingsItem;
- (HFItem)homeUpdateBannerItem;
- (HFItem)updatedRecentlyItem;
- (HMHome)overrideHome;
- (HUFirmwareUpdateItemModule)firmwareUpdateModule;
- (HUSoftwareUpdateAllItem)updateAllItem;
- (HUSoftwareUpdateFetchItem)fetchItem;
- (HUSoftwareUpdateItemModule)softwareUpdateModule;
- (HUSoftwareUpdateStandaloneItemManager)initWithDelegate:(id)a3 home:(id)a4;
- (HUSoftwareUpdateStandaloneItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NAFuture)softwareUpdateFetchFuture;
- (NSSet)devices;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4;
- (id)triggerSoftwareUpdateFetch;
- (void)addHomeSetupSuccessBlock:(id)a3;
- (void)dealloc;
- (void)home:(id)a3 didUpdateAutomaticSoftwareUpdateEnabled:(BOOL)a4;
- (void)home:(id)a3 didUpdateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a4;
- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4;
- (void)setAutoUpdateItem:(id)a3;
- (void)setAutoUpdateThirdPartyItem:(id)a3;
- (void)setBetaUpdatesItem:(id)a3;
- (void)setCarrySettingsItem:(id)a3;
- (void)setDevices:(id)a3;
- (void)setFetchItem:(id)a3;
- (void)setFirmwareUpdateModule:(id)a3;
- (void)setHomeUpdateBannerItem:(id)a3;
- (void)setOverrideHome:(id)a3;
- (void)setSoftwareUpdateFetchFuture:(id)a3;
- (void)setSoftwareUpdateModule:(id)a3;
- (void)setUpdateAllItem:(id)a3;
- (void)setUpdatedRecentlyItem:(id)a3;
@end

@implementation HUSoftwareUpdateStandaloneItemManager

- (HUSoftwareUpdateStandaloneItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateStandaloneItemManager.m", 60, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateStandaloneItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUSoftwareUpdateStandaloneItemManager)initWithDelegate:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUSoftwareUpdateStandaloneItemManager;
  v8 = [(HFItemManager *)&v18 initWithDelegate:v6 sourceItem:0];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    softwareUpdateFetchFuture = v8->_softwareUpdateFetchFuture;
    v8->_softwareUpdateFetchFuture = (NAFuture *)v9;

    objc_storeStrong((id *)&v8->_overrideHome, a4);
    v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v11 addHomeManagerObserver:v8];

    objc_initWeak(&location, v8);
    v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v13 = [v12 homeManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__HUSoftwareUpdateStandaloneItemManager_initWithDelegate_home___block_invoke;
    v15[3] = &unk_1E638AA50;
    objc_copyWeak(&v16, &location);
    [v13 fetchDevicesWithCompletionHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __63__HUSoftwareUpdateStandaloneItemManager_initWithDelegate_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = HFLogForCategory();
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

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 removeHomeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateStandaloneItemManager;
  [(HFItemManager *)&v4 dealloc];
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUSoftwareUpdateStandaloneItemManager *)self overrideHome];
  objc_super v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [[HUFirmwareUpdateItemModule alloc] initWithItemUpdater:self home:v4];
  [(HUSoftwareUpdateStandaloneItemManager *)self setFirmwareUpdateModule:v6];

  id v7 = [(HUSoftwareUpdateStandaloneItemManager *)self firmwareUpdateModule];
  objc_msgSend(v5, "na_safeAddObject:", v7);

  v8 = [[HUSoftwareUpdateItemModule alloc] initWithItemUpdater:self home:v4 sourceItem:0];
  [(HUSoftwareUpdateStandaloneItemManager *)self setSoftwareUpdateModule:v8];

  int v9 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateModule];
  objc_msgSend(v5, "na_safeAddObject:", v9);

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke;
  v62[3] = &unk_1E638EDA8;
  id v6 = v4;
  id v63 = v6;
  id v7 = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke((uint64_t)v62);
  id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2;
  v59[3] = &unk_1E6386178;
  id v9 = v7;
  id v60 = v9;
  v61 = self;
  id v10 = (void *)[v8 initWithResultsBlock:v59];
  [(HUSoftwareUpdateStandaloneItemManager *)self setAutoUpdateItem:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F695C0]);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3;
  v56[3] = &unk_1E6386178;
  id v57 = v9;
  v58 = self;
  id v12 = v9;
  uint64_t v13 = (void *)[v11 initWithResultsBlock:v56];
  [(HUSoftwareUpdateStandaloneItemManager *)self setAutoUpdateThirdPartyItem:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F695C0]);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4;
  v54[3] = &unk_1E6386178;
  v54[4] = self;
  id v15 = v6;
  id v55 = v15;
  id v16 = (void *)[v14 initWithResultsBlock:v54];
  [(HUSoftwareUpdateStandaloneItemManager *)self setHomeUpdateBannerItem:v16];

  v17 = [[HUSoftwareUpdateAllItem alloc] initWithHome:v15];
  [(HUSoftwareUpdateStandaloneItemManager *)self setUpdateAllItem:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F695C0]);
  v64[0] = *MEMORY[0x1E4F68AB8];
  v19 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateUpdatedRecentlyTitle", @"HUSoftwareUpdateUpdatedRecentlyTitle", 1);
  v65[0] = v19;
  v64[1] = *MEMORY[0x1E4F68B10];
  v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "hf_currentUserIsAdministrator") ^ 1);
  v65[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v22 = (void *)[v18 initWithResults:v21];
  [(HUSoftwareUpdateStandaloneItemManager *)self setUpdatedRecentlyItem:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F695C0]);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_70;
  v52[3] = &unk_1E6385000;
  id v24 = v15;
  id v53 = v24;
  v25 = (void *)[v23 initWithResultsBlock:v52];
  [(HUSoftwareUpdateStandaloneItemManager *)self setBetaUpdatesItem:v25];

  id v26 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4_81;
  v50 = &unk_1E6385000;
  id v51 = v24;
  id v27 = v24;
  v28 = (void *)[v26 initWithResultsBlock:&v47];
  [(HUSoftwareUpdateStandaloneItemManager *)self setCarrySettingsItem:v28];

  v29 = [HUSoftwareUpdateFetchItem alloc];
  v30 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateFetchFuture];
  v31 = [(HUSoftwareUpdateFetchItem *)v29 initWithHome:v27 softwareUpdateFetchFuture:v30];
  [(HUSoftwareUpdateStandaloneItemManager *)self setFetchItem:v31];

  v32 = (void *)MEMORY[0x1E4F1CA80];
  v33 = [(HUSoftwareUpdateStandaloneItemManager *)self autoUpdateItem];
  v34 = [(HUSoftwareUpdateStandaloneItemManager *)self fetchItem];
  v35 = [(HUSoftwareUpdateStandaloneItemManager *)self updateAllItem];
  v36 = [(HUSoftwareUpdateStandaloneItemManager *)self autoUpdateThirdPartyItem];
  v37 = [(HUSoftwareUpdateStandaloneItemManager *)self updatedRecentlyItem];
  v38 = objc_msgSend(v32, "setWithObjects:", v33, v34, v35, v36, v37, 0, v47, v48, v49, v50);

  v39 = [(HUSoftwareUpdateStandaloneItemManager *)self homeUpdateBannerItem];
  [v38 addObject:v39];

  v40 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v38];
  [v5 addObject:v40];
  v41 = (void *)MEMORY[0x1E4F1CAD0];
  v42 = [(HUSoftwareUpdateStandaloneItemManager *)self betaUpdatesItem];
  v43 = [(HUSoftwareUpdateStandaloneItemManager *)self carrySettingsItem];
  v44 = objc_msgSend(v41, "setWithObjects:", v42, v43, 0);

  v45 = (void *)[objc_alloc(MEMORY[0x1E4F695D0]) initWithItems:v44];
  [v5 addObject:v45];

  return v5;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 currentUser];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  uint64_t v7 = *MEMORY[0x1E4F68908];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator") ^ 1);
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner") ^ 1);
  [v2 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [v2 setObject:v10 forKeyedSubscript:v7];

  return v2;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateEnableAutomaticUpdatesSwitch", @"HUSoftwareUpdateEnableAutomaticUpdatesSwitch", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"HUSoftwareUpdateEnableAutomaticUpdatesSwitch" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  id v4 = NSNumber;
  id v5 = [*(id *)(a1 + 40) home];
  [v5 isAutomaticSoftwareUpdateEnabled];
  id v6 = [v4 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  uint64_t v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v7;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateEnableAutomaticThirdPartyUpdatesSwitch", @"HUSoftwareUpdateEnableAutomaticThirdPartyUpdatesSwitch", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v4 = NSNumber;
  id v5 = [*(id *)(a1 + 40) home];
  [v5 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
  id v6 = [v4 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  uint64_t v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v7;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = [v3 allHomesFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5;
  v11[3] = &unk_1E638EDD0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v12 = v2;
  uint64_t v13 = v5;
  id v14 = v6;
  id v7 = v2;
  id v8 = (id)[v4 addSuccessBlock:v11];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];

  return v9;
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5(id *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a2, "na_filter:", &__block_literal_global_204);
  id v4 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateHomeKitUpdateAvailable", @"HUSoftwareUpdateHomeKitUpdateAvailable", 1);
  [a1[4] setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v32 = v3;
  if ((unint64_t)[v3 count] <= 1) {
    uint64_t v5 = @"HUSoftwareUpdateImproveReliabilityAndPerformance";
  }
  else {
    uint64_t v5 = @"HUSoftwareUpdateImproveReliabilityAndPerformancePlural";
  }
  id v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  [a1[4] setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v7 = _HULocalizedStringWithDefaultValue(@"HULearnMoreTitle", @"HULearnMoreTitle", 1);
  [a1[4] setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  id v8 = (void *)MEMORY[0x1E4F42A98];
  id v9 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  uint64_t v10 = [v8 configurationWithHierarchicalColor:v9];

  id v11 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
  v31 = (void *)v10;
  id v12 = [v11 configurationByApplyingConfiguration:v10];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F69600]) initWithSystemImageName:@"homekit" configuration:v12];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSymbolIconConfiguration:v13];
  [a1[4] setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  id v15 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v16 = [v15 homeManager];

  v17 = [a1[5] home];
  int v18 = objc_msgSend(v17, "hf_canUpdateToHH2");

  v19 = HFLogForCategory();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  unint64_t v21 = 0x1E4F28000;
  if (v18)
  {
    if (v20)
    {
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[6], "hf_currentUserIsOwner"));
      v22 = v29 = v12;
      id v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isHH2MigrationAvailable"));
      id v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "hasOptedToHH2"));
      *(_DWORD *)buf = 138412802;
      v34 = v22;
      __int16 v35 = 2112;
      v36 = v23;
      __int16 v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Showing HH2 migration banner. Owner:%@ migrationAvailable:%@ userAlreadyOptedIn:%@", buf, 0x20u);

      unint64_t v21 = 0x1E4F28000;
      id v12 = v29;
    }
  }
  else if (v20)
  {
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[6], "hf_currentUserIsOwner"));
    v25 = v30 = v11;
    id v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isHH2MigrationAvailable"));
    id v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "hasOptedToHH2"));
    *(_DWORD *)buf = 138412802;
    v34 = v25;
    __int16 v35 = 2112;
    v36 = v26;
    __int16 v37 = 2112;
    v38 = v27;
    _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Hiding HH2 migration banner. Owner:%@ migrationAvailable:%@ userAlreadyOptedIn:%@", buf, 0x20u);

    unint64_t v21 = 0x1E4F28000uLL;
    id v11 = v30;
  }

  v28 = [*(id *)(v21 + 3792) numberWithInt:v18 ^ 1u];
  [a1[4] setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68B10]];
}

uint64_t __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 currentUser];
  uint64_t v4 = objc_msgSend(v2, "hf_userIsOwner:", v3);

  return v4;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_70(uint64_t a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__26;
  id v14 = __Block_byref_object_dispose__26;
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v2 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateBetaUpdatesTitle", @"HUSoftwareUpdateBetaUpdatesTitle", 1);
  [(id)v11[5] setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [(id)v11[5] setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner")
    && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods") & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E4F7A0D8];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_74;
    v8[3] = &unk_1E6385108;
    id v9 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 futureWithBlock:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3_79;
    v7[3] = &unk_1E638EDF8;
    v7[4] = &v10;
    uint64_t v5 = [v4 flatMap:v7];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v11[5]];
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F6A2C0];
  uint64_t v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2_76;
  v7[3] = &unk_1E6385D68;
  id v8 = v3;
  id v6 = v3;
  [v4 shouldShowBetaEnrollmentButtonForHomeID:v5 withCompletion:v7];
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2_76(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 finishWithResult:v3];
}

uint64_t __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3_79(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v3 futureWithResult:v4];
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4_81(uint64_t a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__26;
  id v14 = __Block_byref_object_dispose__26;
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v2 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateCarrySettingsTitle", @"HUSoftwareUpdateCarrySettingsTitle", 1);
  [(id)v11[5] setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [(id)v11[5] setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner")
    && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods") & 1) != 0)
  {
    id v3 = (void *)MEMORY[0x1E4F7A0D8];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5_85;
    v8[3] = &unk_1E6385108;
    id v9 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 futureWithBlock:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_7;
    v7[3] = &unk_1E638EDF8;
    void v7[4] = &v10;
    uint64_t v5 = [v4 flatMap:v7];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v11[5]];
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5_85(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F6A2C8];
  uint64_t v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_6_87;
  v7[3] = &unk_1E6385D68;
  id v8 = v3;
  id v6 = v3;
  [v4 shouldShowCarrySettingsButtonForHomeID:v5 withCompletion:v7];
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_6_87(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 finishWithResult:v3];
}

uint64_t __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v3 futureWithResult:v4];
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"banners"];
  id v7 = [(HUSoftwareUpdateStandaloneItemManager *)self homeUpdateBannerItem];
  v49[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  [v6 setItems:v8];

  [v5 addObject:v6];
  id v9 = [(HFItemManager *)self home];
  LODWORD(v8) = objc_msgSend(v9, "hf_hasAccessoriesSupportingSoftwareUpdate");

  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"settings"];
  id v11 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateEnableAutomaticUpdatesSectionHeader", @"HUSoftwareUpdateEnableAutomaticUpdatesSectionHeader", 1);
  [v10 setHeaderTitle:v11];

  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [(HFItemManager *)self home];
  int v14 = objc_msgSend(v13, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate");

  if (v14)
  {
    id v15 = [(HUSoftwareUpdateStandaloneItemManager *)self autoUpdateItem];
    [v12 addObject:v15];
  }
  id v16 = [(HFItemManager *)self home];
  if (!objc_msgSend(v16, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate")) {
    goto LABEL_7;
  }
  v17 = [(HFItemManager *)self home];
  int v18 = objc_msgSend(v17, "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");

  if (v18)
  {
    id v16 = [(HUSoftwareUpdateStandaloneItemManager *)self autoUpdateThirdPartyItem];
    [v12 addObject:v16];
LABEL_7:
  }
  [v10 setItems:v12];
  v19 = [v10 items];
  uint64_t v20 = [v19 count];

  if (v20) {
    [v5 addObject:v10];
  }

LABEL_11:
  unint64_t v21 = [(HUSoftwareUpdateStandaloneItemManager *)self fetchItem];
  v22 = [v21 latestResults];
  id v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
  uint64_t v24 = [v23 BOOLValue];

  if ((v24 & 1) == 0)
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"updateAll"];
    id v26 = [(HUSoftwareUpdateStandaloneItemManager *)self updateAllItem];
    uint64_t v48 = v26;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v25 setItems:v27];

    [v5 addObject:v25];
  }
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"fetchUpdates"];
  v29 = [(HUSoftwareUpdateStandaloneItemManager *)self fetchItem];
  uint64_t v47 = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  [v28 setItems:v30];

  [v5 addObject:v28];
  v31 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateModule];
  [v31 setHideAppleUpdates:v24];

  v32 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateModule];
  v33 = [v32 buildSectionsWithDisplayedItems:v4];
  [v5 addObjectsFromArray:v33];

  v34 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"updatedRecently"];
  __int16 v35 = [(HUSoftwareUpdateStandaloneItemManager *)self updatedRecentlyItem];
  v46 = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  [v34 setItems:v36];

  [v5 addObject:v34];
  __int16 v37 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"betaUpdates"];
  v38 = [(HUSoftwareUpdateStandaloneItemManager *)self betaUpdatesItem];
  v45[0] = v38;
  uint64_t v39 = [(HUSoftwareUpdateStandaloneItemManager *)self carrySettingsItem];
  v45[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v37 setItems:v40];

  [v5 addObject:v37];
  v41 = [(HUSoftwareUpdateStandaloneItemManager *)self firmwareUpdateModule];
  v42 = [v41 buildSectionsWithDisplayedItems:v4];
  [v5 addObjectsFromArray:v42];

  v43 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v43;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUSoftwareUpdateStandaloneItemManager;
  uint64_t v5 = [(HFItemManager *)&v20 _itemsToHideInSet:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __59__HUSoftwareUpdateStandaloneItemManager__itemsToHideInSet___block_invoke;
  uint64_t v13 = &unk_1E638EE20;
  id v7 = v6;
  id v14 = v7;
  id v15 = &v16;
  objc_msgSend(v4, "na_each:", &v10);
  if (!*((unsigned char *)v17 + 24))
  {
    id v8 = [(HUSoftwareUpdateStandaloneItemManager *)self updatedRecentlyItem];
    [v7 addObject:v8];
  }
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __59__HUSoftwareUpdateStandaloneItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v6 latestResults];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C58]];
    int v5 = [v4 BOOLValue];

    if (v5)
    {
      [*(id *)(a1 + 32) addObject:v6];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUSoftwareUpdateStandaloneItemManager *)self firmwareUpdateModule];

  if (v8)
  {
    id v9 = [(HUSoftwareUpdateStandaloneItemManager *)self firmwareUpdateModule];
    id v10 = [v9 transformedUpdateOutcomeForItem:v6 proposedOutcome:v7];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)triggerSoftwareUpdateFetch
{
  id v4 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateFetchFuture];
  int v5 = [v4 isFinished];

  if (v5)
  {
    id v6 = objc_opt_new();
    [(HUSoftwareUpdateStandaloneItemManager *)self setSoftwareUpdateFetchFuture:v6];

    id v7 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateFetchFuture];
    id v8 = [(HUSoftwareUpdateStandaloneItemManager *)self fetchItem];
    [v8 setSoftwareUpdateFetchFuture:v7];

    id v9 = (void *)MEMORY[0x1E4F69230];
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = [(HFItemManager *)self itemProviders];
    uint64_t v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v9 requestToReloadItemProviders:v12 senderSelector:a2];
    id v14 = [(HFItemManager *)self performItemUpdateRequest:v13];
  }
  id v15 = [(HUSoftwareUpdateStandaloneItemManager *)self softwareUpdateFetchFuture];

  return v15;
}

- (void)addHomeSetupSuccessBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HUSoftwareUpdateStandaloneItemManager_addHomeSetupSuccessBlock___block_invoke;
  v6[3] = &unk_1E638EE48;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__HUSoftwareUpdateStandaloneItemManager_addHomeSetupSuccessBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _homeFuture];
  id v2 = (id)[v3 addSuccessBlock:*(void *)(a1 + 40)];
}

- (void)home:(id)a3 didUpdateAutomaticSoftwareUpdateEnabled:(BOOL)a4
{
  id v6 = (void *)MEMORY[0x1E4F69230];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [(HUSoftwareUpdateStandaloneItemManager *)self autoUpdateItem];
  id v8 = [v7 setWithObject:v11];
  id v9 = [v6 requestToUpdateItems:v8 senderSelector:a2];
  id v10 = [(HFItemManager *)self performItemUpdateRequest:v9];
}

- (void)home:(id)a3 didUpdateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a4
{
  id v6 = (void *)MEMORY[0x1E4F69230];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [(HUSoftwareUpdateStandaloneItemManager *)self autoUpdateThirdPartyItem];
  id v8 = [v7 setWithObject:v11];
  id v9 = [v6 requestToUpdateItems:v8 senderSelector:a2];
  id v10 = [(HFItemManager *)self performItemUpdateRequest:v9];
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Migration Completed - didUpdateHH2State = %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
  }
  id v9 = (void *)MEMORY[0x1E4F69230];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [(HFItemManager *)self itemProviders];
  uint64_t v12 = [v10 setWithArray:v11];
  uint64_t v13 = [v9 requestToReloadItemProviders:v12 senderSelector:a2];
  id v14 = [(HFItemManager *)self performItemUpdateRequest:v13];
}

- (HFItem)autoUpdateItem
{
  return self->_autoUpdateItem;
}

- (void)setAutoUpdateItem:(id)a3
{
}

- (HFItem)autoUpdateThirdPartyItem
{
  return self->_autoUpdateThirdPartyItem;
}

- (void)setAutoUpdateThirdPartyItem:(id)a3
{
}

- (HFItem)homeUpdateBannerItem
{
  return self->_homeUpdateBannerItem;
}

- (void)setHomeUpdateBannerItem:(id)a3
{
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (HUSoftwareUpdateFetchItem)fetchItem
{
  return self->_fetchItem;
}

- (void)setFetchItem:(id)a3
{
}

- (HUSoftwareUpdateItemModule)softwareUpdateModule
{
  return self->_softwareUpdateModule;
}

- (void)setSoftwareUpdateModule:(id)a3
{
}

- (HUSoftwareUpdateAllItem)updateAllItem
{
  return self->_updateAllItem;
}

- (void)setUpdateAllItem:(id)a3
{
}

- (HFItem)updatedRecentlyItem
{
  return self->_updatedRecentlyItem;
}

- (void)setUpdatedRecentlyItem:(id)a3
{
}

- (HUFirmwareUpdateItemModule)firmwareUpdateModule
{
  return self->_firmwareUpdateModule;
}

- (void)setFirmwareUpdateModule:(id)a3
{
}

- (HFItem)betaUpdatesItem
{
  return self->_betaUpdatesItem;
}

- (void)setBetaUpdatesItem:(id)a3
{
}

- (HFItem)carrySettingsItem
{
  return self->_carrySettingsItem;
}

- (void)setCarrySettingsItem:(id)a3
{
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)setOverrideHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_carrySettingsItem, 0);
  objc_storeStrong((id *)&self->_betaUpdatesItem, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateModule, 0);
  objc_storeStrong((id *)&self->_updatedRecentlyItem, 0);
  objc_storeStrong((id *)&self->_updateAllItem, 0);
  objc_storeStrong((id *)&self->_softwareUpdateModule, 0);
  objc_storeStrong((id *)&self->_fetchItem, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_homeUpdateBannerItem, 0);
  objc_storeStrong((id *)&self->_autoUpdateThirdPartyItem, 0);

  objc_storeStrong((id *)&self->_autoUpdateItem, 0);
}

@end