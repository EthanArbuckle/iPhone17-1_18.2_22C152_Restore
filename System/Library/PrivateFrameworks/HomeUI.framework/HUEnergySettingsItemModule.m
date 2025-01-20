@interface HUEnergySettingsItemModule
- (BOOL)hasSentUtilityAnalytics;
- (HFItem)connectUtilityItem;
- (HFItem)gridForecastItem;
- (HFItem)utilityDetailsItem;
- (HFItemProvider)staticItemProvider;
- (HMHome)home;
- (HUEnergySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (NSDictionary)detailsDict;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setConnectUtilityItem:(id)a3;
- (void)setDetailsDict:(id)a3;
- (void)setGridForecastItem:(id)a3;
- (void)setHasSentUtilityAnalytics:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setUtilityDetailsItem:(id)a3;
- (void)subscriptionChanged:(id)a3;
@end

@implementation HUEnergySettingsItemModule

- (HUEnergySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUEnergySettingsItemModule;
  v8 = [(HFItemModule *)&v12 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    [(HUEnergySettingsItemModule *)v9 _buildItemProviders];
    [(HUEnergySettingsItemModule *)v9 setHasSentUtilityAnalytics:0];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel_subscriptionChanged_ name:@"hasUtilitySubscriptionDidChange" object:0];
  }
  return v9;
}

- (void)_buildItemProviders
{
  v26[3] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F695C0]);
  v25[0] = *MEMORY[0x1E4F68A08];
  v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F69758], "isUsingiCloud") ^ 1);
  v26[0] = v4;
  v25[1] = *MEMORY[0x1E4F68AB8];
  v5 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtility", @"HUEnergySettingsConnectUtility", 1);
  v25[2] = *MEMORY[0x1E4F68A00];
  v26[1] = v5;
  v26[2] = @"plus";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  id v7 = (void *)[v3 initWithResults:v6];
  [(HUEnergySettingsItemModule *)self setConnectUtilityItem:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke;
  v21[3] = &unk_1E6384FD0;
  objc_copyWeak(&v22, &location);
  v9 = (void *)[v8 initWithResultsBlock:v21];
  [(HUEnergySettingsItemModule *)self setUtilityDetailsItem:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2_144;
  v19[3] = &unk_1E6384FD0;
  objc_copyWeak(&v20, &location);
  v11 = (void *)[v10 initWithResultsBlock:v19];
  [(HUEnergySettingsItemModule *)self setGridForecastItem:v11];

  objc_super v12 = [(HUEnergySettingsItemModule *)self connectUtilityItem];
  v24[0] = v12;
  v13 = [(HUEnergySettingsItemModule *)self utilityDetailsItem];
  v24[1] = v13;
  v14 = [(HUEnergySettingsItemModule *)self gridForecastItem];
  v24[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];

  id v16 = objc_alloc(MEMORY[0x1E4F695C8]);
  v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  v18 = (void *)[v16 initWithItems:v17];
  [(HUEnergySettingsItemModule *)self setStaticItemProvider:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained home];
  char v3 = objc_msgSend(v2, "hf_hasUtilitySubscription");

  if (v3) {
    goto LABEL_2;
  }
  v6 = [WeakRetained home];
  char v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator");

  if (_os_feature_enabled_impl())
  {
    if ((v7 & 1) == 0)
    {
LABEL_5:
      id v8 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v36 = *MEMORY[0x1E4F68B10];
      v37[0] = MEMORY[0x1E4F1CC38];
      v9 = (void *)MEMORY[0x1E4F1C9E8];
      id v10 = v37;
      v11 = &v36;
LABEL_13:
      v4 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
      uint64_t v5 = [v8 futureWithResult:v4];
      goto LABEL_14;
    }
  }
  else
  {
    objc_super v12 = [WeakRetained home];
    char v13 = objc_msgSend(v12, "hf_currentUserIsOwner");

    if ((v13 & 1) == 0) {
      goto LABEL_5;
    }
  }
  v14 = [WeakRetained home];
  char v15 = objc_msgSend(v14, "hf_isHomeElectricitySupported");

  if ((v15 & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v34 = *MEMORY[0x1E4F68B10];
    uint64_t v35 = MEMORY[0x1E4F1CC38];
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = &v35;
    v11 = &v34;
    goto LABEL_13;
  }
  id v16 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v17 = [v16 homeManager];
  if ([v17 hasOptedToHH2])
  {
  }
  else
  {
    int v18 = [MEMORY[0x1E4F69758] isUsingiCloud];

    if (v18)
    {
      id v8 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v32 = *MEMORY[0x1E4F68B10];
      uint64_t v33 = MEMORY[0x1E4F1CC38];
      v9 = (void *)MEMORY[0x1E4F1C9E8];
      id v10 = &v33;
      v11 = &v32;
      goto LABEL_13;
    }
  }
  v21 = [WeakRetained home];
  int v22 = objc_msgSend(v21, "hf_cachedHasEnergySite");

  if (!v22)
  {
LABEL_2:
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2;
    v29[3] = &unk_1E6385108;
    v29[4] = WeakRetained;
    v4 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v29];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_4;
    v28[3] = &unk_1E6390768;
    v28[4] = WeakRetained;
    uint64_t v5 = [v4 flatMap:v28];
LABEL_14:
    v19 = (void *)v5;
    goto LABEL_15;
  }
  v23 = (void *)MEMORY[0x1E4F7A0D8];
  v31[0] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = *MEMORY[0x1E4F68AB8];
  v30[0] = @"show-connect-utility-item";
  v30[1] = v24;
  v4 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilityTitle", @"HUEnergySettingsConnectUtilityTitle", 1);
  v31[1] = v4;
  v30[2] = *MEMORY[0x1E4F68990];
  v25 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilityDetail", @"HUEnergySettingsConnectUtilityDetail", 1);
  v31[2] = v25;
  v30[3] = *MEMORY[0x1E4F689F8];
  v26 = HUImageNamed(@"Onboarding-HomeUtilityLogo");
  v31[3] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  v19 = [v23 futureWithResult:v27];

LABEL_15:

  return v19;
}

void __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HUHomeEnergyManagerHelper alloc];
  uint64_t v5 = [*(id *)(a1 + 32) home];
  v6 = [(HUHomeEnergyManagerHelper *)v4 initWithHome:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_3;
  v8[3] = &unk_1E63892F0;
  id v9 = v3;
  id v7 = v3;
  [(HUHomeEnergyManagerHelper *)v6 utilityDetailsWithCompletionHandler:v8];
}

