@interface HUHomeHubMigrationOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)hasiPadOnlyHub;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (BOOL)shouldBlockMigrationWithAppleTVWarning;
- (BOOL)shouldShowAppleTVWarning;
- (BOOL)shouldShowDeviceWarning;
- (BOOL)shouldShowResidentWarning;
- (BOOL)shouldShowSharedHomeWarning;
- (BOOL)shouldShowUserWarning;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUHomeHubMigrationOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4 devices:(id)a5;
- (NAFuture)onboardingFuture;
- (NSArray)appleTVsToUpdate;
- (NSArray)homePodsToUpdate;
- (NSArray)homes;
- (NSArray)sharedHomes;
- (NSMapTable)homesToUsersMap;
- (NSSet)devices;
- (id)_determineNextViewControllerWithPriorResults:(id)a3;
- (id)processUserInput:(id)a3;
- (unint64_t)upgradeRequirements;
- (void)_checkHomePodResidentUpgradeRequirementsInHome:(id)a3;
- (void)_checkResidentStatusInHome:(id)a3;
- (void)setAppleTVsToUpdate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHasiPadOnlyHub:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHomePodsToUpdate:(id)a3;
- (void)setHomes:(id)a3;
- (void)setHomesToUsersMap:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setSharedHomes:(id)a3;
- (void)setShouldBlockMigrationWithAppleTVWarning:(BOOL)a3;
- (void)setShouldShowAppleTVWarning:(BOOL)a3;
- (void)setShouldShowDeviceWarning:(BOOL)a3;
- (void)setShouldShowResidentWarning:(BOOL)a3;
- (void)setShouldShowSharedHomeWarning:(BOOL)a3;
- (void)setShouldShowUserWarning:(BOOL)a3;
- (void)setUpgradeRequirements:(unint64_t)a3;
@end

@implementation HUHomeHubMigrationOnboardingFlow

- (HUHomeHubMigrationOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4 devices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HUHomeHubMigrationOnboardingFlow;
  v11 = [(HUHomeHubMigrationOnboardingFlow *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    v12->_shouldBlockMigrationWithAppleTVWarning = 0;
    objc_initWeak(&location, v12);
    v13 = [(id)objc_opt_class() needsOnboardingForHome:v12->_home options:v8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke;
    v17[3] = &unk_1E6386CE8;
    objc_copyWeak(&v19, &location);
    id v18 = v10;
    uint64_t v14 = [v13 flatMap:v17];
    onboardingFuture = v12->_onboardingFuture;
    v12->_onboardingFuture = (NAFuture *)v14;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

id __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_2;
  v8[3] = &unk_1E6386CC0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v5 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v11);

  return v6;
}

void __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_2(id *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([a1[4] BOOLValue])
  {
    id v23 = v3;
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[5];
      *(_DWORD *)buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:Received list of devices = [%@]", buf, 0x16u);
    }

    v24 = [MEMORY[0x1E4F1CA80] set];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = a1[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = HFLogForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = [v12 supportsHH2];
            *(_DWORD *)buf = 138412802;
            id v32 = WeakRetained;
            __int16 v33 = 2112;
            v34 = v12;
            __int16 v35 = 1024;
            int v36 = v14;
            _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:device = [%@] supportsHH2 = %{BOOL}d", buf, 0x1Cu);
          }

          if (([v12 supportsHH2] & 1) == 0)
          {
            v15 = [v12 productInfo];
            uint64_t v16 = [v15 productPlatform];

            if (v16 != 4)
            {
              [v24 addObject:v12];
              [WeakRetained setShouldShowDeviceWarning:1];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v9);
    }

    v17 = (void *)[v24 copy];
    [WeakRetained setDevices:v17];

    id v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [WeakRetained devices];
      *(_DWORD *)buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:unsupportedDevices = [%@]", buf, 0x16u);
    }
    v20 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    objc_super v21 = [v20 allHomesFuture];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_6;
    v25[3] = &unk_1E6385620;
    id v26 = WeakRetained;
    id v22 = (id)[v21 flatMap:v25];

    id v3 = v23;
  }
  else
  {
    [v3 finishWithNoResult];
  }
}

