@interface FBSApplicationLibrary
- (BOOL)isUsingNetwork;
- (FBSApplicationLibrary)init;
- (FBSApplicationLibrary)initWithConfiguration:(id)a3;
- (NSString)description;
- (id)_identitiesForProxy:(void *)a3 outRecord:;
- (id)_initWithApplicationWorkspace:(id)a3 configuration:(id)a4;
- (id)_synchronizationQueue;
- (id)_workQueue_addApplicationWithIdentity:(void *)a3 forProxy:;
- (id)_workQueue_addPlaceholderWithIdentity:(void *)a3 forProxy:;
- (id)_workQueue_applicationsForProxies:(id *)a1;
- (id)_workQueue_currentProcessProxyWithOutURL:(uint64_t)a1;
- (id)_workQueue_removeApplicationForIdentity:(id *)a1;
- (id)_workQueue_removePlaceholderForIdentity:(id *)a1;
- (id)allInstalledApplications;
- (id)allPlaceholders;
- (id)applicationInfoForAuditToken:(id)a3;
- (id)applicationInfoForBundleIdentifier:(id)a3;
- (id)installedApplicationForIdentity:(id)a3;
- (id)installedApplicationForIdentityString:(id)a3;
- (id)installedApplicationWithBundleIdentifier:(id)a3;
- (id)installedApplicationsForBundleIdentifier:(id)a3;
- (id)observeDidAddApplicationsWithBlock:(id)a3;
- (id)observeDidAddPlaceholdersWithBlock:(id)a3;
- (id)observeDidCancelPlaceholdersWithBlock:(id)a3;
- (id)observeDidChangeNetworkUsageWithBlock:(id)a3;
- (id)observeDidDemoteApplicationsWithBlock:(id)a3;
- (id)observeDidRemoveApplicationsWithBlock:(id)a3;
- (id)observeDidReplaceApplicationsWithBlock:(id)a3;
- (id)observeDidUpdateApplicationsWithBlock:(id)a3;
- (id)placeholderForIdentity:(id)a3;
- (id)placeholderForIdentityString:(id)a3;
- (id)placeholderWithBundleIdentifier:(id)a3;
- (id)placeholdersForBundleIdentifier:(id)a3;
- (uint64_t)_workQueue_applicationNeedsRegeneration:(void *)a3 fromProxy:;
- (uint64_t)_workQueue_applicationPassesFilter:(void *)a3 record:(void *)a4 identity:;
- (uint64_t)_workQueue_placeholderPassesFilter:(void *)a3 record:(void *)a4 identity:;
- (void)_executeOrPendInstallSynchronizationBlock:(uint64_t)a1;
- (void)_fixupAdded:(void *)a3 removed:(id *)a4 replaced:;
- (void)_handleApplicationStateDidChange:(int)a3 notifyForUpdateInsteadOfReplacement:;
- (void)_load;
- (void)_notifyDidAddApplications:(uint64_t)a1;
- (void)_notifyDidAddPlaceholders:(uint64_t)a1;
- (void)_notifyDidCancelPlaceholders:(uint64_t)a1;
- (void)_notifyDidChangeNetworkUsage:(uint64_t)a1;
- (void)_notifyDidDemoteApplications:(uint64_t)a1;
- (void)_notifyDidRemoveApplications:(uint64_t)a1;
- (void)_notifyDidReplaceApplications:(uint64_t)a1;
- (void)_notifyDidUpdateApplications:(uint64_t)a1;
- (void)_notifyForType:(int)a3 synchronously:(void *)a4 withCastingBlock:;
- (void)_observeType:(void *)a3 withBlock:;
- (void)_reloadPlaceholdersNotificationFired;
- (void)_workQueue_addApplication:(uint64_t)a1;
- (void)_workQueue_addApplicationProxy:(uint64_t)a1;
- (void)_workQueue_addPlaceholder:(uint64_t)a1;
- (void)_workQueue_applicationForIdentity:(void *)a1;
- (void)_workQueue_didAddBundleInfo:(uint64_t)a1;
- (void)_workQueue_didRemoveBundleInfo:(id *)a1;
- (void)_workQueue_executeInstallSynchronizationBlocksIfAppropriate;
- (void)_workQueue_placeholderForIdentity:(void *)a1;
- (void)addApplicationProxy:(id)a3 withOverrideURL:(id)a4;
- (void)addApplicationRecord:(id)a3;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidChangePersonas:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)deviceManagementPolicyDidChange:(id)a3;
- (void)installedApplicationWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)networkUsageChanged:(BOOL)a3;
- (void)removeObserverForToken:(id)a3;
- (void)synchronize:(id)a3;
- (void)uninstallApplication:(id)a3 completion:(id)a4;
- (void)uninstallApplication:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)uninstallApplicationIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
@end

@implementation FBSApplicationLibrary

- (void)synchronize:(id)a3
{
}

void __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke_2;
  block[3] = &unk_1E58F4AB0;
  block[4] = v3;
  id v5 = v2;
  id v16 = v5;
  dispatch_sync(v4, block);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }
}

uint64_t __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 88))
  {
    uint64_t v2 = result;
    result = [*(id *)(v1 + 96) count];
    if (result)
    {
      [*(id *)(v2 + 40) addObjectsFromArray:*(void *)(*(void *)(v2 + 32) + 96)];
      uint64_t v3 = *(void **)(*(void *)(v2 + 32) + 96);
      return [v3 removeAllObjects];
    }
  }
  return result;
}

- (id)applicationInfoForAuditToken:(id)a3
{
  v4 = [a3 bundleID];
  id v5 = [(FBSApplicationLibrary *)self applicationInfoForBundleIdentifier:v4];

  return v5;
}

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(FBSApplicationLibrary *)self installedApplicationsForBundleIdentifier:a3];
  v4 = [v3 firstObject];

  return v4;
}

- (id)installedApplicationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__FBSApplicationLibrary_installedApplicationsForBundleIdentifier___block_invoke;
    block[3] = &unk_1E58F5E88;
    block[4] = self;
    id v12 = v4;
    id v7 = v5;
    id v13 = v7;
    dispatch_sync(workQueue, block);
    uint64_t v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __66__FBSApplicationLibrary_installedApplicationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(void **)(a1 + 32), *(void **)(*((void *)&v8 + 1) + 8 * v6));
        if (v7) {
          [*(id *)(a1 + 48) addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_workQueue_applicationForIdentity:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      long long v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_applicationForIdentity:]();
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v5 = (void *)a1[8];
    uint64_t v6 = [v3 identityString];
    a1 = [v5 objectForKey:v6];
  }

  return a1;
}

void __67__FBSApplicationLibrary__executeOrPendInstallSynchronizationBlock___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = (void *)MEMORY[0x19F3991F0]();
  [v2 addObject:v3];

  -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](*(void *)(a1 + 32));
}

- (void)_workQueue_executeInstallSynchronizationBlocksIfAppropriate
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 104);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke;
    block[3] = &unk_1E58F4B00;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)_executeOrPendInstallSynchronizationBlock:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    uint64_t v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__FBSApplicationLibrary__executeOrPendInstallSynchronizationBlock___block_invoke;
    v6[3] = &unk_1E58F5450;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

- (FBSApplicationLibrary)init
{
  id v3 = objc_alloc_init(FBSApplicationLibraryConfiguration);
  id v4 = [(FBSApplicationLibrary *)self initWithConfiguration:v3];

  return v4;
}

- (FBSApplicationLibrary)initWithConfiguration:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F223E0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(FBSApplicationLibrary *)self _initWithApplicationWorkspace:v6 configuration:v5];

  return v7;
}

- (id)_initWithApplicationWorkspace:(id)a3 configuration:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"workspace"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:](a2);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  long long v9 = v8;
  if (!v8)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configuration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:](a2);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }
  v25.receiver = self;
  v25.super_class = (Class)FBSApplicationLibrary;
  long long v10 = [(FBSApplicationLibrary *)&v25 init];
  long long v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [v9 copy];
    configuration = v11->_configuration;
    v11->_configuration = (FBSApplicationLibraryConfiguration *)v12;

    if ([(objc_class *)[(FBSApplicationLibraryConfiguration *)v11->_configuration applicationInfoClass] isSubclassOfClass:objc_opt_class()])
    {
      if ([(objc_class *)[(FBSApplicationLibraryConfiguration *)v11->_configuration applicationPlaceholderClass] isSubclassOfClass:objc_opt_class()])
      {
        long long v14 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [(FBSApplicationLibraryConfiguration *)v11->_configuration installedApplicationFilter];
          id v16 = @"YES";
          if (!v15) {
            id v16 = @"NO";
          }
          *(_DWORD *)buf = 134218242;
          v27 = v11;
          __int16 v28 = 2112;
          v29 = v16;
          _os_log_impl(&dword_19C680000, v14, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary<%p> has custom app inclusion filter defined? %@", buf, 0x16u);
        }
        v17 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [(FBSApplicationLibraryConfiguration *)v11->_configuration placeholderFilter];
          v19 = @"YES";
          if (!v18) {
            v19 = @"NO";
          }
          *(_DWORD *)buf = 134218242;
          v27 = v11;
          __int16 v28 = 2112;
          v29 = v19;
          _os_log_impl(&dword_19C680000, v17, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary<%p> has custom placeholder inclusion filter defined? %@", buf, 0x16u);
        }
        [off_1E58F44F8 serial];
        [(id)objc_claimAutoreleasedReturnValue() serviceClass:33];
        objc_claimAutoreleasedReturnValue();
        BSDispatchQueueCreate();
      }
      v24 = [NSString stringWithFormat:@"Must specify a class that subclasses from FBSApplicationPlaceholder : was passed %@", -[FBSApplicationLibraryConfiguration applicationPlaceholderClass](v11->_configuration, "applicationPlaceholderClass")];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
    }
    v23 = [NSString stringWithFormat:@"Must specify a class that subclasses from FBSApplicationInfo : was passed %@", -[FBSApplicationLibraryConfiguration applicationInfoClass](v11->_configuration, "applicationInfoClass")];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:].cold.4();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }

  return 0;
}

