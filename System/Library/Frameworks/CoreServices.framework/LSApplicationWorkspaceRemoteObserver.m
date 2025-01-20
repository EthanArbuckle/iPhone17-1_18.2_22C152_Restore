@interface LSApplicationWorkspaceRemoteObserver
+ (BOOL)supportsSecureCoding;
- (BOOL)isObservinglsd;
- (BOOL)messageObserversWithSelector:(SEL)a3;
- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4;
- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4 filterLaunchProhibited:(BOOL)a5;
- (LSApplicationWorkspaceRemoteObserver)init;
- (LSApplicationWorkspaceRemoteObserver)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (id)localObservers;
- (unint64_t)currentObserverCount;
- (void)addLocalObserver:(id)a3;
- (void)applicationIconDidChange:(id)a3;
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
- (void)databaseWasRebuilt;
- (void)deviceManagementPolicyDidChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)networkUsageChanged:(BOOL)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsDidUninstall:(id)a3;
- (void)pluginsWillUninstall:(id)a3;
- (void)removeLocalObserver:(id)a3;
- (void)setObservinglsd:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation LSApplicationWorkspaceRemoteObserver

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _LSInstallLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:]();
  }

  v9 = _LSInstallLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:]();
  }

  v10 = _LSInstallLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:]();
  }

  v46 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v11 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v46 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v13);
  }

  if ([v46 count])
  {
    v45 = v7;
    v17 = objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v44 = v6;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v56 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v55 + 1) + 8 * j);
          v24 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v23, v44);
          v25 = [v24 appState];
          char v26 = [v25 isValid];

          if (v26)
          {
            [v17 addObject:v24];
          }
          else
          {
            v27 = _LSInstallLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v66 = v23;
              __int16 v67 = 2112;
              v68 = v24;
              _os_log_error_impl(&dword_182959000, v27, OS_LOG_TYPE_ERROR, "Couldn't instantiate valid proxy for %@ when processing active installs, got %@", buf, 0x16u);
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }
      while (v20);
    }

    v28 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v29 = v45;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v51 + 1) + 8 * k);
          v35 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v34, v44);
          v36 = [v35 appState];
          char v37 = [v36 isValid];

          if (v37)
          {
            [v28 addObject:v35];
          }
          else
          {
            v38 = _LSInstallLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v66 = v34;
              __int16 v67 = 2112;
              v68 = v35;
              _os_log_error_impl(&dword_182959000, v38, OS_LOG_TYPE_ERROR, "Couldn't instantiate valid proxy for %@ when processing active installs, got %@", buf, 0x16u);
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v31);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v39 = v46;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v47 objects:v63 count:16];
    id v6 = v44;
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v48;
      do
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          if (*(void *)v48 != v42) {
            objc_enumerationMutation(v39);
          }
          objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * m), "applicationInstallsArePrioritized:arePaused:", v17, v28, v44);
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v41);
    }

    id v7 = v45;
  }
}

- (void)setObservinglsd:(BOOL)a3
{
  self->_observinglsd = a3;
}

- (BOOL)isObservinglsd
{
  return self->_observinglsd;
}

- (void)addLocalObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v5) {
    [(NSHashTable *)v4->_observers addObject:v5];
  }
  objc_sync_exit(v4);
}

- (unint64_t)currentObserverCount
{
  v2 = self;
  objc_sync_enter(v2);
  observers = v2->_observers;
  if (observers) {
    unint64_t v4 = [(NSHashTable *)observers count];
  }
  else {
    unint64_t v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)localObservers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSHashTable *)v2->_observers allObjects];
  unint64_t v4 = (void *)[v3 copy];

  objc_sync_exit(v2);

  return v4;
}

- (LSApplicationWorkspaceRemoteObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)LSApplicationWorkspaceRemoteObserver;
  v2 = [(LSApplicationWorkspaceRemoteObserver *)&v12 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

    v2->_observinglsd = 0;
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v9 = dispatch_queue_create("LSApplicationWorkspaceRemoteObserver.progress.subscriptions", v8);
    progressSubscriptionsQueue = v2->_progressSubscriptionsQueue;
    v2->_progressSubscriptionsQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LSApplicationWorkspaceRemoteObserver *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (LSApplicationWorkspaceRemoteObserver)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSApplicationWorkspaceRemoteObserver;
  id v5 = [(LSApplicationWorkspaceRemoteObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"uuid");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }
  return v5;
}

- (void)removeLocalObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5) {
    [(NSHashTable *)v4->_observers removeObject:v5];
  }
  objc_sync_exit(v4);
}

- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4 filterLaunchProhibited:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v23 = v8;
  if (a5)
  {
    id v9 = [MEMORY[0x1E4F1C978] arrayByFilteringLaunchProhibitedAppsFrom:v8];
  }
  else
  {
    id v9 = v8;
  }
  v10 = v9;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v17 valueForKey:@"observeLaunchProhibitedApps"],
                uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                char v20 = [v19 BOOLValue],
                v19,
                id v18 = v23,
                (v20 & 1) != 0)
            || (v21 = objc_msgSend(v10, "count", v18), id v18 = v10, v21))
          {
            objc_msgSend(v17, a3, v18);
          }
          char v14 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4
{
  return [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:a3 andApps:a4 filterLaunchProhibited:1];
}