id __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  __int16 v33 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v38 = objc_opt_new();
  __int16 v35 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v45;
    uint64_t v36 = *(void *)v45;
    do
    {
      uint64_t v7 = 0;
      uint64_t v37 = v5;
      do
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v44 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(v8, "currentUser", v33);
        int v10 = objc_msgSend(v8, "hf_userIsOwner:", v9);

        if (v10)
        {
          id v11 = objc_opt_new();
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v12 = [v8 users];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            char v15 = 0;
            uint64_t v16 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v41 != v16) {
                  objc_enumerationMutation(v12);
                }
                id v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                if (([v18 supportsSharedHomeHH2AutoMigration] & 1) == 0)
                {
                  char v15 = 1;
                  [*(id *)(a1 + 32) setShouldShowUserWarning:1];
                  [v11 addObject:v18];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v52 count:16];
            }
            while (v14);

            uint64_t v6 = v36;
            uint64_t v5 = v37;
            if (v15) {
              [v33 setObject:v11 forKey:v8];
            }
          }
          else
          {
          }
          [v38 addObject:v8];
          [*(id *)(a1 + 32) _checkResidentStatusInHome:v8];
          [*(id *)(a1 + 32) _checkHomePodResidentUpgradeRequirementsInHome:v8];
        }
        else
        {
          id v19 = [v8 currentUser];
          id v11 = [v8 homeAccessControlForUser:v19];

          if ([v11 isAccessAllowed])
          {
            [*(id *)(a1 + 32) setShouldShowSharedHomeWarning:1];
            [v35 addObject:v8];
          }
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v5);
  }

  v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v21 = *(void **)(a1 + 32);
    id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "upgradeRequirements"));
    *(_DWORD *)buf = 138412546;
    v49 = v21;
    __int16 v50 = 2112;
    v51 = v22;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:upgradeRequirements = [%@]", buf, 0x16u);
  }
  if ([v33 count])
  {
    id v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v49 = v24;
      __int16 v50 = 2112;
      v51 = v33;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@:Found Users that need to upgrade to support HH2: %@", buf, 0x16u);
    }
  }
  v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v38, v33);
  [*(id *)(a1 + 32) setHomes:v25];

  id v26 = [MEMORY[0x1E4F1C978] arrayWithArray:v35];
  [*(id *)(a1 + 32) setSharedHomes:v26];

  [*(id *)(a1 + 32) setHomesToUsersMap:v34];
  long long v27 = [HUHomeHubIntroSetupViewController alloc];
  long long v28 = [*(id *)(a1 + 32) homes];
  long long v29 = [(HUHomeHubIntroSetupViewController *)v27 initWithHomes:v28];

  if ([*(id *)(a1 + 32) upgradeRequirements]
    || ([*(id *)(a1 + 32) shouldShowAppleTVWarning] & 1) != 0
    || ([*(id *)(a1 + 32) shouldShowResidentWarning] & 1) != 0
    || ([*(id *)(a1 + 32) shouldShowDeviceWarning] & 1) != 0
    || ([*(id *)(a1 + 32) shouldShowUserWarning] & 1) != 0)
  {
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v30 = [*(id *)(a1 + 32) shouldShowSharedHomeWarning] ^ 1;
  }
  [(HUHomeHubIntroSetupViewController *)v29 setIsFinalStep:v30];
  [*(id *)(a1 + 32) setInitialViewController:v29];
  v31 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v31;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", MEMORY[0x1E4F1CC38], a4);
}