- (void)_load
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__FBSApplicationLibrary__load__block_invoke;
    block[3] = &unk_1E58F4B00;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

id __69__FBSApplicationLibrary__initWithApplicationWorkspace_configuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(FBSApplicationLibrary *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FBSApplicationLibrary;
  [(FBSApplicationLibrary *)&v3 dealloc];
}

- (BOOL)isUsingNetwork
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__FBSApplicationLibrary_isUsingNetwork__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__FBSApplicationLibrary_isUsingNetwork__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (id)allInstalledApplications
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__9;
  long long v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__FBSApplicationLibrary_allInstalledApplications__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __49__FBSApplicationLibrary_allInstalledApplications__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)installedApplicationForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  id v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FBSApplicationLibrary_installedApplicationForIdentity___block_invoke;
  block[3] = &unk_1E58F59F8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __57__FBSApplicationLibrary_installedApplicationForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)installedApplicationForIdentityString:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F223B0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentityString:v5];

  id v7 = [(FBSApplicationLibrary *)self installedApplicationForIdentity:v6];

  return v7;
}

- (id)installedApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(FBSApplicationLibraryConfiguration *)self->_configuration isPersonaAware])
  {
    id v5 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = [(FBSApplicationLibrary *)self installedApplicationsForBundleIdentifier:v4];
  uint64_t v14 = [v13 firstObject];

  return v14;
}

- (void)installedApplicationWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FBSApplicationLibraryConfiguration *)self->_configuration isPersonaAware])
  {
    uint64_t v8 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if (!v7)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completionHandler != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:completionHandler:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  completionQueue = self->_completionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__FBSApplicationLibrary_installedApplicationWithBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E58F51E0;
  id v21 = v6;
  id v22 = v7;
  block[4] = self;
  id v17 = v6;
  id v18 = v7;
  dispatch_async(completionQueue, block);
}

void __84__FBSApplicationLibrary_installedApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) installedApplicationWithBundleIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)allPlaceholders
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__FBSApplicationLibrary_allPlaceholders__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__FBSApplicationLibrary_allPlaceholders__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)placeholderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(FBSApplicationLibraryConfiguration *)self->_configuration isPersonaAware])
  {
    id v5 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary placeholderWithBundleIdentifier:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = [(FBSApplicationLibrary *)self placeholdersForBundleIdentifier:v4];
  uint64_t v14 = [v13 firstObject];

  return v14;
}

- (id)placeholdersForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__FBSApplicationLibrary_placeholdersForBundleIdentifier___block_invoke;
    block[3] = &unk_1E58F5E88;
    block[4] = self;
    id v12 = v4;
    id v7 = v5;
    id v13 = v7;
    dispatch_sync(workQueue, block);
    uint64_t v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __57__FBSApplicationLibrary_placeholdersForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(a1 + 32), *(void **)(*((void *)&v8 + 1) + 8 * v6));
        if (v7) {
          [*(id *)(a1 + 48) addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_workQueue_placeholderForIdentity:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      long long v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_placeholderForIdentity:]();
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v5 = (void *)a1[9];
    uint64_t v6 = [v3 identityString];
    a1 = [v5 objectForKey:v6];
  }

  return a1;
}

- (id)placeholderForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  id v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FBSApplicationLibrary_placeholderForIdentity___block_invoke;
  block[3] = &unk_1E58F59F8;
  id v10 = v4;
  long long v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __48__FBSApplicationLibrary_placeholderForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)placeholderForIdentityString:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F223B0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentityString:v5];

  id v7 = [(FBSApplicationLibrary *)self placeholderForIdentity:v6];

  return v7;
}

- (void)uninstallApplication:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__FBSApplicationLibrary_uninstallApplication_completion___block_invoke;
  v8[3] = &unk_1E58F5878;
  id v9 = v6;
  id v7 = v6;
  [(FBSApplicationLibrary *)self uninstallApplication:a3 withOptions:0 completion:v8];
}

uint64_t __57__FBSApplicationLibrary_uninstallApplication_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (void)uninstallApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(FBSApplicationLibraryConfiguration *)self->_configuration isPersonaAware])
  {
    long long v11 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary uninstallApplication:withOptions:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v19 = [(FBSApplicationLibrary *)self installedApplicationWithBundleIdentifier:v8];
  v20 = [v19 applicationIdentity];

  if (v20
    || ([(FBSApplicationLibrary *)self placeholderWithBundleIdentifier:v8],
        id v21 = objc_claimAutoreleasedReturnValue(),
        [v21 applicationIdentity],
        v20 = objc_claimAutoreleasedReturnValue(),
        v21,
        v20))
  {
    [(FBSApplicationLibrary *)self uninstallApplicationIdentity:v20 withOptions:v9 completion:v10];
LABEL_8:

    goto LABEL_9;
  }
  id v22 = FBSLogApplicationLibrary();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[FBSApplicationLibrary uninstallApplication:withOptions:completion:]();
  }

  if (v10)
  {
    completionQueue = self->_completionQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__FBSApplicationLibrary_uninstallApplication_withOptions_completion___block_invoke;
    v24[3] = &unk_1E58F5450;
    id v26 = v10;
    id v25 = v8;
    dispatch_async(completionQueue, v24);

    v20 = v26;
    goto LABEL_8;
  }
LABEL_9:
}

void __69__FBSApplicationLibrary_uninstallApplication_withOptions_completion___block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)off_1E58F4408;
  v6[0] = *MEMORY[0x1E4F28588];
  v6[1] = v2;
  v7[0] = @"No application found.";
  v7[1] = @"Not Found";
  v6[2] = @"FBSALIdentity";
  uint64_t v3 = *(void *)(a1 + 40);
  v7[2] = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  id v5 = [v1 errorWithDomain:@"FBSApplicationLibraryErrorDomain" code:2 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)uninstallApplicationIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = FBSLogApplicationLibrary();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v9 fbs_shortDescription];
    *(_DWORD *)buf = 138412290;
    *(void *)v67 = v13;
    _os_log_impl(&dword_19C680000, v12, OS_LOG_TYPE_DEFAULT, "Uninstalling %@...", buf, 0xCu);
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke;
  v62[3] = &unk_1E58F6CA0;
  id v14 = v9;
  id v63 = v14;
  id v15 = v11;
  v64 = self;
  id v65 = v15;
  uint64_t v16 = [off_1E58F44E0 sentinelWithCompletion:v62];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__9;
  v56 = __Block_byref_object_dispose__9;
  id v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__9;
  v50[4] = __Block_byref_object_dispose__9;
  id v51 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E58F6CC8;
  v47 = v50;
  block[4] = self;
  id v18 = v14;
  id v44 = v18;
  v48 = &v58;
  id v19 = v10;
  id v45 = v19;
  v49 = &v52;
  id v20 = v16;
  id v46 = v20;
  dispatch_sync(workQueue, block);
  if (*((unsigned char *)v59 + 24))
  {
    id v21 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v19 isUserInitiated];
      v23 = [v18 fbs_shortDescription];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v67 = v22;
      *(_WORD *)&v67[4] = 2114;
      *(void *)&v67[6] = v23;
      _os_log_impl(&dword_19C680000, v21, OS_LOG_TYPE_DEFAULT, "Requesting uninstallation with prompt=%{BOOL}u of %{public}@ from install coordinator", buf, 0x12u);
    }
    if (FBSApplicationLibraryLogTransactionEnabled())
    {
      v24 = (void *)MEMORY[0x1E4F78060];
      uint64_t v25 = v53[5];
      id v26 = [NSString stringWithFormat:@"Requesting uninstallation from install coordinator."];
      [v24 logStep:0 byParty:11 phase:1 success:1 forBundleID:v25 description:v26];
    }
    id v27 = objc_alloc_init((Class)getIXUninstallOptionsClass());
    [v27 setRequestUserConfirmation:[v19 isUserInitiated]];
    [v27 setShowArchiveOption:[v19 showsArchiveOption]];
    id v28 = objc_alloc((Class)getIXApplicationIdentityClass());
    v29 = (void *)[v28 initWithBundleIdentifier:v53[5]];
    id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
    if (!IXAppInstallCoordinatorClass)
    {
      v31 = [NSString stringWithFormat:@"IXAppInstallCoordinator does not exist"];
      v32 = MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        *(_DWORD *)buf = 138544642;
        *(void *)v67 = v34;
        *(_WORD *)&v67[8] = 2114;
        *(void *)&v67[10] = v36;
        __int16 v68 = 2048;
        v69 = self;
        __int16 v70 = 2114;
        v71 = @"FBSApplicationLibrary.m";
        __int16 v72 = 1024;
        int v73 = 384;
        __int16 v74 = 2114;
        v75 = v31;
        _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v31 UTF8String];
      _bs_set_crash_log_message();
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_110;
    v37[3] = &unk_1E58F6D18;
    v37[4] = self;
    id v38 = v18;
    v40 = &v52;
    v41 = v50;
    SEL v42 = a2;
    id v39 = v20;
    [IXAppInstallCoordinatorClass uninstallAppWithIdentity:v29 options:v27 completion:v37];
  }
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFailed])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F28588];
    v25[0] = @"InstallCoordination dropped uninstall completion block on the floor.";
    v24[0] = v5;
    v24[1] = @"FBSALIdentity";
    [*(id *)(a1 + 32) fbs_mediumDescription];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v24[2] = *(void *)off_1E58F4408;
    v25[1] = v6;
    v25[2] = @"Failed";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
    id v8 = [v4 errorWithDomain:@"FBSApplicationLibraryErrorDomain" code:1 userInfo:v7];
  }
  else
  {
    id v9 = [v3 context];
    uint64_t v10 = objc_opt_class();
    id v6 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v6;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v8 = v11;
  }
  if (v8)
  {
    uint64_t v12 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(a1 + 32) fbs_shortDescription];
      id v14 = [v8 descriptionWithMultilinePrefix:0];
      *(_DWORD *)buf = 138412546;
      id v21 = v13;
      __int16 v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_19C680000, v12, OS_LOG_TYPE_DEFAULT, "Uninstallation of %@ completed with error: %{public}@", buf, 0x16u);
    }
  }
  id v15 = *(void **)(a1 + 48);
  if (v15)
  {
    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_95;
    v17[3] = &unk_1E58F5450;
    id v19 = v15;
    id v18 = v8;
    dispatch_async(v16, v17);
  }
}

