@interface HUHomeHubMigrationBannerItem
- (HUHomeHubMigrationBannerItem)initWithHome:(id)a3;
- (NSSet)devices;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUHomeHubMigrationBannerItem

- (HUHomeHubMigrationBannerItem)initWithHome:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUHomeHubMigrationBannerItem;
  v3 = [(HUBannerItem *)&v9 initWithHome:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v5 = [v4 homeManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__HUHomeHubMigrationBannerItem_initWithHome___block_invoke;
    v7[3] = &unk_1E6389828;
    v8 = v3;
    [v5 fetchDevicesWithCompletionHandler:v7];
  }
  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F7A0D8];
    v7 = (void *)MEMORY[0x1E4F69228];
    uint64_t v30 = *MEMORY[0x1E4F68B10];
    v31[0] = MEMORY[0x1E4F1CC38];
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    objc_super v9 = [v7 outcomeWithResults:v8];
    v10 = [v6 futureWithResult:v9];
  }
  else
  {
    v11 = [(HUBannerItem *)self home];
    int v12 = objc_msgSend(v11, "hf_canUpdateToHH2");

    v13 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v14 = v13;
    if (v12)
    {
      objc_super v9 = [v13 allHomesFuture];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__HUHomeHubMigrationBannerItem__subclass_updateWithOptions___block_invoke;
      v21[3] = &unk_1E6385620;
      v21[4] = self;
      v10 = [v9 flatMap:v21];
      v8 = v14;
    }
    else
    {
      v8 = [v13 homeManager];

      v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(HUBannerItem *)self home];
        *(_DWORD *)buf = 67109632;
        int v25 = objc_msgSend(v16, "hf_currentUserIsOwner");
        __int16 v26 = 1024;
        int v27 = [v8 isHH2MigrationAvailable];
        __int16 v28 = 1024;
        int v29 = [v8 hasOptedToHH2];
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Should show HH2 migration banner?:NO Owner:%{BOOL}d migrationAvailable:%{BOOL}d userAlreadyOptedIn:%{BOOL}d. Skipping all additional checks.", buf, 0x14u);
      }
      v17 = (void *)MEMORY[0x1E4F7A0D8];
      v18 = (void *)MEMORY[0x1E4F69228];
      uint64_t v22 = *MEMORY[0x1E4F68B10];
      uint64_t v23 = MEMORY[0x1E4F1CC38];
      objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v19 = [v18 outcomeWithResults:v9];
      v10 = [v17 futureWithResult:v19];
    }
  }

  return v10;
}

void __45__HUHomeHubMigrationBannerItem_initWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      v8 = [v7 homeManager];
      int v11 = 138412290;
      int v12 = v8;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch owner devices for homeManager: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v5;
}

id __60__HUHomeHubMigrationBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v64 = objc_opt_new();
  v62 = v2;
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_168);
  v4 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v71 objects:v88 count:16];
  v65 = v5;
  v66 = v4;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v72;
    LOBYTE(v9) = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * i), "hf_homePods");
        objc_msgSend(v4, "na_safeAddObjectsFromArray:", v11);
        if (v9)
        {
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v87 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v68;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v68 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = [*(id *)(*((void *)&v67 + 1) + 8 * j) device];
                int v18 = [v17 supportsHH2];

                if (!v18)
                {
                  int v9 = 0;
                  goto LABEL_18;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v87 count:16];
              if (v14) {
                continue;
              }
              break;
            }
            int v9 = 1;