- (id)processUserInput:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"HUHomeHub2OnboardingKey_UserInput"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"HUHomeHub2OnboardingKey_ErrorDescription"];
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v33 = self;
    __int16 v34 = 2112;
    __int16 v35 = v9;
    __int16 v36 = 2112;
    id v37 = v5;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue]
    && [v6 integerValue] != 1
    && [v6 integerValue] != 2
    && [v6 integerValue] != 3
    && [v6 integerValue] != 9
    && [v6 integerValue] != 4
    && [v6 integerValue] != 5
    && [v6 integerValue] != 6
    && [v6 integerValue] != 8
    && [v6 integerValue] != 7)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HUHomeHubMigrationOnboardingFlow.m", 185, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromIntro) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromDeviceWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromSharedUserWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_DontSetup) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_Done) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromAppleTVWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromResidentWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_MigrationInProgress) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_MigrationSucceeded) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_MigrationFailed)" object file lineNumber description];
  }
  if (![v6 integerValue]
    || [v6 integerValue] == 4
    || [v6 integerValue] == 5
    || [v6 integerValue] == 1
    || [v6 integerValue] == 2)
  {
    int v10 = [(HUHomeHubMigrationOnboardingFlow *)self _determineNextViewControllerWithPriorResults:v5];
LABEL_20:
    id v11 = (HUHomeHubMigrationSuccessViewController *)v10;
    goto LABEL_21;
  }
  if ([v6 integerValue] == 3 || objc_msgSend(v6, "integerValue") == 9)
  {
    uint64_t v13 = [(HUHomeHubMigrationOnboardingFlow *)self onboardingFuture];
    [v13 finishWithNoResult];

LABEL_27:
    id v11 = 0;
    goto LABEL_21;
  }
  if ([v6 integerValue] == 6)
  {
    uint64_t v14 = [HUHomeHubMigrationProgressViewController alloc];
    char v15 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
    uint64_t v16 = [(HUHomeHubMigrationProgressViewController *)v14 initWithOwnedHomes:v15];
LABEL_33:
    id v11 = (HUHomeHubMigrationSuccessViewController *)v16;
    goto LABEL_34;
  }
  if ([v6 integerValue] == 7)
  {
    if (!v7)
    {
      int v10 = objc_alloc_init(HUHomeHubMigrationFailedViewController);
      goto LABEL_20;
    }
    v17 = NSString;
    id v18 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedDescription", @"HUSoftwareUpdateMigrationFailedDescription", 1);
    char v15 = [v17 stringWithFormat:@"%@\n%@", v18, v7];

    uint64_t v16 = [[HUHomeHubMigrationFailedViewController alloc] initWithDetailText:v15];
    goto LABEL_33;
  }
  if ([v6 integerValue] != 8) {
    goto LABEL_27;
  }
  id v19 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
  if ((unint64_t)[v19 count] > 1)
  {
    char v15 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationSuccessDescriptionMultipleHomes", @"HUSoftwareUpdateMigrationSuccessDescriptionMultipleHomes", 1);
  }
  else
  {
    v20 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
    objc_super v21 = [v20 firstObject];
    id v22 = objc_msgSend(v21, "hf_displayName");
    char v15 = HULocalizedStringWithFormat(@"HUSoftwareUpdateMigrationSuccessDescriptionSpecificHome", @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
  }
  long long v29 = [HUHomeHubMigrationSuccessViewController alloc];
  uint64_t v30 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationSuccessTitle", @"HUSoftwareUpdateMigrationSuccessTitle", 1);
  id v11 = [(HUHomeHubMigrationSuccessViewController *)v29 initWithTitle:v30 detailText:v15 symbolName:0];

LABEL_34:
LABEL_21:

  return v11;
}