uint64_t __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2(uint64_t a1)
{
  void v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!(v6 | v5))
  {
    id v7 = *(void **)(a1 + 56);
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v22[0] = @"No application or placeholder found.";
    v21[0] = v15;
    v21[1] = @"FBSALIdentity";
    uint64_t v10 = [*(id *)(a1 + 40) fbs_mediumDescription];
    v21[2] = *(void *)off_1E58F4408;
    v22[1] = v10;
    v22[2] = @"Not Found";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    uint64_t v12 = v14;
    uint64_t v13 = 2;
    goto LABEL_5;
  }
  if ([(id)v6 _isPendingUninstall])
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    v24[0] = @"Uninstallation is already in progress.";
    v23[0] = v9;
    v23[1] = @"FBSALIdentity";
    uint64_t v10 = [*(id *)(a1 + 40) fbs_mediumDescription];
    v23[2] = *(void *)off_1E58F4408;
    v24[1] = v10;
    v24[2] = @"In Progress";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    uint64_t v12 = v8;
    uint64_t v13 = 3;
LABEL_5:
    uint64_t v16 = [v12 errorWithDomain:@"FBSApplicationLibraryErrorDomain" code:v13 userInfo:v11];
    [v7 signalWithContext:v16];

    goto LABEL_10;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _setPendingUninstall:1];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _setTentativeUninstall:[*(id *)(a1 + 48) isUserInitiated]];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  else {
    uint64_t v17 = (void *)v5;
  }
  uint64_t v18 = [v17 bundleIdentifier];
  uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

LABEL_10:
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_110(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2_111;
  block[3] = &unk_1E58F6CF0;
  id v7 = v5;
  id v16 = v7;
  uint64_t v19 = a2;
  id v17 = *(id *)(a1 + 40);
  long long v18 = *(_OWORD *)(a1 + 56);
  dispatch_sync(v6, block);
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v10 = @"The user canceled uninstallation.";
      uint64_t v8 = 5;
    }
    else
    {
      if (a2 != 2)
      {
        uint64_t v13 = 0;
        goto LABEL_12;
      }
      uint64_t v8 = 4;
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSApplicationLibraryErrorDomain" code:4 userInfo:0];

      uint64_t v10 = @"The application was instead archived.";
      id v7 = (id)v9;
    }
  }
  else
  {
    if (!v7)
    {
      id v14 = [NSString stringWithFormat:@"recieved IXUninstallDispositionError but the provided error was nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_110_cold_1();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v10 = @"InstallCoordination reurned an error.";
    uint64_t v8 = 1;
  }
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v10 forKey:*MEMORY[0x1E4F28588]];
  if (v7) {
    [v11 setObject:v7 forKey:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v12 = [*(id *)(a1 + 40) fbs_mediumDescription];
  [v11 setObject:v12 forKey:@"FBSALIdentity"];

  [v11 setObject:*(&off_1E58F6EC0 + v8 - 1) forKey:*(void *)off_1E58F4408];
  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSApplicationLibraryErrorDomain" code:v8 userInfo:v11];

LABEL_12:
  [*(id *)(a1 + 48) signalWithContext:v13];
}

uint64_t __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2_111(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = FBSLogApplicationLibrary();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) fbs_shortDescription];
      unint64_t v6 = [*(id *)(a1 + 32) succinctDescription];
      int v16 = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported an error for uninstallation of %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    if (FBSApplicationLibraryLogTransactionEnabled())
    {
      id v7 = (void *)MEMORY[0x1E4F78060];
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v9 = [NSString stringWithFormat:@"IX uninstallation failed."];
      uint64_t v10 = v7;
      uint64_t v11 = 0;
LABEL_10:
      [v10 logStep:0 byParty:11 phase:2 success:v11 forBundleID:v8 description:v9];
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v12 = soft_IXStringForUninstallDisposition(*(void *)(a1 + 64));
      uint64_t v13 = [*(id *)(a1 + 40) fbs_shortDescription];
      int v16 = 138412546;
      id v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported success with disposition \"%@\" for %{public}@", (uint8_t *)&v16, 0x16u);
    }
    if (FBSApplicationLibraryLogTransactionEnabled())
    {
      id v14 = (void *)MEMORY[0x1E4F78060];
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v9 = [NSString stringWithFormat:@"IX uninstallation succeeded."];
      uint64_t v10 = v14;
      uint64_t v11 = 1;
      goto LABEL_10;
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _setPendingUninstall:0];
  return [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _setTentativeUninstall:0];
}

- (NSString)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__FBSApplicationLibrary_description__block_invoke;
  v5[3] = &unk_1E58F5230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__FBSApplicationLibrary_description__block_invoke(uint64_t a1)
{
  id v10 = [off_1E58F44F0 builderWithObject:*(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  id v3 = (id)[v10 appendObject:v2 withName:@"placeholders"];

  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 64) allValues];
  id v5 = (id)[v10 appendObject:v4 withName:@"applications"];

  id v6 = (id)[v10 appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 48) withName:@"usingNetwork"];
  uint64_t v7 = [v10 build];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)removeObserverForToken:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observerQueue = self->_observerQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__FBSApplicationLibrary_removeObserverForToken___block_invoke;
    v7[3] = &unk_1E58F4AB0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(observerQueue, v7);
  }
}

void __48__FBSApplicationLibrary_removeObserverForToken___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;
  }
}

- (id)observeDidAddPlaceholdersWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 0, v4);

  return v5;
}

- (void)_observeType:(void *)a3 withBlock:
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = 0;
  if (a1 && v5)
  {
    id v8 = (void *)[v5 copy];
    uint64_t v9 = objc_opt_new();
    v9[1] = a2;
    id v10 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__FBSApplicationLibrary__observeType_withBlock___block_invoke;
    block[3] = &unk_1E58F5918;
    void block[4] = a1;
    id v15 = v8;
    uint64_t v7 = v9;
    id v14 = v7;
    id v11 = v8;
    dispatch_async(v10, block);
  }
  return v7;
}

- (id)observeDidCancelPlaceholdersWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 1, v4);

  return v5;
}

- (id)observeDidAddApplicationsWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 2, v4);

  return v5;
}

- (id)observeDidReplaceApplicationsWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 3, v4);

  return v5;
}

- (id)observeDidUpdateApplicationsWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 6, v4);

  return v5;
}

- (id)observeDidRemoveApplicationsWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 4, v4);

  return v5;
}

- (id)observeDidDemoteApplicationsWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 5, v4);

  return v5;
}

- (id)observeDidChangeNetworkUsageWithBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x19F3991F0](a3, a2);
  id v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 7, v4);

  return v5;
}

- (void)addApplicationRecord:(id)a3
{
  [a3 fbs_correspondingApplicationProxy];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(FBSApplicationLibrary *)self addApplicationProxy:v4 withOverrideURL:0];
}

- (void)addApplicationProxy:(id)a3 withOverrideURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"proxy"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary addApplicationProxy:withOverrideURL:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v7)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"url == ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationLibrary addApplicationProxy:withOverrideURL:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__FBSApplicationLibrary_addApplicationProxy_withOverrideURL___block_invoke;
  block[3] = &unk_1E58F4AB0;
  void block[4] = self;
  id v13 = v6;
  id v9 = v6;
  dispatch_async(workQueue, block);
}

void __61__FBSApplicationLibrary_addApplicationProxy_withOverrideURL___block_invoke(uint64_t a1)
{
}

- (void)_workQueue_addApplicationProxy:(uint64_t)a1
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1) {
    BSDispatchQueueAssert();
  }
}

- (void)_reloadPlaceholdersNotificationFired
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__FBSApplicationLibrary__reloadPlaceholdersNotificationFired__block_invoke;
  block[3] = &unk_1E58F4B00;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __61__FBSApplicationLibrary__reloadPlaceholdersNotificationFired__block_invoke(uint64_t a1)
{
  uint64_t v2 = FBSLogApplicationLibrary();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C680000, v2, OS_LOG_TYPE_INFO, "Reloading all progress for placeholders...", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 72) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_19];
}

uint64_t __61__FBSApplicationLibrary__reloadPlaceholdersNotificationFired__block_invoke_147(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _reloadProgress];
}

- (id)_synchronizationQueue
{
  return self->_callOutQueue;
}

- (id)_workQueue_currentProcessProxyWithOutURL:(uint64_t)a1
{
  if (a1) {
    BSDispatchQueueAssert();
  }

  return 0;
}

void __48__FBSApplicationLibrary__observeType_withBlock___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:1];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(a1[4] + 32);
  }
  id v6 = (id)MEMORY[0x19F3991F0](a1[6]);
  [v2 setObject:v6 forKey:a1[5]];
}

- (void)_notifyForType:(int)a3 synchronously:(void *)a4 withCastingBlock:
{
  id v7 = a4;
  id v8 = v7;
  if (a1)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke;
    v10[3] = &unk_1E58F6670;
    v10[4] = a1;
    uint64_t v12 = a2;
    id v11 = v7;
    id v9 = (void *)MEMORY[0x19F3991F0](v10);
    if (a3) {
      BSDispatchQueueAssertNot();
    }
    dispatch_async(*(dispatch_queue_t *)(a1 + 104), v9);
  }
}

void __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke_2;
  block[3] = &unk_1E58F6D60;
  uint64_t v5 = a1[6];
  void block[4] = v3;
  uint64_t v18 = v5;
  id v6 = v2;
  id v17 = v6;
  dispatch_sync(v4, block);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(a1[5] + 16))(a1[5]);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v9);
  }
}