- (BOOL)messageObserversWithSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v10 a3];
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidStart", v6);
}

void __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: InstallsStarted %@", buf, 0xCu);
  }

  _LSContextInvalidate();
  if ([*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationInstallsDidStart_ andApps:*(void *)(a1 + 32)])
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke_744;
    block[3] = &unk_1E522C268;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = filterProxiesForHelperPlaceholders(*(void **)(a1 + 32));
  [v5 messageObserversWithSelector:sel_helperPlaceholdersInstalled_ andApps:v6 filterLaunchProhibited:0];
}

void __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke_744(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5), "installProgress", (void)v6);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidUpdateIcon___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  long long v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidUpdateIcon", v6);
}

uint64_t __73__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidUpdateIcon___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: IconsUpdated %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationInstallsDidUpdateIcon_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  long long v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidChange", v6);
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v14 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * v8) placeholder:1];
        uint64_t v10 = v9;
        if (v9)
        {
          uint64_t v11 = [v9 appState];
          if ([v11 isValid])
          {
            long long v12 = [v10 appState];
            int v13 = [v12 isPlaceholder];

            if (v13) {
              [v3 addObject:v10];
            }
          }
          else
          {
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  _LSContextInvalidate();
  if ([v3 count]) {
    [*(id *)(v14 + 40) messageObserversWithSelector:sel_applicationInstallsDidChange_ andApps:v3];
  }
}

- (void)applicationsWillInstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__LSApplicationWorkspaceRemoteObserver_applicationsWillInstall___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsWillInstall", v6);
}

uint64_t __64__LSApplicationWorkspaceRemoteObserver_applicationsWillInstall___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Will install %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsWillInstall_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "Received applicationsDidInstall:%@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__LSApplicationWorkspaceRemoteObserver_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E522BBD8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidInstall", v7);
}

void __63__LSApplicationWorkspaceRemoteObserver_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  _LSContextInvalidate();
  uint64_t v2 = +[LSApplicationWorkspace defaultWorkspace];
  id v45 = 0;
  id v46 = 0;
  [v2 getKnowledgeUUID:&v46 andSequenceNumber:&v45];
  id v3 = v46;
  id v4 = v45;

  id v5 = [NSString stringWithFormat:@"LaunchServices observer: Installed %@ {%@ %@}", *(void *)(a1 + 32), v3, v4];
  char v37 = v4;
  v38 = v3;
  if (_LSLoggingQueue_onceToken != -1) {
    dispatch_once(&_LSLoggingQueue_onceToken, &__block_literal_global_1131);
  }
  id v6 = _LSLoggingQueue_logQueue;
  *(void *)&blocuint64_t k = MEMORY[0x1E4F143A8];
  *((void *)&block + 1) = 3221225472;
  long long v49 = ___LSSetCrashMessage_block_invoke;
  long long v50 = &unk_1E522C268;
  id v51 = v5;
  id v7 = v5;
  dispatch_sync(v6, &block);

  v36 = v7;
  uint64_t v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v39 = a1;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        uint64_t v14 = [v13 bundleIdentifier];

        if (v14)
        {
          long long v15 = [v13 bundleIdentifier];
          long long v16 = +[LSApplicationProxy applicationProxyForIdentifier:v15 placeholder:0];

          if (v16)
          {
            long long v17 = [v16 appState];
            if ([v17 isInstalled])
            {
              long long v18 = [v16 bundleURL];
              uint64_t v19 = [v18 path];

              if (v19)
              {
                id v20 = [v16 bundleURL];
                uint64_t v21 = (const char *)[v20 fileSystemRepresentation];

                if (v21 && access(v21, 0) && *__error() == 2)
                {
                  v22 = _LSDefaultLog();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(block) = 138412290;
                    *(void *)((char *)&block + 4) = v16;
                    _os_log_error_impl(&dword_182959000, v22, OS_LOG_TYPE_ERROR, "App validation Failed: bundle path does not exist %@", (uint8_t *)&block, 0xCu);
                  }

                  uint64_t v23 = [v16 bundleIdentifier];
                  _LSLogStepAsync(8, 0, v23, @"App validation failed, ignoring didInstall notification for %@", v24, v25, v26, v27, (uint64_t)v16);
                }
                else
                {
                  uint64_t v29 = [v13 bundleIdentifier];
                  _LSLogStepAsync(8, 1, v29, @"applicationsDidInstall %@", v30, v31, v32, v33, (uint64_t)v16);

                  [v40 addObject:v16];
                }
                goto LABEL_24;
              }
            }
            else
            {
            }
          }
          v28 = _LSDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(void *)((char *)&block + 4) = v16;
            _os_log_error_impl(&dword_182959000, v28, OS_LOG_TYPE_ERROR, "LSApplicationProxy %@ is invalid", (uint8_t *)&block, 0xCu);
          }
        }
        else
        {
          long long v16 = _LSDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(void *)((char *)&block + 4) = v13;
            _os_log_error_impl(&dword_182959000, v16, OS_LOG_TYPE_ERROR, "LSApplicationProxy %@ is invalid (has nil identifier)", (uint8_t *)&block, 0xCu);
          }
        }