- (id)_determineNextViewControllerWithPriorResults:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"HUHomeHub2OnboardingKey_UserInput"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"HUUpgradeMultiUserDevicesOnboardingKey_UserInput"];
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 138412546;
    long long v42 = self;
    __int16 v43 = 2112;
    *(void *)long long v44 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:results = [%@]", (uint8_t *)&v41, 0x16u);
  }

  if (!v6 || [v6 integerValue])
  {
    if ([v5 integerValue])
    {
      if ([v5 integerValue] != 4)
      {
        if ([v5 integerValue] != 5)
        {
          if ([v5 integerValue] != 1)
          {
            if ([v5 integerValue] != 2)
            {
LABEL_37:
              id v37 = HFLogForCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v38 = [(HUHomeHubMigrationOnboardingFlow *)self shouldShowUserWarning];
                int v41 = 138412546;
                long long v42 = self;
                __int16 v43 = 1024;
                *(_DWORD *)long long v44 = v38;
                _os_log_impl(&dword_1BE345000, v37, OS_LOG_TYPE_DEFAULT, "%@: _determineNextViewControllerWithPriorResults result is nil. Marking onboarding future as finished. shouldShowUserWarning: %{BOOL}d", (uint8_t *)&v41, 0x12u);
              }

              goto LABEL_40;
            }
            goto LABEL_35;
          }
          goto LABEL_31;
        }
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v8 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
      uint64_t v9 = objc_msgSend(v8, "na_flatMap:", &__block_literal_global_116);
      int v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_50_0);
      [(HUHomeHubMigrationOnboardingFlow *)self setHomePodsToUpdate:v10];

      if ([(HUHomeHubMigrationOnboardingFlow *)self upgradeRequirements])
      {
        id v11 = [(HUHomeHubMigrationOnboardingFlow *)self homePodsToUpdate];
        int v12 = objc_msgSend(v11, "hmf_isEmpty") ^ 1;
      }
      else
      {
        int v12 = 0;
      }
      uint64_t v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(HUHomeHubMigrationOnboardingFlow *)self homePodsToUpdate];
        BOOL v15 = [(HUHomeHubMigrationOnboardingFlow *)self shouldShowResidentWarning];
        BOOL v16 = [(HUHomeHubMigrationOnboardingFlow *)self shouldShowAppleTVWarning];
        int v41 = 138413314;
        long long v42 = self;
        __int16 v43 = 1024;
        *(_DWORD *)long long v44 = v12;
        *(_WORD *)&v44[4] = 2112;
        *(void *)&v44[6] = v14;
        __int16 v45 = 1024;
        BOOL v46 = v15;
        __int16 v47 = 1024;
        BOOL v48 = v16;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: shouldShowUpdateHomePodsView = [%d], homePods = [%@], shouldShowResidentWarning = %{BOOL}d, shouldShowAppleTVWarning = %{BOOL}d", (uint8_t *)&v41, 0x28u);
      }
      v17 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
      id v18 = objc_msgSend(v17, "na_flatMap:", &__block_literal_global_53);
      id v19 = objc_msgSend(v18, "na_filter:", &__block_literal_global_56);
      [(HUHomeHubMigrationOnboardingFlow *)self setAppleTVsToUpdate:v19];

      if (v12)
      {
        v20 = [HUHomeHubUpdateHomePodsViewController alloc];
        objc_super v21 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
        id v22 = [(HUHomeHubMigrationOnboardingFlow *)self homePodsToUpdate];
        uint64_t v23 = [(HUHomeHubUpdateHomePodsViewController *)v20 initWithOwnedHomes:v21 homePodsToUpdate:v22];

        if (v23) {
          goto LABEL_41;
        }
        goto LABEL_37;
      }
      if ([(HUHomeHubMigrationOnboardingFlow *)self shouldShowAppleTVWarning])
      {
        uint64_t v24 = [HUHomeHubAppleTVUpdateWarningViewController alloc];
        uint64_t v25 = [(HUHomeHubMigrationOnboardingFlow *)self appleTVsToUpdate];
        uint64_t v23 = [(HUHomeHubAppleTVUpdateWarningViewController *)v24 initWithAppleTVsToUpdate:v25 shouldBlockMigration:[(HUHomeHubMigrationOnboardingFlow *)self shouldBlockMigrationWithAppleTVWarning]];

        if ([(HUHomeHubMigrationOnboardingFlow *)self shouldShowResidentWarning]) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }
    }
    if (![(HUHomeHubMigrationOnboardingFlow *)self shouldShowResidentWarning])
    {
LABEL_27:
      if (![(HUHomeHubMigrationOnboardingFlow *)self shouldShowDeviceWarning])
      {
LABEL_31:
        if (![(HUHomeHubMigrationOnboardingFlow *)self shouldShowUserWarning])
        {
LABEL_35:
          __int16 v33 = [HUHomeHubSharedHomeWarningViewController alloc];
          __int16 v34 = (void *)MEMORY[0x1E4F1CAD0];
          __int16 v35 = [(HUHomeHubMigrationOnboardingFlow *)self sharedHomes];
          __int16 v36 = [v34 setWithArray:v35];
          uint64_t v23 = [(HUHomeHubSharedHomeWarningViewController *)v33 initWithSharedHomes:v36];

          id v32 = v23;
          uint64_t v29 = 1;
LABEL_36:
          [(HUHomeHubResidentWarningViewController *)v32 setIsFinalStep:v29];
          if (v23) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        uint64_t v30 = [HUHomeHubSharedUserWarningViewController alloc];
        v31 = [(HUHomeHubMigrationOnboardingFlow *)self homesToUsersMap];
        uint64_t v23 = [(HUHomeHubSharedUserWarningViewController *)v30 initWithHomesToUsersMap:v31];

        goto LABEL_33;
      }
      uint64_t v26 = [HUHomeHubPersonalDeviceWarningViewController alloc];
      uint64_t v27 = [(HUHomeHubMigrationOnboardingFlow *)self devices];
      uint64_t v28 = [(HUHomeHubMigrationOnboardingFlow *)self homes];
      uint64_t v23 = [(HUHomeHubPersonalDeviceWarningViewController *)v26 initWithDevices:v27 homes:v28];

LABEL_29:
      if (![(HUHomeHubMigrationOnboardingFlow *)self shouldShowUserWarning])
      {
LABEL_33:
        uint64_t v29 = [(HUHomeHubMigrationOnboardingFlow *)self shouldShowSharedHomeWarning] ^ 1;
        goto LABEL_34;
      }
LABEL_30:
      uint64_t v29 = 0;
LABEL_34:
      id v32 = v23;
      goto LABEL_36;
    }
    uint64_t v23 = [[HUHomeHubResidentWarningViewController alloc] initWithiPadOnlyHub:[(HUHomeHubMigrationOnboardingFlow *)self hasiPadOnlyHub]];
LABEL_25:
    if ([(HUHomeHubMigrationOnboardingFlow *)self shouldShowDeviceWarning]) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_HomeHub2Migration_FinishedOnboarding"];
LABEL_40:
  v39 = [(HUHomeHubMigrationOnboardingFlow *)self onboardingFuture];
  [v39 finishWithNoResult];

  uint64_t v23 = 0;
LABEL_41:

  return v23;
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_homePods");
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 device];
  uint64_t v3 = [v2 supportsHH2] ^ 1;

  return v3;
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke_51(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_appleTVs");
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke_2_54(uint64_t a1, void *a2)
{
  v2 = [a2 device];
  uint64_t v3 = [v2 supportsHH2] ^ 1;

  return v3;
}

- (void)_checkHomePodResidentUpgradeRequirementsInHome:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = HFPreferencesBoolForKey();
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = self;
    __int16 v19 = 2048;
    unint64_t v20 = [(HUHomeHubMigrationOnboardingFlow *)self upgradeRequirements];
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: upgradeRequirements = [%lu]", buf, 0x16u);
  }

  if (v5)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Bypassing HomePod software version check for HH2 because the override is enabled", buf, 2u);
    }

    uint64_t v8 = self;
    uint64_t v9 = 0;
