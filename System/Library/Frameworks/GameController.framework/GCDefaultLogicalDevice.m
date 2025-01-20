@interface GCDefaultLogicalDevice
@end

@implementation GCDefaultLogicalDevice

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_178(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_181(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 7, a2);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(v6[9], "objectEnumerator", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setStatuses:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_209(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_211(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 18, a2);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(v6[19], "objectEnumerator", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setBattery:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_220(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = GCGameIntentBlocklist();
    v5 = +[GCApplicationStateMonitor sharedInstance];
    v6 = [v5 frontmostApplicationIdentifier];
    int v7 = [v4 containsObject:v6];

    int isInternalBuild = gc_isInternalBuild();
    if (!v7)
    {
      if (isInternalBuild)
      {
        v17 = getGCLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134217984;
          uint64_t v20 = a2;
          _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "Received intent: %ld", (uint8_t *)&v19, 0xCu);
        }
      }
      if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (gc_isInternalBuild())
        {
          v18 = getGCLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_DEFAULT, "Opening game center overlay", (uint8_t *)&v19, 2u);
          }
        }
        id GKDaemonProxyClass = getGKDaemonProxyClass();
        uint64_t v11 = [getGKLocalPlayerClass() local];
        uint64_t v9 = [GKDaemonProxyClass proxyForPlayer:v11];

        long long v12 = [getGKGameClass() currentGame];
        long long v13 = [v12 internal];

        uint64_t v14 = getpid();
        long long v15 = getGKDashboardLaunchContextGameController();
        v16 = [v9 utilityService];
        [v16 openDashboardAsRemoteAlertForGame:v13 hostPID:v14 deeplink:0 launchContext:v15];
      }
      else
      {
        uint64_t v9 = +[GCGameIntentManager instance];
        [v9 toggleGamesFolder];
      }
      goto LABEL_11;
    }
    if (isInternalBuild)
    {
      uint64_t v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Blocklisted application foregrounded, ignoring game intent", (uint8_t *)&v19, 2u);
      }
LABEL_11:
    }
  }
}

void __38___GCDefaultLogicalDevice__addClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeClient:v2];
}

@end