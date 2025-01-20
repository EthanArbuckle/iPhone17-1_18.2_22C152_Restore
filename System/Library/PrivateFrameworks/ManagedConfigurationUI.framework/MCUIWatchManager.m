@interface MCUIWatchManager
+ (id)shared;
- (ACAccount)rmAccount;
- (MCUIWatchManager)init;
- (NSArray)configProfilesInfo;
- (NSArray)mdmProfilesInfo;
- (NSDictionary)managedAppsUninstalledOnMDMRemoval;
- (NSMutableDictionary)cachedProfileSummaries;
- (NSMutableDictionary)cachedProfiles;
- (NSMutableDictionary)cachedRMConfigurationViewModels;
- (NSSManager)nssManager;
- (id)cachedMDMProfileIdentifier;
- (id)cachedProfileForIdentifier:(id)a3;
- (id)cachedProfileSummaryForIdentifier:(id)a3;
- (id)cachedRMConfigurationViewModelsForIdentifier:(id)a3;
- (int64_t)profileCount;
- (unint64_t)fetchStatus;
- (void)_fetchProfiles;
- (void)_handleFetchProfilesError:(id)a3;
- (void)_unarchiveProfilePayloadsSummaryFromData:(id)a3 forProfileIdentifier:(id)a4;
- (void)_unarchiveRMConfigurationViewModelsFromData:(id)a3 forProfileIdentifier:(id)a4;
- (void)_watchChanged:(id)a3;
- (void)fetchProfileIdentifier:(id)a3 completion:(id)a4;
- (void)installProfileData:(id)a3 completion:(id)a4;
- (void)removeProfileIdentifier:(id)a3 completion:(id)a4;
- (void)setCachedProfileSummaries:(id)a3;
- (void)setCachedProfiles:(id)a3;
- (void)setCachedRMConfigurationViewModels:(id)a3;
- (void)setConfigProfilesInfo:(id)a3;
- (void)setFetchStatus:(unint64_t)a3;
- (void)setManagedAppsUninstalledOnMDMRemoval:(id)a3;
- (void)setMdmProfilesInfo:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setRmAccount:(id)a3;
@end

@implementation MCUIWatchManager

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)shared_sharedInstance;
  return v2;
}

void __26__MCUIWatchManager_shared__block_invoke()
{
  if (MCUIForPairedDevice())
  {
    shared_sharedInstance = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
  else
  {
    NSLog(&cfstr_McuiWatchManag.isa);
  }
}

- (MCUIWatchManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)MCUIWatchManager;
  v2 = [(MCUIWatchManager *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F79F18]);
    v4 = MEMORY[0x1E4F14428];
    uint64_t v5 = [v3 initWithQueue:MEMORY[0x1E4F14428]];
    nssManager = v2->_nssManager;
    v2->_nssManager = (NSSManager *)v5;

    uint64_t v7 = objc_opt_new();
    cachedProfiles = v2->_cachedProfiles;
    v2->_cachedProfiles = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    cachedProfileSummaries = v2->_cachedProfileSummaries;
    v2->_cachedProfileSummaries = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    cachedRMConfigurationViewModels = v2->_cachedRMConfigurationViewModels;
    v2->_cachedRMConfigurationViewModels = (NSMutableDictionary *)v11;

    mdmProfilesInfo = v2->_mdmProfilesInfo;
    v14 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_fetchStatus = 2;
    v2->_mdmProfilesInfo = v14;

    configProfilesInfo = v2->_configProfilesInfo;
    v2->_configProfilesInfo = v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v2 selector:sel__watchChanged_ name:*MEMORY[0x1E4F79EB8] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel__watchChanged_ name:*MEMORY[0x1E4F79E88] object:0];

    dispatch_async(v4, &__block_literal_global_26);
    [(MCUIWatchManager *)v2 _fetchProfiles];
  }
  return v2;
}

void __24__MCUIWatchManager_init__block_invoke()
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F42EA0];
  v24[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v2 = [v0 appearanceWhenContainedInInstancesOfClasses:v1];
  id v3 = BPSForegroundColor();
  [v2 setBackgroundColor:v3];

  v4 = (void *)MEMORY[0x1E4F42E98];
  uint64_t v23 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v6 = [v4 appearanceWhenContainedInInstancesOfClasses:v5];
  uint64_t v7 = BPSBackgroundColor();
  [v6 setBackgroundColor:v7];

  v8 = (void *)MEMORY[0x1E4F42E98];
  uint64_t v22 = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v10 = [v8 appearanceWhenContainedInInstancesOfClasses:v9];
  uint64_t v11 = BPSSeparatorColor();
  [v10 setSeparatorColor:v11];

  v12 = (void *)MEMORY[0x1E4F42E98];
  uint64_t v21 = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v14 = [v12 appearanceWhenContainedInInstancesOfClasses:v13];
  v15 = BPSTextColor();
  [v14 setSectionIndexColor:v15];

  v16 = (void *)MEMORY[0x1E4F42E98];
  uint64_t v20 = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v18 = [v16 appearanceWhenContainedInInstancesOfClasses:v17];
  objc_super v19 = BPSForegroundColor();
  [v18 setSectionIndexBackgroundColor:v19];
}

