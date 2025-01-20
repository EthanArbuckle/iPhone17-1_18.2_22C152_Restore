@interface MCUIDataManager
+ (BOOL)_isDeviceManagementHiddenConcrete;
+ (id)sharedManager;
- (BOOL)isDeviceManagementHidden;
- (BOOL)isProfileSectionEmpty;
- (BOOL)observing;
- (LSApplicationWorkspace)appWorkspace;
- (MCProfileInfo)mdmProfileInfo;
- (MCUIDataManager)init;
- (NSArray)blockedApplications;
- (NSArray)configurationProfilesInfo;
- (NSArray)enterpriseAppSigners;
- (NSArray)freeDeveloperAppSigners;
- (NSArray)uninstalledProfilesInfo;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)reloadQueue;
- (id)configurationProfiles;
- (id)mdmProfile;
- (int)appsChangedNotifyToken;
- (int)provisioningProfileInstalledToken;
- (int)provisioningProfileRemovedToken;
- (unint64_t)appSignerCount;
- (unint64_t)installedProfileCount;
- (unint64_t)itemCount;
- (void)_reloadQueueReloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6;
- (void)allDeviceManagementOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 outEnterpriseAppSigners:(id *)a6 outFreeDevAppSigners:(id *)a7 outBlockedApplications:(id *)a8;
- (void)appMovedToBackground:(id)a3;
- (void)appMovedToForeground:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)profilesChanged:(id)a3;
- (void)reloadAllDataInBackgroundWithCompletion:(id)a3;
- (void)reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:(id)a3;
- (void)reloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6;
- (void)reloadProfilesInBackgroundWithCompletion:(id)a3;
- (void)setAppWorkspace:(id)a3;
- (void)setAppsChangedNotifyToken:(int)a3;
- (void)setBlockedApplications:(id)a3;
- (void)setConfigurationProfilesInfo:(id)a3;
- (void)setEnterpriseAppSigners:(id)a3;
- (void)setFreeDeveloperAppSigners:(id)a3;
- (void)setMdmProfileInfo:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setProvisioningProfileInstalledToken:(int)a3;
- (void)setProvisioningProfileRemovedToken:(int)a3;
- (void)setReloadQueue:(id)a3;
- (void)setUninstalledProfilesInfo:(id)a3;
@end

@implementation MCUIDataManager

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void)appMovedToForeground:(id)a3
{
  uint64_t v4 = [(MCUIDataManager *)self appWorkspace];
  if (v4)
  {
    v5 = (void *)v4;
    BOOL v6 = [(MCUIDataManager *)self observing];

    if (!v6)
    {
      v7 = [(MCUIDataManager *)self appWorkspace];
      [v7 addObserver:self];

      [(MCUIDataManager *)self setObserving:1];
    }
  }
  [(MCUIDataManager *)self reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:0];
}

- (void)appMovedToBackground:(id)a3
{
  uint64_t v4 = [(MCUIDataManager *)self appWorkspace];
  if (v4)
  {
    v5 = (void *)v4;
    BOOL v6 = [(MCUIDataManager *)self observing];

    if (v6)
    {
      v7 = [(MCUIDataManager *)self appWorkspace];
      [v7 removeObserver:self];

      [(MCUIDataManager *)self setObserving:0];
    }
  }
}

- (BOOL)isDeviceManagementHidden
{
  return +[MCUIDataManager _isDeviceManagementHiddenConcrete];
}

- (void)reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__MCUIDataManager_reloadAppSignersAndBlockedAppsInBackgroundWithCompletion___block_invoke;
  v7[3] = &unk_1E6EAD940;
  id v8 = v4;
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x1E4E8BC40](v7);
  [(MCUIDataManager *)self reloadDataInBackgroundIncludingProfiles:0 appSigners:1 blockedApplications:1 completion:v6];
}