LABEL_7:
    [(HUHomeHubMigrationOnboardingFlow *)v8 setUpgradeRequirements:v9];
    goto LABEL_9;
  }
  if (![(HUHomeHubMigrationOnboardingFlow *)self upgradeRequirements])
  {
    int v10 = [v4 residentDevices];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      int v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v4 residentDevices];
        *(_DWORD *)buf = 138412802;
        id v18 = self;
        __int16 v19 = 2112;
        unint64_t v20 = (unint64_t)v13;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@: residentDevices = [%@] in home: [%@]", buf, 0x20u);
      }
      uint64_t v14 = [v4 residentDevices];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __83__HUHomeHubMigrationOnboardingFlow__checkHomePodResidentUpgradeRequirementsInHome___block_invoke;
      v16[3] = &unk_1E638AE60;
      v16[4] = self;
      int v15 = objc_msgSend(v14, "na_allObjectsPassTest:", v16);

      uint64_t v9 = v15 ^ 1u;
      uint64_t v8 = self;
      goto LABEL_7;
    }
  }
LABEL_9:
}

uint64_t __83__HUHomeHubMigrationOnboardingFlow__checkHomePodResidentUpgradeRequirementsInHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 device];
    uint64_t v7 = [v3 device];
    int v11 = 138412802;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = [v7 supportsHH2];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: residentDevice = [%@] supportsHH2 = [%d]", (uint8_t *)&v11, 0x1Cu);
  }
  uint64_t v8 = [v3 device];
  if ([v8 supportsHH2] & 1) != 0 || (objc_msgSend(v3, "hf_isResidentAppleTV")) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = objc_msgSend(v3, "hf_isResidentiPad");
  }

  return v9;
}