void __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*(void *)(*((void *)&v11 + 1) + 8 * v6) + 8) == a1[6])
        {
          uint64_t v7 = [*(id *)(a1[4] + 32) objectForKey:(void)v11];
          uint64_t v8 = (void *)v7;
          if (v7)
          {
            uint64_t v9 = (void *)a1[5];
            uint64_t v10 = (void *)MEMORY[0x19F3991F0](v7);
            [v9 addObject:v10];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)_notifyDidAddPlaceholders:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v3;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of placeholders added: %{public}@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) applicationIdentity];
          long long v11 = [v10 fbs_mediumDescription];

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            long long v12 = (void *)MEMORY[0x1E4F78060];
            long long v13 = [NSString stringWithFormat:@"Notifying observers of placeholder add."];
            [v12 logStep:8 byParty:11 phase:3 success:1 forBundleID:v11 description:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__FBSApplicationLibrary__notifyDidAddPlaceholders___block_invoke;
    v15[3] = &unk_1E58F5128;
    id v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 0, 1, v15);

    id v3 = v14;
  }
}

uint64_t __51__FBSApplicationLibrary__notifyDidAddPlaceholders___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidCancelPlaceholders:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v3;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of placeholders cancelled: %{public}@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) applicationIdentity];
          long long v11 = [v10 fbs_mediumDescription];

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            long long v12 = (void *)MEMORY[0x1E4F78060];
            long long v13 = [NSString stringWithFormat:@"Notifying observers of placeholder cancelled."];
            [v12 logStep:9 byParty:11 phase:3 success:1 forBundleID:v11 description:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__FBSApplicationLibrary__notifyDidCancelPlaceholders___block_invoke;
    v15[3] = &unk_1E58F5128;
    id v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 1, 1, v15);

    id v3 = v14;
  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidCancelPlaceholders___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidAddApplications:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v3;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications added: %{public}@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) applicationIdentity];
          long long v11 = [v10 fbs_mediumDescription];

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            long long v12 = (void *)MEMORY[0x1E4F78060];
            long long v13 = [NSString stringWithFormat:@"Notifying observers of application added."];
            [v12 logStep:10 byParty:11 phase:3 success:1 forBundleID:v11 description:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__FBSApplicationLibrary__notifyDidAddApplications___block_invoke;
    v15[3] = &unk_1E58F5128;
    id v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 2, 1, v15);

    id v3 = v14;
  }
}

uint64_t __51__FBSApplicationLibrary__notifyDidAddApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidReplaceApplications:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 objectEnumerator];
      uint64_t v6 = [v5 allObjects];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v6;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications replaced: %{public}@", buf, 0xCu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v3;
    uint64_t v7 = [v3 objectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) applicationIdentity];
          long long v13 = [v12 fbs_mediumDescription];

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            id v14 = (void *)MEMORY[0x1E4F78060];
            long long v15 = [NSString stringWithFormat:@"Notifying observers of application replaced."];
            [v14 logStep:11 byParty:11 phase:3 success:1 forBundleID:v13 description:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__FBSApplicationLibrary__notifyDidReplaceApplications___block_invoke;
    v17[3] = &unk_1E58F5128;
    id v3 = v16;
    id v18 = v16;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 3, 1, v17);
  }
}

uint64_t __55__FBSApplicationLibrary__notifyDidReplaceApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidUpdateApplications:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 objectEnumerator];
      uint64_t v6 = [v5 allObjects];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v6;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications updated: %{public}@", buf, 0xCu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v3;
    uint64_t v7 = [v3 objectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) applicationIdentity];
          long long v13 = [v12 fbs_mediumDescription];

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            id v14 = (void *)MEMORY[0x1E4F78060];
            long long v15 = [NSString stringWithFormat:@"Notifying observers of application updated."];
            [v14 logStep:14 byParty:11 phase:3 success:1 forBundleID:v13 description:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__FBSApplicationLibrary__notifyDidUpdateApplications___block_invoke;
    v17[3] = &unk_1E58F5128;
    id v3 = v16;
    id v18 = v16;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 6, 1, v17);
  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidUpdateApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidRemoveApplications:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v3;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications removed: %{public}@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            long long v11 = (void *)MEMORY[0x1E4F78060];
            long long v12 = [v10 bundleIdentifier];
            long long v13 = [NSString stringWithFormat:@"Notifying observers of application removed."];
            [v11 logStep:12 byParty:11 phase:3 success:1 forBundleID:v12 description:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__FBSApplicationLibrary__notifyDidRemoveApplications___block_invoke;
    v15[3] = &unk_1E58F5128;
    id v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 4, 1, v15);

    id v3 = v14;
  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidRemoveApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidDemoteApplications:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v3;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications demoted: %{public}@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            long long v11 = (void *)MEMORY[0x1E4F78060];
            long long v12 = [v10 bundleIdentifier];
            long long v13 = [NSString stringWithFormat:@"Notifying observers of application demoted."];
            [v11 logStep:13 byParty:11 phase:3 success:1 forBundleID:v12 description:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__FBSApplicationLibrary__notifyDidDemoteApplications___block_invoke;
    v15[3] = &unk_1E58F5128;
    id v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 5, 1, v15);

    id v3 = v14;
  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidDemoteApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)_notifyDidChangeNetworkUsage:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = a2;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "Notifying observers of network usage changed: usingNetwork=%d", buf, 8u);
    }

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__FBSApplicationLibrary__notifyDidChangeNetworkUsage___block_invoke;
    v5[3] = &__block_descriptor_33_e8_v16__0_8l;
    char v6 = a2;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 7, 0, v5);
  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidChangeNetworkUsage___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (id)_identitiesForProxy:(void *)a3 outRecord:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"proxy"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v7 = [v5 fbs_correspondingApplicationRecord];
    int v8 = v7;
    if (a3) {
      *a3 = v7;
    }
    if (v8)
    {
      char v9 = [a1[1] isPersonaAware];
      uint64_t v10 = [v8 identities];
      a1 = v10;
      if ((v9 & 1) == 0)
      {
        long long v11 = [v10 firstObject];
        v15[0] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

        a1 = (id *)v12;
      }
    }
    else
    {
      a1 = (id *)MEMORY[0x1E4F1CBF0];
    }
  }

  return a1;
}

void __30__FBSApplicationLibrary__load__block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v2 = FBSLogApplicationLibrary();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C680000, v2, OS_LOG_TYPE_DEFAULT, "Loading application library...", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) addObserver:];
  BSContinuousMachTimeNow();
}

void __30__FBSApplicationLibrary__load__block_invoke_184(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if (_proxyPassesInclusionFilter(v3, *(void **)(a1 + 64), *(void **)(a1 + 40)))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = *(id **)(a1 + 48);
    id v14 = 0;
    id v5 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](v4, v3, &v14);
    id v6 = v14;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (_proxyPassesIdentityFilter(v11, v6, *(void **)(a1 + 72), *(void **)(a1 + 40)))
          {
            uint64_t v12 = [v6 fbs_processIdentityForApplicationIdentity:v11];
            long long v13 = (void *)[objc_alloc(*(Class *)(a1 + 80)) _initWithApplicationProxy:v3 record:v6 appIdentity:v11 processIdentity:v12 overrideURL:0];
            os_unfair_lock_lock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___ApplicationLock);
            [*(id *)(a1 + 56) addObject:v13];
            os_unfair_lock_unlock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___ApplicationLock);
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

void __30__FBSApplicationLibrary__load__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if (_proxyPassesInclusionFilter(v3, *(void **)(a1 + 56), 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = *(id **)(a1 + 40);
    id v13 = 0;
    id v5 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](v4, v3, &v13);
    id v6 = v13;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (_proxyPassesIdentityFilter(v11, v6, *(void **)(a1 + 64), 0))
          {
            uint64_t v12 = (void *)[objc_alloc(*(Class *)(a1 + 72)) _initWithApplicationProxy:v3 identity:v11];
            os_unfair_lock_lock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___PlaceholderLock);
            [*(id *)(a1 + 48) addObject:v12];
            os_unfair_lock_unlock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___PlaceholderLock);
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

void __30__FBSApplicationLibrary__load__block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        -[FBSApplicationLibrary _workQueue_addApplication:](*(void *)(a1 + 40), *(void **)(*((void *)&v16 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[FBSApplicationLibrary _workQueue_addPlaceholder:](*(void *)(a1 + 40), *(void **)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_workQueue_addApplication:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = v3;
    NSClassFromString(&cfstr_Fbsapplication_18.isa);
    if (!v5)
    {
      long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_addApplication:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSApplicationInfoClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_addApplication:]();
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
    }

    uint64_t v6 = [v5 applicationIdentity];
    id v7 = [v6 identityString];
    uint64_t v8 = [*(id *)(a1 + 64) objectForKey:v7];

    if (v8)
    {
      uint64_t v9 = FBSLogApplicationLibrary();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_addApplication:]();
      }
    }
    [*(id *)(a1 + 64) setObject:v5 forKey:v7];
    -[FBSApplicationLibrary _workQueue_didAddBundleInfo:](a1, v5);
    uint64_t v10 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 succinctDescription];
      *(_DWORD *)buf = 138412290;
      long long v15 = v11;
      _os_log_impl(&dword_19C680000, v10, OS_LOG_TYPE_DEFAULT, "Added application: %@", buf, 0xCu);
    }
  }
}

