@interface HUSoftwareUpdateUIManager
+ (id)sharedManager;
- (BOOL)_shouldPresentTermsAndConditionsForSoftwareLicenseAgreementVersion:(id)a3 home:(id)a4;
- (BOOL)isLicensePresentationNecessaryForSoftwareUpdate:(id)a3 error:(id *)a4;
- (HUSoftwareUpdateUIManager)init;
- (NSMapTable)homeBackgroundCheckMapTable;
- (id)_fetchAvailableUpdatesForAccessories:(id)a3 options:(unint64_t)a4;
- (id)_markTermsAndConditionsAsReadForLicenseAgreementVersion:(id)a3 inHome:(id)a4;
- (id)fetchAvailableUpdatesForAccessories:(id)a3 options:(unint64_t)a4;
- (id)fetchAvailableUpdatesForHome:(id)a3 options:(unint64_t)a4;
- (id)presentLicensesIfNeededForSoftwareUpdate:(id)a3 presentationDelegate:(id)a4;
- (id)startUpdateForAccessory:(id)a3 presentationDelegate:(id)a4;
- (id)startUpdatesForAccessories:(id)a3 presentationDelegate:(id)a4;
- (id)startUpdatesForAllAccessoriesInHome:(id)a3 presentationDelegate:(id)a4;
- (int64_t)numberOfAccessoriesWithAvailableUpdates:(id)a3;
- (int64_t)numberOfAccessoriesWithAvailableUpdatesInHome:(id)a3;
- (void)executionEnvironmentDidEnterBackground:(id)a3;
- (void)startSilentBackgroundCheckForHome:(id)a3;
@end

@implementation HUSoftwareUpdateUIManager

+ (id)sharedManager
{
  if (qword_1EBA47788 != -1) {
    dispatch_once(&qword_1EBA47788, &__block_literal_global_9);
  }
  v2 = (void *)_MergedGlobals_612;

  return v2;
}

void __42__HUSoftwareUpdateUIManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HUSoftwareUpdateUIManager);
  v1 = (void *)_MergedGlobals_612;
  _MergedGlobals_612 = (uint64_t)v0;
}

- (HUSoftwareUpdateUIManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HUSoftwareUpdateUIManager;
  v2 = [(HUSoftwareUpdateUIManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    homeBackgroundCheckMapTable = v2->_homeBackgroundCheckMapTable;
    v2->_homeBackgroundCheckMapTable = (NSMapTable *)v3;

    v5 = [MEMORY[0x1E4F69138] sharedInstance];
    [v5 addObserver:v2];
  }
  return v2;
}

- (void)startSilentBackgroundCheckForHome:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 41, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v6 = [(HUSoftwareUpdateUIManager *)self homeBackgroundCheckMapTable];
  objc_super v7 = [v6 objectForKey:v5];

  v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      v11 = objc_msgSend(v5, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "[FETCH] Begin executing background check for software updates: %@", buf, 0xCu);
    }
    v8 = [(HUSoftwareUpdateUIManager *)self fetchAvailableUpdatesForHome:v5 options:1];
    v10 = [(HUSoftwareUpdateUIManager *)self homeBackgroundCheckMapTable];
    [v10 setObject:v8 forKey:v5];
    goto LABEL_9;
  }
  if (v9)
  {
    v10 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "[FETCH] Background check for software update already performed: %@", buf, 0xCu);
LABEL_9:
  }
}

- (id)fetchAvailableUpdatesForHome:(id)a3 options:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "hf_prettyDescription");
    int v12 = 136315394;
    v13 = "-[HUSoftwareUpdateUIManager fetchAvailableUpdatesForHome:options:]";
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "[FETCH] %s: %@", (uint8_t *)&v12, 0x16u);
  }
  BOOL v9 = [v6 accessoriesSupportingSoftwareUpdate];
  v10 = [(HUSoftwareUpdateUIManager *)self _fetchAvailableUpdatesForAccessories:v9 options:a4];

  return v10;
}

- (id)fetchAvailableUpdatesForAccessories:(id)a3 options:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(a3, "na_filter:", &__block_literal_global_13);
  objc_super v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "hf_prettyDescription");
    int v11 = 136315394;
    int v12 = "-[HUSoftwareUpdateUIManager fetchAvailableUpdatesForAccessories:options:]";
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "[FETCH] %s: %@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = [(HUSoftwareUpdateUIManager *)self _fetchAvailableUpdatesForAccessories:v6 options:a4];

  return v9;
}