uint64_t __76__MCUIDataManager_reloadAppSignersAndBlockedAppsInBackgroundWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a5, a6, a7);
  }
  return result;
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)reloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  if (![(MCUIDataManager *)self isDeviceManagementHidden])
  {
    v11 = [(MCUIDataManager *)self reloadQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__MCUIDataManager_reloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke;
    block[3] = &unk_1E6EAD8C8;
    block[4] = self;
    BOOL v14 = a3;
    BOOL v15 = a4;
    BOOL v16 = a5;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

- (MCUIDataManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)MCUIDataManager;
  v2 = [(MCUIDataManager *)&v23 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MCUIDataManager member queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("MCUIDataManager reload queue", 0);
    reloadQueue = v2->_reloadQueue;
    v2->_reloadQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    appWorkspace = v2->_appWorkspace;
    v2->_appWorkspace = (LSApplicationWorkspace *)v7;

    [(LSApplicationWorkspace *)v2->_appWorkspace addObserver:v2];
    v2->_observing = 1;
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = *MEMORY[0x1E4F741E8];
    v11 = [MEMORY[0x1E4F74230] sharedConnection];
    [v9 addObserver:v2 selector:sel_profilesChanged_ name:v10 object:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel_appMovedToBackground_ name:*MEMORY[0x1E4F43660] object:0];

    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_appMovedToForeground_ name:*MEMORY[0x1E4F43648] object:0];

    objc_initWeak(&location, v2);
    BOOL v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __23__MCUIDataManager_init__block_invoke;
    handler[3] = &unk_1E6EAD7C0;
    objc_copyWeak(&v21, &location);
    LODWORD(v14) = notify_register_dispatch("MISProvisioningProfileInstalled", &v2->_provisioningProfileInstalledToken, v14, handler);

    if (v14) {
      NSLog(&cfstr_FailedToRegist.isa);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __23__MCUIDataManager_init__block_invoke_2;
    v18[3] = &unk_1E6EAD7C0;
    objc_copyWeak(&v19, &location);
    uint32_t v16 = notify_register_dispatch("MISProvisioningProfileRemoved", &v2->_provisioningProfileInstalledToken, MEMORY[0x1E4F14428], v18);

    if (v16) {
      NSLog(&cfstr_FailedToRegist_0.isa);
    }
    if ([(MCUIDataManager *)v2 isDeviceManagementHidden])
    {
      NSLog(&cfstr_DataManagerNot.isa);
    }
    else
    {
      NSLog(&cfstr_DataManagerPre.isa);
      [(MCUIDataManager *)v2 reloadDataInBackgroundIncludingProfiles:1 appSigners:1 blockedApplications:0 completion:0];
      [(MCUIDataManager *)v2 reloadDataInBackgroundIncludingProfiles:0 appSigners:0 blockedApplications:1 completion:0];
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_reloadQueueReloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  if (![(MCUIDataManager *)self isDeviceManagementHidden])
  {
    if (v8)
    {
      if (MCUIForPairedDevice()) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = [MEMORY[0x1E4F74220] thisDeviceType];
      }
      BOOL v14 = [MEMORY[0x1E4F74230] sharedConnection];
      id v58 = 0;
      v59[0] = 0;
      id v57 = 0;
      [v14 allProfilesOutMDMProfileInfo:v59 outConfigurationProfilesInfo:&v58 outUninstalledProfilesInfo:&v57 forDeviceType:v11];
      id v13 = v59[0];
      id v32 = v58;
      id v12 = v57;

      NSLog(&cfstr_DataManagerRet.isa);
    }
    else
    {
      id v12 = 0;
      id v32 = 0;
      id v13 = 0;
    }
    v34 = v10;
    if (v7)
    {
      id v56 = 0;
      id v15 = +[MCUIAppSigner enterpriseAppSignersWithOutDeveloperAppSigners:&v56];
      id v16 = v56;
      NSLog(&cfstr_DataManagerRet_0.isa, [v15 count], objc_msgSend(v16, "count"));
      if (!v6)
      {
LABEL_10:
        v17 = 0;
LABEL_13:
        v18 = [(MCUIDataManager *)self memberQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke;
        block[3] = &unk_1E6EAD8F0;
        BOOL v53 = v8;
        block[4] = self;
        id v19 = v13;
        id v47 = v19;
        id v20 = v32;
        id v48 = v20;
        id v21 = v12;
        id v49 = v21;
        BOOL v33 = v8;
        BOOL v22 = v7;
        BOOL v54 = v7;
        id v23 = v15;
        id v50 = v23;
        id v24 = v16;
        id v51 = v24;
        BOOL v55 = v6;
        id v25 = v17;
        id v52 = v25;
        dispatch_sync(v18, block);

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke_2;
        v35[3] = &unk_1E6EAD918;
        id v10 = v34;
        id v41 = v25;
        id v42 = v34;
        id v36 = v19;
        id v37 = v20;
        id v38 = v21;
        id v39 = v23;
        id v40 = v24;
        BOOL v43 = v33;
        BOOL v44 = v22;
        BOOL v45 = v6;
        id v26 = v25;
        id v27 = v24;
        id v28 = v23;
        id v29 = v21;
        id v30 = v20;
        id v31 = v19;
        dispatch_async(MEMORY[0x1E4F14428], v35);

        goto LABEL_14;
      }
    }
    else
    {
      id v16 = 0;
      id v15 = 0;
      if (!v6) {
        goto LABEL_10;
      }
    }
    v17 = [MEMORY[0x1E4F5E640] blockedApplications];
    NSLog(&cfstr_DataManagerRet_1.isa, [v17 count]);
    goto LABEL_13;
  }
LABEL_14:
}

+ (BOOL)_isDeviceManagementHiddenConcrete
{
  return [MEMORY[0x1E4F42738] isRunningInStoreDemoMode];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __32__MCUIDataManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(MCUIDataManager);
  return MEMORY[0x1F41817F8]();
}

void __23__MCUIDataManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:0];
}

void __23__MCUIDataManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:0];
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43648] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43660] object:0];

  dispatch_queue_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F741E8] object:0];

  if (self->_observing)
  {
    [(LSApplicationWorkspace *)self->_appWorkspace removeObserver:self];
    self->_observing = 0;
  }
  notify_cancel(self->_appsChangedNotifyToken);
  notify_cancel(self->_provisioningProfileInstalledToken);
  notify_cancel(self->_provisioningProfileRemovedToken);
  v6.receiver = self;
  v6.super_class = (Class)MCUIDataManager;
  [(MCUIDataManager *)&v6 dealloc];
}