- (void)_workQueue_addPlaceholder:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = v3;
    NSClassFromString(&cfstr_Fbsapplication_2.isa);
    if (!v5)
    {
      long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_addPlaceholder:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSApplicationPlaceholderClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_addPlaceholder:]();
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
    }

    uint64_t v6 = [v5 applicationIdentity];
    id v7 = [v6 identityString];
    uint64_t v8 = [*(id *)(a1 + 72) objectForKey:v7];

    if (v8)
    {
      uint64_t v9 = FBSLogApplicationLibrary();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FBSApplicationLibrary _workQueue_addPlaceholder:]();
      }
    }
    [*(id *)(a1 + 72) setObject:v5 forKey:v7];
    [v5 setAppLibrary:a1];
    -[FBSApplicationLibrary _workQueue_didAddBundleInfo:](a1, v5);
    uint64_t v10 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 succinctDescription];
      *(_DWORD *)buf = 138412290;
      long long v15 = v11;
      _os_log_impl(&dword_19C680000, v10, OS_LOG_TYPE_DEFAULT, "Added placeholder: %@", buf, 0xCu);
    }
  }
}

- (id)_workQueue_addPlaceholderWithIdentity:(void *)a3 forProxy:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1
    && ([v6 appState],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isPlaceholder],
        v8,
        v9))
  {
    id v18 = 0;
    uint64_t v10 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](a1, v7, &v18);
    id v11 = v18;
    int v12 = [v10 containsObject:v5];

    long long v13 = 0;
    if (v12)
    {
      if (-[FBSApplicationLibrary _workQueue_placeholderPassesFilter:record:identity:]((uint64_t)a1, v7, v11, v5))
      {
        long long v14 = (void *)MEMORY[0x19F398F90]();
        long long v13 = [[objc_alloc((Class)objc_msgSend(a1[1], "applicationPlaceholderClass")) _initWithApplicationProxy:v7 identity:v5] longLongValue];
        -[FBSApplicationLibrary _workQueue_addPlaceholder:]((uint64_t)a1, v13);
      }
      else
      {
        long long v15 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v5 fbs_shortDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v16;
          _os_log_impl(&dword_19C680000, v15, OS_LOG_TYPE_DEFAULT, "Not creating placeholder because it is filtered: %@", buf, 0xCu);
        }
        long long v13 = 0;
      }
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)_workQueue_addApplicationWithIdentity:(void *)a3 forProxy:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1
    && ([v6 appState],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isInstalled],
        v8,
        v9))
  {
    id v19 = 0;
    uint64_t v10 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](a1, v7, &v19);
    id v11 = v19;
    int v12 = [v10 containsObject:v5];

    long long v13 = 0;
    if (v12)
    {
      if (-[FBSApplicationLibrary _workQueue_applicationPassesFilter:record:identity:]((uint64_t)a1, v7, v11, v5))
      {
        long long v14 = (void *)MEMORY[0x19F398F90]();
        long long v15 = [v11 fbs_processIdentityForApplicationIdentity:v5];
        long long v13 = [[objc_alloc((Class)objc_msgSend(a1[1], "applicationInfoClass")) _initWithApplicationProxy:v7 record:v11 appIdentity:v5 processIdentity:v15 overrideURL:0]];
        -[FBSApplicationLibrary _workQueue_addApplication:]((uint64_t)a1, v13);
      }
      else
      {
        uint64_t v16 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = [v5 fbs_shortDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v17;
          _os_log_impl(&dword_19C680000, v16, OS_LOG_TYPE_DEFAULT, "Not creating app because it is filtered: %@", buf, 0xCu);
        }
        long long v13 = 0;
      }
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (uint64_t)_workQueue_applicationPassesFilter:(void *)a3 record:(void *)a4 identity:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    int v9 = *(void **)(a1 + 8);
    id v10 = a2;
    id v11 = [v9 installedApplicationFilter];
    int v12 = _proxyPassesInclusionFilter(v10, v11, *(void **)(a1 + 80));

    unsigned int v13 = 0;
    if (v7 && v8)
    {
      long long v14 = [*(id *)(a1 + 8) applicationIdentityFilter];
      unsigned int v13 = _proxyPassesIdentityFilter(v8, v7, v14, *(void **)(a1 + 80));
    }
    a1 = v12 & v13;
  }

  return a1;
}

- (void)_workQueue_didAddBundleInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    uint64_t v4 = [v3 bundleIdentifier];
    id v5 = [*(id *)(a1 + 56) objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_opt_new();
      [*(id *)(a1 + 56) setObject:v5 forKey:v4];
    }
    id v6 = [v7 applicationIdentity];
    [v5 addObject:v6];

    id v3 = v7;
  }
}

- (uint64_t)_workQueue_placeholderPassesFilter:(void *)a3 record:(void *)a4 identity:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    int v9 = *(void **)(a1 + 8);
    id v10 = a2;
    id v11 = [v9 placeholderFilter];
    int v12 = _proxyPassesInclusionFilter(v10, v11, 0);

    unsigned int v13 = 0;
    if (v7 && v8)
    {
      long long v14 = [*(id *)(a1 + 8) placeholderIdentityFilter];
      unsigned int v13 = _proxyPassesIdentityFilter(v8, v7, v14, 0);
    }
    a1 = v12 & v13;
  }

  return a1;
}

- (id)_workQueue_removeApplicationForIdentity:(id *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[FBSApplicationLibrary _workQueue_applicationForIdentity:](a1, v3);
    if (v4)
    {
      id v5 = FBSLogApplicationLibrary();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v4 succinctDescription];
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_19C680000, v5, OS_LOG_TYPE_DEFAULT, "Removed application: %@", (uint8_t *)&v10, 0xCu);
      }
      id v7 = a1[8];
      id v8 = [v3 identityString];
      [v7 removeObjectForKey:v8];

      -[FBSApplicationLibrary _workQueue_didRemoveBundleInfo:](a1, v4);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_workQueue_didRemoveBundleInfo:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v11 = v3;
    uint64_t v4 = [v3 applicationIdentity];
    id v5 = [v4 identityString];
    uint64_t v6 = [a1[8] objectForKey:v5];

    uint64_t v7 = [a1[9] objectForKey:v5];
    uint64_t v8 = v6 | v7;

    if (!v8)
    {
      int v9 = [v11 bundleIdentifier];
      int v10 = [a1[7] objectForKey:v9];
      [v10 removeObject:v4];
      if (![v10 count]) {
        [a1[7] removeObjectForKey:v9];
      }
    }
    id v3 = v11;
  }
}

- (id)_workQueue_removePlaceholderForIdentity:(id *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](a1, v3);
    if (v4)
    {
      id v5 = FBSLogApplicationLibrary();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [v4 succinctDescription];
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_19C680000, v5, OS_LOG_TYPE_DEFAULT, "Removed placeholder: %@", (uint8_t *)&v10, 0xCu);
      }
      id v7 = a1[9];
      uint64_t v8 = [v3 identityString];
      [v7 removeObjectForKey:v8];

      [v4 setAppLibrary:0];
      -[FBSApplicationLibrary _workQueue_didRemoveBundleInfo:](a1, v4);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_workQueue_applicationsForProxies:(id *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v18 = v3;
  if (a1)
  {
    uint64_t v4 = v3;
    id v5 = [MEMORY[0x1E4F1CA48] array:v3];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v11 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](a1, v10, 0);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = -[FBSApplicationLibrary _workQueue_applicationForIdentity:](a1, *(void **)(*((void *)&v20 + 1) + 8 * j));
                if (v16) {
                  [v5 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)_workQueue_applicationNeedsRegeneration:(void *)a3 fromProxy:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if (v5)
    {
      uint64_t v8 = [v6 bundleURL];
      int v9 = [v8 path];

      int v10 = [v5 bundleURL];
      id v11 = [v10 path];
      char v12 = [v9 isEqual:v11];

      if (v12)
      {
        [v5 lastModifiedDate];
        BSModificationDateForPath();
      }
      uint64_t v14 = FBSLogApplicationLibrary();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [v5 applicationIdentity];
        uint64_t v16 = [v15 fbs_shortDescription];
        int v18 = 138543362;
        id v19 = v16;
        _os_log_impl(&dword_19C680000, v14, OS_LOG_TYPE_DEFAULT, "Regenerating application %{public}@ due to bundle path mismatch", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_fixupAdded:(void *)a3 removed:(id *)a4 replaced:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1
    && ([*(id *)(a1 + 8) isPersonaAware] & 1) == 0
    && [v8 count] == 1
    && [v7 count] == 1)
  {
    int v9 = [v8 firstObject];
    int v10 = [v7 firstObject];
    id v11 = [v9 bundleIdentifier];
    char v12 = [v10 bundleIdentifier];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      uint64_t v14 = FBSLogApplicationLibrary();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [v10 bundleIdentifier];
        int v18 = 138543362;
        id v19 = v15;
        _os_log_impl(&dword_19C680000, v14, OS_LOG_TYPE_DEFAULT, "[59555749] making persona change of %{public}@ a replacement instead of remove+add", (uint8_t *)&v18, 0xCu);
      }
      [v7 removeObjectIdenticalTo:v10];
      [v8 removeObjectIdenticalTo:v9];
      id v16 = *a4;
      if (!v16)
      {
        id v17 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
        *a4 = v17;
        id v16 = v17;
      }
      [v16 setObject:v10 forKey:v9];
    }
  }
}

- (void)applicationInstallsDidStart:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = [v7 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[FBSApplicationLibrary applicationInstallsDidStart:]";
          *(_WORD *)&uint8_t buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v4);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__9;
  uint64_t v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__9;
  long long v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FBSApplicationLibrary_applicationInstallsDidStart___block_invoke;
  block[3] = &unk_1E58F6DF8;
  id v11 = v3;
  id v14 = v11;
  long long v15 = self;
  id v16 = buf;
  id v17 = &v18;
  dispatch_sync(workQueue, block);
  if ([(id)v19[5] count]) {
    -[FBSApplicationLibrary _notifyDidAddPlaceholders:]((uint64_t)self, (void *)v19[5]);
  }
  if ([*(id *)(*(void *)&buf[8] + 40) count]) {
    -[FBSApplicationLibrary _notifyDidDemoteApplications:]((uint64_t)self, *(void **)(*(void *)&buf[8] + 40));
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(buf, 8);
}