- (void)_checkResidentStatusInHome:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(HUHomeHubMigrationOnboardingFlow *)self shouldShowResidentWarning])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [v5 residentDevices];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = objc_msgSend(v8, "na_filter:", &__block_literal_global_66_2);

    int v10 = (void *)MEMORY[0x1E4F1CAD0];
    int v11 = [v5 residentDevices];
    uint64_t v12 = [v10 setWithArray:v11];
    __int16 v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_68);

    if ([v9 count])
    {
      uint64_t v14 = [v9 count];
      __int16 v15 = [v5 residentDevices];
      BOOL v16 = v14 == [v15 count];
    }
    else
    {
      BOOL v16 = 0;
    }
    uint64_t v17 = [v5 residentDevices];
    uint64_t v18 = [v17 count];

    BOOL v19 = (objc_msgSend(v5, "hf_hasAppleTVs") & 1) == 0 && objc_msgSend(v13, "count") != 0;
    if (v18) {
      int v20 = v16;
    }
    else {
      int v20 = 1;
    }
    uint64_t v21 = v20 | v19;
    if (v21 == 1) {
      -[HUHomeHubMigrationOnboardingFlow setHasiPadOnlyHub:](self, "setHasiPadOnlyHub:", [v9 count] != 0);
    }
    [(HUHomeHubMigrationOnboardingFlow *)self setShouldShowResidentWarning:v21];
    id v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = NSStringFromSelector(a2);
      uint64_t v24 = [v9 count];
      uint64_t v25 = [v5 residentDevices];
      *(_DWORD *)buf = 138413314;
      *(void *)v58 = v23;
      *(_WORD *)&v58[8] = 2112;
      id v59 = v5;
      __int16 v60 = 2048;
      uint64_t v61 = v24;
      __int16 v62 = 2112;
      v63 = v9;
      __int16 v64 = 2048;
      uint64_t v65 = [v25 count];
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@ - home = %@, number of ipad resident devices = %lu, iPadResidentDevices = %@, number of total residents = %lu.", buf, 0x34u);
    }
  }
  if (![(HUHomeHubMigrationOnboardingFlow *)self shouldBlockMigrationWithAppleTVWarning])
  {
    uint64_t v26 = objc_msgSend(v5, "hf_appleTVs");
    uint64_t v27 = objc_msgSend(v26, "na_map:", &__block_literal_global_72);

    uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = [v5 residentDevices];
    uint64_t v30 = [v28 setWithArray:v29];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_2_73;
    v55[3] = &unk_1E638AE60;
    id v31 = v27;
    id v56 = v31;
    id v32 = objc_msgSend(v30, "na_filter:", v55);

    __int16 v33 = objc_msgSend(v32, "na_filter:", &__block_literal_global_75);
    __int16 v34 = objc_msgSend(v5, "hf_homePods");
    __int16 v35 = objc_msgSend(v34, "na_map:", &__block_literal_global_77_0);

    __int16 v36 = (void *)MEMORY[0x1E4F1CAD0];
    id v37 = [v5 residentDevices];
    BOOL v38 = [v36 setWithArray:v37];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_5;
    v53[3] = &unk_1E638AE60;
    id v54 = v35;
    id v52 = v35;
    v39 = objc_msgSend(v38, "na_filter:", v53);

    if ([v33 count])
    {
      id v51 = v31;
      long long v40 = a2;
      [(HUHomeHubMigrationOnboardingFlow *)self setShouldShowAppleTVWarning:1];
      uint64_t v41 = [v33 count];
      uint64_t v42 = [v32 count];
      unsigned int v43 = objc_msgSend(v39, "hmf_isEmpty");
      long long v44 = HFLogForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v58 = v41 != v42;
        *(_WORD *)&v58[4] = 1024;
        *(_DWORD *)&v58[6] = v43 ^ 1;
        _os_log_impl(&dword_1BE345000, v44, OS_LOG_TYPE_DEFAULT, "hasHH2SupportedAppleTV = %d, hasHH2SupportedHomePod = %d", buf, 0xEu);
      }

      if (v41 == v42) {
        uint64_t v45 = v43;
      }
      else {
        uint64_t v45 = 0;
      }
      [(HUHomeHubMigrationOnboardingFlow *)self setShouldBlockMigrationWithAppleTVWarning:v45];
      a2 = v40;
      id v31 = v51;
    }
    BOOL v46 = HFLogForCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v47 = NSStringFromSelector(a2);
      uint64_t v48 = [v33 count];
      uint64_t v49 = [v32 count];
      BOOL v50 = [(HUHomeHubMigrationOnboardingFlow *)self shouldBlockMigrationWithAppleTVWarning];
      *(_DWORD *)buf = 138413570;
      *(void *)v58 = v47;
      *(_WORD *)&v58[8] = 2112;
      id v59 = v5;
      __int16 v60 = 2048;
      uint64_t v61 = v48;
      __int16 v62 = 2112;
      v63 = v33;
      __int16 v64 = 2048;
      uint64_t v65 = v49;
      __int16 v66 = 1024;
      BOOL v67 = v50;
      _os_log_impl(&dword_1BE345000, v46, OS_LOG_TYPE_DEFAULT, "%@ - home = %@, number of Apple TV resident devices that need a software update = %lu, appleTVResidentDevicesToUpdate = %@, number of total Apple TV residents = %lu, blocking migration = %d", buf, 0x3Au);
    }
  }
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isResidentiPad");
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isResidentAppleTV"))
  {
    id v3 = [v2 device];
    uint64_t v4 = [v3 supportsHH2] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_69(uint64_t a1, void *a2)
{
  id v2 = [a2 device];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_2_73(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 device];
  id v5 = [v4 uniqueIdentifier];
  LODWORD(v2) = [v2 containsObject:v5];

  LODWORD(v4) = objc_msgSend(v3, "hf_isResidentAppleTV");
  return v4 & v2;
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 device];
  uint64_t v3 = [v2 supportsHH2] ^ 1;

  return v3;
}

