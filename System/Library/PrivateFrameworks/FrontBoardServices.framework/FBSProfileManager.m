@interface FBSProfileManager
+ (id)sharedInstance;
- (BOOL)isManaged:(id)a3;
- (BOOL)isStarted;
- (FBSProfileManager)init;
- (id)profilesForSignerIdentity:(id)a3;
- (void)_managedAppsChangedNotification:(id)a3;
- (void)_reloadProfiles;
- (void)_workQueue_reloadManagedApplicationBundleIDs;
- (void)_workQueue_reloadProfiles;
- (void)dealloc;
- (void)startService;
@end

@implementation FBSProfileManager

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

uint64_t __35__FBSProfileManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FBSProfileManager);
  uint64_t v1 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (FBSProfileManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSProfileManager;
  if ([(FBSProfileManager *)&v3 init])
  {
    [off_1E58F44F8 serial];
    [(id)objc_claimAutoreleasedReturnValue() serviceClass:25];
    objc_claimAutoreleasedReturnValue();
    BSDispatchQueueCreate();
  }
  return 0;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)FBSProfileManager;
  [(FBSProfileManager *)&v5 dealloc];
}

- (void)startService
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FBSProfileManager_startService__block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __33__FBSProfileManager_startService__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _workQueue_reloadProfiles];
  [*(id *)(a1 + 32) _workQueue_reloadManagedApplicationBundleIDs];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleProfilesChangedNotification, @"MISProvisioningProfileInstalled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleProfilesChangedNotification, @"MISProvisioningProfileRemoved", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = getMCManagedAppsChangedNotification();
  [v5 addObserver:v3 selector:sel__managedAppsChangedNotification_ name:v4 object:0];
}

- (BOOL)isStarted
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__FBSProfileManager_isStarted__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__FBSProfileManager_isStarted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (BOOL)isManaged:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__FBSProfileManager_isManaged___block_invoke;
  block[3] = &unk_1E58F59F8;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(workQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

uint64_t __31__FBSProfileManager_isManaged___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)profilesForSignerIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FBSProfileManager_profilesForSignerIdentity___block_invoke;
  block[3] = &unk_1E58F59F8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__FBSProfileManager_profilesForSignerIdentity___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_reloadProfiles
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FBSProfileManager__reloadProfiles__block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __36__FBSProfileManager__reloadProfiles__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueue_reloadProfiles];
}

- (void)_workQueue_reloadProfiles
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = (void *)soft_MISCopyErrorStringForErrorCode(a2);
  int v8 = 138543618;
  id v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_19C680000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error loading provisioning profiles: %{public}@", (uint8_t *)&v8, 0x16u);
}

uint64_t __46__FBSProfileManager__workQueue_reloadProfiles__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x19F398F90]();
  soft_MISProvisioningProfileGetDeveloperCertificates(a2);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        v15 = 0;
        id v9 = (const void *)soft_SecCertificateCreateWithData(0, v8);
        v15 = v9;
        if (v9)
        {
          __int16 v10 = (void *)soft_SecCertificateCopySubjectSummary((uint64_t)v9);
          if (v10)
          {
            uint64_t v11 = [*(id *)(a1 + 32) objectForKey:v10 context:context v15 v16];
            if (!v11)
            {
              uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
              [*(id *)(a1 + 32) setObject:v11 forKey:v10];
            }
            uint64_t v12 = [[FBSApplicationProvisioningProfile alloc] initWithSignerIdentity:v10 profile:a2];
            if (v12) {
              [v11 addObject:v12];
            }
          }
        }
        fbs_release(&v15);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return 1;
}

- (void)_workQueue_reloadManagedApplicationBundleIDs
{
  id v9 = self->_workQueue_managedApplicationBundleIDs;
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [getMCProfileConnectionClass() sharedConnection];
  uint64_t v5 = [v4 managedAppIDs];
  uint64_t v6 = (void *)[v3 initWithArray:v5];

  if (([v6 isEqual:v9] & 1) == 0)
  {
    uint64_t v7 = (NSSet *)[v6 copy];
    workQueue_managedApplicationBundleIDs = self->_workQueue_managedApplicationBundleIDs;
    self->_workQueue_managedApplicationBundleIDs = v7;
  }
}

- (void)_managedAppsChangedNotification:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FBSProfileManager__managedAppsChangedNotification___block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __53__FBSProfileManager__managedAppsChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueue_reloadManagedApplicationBundleIDs];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue_profilesBySignerIdentity, 0);
  objc_storeStrong((id *)&self->_workQueue_managedApplicationBundleIDs, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end