void __53__FBSApplicationLibrary_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v24 + 1) + 8 * v2);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v4 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 40), v3, 0);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v21;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v21 != v7) {
                objc_enumerationMutation(v4);
              }
              int v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
              if (FBSInstallTypeIsCloudDemoted([v3 installType]))
              {
                int v10 = -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(a1 + 40), v9);
                if (v10)
                {
                  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
                  id v19 = *(id *)(v11 + 40);
                  _addResultToArrayCreatingArrayIfNecessary(&v19, v10);
                  objc_storeStrong((id *)(v11 + 40), v19);
                }
              }
              char v12 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(a1 + 40), v9);
              if (v12)
              {
                int v13 = v12;
                [v12 _setProxy:v3];
                [v13 _noteChangedSignificantly];
              }
              else
              {
                int v13 = -[FBSApplicationLibrary _workQueue_addPlaceholderWithIdentity:forProxy:](*(id **)(a1 + 40), v9, v3);
                uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
                id v18 = *(id *)(v14 + 40);
                _addResultToArrayCreatingArrayIfNecessary(&v18, v13);
                objc_storeStrong((id *)(v14 + 40), v18);
              }

              ++v8;
            }
            while (v6 != v8);
            uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v6);
        }

        ++v2;
      }
      while (v2 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v17);
  }
}

- (void)applicationInstallsDidChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          long long v22 = "-[FBSApplicationLibrary applicationInstallsDidChange:]";
          __int16 v23 = 2114;
          long long v24 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_INFO, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FBSApplicationLibrary_applicationInstallsDidChange___block_invoke;
  block[3] = &unk_1E58F4AB0;
  id v15 = v3;
  uint64_t v16 = self;
  id v12 = v3;
  dispatch_async(workQueue, block);
}

void __54__FBSApplicationLibrary_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v2;
        id v3 = *(void **)(*((void *)&v22 + 1) + 8 * v2);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v4 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 40), v3, 0);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v19 != v7) {
                objc_enumerationMutation(v4);
              }
              int v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              int v10 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(a1 + 40), v9);
              uint64_t v11 = v10;
              if (v10)
              {
                [v10 _setProxy:v3];
              }
              else
              {
                id v12 = FBSLogApplicationLibrary();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  int v13 = [v9 fbs_shortDescription];
                  *(_DWORD *)buf = 138543362;
                  long long v27 = v13;
                  _os_log_impl(&dword_19C680000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring install did change unknown placeholder %{public}@", buf, 0xCu);
                }
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v16);
  }
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          long long v22 = "-[FBSApplicationLibrary applicationInstallsDidUpdateIcon:]";
          __int16 v23 = 2114;
          long long v24 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FBSApplicationLibrary_applicationInstallsDidUpdateIcon___block_invoke;
  block[3] = &unk_1E58F4AB0;
  id v15 = v3;
  uint64_t v16 = self;
  id v12 = v3;
  dispatch_async(workQueue, block);
}

void __58__FBSApplicationLibrary_applicationInstallsDidUpdateIcon___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v19 + 1) + 8 * v5);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v7 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 40), v6, 0);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(a1 + 40), *(void **)(*((void *)&v15 + 1) + 8 * v11));
              int v13 = v12;
              if (v12)
              {
                [v12 _setProxy:v6];
                [v13 _noteChangedSignificantly];
              }

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v3);
  }
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v8 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[FBSApplicationLibrary applicationsDidInstall:]";
          *(_WORD *)&uint8_t buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
        uint64_t v10 = [v7 appState];
        int v11 = [v10 isPlaceholder];

        if (v11)
        {
          long long v17 = [NSString stringWithFormat:@"was handed a placeholder appProxy during applicationsDidInstall: %@", v7];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSApplicationLibrary applicationsDidInstall:]();
          }
          [v17 UTF8String];
          _bs_set_crash_log_message();
        }
        id v12 = [v7 appState];
        int v13 = [v12 isInstalled];

        if ((v13 & 1) == 0)
        {
          long long v18 = [NSString stringWithFormat:@"was handed a not-installed appProxy during applicationsDidInstall: %@", v7];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSApplicationLibrary applicationsDidInstall:]();
          }
          [v18 UTF8String];
          _bs_set_crash_log_message();
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v4);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__9;
  id v51 = __Block_byref_object_dispose__9;
  id v52 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  SEL v42 = __Block_byref_object_copy__9;
  v43 = __Block_byref_object_dispose__9;
  id v44 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__9;
  v37 = __Block_byref_object_dispose__9;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__9;
  id v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke;
  block[3] = &unk_1E58F6E20;
  void block[4] = self;
  id v15 = v3;
  id v22 = v15;
  __int16 v23 = &v33;
  long long v24 = &v39;
  uint64_t v25 = buf;
  uint64_t v26 = &v27;
  dispatch_sync(workQueue, block);
  if ([(id)v34[5] count]) {
    -[FBSApplicationLibrary _notifyDidCancelPlaceholders:]((uint64_t)self, (void *)v34[5]);
  }
  if ([(id)v40[5] count]) {
    -[FBSApplicationLibrary _notifyDidRemoveApplications:]((uint64_t)self, (void *)v40[5]);
  }
  if ([*(id *)(*(void *)&buf[8] + 40) count]) {
    -[FBSApplicationLibrary _notifyDidAddApplications:]((uint64_t)self, *(void **)(*(void *)&buf[8] + 40));
  }
  if ([(id)v28[5] count]) {
    -[FBSApplicationLibrary _notifyDidReplaceApplications:]((uint64_t)self, (void *)v28[5]);
  }
  long long v16 = self->_workQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_236;
  v20[3] = &unk_1E58F4B00;
  v20[4] = self;
  dispatch_sync(v16, v20);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);
}

void __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    ++*(void *)(v2 + 88);
  }
  id v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = objc_opt_new();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = *(id *)(v1 + 40);
  uint64_t v58 = v1;
  uint64_t v59 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v79 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v7 = [v6 bundleIdentifier];
        uint64_t v8 = [*(id *)(*(void *)(v1 + 32) + 56) objectForKey:v7];
        [v3 unionSet:v8];

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v9 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(v1 + 32), v6, 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v74 objects:v88 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v75;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v75 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v74 + 1) + 8 * j);
              [v4 setObject:v6 forKey:v14];
              [v3 removeObject:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v74 objects:v88 count:16];
          }
          while (v11);
        }

        uint64_t v1 = v58;
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
    }
    while (v59);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v15 = v3;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v70 objects:v87 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v70 + 1) + 8 * k);
        long long v21 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_cold_1(v85, v20, &v86, v21);
        }

        id v22 = -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v1 + 32), v20);
        if (v22)
        {
          uint64_t v23 = *(void *)(*(void *)(v1 + 48) + 8);
          id v69 = *(id *)(v23 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v69, v22);
          objc_storeStrong((id *)(v23 + 40), v69);
        }
        long long v24 = -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v1 + 32), v20);
        if (v24)
        {
          uint64_t v25 = *(void *)(*(void *)(v1 + 56) + 8);
          id v68 = *(id *)(v25 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v68, v24);
          objc_storeStrong((id *)(v25 + 40), v68);
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v70 objects:v87 count:16];
    }
    while (v17);
  }
  id v57 = v15;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v26 = v4;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v84 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v65;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v65 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v64 + 1) + 8 * m);
        id v32 = [v26 objectForKey:v31];
        uint64_t v33 = -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v1 + 32), v31);
        id v34 = -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(void **)(v1 + 32), v31);
        if ((-[FBSApplicationLibrary _workQueue_applicationNeedsRegeneration:fromProxy:](*(void *)(v1 + 32), v34, v32) & 1) == 0)
        {
          v43 = FBSLogApplicationLibrary();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            id v44 = [v31 fbs_shortDescription];
            *(_DWORD *)buf = 138543362;
            v83 = v44;
            _os_log_impl(&dword_19C680000, v43, OS_LOG_TYPE_DEFAULT, "Not regenerating app for identity: %{public}@", buf, 0xCu);
          }
          [v34 _setInstalling:0];
          uint64_t v35 = 0;
          goto LABEL_54;
        }
        uint64_t v35 = -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v1 + 32), v31);

        v36 = -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(v1 + 32), v31, v32);
        v37 = v36;
        if (v36) {
          BOOL v38 = v35 == 0;
        }
        else {
          BOOL v38 = 0;
        }
        if (v38)
        {
          uint64_t v46 = *(void *)(*(void *)(v1 + 64) + 8);
          id v63 = *(id *)(v46 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v63, v36);
          objc_storeStrong((id *)(v46 + 40), v63);
          uint64_t v35 = 0;
          goto LABEL_62;
        }
        if (v36) {
          BOOL v39 = v35 == 0;
        }
        else {
          BOOL v39 = 1;
        }
        if (!v39 && v36 != v35)
        {
          long long v47 = *(void **)(*(void *)(*(void *)(v1 + 72) + 8) + 40);
          if (!v47)
          {
            uint64_t v48 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
            uint64_t v49 = *(void *)(*(void *)(v1 + 72) + 8);
            v50 = *(void **)(v49 + 40);
            *(void *)(v49 + 40) = v48;

            long long v47 = *(void **)(*(void *)(*(void *)(v1 + 72) + 8) + 40);
          }
          [v47 setObject:v37 forKey:v35];
          goto LABEL_62;
        }
        if (v36) {
          goto LABEL_62;
        }
        if (v35)
        {
          uint64_t v41 = *(void *)(*(void *)(v1 + 56) + 8);
          id v62 = *(id *)(v41 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v62, v35);
          id v42 = v62;
          id v34 = *(void **)(v41 + 40);
          *(void *)(v41 + 40) = v42;
          uint64_t v1 = v58;
LABEL_54:
        }
        if (v33)
        {
          uint64_t v45 = *(void *)(*(void *)(v1 + 48) + 8);
          id v61 = *(id *)(v45 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v61, v33);
          objc_storeStrong((id *)(v45 + 40), v61);
        }
        v37 = 0;