uint64_t __73__HUSoftwareUpdateUIManager_fetchAvailableUpdatesForAccessories_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsSoftwareUpdate");
}

- (id)_fetchAvailableUpdatesForAccessories:(id)a3 options:(unint64_t)a4
{
  id v5 = [a3 allObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke;
  v12[3] = &__block_descriptor_40_e21__16__0__HMAccessory_8l;
  v12[4] = a4;
  id v6 = objc_msgSend(v5, "na_map:", v12);

  objc_super v7 = (void *)MEMORY[0x1E4F7A0D8];
  v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  BOOL v9 = [v7 combineAllFutures:v6 ignoringErrors:1 scheduler:v8];
  v10 = [v9 flatMap:&__block_literal_global_19];

  return v10;
}

uint64_t __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_fetchAvailableSoftwareUpdateWithOptions:", *(void *)(a1 + 32));
}

id __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "na_filter:", &__block_literal_global_22);
  if ([v2 count])
  {
    if ([v2 count] == 1)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F7A0D8];
      v4 = [v2 firstObject];
      id v5 = [v3 futureWithError:v4];
    }
    else
    {
      id v6 = [v2 firstObject];
      objc_super v7 = [v6 userInfo];
      if (v7)
      {
        v8 = [v6 userInfo];
        BOOL v9 = (void *)[v8 mutableCopy];
      }
      else
      {
        BOOL v9 = [MEMORY[0x1E4F1CA60] dictionary];
      }

      [v9 removeObjectForKey:*MEMORY[0x1E4F68420]];
      v10 = (void *)MEMORY[0x1E4F28C58];
      int v11 = [v6 domain];
      int v12 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v6, "code"), v9);

      id v5 = [MEMORY[0x1E4F7A0D8] futureWithError:v12];
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v5;
}

uint64_t __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)numberOfAccessoriesWithAvailableUpdates:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "na_filter:", &__block_literal_global_26);
  int64_t v4 = [v3 count];

  return v4;
}

uint64_t __69__HUSoftwareUpdateUIManager_numberOfAccessoriesWithAvailableUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isReadyToInstallSoftwareUpdate")) {
    uint64_t v3 = objc_msgSend(v2, "hf_hasNewValidSoftwareUpdate");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (int64_t)numberOfAccessoriesWithAvailableUpdatesInHome:(id)a3
{
  int64_t v4 = [a3 accessoriesSupportingSoftwareUpdate];
  int64_t v5 = [(HUSoftwareUpdateUIManager *)self numberOfAccessoriesWithAvailableUpdates:v4];

  return v5;
}

- (id)startUpdatesForAccessories:(id)a3 presentationDelegate:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 111, @"Invalid parameter not satisfying: %@", @"accessories.count > 0" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 112, @"Invalid parameter not satisfying: %@", @"presentationDelegate" object file lineNumber description];

LABEL_3:
  BOOL v9 = objc_opt_new();
  v10 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke;
  v27[3] = &unk_1E63855F8;
  id v11 = v9;
  id v28 = v11;
  id v12 = v10;
  id v29 = v12;
  objc_msgSend(v7, "na_each:", v27);
  __int16 v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = objc_msgSend(v7, "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412290;
    v31 = v14;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Requested updates: %@", buf, 0xCu);
  }
  uint64_t v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend(v11, "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412290;
    v31 = v16;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Ready to install updates: %@", buf, 0xCu);
  }
  if ([v11 count])
  {
    v17 = objc_msgSend(MEMORY[0x1E4F2E4F8], "hf_softwareUpdateComparator");
    v18 = [v12 sortedArrayUsingComparator:v17];

    v19 = [v18 lastObject];
    v20 = [(HUSoftwareUpdateUIManager *)self presentLicensesIfNeededForSoftwareUpdate:v19 presentationDelegate:v8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_36;
    v25[3] = &unk_1E6385648;
    id v26 = v11;
    v21 = [v20 flatMap:v25];
  }
  else
  {
    v21 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v21;
}

void __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_hasNewValidSoftwareUpdate"))
  {
    if (objc_msgSend(v3, "hf_isReadyToInstallSoftwareUpdate"))
    {
      [*(id *)(a1 + 32) addObject:v3];
      if (objc_msgSend(v3, "hf_isHomePod")) {
        [*(id *)(a1 + 40) addObject:v3];
      }
    }
  }
}