- (void)profilesChanged:(id)a3
{
  NSLog(&cfstr_DataManagerRel.isa, a2, a3);
  [(MCUIDataManager *)self reloadAllDataInBackgroundWithCompletion:0];
}

- (BOOL)isProfileSectionEmpty
{
  return [(MCUIDataManager *)self itemCount] == 0;
}

- (unint64_t)itemCount
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatch_queue_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__MCUIDataManager_itemCount__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __28__MCUIDataManager_itemCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = [*(id *)(v2 + 32) count];
  if (v3) {
    uint64_t v5 = v4 + 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v7 = v5 + v6 + [*(id *)(*(void *)(a1 + 32) + 56) count];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 64) count];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 + v8 + result;
  return result;
}

- (unint64_t)appSignerCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MCUIDataManager_appSignerCount__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__MCUIDataManager_appSignerCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result + v2;
  return result;
}

- (unint64_t)installedProfileCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MCUIDataManager_installedProfileCount__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__MCUIDataManager_installedProfileCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t result = [*(id *)(v2 + 32) count];
  if (v3) {
    uint64_t v5 = result + 1;
  }
  else {
    uint64_t v5 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (id)mdmProfile
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__MCUIDataManager_mdmProfile__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__MCUIDataManager_mdmProfile__block_invoke(uint64_t a1)
{
}

- (id)configurationProfiles
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MCUIDataManager_configurationProfiles__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__MCUIDataManager_configurationProfiles__block_invoke(uint64_t a1)
{
}

- (NSArray)uninstalledProfilesInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MCUIDataManager_uninstalledProfilesInfo__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __42__MCUIDataManager_uninstalledProfilesInfo__block_invoke(uint64_t a1)
{
}

- (NSArray)freeDeveloperAppSigners
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MCUIDataManager_freeDeveloperAppSigners__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __42__MCUIDataManager_freeDeveloperAppSigners__block_invoke(uint64_t a1)
{
}

- (NSArray)enterpriseAppSigners
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MCUIDataManager_enterpriseAppSigners__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __39__MCUIDataManager_enterpriseAppSigners__block_invoke(uint64_t a1)
{
}

- (NSArray)blockedApplications
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(MCUIDataManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__MCUIDataManager_blockedApplications__block_invoke;
  v6[3] = &unk_1E6EAD878;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __38__MCUIDataManager_blockedApplications__block_invoke(uint64_t a1)
{
}

- (void)allDeviceManagementOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 outEnterpriseAppSigners:(id *)a6 outFreeDevAppSigners:(id *)a7 outBlockedApplications:(id *)a8
{
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy_;
  id v51 = __Block_byref_object_dispose_;
  id v52 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  BOOL v44 = __Block_byref_object_copy_;
  BOOL v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy_;
  id v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  BOOL v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = [(MCUIDataManager *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __180__MCUIDataManager_allDeviceManagementOutMDMProfileInfo_outConfigurationProfilesInfo_outUninstalledProfilesInfo_outEnterpriseAppSigners_outFreeDevAppSigners_outBlockedApplications___block_invoke;
  block[3] = &unk_1E6EAD8A0;
  block[4] = self;
  void block[5] = &v47;
  block[6] = &v41;
  block[7] = &v35;
  block[8] = &v29;
  block[9] = &v23;
  block[10] = &v17;
  dispatch_sync(v11, block);

  if (a3) {
    *a3 = (id) v48[5];
  }
  if (a4) {
    *a4 = (id) v42[5];
  }
  if (a5) {
    *a5 = (id) v36[5];
  }
  if (a6) {
    *a6 = (id) v30[5];
  }
  if (a7) {
    *a7 = (id) v24[5];
  }
  if (a8) {
    *a8 = (id) v18[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

void __180__MCUIDataManager_allDeviceManagementOutMDMProfileInfo_outConfigurationProfilesInfo_outUninstalledProfilesInfo_outEnterpriseAppSigners_outFreeDevAppSigners_outBlockedApplications___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 40));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 56));
  objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), *(id *)(a1[4] + 48));
  uint64_t v2 = *(void **)(a1[4] + 64);
  uint64_t v3 = (id *)(*(void *)(a1[10] + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)reloadAllDataInBackgroundWithCompletion:(id)a3
{
}

uint64_t __101__MCUIDataManager_reloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadQueueReloadDataInBackgroundIncludingProfiles:*(unsigned __int8 *)(a1 + 48) appSigners:*(unsigned __int8 *)(a1 + 49) blockedApplications:*(unsigned __int8 *)(a1 + 50) completion:*(void *)(a1 + 40)];
}