id __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 device];
  uint64_t v3 = [v2 uniqueIdentifier];

  return v3;
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 device];
  uint64_t v6 = [v5 uniqueIdentifier];
  int v7 = [v4 containsObject:v6];

  if (objc_msgSend(v3, "hf_isResidentiPad") & 1) != 0 || (objc_msgSend(v3, "hf_isResidentAppleTV"))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [v3 device];
    uint64_t v8 = [v9 supportsHH2] & v7;
  }
  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (NSArray)sharedHomes
{
  return self->_sharedHomes;
}

- (void)setSharedHomes:(id)a3
{
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)homePodsToUpdate
{
  return self->_homePodsToUpdate;
}

- (void)setHomePodsToUpdate:(id)a3
{
}

- (NSArray)appleTVsToUpdate
{
  return self->_appleTVsToUpdate;
}

- (void)setAppleTVsToUpdate:(id)a3
{
}

- (BOOL)hasiPadOnlyHub
{
  return self->_hasiPadOnlyHub;
}

- (void)setHasiPadOnlyHub:(BOOL)a3
{
  self->_hasiPadOnlyHub = a3;
}

- (BOOL)shouldShowResidentWarning
{
  return self->_shouldShowResidentWarning;
}

- (void)setShouldShowResidentWarning:(BOOL)a3
{
  self->_shouldShowResidentWarning = a3;
}

- (BOOL)shouldShowAppleTVWarning
{
  return self->_shouldShowAppleTVWarning;
}

- (void)setShouldShowAppleTVWarning:(BOOL)a3
{
  self->_shouldShowAppleTVWarning = a3;
}

- (BOOL)shouldBlockMigrationWithAppleTVWarning
{
  return self->_shouldBlockMigrationWithAppleTVWarning;
}

- (void)setShouldBlockMigrationWithAppleTVWarning:(BOOL)a3
{
  self->_shouldBlockMigrationWithAppleTVWarning = a3;
}

- (BOOL)shouldShowUserWarning
{
  return self->_shouldShowUserWarning;
}

- (void)setShouldShowUserWarning:(BOOL)a3
{
  self->_shouldShowUserWarning = a3;
}

- (BOOL)shouldShowDeviceWarning
{
  return self->_shouldShowDeviceWarning;
}

- (void)setShouldShowDeviceWarning:(BOOL)a3
{
  self->_shouldShowDeviceWarning = a3;
}

- (BOOL)shouldShowSharedHomeWarning
{
  return self->_shouldShowSharedHomeWarning;
}

- (void)setShouldShowSharedHomeWarning:(BOOL)a3
{
  self->_shouldShowSharedHomeWarning = a3;
}

- (unint64_t)upgradeRequirements
{
  return self->_upgradeRequirements;
}

- (void)setUpgradeRequirements:(unint64_t)a3
{
  self->_upgradeRequirements = a3;
}

- (NSMapTable)homesToUsersMap
{
  return self->_homesToUsersMap;
}

- (void)setHomesToUsersMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homesToUsersMap, 0);
  objc_storeStrong((id *)&self->_appleTVsToUpdate, 0);
  objc_storeStrong((id *)&self->_homePodsToUpdate, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_sharedHomes, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end