id __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_36(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_38);
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  int64_t v4 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  int64_t v5 = [v3 combineAllFutures:v2 ignoringErrors:1 scheduler:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_3;
  v8[3] = &unk_1E6385620;
  id v9 = *(id *)(a1 + 32);
  id v6 = [v5 flatMap:v8];

  return v6;
}

uint64_t __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_startSoftwareUpdate");
}

id __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a2, "na_filter:", &__block_literal_global_40);
  if ([v3 count])
  {
    int64_t v4 = [v3 firstObject];
    int64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "[START UPDATE] Start update failed for some accessories: %@ %@", buf, 0x16u);
    }
    uint64_t v13 = *MEMORY[0x1E4F68430];
    uint64_t v14 = *MEMORY[0x1E4F68818];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v7 = objc_msgSend(v4, "hf_errorWithAddedUserInfo:", v6);

    id v8 = [MEMORY[0x1E4F7A0D8] futureWithError:v7];
  }
  else
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Start update succeeded for all accessories: %@", buf, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v8;
}

uint64_t __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)startUpdatesForAllAccessoriesInHome:(id)a3 presentationDelegate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 174, @"Invalid parameter not satisfying: %@", @"presentationDelegate" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 175, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

LABEL_3:
  id v9 = [v7 accessoriesSupportingSoftwareUpdate];
  if ([v9 count])
  {
    uint64_t v10 = [(HUSoftwareUpdateUIManager *)self startUpdatesForAccessories:v9 presentationDelegate:v8];
  }
  else
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_msgSend(v7, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "[START UPDATE] No accessories supporting software update: %@", buf, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  uint64_t v13 = (void *)v10;

  return v13;
}

- (id)startUpdateForAccessory:(id)a3 presentationDelegate:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  id v9 = [(HUSoftwareUpdateUIManager *)self startUpdatesForAccessories:v8 presentationDelegate:v7];

  return v9;
}