LABEL_62:
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v84 count:16];
    }
    while (v28);
  }

  uint64_t v51 = *(void *)(v1 + 32);
  id v52 = *(void **)(*(void *)(*(void *)(v1 + 64) + 8) + 40);
  v53 = *(void **)(*(void *)(*(void *)(v1 + 56) + 8) + 40);
  uint64_t v54 = *(void *)(*(void *)(v1 + 72) + 8);
  id v60 = *(id *)(v54 + 40);
  -[FBSApplicationLibrary _fixupAdded:removed:replaced:](v51, v52, v53, &v60);
  objc_storeStrong((id *)(v54 + 40), v60);
}

void __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_236(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 88);
    if (v2)
    {
      *(void *)(v1 + 88) = v2 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](v1);
    }
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v8 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[FBSApplicationLibrary applicationsDidUninstall:]";
          *(_WORD *)&uint8_t buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v4);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__9;
  id v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__9;
  uint64_t v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke;
  block[3] = &unk_1E58F6DF8;
  void block[4] = self;
  id v11 = v3;
  id v16 = v11;
  uint64_t v17 = &v19;
  uint64_t v18 = buf;
  dispatch_sync(workQueue, block);
  if ([*(id *)(*(void *)&buf[8] + 40) count]) {
    -[FBSApplicationLibrary _notifyDidCancelPlaceholders:]((uint64_t)self, *(void **)(*(void *)&buf[8] + 40));
  }
  if ([(id)v20[5] count]) {
    -[FBSApplicationLibrary _notifyDidRemoveApplications:]((uint64_t)self, (void *)v20[5]);
  }
  uint64_t v12 = self->_workQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke_2;
  v14[3] = &unk_1E58F4B00;
  v14[4] = self;
  dispatch_sync(v12, v14);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);
}

void __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    ++*(void *)(v2 + 88);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v5 = [v4 bundleIdentifier];
        uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v7 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 32), v4, 0);
        uint64_t v8 = [v6 setWithArray:v7];

        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v5];
        [v8 unionSet:v9];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              id v16 = -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(a1 + 32), v15);
              if (v16)
              {
                uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
                id v24 = *(id *)(v17 + 40);
                _addResultToArrayCreatingArrayIfNecessary(&v24, v16);
                objc_storeStrong((id *)(v17 + 40), v24);
              }
              uint64_t v18 = -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(a1 + 32), v15);
              if (v18)
              {
                uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
                id v23 = *(id *)(v19 + 40);
                _addResultToArrayCreatingArrayIfNecessary(&v23, v18);
                objc_storeStrong((id *)(v19 + 40), v23);
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v12);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v22);
  }
}

void __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 88);
    if (v2)
    {
      *(void *)(v1 + 88) = v2 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](v1);
    }
  }
}

- (void)_handleApplicationStateDidChange:(int)a3 notifyForUpdateInsteadOfReplacement:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    uint64_t v45 = __Block_byref_object_copy__9;
    uint64_t v46 = __Block_byref_object_dispose__9;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    BOOL v39 = __Block_byref_object_copy__9;
    v40 = __Block_byref_object_dispose__9;
    id v41 = 0;
    uint64_t v30 = 0;
    long long v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__9;
    uint64_t v34 = __Block_byref_object_dispose__9;
    id v35 = 0;
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__9;
    long long v28 = __Block_byref_object_dispose__9;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__9;
    uint64_t v22 = __Block_byref_object_dispose__9;
    id v23 = 0;
    uint64_t v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke;
    block[3] = &unk_1E58F6E48;
    void block[4] = a1;
    id v12 = v5;
    uint64_t v13 = &v36;
    uint64_t v14 = &v24;
    id v15 = &v18;
    id v16 = &v30;
    uint64_t v17 = &v42;
    dispatch_sync(v7, block);
    if ([(id)v43[5] count]) {
      -[FBSApplicationLibrary _notifyDidAddPlaceholders:](a1, (void *)v43[5]);
    }
    if ([(id)v37[5] count]) {
      -[FBSApplicationLibrary _notifyDidCancelPlaceholders:](a1, (void *)v37[5]);
    }
    if ([(id)v31[5] count]) {
      -[FBSApplicationLibrary _notifyDidAddApplications:](a1, (void *)v31[5]);
    }
    if ([(id)v25[5] count]) {
      -[FBSApplicationLibrary _notifyDidRemoveApplications:](a1, (void *)v25[5]);
    }
    if ([(id)v19[5] count])
    {
      uint64_t v8 = (void *)v19[5];
      if (a3) {
        -[FBSApplicationLibrary _notifyDidUpdateApplications:](a1, v8);
      }
      else {
        -[FBSApplicationLibrary _notifyDidReplaceApplications:](a1, v8);
      }
    }
    uint64_t v9 = *(NSObject **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke_237;
    v10[3] = &unk_1E58F4B00;
    v10[4] = a1;
    dispatch_sync(v9, v10);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
}

void __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke(uint64_t a1)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    ++*(void *)(v1 + 88);
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v5 = a1;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v71 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v71)
  {
    uint64_t v68 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v99 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        long long v73 = [v7 bundleIdentifier];
        uint64_t v8 = [*(id *)(*(void *)(v5 + 32) + 56) objectForKey:];
        [v2 unionSet:v8];

        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        uint64_t v9 = -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(v5 + 32), v7, 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v94 objects:v107 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v95 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v94 + 1) + 8 * j);
              if ([v2 containsObject:v14]) {
                id v15 = v4;
              }
              else {
                id v15 = v3;
              }
              [v15 setObject:v7 forKey:v14];
              [v2 removeObject:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v94 objects:v107 count:16];
          }
          while (v11);
        }

        uint64_t v5 = a1;
      }
      uint64_t v71 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
    }
    while (v71);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v70 = v2;
  uint64_t v16 = [v70 countByEnumeratingWithState:&v90 objects:v106 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v91;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v91 != v18) {
          objc_enumerationMutation(v70);
        }
        uint64_t v20 = *(void **)(*((void *)&v90 + 1) + 8 * k);
        uint64_t v21 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v20 fbs_shortDescription];
          *(_DWORD *)buf = 138412290;
          v105 = v22;
          _os_log_impl(&dword_19C680000, v21, OS_LOG_TYPE_DEFAULT, "Abandoned identity: %@", buf, 0xCu);
        }
        id v23 = -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v5 + 32), v20);
        if (v23)
        {
          uint64_t v24 = *(void *)(*(void *)(v5 + 48) + 8);
          id v89 = *(id *)(v24 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v89, v23);
          objc_storeStrong((id *)(v24 + 40), v89);
        }
        long long v25 = -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v5 + 32), v20);
        if (v25)
        {
          uint64_t v26 = *(void *)(*(void *)(v5 + 56) + 8);
          id v88 = *(id *)(v26 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v88, v25);
          objc_storeStrong((id *)(v26 + 40), v88);
        }
      }
      uint64_t v17 = [v70 countByEnumeratingWithState:&v90 objects:v106 count:16];
    }
    while (v17);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v74 = v4;
  uint64_t v27 = [v74 countByEnumeratingWithState:&v84 objects:v103 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v72 = *(void *)v85;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v85 != v72) {
          objc_enumerationMutation(v74);
        }
        uint64_t v30 = *(void **)(*((void *)&v84 + 1) + 8 * m);
        long long v31 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [v30 fbs_shortDescription];
          *(_DWORD *)buf = 138412290;
          v105 = v32;
          _os_log_impl(&dword_19C680000, v31, OS_LOG_TYPE_DEFAULT, "Updated identity: %@", buf, 0xCu);
        }
        uint64_t v33 = [v74 objectForKey:v30];
        uint64_t v34 = -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v5 + 32), v30);
        if (v34)
        {
          id v35 = [v33 appState];
          int v36 = [v35 isInstalled];

          if (v36)
          {
            v37 = -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(v5 + 32), v30, v33);
            if (v37)
            {
              uint64_t v38 = *(void **)(*(void *)(*(void *)(v5 + 64) + 8) + 40);
              if (!v38)
              {
                uint64_t v39 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
                uint64_t v40 = *(void *)(*(void *)(v5 + 64) + 8);
                id v41 = *(void **)(v40 + 40);
                *(void *)(v40 + 40) = v39;

                uint64_t v38 = *(void **)(*(void *)(*(void *)(v5 + 64) + 8) + 40);
              }
              [v38 setObject:v37 forKey:v34];
            }
            else
            {
              uint64_t v42 = *(void *)(*(void *)(v5 + 56) + 8);
              id v83 = *(id *)(v42 + 40);
              _addResultToArrayCreatingArrayIfNecessary(&v83, v34);
              objc_storeStrong((id *)(v42 + 40), v83);
            }
          }
          else
          {
            v37 = FBSLogApplicationLibrary();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19C680000, v37, OS_LOG_TYPE_DEFAULT, "Found an app with updated identity, but proxy is not a app. Ignoring.", buf, 2u);
            }
          }
        }
        v43 = -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(void **)(v5 + 32), v30);
        if (v43)
        {
          uint64_t v44 = [v33 appState];
          int v45 = [v44 isPlaceholder];

          if (v45)
          {
            uint64_t v46 = [v33 fbs_correspondingApplicationRecord];
            if (!v46)
            {
              id v47 = FBSLogApplicationLibrary();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v105 = v33;
                _os_log_error_impl(&dword_19C680000, v47, OS_LOG_TYPE_ERROR, "No corresponding record for placeholder: %@", buf, 0xCu);
              }
            }
            if (-[FBSApplicationLibrary _workQueue_placeholderPassesFilter:record:identity:](*(void *)(v5 + 32), v33, v46, v30))
            {
              [v43 _setProxy:v33];
            }
            else
            {
              id v48 = -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v5 + 32), v30);
              uint64_t v49 = *(void *)(*(void *)(v5 + 48) + 8);
              id v82 = *(id *)(v49 + 40);
              _addResultToArrayCreatingArrayIfNecessary(&v82, v34);
              objc_storeStrong((id *)(v49 + 40), v82);
            }
          }
          else
          {
            uint64_t v46 = FBSLogApplicationLibrary();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19C680000, v46, OS_LOG_TYPE_DEFAULT, "Found a placeholder with updated identity, but proxy is not a placeholder. Ignoring.", buf, 2u);
            }
          }
        }
      }
      uint64_t v28 = [v74 countByEnumeratingWithState:&v84 objects:v103 count:16];
    }
    while (v28);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v50 = v3;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v78 objects:v102 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v79;
    do
    {
      for (uint64_t n = 0; n != v52; ++n)
      {
        if (*(void *)v79 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = *(void **)(*((void *)&v78 + 1) + 8 * n);
        uint64_t v56 = FBSLogApplicationLibrary();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          id v57 = [v55 fbs_shortDescription];
          *(_DWORD *)buf = 138412290;
          v105 = v57;
          _os_log_impl(&dword_19C680000, v56, OS_LOG_TYPE_DEFAULT, "Added identity: %@", buf, 0xCu);
        }
        uint64_t v58 = [v50 objectForKey:v55];
        uint64_t v59 = -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(v5 + 32), v55, v58);
        if (v59)
        {
          uint64_t v60 = *(void *)(*(void *)(v5 + 72) + 8);
          id v77 = *(id *)(v60 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v77, v59);
          objc_storeStrong((id *)(v60 + 40), v77);
        }
        id v61 = -[FBSApplicationLibrary _workQueue_addPlaceholderWithIdentity:forProxy:](*(id **)(v5 + 32), v55, v58);
        if (v61)
        {
          uint64_t v62 = *(void *)(*(void *)(v5 + 80) + 8);
          id v76 = *(id *)(v62 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v76, v61);
          objc_storeStrong((id *)(v62 + 40), v76);
        }
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v78 objects:v102 count:16];
    }
    while (v52);
  }

  uint64_t v63 = *(void *)(v5 + 32);
  long long v64 = *(void **)(*(void *)(*(void *)(v5 + 72) + 8) + 40);
  long long v65 = *(void **)(*(void *)(*(void *)(v5 + 56) + 8) + 40);
  uint64_t v66 = *(void *)(*(void *)(v5 + 64) + 8);
  id v75 = *(id *)(v66 + 40);
  -[FBSApplicationLibrary _fixupAdded:removed:replaced:](v63, v64, v65, &v75);
  objc_storeStrong((id *)(v66 + 40), v75);
}