- (void)_watchChanged:(id)a3
{
  v4 = [a3 name];
  NSLog(&cfstr_McuiWatchManag_0.isa, v4);

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MCUIWatchManager__watchChanged___block_invoke;
  block[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __34__MCUIWatchManager__watchChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v2 = [WeakRetained nssManager];
    [v2 invalidate];

    id v3 = objc_alloc(MEMORY[0x1E4F79F18]);
    v4 = (void *)[v3 initWithQueue:MEMORY[0x1E4F14428]];
    [v8 setNssManager:v4];

    uint64_t v5 = [v8 cachedProfiles];
    [v5 removeAllObjects];

    id v6 = [v8 cachedProfileSummaries];
    [v6 removeAllObjects];

    uint64_t v7 = [v8 cachedRMConfigurationViewModels];
    [v7 removeAllObjects];

    [v8 _fetchProfiles];
    id WeakRetained = v8;
  }
}

- (int64_t)profileCount
{
  id v3 = [(MCUIWatchManager *)self mdmProfilesInfo];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [(MCUIWatchManager *)self configProfilesInfo];
  int64_t v6 = [v5 count] + v4;

  return v6;
}

- (void)installProfileData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MCUIWatchManager *)self nssManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MCUIWatchManager_installProfileData_completion___block_invoke;
  v10[3] = &unk_1E6EADB20;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 installProfile:v6 completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__MCUIWatchManager_installProfileData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5) {
    NSLog(&cfstr_ErrorMcuiWatch.isa, v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _fetchProfiles];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)removeProfileIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MCUIWatchManager *)self nssManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__MCUIWatchManager_removeProfileIdentifier_completion___block_invoke;
  v11[3] = &unk_1E6EADB48;
  id v9 = v6;
  id v12 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  [v8 removeProfileWithIdentifier:v9 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__MCUIWatchManager_removeProfileIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5) {
    NSLog(&cfstr_ErrorMcuiWatch_0.isa, *(void *)(a1 + 32), v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _fetchProfiles];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_fetchProfiles
{
  NSLog(&cfstr_McuiWatchManag_1.isa, a2);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MCUIWatchManager__fetchProfiles__block_invoke;
  block[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v7, &location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v3 = [(MCUIWatchManager *)self nssManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MCUIWatchManager__fetchProfiles__block_invoke_2;
  v4[3] = &unk_1E6EADB70;
  objc_copyWeak(&v5, &location);
  [v3 getProfilesInfo:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __34__MCUIWatchManager__fetchProfiles__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setFetchStatus:2];
    id WeakRetained = v2;
  }
}

void __34__MCUIWatchManager__fetchProfiles__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MCUIWatchManager__fetchProfiles__block_invoke_3;
  block[3] = &unk_1E6EAD2D0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __34__MCUIWatchManager__fetchProfiles__block_invoke_3(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "_handleFetchProfilesError:");
    }
    else
    {
      objc_msgSend(WeakRetained, "setFetchStatus:");
      uint64_t v4 = *MEMORY[0x1E4F79F40];
      id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F79F40]];
      if (v5)
      {
        id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
        v24[0] = v6;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        [v3 setMdmProfilesInfo:v7];
      }
      else
      {
        [v3 setMdmProfilesInfo:MEMORY[0x1E4F1CBF0]];
      }

      uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F79F38]];
      id v9 = (void *)v8;
      if (v8) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = MEMORY[0x1E4F1CBF0];
      }
      [v3 setConfigProfilesInfo:v10];

      id v11 = [v3 configProfilesInfo];
      id v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_47];
      id v13 = [v11 filteredArrayUsingPredicate:v12];
      [v3 setConfigProfilesInfo:v13];

      id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F79F20]];
      [v3 setManagedAppsUninstalledOnMDMRemoval:v14];

      v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F79F50]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 setRmAccount:v15];
      }
      v16 = [v3 mdmProfilesInfo];
      uint64_t v17 = [v16 count];
      v18 = [v3 configProfilesInfo];
      uint64_t v19 = [v18 count];
      uint64_t v20 = [v3 managedAppsUninstalledOnMDMRemoval];
      uint64_t v21 = [v20 count];
      uint64_t v22 = [v3 rmAccount];
      NSLog(&cfstr_McuiWatchManag_2.isa, v17, v19, v21, v22 != 0);

      uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 postNotificationName:@"kMCUIUpdatedNotification" object:0];
    }
  }
}

uint64_t __34__MCUIWatchManager__fetchProfiles__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isInstalledByDeclarativeManagement] ^ 1;
}