- (BOOL)isLicensePresentationNecessaryForSoftwareUpdate:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 195, @"Invalid parameter not satisfying: %@", @"accessory" object file lineNumber description];
  }
  id v8 = objc_msgSend(v7, "hf_softwareUpdateDocumentation");
  id v9 = [v8 licenseAgreementVersion];
  uint64_t v10 = [v8 licenseAgreement];
  if (v10)
  {
    if (v8)
    {
      id v11 = [v7 home];
      BOOL v12 = [(HUSoftwareUpdateUIManager *)self _shouldPresentTermsAndConditionsForSoftwareLicenseAgreementVersion:v9 home:v11];

      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(v7, "hf_prettyExpensiveDescription");
    NSLog(&cfstr_StartUpdateCan.isa, v8, v13);
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend(v7, "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Cannot start update due to nil license and/or documentation: %@ %@", buf, 0x16u);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 26);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)presentLicensesIfNeededForSoftwareUpdate:(id)a3 presentationDelegate:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (objc_msgSend(v6, "hf_isHomePod") & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
    goto LABEL_13;
  }
  id v30 = 0;
  BOOL v8 = [(HUSoftwareUpdateUIManager *)self isLicensePresentationNecessaryForSoftwareUpdate:v6 error:&v30];
  id v9 = v30;
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithError:v9];
LABEL_11:
    id v11 = (void *)v10;
    goto LABEL_12;
  }
  if (!v8)
  {
    uint64_t v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = objc_msgSend(v6, "hf_prettyExpensiveDescription");
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v20;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Not showing license for SW update (%@) because the user has already agreed.", (uint8_t *)location, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
    goto LABEL_11;
  }
  BOOL v12 = objc_msgSend(v6, "hf_softwareUpdateDocumentation");
  uint64_t v13 = [v12 licenseAgreementVersion];
  uint64_t v14 = [v12 licenseAgreement];
  objc_initWeak(location, self);
  uint64_t v15 = (void *)MEMORY[0x1E4F7A0D8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke;
  v22[3] = &unk_1E6385710;
  id v16 = v12;
  id v23 = v16;
  id v24 = v6;
  id v17 = v14;
  id v25 = v17;
  objc_copyWeak(&v29, location);
  id v18 = v13;
  id v26 = v18;
  id v27 = v7;
  id v28 = self;
  id v11 = [v15 lazyFutureWithBlock:v22];

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

LABEL_12:
LABEL_13:

  return v11;
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_msgSend(*(id *)(a1 + 40), "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Showing license: %@ %@", buf, 0x16u);
  }
  id v7 = [[HUSoftwareUpdateLicenseViewController alloc] initWithDocument:*(void *)(a1 + 48)];
  objc_initWeak((id *)buf, v7);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_51;
  v18[3] = &unk_1E6385698;
  id v19 = *(id *)(a1 + 40);
  objc_copyWeak(&v23, (id *)(a1 + 80));
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  objc_copyWeak(&v24, (id *)buf);
  id v8 = v3;
  id v22 = v8;
  [(HUSoftwareUpdateLicenseViewController *)v7 setAgreeHandler:v18];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_3;
  v12[3] = &unk_1E63856E8;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 64);
  objc_copyWeak(&v16, (id *)(a1 + 80));
  objc_copyWeak(&v17, (id *)buf);
  id v9 = v8;
  id v15 = v9;
  [(HUSoftwareUpdateLicenseViewController *)v7 setDisagreeHandler:v12];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v7];
  [v10 setModalPresentationStyle:2];
  [v10 setModalInPresentation:1];
  id v11 = (id)[*(id *)(a1 + 64) softwareUpdateUIManager:*(void *)(a1 + 72) presentViewController:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);

  objc_destroyWeak((id *)buf);
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_51(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "[START UPDATE] User AGREED to license for update: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) home];
  id v7 = [WeakRetained _markTermsAndConditionsAsReadForLicenseAgreementVersion:v5 inHome:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_52;
  v9[3] = &unk_1E6385670;
  id v10 = *(id *)(a1 + 48);
  objc_copyWeak(&v12, (id *)(a1 + 64));
  objc_copyWeak(&v13, (id *)(a1 + 72));
  id v11 = *(id *)(a1 + 56);
  id v8 = (id)[v7 addCompletionBlock:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [v5 softwareUpdateUIManager:WeakRetained dismissViewController:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_2;
  v11[3] = &unk_1E63852A8;
  id v12 = *(id *)(a1 + 40);
  id v13 = v4;
  id v9 = v4;
  id v10 = (id)[v8 addCompletionBlock:v11];
}

uint64_t __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38] error:*(void *)(a1 + 40)];
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_error_impl(&dword_1BE345000, v2, OS_LOG_TYPE_ERROR, "[START UPDATE] User DISAGREED to license for update: %@", buf, 0xCu);
  }
  id v3 = *(void **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = [v3 softwareUpdateUIManager:WeakRetained dismissViewController:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_55;
  v9[3] = &unk_1E63856C0;
  id v10 = *(id *)(a1 + 48);
  id v7 = (id)[v6 addCompletionBlock:v9];
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_55(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

- (BOOL)_shouldPresentTermsAndConditionsForSoftwareLicenseAgreementVersion:(id)a3 home:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    if (HFPreferencesBoolForKey())
    {
LABEL_14:
      LOBYTE(v10) = 1;
      goto LABEL_15;
    }
    if (HFPreferencesBoolForKey())
    {

LABEL_11:
      id v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "[START UPDATE] License version is missing!  Presenting terms and conditions irregardless of aberration...", buf, 2u);
      }

      id v7 = 0;
      goto LABEL_14;
    }
  }
  if (!v7) {
    goto LABEL_11;
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Check whether license version %@ needs presentation...", buf, 0xCu);
  }

  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 282, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  int v10 = objc_msgSend(v8, "hf_hasAcceptedTermsAndConditionsForHomePodVersion:", v7) ^ 1;
LABEL_15:

  return v10;
}

- (id)_markTermsAndConditionsAsReadForLicenseAgreementVersion:(id)a3 inHome:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F69758] isInternalInstall] && HFPreferencesBoolForKey())
  {

LABEL_10:
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "[START UPDATE] License version is missing!  Unable to mark terms and conditions as read...", buf, 2u);
    }

    int v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    goto LABEL_13;
  }
  if (!v7) {
    goto LABEL_10;
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "[START UPDATE] License version %@ has been accepted!", buf, 0xCu);
  }

  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUSoftwareUpdateUIManager.m", 300, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  int v10 = objc_msgSend(v8, "hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion:", v7);

LABEL_13:

  return v10;
}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  id v3 = [(HUSoftwareUpdateUIManager *)self homeBackgroundCheckMapTable];
  [v3 removeAllObjects];
}

- (NSMapTable)homeBackgroundCheckMapTable
{
  return self->_homeBackgroundCheckMapTable;
}

- (void).cxx_destruct
{
}

@end