void __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 56));
  }
  if (*(unsigned char *)(a1 + 89))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 64));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 72));
  }
  if (*(unsigned char *)(a1 + 90))
  {
    uint64_t v2 = *(void **)(a1 + 80);
    uint64_t v3 = (id *)(*(void *)(a1 + 32) + 64);
    objc_storeStrong(v3, v2);
  }
}

void __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke_2(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void, void, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"kMCUIProfilesUpdatedNotification" object:0 userInfo:0];
  }
  if (*(unsigned char *)(a1 + 89))
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"kMCUIAppSignersUpdatedNotification" object:0 userInfo:0];
  }
  if (*(unsigned char *)(a1 + 88) || *(unsigned char *)(a1 + 89) || *(unsigned char *)(a1 + 90))
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9[0] = @"kMCUIProfilesUpdatedNotification";
    uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
    v9[1] = @"kMCUIAppSignersUpdatedNotification";
    v10[0] = v6;
    uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 89)];
    v10[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    [v5 postNotificationName:@"kMCUIUpdatedNotification" object:0 userInfo:v8];
  }
}

- (void)reloadProfilesInBackgroundWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MCUIDataManager_reloadProfilesInBackgroundWithCompletion___block_invoke;
  v7[3] = &unk_1E6EAD940;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1E4E8BC40](v7);
  [(MCUIDataManager *)self reloadDataInBackgroundIncludingProfiles:1 appSigners:0 blockedApplications:0 completion:v6];
}

uint64_t __60__MCUIDataManager_reloadProfilesInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (MCProfileInfo)mdmProfileInfo
{
  return self->_mdmProfileInfo;
}

- (void)setMdmProfileInfo:(id)a3
{
}

- (NSArray)configurationProfilesInfo
{
  return self->_configurationProfilesInfo;
}

- (void)setConfigurationProfilesInfo:(id)a3
{
}

- (void)setUninstalledProfilesInfo:(id)a3
{
}

- (void)setFreeDeveloperAppSigners:(id)a3
{
}

- (void)setEnterpriseAppSigners:(id)a3
{
}

- (void)setBlockedApplications:(id)a3
{
}

- (void)setAppWorkspace:(id)a3
{
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (BOOL)observing
{
  return self->_observing;
}

- (int)appsChangedNotifyToken
{
  return self->_appsChangedNotifyToken;
}

- (void)setAppsChangedNotifyToken:(int)a3
{
  self->_appsChangedNotifyToken = a3;
}

- (int)provisioningProfileInstalledToken
{
  return self->_provisioningProfileInstalledToken;
}

- (void)setProvisioningProfileInstalledToken:(int)a3
{
  self->_provisioningProfileInstalledToken = a3;
}

- (int)provisioningProfileRemovedToken
{
  return self->_provisioningProfileRemovedToken;
}

- (void)setProvisioningProfileRemovedToken:(int)a3
{
  self->_provisioningProfileRemovedToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong((id *)&self->_blockedApplications, 0);
  objc_storeStrong((id *)&self->_enterpriseAppSigners, 0);
  objc_storeStrong((id *)&self->_freeDeveloperAppSigners, 0);
  objc_storeStrong((id *)&self->_uninstalledProfilesInfo, 0);
  objc_storeStrong((id *)&self->_configurationProfilesInfo, 0);
  objc_storeStrong((id *)&self->_mdmProfileInfo, 0);
}

@end