LABEL_18:
            id v5 = v65;
            v4 = v66;
          }
          else
          {
            int v9 = 1;
          }
        }
        else
        {
          int v9 = 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v71 objects:v88 count:16];
    }
    while (v7);
  }
  else
  {
    int v9 = 1;
  }

  v19 = [*(id *)(a1 + 32) home];
  char v20 = objc_msgSend(v19, "hf_canUpdateToHH2");

  if (v20)
  {
    v21 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateHomeKitUpdateAvailable", @"HUSoftwareUpdateHomeKitUpdateAvailable", 1);
    [v64 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v64 setObject:@"Home.Banners.Migration.HomeUpgradeRecommended" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    if ((unint64_t)[v5 count] <= 1) {
      uint64_t v22 = @"HUSoftwareUpdateImproveReliabilityAndPerformance";
    }
    else {
      uint64_t v22 = @"HUSoftwareUpdateImproveReliabilityAndPerformancePlural";
    }
    uint64_t v23 = _HULocalizedStringWithDefaultValue(v22, v22, 1);
    [v64 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v24 = _HULocalizedStringWithDefaultValue(@"HULearnMoreTitle", @"HULearnMoreTitle", 1);
    [v64 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    int v25 = (void *)MEMORY[0x1E4F42A98];
    __int16 v26 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    uint64_t v27 = [v25 configurationWithHierarchicalColor:v26];

    __int16 v28 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
    v61 = (void *)v27;
    int v29 = [v28 configurationByApplyingConfiguration:v27];
    v60 = (void *)[objc_alloc(MEMORY[0x1E4F69600]) initWithSystemImageName:@"homekit" configuration:v29];
    v59 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSymbolIconConfiguration:v60];
    objc_msgSend(v64, "setObject:forKeyedSubscript:");
    v58 = (void *)[objc_alloc(MEMORY[0x1E4F695B0]) initWithAccessories:v66];
    uint64_t v30 = [v58 softwareUpdatesInProgress];
    id v31 = objc_alloc(MEMORY[0x1E4F69710]);
    v32 = [*(id *)(a1 + 32) home];
    v33 = [*(id *)(a1 + 32) home];
    v34 = [v33 currentUser];
    v35 = (void *)[v31 initWithHome:v32 user:v34 nameStyle:0];

    v57 = v35;
    int v36 = [v35 hasDismissedHomeHubMigrationBanner];
    v37 = [*(id *)(a1 + 32) home];
    int v38 = objc_msgSend(v37, "hf_canUpdateToHH2");
    if (v30) {
      int v39 = 0;
    }
    else {
      int v39 = v38;
    }
    int v40 = v9 & (v36 ^ 1) & v39;

    v41 = HFLogForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [*(id *)(a1 + 32) home];
      int v43 = objc_msgSend(v42, "hf_canUpdateToHH2");
      *(_DWORD *)buf = 67110144;
      int v76 = v40;
      __int16 v77 = 1024;
      int v78 = v43;
      __int16 v79 = 1024;
      BOOL v80 = v30 != 0;
      __int16 v81 = 1024;
      int v82 = v36;
      __int16 v83 = 1024;
      int v84 = v9;
      _os_log_impl(&dword_1BE345000, v41, OS_LOG_TYPE_DEFAULT, "Should show HH2 migration banner?: %{BOOL}d | hf_canUpdateToHH2=%{BOOL}d | hasHomePodsUpdating=%{BOOL}d | hasDismissedBanner=%{BOOL}d | allHomePodsSupportHH2=%{BOOL}d", buf, 0x20u);
    }
    v44 = [NSNumber numberWithInt:v40 ^ 1u];
    v45 = v64;
    [v64 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

    v46 = [MEMORY[0x1E4F7A0D8] futureWithResult:v64];

    v47 = v61;
  }
  else
  {
    v48 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v47 = [v48 homeManager];

    v49 = HFLogForCategory();
    v45 = v64;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [*(id *)(a1 + 32) home];
      int v51 = objc_msgSend(v50, "hf_currentUserIsOwner");
      int v52 = [v47 isHH2MigrationAvailable];
      int v53 = [v47 hasOptedToHH2];
      *(_DWORD *)buf = 67109632;
      int v76 = v51;
      __int16 v77 = 1024;
      int v78 = v52;
      __int16 v79 = 1024;
      BOOL v80 = v53;
      _os_log_impl(&dword_1BE345000, v49, OS_LOG_TYPE_DEFAULT, "Should show HH2 migration banner?:NO Owner:%{BOOL}d migrationAvailable:%{BOOL}d userAlreadyOptedIn:%{BOOL}d. Skipping user defaults and software update checks.", buf, 0x14u);
    }
    v54 = (void *)MEMORY[0x1E4F7A0D8];
    v55 = (void *)MEMORY[0x1E4F69228];
    uint64_t v85 = *MEMORY[0x1E4F68B10];
    uint64_t v86 = MEMORY[0x1E4F1CC38];
    __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    int v29 = [v55 outcomeWithResults:v28];
    v46 = [v54 futureWithResult:v29];
  }

  return v46;
}

uint64_t __60__HUHomeHubMigrationBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 currentUser];
  uint64_t v4 = objc_msgSend(v2, "hf_userIsOwner:", v3);

  return v4;
}

- (NSSet)devices
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
}

@end