- (void)_handleFetchProfilesError:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSLog(&cfstr_McuiWatchManag_3.isa, v4);
  [(MCUIWatchManager *)self setFetchStatus:1];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = @"kMCUINotificationErrorKey";
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [v5 postNotificationName:@"kMCUIWatchFetchFailedNotification" object:0 userInfo:v6];
}

- (void)fetchProfileIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(MCUIWatchManager *)self nssManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke;
  v11[3] = &unk_1E6EADBC0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 getFullProfileInfoWithIdentifier:v9 includeManagedPayloads:1 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E6EADB98;
  objc_copyWeak(&v15, a1 + 6);
  id v11 = v6;
  id v12 = a1[4];
  id v7 = a1[5];
  id v13 = v5;
  id v14 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
}

void __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      NSLog(&cfstr_McuiWatchManag_4.isa, *(void *)(a1 + 40), v3);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_10;
    }
    id v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F79F28]];
    if (v4)
    {
      id v11 = 0;
      id v5 = [MEMORY[0x1E4F74220] profileWithData:v4 outError:&v11];
      id v6 = v11;
      if (v6)
      {
        id v7 = v6;
        NSLog(&cfstr_McuiWatchManag_5.isa, *(void *)(a1 + 40), v6);
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_9:
        goto LABEL_10;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F79F30]];
    [WeakRetained _unarchiveProfilePayloadsSummaryFromData:v8 forProfileIdentifier:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F79F48]];
    [WeakRetained _unarchiveRMConfigurationViewModelsFromData:v9 forProfileIdentifier:*(void *)(a1 + 40)];

    id v10 = [WeakRetained cachedProfiles];
    [v10 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_unarchiveProfilePayloadsSummaryFromData:(id)a3 forProfileIdentifier:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    id v8 = a3;
    id v13 = 0;
    id v9 = [v7 unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v13];

    id v10 = v13;
    id v11 = v10;
    if (v10) {
      NSLog(&cfstr_McuiWatchManag_6.isa, v6, v10);
    }
    if (v9)
    {
      id v12 = [(MCUIWatchManager *)self cachedProfileSummaries];
      [v12 setObject:v9 forKeyedSubscript:v6];
    }
  }
}

- (void)_unarchiveRMConfigurationViewModelsFromData:(id)a3 forProfileIdentifier:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    id v8 = a3;
    id v13 = 0;
    id v9 = [v7 unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v13];

    id v10 = v13;
    id v11 = v10;
    if (v10) {
      NSLog(&cfstr_McuiWatchManag_7.isa, v6, v10);
    }
    if (v9)
    {
      id v12 = [(MCUIWatchManager *)self cachedRMConfigurationViewModels];
      [v12 setObject:v9 forKeyedSubscript:v6];
    }
  }
}

- (id)cachedMDMProfileIdentifier
{
  id v2 = [(NSArray *)self->_mdmProfilesInfo firstObject];
  uint64_t v3 = [v2 identifier];

  return v3;
}

- (id)cachedProfileForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cachedProfiles objectForKeyedSubscript:a3];
}

- (id)cachedProfileSummaryForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cachedProfileSummaries objectForKeyedSubscript:a3];
}

- (id)cachedRMConfigurationViewModelsForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cachedRMConfigurationViewModels objectForKeyedSubscript:a3];
}

- (unint64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(unint64_t)a3
{
  self->_fetchStatus = a3;
}

- (NSArray)mdmProfilesInfo
{
  return self->_mdmProfilesInfo;
}

- (void)setMdmProfilesInfo:(id)a3
{
}

- (NSArray)configProfilesInfo
{
  return self->_configProfilesInfo;
}

- (void)setConfigProfilesInfo:(id)a3
{
}

- (ACAccount)rmAccount
{
  return self->_rmAccount;
}

- (void)setRmAccount:(id)a3
{
}

- (NSDictionary)managedAppsUninstalledOnMDMRemoval
{
  return self->_managedAppsUninstalledOnMDMRemoval;
}

- (void)setManagedAppsUninstalledOnMDMRemoval:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (NSMutableDictionary)cachedProfiles
{
  return self->_cachedProfiles;
}

- (void)setCachedProfiles:(id)a3
{
}

- (NSMutableDictionary)cachedProfileSummaries
{
  return self->_cachedProfileSummaries;
}

- (void)setCachedProfileSummaries:(id)a3
{
}

- (NSMutableDictionary)cachedRMConfigurationViewModels
{
  return self->_cachedRMConfigurationViewModels;
}

- (void)setCachedRMConfigurationViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRMConfigurationViewModels, 0);
  objc_storeStrong((id *)&self->_cachedProfileSummaries, 0);
  objc_storeStrong((id *)&self->_cachedProfiles, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_managedAppsUninstalledOnMDMRemoval, 0);
  objc_storeStrong((id *)&self->_rmAccount, 0);
  objc_storeStrong((id *)&self->_configProfilesInfo, 0);
  objc_storeStrong((id *)&self->_mdmProfilesInfo, 0);
}

@end