void __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke_237(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 88);
    if (v2)
    {
      *(void *)(v1 + 88) = v2 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](v1);
    }
  }
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v17 = "-[FBSApplicationLibrary applicationStateDidChange:]";
          __int16 v18 = 2114;
          uint64_t v19 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }
  -[FBSApplicationLibrary _handleApplicationStateDidChange:notifyForUpdateInsteadOfReplacement:]((uint64_t)self, v3, 0);
}

- (void)networkUsageChanged:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__FBSApplicationLibrary_networkUsageChanged___block_invoke;
  v4[3] = &unk_1E58F6E70;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

void __45__FBSApplicationLibrary_networkUsageChanged___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = *(unsigned char *)(a1 + 40);
  -[FBSApplicationLibrary _notifyDidChangeNetworkUsage:](*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 48));
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v17 = "-[FBSApplicationLibrary deviceManagementPolicyDidChange:]";
          __int16 v18 = 2114;
          uint64_t v19 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }
  -[FBSApplicationLibrary _handleApplicationStateDidChange:notifyForUpdateInsteadOfReplacement:]((uint64_t)self, v3, 1);
}

- (void)applicationsDidChangePersonas:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v17 = "-[FBSApplicationLibrary applicationsDidChangePersonas:]";
          __int16 v18 = 2114;
          uint64_t v19 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }
  -[FBSApplicationLibrary _handleApplicationStateDidChange:notifyForUpdateInsteadOfReplacement:]((uint64_t)self, v3, 0);
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = [v10 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "-[FBSApplicationLibrary applicationInstallsArePrioritized:arePaused:]";
          __int16 v34 = 2114;
          id v35 = v12;
          _os_log_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@ (prioritized)", buf, 0x16u);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v7);
  }
  uint64_t v22 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v21;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v19 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v18 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "-[FBSApplicationLibrary applicationInstallsArePrioritized:arePaused:]";
          __int16 v34 = 2114;
          id v35 = v20;
          _os_log_impl(&dword_19C680000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@ (paused)", buf, 0x16u);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }
}

- (void)applicationInstallsDidPause:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v16 = "-[FBSApplicationLibrary applicationInstallsDidPause:]";
          __int16 v17 = 2114;
          __int16 v18 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)applicationInstallsDidResume:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v16 = "-[FBSApplicationLibrary applicationInstallsDidResume:]";
          __int16 v17 = 2114;
          __int16 v18 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v16 = "-[FBSApplicationLibrary applicationInstallsDidCancel:]";
          __int16 v17 = 2114;
          __int16 v18 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v16 = "-[FBSApplicationLibrary applicationInstallsDidPrioritize:]";
          __int16 v17 = 2114;
          __int16 v18 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)applicationsWillInstall:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          id v21 = "-[FBSApplicationLibrary applicationsWillInstall:]";
          __int16 v22 = 2114;
          long long v23 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FBSApplicationLibrary_applicationsWillInstall___block_invoke;
  block[3] = &unk_1E58F4AB0;
  void block[4] = self;
  id v15 = v3;
  id v12 = v3;
  dispatch_sync(workQueue, block);
}

void __49__FBSApplicationLibrary_applicationsWillInstall___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  id v3 = FBSLogApplicationLibrary();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v4;
    __int16 v17 = 2114;
    long long v18 = v2;
    _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_INFO, "Applications will install: %{public}@ (appInfos: %{public}@)", buf, 0x16u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _setInstalling:1 v10];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)applicationsDidFailToInstall:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          id v21 = "-[FBSApplicationLibrary applicationsDidFailToInstall:]";
          __int16 v22 = 2114;
          long long v23 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke;
  block[3] = &unk_1E58F4AB0;
  void block[4] = self;
  id v15 = v3;
  id v12 = v3;
  dispatch_sync(workQueue, block);
}

void __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (uint64_t *)(a1 + 40);
  uint64_t v2 = -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  id v3 = FBSLogApplicationLibrary();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke_cold_1(v1, (uint64_t)v2, v3);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _setInstalling:0 v9];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          id v21 = "-[FBSApplicationLibrary applicationsWillUninstall:]";
          __int16 v22 = 2114;
          long long v23 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FBSApplicationLibrary_applicationsWillUninstall___block_invoke;
  block[3] = &unk_1E58F4AB0;
  void block[4] = self;
  id v15 = v3;
  id v12 = v3;
  dispatch_sync(workQueue, block);
}

void __51__FBSApplicationLibrary_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) _setUninstalling:1];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v9 = FBSLogApplicationLibraryObserver();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v10 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          id v21 = "-[FBSApplicationLibrary applicationsDidFailToUninstall:]";
          __int16 v22 = 2114;
          long long v23 = v10;
          _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__FBSApplicationLibrary_applicationsDidFailToUninstall___block_invoke;
  block[3] = &unk_1E58F4AB0;
  void block[4] = self;
  id v15 = v3;
  id v12 = v3;
  dispatch_sync(workQueue, block);
}

void __56__FBSApplicationLibrary_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) _setUninstalling:0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    self->_lock_invalidated = 1;
    uint64_t v4 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      long long v8 = self;
      _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary<%p> invalidated", (uint8_t *)&v7, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MISProvisioningProfileInstalled", 0);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MISProvisioningProfileRemoved", 0);
    long long v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self];

    [(LSApplicationWorkspace *)self->_applicationWorkspace removeObserver:self];
    [(BSInvalidatable *)self->_stateCaptureAssertion invalidate];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_pendingSynchronizationExecutionBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue_injectedAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_workQueue_placeholdersByIdentity, 0);
  objc_storeStrong((id *)&self->_workQueue_installedApplicationsByIdentity, 0);
  objc_storeStrong((id *)&self->_workQueue_identitiesByBundleID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue_tokensToBlocks, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_initWithApplicationWorkspace:(const char *)a1 configuration:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithApplicationWorkspace:(const char *)a1 configuration:.cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithApplicationWorkspace:configuration:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithApplicationWorkspace:configuration:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workQueue_applicationForIdentity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)installedApplicationWithBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)installedApplicationWithBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)installedApplicationWithBundleIdentifier:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)placeholderWithBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_workQueue_placeholderForIdentity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)uninstallApplication:withOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_1(&dword_19C680000, v0, v1, "Cannot uninstall %@ since no application was found.", v2, v3, v4, v5, v6);
}

- (void)uninstallApplication:(uint64_t)a3 withOptions:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_19();
  uint64_t v1 = NSStringFromSelector(*(SEL *)(v0 + 72));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)addApplicationProxy:withOverrideURL:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addApplicationProxy:withOverrideURL:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workQueue_currentProcessProxyWithOutURL:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_1(&dword_19C680000, v0, v1, "Application proxy by bundleURL is invalid for current process: %@", v2, v3, v4, v5, v6);
}

- (void)_identitiesForProxy:outRecord:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workQueue_addApplication:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workQueue_addApplication:.cold.2()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_1(&dword_19C680000, v0, v1, "existing app for %{public}@", v2, v3, v4, v5, v6);
}

- (void)_workQueue_addPlaceholder:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workQueue_addPlaceholder:.cold.2()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_1(&dword_19C680000, v0, v1, "existing placeholder for %{public}@", v2, v3, v4, v5, v6);
}

- (void)applicationsDidInstall:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applicationsDidInstall:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 fbs_shortDescription];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_19C680000, a4, OS_LOG_TYPE_ERROR, "Abandoned identity: %{public}@", a1, 0xCu);
}

void __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C680000, log, OS_LOG_TYPE_ERROR, "Applications did fail to install: %{public}@ (appInfos: %{public}@)", (uint8_t *)&v4, 0x16u);
}

@end