uint64_t __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) home];
  char v5 = objc_msgSend(v4, "hf_cachedHasEnergySite");

  if (v5)
  {
    [*(id *)(a1 + 32) setDetailsDict:v3];
    v6 = [v3 objectForKeyedSubscript:@"utilitySubscriptionID"];

    id v7 = (void *)MEMORY[0x1E4F7A0D8];
    if (v6)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_5;
      v20[3] = &unk_1E6385108;
      id v8 = v3;
      id v21 = v8;
      id v9 = [v7 futureWithBlock:v20];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_124;
      v18[3] = &unk_1E6388A88;
      id v19 = v8;
      id v10 = [v9 flatMap:v18];

      v11 = v21;
    }
    else
    {
      v23[0] = MEMORY[0x1E4F1CC38];
      uint64_t v13 = *MEMORY[0x1E4F68AB8];
      v22[0] = @"show-connect-utility-item";
      v22[1] = v13;
      v11 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilityTitle", @"HUEnergySettingsConnectUtilityTitle", 1);
      v23[1] = v11;
      v22[2] = *MEMORY[0x1E4F68990];
      v14 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilityDetail", @"HUEnergySettingsConnectUtilityDetail", 1);
      v23[2] = v14;
      v22[3] = *MEMORY[0x1E4F689F8];
      char v15 = HUImageNamed(@"Onboarding-HomeUtilityLogo");
      v23[3] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
      id v10 = [v7 futureWithResult:v16];
    }
  }
  else
  {
    objc_super v12 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v24 = *MEMORY[0x1E4F68B10];
    v25[0] = MEMORY[0x1E4F1CC38];
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v10 = [v12 futureWithResult:v11];
  }

  return v10;
}

void __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"utilityArtworkURL"];
  if ([v4 length])
  {
    char v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    v6 = [MEMORY[0x1E4F290E0] sharedSession];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_121;
    v14 = &unk_1E6390740;
    id v15 = v3;
    id v16 = v5;
    id v7 = v5;
    id v8 = [v6 dataTaskWithURL:v7 completionHandler:&v11];

    objc_msgSend(v8, "resume", v11, v12, v13, v14);
  }
  else
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"utilityName"];
      *(_DWORD *)buf = 136315394;
      int v18 = "-[HUEnergySettingsItemModule _buildItemProviders]_block_invoke_5";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "(%s) missing artwork url for %@", buf, 0x16u);
    }
    [v3 finishWithNoResult];
  }
}

void __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_121(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = HFLogForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 136315650;
    __int16 v19 = "-[HUEnergySettingsItemModule _buildItemProviders]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    id v23 = v9;
    v14 = "(%s) error occurred loading artwork url %@: %@";
    id v15 = v10;
    uint32_t v16 = 32;
LABEL_10:
    _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, v16);
    goto LABEL_3;
  }
  uint64_t v11 = [MEMORY[0x1E4F42A80] imageWithData:v7];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    [*(id *)(a1 + 32) finishWithResult:v11];

    goto LABEL_6;
  }
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v18 = 136315394;
    __int16 v19 = "-[HUEnergySettingsItemModule _buildItemProviders]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    v14 = "(%s) could not create image for %@";
    id v15 = v10;
    uint32_t v16 = 22;
    goto LABEL_10;
  }