LABEL_24:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v34 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      uint64_t v10 = v34;
    }
    while (v34);
  }

  [*(id *)(v39 + 40) messageObserversWithSelector:sel_applicationsDidInstall_ andApps:v40];
  dispatch_time_t v35 = dispatch_time(0, 2000000000);
  if (_LSLoggingQueue_onceToken != -1) {
    dispatch_once(&_LSLoggingQueue_onceToken, &__block_literal_global_1131);
  }
  dispatch_after(v35, (dispatch_queue_t)_LSLoggingQueue_logQueue, &__block_literal_global_1142);
}

- (void)pluginsDidInstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Installed plugins %@", buf, 0xCu);
  }

  _LSContextInvalidate();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 pluginsDidInstall:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidFailToInstall", v6);
}

uint64_t __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke_cold_1();
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidFailToInstall_ andApps:*(void *)(a1 + 32)];
}

- (void)pluginsWillUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Plugins will be removed: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 pluginsWillUninstall:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__LSApplicationWorkspaceRemoteObserver_applicationsWillUninstall___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsWillUninstall", v6);
}

uint64_t __66__LSApplicationWorkspaceRemoteObserver_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Will uninstall %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsWillUninstall_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__LSApplicationWorkspaceRemoteObserver_applicationsDidUninstall___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidUninstall", v6);
}

void __65__LSApplicationWorkspaceRemoteObserver_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Uninstalled %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidUninstall_ andApps:*(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);
  id v5 = filterProxiesForHelperPlaceholders(*(void **)(a1 + 32));
  [v4 messageObserversWithSelector:sel_helperPlaceholdersUninstalled_ andApps:v5 filterLaunchProhibited:0];
}

- (void)pluginsDidUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Uninstalled plugins %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v6 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 pluginsDidUninstall:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidFailToUninstall", v6);
}

uint64_t __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidFailToUninstall_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationInstallsDidPause:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: PAUSE %@", (uint8_t *)&v6, 0xCu);
  }

  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_applicationInstallsDidPause_ andApps:v4];
}

- (void)applicationInstallsDidResume:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: RESUME %@", (uint8_t *)&v6, 0xCu);
  }

  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_applicationInstallsDidResume_ andApps:v4];
}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: CANCEL %@", (uint8_t *)&v6, 0xCu);
  }

  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_applicationInstallsDidCancel_ andApps:v4];
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: PRIORITIZE %@", (uint8_t *)&v6, 0xCu);
  }

  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_applicationInstallsDidPrioritize_ andApps:v4];
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: StateChange %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_applicationStateDidChange_ andApps:v4];
}

- (void)applicationIconDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: IconChange %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_applicationIconDidChange_ andApps:v4];
}

- (void)networkUsageChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"NO";
    if (v3) {
      int v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: NetworkUsageChanged using network: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(LSApplicationWorkspaceRemoteObserver *)self localObservers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 networkUsageChanged:v3];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: deviceManagementPolicyDidChange %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  [(LSApplicationWorkspaceRemoteObserver *)self messageObserversWithSelector:sel_deviceManagementPolicyDidChange_ andApps:v4];
}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__LSApplicationWorkspaceRemoteObserver_applicationsDidChangePersonas___block_invoke;
  v6[3] = &unk_1E522BBD8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidChangePersonas", v6);
}

uint64_t __70__LSApplicationWorkspaceRemoteObserver_applicationsDidChangePersonas___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: applicationsDidChangePersonas %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidChangePersonas_ andApps:*(void *)(a1 + 32)];
}

- (void)databaseWasRebuilt
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__LSApplicationWorkspaceRemoteObserver_databaseWasRebuilt__block_invoke;
  v2[3] = &unk_1E522C268;
  v2[4] = self;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.databaserebuilt", v2);
}

uint64_t __58__LSApplicationWorkspaceRemoteObserver_databaseWasRebuilt__block_invoke(uint64_t a1)
{
  uint64_t v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: databaseWasRebuilt", v4, 2u);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 32) messageObserversWithSelector:sel_databaseWasRebuilt];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSubscriptionsQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LaunchServices: observer: installProgress changed %@", v2, v3, v4, v5, v6);
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "LaunchServices observer: Apps Failed be installed: %@", v2, v3, v4, v5, v6);
}

void __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "LaunchServices observer: Apps Failed be Uninstalled: %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LaunchServices observer: Paused apps: %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LaunchServices observer: Prioritized apps: %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_182959000, v0, OS_LOG_TYPE_DEBUG, "LaunchServices observer: Catchup Callback", v1, 2u);
}

@end