LABEL_3:

  [*(id *)(a1 + 32) finishWithNoResult];
LABEL_6:
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"isDisconnected"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = _HULocalizedStringWithDefaultValue(@"HUUtilityDetailsUtilityDisconnectedTitle", @"HUUtilityDetailsUtilityDisconnectedTitle", 1);
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"utilityAccountNumber"];
    v14 = HULocalizedStringWithFormat(@"HUEnergySettingsUtilityAccountNumber", @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  }
  id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"utilityName"];
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  objc_opt_class();
  id v16 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  __int16 v19 = v16;
  if (!v18)
  {
    __int16 v19 = HUImageNamed(@"Onboarding-HomeUtilityLogo");
  }
  [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F689F8]];
  __int16 v20 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v20;
}

id __49__HUEnergySettingsItemModule__buildItemProviders__block_invoke_2_144(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsShow_Title", @"HUEnergySettingsShow_Title", 1);
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E4F68B10];
  v4 = NSNumber;
  char v5 = [WeakRetained home];
  int v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "hf_isGridForecastAvailable") ^ 1);
  v10[2] = *MEMORY[0x1E4F68A70];
  v11[1] = v6;
  v11[2] = MEMORY[0x1E4F1CC28];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v8 = [v2 futureWithResult:v7];

  return v8;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUEnergySettingsItemModule *)self staticItemProvider];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_opt_new();
  int v6 = [(HUEnergySettingsItemModule *)self utilityDetailsItem];
  int v7 = [v4 containsObject:v6];

  if (v7 && _os_feature_enabled_impl())
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEnergySettingsUtilityDetailsIdentifier"];
    uint64_t v9 = [(HUEnergySettingsItemModule *)self utilityDetailsItem];
    uint64_t v10 = [v9 latestResults];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"show-connect-utility-item"];
    int v12 = [v11 BOOLValue];

    uint64_t v13 = [(HUEnergySettingsItemModule *)self utilityDetailsItem];
    v14 = (void *)v13;
    if (v12)
    {
      v31[0] = v13;
      id v15 = [(HUEnergySettingsItemModule *)self connectUtilityItem];
      v31[1] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v8 setItems:v16];

      uint64_t v17 = [(HUEnergySettingsItemModule *)self connectUtilityItem];
      id v18 = [v17 latestResults];
      __int16 v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
      int v20 = [v19 BOOLValue];

      if (v20)
      {
        uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilitySignInFooter", @"HUEnergySettingsConnectUtilitySignInFooter", 1);
        [v8 setFooterTitle:v21];
      }
      if (![(HUEnergySettingsItemModule *)self hasSentUtilityAnalytics])
      {
        +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingEntryPointInSettingsViewEvent];
        [(HUEnergySettingsItemModule *)self setHasSentUtilityAnalytics:1];
      }
    }
    else
    {
      uint64_t v30 = v13;
      __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v8 setItems:v22];
    }
    [v5 addObject:v8];
  }
  id v23 = [(HUEnergySettingsItemModule *)self gridForecastItem];
  int v24 = [v4 containsObject:v23];

  if (v24)
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEnergySettingsShowGridSectionIdentifier"];
    v26 = [(HUEnergySettingsItemModule *)self gridForecastItem];
    v29 = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [v25 setItems:v27];

    [v5 addObject:v25];
  }

  return v5;
}

- (void)subscriptionChanged:(id)a3
{
  char v5 = (void *)MEMORY[0x1E4F69230];
  int v6 = (void *)MEMORY[0x1E4F1CAD0];
  int v7 = [(HUEnergySettingsItemModule *)self utilityDetailsItem];
  uint64_t v8 = [v6 setWithObject:v7];
  id v11 = [v5 requestToUpdateItems:v8 senderSelector:a2];

  uint64_t v9 = [(HFItemModule *)self itemUpdater];
  id v10 = (id)[v9 performItemUpdateRequest:v11];
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSDictionary)detailsDict
{
  return self->_detailsDict;
}

- (void)setDetailsDict:(id)a3
{
}

- (HFItem)connectUtilityItem
{
  return self->_connectUtilityItem;
}

- (void)setConnectUtilityItem:(id)a3
{
}

- (HFItem)utilityDetailsItem
{
  return self->_utilityDetailsItem;
}

- (void)setUtilityDetailsItem:(id)a3
{
}

- (HFItem)gridForecastItem
{
  return self->_gridForecastItem;
}

- (void)setGridForecastItem:(id)a3
{
}

- (BOOL)hasSentUtilityAnalytics
{
  return self->_hasSentUtilityAnalytics;
}

- (void)setHasSentUtilityAnalytics:(BOOL)a3
{
  self->_hasSentUtilityAnalytics = a3;
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_gridForecastItem, 0);
  objc_storeStrong((id *)&self->_utilityDetailsItem, 0);
  objc_storeStrong((id *)&self->_connectUtilityItem, 0);
  objc_storeStrong((id *)&self->_detailsDict, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end